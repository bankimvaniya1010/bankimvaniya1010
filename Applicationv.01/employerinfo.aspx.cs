using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class employerinfo : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string Designation = "DESIGNATION";
    protected string Organisation = "ORGANISATION";
    protected string Contact = "CONTACT PERSON";
    protected string Salary = "SALARY";
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
            BindEmploymentDetails(ApplicantID);
          
        }
    }
    private void BindEmploymentDetails(int ApplicantID)
    {
        var empDetails = (from eInfo in db.applicantemployerdetails
                          where eInfo.applicantId == ApplicantID
                          select eInfo).ToList();
        grdEmployment.DataSource = empDetails;
        grdEmployment.DataBind();
    }
    protected void btnEmployment_Click(object sender, EventArgs e)
    {
        string startFrom, endTo = "";
        startFrom = txtEmploymentStart.Value;
        endTo = txtEmploymentEnd.Value;

        applicantemployerdetails objEmployment = new applicantemployerdetails();
        objEmployment.applicantId = ApplicantID;
        objEmployment.durationfrom = Convert.ToDateTime(startFrom);
        objEmployment.durationto = Convert.ToDateTime(endTo);
        objEmployment.contactpersonwithdetails = txtContactPerson.Value;
        objEmployment.designation = txtDesignation.Value;
        objEmployment.organization = txtOrganisation.Value;
        objEmployment.salary = Convert.ToInt32(txtSalary.Value);
        db.applicantemployerdetails.Add(objEmployment);
        db.SaveChanges();
        BindEmploymentDetails(ApplicantID);
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
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 5)

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
                    
   

                    case "DESIGNATION":
                        Designation = SecondaryField[k].secondaryfielddnamevalue == "" ? Designation : Designation + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ORGANISATION":
                        Organisation = SecondaryField[k].secondaryfielddnamevalue == "" ? Organisation : Organisation + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CONTACT PERSON":
                        Contact = SecondaryField[k].secondaryfielddnamevalue == "" ? Contact : Contact + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "SALARY":
                        Salary = SecondaryField[k].secondaryfielddnamevalue == "" ? Salary : Salary + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DURATION FROM":
                        DurationFrom = SecondaryField[k].secondaryfielddnamevalue == "" ? DurationFrom : DurationFrom + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
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