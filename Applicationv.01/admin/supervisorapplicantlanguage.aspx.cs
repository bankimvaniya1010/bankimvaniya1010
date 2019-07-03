using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorapplicantlanguage : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        userID = Convert.ToInt32(Session["UserID"]);
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if ((Request.QueryString["userid"] == null) || (Request.QueryString["userid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            ApplicantID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
            SetControlsUniversitywise();
            PopulateSupervisorComments();
            SetAdminComments();
            PopulateLanguageDetails();

        }
    }
    private String setInnerHtml(dynamic obj)
    {
        return obj.primaryfiledname;
    }
    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname
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
   
    private void PopulateLanguageDetails()
    {
        try
        {
            var LanguageInfo = (from pInfo in db.applicantlanguagecompetency
                                where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                                select pInfo).FirstOrDefault();
            if (LanguageInfo != null)
            {
                lblhomelanguage.Text = LanguageInfo.homelanuage;
                if (LanguageInfo.countryofcourse != null)

                    lblLanguage.Text = objCom.GetCountryDiscription(Convert.ToInt32(LanguageInfo.countryofcourse));


                if (LanguageInfo.studymode != null)
                {
                    lblstudymode.Text = objCom.GetStudyMode(Convert.ToInt32(LanguageInfo.studymode));
                }
                if (LanguageInfo.gradetype != null)
                {
                    lblgradetype.Text = objCom.GetGrade(Convert.ToInt32(LanguageInfo.gradetype));
                }
                lblExpectedDategrade.Text = Convert.ToDateTime(LanguageInfo.expectedgraderesult).ToString("yyyy-MM-dd");
                if (LanguageInfo.qualificationtype != null)
                {
                    lblQualificationType.Text = objCom.GetGrade(Convert.ToInt32(LanguageInfo.qualificationtype));
                }

                if (LanguageInfo.isenglishintesive == 1)
                    lblEnglishBackground.Text = "";
                else if (LanguageInfo.isenglishintesive == 2)
                    lblEnglishBackground.Text = "";
                else
                    lblEnglishBackground.Text = "";

                lbltestName.Text = LanguageInfo.testname;
                lblCentreNo.Text = LanguageInfo.centerno;
                lblCandidateNo.Text = LanguageInfo.candidateno;
                lblCandidateID.Text = LanguageInfo.candidateid;
                if (LanguageInfo.yearofcompletion != null)
                    lblYearCompletion.Text = Convert.ToDateTime(LanguageInfo.yearofcompletion).ToString("yyyy-MM-dd");
                lblNameCollege.Text = LanguageInfo.instituename;
                lblQualificationName.Text = LanguageInfo.qualificationname;
                if (LanguageInfo.giveenglishtest == 1)
                    lblEnglishTest.Text = "";
                else if (LanguageInfo.giveenglishtest == 2)
                    lblEnglishTest.Text = "";
                else
                    lblEnglishTest.Text = "";
                if (LanguageInfo.examdate != null)
                    lblLanguageTestDate.Text = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");
                lblLanguageScore.Text = LanguageInfo.overallscore;
                lblSpeakingScore.Text = LanguageInfo.speakingscore;
                lblListeningScore.Text = LanguageInfo.listeningscore;
                lblWritingScore.Text = LanguageInfo.writingscore;
                lblReadingScore.Text = LanguageInfo.readingscore;
                lbltestRefno.Text = LanguageInfo.testreportreferenceno;
                if (LanguageInfo.cefrlevel != null)
                {
                    lblCEFR.Text = objCom.GetCEFR(Convert.ToInt32(LanguageInfo.cefrlevel));

                }
            }
        }

        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private String setComments(dynamic obj)
    {
        return obj.comments;
    }
    private void SetAdminComments()
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "What language do you speak at home":
                    lblhomelanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Have you studied an English Language Intensive Course for students from non-English speaking backgrounds":
                    lblEnglishBackgroundComments.Text = setComments(Comments[k]);
                    break;
                case "Country of English Language Intensive Course":
                    lblLanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Year of Completion/Expected":
                    lblYearCompletionComments.Text = setComments(Comments[k]);
                    break;
                case "Name of College or University":
                    lblNameCollegeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study":
                    lblstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Type":
                    lblQualificationTypeComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name":
                    lblQualificationNameComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type":
                    lblgradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved":
                    lblgradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared":
                    lblExpectedDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Have you sat any one of the following English Language competency tests":
                    lblEnglishTestComments.Text = setComments(Comments[k]);
                    break;
                case "Test Name":
                    lbltestNameComments.Text = setComments(Comments[k]);
                    break;
                case "Centre No":
                    lblCentreNoComments.Text = setComments(Comments[k]);
                    break;
                case "Candidate No":
                    lblCandidateNoComments.Text = setComments(Comments[k]);
                    break;
                case "Candidate ID":
                    lblCandidateIDComments.Text = setComments(Comments[k]);
                    break;
                case "Test Date":
                    lblLanguageTestDateComments.Text = setComments(Comments[k]);
                    break;
                case "Overall Score":
                    lblLanguageScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Speaking Score":
                    lblSpeakingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Listening Score":
                    lblListeningScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Reading Score":
                    lblReadingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Writing Score":
                    lblWritingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "CEFR Level":
                    lblCEFRComments.Text = setComments(Comments[k]);
                    break;
                case "Test Report Reference No":
                    lbltestRefnoComments.Text = setComments(Comments[k]);
                    break;
                default:
                    break;

            }
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
        }
    }
    private void PopulateSupervisorComments()
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtComments.Text = comments[0].comments;
            if (comments[0].supervisoraction == 1)
                rbApproved.Checked = true;
            else if (comments[0].supervisoraction == 2)
                rbDenied.Checked = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int ActionValue = 0;
            if (rbApproved.Checked)
                ActionValue = 1;
            else if (rbDenied.Checked)
                ActionValue = 2;
            objCom.SaveSupervisorComments(ApplicantID, universityID, formId, userID, txtComments.Text, ActionValue);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

}
