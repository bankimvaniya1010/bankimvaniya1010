using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class applicantdetails : System.Web.UI.Page
{
    int userID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    CultureInfo provider = CultureInfo.InvariantCulture;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL +"Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        if (!IsPostBack)
        {
            PopulatePersonal(userID);
            BindEducationDetails(userID);
            BindProefiencyDetails(userID);
            BindGapDetails(userID);
            BindEmploymentDetails(userID);
            BindFinancialDetails(userID);
            BindSponsersDetails(userID);
        }
    }
    private void PopulatePersonal(int userID)
    {
        try { 
        var profileInfo = (from pInfo in db.Applicant_master
                           where pInfo.userid == userID
                           select pInfo).FirstOrDefault();
        txtName.Text = profileInfo.name;
        txtAdhar.Text = profileInfo.adhar_no;
        txtCourse.Text = profileInfo.course_applied;
        dob.Value = Convert.ToDateTime(profileInfo.dob).ToString("yyyy-MM-dd");
        txtEmail.Text = profileInfo.email;
        if (profileInfo.gender == 1)
            rbtnMale.Checked = true;
        else
            rbtnFemale.Checked = true;
        txtIntake.Text = profileInfo.intakeforwhichapplied;
        txtMobile.Text = profileInfo.mobile_no;
        txtPanNo.Text = profileInfo.pan_no;
        txtPaasportno.Text = profileInfo.passport_no;
        //  txtUniversity.Text = profileInfo.universityid;
        txtUniversity.Text = profileInfo.university_applied;
        txtVoter.Text = profileInfo.votercard_no;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        try
        { 
        MultiView1.ActiveViewIndex = Int32.Parse(e.Item.Value);
        Menu1.Items[0].ImageUrl = "~/Images/HomeDisabled.jpg";
        Menu1.Items[1].ImageUrl = "~/Images/ProductsDisabled.jpg";
        Menu1.Items[2].ImageUrl = "~/Images/SupportDisabled.jpg";
        Menu1.Items[3].ImageUrl = "~/Images/HelpDisabled.jpg";
        switch (e.Item.Value)
        {
            case "0":
                {
                    Menu1.Items[0].ImageUrl = "~/Images/HomeEnabled.jpg";
                    break;
                }

            case "1":
                {
                    Menu1.Items[1].ImageUrl = "~/Images/ProductsEnabled.jpg";
                    break;
                }

            case "2":
                {
                    Menu1.Items[2].ImageUrl = "~/Images/SupportEnabled.jpg";
                    break;
                }

            case "3":
                {
                    Menu1.Items[3].ImageUrl = "~/Images/HelpEnabled.jpg";
                    break;
                }
        }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        { 
        Applicant_master objProfile = db.Applicant_master.Where(b => b.userid == userID).First();
        string DateString = dob.Value;
        IFormatProvider culture = new CultureInfo("en-US", true);
        // DateTime dateVal = DateTime.ParseExact(DateString, "yyyy-MM-dd", culture);
        objProfile.name = txtName.Text;
        objProfile.adhar_no = txtAdhar.Text;
        objProfile.course_applied = txtCourse.Text;
        //objProfile.dob = dob.Value;
        objProfile.dob = Convert.ToDateTime(DateString);
        objProfile.email = txtEmail.Text;
        if (rbtnFemale.Checked == true)
            objProfile.gender = 0;
        else
            objProfile.gender = 1;
        objProfile.intakeforwhichapplied = txtIntake.Text;
        objProfile.mobile_no = txtMobile.Text;
        objProfile.pan_no = txtPaasportno.Text;
        objProfile.university_applied = txtUniversity.Text;
        objProfile.votercard_no = txtVoter.Text;
        db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        //  objProfile.pan_no = txtPanNo.Text;
    }

    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCourse.Text == "Others")
            txtOtherCourse.Visible = true;
        else
            txtOtherCourse.Visible = false;
    }

    protected void btnCourse_Click(object sender, EventArgs e)
    {
        try
        {
            string durationFrom, durationTo = "";
            durationFrom = durationfrom.Value;
            durationTo = durationto.Value;
            applicant_education objApplicant = new applicant_education();
            objApplicant.applicantID = userID;
            objApplicant.board_universityname = txtBoardUniversity.Text;
            objApplicant.courseId = Convert.ToInt32(ddlCourse.SelectedValue);
            objApplicant.course_startdate = Convert.ToDateTime(durationFrom);
            objApplicant.course_enddate = Convert.ToDateTime(durationTo);
            objApplicant.Institute = txtInstitute.Text;
            if (txtOtherCourse != null)
                objApplicant.othercourse_name = txtOtherCourse.Text;
            objApplicant.percentage = txtPercentage.Text;
            objApplicant.repeats_backlog = txtRepeats.Text;
            db.applicant_education.Add(objApplicant);
            db.SaveChanges();
            BindEducationDetails(userID);
        
         }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnProeficiency_Click(object sender, EventArgs e)
    {
        try
        { 
        string examBookedDate, ProfiencyDate = "";
        examBookedDate = ProfiencyTestDate.Value;
        ProfiencyDate = txtEnglishTest.Value;
        applicant_languagetest objLanugaeTest = new applicant_languagetest();
        objLanugaeTest.applicantId = userID;

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
        objLanugaeTest.overallscore = txtOverAll.Text;
        objLanugaeTest.reading = txtReading.Text;
        objLanugaeTest.speaking = txtSpeaking.Text;
        objLanugaeTest.testId = Convert.ToInt32(ddlEnglish.SelectedValue);
        objLanugaeTest.writing = txtWriting.Text;
        db.applicant_languagetest.Add(objLanugaeTest);
        db.SaveChanges();
        BindProefiencyDetails(userID);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnGapDetails_Click(object sender, EventArgs e)
    {
        try
        {
            string gapFrom, gapTo = "";
            gapFrom = txtGapFrom.Value;
            gapTo = txtGapEnd.Value;

            applicant_gapsdetails objGap = new applicant_gapsdetails();
            objGap.applicantId = userID;
            objGap.gap_from = Convert.ToDateTime(gapFrom);
            objGap.gap_to = Convert.ToDateTime(gapTo);
            objGap.explanation = txtExplanation.Text;
            db.applicant_gapsdetails.Add(objGap);
            db.SaveChanges();
            BindGapDetails(userID);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindGapDetails(int userID)
    {
        var GapDetails = (from gInfo in db.applicant_gapsdetails
                          where gInfo.applicantId == userID
                          select gInfo).ToList();
        grdGaps.DataSource = GapDetails;
        grdGaps.DataBind();
    }
    private void BindEducationDetails(int userID)
    {
        var CourseDetails = (from pInfo in db.applicant_education
                             where pInfo.applicantID == userID
                             select pInfo).ToList();
        grdEducation.DataSource = CourseDetails;
        grdEducation.DataBind();
    }
    private void BindProefiencyDetails(int userID)
    {
        var testDetails = (from tInfo in db.applicant_languagetest
                           where tInfo.applicantId == userID
                           select tInfo).ToList();
        grdEnglish.DataSource = testDetails;
        grdEnglish.DataBind();
    }

    private void BindEmploymentDetails(int userID)
    {
        var empDetails = (from eInfo in db.applicantemployerdetails
                          where eInfo.applicantId == userID
                          select eInfo).ToList();
        grdEmployment.DataSource = empDetails;
        grdEmployment.DataBind();
    }
    private void BindFinancialDetails(int userID)
    {
        var fncDetails = (from eInfo in db.financial_support_details
                          where eInfo.applicantid == userID
                          select eInfo).ToList();
        grdLoans.DataSource = fncDetails;
        grdLoans.DataBind();
    }
    private void BindSponsersDetails(int userID)
    {
        var fncsponsers = (from eInfo in db.sponsor_details
                          where eInfo.applicantID == userID
                          select eInfo).ToList();
        grdSponsers.DataSource = fncsponsers;
        grdSponsers.DataBind();
    }


    protected void btnEmployment_Click(object sender, EventArgs e)
    {
        string startFrom, endTo = "";
        startFrom = txtEmploymentStart.Value;
        endTo = txtEmploymentEnd.Value;

        applicantemployerdetails objEmployment = new applicantemployerdetails();
        objEmployment.applicantId = userID;
        objEmployment.durationfrom = Convert.ToDateTime(startFrom);
        objEmployment.durationto = Convert.ToDateTime(endTo);
        objEmployment.contactpersonwithdetails = txtContactPerson.Text;
        objEmployment.designation = txtDesignation.Value;
        objEmployment.organization = txtOrganisation.Value;
        objEmployment.salary = Convert.ToInt32(txtSalary.Text);
        db.applicantemployerdetails.Add(objEmployment);
        db.SaveChanges();
        BindEmploymentDetails(userID);
    }



    protected void btnSelfAssesment_Click(object sender, EventArgs e)
    {
        var profileInfo = (from pInfo in db.Applicant_master
                           where pInfo.userid == userID
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
            objFinance.accountbalance = Convert.ToDecimal(txtBalanceAmount.Text);
            objFinance.accountholdername = txtAccountHolderName.Text;
            objFinance.accountno = txtAccountNo.Text;
            objFinance.accountopeningDate = Convert.ToDateTime(accountopeningDate);
            objFinance.address = txtBranchAddress.Text;
            objFinance.applicantid = userID;
            objFinance.branch_manager_contactno = txtManagerPhoneNo.Text;
            objFinance.branch_manager_mobile = txtManagerMobile.Text;
            objFinance.branch_manager_name = txtManagerName.Text;
            objFinance.contact_no = txtBranchPhone.Text;
            objFinance.financial_intstitue_name = txtFinancialName.Text;
            objFinance.relationship = txtRelationshipWithApplicant.Text;
            objFinance.typeoffunds = txtFundType.Text;
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
        BindFinancialDetails(userID);

    }

    protected void btnSponsers_Click(object sender, EventArgs e)
    {
        string durationFrom = "",durationto="";
        durationFrom = txtSponsersFrom.Value;
        durationto = txtSponsersTo.Value;
        sponsor_details objSponsor = new sponsor_details();
        objSponsor.annualincome = Convert.ToDecimal(txtAnnual.Text);
        objSponsor.applicantID = userID;
        objSponsor.designation = txtSponsarDesignation.Text;
        objSponsor.durationfrom = Convert.ToDateTime(durationFrom);
        objSponsor.durationto = Convert.ToDateTime(durationto);
        objSponsor.employment_details = txtEmployers.Text;
       if( rdITRNo.Checked)
        objSponsor.isfiledItr = 1;
       else
            objSponsor.isfiledItr = 0;
        objSponsor.name = txtSponsor.Text;
        objSponsor.relationship = txtRelationship.Text;
        db.sponsor_details.Add(objSponsor);
        db.SaveChanges();
        BindSponsersDetails(userID);
    }

}
   