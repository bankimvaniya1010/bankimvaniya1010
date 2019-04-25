using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class selfassesment : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string Personal = "PERSONAL DETAILS";
    protected string Academic = "ACADEMIC DETAILS";
    protected string Langugae = "ENGLISH PROFICIENCY";
    protected string Age = "AGE REQUIREMENTS";
    protected string Finance = "FINANCIAL CAPACITY";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
            { GetSecondaryFieldname(); }
    }
    protected void btnSelfAssesment_Click(object sender, EventArgs e)
    {
        var profileInfo = (from pInfo in db.Applicant_master
                           where pInfo.applicantID == ApplicantID
                           select pInfo).FirstOrDefault();
        int acadmic = 0, age = 0, english = 0, Financial = 0, Personal = 0;
        if (rdAcademic1.Checked == true)
            acadmic = 1;
        else if (rdAcademic2.Checked == true)
            acadmic = 2;
        else if (rdAcademic3.Checked == true)
            acadmic = 3;
        else if (rdAcademic4.Checked == true)
            acadmic = 4;
        else
            acadmic = 5;
        if (rdAge1.Checked == true)
            age = 1;
        else if (rdAge2.Checked == true)
            age = 2;
        else if (rdAge3.Checked == true)
            age = 3;
        else if (rdAge4.Checked == true)
            age = 4;
        else
            age = 5;
        if (rdEnglish1.Checked == true)
            english = 1;
        else if (rdEnglish2.Checked == true)
            english = 2;
        else if (rdEnglish3.Checked == true)
            english = 3;
        else if (rdEnglish4.Checked == true)
            english = 4;
        else
            english = 5;
        if (rdFinancial1.Checked == true)
            Financial = 1;
        else if (rdFinancial2.Checked == true)
            Financial = 2;
        else if (rdFinancial3.Checked == true)
            Financial = 3;
        else if (rdFinancial4.Checked == true)
            Financial = 4;
        else
            Financial = 5;
        if (rdPersonal1.Checked == true)
            Personal = 1;
        else if (rdPersonal2.Checked == true)
            Personal = 2;
        else if (rdPersonal3.Checked == true)
            Personal = 3;
        else if (rdPersonal4.Checked == true)
            Personal = 4;
        else
            Personal = 5;

        profileInfo.acadmicdetails = acadmic;
        profileInfo.personaldetails = Personal;
        profileInfo.agedetails = age;
        profileInfo.financaildetails = Financial;
        profileInfo.englishprofiency = english;
        db.SaveChanges();
    }
    private void GetSecondaryFieldname()
    {
        string SecondaryLanguage = "";
        if (Session["SecondaryLang"] == null)
        {
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Secondary Language')", true);
           // Response.Redirect("default.aspx");
        }
        else
        {
            SecondaryLanguage = Session["SecondaryLang"].ToString();
            var SecondaryField = (from am in db.applicantformmaster
                                  join pm in db.primaryfieldmaster on am.primaryfieldid equals pm.primaryfieldid
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 8)

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

                    case "PERSONAL DETAILS":
                        Personal = SecondaryField[k].secondaryfielddnamevalue == "" ? Personal : Personal + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ACADEMIC DETAILS":
                        Academic = SecondaryField[k].secondaryfielddnamevalue == "" ? Academic : Academic + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ENGLISH PROFICIENCY":
                        Langugae = SecondaryField[k].secondaryfielddnamevalue == "" ? Langugae : Langugae + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "AGE REQUIREMENTS":
                        Age = SecondaryField[k].secondaryfielddnamevalue == "" ? Age : Age + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "FINANCIAL CAPACITY":
                        Finance = SecondaryField[k].secondaryfielddnamevalue == "" ? Finance : Finance + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;

                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }
}