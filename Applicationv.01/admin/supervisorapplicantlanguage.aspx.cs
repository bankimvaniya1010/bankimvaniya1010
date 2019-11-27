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
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
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
        CustomControls = objCom.CustomControlist(formId, universityID);
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
                    case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                        ExpectedDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedDategrade.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU SAT ANY ONE OF THE FOLLOWING ENGLISH LANGUAGE COMPETENCY TESTS":
                        EnglishTest.Attributes.Add("style", "display:block;");
                        labelEnglishTest.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CEFR LEVEL":
                        CEFR.Attributes.Add("style", "display:block;");
                        labelCEFR.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST REPORT REFERENCE NO":
                        testRefno.Attributes.Add("style", "display:block;");
                        labeltestRefno.InnerHtml = setInnerHtml(fields[k]);
                        break;


                    //IELTS
                    case "TEST NAME":
                        testName.Attributes.Add("style", "display:block;");
                        labeltestName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE NO":
                        CandidateNo.Attributes.Add("style", "display:block;");
                        labelCandidateNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE ID":
                        CandidateID.Attributes.Add("style", "display:block;");
                        labelCandidateID.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CENTRE NO":
                        CentreNo.Attributes.Add("style", "display:block;");
                        labelCentreNo.InnerHtml = setInnerHtml(fields[k]);
                        labelptetestcenterNo.InnerHtml = setInnerHtml(fields[k]);
                        labeltofelcenterNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST DATE":
                        ieltsTestDate.Attributes.Add("style", "display:block;");
                        labelieltsTestDate.InnerHtml = setInnerHtml(fields[k]);
                        labelpteTestDate.InnerHtml = setInnerHtml(fields[k]);
                        labeltofelTestDate.InnerHtml = setInnerHtml(fields[k]);
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
                    case "TOTAL SCORE":
                        LanguageScore.Attributes.Add("style", "display:block;");
                        labelLanguageScore.InnerHtml = setInnerHtml(fields[k]);
                        labelpteTotalScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    //PTE

                    case "COMMUNICATIVE SKILLS READING":
                        pteReadingScore.Attributes.Add("style", "display:block;");
                        labelpteReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS LISTENING":
                        pteListeningScore.Attributes.Add("style", "display:block;");
                        labelpteListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS SPEAKING":
                        pteSpeakingScore.Attributes.Add("style", "display:block;");
                        labelpteSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS WRITING":
                        pteWritingScore.Attributes.Add("style", "display:block;");
                        labelpteWritingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PTE TOTAL SCORE":
                        pteTotalScore.Attributes.Add("style", "display:block;");
                        break;
                    case "TEST TAKER ID":
                        ptetesttaker.Attributes.Add("style", "display:block;");
                        labelptetesttaker.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PTE REGISTRATION NUMBER":
                        pteregistrationno.Attributes.Add("style", "display:block;");
                        break;
                    case "PTE CENTER COUNTRY":
                        ptecentercountry.Attributes.Add("style", "display:block;");
                        break;
                    case "PTE CENTER NUMBER":
                        ptetestcenterNo.Attributes.Add("style", "display:block;");
                        break;
                    case "PTE TEST DATE":
                        pteTestDate.Attributes.Add("style", "display:block;");
                        break;
                    //TOFEL
                    case "Reading iBT Scaled Score":
                        tofelReadingScore.Attributes.Add("style", "display:block;");
                        labeltofelReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Listening iBT Scaled Score":
                        tofelListeningScore.Attributes.Add("style", "display:block;");
                        labeltofelListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Speaking iBT Scaled Score":
                        tofelSpeakingScore.Attributes.Add("style", "display:block;");
                        labeltofelSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Writing iBT Scaled Score":
                        tofelWritingScore.Attributes.Add("style", "display:block;");
                        labeltofelWritingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Total Score (iBT Scaled Score)":
                        tofelTotalScore.Attributes.Add("style", "display:block;");
                        labeltofelTotalScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TOFEL REGISTRATION NUMBER":
                        tofelregistrationno.Attributes.Add("style", "display:block;");
                        break;
                    case "TOFEL CENTER NUMBER":
                        tofelcenterNo.Attributes.Add("style", "display:block;");
                        break;
                    case "TOFEL CENTER COUNTRY":
                        tofelcentercountry.Attributes.Add("style", "display:block;");
                        break;
                    case "TOFEL TEST DATE":
                        tofelTestDate.Attributes.Add("style", "display:block;");
                        break;

                    case "TEST CENTER COUNTRY":
                        labelptecentercountry.InnerHtml = setInnerHtml(fields[k]);
                        labeltofelcentercountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "REGISTRATION NUMBER":
                        labelpteregistrationno.InnerHtml = setInnerHtml(fields[k]);
                        labeltofelregistrationno.InnerHtml = setInnerHtml(fields[k]);
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
                if (LanguageInfo.homelanuage.HasValue)
                    lblhomelanguage.Text = objCom.GetStudyMedium(LanguageInfo.homelanuage.Value);

                if (LanguageInfo.isenglishintesive == 1)
                    lblEnglishBackground.Text = "";
                else if (LanguageInfo.isenglishintesive == 2)
                    lblEnglishBackground.Text = "";
                else
                    lblEnglishBackground.Text = "";
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
                if (LanguageInfo.expectedgraderesult != null)
                    lblExpectedDategrade.Text = Convert.ToDateTime(LanguageInfo.expectedgraderesult).ToString("yyyy-MM-dd");
                if (LanguageInfo.yearofcompletion != null)
                    lblYearCompletion.Text = Convert.ToDateTime(LanguageInfo.yearofcompletion).ToString("yyyy-MM-dd");
                lblNameCollege.Text = LanguageInfo.instituename;
                lblQualificationName.Text = LanguageInfo.qualificationname;
                if (LanguageInfo.qualificationtype != null)
                {
                    lblQualificationType.Text = objCom.GetGrade(Convert.ToInt32(LanguageInfo.qualificationtype));
                }
                if (LanguageInfo.isfinalgradeachieved == 1)
                    lblgradeachieved.Text = "Results Declared";
                else if (LanguageInfo.isfinalgradeachieved == 2)
                    lblgradeachieved.Text = "Examination not conducted yet";
                else if (LanguageInfo.isfinalgradeachieved == 3)
                    lblgradeachieved.Text = "Examination Conducted, but Result not declared";

                if (LanguageInfo.giveenglishtest == 1)
                {
                    ieltsfieldContainer.Visible = true;
                    lblEnglishTest.Text = "Yes";
                    lbltestName.Text = LanguageInfo.testname;
                    lblCentreNo.Text = LanguageInfo.centerno;
                    lblCandidateNo.Text = LanguageInfo.candidateno;
                    lblCandidateID.Text = LanguageInfo.candidateid;
                    if (LanguageInfo.examdate != null)
                        lblieltsTestDate.Text = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");

                    lblLanguageScore.Text = LanguageInfo.overallscore;
                    lblSpeakingScore.Text = LanguageInfo.speakingscore;
                    lblListeningScore.Text = LanguageInfo.listeningscore;
                    lblWritingScore.Text = LanguageInfo.writingscore;
                    lblReadingScore.Text = LanguageInfo.readingscore;

                }

                else if (LanguageInfo.giveenglishtest == 2)
                {
                    ptefieldContainer.Visible = true;
                    lblEnglishTest.Text = "Yes";
                    lbltestName.Text = LanguageInfo.testname;
                    lblptetesttaker.Text = LanguageInfo.testtakerId;
                    lblpteregistrationno.Text = LanguageInfo.registrationNo;
                    lblptetestcenterNo.Text = LanguageInfo.centerno;
                    if (LanguageInfo.examdate != null)
                        lblpteTestDate.Text = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");
                    if (LanguageInfo.testcentercountrty != null)
                    {
                        lblptecentercountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(LanguageInfo.testcentercountrty));
                    }

                    lblpteTotalScore.Text = LanguageInfo.overallscore;
                    lblpteSpeakingScore.Text = LanguageInfo.speakingscore;
                    lblpteListeningScore.Text = LanguageInfo.listeningscore;
                    lblpteWritingScore.Text = LanguageInfo.writingscore;
                    lblpteReadingScore.Text = LanguageInfo.readingscore;

                }

                else if (LanguageInfo.giveenglishtest == 3)
                {
                    tofelfieldContainer.Visible = true;
                    lblEnglishTest.Text = "Yes";
                    lbltestName.Text = LanguageInfo.testname;
                    lbltofelregistrationno.Text = LanguageInfo.registrationNo;
                    lbltofelcenterNo.Text = LanguageInfo.centerno;
                    if (LanguageInfo.examdate != null)
                        lbltofelTestDate.Text = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");
                    if (LanguageInfo.testcentercountrty != null)
                    {
                        lbltofelcentercountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(LanguageInfo.testcentercountrty));
                    }

                    lbltofelTotalScore.Text = LanguageInfo.overallscore;
                    lbltofelSpeakingScore.Text = LanguageInfo.speakingscore;
                    lbltofelListeningScore.Text = LanguageInfo.listeningscore;
                    lbltofelWritingScore.Text = LanguageInfo.writingscore;
                    lbltofelReadingScore.Text = LanguageInfo.readingscore;
                }

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
                    if (Comments[k].adminaction == 0)
                        rblhomelanguageNo.Checked = true;
                    else
                        rblhomelanguageYes.Checked = true;
                    lblhomelanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Have you studied an English Language Intensive Course for students from non-English speaking backgrounds":
                    if (Comments[k].adminaction == 0)
                        rblEnglishBackgroundNo.Checked = true;
                    else
                        rblEnglishBackgroundYes.Checked = true;
                    lblEnglishBackgroundComments.Text = setComments(Comments[k]);
                    break;
                case "Country of English Language Intensive Course":
                    if (Comments[k].adminaction == 0)
                        rblLanguageNo.Checked = true;
                    else
                        rblLanguageYes.Checked = true;
                    lblLanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Year of Completion/Expected":
                    if (Comments[k].adminaction == 0)
                        rblYearCompletionNo.Checked = true;
                    else
                        rblYearCompletionYes.Checked = true;
                    lblYearCompletionComments.Text = setComments(Comments[k]);
                    break;
                case "Name of College or University":
                    if (Comments[k].adminaction == 0)
                        rblNameCollegeYes.Checked = true;
                    else
                        rblNameCollegeNo.Checked = true;
                    lblNameCollegeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study":
                    if (Comments[k].adminaction == 0)
                        rblstudymodeNo.Checked = true;
                    else
                        rblstudymodeYes.Checked = true;
                    lblstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Type":
                    if (Comments[k].adminaction == 0)
                        rblQualificationTypeNo.Checked = true;
                    else
                        rblQualificationTypeYes.Checked = true;
                    lblQualificationTypeComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name":
                    if (Comments[k].adminaction == 0)
                        rblQualificationNameNo.Checked = true;
                    else
                        rblQualificationNameYes.Checked = true;
                    lblQualificationNameComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type":
                    if (Comments[k].adminaction == 0)
                        rblgradetypeNo.Checked = true;
                    else
                        rblgradetypeYes.Checked = true;
                    lblgradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved":
                    if (Comments[k].adminaction == 0)
                        rblgradeachievedNo.Checked = true;
                    else
                        rblgradeachievedYes.Checked = true;
                    lblgradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared":
                    if (Comments[k].adminaction == 0)
                        rblExpectedDategradeNo.Checked = true;
                    else
                        rblExpectedDategradeYes.Checked = true;
                    lblExpectedDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Have you sat any one of the following English Language competency tests":
                    if (Comments[k].adminaction == 0)
                        rblEnglishTestNo.Checked = true;
                    else
                        rblEnglishTestYes.Checked = true;
                    lblEnglishTestComments.Text = setComments(Comments[k]);
                    break;
                case "Test Name":
                    if (Comments[k].adminaction == 0)
                        rbltestNameNo.Checked = true;
                    else
                        rbltestNameYes.Checked = true;
                    lbltestNameComments.Text = setComments(Comments[k]);
                    break;
                case "Centre No":
                    if (Comments[k].adminaction == 0)
                        rblCentreNoNo.Checked = true;
                    else
                        rblCentreNoYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblptetestcenterNoNo.Checked = true;
                    else
                        rblptetestcenterNoYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelcenterNo.Checked = true;
                    else
                        rblptetestcenterNoYes.Checked = true;
                    lblCentreNoComments.Text = setComments(Comments[k]);
                    lblptetestcenterNoComments.Text = setComments(Comments[k]);
                    lbltofelcenterNoComments.Text = setComments(Comments[k]);
                    break;
                case "Candidate No":
                    if (Comments[k].adminaction == 0)
                        rblCandidateNoNo.Checked = true;
                    else
                        rblCandidateNoYes.Checked = true;
                    lblCandidateNoComments.Text = setComments(Comments[k]);
                    break;
                case "Candidate ID":
                    if (Comments[k].adminaction == 0)
                        rblCandidateIDNo.Checked = true;
                    else
                        rblCandidateIDYes.Checked = true;
                    lblCandidateIDComments.Text = setComments(Comments[k]);
                    break;
                case "Test Date":
                    if (Comments[k].adminaction == 0)
                        rblieltsTestDateNo.Checked = true;
                    else
                        rblieltsTestDateYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblpteTestDateNo.Checked = true;
                    else
                        rblpteTestDateYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelTestDateNo.Checked = true;
                    else
                        rbltofelTestDateYes.Checked = true;
                    lblieltsTestDateComments.Text = setComments(Comments[k]);
                    lblpteTestDateComments.Text = setComments(Comments[k]);
                    lbltofelTestDateComments.Text = setComments(Comments[k]);
                    break;
                case "Total Score":
                    if (Comments[k].adminaction == 0)
                        rblLanguageScoreNo.Checked = true;
                    else
                        rblLanguageScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblpteTotalScoreNo.Checked = true;
                    else
                        rblpteTotalScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelTotalScoreNo.Checked = true;
                    else
                        rbltofelTotalScoreYes.Checked = true;
                    lblLanguageScoreComments.Text = setComments(Comments[k]);
                    lblpteTotalScoreComments.Text = setComments(Comments[k]);
                    lbltofelTotalScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Speaking Score":
                    if (Comments[k].adminaction == 0)
                        rblSpeakingScoreNo.Checked = true;
                    else
                        rblSpeakingScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblpteSpeakingScoreNo.Checked = true;
                    else
                        rblpteSpeakingScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelSpeakingScoreNo.Checked = true;
                    else
                        rbltofelSpeakingScoreYes.Checked = true;
                    lblSpeakingScoreComments.Text = setComments(Comments[k]);
                    lblpteSpeakingScoreComments.Text = setComments(Comments[k]);
                    lbltofelSpeakingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Listening Score":
                    if (Comments[k].adminaction == 0)
                        rblListeningScoreNo.Checked = true;
                    else
                        rblListeningScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblpteListeningScoreNo.Checked = true;
                    else
                        rblpteListeningScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelListeningScoreNo.Checked = true;
                    else
                        rbltofelListeningScoreYes.Checked = true;
                    lblListeningScoreComments.Text = setComments(Comments[k]);
                    lblpteListeningScoreComments.Text = setComments(Comments[k]);
                    lbltofelListeningScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Reading Score":
                    if (Comments[k].adminaction == 0)
                        rblReadingScoreNo.Checked = true;
                    else
                        rblReadingScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblpteReadingScoreNo.Checked = true;
                    else
                        rblpteReadingScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelReadingScoreNo.Checked = true;
                    else
                        rbltofelReadingScoreYes.Checked = true;
                    lblReadingScoreComments.Text = setComments(Comments[k]);
                    lblpteReadingScoreComments.Text = setComments(Comments[k]);
                    lbltofelReadingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "Writing Score":
                    if (Comments[k].adminaction == 0)
                        rblWritingScoreNo.Checked = true;
                    else
                        rblWritingScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rblpteWritingScoreNo.Checked = true;
                    else
                        rblpteWritingScoreYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelWritingScoreNo.Checked = true;
                    else
                        rbltofelWritingScoreYes.Checked = true;
                    lblWritingScoreComments.Text = setComments(Comments[k]);
                    lblpteWritingScoreComments.Text = setComments(Comments[k]);
                    lbltofelWritingScoreComments.Text = setComments(Comments[k]);
                    break;

                case "Registration Number":
                    if (Comments[k].adminaction == 0)
                        rblpteregistrationnoNo.Checked = true;
                    else
                        rblpteregistrationnoYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelregistrationnoNo.Checked = true;
                    else
                        rbltofelregistrationnoYes.Checked = true;
                    lblpteregistrationnoComments.Text = setComments(Comments[k]);
                    lbltofelregistrationnoComments.Text = setComments(Comments[k]);
                    break;
                case "Test Center Country":
                    if (Comments[k].adminaction == 0)
                        rblptecentercountryNo.Checked = true;
                    else
                        rblptecentercountryYes.Checked = true;
                    if (Comments[k].adminaction == 0)
                        rbltofelcentercountryNo.Checked = true;
                    else
                        rbltofelcentercountryYes.Checked = true;
                    lblptecentercountryComments.Text = setComments(Comments[k]);
                    lbltofelcentercountryComments.Text = setComments(Comments[k]);
                    break;
                case "Test Taker ID":
                    lblptetesttakerComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblptetesttakerNo.Checked = true;
                    else
                        rblptetesttakerYes.Checked = true;
                    break;
                case "CEFR Level":
                    lblCEFRComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblCEFRNo.Checked = true;
                    else
                        rblCEFRYes.Checked = true;
                    break;
                case "Test Report Reference No":
                    lbltestRefnoComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rbltestRefnoNo.Checked = true;
                    else
                        rbltestRefnoYes.Checked = true;
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
