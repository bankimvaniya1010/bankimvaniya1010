using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyemployment : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    public string lblfirstname = string.Empty;
    Logger objLog = new Logger();
    Common objCom = new Common();
    string verificationKey = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        verificationKey = Request.QueryString["key"];
        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null)
            {   
                applicantemployerdetails details = db.applicantemployerdetails.Where(obj => obj.employerverificationkey == verificationKey).FirstOrDefault();

                if (details != null)
                {
                    //info

                    var applicantdetails = db.applicantdetails.Where(x => x.applicantid == details.applicantid && x.universityid == details.universityid).Select(x => new { x.firstname, x.totalyearofexperience }).FirstOrDefault();
                    if (applicantdetails.firstname != null && applicantdetails.totalyearofexperience != null)
                    {

                        lblfirstname = applicantdetails.firstname;
                        lblyearsofworkexper.InnerText = applicantdetails.totalyearofexperience;
                    }
                    lblnameoforganisation.InnerText = details.organization;
                    lblreportingmanager.InnerText = details.nameofreportingmanger;
                    lblposition.InnerText = details.designation;
                    lbllocation.InnerText = objCom.GetCountryDiscription(Convert.ToInt32(details.country));
                    if(details.durationfrom != null)
                        lblstartdate.InnerText = Convert.ToDateTime(details.durationfrom).ToString("dd/MM/yyyy");
                    if (details.durationto != null)
                        lblEndDate.InnerText = Convert.ToDateTime(details.durationto).ToString("dd/MM/yyyy");
                    else
                    {
                        if(details.iscurrentworking != null)
                            lblEndDate.InnerText = "Currently Working";
                    }
                    lbljobdescription.InnerText = details.briefdescription;

                    if (details.isemployerdetailverified.HasValue && details.isemployerdetailverified.Value)
                    {
                        alreadyVerified();
                    }
                    else
                    {
                        questionDIv.Visible = true;
                    }
                }
                else
                    notFound();
            }
            else
                notFound();
        }
    }

    private void afterVerification()
    {
        detailsNotFound.Visible = false;
        verified.Visible = false;
        afterVerfication.Visible = true;
        questionDIv.Visible = false;
    }

    private void alreadyVerified()
    {
        detailsNotFound.Visible = false;
        afterVerfication.Visible = false;
        verified.Visible = true;
        questionDIv.Visible = false;
    }

    private void notFound()
    {
        detailsNotFound.Visible = true;
        afterVerfication.Visible = false;
        verified.Visible = false;
        questionDIv.Visible = false;
    }
       
    protected void btn_Save_Click1(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var details = db.applicantemployerdetails.Where(obj => obj.employerverificationkey == verificationKey).FirstOrDefault();
            applicantemployerdetails objapplicantemployerdetails = new applicantemployerdetails();
            if (details != null)
            {
                mode = "update";
                objapplicantemployerdetails = details;
            }             
            if (details != null)
            {
                objapplicantemployerdetails.isemployerdetailverified = true;
                objapplicantemployerdetails.verifyrecord_refereeresponse = txtQuestion1.Value;
                objapplicantemployerdetails.howlongyouknow_refereeresponse = txtQuestion2.Value;
                objapplicantemployerdetails.opinionforstudycourse_refereeresponse = txtQuestion3.Value;
                objapplicantemployerdetails.biggeststrenthknown_refereeresponse = txtQuestion4.Value;
                objapplicantemployerdetails.getalongwithmanagement_refereeresponse = txtQuestion5.Value;
                objapplicantemployerdetails.wouldyourehire_refereeresponse = txtQuestion6.Value;
                if (mode == "new")
                    db.applicantemployerdetails.Add(objapplicantemployerdetails);
                db.SaveChanges();
                afterVerification();
            }
            else
                notFound();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}