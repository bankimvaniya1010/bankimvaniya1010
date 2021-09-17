using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_view_gteapplicantdocuments : System.Web.UI.Page
{
    int universityid = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    gte_videouploadmaster objgte_videouploadmaster = new gte_videouploadmaster();
    string webURL = String.Empty;
    public string Country_I_am_applying_to_Study;
    int applicantid = 0;
    public List<Details> documentlist = new List<Details>();
    applicantdetails details = new applicantdetails();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityid = Utility.GetUniversityId();

        if (string.IsNullOrEmpty(Request.QueryString["applicantId"]))
            Response.Redirect(webURL + "admin/default.aspx", true);
        else
            applicantid = Convert.ToInt32(Request.QueryString["applicantId"].ToString());

        details = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityid).FirstOrDefault();

        bool? is_newApplicant = objCom.GetIS_oldOrNew_applicant(applicantid);
        if (is_newApplicant == true)
        {
            first.Attributes.Add("style", "display:block;");
            setQuestion();
            populatedocument();
        }
        else {
            doclist.Attributes.Add("style", "display:block;");
            //populatecertificate(applicantid);
            poupulateUplodedDocuments(applicantid);
        }
    }

    private void setQuestion()
    {
        try
        {
            if (details != null)
            {
                if (details.Iscurrentlyworking != null && details.Isjoboffered != null)
                {
                    if (details.Iscurrentlyworking == 1 || details.Isjoboffered == 1)
                        EmploymentandValueofthecoursetomyfuture.Attributes.Add("style", "display:block");

                    if (details.Iscurrentlyworking == 1)
                        question8.Attributes.Add("style", "display:block");
                    else if (details.Iscurrentlyworking == 0)
                        question8.Attributes.Add("style", "display:none");

                    if (details.Isjoboffered == 1)
                        question9.Attributes.Add("style", "display:block");
                    else if (details.Isjoboffered == 0)
                        question9.Attributes.Add("style", "display:none");
                }
                else
                    EmploymentandValueofthecoursetomyfuture.Attributes.Add("style", "display:none");


                if (details.maritalstatus != null && (details.maritalstatus == 3 || details.maritalstatus == 2))
                {
                    PotentialSituation.Attributes.Add("style", "display:block");

                    if (details.maritalstatus == 3)
                        question13.Attributes.Add("style", "display:block");
                    else
                        question13.Attributes.Add("style", "display:none");

                    if (details.maritalstatus == 2)
                        question14.Attributes.Add("style", "display:block");
                    else
                        question14.Attributes.Add("style", "display:none");
                }
                else {
                    question13.Attributes.Add("style", "display:none");
                    question14.Attributes.Add("style", "display:none");
                }
                var clarification_response = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == applicantid && x.university_id == universityid && x.clarification_question_id == 41).Select(x => x.applicant_response).FirstOrDefault();
                if (clarification_response != null && clarification_response != "0")
                {
                    PotentialSituation.Attributes.Add("style", "display:block");
                    question15.Attributes.Add("style", "display:block");
                }
                else
                    question15.Attributes.Add("style", "display:none");
                var section3_question16 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == applicantid && x.university_id == universityid && x.question_id == 16 && x.applicant_response == false).FirstOrDefault();
                if (section3_question16 != null)
                {
                    PotentialSituation.Attributes.Add("style", "display:block");
                    question16.Attributes.Add("style", "display:block");
                }
                else
                    question16.Attributes.Add("style", "display:none");


                var section3_question14 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == applicantid && x.university_id == universityid && x.question_id == 14 && x.applicant_response == true).FirstOrDefault();
                var section3_question28 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == applicantid && x.university_id == universityid && x.question_id == 28 && x.applicant_response == false).FirstOrDefault();

                if (section3_question28 != null && section3_question14 != null)
                {
                    ImmigrationHistory.Attributes.Add("style", "display:block");
                    question17.Attributes.Add("style", "display:block");
                }
                else
                    question17.Attributes.Add("style", "display:none");

                if (section3_question28 != null)
                {
                    question18.Attributes.Add("style", "display:block");
                    ImmigrationHistory.Attributes.Add("style", "display:block");
                }
                else
                    question18.Attributes.Add("style", "display:none");
            }
            else
            {
                EmploymentandValueofthecoursetomyfuture.Attributes.Add("style", "display:none");
                PotentialSituation.Attributes.Add("style", "display:none");
                ImmigrationHistory.Attributes.Add("style", "display:none");
            }
            var IsGteCertificate = db.gte_progressbar.Where(x => x.applicantid == applicantid && x.universityId == universityid).Select(x => x.is_gte_certificate_generated).FirstOrDefault();
            if (IsGteCertificate != null && IsGteCertificate == true)
                visarequirements.Attributes.Add("style", "display:block");
            else
                visarequirements.Attributes.Add("style", "display:none");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void populatedocument()
    {
        try
        {
            
            if (details != null && details.countryofeducationInstitution != null)
                Country_I_am_applying_to_Study = objCom.GetCountryDiscription(Convert.ToInt32(details.countryofeducationInstitution));


            var docData = (from tInfo in db.gte_applicantdocument
                           where tInfo.universityid == universityid && tInfo.applicantid == applicantid
                           select tInfo).ToList();

            foreach (var item in docData)
            {
                var data = (from tInfo in db.gte_applicantdocument
                            where tInfo.universityid == universityid && tInfo.applicantid == applicantid && tInfo.documentid == item.documentid
                            select tInfo).FirstOrDefault();
                HyperLink tb = pnl.FindControl("HyperLink_question" + item.documentid) as HyperLink;
                FileUpload file = pnl.FindControl("FileUpload_question" + item.documentid) as FileUpload;
                Label lbl = pnl.FindControl("lbl_" + item.documentid) as Label;
                if (tb != null)
                {
                    //file.Attributes.Add("style", "display:none;");
                    tb.NavigateUrl = webURL + "Docs/GTEApplicantDocument/" + universityid + "/" + applicantid + "/" + data.documentpath;
                    tb.Text = "View File";
                    lbl.Text = "YES";
                    lbl.Attributes.Remove("style");
                    lbl.Attributes.Add("style","color:green;");
                }               
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void poupulateUplodedDocuments(int applicantid)
    {
        try {
            var details = db.gte_applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityid).FirstOrDefault();
            if (details != null && details.countryofeducationInstitution != null)
                Country_I_am_applying_to_Study = objCom.GetCountryDiscription(Convert.ToInt32(details.countryofeducationInstitution));


            if (objCom.GetIS_oldOrNew_applicant(applicantid) == true)
                documentlist = (from ad in db.gte_applicantdocument
                            join pfm in db.primaryfieldmaster on ad.documentid equals pfm.primaryfieldid
                            where ad.applicantid == applicantid && ad.universityid == universityid && pfm.primaryfieldid == ad.documentid
                            select new Details() {
                                documentid = ad.applicantdocumentid,
                                documentname= pfm.primaryfiledname,
                                documentpath = webURL + "Docs/GTEApplicantDocument/"+ad.universityid+"/"+applicantid+"/"+ad.documentpath,

                            }).ToList();
            else
                documentlist = (from ad in db.gte_applicantdocument
                                join pfm in db.primaryfieldmaster on ad.documentid equals pfm.primaryfieldid
                                where ad.applicantid == applicantid && ad.universityid == universityid && pfm.primaryfieldid == ad.documentid
                                select new Details()
                                {
                                    documentid = ad.applicantdocumentid,
                                    documentname = pfm.primaryfiledname,
                                    documentpath = webURL + "Docs/GTEApplicantDocument/" + ad.documentpath,

                                }).ToList();

        }
        catch (Exception ex){objLog.WriteLog(ex.StackTrace.ToString());}
    }
    public class Details
    {
        public int documentid { get; set; }
        public string documentname { get; set; }
        public string documentpath { get; set; }
        public string certificatepath { get; set; }

    }

    protected void backNavLink_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/manage_applicant.aspx?ID=" + applicantid, true);
    }
}