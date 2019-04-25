using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class basicinfo : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

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
            PopulatePersonal(ApplicantID);
            BindEducationDetails(ApplicantID);
            BindProefiencyDetails(ApplicantID);
            BindGapDetails(ApplicantID);
            BindEmploymentDetails(ApplicantID);
            BindFinancialDetails(ApplicantID);
            BindSponsersDetails(ApplicantID);
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

    protected void btnEducation_Click(object sender, EventArgs e)
    {
        string durationFrom, durationTo = "";
        durationFrom = durationfrom.Value;
        durationTo = durationto.Value;
        applicant_education objApplicant = new applicant_education();
        objApplicant.applicantID = ApplicantID;
        objApplicant.board_universityname = txtBoardUniversity.Value;
        objApplicant.courseId = Convert.ToInt32(ddlCourse.SelectedValue);
        objApplicant.course_startdate = Convert.ToDateTime(durationFrom);
        objApplicant.course_enddate = Convert.ToDateTime(durationTo);
        objApplicant.Institute = txtInstitute.Value;
        if (txtOtherCourse != null)
            objApplicant.othercourse_name = txtOtherCourse.Text;
        objApplicant.percentage = txtPercentage.Value;
        objApplicant.repeats_backlog = txtRepeats.Value;
        db.applicant_education.Add(objApplicant);
        db.SaveChanges();
        BindEducationDetails(ApplicantID);
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCourse.Text == "Others")
            txtOtherCourse.Visible = true;
        else
            txtOtherCourse.Visible = false;
    }
    private void BindGapDetails(int ApplicantID)
    {
        var GapDetails = (from gInfo in db.applicant_gapsdetails
                          where gInfo.applicantId == ApplicantID
                          select gInfo).ToList();
        grdGaps.DataSource = GapDetails;
        grdGaps.DataBind();
    }
    private void BindEducationDetails(int ApplicantID)
    {
        var CourseDetails = (from pInfo in db.applicant_education
                             where pInfo.applicantID == ApplicantID
                             select pInfo).ToList();
        grdEducation.DataSource = CourseDetails;
        grdEducation.DataBind();
    }
    private void BindProefiencyDetails(int ApplicantID)
    {
        var testDetails = (from tInfo in db.applicant_languagetest
                           where tInfo.applicantId == ApplicantID
                           select tInfo).ToList();
        grdEnglish.DataSource = testDetails;
        grdEnglish.DataBind();
    }

    private void BindEmploymentDetails(int ApplicantID)
    {
        var empDetails = (from eInfo in db.applicantemployerdetails
                          where eInfo.applicantId == ApplicantID
                          select eInfo).ToList();
        grdEmployment.DataSource = empDetails;
        grdEmployment.DataBind();
    }
    private void BindFinancialDetails(int ApplicantID)
    {
        var fncDetails = (from eInfo in db.financial_support_details
                          where eInfo.applicantid == ApplicantID
                          select eInfo).ToList();
        grdLoans.DataSource = fncDetails;
        grdLoans.DataBind();
    }
    private void BindSponsersDetails(int ApplicantID)
    {
        var fncsponsers = (from eInfo in db.sponsor_details
                           where eInfo.applicantID == ApplicantID
                           select eInfo).ToList();
        grdSponsers.DataSource = fncsponsers;
        grdSponsers.DataBind();
    }


    protected void btnProeficiency_Click(object sender, EventArgs e)
    {
        string examBookedDate, ProfiencyDate = "";
        examBookedDate = ProfiencyTestDate.Value;
        ProfiencyDate = txtEnglishTest.Value;
        applicant_languagetest objLanugaeTest = new applicant_languagetest();
        objLanugaeTest.applicantId = ApplicantID;

        if (rdoYes.Checked)
        {
            objLanugaeTest.examDate = Convert.ToDateTime(examBookedDate);
            objLanugaeTest.IsTestDone = 1;
        }
        else
        {
            objLanugaeTest.examDate = Convert.ToDateTime(examBookedDate);
            objLanugaeTest.IsTestDone = 0;
        }
        objLanugaeTest.listening = txtListening.Value;
        objLanugaeTest.overallscore = txtOverAll.Value;
        objLanugaeTest.reading = txtReading.Value;
        objLanugaeTest.speaking = txtSpeaking.Value;
        objLanugaeTest.testId = Convert.ToInt32(ddlEnglish.SelectedValue);
        objLanugaeTest.writing = txtWriting.Value;
        db.applicant_languagetest.Add(objLanugaeTest);
        db.SaveChanges();
        BindProefiencyDetails(ApplicantID);
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

    protected void btnFinancial_Click(object sender, EventArgs e)
    {
        string accountopeningDate = "";
        accountopeningDate = txtAccountOpeningDate.Value;
        financial_support_details objFinance = new financial_support_details();
        try
        {
            objFinance.accountbalance = Convert.ToDecimal(txtBalanceAmount.Value);
            objFinance.accountholdername = txtAccountHolderName.Value;
            objFinance.accountno = txtAccountNo.Value;
            objFinance.accountopeningDate = Convert.ToDateTime(accountopeningDate);
            objFinance.address = txtBranchAddress.Value;
            objFinance.applicantid = ApplicantID;
            objFinance.branch_manager_contactno = txtManagerPhoneNo.Value;
            objFinance.branch_manager_mobile = txtManagerMobile.Value;
            objFinance.branch_manager_name = txtManagerName.Value;
            objFinance.contact_no = txtBranchPhone.Value;
            objFinance.financial_intstitue_name = txtFinancialName.Value;
            objFinance.relationship = txtRelationshipWithApplicant.Value;
            objFinance.typeoffunds = txtFundType.Value;
            db.financial_support_details.Add(objFinance);
            db.SaveChanges();
        }
        catch (DbEntityValidationException ex)
        {
            foreach (var eve in ex.EntityValidationErrors)
            {
                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                }
            }
            throw;
        }
        BindFinancialDetails(ApplicantID);

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

    protected void grdEducation_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow && grdEducation.EditIndex == e.Row.RowIndex))
        {
            Label Course = (e.Row.FindControl("lblCourse") as Label);
            if (Course.Text == "1")
                Course.Text = "10TH";
            else if (Course.Text == "2")
                Course.Text = "12Th";
            else if (Course.Text == "3")
                Course.Text = "Diploma";
            else if (Course.Text == "4")
                Course.Text = "UG";
            else if (Course.Text == "5")
                Course.Text = "PG";
            else
                Course.Text = "Others";
        }
    }
    protected void grdEnglish_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow && grdEnglish.EditIndex == e.Row.RowIndex))
        {
            Label Name = (e.Row.FindControl("lblName") as Label);
            if (Name.Text == "1")
                Name.Text = "IELTS";
            else if (Name.Text == "2")
                Name.Text = "PTE";
            else
                Name.Text = "TOFEL";
        }
    }
}