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
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    string webURL = String.Empty;
    bool? is_review = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !isDeclarationCompleted)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        CustomControls = objCom.CustomControlist(formId, universityID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        is_review = objCom.is_review(userID, universityID);
        if (is_review != null && is_review == true)
            btnlanguagecompetency.Visible = false;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlLanguage);
            objCom.BindCountries(ddlptecentercountry);
            objCom.BindCountries(ddltofelcentercountry);
            
            SetToolTips();
            BindGrade();
            BindStudyMode();
            BindCEFRLevel();
            BindHomeLanguage(ddlhomelanguage);
            BindQualificationType();
            PopulateLanguageDetails();
            SetControlsUniversitywise();
        }
    }

    private void BindHomeLanguage(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var medium = db.educationmediummaster.SortBy("description").ToList();
            ddl.DataSource = medium;
            ddl.DataTextField = "description";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
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
                    case "WHICH LANGUAGE DO YOU SPEAK AT HOME?":
                        homelanguage.Attributes.Add("style", "display:block;");
                        labelhomelanguage.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU STUDIED AN ELICOS COURSE?":
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
                    case "CEFR LEVEL":
                        CEFR.Attributes.Add("style", "display:block;");
                        labelCEFR.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST REPORT REFERENCE NUMBER":
                        testRefno.Attributes.Add("style", "display:block;");
                        labeltestRefno.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                        ExpectedDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedDategrade.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU TAKEN ANY ENGLISH LANGUAGE TEST?":
                        EnglishTest.Attributes.Add("style", "display:block;");
                        labelEnglishTest.InnerHtml = setInnerHtml(fields[k]);
                        break;

                        //IELTS
                    case "TEST NAME":
                        testName.Attributes.Add("style", "display:block;");
                        labeltestName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE NUMBER":
                        CandidateNo.Attributes.Add("style", "display:block;");
                        labelCandidateNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE ID":
                        CandidateID.Attributes.Add("style", "display:block;");
                        labelCandidateID.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CENTER NUMBER":
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
                  
                    case "COMMUNICATIVE SKILLS READING SCORE":
                        pteReadingScore.Attributes.Add("style", "display:block;");
                        labelpteReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS LISTENING SCORE":
                        pteListeningScore.Attributes.Add("style", "display:block;");
                        labelpteListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS SPEAKING SCORE":
                        pteSpeakingScore.Attributes.Add("style", "display:block;");
                        labelpteSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS WRITING SCORE":
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
                    case "WHICH LANGUAGE DO YOU SPEAK AT HOME?":
                        ichomelanguage.Attributes.Add("style", "display:block;");
                        ichomelanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HAVE YOU STUDIED AN ELICOS COURSE?":
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
                    case "HAVE YOU TAKEN ANY ENGLISH LANGUAGE TEST?":
                        icEnglishTest.Attributes.Add("style", "display:block;");
                        icEnglishTest.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                        // IELTS
                    case "TEST NAME":
                        ictestName.Attributes.Add("style", "display:block;");
                        ictestName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CANDIDATE NUMBER":
                        icCandidateNo.Attributes.Add("style", "display:block;");
                        icCandidateNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CANDIDATE ID":
                        icCandidateID.Attributes.Add("style", "display:block;");
                        icCandidateID.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CENTER NUMBER":
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
                    case "COMMUNICATIVE SKILLS READING SCORE":
                        icpteReadingScore.Attributes.Add("style", "display:block;");
                        icpteReadingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS LISTENING SCORE":
                        icpteListeningScore.Attributes.Add("style", "display:block;");
                        icpteListeningScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS SPEAKING SCORE":
                        icpteSpeakingScore.Attributes.Add("style", "display:block;");
                        icpteSpeakingScore.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COMMUNICATIVE SKILLS WRITING SCORE":
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
                    case "TEST REPORT REFERENCE NUMBER":
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
                //txthomelanguage.Value = LanguageInfo.homelanuage;
                if (LanguageInfo.homelanuage.HasValue)
                {
                    ddlhomelanguage.ClearSelection();
                    ddlhomelanguage.Items.FindByValue(LanguageInfo.homelanuage.ToString()).Selected = true;
                }

                if (LanguageInfo.isenglishintesive == 1)
                    rblEnglishBackgroundYes.Checked = true;
                else if (LanguageInfo.isenglishintesive == 2)
                    rblEnglishBackgroundNot.Checked = true;
                else if (LanguageInfo.isenglishintesive == 3)
                    rblEnglishBackgroundNo.Checked = true;                
                if (LanguageInfo.countryofcourse != null)
                {
                    ddlLanguage.ClearSelection();
                    ddlLanguage.Items.FindByValue(LanguageInfo.countryofcourse).Selected = true;
                }
                if(LanguageInfo.expectedgraderesult != null)
                    txtExpectedDategrade.Value = Convert.ToDateTime(LanguageInfo.expectedgraderesult).ToString("yyyy-MM-dd");

                txtNameCollege.Value = LanguageInfo.instituename;
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
                if (LanguageInfo.qualificationtype != null)
                {
                    ddlQualificationType.ClearSelection();
                    ddlQualificationType.Items.FindByValue(LanguageInfo.qualificationtype.ToString()).Selected = true;
                }
                if (LanguageInfo.isfinalgradeachieved == 1)
                    rblYes.Checked = true;
                else if (LanguageInfo.isfinalgradeachieved == 2)
                    rblYetToConduct.Checked = true;
                else if (LanguageInfo.isfinalgradeachieved == 3)
                    rblNot.Checked = true;
                if (LanguageInfo.yearofcompletion != null)
                    txtYearCompletion.Value = Convert.ToDateTime(LanguageInfo.yearofcompletion).ToString("yyyy-MM-dd");
                txtQualificationName.Value = LanguageInfo.qualificationname;

                if (LanguageInfo.isgiventest_yes_or_no == 1)
                {
                    rbyes.Checked = true;
                    if (LanguageInfo.giveenglishtest == 1)
                    {
                        rblLanguageielts.Checked = true;
                        txtTestName.Value = LanguageInfo.testname;
                        txtCentreNo.Value = LanguageInfo.centerno;
                        txtCandidateNo.Value = LanguageInfo.candidateno;
                        txtCandidateID.Value = LanguageInfo.candidateid;
                        if (LanguageInfo.examdate != null)
                            txtieltsTestDate.Value = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");

                        txtLanguageScore.Value = LanguageInfo.overallscore;
                        txtSpeaking.Value = LanguageInfo.speakingscore;
                        txtListening.Value = LanguageInfo.listeningscore;
                        txtWriting.Value = LanguageInfo.writingscore;
                        txtReading.Value = LanguageInfo.readingscore;

                    }

                    else if (LanguageInfo.giveenglishtest == 2)
                    {
                        rblLanguagepte.Checked = true;
                        txtptetesttaker.Value = LanguageInfo.testtakerId;
                        txtpteregistrationNo.Value = LanguageInfo.registrationNo;
                        txtptetestcenterNo.Value = LanguageInfo.centerno;
                        if (LanguageInfo.examdate != null)
                            txtpteTestDate.Value = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");
                        if (LanguageInfo.testcentercountrty != null)
                        {
                            ddlptecentercountry.ClearSelection();
                            ddlptecentercountry.Items.FindByValue(LanguageInfo.testcentercountrty.ToString()).Selected = true;
                        }

                        txtpteTotalScore.Value = LanguageInfo.overallscore;
                        txtpteSpeakingScore.Value = LanguageInfo.speakingscore;
                        txtpteListeningScore.Value = LanguageInfo.listeningscore;
                        txtpteWritingScore.Value = LanguageInfo.writingscore;
                        txtpteReadingScore.Value = LanguageInfo.readingscore;

                    }

                    else if (LanguageInfo.giveenglishtest == 3)
                    {
                        rblLanguagtofel.Checked = true;
                        txttofelregistrationno.Value = LanguageInfo.registrationNo;
                        txttofelcenterNo.Value = LanguageInfo.centerno;
                        if (LanguageInfo.examdate != null)
                            txttofelTestDate.Value = Convert.ToDateTime(LanguageInfo.examdate).ToString("yyyy-MM-dd");
                        if (LanguageInfo.testcentercountrty != null)
                        {
                            ddltofelcentercountry.ClearSelection();
                            ddltofelcentercountry.Items.FindByValue(LanguageInfo.testcentercountrty.ToString()).Selected = true;
                        }

                        txttofelTotalScore.Value = LanguageInfo.overallscore;
                        txttofelSpeakingScore.Value = LanguageInfo.speakingscore;
                        txttofelListeningScore.Value = LanguageInfo.listeningscore;
                        txttofelWritingScore.Value = LanguageInfo.writingscore;
                        txttofelReadingScore.Value = LanguageInfo.readingscore;
                    }
                }
                else if (LanguageInfo.isgiventest_yes_or_no == 0)
                {
                    rbno.Checked = true;
                    txttestRefno.Value = LanguageInfo.testreportreferenceno;
                    if (LanguageInfo.cefrlevel != null)
                    {
                        ddlCEFR.ClearSelection();
                        ddlCEFR.Items.FindByValue(LanguageInfo.cefrlevel.ToString()).Selected = true;
                    }
                }
                lblSaveTime.Text = " Record was last saved at " + LanguageInfo.lastsavedtime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SaveLanguageDetails()
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
            //objLanguage.homelanuage = txthomelanguage.Value;
            if (ddlhomelanguage.SelectedValue != "")
                objLanguage.homelanuage = Convert.ToInt32(ddlhomelanguage.SelectedValue);

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

            if (rbyes.Checked)
            {
                objLanguage.isgiventest_yes_or_no = 1;
                if (rblLanguageielts.Checked)
                {
                    objLanguage.giveenglishtest = 1;
                    objLanguage.testname = txtTestName.Value;
                    objLanguage.candidateid = txtCandidateID.Value;
                    objLanguage.candidateno = txtCandidateNo.Value;
                    objLanguage.centerno = txtCentreNo.Value;
                    objLanguage.examdate = Convert.ToDateTime(txtieltsTestDate.Value);

                    objLanguage.readingscore = txtReading.Value;
                    objLanguage.listeningscore = txtListening.Value;
                    objLanguage.speakingscore = txtSpeaking.Value;
                    objLanguage.writingscore = txtWriting.Value;
                    objLanguage.overallscore = txtLanguageScore.Value;

                    objLanguage.testtakerId = null;
                    objLanguage.registrationNo = null;
                }

                else if (rblLanguagepte.Checked)
                {
                    objLanguage.giveenglishtest = 2;
                    objLanguage.testtakerId = txtptetesttaker.Value;
                    objLanguage.registrationNo = txtpteregistrationNo.Value;
                    objLanguage.examdate = Convert.ToDateTime(txtpteTestDate.Value);
                    if (ddlptecentercountry.SelectedValue != null)
                        objLanguage.testcentercountrty = Convert.ToInt32(ddlptecentercountry.SelectedValue);
                    objLanguage.centerno = txtptetestcenterNo.Value;

                    objLanguage.readingscore = txtpteReadingScore.Value;
                    objLanguage.listeningscore = txtpteListeningScore.Value;
                    objLanguage.speakingscore = txtpteSpeakingScore.Value;
                    objLanguage.writingscore = txtpteWritingScore.Value;
                    objLanguage.overallscore = txtpteTotalScore.Value;

                    objLanguage.testname = null;
                    objLanguage.candidateid = null;
                    objLanguage.candidateno = null;

                }

                else if (rblLanguagtofel.Checked)
                {
                    objLanguage.giveenglishtest = 3;
                    objLanguage.registrationNo = txttofelregistrationno.Value;
                    objLanguage.examdate = Convert.ToDateTime(txttofelTestDate.Value);
                    if (ddltofelcentercountry.SelectedValue != null)
                        objLanguage.testcentercountrty = Convert.ToInt32(ddltofelcentercountry.SelectedValue);
                    objLanguage.centerno = txttofelcenterNo.Value;

                    objLanguage.readingscore = txttofelReadingScore.Value;
                    objLanguage.listeningscore = txttofelListeningScore.Value;
                    objLanguage.speakingscore = txttofelSpeakingScore.Value;
                    objLanguage.writingscore = txttofelWritingScore.Value;
                    objLanguage.overallscore = txttofelTotalScore.Value;

                    objLanguage.testtakerId = null;
                    objLanguage.testname = null;
                    objLanguage.candidateid = null;
                    objLanguage.candidateno = null;


                }

                objLanguage.cefrlevel = null;
                objLanguage.testreportreferenceno = null;
            }
            else if(rbno.Checked)
            {
                objLanguage.isgiventest_yes_or_no = 0;
                if (ddlCEFR.SelectedValue != "")
                {
                    objLanguage.cefrlevel = ddlCEFR.SelectedValue;
                }
                objLanguage.testreportreferenceno = txttestRefno.Value;

                //set to null
                objLanguage.giveenglishtest = null;
                objLanguage.testname = null;
                objLanguage.candidateid = null;
                objLanguage.candidateno = null;
                objLanguage.centerno = null;
                objLanguage.examdate = null;
                objLanguage.testtakerId = null;
                objLanguage.registrationNo = null;                
                objLanguage.testcentercountrty = null;
                objLanguage.readingscore = null;
                objLanguage.listeningscore = null;
                objLanguage.speakingscore = null;
                objLanguage.writingscore = null;
                objLanguage.overallscore = null;

            }            
            objLanguage.applicantid = userID;
            objLanguage.lastsavedtime = DateTime.Now;
            objLanguage.islanguagecompetencypresent = true;
            objLanguage.universityid = universityID;

            if (mode == "new")
                db.applicantlanguagecompetency.Add(objLanguage);
            db.SaveChanges();
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetStudentDetailsCompletedStatus(userID, universityID);
            lblMessage.Text = "Your Contact Details have been saved";
            //          lblMessage.Visible = true;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btnlanguagecompetency_Click(object sender, EventArgs e)
    {
        SaveLanguageDetails();
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        if (is_review != null && is_review == true)
            Response.Redirect(webURL + "applicantworkexperience.aspx?formid=7", true);
        else
        {
            SaveLanguageDetails();
            Response.Redirect(webURL + "applicantworkexperience.aspx?formid=7", true);
        }
    }
}

