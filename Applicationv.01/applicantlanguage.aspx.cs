using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantlanguage : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx",true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            SetToolTips();
            BindGrade();
            BindStudyMode();
            LanguageDetails();SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        }
    }
    private void SetControlsUniversitywise(int universityID)
    {
        try
        {
            string SecondaryLanguage = "";
            if (Session["SecondaryLang"] != null)
            {
                SecondaryLanguage = Session["SecondaryLang"].ToString();
            }

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.universityid == universityID && ufm.formid == formId && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = afm.fieldnameinstructions,
                              secondaryfieldnameinstructions = afm.secondaryfieldnameinstructions,
                              secondaryfieldnamelanguage = afm.secondaryfieldnamelanguage,
                              secondaryfielddnamevalue = afm.secondaryfielddnamevalue
                          }).ToList();
            if (fields.Count == 0 && SecondaryLanguage != "")
            {
                fields = (from ufm in db.universitywisefieldmapping
                          join pfm in db.primaryfieldmaster on ufm.primaryfieldid equals pfm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.formid == formId && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = afm.fieldnameinstructions,
                              secondaryfieldnameinstructions = afm.secondaryfieldnameinstructions,
                              secondaryfieldnamelanguage = afm.secondaryfieldnamelanguage,
                              secondaryfielddnamevalue = afm.secondaryfielddnamevalue
                          }).ToList();
            }
            else if (fields.Count == 0 && SecondaryLanguage == "")
            {
                fields = (from ufm in db.universitywisefieldmapping
                          join pfm in db.primaryfieldmaster on ufm.primaryfieldid equals pfm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.formid == formId && ufm.universityid == universityID
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = "",
                              secondaryfieldnameinstructions = "",
                              secondaryfieldnamelanguage = "",
                              secondaryfielddnamevalue = ""
                          }).ToList();
            }
            if (fields.Count == 0)
            {
                fields = (from  pfm in db.primaryfieldmaster 
                          
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = "",
                              secondaryfieldnameinstructions = "",
                              secondaryfieldnamelanguage = "",
                              secondaryfielddnamevalue = ""
                          }).ToList();
            }
            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "WHAT LANGUAGE DO YOU SPEAK AT HOME":
                        homelanguage.Attributes.Add("style", "display:block;");
                        labelhomelanguage.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HAVE YOU STUDIED AN ENGLISH LANGUAGE INTENSIVE COURSE FOR STUDENTS FROM NON-ENGLISH SPEAKING BACKGROUNDS":
                        EnglishBackground.Attributes.Add("style", "display:block;");
                        labelEnglishBackground.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HAVE YOU SAT ANY ONE OF THE FOLLOWING ENGLISH LANGUAGE COMPETENCY TESTS":
                        EnglishTest.Attributes.Add("style", "display:block;");
                        labelEnglishTest.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "TEST NAME":
                        testName.Attributes.Add("style", "display:block;");
                        labeltestName.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CENTRE NO":
                        CentreNo.Attributes.Add("style", "display:block;");
                        labelCentreNo.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CANDIDATE NO":
                        CandidateID.Attributes.Add("style", "display:block;");
                        labelCandidateID.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CANDIDATE ID":
                        CandidateID.Attributes.Add("style", "display:block;");
                        labelCandidateID.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "TEST DATE":
                        LanguageTestDate.Attributes.Add("style", "display:block;");
                        labelLanguageTestDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "OVERALL SCORE":
                        LanguageScore.Attributes.Add("style", "display:block;");
                        labelLanguageScore.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE":
                        Language.Attributes.Add("style", "display:block;");
                        labelLanguage.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "YEAR OF COMPLETION/EXPECTED":
                        YearCompletion.Attributes.Add("style", "display:block;");
                        labelYearCompletion.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "NAME OF COLLEGE OR UNIVERSITY":
                        NameCollege.Attributes.Add("style", "display:block;");
                        labelNameCollege.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MODE OF STUDY":
                        studymode.Attributes.Add("style", "display:block;");
                        labelstudymode.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "QUALIFICATION TYPE":
                        QualificationType.Attributes.Add("style", "display:block;");
                        labelQualificationType.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "GRADE TYPE":
                        gradetype.Attributes.Add("style", "display:block;");
                        labelgradetype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "FINAL GRADE ACHIEVED":
                        gradeachieved.Attributes.Add("style", "display:block;");
                        labelgradeachieved.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "SPEAKING SCORE":
                        SpeakingScore.Attributes.Add("style", "display:block;");
                        labelSpeakingScore.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "LISTENING SCORE":
                        ListeningScore.Attributes.Add("style", "display:block;");
                        labelListeningScore.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "READING SCORE":
                        ReadingScore.Attributes.Add("style", "display:block;");
                        labelReadingScore.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "WRITING SCORE":
                        WritingScore.Attributes.Add("style", "display:block;");
                        labelWritingScore.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CEFR LEVEL":
                        CEFR.Attributes.Add("style", "display:block;");
                        labelCEFR.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "TEST REPORT REFERENCE NO":
                        testRefno.Attributes.Add("style", "display:block;");
                        labeltestRefno.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;

                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SetToolTips()
    {
        try
        {
            lstToolTips = db.tooltipmaster.ToList();
            for (int k = 0; k < lstToolTips.Count; k++)
            {
                switch (lstToolTips[k].field)
                {

                    case "Speakinglanguage":
                        txthomelanguage.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Haveintensive":
                        rblYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblNot.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "Intensivecountry":
                        ddlLanguage.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "CompletionYear":
                        txtYearCompletion.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "IntensiveSchoolName":
                        txtNameCollege.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Intensivestudymode":
                        ddlStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "IntensiveQualiicationtype":
                        txtQualificationType.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "IntensiveGradeType":
                        ddlGrade.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Intesivegradeachieved":
                        rblEnglishBackgroundNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblEnglishBackgroundYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblEnglishBackgroundNot.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "HaveEnglishTest":
                        rblLanguageielts.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblLanguagepearsons.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblLanguagtofel.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Testname":
                        txtTestName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Centerno":
                        txtCentreNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "CandidateID":
                        txtCandidateID.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Candidateno":
                        txtCandidateNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "TestDate":
                        txtLanguageTestDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "OverAllScore":
                        txtLanguageScore.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "RedingScore":
                        txtReading.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "ListeningScore":
                        txtListening.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "WritingScore":
                        txtWriting.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "SpeakingScore":
                        txtSpeaking.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "CEFRLevel":
                        ddlCEFR.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "TestRefrenceno":
                        txttestRefno.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindStudyMode()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.studymodemaster.ToList();
            ddlStudyMode.DataSource = studymode;
            ddlStudyMode.DataTextField = "description";
            ddlStudyMode.DataValueField = "id";
            ddlStudyMode.DataBind();
            ddlStudyMode.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindGrade()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddlGrade.DataSource = grade;
            ddlGrade.DataTextField = "description";
            ddlGrade.DataValueField = "id";
            ddlGrade.DataBind();
            ddlGrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void LanguageDetails()
    {
        try
        {
            var LanguageInfo = (from pInfo in db.applicantlanguagecompetency
                                where pInfo.applicantid == userID
                                select pInfo).FirstOrDefault();
            if (LanguageInfo != null)
            {
                txthomelanguage.Value = LanguageInfo.homelanuage;
                if (LanguageInfo.countryofcourse != null)
                {
                    ddlLanguage.ClearSelection();
                    ddlLanguage.Items.FindByValue(LanguageInfo.countryofcourse).Selected = true;
                }
                if (LanguageInfo.studymode != null)
                {
                    ddlStudyMode.ClearSelection();
                    ddlStudyMode.Items.FindByValue(LanguageInfo.studymode.ToString()).Selected = true;
                }
                if (LanguageInfo.gradetype != null)
                {
                    ddlGrade.ClearSelection();
                    ddlGrade.Items.FindByValue(LanguageInfo.gradetype.ToString()).Selected = true;
                }
                txtExpectedDategrade.Value = Convert.ToDateTime(LanguageInfo.expectedgraderesult).ToString("yyyy-MM-dd");


                if (LanguageInfo.isenglishintesive == 1)
                    rblEnglishBackgroundYes.Checked = true;
                else if (LanguageInfo.isenglishintesive == 2)
                    rblEnglishBackgroundNo.Checked = true;
                else
                    rblEnglishBackgroundNot.Checked = true;

                txtTestName.Value = LanguageInfo.testname;
                txtCentreNo.Value = LanguageInfo.centerno;
                txtCandidateNo.Value = LanguageInfo.candidateno;
                txtCandidateID.Value = LanguageInfo.candidateid;
                if (LanguageInfo.yearofcompletion != null)
                    txtYearCompletion.Value = Convert.ToDateTime(LanguageInfo.yearofcompletion).ToString("yyyy-MM-dd");
                txtNameCollege.Value = LanguageInfo.instituename;
                txtQualificationType.Value = LanguageInfo.qualificationtype;
                // txtNameQualifucation.Value = LanguageInfo.qualificationanme;
                if (LanguageInfo.giveenglishtest == 1)
                    rblLanguageielts.Checked = true;
                else if (LanguageInfo.isenglishintesive == 2)
                    rblLanguagepearsons.Checked = true;
                else
                    rblLanguagtofel.Checked = true;
                if (LanguageInfo.examdate != null)
                    txtLanguageTestDate.Value = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");
                txtLanguageScore.Value = LanguageInfo.overallscore;
                txtSpeaking.Value = LanguageInfo.speakingscore;
                txtListening.Value = LanguageInfo.listeningscore;
                txtWriting.Value = LanguageInfo.writingscore;
                txtReading.Value = LanguageInfo.readingscore;
                txttestRefno.Value = LanguageInfo.testreportreferenceno;
                if (LanguageInfo.cefrlevel != null)
                {
                    ddlCEFR.ClearSelection();
                    ddlCEFR.Items.FindByValue(LanguageInfo.cefrlevel.ToString()).Selected = true;
                }
                lblSaveTime.Text = " Record was last saved at " + LanguageInfo.lastsavedtime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var LanguageInfo = (from pInfo in db.applicantlanguagecompetency
                                where pInfo.applicantid == userID
                                select pInfo).FirstOrDefault();
            applicantlanguagecompetency objLanguage = new applicantlanguagecompetency();
            if (LanguageInfo == null)
            {
                objLanguage.homelanuage = txthomelanguage.Value;
                if (ddlLanguage.SelectedValue != "")
                {
                    objLanguage.countryofcourse = ddlLanguage.SelectedValue;

                }
                if (ddlStudyMode.SelectedValue != "")
                {
                    objLanguage.studymode = Convert.ToInt32(ddlStudyMode.SelectedValue);

                }
                if (ddlGrade.SelectedValue != "")
                {
                    objLanguage.gradetype = ddlGrade.SelectedValue;

                }
                objLanguage.expectedgraderesult = Convert.ToDateTime(txtExpectedDategrade.Value);
                //objLanguage.highschoollanguage = txthighschoollangugae.Value;
                //objLanguage.postsecondarylanguage = txtPostSecondaryLanguage.Value;
                //if (rblEnglishYes.Checked)
                //    objLanguage.isenglishinhighschool = 1;
                //else
                //    objLanguage.isenglishinhighschool = 0;

                //objLanguage.highschoolgrade = txtHighSchoolGrade.Value;
                //if (rblPostSecondaryYes.Checked == true)
                //    objLanguage.isenglishinsecondary = 1;
                //else
                //    objLanguage.isenglishinsecondary = 0;
                //objLanguage.secondaryenglishgrade = txtPostSecondaryGrade.Value;

                if (rblEnglishBackgroundYes.Checked)
                    objLanguage.isenglishintesive = 1;
                else if (rblEnglishBackgroundNo.Checked)
                    objLanguage.isenglishintesive = 2;
                else
                    objLanguage.isenglishintesive = 3;

                objLanguage.testname = txtTestName.Value;
                objLanguage.centerno = txtCentreNo.Value;
                objLanguage.candidateno = txtCandidateNo.Value;
                objLanguage.candidateid = txtCandidateID.Value;
                objLanguage.yearofcompletion = Convert.ToDateTime(txtYearCompletion.Value);
                objLanguage.instituename = txtNameCollege.Value;
                objLanguage.qualificationtype = txtQualificationType.Value;
                // objLanguage.qualificationanme = txtNameQualifucation.Value;
                if (rblLanguageielts.Checked)
                    objLanguage.giveenglishtest = 1;
                else if (rblLanguagepearsons.Checked)
                    objLanguage.giveenglishtest = 2;

                else
                    objLanguage.giveenglishtest = 3;
                objLanguage.examdate = Convert.ToDateTime(txtLanguageTestDate.Value);
                objLanguage.overallscore = txtLanguageScore.Value;

                objLanguage.speakingscore = txtSpeaking.Value;
                objLanguage.listeningscore = txtListening.Value;
                objLanguage.writingscore = txtWriting.Value;
                objLanguage.readingscore = txtReading.Value;
                objLanguage.testreportreferenceno = txttestRefno.Value;
                if (ddlCEFR.SelectedValue != "")
                {
                    objLanguage.cefrlevel = ddlCEFR.SelectedValue;
                    // ddlCEFR.Items.FindByValue(LanguageInfo.cefrlevel.ToString()).Selected = true;
                }
                objLanguage.applicantid = userID;
                objLanguage.lastsavedtime = DateTime.Now;
                db.applicantlanguagecompetency.Add(objLanguage);
            }
            else
            {
                LanguageInfo.homelanuage = txthomelanguage.Value;
                if (ddlLanguage.SelectedValue != "")
                {
                    LanguageInfo.countryofcourse = ddlLanguage.SelectedValue;

                }
                if (ddlStudyMode.SelectedValue != "")
                {
                    LanguageInfo.studymode = Convert.ToInt32(ddlStudyMode.SelectedValue);

                }
                if (ddlGrade.SelectedValue != "")
                {
                    LanguageInfo.gradetype = ddlGrade.SelectedValue;

                }
                if (txtExpectedDategrade.Value != "")
                    LanguageInfo.expectedgraderesult = Convert.ToDateTime(txtExpectedDategrade.Value);

                LanguageInfo.testname = txtTestName.Value;
                LanguageInfo.centerno = txtCentreNo.Value;
                LanguageInfo.candidateno = txtCandidateNo.Value;
                LanguageInfo.candidateid = txtCandidateID.Value;

                if (rblEnglishBackgroundYes.Checked)
                    LanguageInfo.isenglishintesive = 1;
                else if (rblEnglishBackgroundNo.Checked)
                    LanguageInfo.isenglishintesive = 2;
                else
                    LanguageInfo.isenglishintesive = 3;

                //  LanguageInfo.coursename = txtEnglishCourse.Value;
                LanguageInfo.yearofcompletion = Convert.ToDateTime(txtYearCompletion.Value);
                LanguageInfo.instituename = txtNameCollege.Value;
                LanguageInfo.qualificationtype = txtQualificationType.Value;
                // LanguageInfo.qualificationanme = txtNameQualifucation.Value;
                if (rblLanguageielts.Checked)
                    LanguageInfo.giveenglishtest = 1;
                else if (rblLanguagepearsons.Checked)
                    LanguageInfo.giveenglishtest = 2;

                else
                    LanguageInfo.giveenglishtest = 3;
                if (txtLanguageTestDate.Value != "")
                    LanguageInfo.examdate = Convert.ToDateTime(txtLanguageTestDate.Value);
                LanguageInfo.overallscore = txtLanguageScore.Value;
                LanguageInfo.speakingscore = txtSpeaking.Value;
                LanguageInfo.listeningscore = txtListening.Value;
                LanguageInfo.writingscore = txtWriting.Value;
                LanguageInfo.readingscore = txtReading.Value;
                LanguageInfo.testreportreferenceno = txttestRefno.Value;
                LanguageInfo.lastsavedtime = DateTime.Now;
                if (ddlCEFR.SelectedValue != "")
                {
                    LanguageInfo.cefrlevel = ddlCEFR.SelectedValue;
                    // ddlCEFR.Items.FindByValue(LanguageInfo.cefrlevel.ToString()).Selected = true;
                }
            }
            db.SaveChanges();
            lblMessage.Text = "Your Contact Details have been saved";
            lblMessage.Visible = true;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}

