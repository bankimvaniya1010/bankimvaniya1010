using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class backlog : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string GapStartFrom = "GAP START FROM";
    protected string GapEndTo = "GAP END TO";
    protected string Expalnantion = "EXPLANATION";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        if (!IsPostBack)
        {
            GetSecondaryFieldname();
            BindGapDetails(ApplicantID);

        }
    }
    private void BindGapDetails(int ApplicantID)
    {
        var GapDetails = (from gInfo in db.applicant_gapsdetails
                          where gInfo.applicantId == ApplicantID
                          select gInfo).ToList();
        grdGaps.DataSource = GapDetails;
        grdGaps.DataBind();
    }
    protected void btnGapDetails_Click(object sender, EventArgs e)
    {
        string gapFrom, gapTo = "";
        gapFrom = txtGapFrom.Value;
        gapTo = txtGapEnd.Value;

        applicant_gapsdetails objGap = new applicant_gapsdetails();
        objGap.applicantId = ApplicantID;
        objGap.gap_from = Convert.ToDateTime(gapFrom);
        objGap.gap_to = Convert.ToDateTime(gapTo);
        objGap.explanation = txtExplanation.Value;
        db.applicant_gapsdetails.Add(objGap);
        db.SaveChanges();
        BindGapDetails(ApplicantID);
    }
    private void GetSecondaryFieldname()
    {
        string SecondaryLanguage = "";
        if (Session["SecondaryLang"] == null)
        {
           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Secondary Language')", true);
           // Response.Redirect("default.aspx");
        }
        else
        {
            SecondaryLanguage = Session["SecondaryLang"].ToString();
            var SecondaryField = (from am in db.applicantformmaster
                                  join pm in db.primaryfieldmaster on am.primaryfieldid equals pm.primaryfieldid
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 4)

                                  select new
                                  {
                                      id = am.id,
                                      fieldnameinstructions = am.fieldnameinstructions,
                                      secondaryfieldnameinstructions = am.secondaryfieldnameinstructions,
                                      primaryfieldname = pm.primaryfiledname,
                                      secondaryfieldnamelanguage = am.secondaryfieldnamelanguage,
                                      secondaryfielddnamevalue = am.secondaryfielddnamevalue

                                  }).ToList();
            // var    am =  db.applicantformmaster.Where(x => x.secondaryfieldnamelanguage == SecondaryLanguage && x.formname == 1).ToList();
            for (int k = 0; k < SecondaryField.Count; k++)
            {

                switch (SecondaryField[k].primaryfieldname.ToString())
                {
                   
                    
                    case "GAP START FROM":
                        GapStartFrom = SecondaryField[k].secondaryfielddnamevalue == "" ? GapStartFrom : GapStartFrom + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "GAP END TO":
                        GapEndTo = SecondaryField[k].secondaryfielddnamevalue == "" ? GapEndTo : GapEndTo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EXPLANATION":
                        Expalnantion = SecondaryField[k].secondaryfielddnamevalue == "" ? Expalnantion : Expalnantion + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }
}