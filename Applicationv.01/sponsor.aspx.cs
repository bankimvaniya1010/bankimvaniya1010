using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class sponsor : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string NameOFSponsor = "NAME OF SPONSOR";
    protected string Relationship = "RELATIONSHIP";
    protected string Designation = "DESIGNATION";
    protected string EmployersDetail = "EMPLOYERS DETAILS";
    protected string AnnualIncome = "ANNUAL INCOME";
    protected string ITR = "LAST 3 YEARS ITR’S AVAILABLE";
    protected string DurationFrom = "DURATION FROM";
    protected string DurationTo = "DURATION TO";
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
            BindSponsersDetails(ApplicantID);
        }
    }
    private void BindSponsersDetails(int ApplicantID)
    {
        var fncsponsers = (from eInfo in db.sponsor_details
                           where eInfo.applicantID == ApplicantID
                           select eInfo).ToList();
        grdSponsers.DataSource = fncsponsers;
        grdSponsers.DataBind();
    }
    protected void btnSponsers_Click(object sender, EventArgs e)
    {
        string durationFrom = "", durationto = "";
        durationFrom = txtSponsersFrom.Value;
        durationto = txtSponsersTo.Value;
        sponsor_details objSponsor = new sponsor_details();
        objSponsor.annualincome = Convert.ToDecimal(txtAnnual.Value);
        objSponsor.applicantID = ApplicantID;
        objSponsor.designation = txtSponsarDesignation.Value;
        objSponsor.durationfrom = Convert.ToDateTime(durationFrom);
        objSponsor.durationto = Convert.ToDateTime(durationto);
        objSponsor.employment_details = txtEmployers.Value;
        if (rdITRNo.Checked)
            objSponsor.isfiledItr = 1;
        else
            objSponsor.isfiledItr = 0;
        objSponsor.name = txtSponsor.Value;
        objSponsor.relationship = txtRelationship.Value;
        db.sponsor_details.Add(objSponsor);
        db.SaveChanges();
        BindSponsersDetails(ApplicantID);
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
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 6)

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

                    case "NAME OF SPONSOR":
                        NameOFSponsor = SecondaryField[k].secondaryfielddnamevalue == "" ? NameOFSponsor : NameOFSponsor + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "RELATIONSHIP":
                        Relationship = SecondaryField[k].secondaryfielddnamevalue == "" ? Relationship : Relationship + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DESIGNATION":
                        Designation = SecondaryField[k].secondaryfielddnamevalue == "" ? Designation : Designation + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EMPLOYERS DETAILS":
                        EmployersDetail = SecondaryField[k].secondaryfielddnamevalue == "" ? EmployersDetail : EmployersDetail + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ANNUAL INCOME":
                        AnnualIncome = SecondaryField[k].secondaryfielddnamevalue == "" ? AnnualIncome : AnnualIncome + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "LAST 3 YEARS ITR’S AVAILABLE":
                        ITR = SecondaryField[k].secondaryfielddnamevalue == "" ? ITR : ITR + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DURATION FROM":
                        DurationFrom = SecondaryField[k].secondaryfielddnamevalue == "" ? DurationFrom : DurationFrom + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DURATION TO":
                        DurationTo = SecondaryField[k].secondaryfielddnamevalue == "" ? DurationTo : DurationTo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                 
                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }
}
