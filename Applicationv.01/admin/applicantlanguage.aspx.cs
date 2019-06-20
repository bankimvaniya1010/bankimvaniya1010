using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantlanguage : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected int isStudyBefore = 0, isApplyBefore = 0;

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();


    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
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
            userID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, userID, CustomControls, mainDiv);
            SetControlsUniversitywise();
            SetToolTips();

            PopulateLanguageDetails();
           
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

    private void PopulateLanguageDetails()
    {
        try
        {
            var LanguageInfo = (from pInfo in db.applicantlanguagecompetency
                                where pInfo.applicantid == userID && pInfo.universityid == universityID
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


}
