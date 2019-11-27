using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantlanguage : System.Web.UI.Page
{
    int adminID = 0, ApplicantID = 0, universityID;
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
        adminID = Convert.ToInt32(Session["UserID"]);
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
            SetToolTips();
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
    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.adminuniversitywisetooltips
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.admintooltips on pfm.primaryfieldid equals tm.fieldid into tmp
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
                    case "COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE":
                        icLanguage.Attributes.Add("style", "display:block;");
                        icLanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "YEAR OF COMPLETION/EXPECTED":
                        icYearCompletion.Attributes.Add("style", "display:block;");
                        icYearCompletion.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                        icExpectedDategrade.Attributes.Add("style", "display:block;");
                        icExpectedDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
                    case "HAVE YOU SAT ANY ONE OF THE FOLLOWING ENGLISH LANGUAGE COMPETENCY TESTS":
                        icEnglishTest.Attributes.Add("style", "display:block;");
                        icEnglishTest.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    // IELTS
                    case "TEST NAME":
                        ictestName.Attributes.Add("style", "display:block;");
                        ictestName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CANDIDATE NO":
                        icCandidateNo.Attributes.Add("style", "display:block;");
                        icCandidateNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CANDIDATE ID":
                        icCandidateID.Attributes.Add("style", "display:block;");
                        icCandidateID.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CENTRE NO":
                        icCenterno.Attributes.Add("style", "display:block;");
                        icCenterno.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TEST DATE":
                        icieltsTestDate.Attributes.Add("style", "display:block;");
                        icieltsTestDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "READING SCORE":
                        icReadingScore.Attributes.Add("style", "display:block;");
                        icReadingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LISTENING SCORE":
                        icListeningScore.Attributes.Add("style", "display:block;");
                        icListeningScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "SPEAKING SCORE":
                        icSpeakingScore.Attributes.Add("style", "display:block;");
                        icSpeakingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WRITING SCORE":
                        icWritingScore.Attributes.Add("style", "display:block;");
                        icWritingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TOTAL SCORE":
                        icLanguageScore.Attributes.Add("style", "display:block;");
                        icLanguageScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;

                    // pte
                    case "TEST TAKER ID":
                        icpteTesttaker.Attributes.Add("style", "display:block;");
                        icpteTesttaker.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PTE REGISTRATION NUMBER":
                        icpteregistrationno.Attributes.Add("style", "display:block;");
                        icpteregistrationno.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PTE TEST DATE":
                        icpteTestDate.Attributes.Add("style", "display:block;");
                        icpteTestDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PTE CENTER COUNTRY":
                        icptecountryt.Attributes.Add("style", "display:block;");
                        icptecountryt.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PTE CENTER NUMBER":
                        icptetestcenterNo.Attributes.Add("style", "display:block;");
                        icptetestcenterNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS READING":
                        icpteReadingScore.Attributes.Add("style", "display:block;");
                        icpteReadingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS LISTENING":
                        icpteListeningScore.Attributes.Add("style", "display:block;");
                        icpteListeningScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS SPEAKING":
                        icpteSpeakingScore.Attributes.Add("style", "display:block;");
                        icpteSpeakingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS WRITING":
                        icpteWritingScore.Attributes.Add("style", "display:block;");
                        icpteWritingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PTE TOTAL SCORE":
                        icpteTotalScore.Attributes.Add("style", "display:block;");
                        icpteTotalScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;



                    //tofel

                    case "TOFEL REGISTRATION NUMBER":
                        ictofelregistrationno.Attributes.Add("style", "display:block;");
                        ictofelregistrationno.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TOFEL TEST DATE":
                        ictofelTestDate.Attributes.Add("style", "display:block;");
                        ictofelTestDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TOFEL CENTER COUNTRY":
                        ictofelcentercountry.Attributes.Add("style", "display:block;");
                        ictofelcentercountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TOFEL CENTER NUMBER":
                        itofelcenterNo.Attributes.Add("style", "display:block;");
                        itofelcenterNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Reading iBT Scaled Score":
                        ictofelReadingScore.Attributes.Add("style", "display:block;");
                        ictofelReadingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Listening iBT Scaled Score":
                        ictofelListeningScore.Attributes.Add("style", "display:block;");
                        ictofelListeningScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Speaking iBT Scaled Score":
                        ictofelSpeakingScore.Attributes.Add("style", "display:block;");
                        ictofelSpeakingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Writing iBT Scaled Score":
                        ictofelWritingScore.Attributes.Add("style", "display:block;");
                        ictofelWritingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Total Score (iBT Scaled Score)":
                        ictofelTotalScore.Attributes.Add("style", "display:block;");
                        ictofelTotalScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;


                    case "CEFR LEVEL":
                        icCEFR.Attributes.Add("style", "display:block;");
                        icCEFR.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "TEST REPORT REFERENCE NO":
                        ictestRefno.Attributes.Add("style", "display:block;");
                        ictestRefno.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
                {
                    lblEnglishBackground.Text = "yes";
                    if (LanguageInfo.isfinalgradeachieved == 1)
                        lblgradeachieved.Text = "Results Declared";
                    else if (LanguageInfo.isfinalgradeachieved == 2)
                        lblgradeachieved.Text = "Examination not conducted yet";
                    else if (LanguageInfo.isfinalgradeachieved == 3)
                        lblgradeachieved.Text = "Examination Conducted, but Result not declared";
                    ExpectedDategrade.Attributes.Add("style","display:none");
                }
                else if (LanguageInfo.isenglishintesive == 2)
                {
                    lblEnglishBackground.Text = "No - I am currently still studying for my English Language Course";
                    if (LanguageInfo.expectedgraderesult != null)
                        lblExpectedDategrade.Text = Convert.ToDateTime(LanguageInfo.expectedgraderesult).ToString("yyyy-MM-dd");
                    gradeachieved.Attributes.Add("style", "display:none");
                }
                else if (LanguageInfo.isenglishintesive == 3)
                {
                    lblEnglishBackground.Text = "No - I have not studied an English Language Intensive Course for people from non-English speaking backgrounds";
                    Language.Attributes.Add("style", "display:none");
                    YearCompletion.Attributes.Add("style", "display:none");
                    NameCollege.Attributes.Add("style", "display:none");                    
                    studymode.Attributes.Add("style", "display:none");
                    QualificationType.Attributes.Add("style", "display:none");
                    QualificationName.Attributes.Add("style", "display:none");
                    gradetype.Attributes.Add("style", "display:none");
                    gradeachieved.Attributes.Add("style", "display:none");
                    ExpectedDategrade.Attributes.Add("style", "display:none");
                }

                if (LanguageInfo.isenglishintesive == 1 || LanguageInfo.isenglishintesive == 2)
                {
                    if (LanguageInfo.studymode != null)
                    {
                        lblstudymode.Text = objCom.GetStudyMode(Convert.ToInt32(LanguageInfo.studymode));
                    }
                    if (LanguageInfo.gradetype != null)
                    {
                        lblgradetype.Text = objCom.GetGrade(Convert.ToInt32(LanguageInfo.gradetype));
                    }
                    if (LanguageInfo.yearofcompletion != null)
                        lblYearCompletion.Text = Convert.ToDateTime(LanguageInfo.yearofcompletion).ToString("yyyy-MM-dd");
                    lblNameCollege.Text = LanguageInfo.instituename;
                    lblQualificationName.Text = LanguageInfo.qualificationname;
                    if (LanguageInfo.qualificationtype != null)
                    {
                        lblQualificationType.Text = objCom.GetGrade(Convert.ToInt32(LanguageInfo.qualificationtype));
                    }                        
                }                   

                if (LanguageInfo.giveenglishtest == 1)
                {
                    ieltsfieldContainer.Attributes.Add("style", "display:block");
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
                    ptefieldContainer.Attributes.Add("style","display : block");
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
                    tofelfieldContainer.Attributes.Add("style","display:block");
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
                    txthomelanguage.Value = setComments(Comments[k]);
                    break;
                case "Have you studied an English Language Intensive Course for students from non-English speaking backgrounds":
                    if (Comments[k].adminaction == 0)
                        rblEnglishBackgroundNo.Checked = true;
                    else
                        rblEnglishBackgroundYes.Checked = true;
                    txtEnglishBackground.Value = setComments(Comments[k]);
                    break;
                case "Country of English Language Intensive Course":
                    if (Comments[k].adminaction == 0)
                        rblLanguageNo.Checked = true;
                    else
                        rblLanguageYes.Checked = true;
                    txtLanguage.Value = setComments(Comments[k]);
                    break;
                case "Year of Completion/Expected":
                    if (Comments[k].adminaction == 0)
                        rblYearCompletionNo.Checked = true;
                    else
                        rblYearCompletionYes.Checked = true;
                    txtYearCompletion.Value = setComments(Comments[k]);
                    break;
                case "Name of College or University":
                    if (Comments[k].adminaction == 0)
                        rblNameCollegeYes.Checked = true;
                    else
                        rblNameCollegeNo.Checked = true;
                    txtNameCollege.Value = setComments(Comments[k]);
                    break;
                case "Mode of study":
                    if (Comments[k].adminaction == 0)
                        rblstudymodeNo.Checked = true;
                    else
                        rblstudymodeYes.Checked = true;
                    txtstudymode.Value = setComments(Comments[k]);
                    break;
                case "Qualification Type":
                    if (Comments[k].adminaction == 0)
                        rblQualificationTypeNo.Checked = true;
                    else
                        rblQualificationTypeYes.Checked = true;
                    txtQualificationType.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name":
                    if (Comments[k].adminaction == 0)
                        rblQualificationNameNo.Checked = true;
                    else
                        rblQualificationNameYes.Checked = true;
                    txtQualificationName.Value = setComments(Comments[k]);
                    break;
                case "Grade Type":
                    if (Comments[k].adminaction == 0)
                        rblgradetypeNo.Checked = true;
                    else
                        rblgradetypeYes.Checked = true;
                    txtgradetype.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved":
                    if (Comments[k].adminaction == 0)
                        rblgradeachievedNo.Checked = true;
                    else
                        rblgradeachievedYes.Checked = true;
                    txtgradeachieved.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared":
                    if (Comments[k].adminaction == 0)
                        rblExpectedDategradeNo.Checked = true;
                    else
                        rblExpectedDategradeYes.Checked = true;
                    txtExpectedDategrade.Value = setComments(Comments[k]);
                    break;
                case "Have you sat any one of the following English Language competency tests":
                    if (Comments[k].adminaction == 0)
                        rblEnglishTestNo.Checked = true;
                    else
                        rblEnglishTestYes.Checked = true;
                    txtEnglishTest.Value = setComments(Comments[k]);
                    break;
                case "Test Name":
                    if (Comments[k].adminaction == 0)
                        rbltestNameNo.Checked = true;
                    else
                        rbltestNameYes.Checked = true;
                    txttestName.Value = setComments(Comments[k]);
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
                    txtCentreNo.Value = setComments(Comments[k]);
                    txtptetestcenterNo.Value = setComments(Comments[k]);
                    txttofelcenterNo.Value = setComments(Comments[k]);
                    break;
                case "Candidate No":
                    if (Comments[k].adminaction == 0)
                        rblCandidateNoNo.Checked = true;
                    else
                        rblCandidateNoYes.Checked = true;
                    txtCandidateNo.Value = setComments(Comments[k]);
                    break;
                case "Candidate ID":
                    if (Comments[k].adminaction == 0)
                        rblCandidateIDNo.Checked = true;
                    else
                        rblCandidateIDYes.Checked = true;
                    txtCandidateID.Value = setComments(Comments[k]);
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
                    txtieltsTestDate.Value = setComments(Comments[k]);
                    txtpteTestDate.Value = setComments(Comments[k]);
                    txttofelTestDate.Value = setComments(Comments[k]);
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
                    txtLanguageScore.Value = setComments(Comments[k]);
                    txtpteTotalScore.Value = setComments(Comments[k]);
                    txttofelTotalScore.Value = setComments(Comments[k]);
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
                    txtSpeakingScore.Value = setComments(Comments[k]);
                    txtpteSpeakingScore.Value = setComments(Comments[k]);
                    txttofelSpeakingScore.Value = setComments(Comments[k]);
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
                    txtListeningScore.Value = setComments(Comments[k]);
                    txtpteListeningScore.Value = setComments(Comments[k]);
                    txttofelListeningScore.Value = setComments(Comments[k]);
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
                    txtReadingScore.Value = setComments(Comments[k]);
                    txtpteReadingScore.Value = setComments(Comments[k]);
                    txttofelReadingScore.Value = setComments(Comments[k]);
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
                    txtWritingScore.Value = setComments(Comments[k]);
                    txtpteWritingScore.Value = setComments(Comments[k]);
                    txttofelWritingScore.Value = setComments(Comments[k]);
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
                    txtpteregistrationno.Value = setComments(Comments[k]);
                    txttofelregistrationno.Value = setComments(Comments[k]);
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
                    txtptecentercountry.Value = setComments(Comments[k]);
                    txttofelcentercountry.Value = setComments(Comments[k]);
                    break;
                case "Test Taker ID":
                    txtptetesttaker.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblptetesttakerNo.Checked = true;
                    else
                        rblptetesttakerYes.Checked = true;
                    break;
                case "CEFR Level":
                    txtCEFR.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblCEFRNo.Checked = true;
                    else
                        rblCEFRYes.Checked = true;
                    break;
                case "Test Report Reference No":
                    txttestRefno.Value = setComments(Comments[k]);
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            if (homelanguage.Style.Value != "display: none")
                adminInputs.Add("What language do you speak at home", txthomelanguage.Value.Trim() + "~" + (rblhomelanguageNo.Checked == true ? 0 : 1));
            if (EnglishBackground.Style.Value != "display: none")
                adminInputs.Add("Have you studied an English Language Intensive Course for students from non-English speaking backgrounds", txtEnglishBackground.Value.Trim() + "~" + (rblEnglishBackgroundNo.Checked == true ? 0 : 1));
            if (Language.Style.Value != "display: none")
                adminInputs.Add("Country of English Language Intensive Course", txtLanguage.Value.Trim() + "~" + (rblLanguageNo.Checked == true ? 0 : 1));
            if (YearCompletion.Style.Value != "display: none")
                adminInputs.Add("Year of Completion/Expected", txtYearCompletion.Value.Trim() + "~" + (rblYearCompletionNo.Checked == true ? 0 : 1));
            if (NameCollege.Style.Value != "display: none")
                adminInputs.Add("Name of College or University", txtNameCollege.Value.Trim() + "~" + (rblNameCollegeNo.Checked == true ? 0 : 1));
            if (studymode.Style.Value != "display: none")
                adminInputs.Add("Mode of study", txtstudymode.Value.Trim() + "~" + (rblstudymodeNo.Checked == true ? 0 : 1));
            if (QualificationType.Style.Value != "display: none")
                adminInputs.Add("Qualification Type", txtQualificationType.Value.Trim() + "~" + (rblQualificationTypeNo.Checked == true ? 0 : 1));
            if (QualificationName.Style.Value != "display: none")
                adminInputs.Add("Qualification Name", txtQualificationName.Value.Trim() + "~" + (rblQualificationNameNo.Checked == true ? 0 : 1));
            if (gradetype.Style.Value != "display: none")
                adminInputs.Add("Grade Type", txtgradetype.Value.Trim() + "~" + (rblgradetypeNo.Checked == true ? 0 : 1));
            if (gradeachieved.Style.Value != "display: none")
                adminInputs.Add("Final Grade Achieved", txtgradeachieved.Value.Trim() + "~" + (rblgradeachievedNo.Checked == true ? 0 : 1));
            if (ExpectedDategrade.Style.Value != "display: none")
                adminInputs.Add("Expected dates when results will be declared", txtExpectedDategrade.Value.Trim() + "~" + (rblExpectedDategradeNo.Checked == true ? 0 : 1));
            if (EnglishTest.Style.Value != "display: none")
                adminInputs.Add("Have you sat any one of the following English Language competency tests", txtEnglishTest.Value.Trim() + "~" + (rblEnglishTestNo.Checked == true ? 0 : 1));
            if (testName.Style.Value != "display: none")
                adminInputs.Add("Test Name", txttestName.Value.Trim() + "~" + (rbltestNameNo.Checked == true ? 0 : 1));
            if (CentreNo.Style.Value != "display: none")
                adminInputs.Add("Centre No", txtCentreNo.Value.Trim() + "~" + (rblCentreNoNo.Checked == true ? 0 : 1));
            if (CandidateNo.Style.Value != "display: none")
                adminInputs.Add("Candidate No", txtCandidateNo.Value.Trim() + "~" + (rblCandidateNoNo.Checked == true ? 0 : 1));
            if (CandidateID.Style.Value != "display: none")
                adminInputs.Add("Candidate ID", txtCandidateID.Value.Trim() + "~" + (rblCandidateIDNo.Checked == true ? 0 : 1));
            if (ieltsTestDate.Style.Value != "display: none")
                adminInputs.Add("Test Date", txtieltsTestDate.Value.Trim() + "~" + (rblieltsTestDateNo.Checked == true ? 0 : 1));
            if (LanguageScore.Style.Value != "display: none")
                adminInputs.Add("Total Score", txtLanguageScore.Value.Trim() + "~" + (rblLanguageScoreNo.Checked == true ? 0 : 1));
            if (SpeakingScore.Style.Value != "display: none")
                adminInputs.Add("Speaking Score", txtSpeakingScore.Value.Trim() + "~" + (rblSpeakingScoreNo.Checked == true ? 0 : 1));
            if (ListeningScore.Style.Value != "display: none")
                adminInputs.Add("Listening Score", txtListeningScore.Value.Trim() + "~" + (rblListeningScoreNo.Checked == true ? 0 : 1));
            if (ReadingScore.Style.Value != "display: none")
                adminInputs.Add("Reading Score", txtReadingScore.Value.Trim() + "~" + (rblReadingScoreNo.Checked == true ? 0 : 1));
            if (WritingScore.Style.Value != "display: none")
                adminInputs.Add("Writing Score", txtWritingScore.Value.Trim() + "~" + (rblWritingScoreNo.Checked == true ? 0 : 1));

            if (ptetesttaker.Style.Value != "display: none")
                adminInputs.Add("Test Taker ID", txtptetesttaker.Value.Trim() + "~" + (rblptetesttakerNo.Checked == true ? 0 : 1));
            if (pteregistrationno.Style.Value != "display: none")
                adminInputs.Add("Registration Number", txtpteregistrationno.Value.Trim() + "~" + (rblpteregistrationnoNo.Checked == true ? 0 : 1));
            if (pteTestDate.Style.Value != "display: none")
                adminInputs.Add("Test Date", txtpteTestDate.Value.Trim() + "~" + (rblpteTestDateNo.Checked == true ? 0 : 1));
            if (ptecentercountry.Style.Value != "display: none")
                adminInputs.Add("Test Center Country", txtptecentercountry.Value.Trim() + "~" + (rblptecentercountryNo.Checked == true ? 0 : 1));
            if (ptetestcenterNo.Style.Value != "display: none")
                adminInputs.Add("Test Centre No", txtptetestcenterNo.Value.Trim() + "~" + (rblptetestcenterNoNo.Checked == true ? 0 : 1));
            if (pteTotalScore.Style.Value != "display: none")
                adminInputs.Add("Total Score", txtpteTotalScore.Value.Trim() + "~" + (rblpteTotalScoreNo.Checked == true ? 0 : 1));
            if (pteSpeakingScore.Style.Value != "display: none")
                adminInputs.Add("Speaking Score", txtpteSpeakingScore.Value.Trim() + "~" + (rblpteSpeakingScoreNo.Checked == true ? 0 : 1));
            if (pteListeningScore.Style.Value != "display: none")
                adminInputs.Add("Listening Score", txtpteListeningScore.Value.Trim() + "~" + (rblpteListeningScoreNo.Checked == true ? 0 : 1));
            if (pteReadingScore.Style.Value != "display: none")
                adminInputs.Add("Reading Score", txtpteReadingScore.Value.Trim() + "~" + (rblpteReadingScoreNo.Checked == true ? 0 : 1));
            if (pteWritingScore.Style.Value != "display: none")
                adminInputs.Add("Writing Score", txtpteWritingScore.Value.Trim() + "~" + (rblpteWritingScoreNo.Checked == true ? 0 : 1));
            if (tofelregistrationno.Style.Value != "display: none")
                adminInputs.Add("Registration Number", txttofelregistrationno.Value.Trim() + "~" + (rbltofelregistrationnoNo.Checked == true ? 0 : 1));
            if (tofelTestDate.Style.Value != "display: none")
                adminInputs.Add("Test Date", txttofelTestDate.Value.Trim() + "~" + (rbltofelTestDateNo.Checked == true ? 0 : 1));
            if (tofelcentercountry.Style.Value != "display: none")
                adminInputs.Add("Test Center Country", txttofelcentercountry.Value.Trim() + "~" + (rbltofelcentercountryNo.Checked == true ? 0 : 1));
            if (tofelcenterNo.Style.Value != "display: none")
                adminInputs.Add("Test Centre No", txttofelcenterNo.Value.Trim() + "~" + (rbltofelcenterNo.Checked == true ? 0 : 1));
            if (tofelTotalScore.Style.Value != "display: none")
                adminInputs.Add("Total Score", txttofelTotalScore.Value.Trim() + "~" + (rbltofelTotalScoreNo.Checked == true ? 0 : 1));
            if (tofelSpeakingScore.Style.Value != "display: none")
                adminInputs.Add("Speaking Score", txttofelSpeakingScore.Value.Trim() + "~" + (rbltofelSpeakingScoreNo.Checked == true ? 0 : 1));
            if (tofelListeningScore.Style.Value != "display: none")
                adminInputs.Add("Listening Score", txttofelListeningScore.Value.Trim() + "~" + (rbltofelListeningScoreNo.Checked == true ? 0 : 1));
            if (tofelReadingScore.Style.Value != "display: none")
                adminInputs.Add("Reading Score", txttofelReadingScore.Value.Trim() + "~" + (rbltofelReadingScoreNo.Checked == true ? 0 : 1));
            if (tofelWritingScore.Style.Value != "display: none")
                adminInputs.Add("Writing Score", txttofelWritingScore.Value.Trim() + "~" + (rbltofelWritingScoreNo.Checked == true ? 0 : 1));

            if (CEFR.Style.Value != "display: none")
                adminInputs.Add("CEFR Level", txtCEFR.Value.Trim() + "~" + (rblCEFRNo.Checked == true ? 0 : 1));
            if (testRefno.Style.Value != "display: none")
                adminInputs.Add("Test Report Reference No", txttestRefno.Value.Trim() + "~" + (rbltestRefnoNo.Checked == true ? 0 : 1));

            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminID, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}
