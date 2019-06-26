﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantlanguage : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !GlobalVariables.isDeclarationDoneByApplicant)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlLanguage);
            SetToolTips();
            BindGrade();
            BindStudyMode();
            BindCEFRLevel();
            BindQualificationType();
            PopulateLanguageDetails();
            SetControlsUniversitywise();
        }
    }

    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }

    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();
            }

            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "WHAT LANGUAGE DO YOU SPEAK AT HOME":
                        homelanguage.Attributes.Add("style", "display:block;");
                        labelhomelanguage.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU STUDIED AN ENGLISH LANGUAGE INTENSIVE COURSE FOR STUDENTS FROM NON-ENGLISH SPEAKING BACKGROUNDS":
                        EnglishBackground.Attributes.Add("style", "display:block;");
                        labelEnglishBackground.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU SAT ANY ONE OF THE FOLLOWING ENGLISH LANGUAGE COMPETENCY TESTS":
                        EnglishTest.Attributes.Add("style", "display:block;");
                        labelEnglishTest.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST NAME":
                        testName.Attributes.Add("style", "display:block;");
                        labeltestName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CENTRE NO":
                        CentreNo.Attributes.Add("style", "display:block;");
                        labelCentreNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE NO":
                        CandidateID.Attributes.Add("style", "display:block;");
                        labelCandidateID.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE ID":
                        CandidateID.Attributes.Add("style", "display:block;");
                        labelCandidateID.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST DATE":
                        LanguageTestDate.Attributes.Add("style", "display:block;");
                        labelLanguageTestDate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "OVERALL SCORE":
                        LanguageScore.Attributes.Add("style", "display:block;");
                        labelLanguageScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE":
                        Language.Attributes.Add("style", "display:block;");
                        labelLanguage.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "YEAR OF COMPLETION/EXPECTED":
                        YearCompletion.Attributes.Add("style", "display:block;");
                        labelYearCompletion.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF COLLEGE OR UNIVERSITY":
                        NameCollege.Attributes.Add("style", "display:block;");
                        labelNameCollege.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "QUALIFICATION TYPE":
                        QualificationType.Attributes.Add("style", "display:block;");
                        labelQualificationType.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Name of Qualification":
                        QualificationName.Attributes.Add("style", "display:block;");
                        labelQualificationName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MODE OF STUDY":
                        studymode.Attributes.Add("style", "display:block;");
                        labelstudymode.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GRADE TYPE":
                        gradetype.Attributes.Add("style", "display:block;");
                        labelgradetype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FINAL GRADE ACHIEVED":
                        gradeachieved.Attributes.Add("style", "display:block;");
                        labelgradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "SPEAKING SCORE":
                        SpeakingScore.Attributes.Add("style", "display:block;");
                        labelSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LISTENING SCORE":
                        ListeningScore.Attributes.Add("style", "display:block;");
                        labelListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "READING SCORE":
                        ReadingScore.Attributes.Add("style", "display:block;");
                        labelReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WRITING SCORE":
                        WritingScore.Attributes.Add("style", "display:block;");
                        labelWritingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CEFR LEVEL":
                        CEFR.Attributes.Add("style", "display:block;");
                        labelCEFR.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST REPORT REFERENCE NO":
                        testRefno.Attributes.Add("style", "display:block;");
                        labeltestRefno.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                        ExpectedDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedDategrade.InnerHtml = setInnerHtml(fields[k]);
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
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.universitywisetooltipmaster
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
                          from x in tmp.Where(c => c.formid == formId).DefaultIfEmpty()
                          where (x.formid == formId || z.formid == formId)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              universitywiseToolTips = (z == null ? String.Empty : z.tooltips),
                              tooltips = (x == null ? String.Empty : x.tooltips)
                          }).ToList();


            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "WHAT LANGUAGE DO YOU SPEAK AT HOME":
                        ichomelanguage.Attributes.Add("style", "display:block;");
                        ichomelanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HAVE YOU STUDIED AN ENGLISH LANGUAGE INTENSIVE COURSE FOR STUDENTS FROM NON-ENGLISH SPEAKING BACKGROUNDS":
                        icEnglishBackground.Attributes.Add("style", "display:block;");
                        icEnglishBackground.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HAVE YOU SAT ANY ONE OF THE FOLLOWING ENGLISH LANGUAGE COMPETENCY TESTS":
                        icEnglishTest.Attributes.Add("style", "display:block;");
                        icEnglishTest.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TEST NAME":
                        ictestName.Attributes.Add("style", "display:block;");
                        ictestName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CENTRE NO":
                        icCentreNo.Attributes.Add("style", "display:block;");
                        icCentreNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CANDIDATE NO":
                        icCandidateNo.Attributes.Add("style", "display:block;");
                        icCandidateNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CANDIDATE ID":
                        icCandidateID.Attributes.Add("style", "display:block;");
                        icCandidateID.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TEST DATE":
                        icLanguageTestDate.Attributes.Add("style", "display:block;");
                        icLanguageTestDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "OVERALL SCORE":
                        icLanguageScore.Attributes.Add("style", "display:block;");
                        icLanguageScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE":
                        icLanguage.Attributes.Add("style", "display:block;");
                        icLanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "YEAR OF COMPLETION/EXPECTED":
                        icYearCompletion.Attributes.Add("style", "display:block;");
                        icYearCompletion.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF COLLEGE OR UNIVERSITY":
                        icNameCollege.Attributes.Add("style", "display:block;");
                        icNameCollege.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "QUALIFICATION TYPE":
                        icQualificationType.Attributes.Add("style", "display:block;");
                        icQualificationType.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Name of Qualification":
                        icQualificationName.Attributes.Add("style", "display:block;");
                        icQualificationName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MODE OF STUDY":
                        icstudymode.Attributes.Add("style", "display:block;");
                        icstudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "GRADE TYPE":
                        icgradetype.Attributes.Add("style", "display:block;");
                        icgradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "FINAL GRADE ACHIEVED":
                        icgradeachieved.Attributes.Add("style", "display:block;");
                        icgradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "SPEAKING SCORE":
                        icSpeakingScore.Attributes.Add("style", "display:block;");
                        icSpeakingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LISTENING SCORE":
                        icListeningScore.Attributes.Add("style", "display:block;");
                        icListeningScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "READING SCORE":
                        icReadingScore.Attributes.Add("style", "display:block;");
                        icReadingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WRITING SCORE":
                        icWritingScore.Attributes.Add("style", "display:block;");
                        icWritingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CEFR LEVEL":
                        icCEFR.Attributes.Add("style", "display:block;");
                        icCEFR.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TEST REPORT REFERENCE NO":
                        ictestRefno.Attributes.Add("style", "display:block;");
                        ictestRefno.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                        icExpectedDategrade.Attributes.Add("style", "display:block;");
                        icExpectedDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
    private String setTooltips(dynamic obj)
    {
        return obj.universitywiseToolTips == "" ? obj.tooltips : obj.universitywiseToolTips;
    }
    private void BindStudyMode()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = (from sd in db.studymodemaster
                             where sd.universityid == universityID
                             select new
                             {
                                 description = sd.description,
                                 id = sd.id
                             }).ToList();
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

    private void BindCEFRLevel()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.cefrlevelmaster.ToList();
            ddlCEFR.DataSource = grade;
            ddlCEFR.DataTextField = "name";
            ddlCEFR.DataValueField = "id";
            ddlCEFR.DataBind();
            ddlCEFR.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindQualificationType()
    {
        try
        {

            ListItem lst = new ListItem("Please select", "0");
            var qualificationType = (from qm in db.qualificationmaster
                                     join qcm in db.qualificationcountriesmapping on qm.qualificationid equals qcm.qualificationid
                                     join adm in db.applicantdetails on userID equals adm.applicantid
                                     where qcm.countryid == adm.nationality
                                     select new
                                     {
                                         description = qm.qualificationname,
                                         id = qm.qualificationid
                                     }).ToList();
            ddlQualificationType.DataSource = qualificationType;
            ddlQualificationType.DataTextField = "description";
            ddlQualificationType.DataValueField = "id";
            ddlQualificationType.DataBind();
            ddlQualificationType.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulateLanguageDetails()
    {
        try
        {
            var LanguageInfo = (from pInfo in db.applicantlanguagecompetency
                                where pInfo.applicantid == userID && pInfo.universityid == universityID
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
                if (LanguageInfo.qualificationtype != null)
                {
                    ddlQualificationType.ClearSelection();
                    ddlQualificationType.Items.FindByValue(LanguageInfo.qualificationtype.ToString()).Selected = true;
                }

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
                txtQualificationName.Value = LanguageInfo.qualificationname;
                if (LanguageInfo.giveenglishtest == 1)
                    rblLanguageielts.Checked = true;
                else if (LanguageInfo.giveenglishtest == 2)
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
            var mode = "new";
            var LanguageInfo = (from pInfo in db.applicantlanguagecompetency
                                where pInfo.applicantid == userID && pInfo.universityid == universityID
                                select pInfo).FirstOrDefault();

            applicantlanguagecompetency objLanguage = new applicantlanguagecompetency();
            if (LanguageInfo != null)
            {
                mode = "update";
                objLanguage = LanguageInfo;
            }
            objLanguage.homelanuage = txthomelanguage.Value;
            if (rblEnglishBackgroundYes.Checked)
            {
                objLanguage.isenglishintesive = 1;
                objLanguage.countryofcourse = ddlLanguage.SelectedValue;
                objLanguage.yearofcompletion = Convert.ToDateTime(txtYearCompletion.Value);
                objLanguage.instituename = txtNameCollege.Value;
                objLanguage.studymode = Convert.ToInt32(ddlStudyMode.SelectedValue);
                objLanguage.qualificationname = txtQualificationName.Value;
                objLanguage.qualificationtype = Convert.ToInt32(ddlQualificationType.SelectedValue);
                objLanguage.gradetype = ddlGrade.SelectedValue;
                if (rblYes.Checked)
                    objLanguage.isfinalgradeachieved = 1;
                else if (rblYetToConduct.Checked)
                    objLanguage.isfinalgradeachieved = 2;
                else if (rblNot.Checked)
                    objLanguage.isfinalgradeachieved = 3;
            }
            else if (rblEnglishBackgroundNot.Checked)
            {
                objLanguage.isenglishintesive = 2;
                objLanguage.countryofcourse = ddlLanguage.SelectedValue;
                objLanguage.yearofcompletion = Convert.ToDateTime(txtYearCompletion.Value);
                objLanguage.instituename = txtNameCollege.Value;
                objLanguage.studymode = Convert.ToInt32(ddlStudyMode.SelectedValue);
                objLanguage.qualificationname = txtQualificationName.Value;
                objLanguage.qualificationtype = Convert.ToInt32(ddlQualificationType.SelectedValue);
                objLanguage.gradetype = ddlGrade.SelectedValue;
                objLanguage.isfinalgradeachieved = null;
                objLanguage.expectedgraderesult = Convert.ToDateTime(txtExpectedDategrade.Value);
            }
            else if (rblEnglishBackgroundNo.Checked)
            {
                objLanguage.isenglishintesive = 3;
                objLanguage.countryofcourse = null;
                objLanguage.yearofcompletion = null;
                objLanguage.instituename = null;
                objLanguage.studymode = null;
                objLanguage.qualificationname = null;
                objLanguage.qualificationtype = null;
                objLanguage.gradetype = null;
                objLanguage.isfinalgradeachieved = null;
                objLanguage.expectedgraderesult = null;
            }

            if (rblLanguageielts.Checked)
                objLanguage.giveenglishtest = 1;
            else if (rblLanguagepearsons.Checked)
                objLanguage.giveenglishtest = 2;
            else if (rblLanguagtofel.Checked)
                objLanguage.giveenglishtest = 3;

            objLanguage.testname = txtTestName.Value;
            objLanguage.centerno = txtCentreNo.Value;
            objLanguage.candidateno = txtCandidateNo.Value;
            objLanguage.candidateid = txtCandidateID.Value;
            objLanguage.examdate = Convert.ToDateTime(txtLanguageTestDate.Value);
            objLanguage.overallscore = txtLanguageScore.Value;
            objLanguage.speakingscore = txtSpeaking.Value;
            objLanguage.listeningscore = txtListening.Value;
            objLanguage.writingscore = txtWriting.Value;
            objLanguage.readingscore = txtReading.Value;
            if (ddlCEFR.SelectedValue != "")
            {
                objLanguage.cefrlevel = ddlCEFR.SelectedValue;
            }
            objLanguage.testreportreferenceno = txttestRefno.Value;
            objLanguage.applicantid = userID;
            objLanguage.lastsavedtime = DateTime.Now;
            objLanguage.islanguagecompetencypresent = true;
            objLanguage.universityid = universityID;

            if (mode == "new")
                db.applicantlanguagecompetency.Add(objLanguage);
            db.SaveChanges();
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);

            if (!GlobalVariables.isProfileDetailsCompletedByApplicant)
                objCom.SetStudentDetailsCompletedStatus(userID, universityID);
            lblMessage.Text = "Your Contact Details have been saved";
            lblMessage.Visible = true;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}

