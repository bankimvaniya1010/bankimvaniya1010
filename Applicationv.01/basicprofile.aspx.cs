using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class basicprofile : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected string Name = "NAME";
    protected string Email = "YOUR EMAIL ADDRESS";
    protected string MobileNo = "Mobile No";
    protected string PanNo = "Pan No";
    protected string DateOFBirth = "DATE OF BIRTH";
    protected string Passport = "PASSPORT NO";
    protected string Voter = "VOTER CARD NO";
    protected string Gender = "GENDER";
    protected string AdharNo = "Adhar No";
    protected string University = "UNIVERSITY";
    protected string Course = "COURSE APPLIED FOR";
    protected string Intake = "INTAKE FOR WHICH APPLIED";
    protected string EmailInstructions = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        if (!IsPostBack)
        {
            var appmaster = db.Applicant_master.Where(x => x.applicantID == ApplicantID).FirstOrDefault();
            int universityID = 1;
            if (appmaster != null)
                universityID = Convert.ToInt32(appmaster.universityid);
            PopulatePersonal(ApplicantID);
            GetSecondaryFieldname();
            HandleNavigation(universityID);
        }
    }
    private void PopulatePersonal(int userID)
    {
        var profileInfo = (from pInfo in db.Applicant_master
                           where pInfo.applicantID == ApplicantID
                           select pInfo).FirstOrDefault();
        txtName.Value = profileInfo.name;
        txtAdhar.Value = profileInfo.adhar_no;
        txtCourse.Value = profileInfo.course_applied;
        dob.Value = Convert.ToDateTime(profileInfo.dob).ToString("yyyy-MM-dd");
        txtEmail.Value = profileInfo.email;
        if (profileInfo.gender == 1)
            rbtnMale.Checked = true;
        else
            rbtnFemale.Checked = true;
        txtIntake.Value = profileInfo.intakeforwhichapplied;
        txtMobile.Value = profileInfo.mobile_no;
        txtPanNo.Value = profileInfo.pan_no;
        txtPaasportno.Value = profileInfo.passport_no;
        //  txtUniversity.Text = profileInfo.universityid;
        txtUniversity.Value = profileInfo.university_applied;
        txtVoter.Value = profileInfo.votercard_no;

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Applicant_master objProfile = db.Applicant_master.Where(b => b.applicantID == ApplicantID).First();
        string DateString = dob.Value;

        // DateTime dateVal = DateTime.ParseExact(DateString, "yyyy-MM-dd", culture);
        objProfile.name = txtName.Value;
        objProfile.adhar_no = txtAdhar.Value;
        objProfile.course_applied = txtCourse.Value;
        //objProfile.dob = dob.Value;
        objProfile.dob = Convert.ToDateTime(DateString);
        objProfile.email = txtEmail.Value;
        if (rbtnFemale.Checked == true)
            objProfile.gender = 0;
        else
            objProfile.gender = 1;
        objProfile.intakeforwhichapplied = txtIntake.Value;
        objProfile.mobile_no = txtMobile.Value;
        objProfile.pan_no = txtPaasportno.Value;
        objProfile.university_applied = txtUniversity.Value;
        objProfile.votercard_no = txtVoter.Value;
        db.SaveChanges();
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
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 1)

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

                    case "NAME":
                        Name = SecondaryField[k].secondaryfielddnamevalue == "" ? Name : Name + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "YOUR EMAIL ADDRESS":
                        Email = SecondaryField[k].secondaryfielddnamevalue == "" ? Email : Email + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        EmailInstructions = SecondaryField[k].secondaryfieldnameinstructions == "" ? EmailInstructions : EmailInstructions + "( " + SecondaryField[k].secondaryfieldnameinstructions + ")";
                        break;
                    case "ADHAR NO":
                        AdharNo = SecondaryField[k].secondaryfielddnamevalue == "" ? AdharNo : AdharNo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "PAN NO":
                        PanNo = SecondaryField[k].secondaryfielddnamevalue == "" ? PanNo : PanNo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MOBILE NO":
                        MobileNo = SecondaryField[k].secondaryfielddnamevalue == "" ? MobileNo : MobileNo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";

                        break;
                    case "DATE OF BIRTH":
                        DateOFBirth = SecondaryField[k].secondaryfielddnamevalue == "" ? DateOFBirth : DateOFBirth + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "PASSPORT NO":
                        Passport = SecondaryField[k].secondaryfielddnamevalue == "" ? Passport : Passport + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "VOTER CARD NO":
                        Voter = SecondaryField[k].secondaryfielddnamevalue == "" ? Voter : Voter + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "GENDER":
                        Gender = SecondaryField[k].secondaryfielddnamevalue == "" ? Gender : Gender + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "UNIVERSITY":
                        University = SecondaryField[k].secondaryfielddnamevalue == "" ? University : University + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COURSE APPLIED FOR":
                        Course = SecondaryField[k].secondaryfielddnamevalue == "" ? Course : Course + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "INTAKE FOR WHICH APPLIED":
                        Intake = SecondaryField[k].secondaryfielddnamevalue == "" ? Intake : Intake + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }

    private void HandleNavigation(int universityID)
    {
        var navInfo = (from pInfo in db.universitywiseformmapping
                       where pInfo.universityid == universityID
                       select pInfo).ToList();
        for (int k = 0; k < navInfo.Count; k++)
        {
            string formID = navInfo[k].formid.ToString();
            switch (formID)
            {

                case "1":
                    basic.Visible = true;
                    break;
                case "2":
                    education.Visible = true;
                    break;
                case "3":
                    language.Visible = true;
                    break;
                case "4":
                    backlog.Visible = true;
                    break;
                case "5":
                    employer.Visible = true;

                    break;
                case "6":
                    sponsors.Visible = true;
                    break;
                case "7":
                    financial.Visible = true;
                    break;
                case "8":
                    self.Visible = true;
                    break;

                default:
                    //Response.Redirect(webURL + "login.aspx");
                    break;
            }
        }

    }
}