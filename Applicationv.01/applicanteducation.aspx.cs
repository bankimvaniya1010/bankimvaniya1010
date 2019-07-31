using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Validation;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicanteducation : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();

    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (Session["LoginInfo"] == null)
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
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlCountryHighSchool);
            objCom.BindCountries(ddlDiplomaCountry);
            objCom.BindCountries(ddlHigherCountry);
            objCom.BindCountries(ddlSecondaryCountry);
            BindrelationswithContact(ddlHighSchoolVerificationRelationship);
            BindrelationswithContact(ddlSecondaryVerificationRelationship);
            BindrelationswithContact(ddlHigherVerificationRelationship);
            BindrelationswithContact(ddlDiplomaVerificationRelationship);
            FillMonth(ddlHighSchoolStartDateMonth);
            FillMonth(ddlHighSchoolEndDateMonth);
            FillMonth(ddlSecondaryStartDateMonth);
            FillMonth(ddlSecondaryEndDateMonth);
            FillMonth(ddlHigherStartDateMonth);
            FillMonth(ddlHigherEndDateMonth);
            FillMonth(ddlDiplomaStartDateMonth);
            FillMonth(ddlDiplomaEndDateMonth);

            FillYears(ddlHighSchoolStartDateYear);
            FillYears(ddlHighSchoolEndDateYear);
            FillYears(ddlSecondaryStartDateYear);
            FillYears(ddlSecondaryEndDateYear);
            FillYears(ddlHigherStartDateYear);
            FillYears(ddlHigherEndDateYear);
            FillYears(ddlDiplomaStartDateYear);
            FillYears(ddlDiplomaEndDateYear);

            SetToolTips();
            BindStudyMode(ddlHighSchoolStudyMode);
            BindStudyMode(ddlSecondaryStudyMode);
            BindStudyMode(ddlHigherStudyMode);
            BindStudyMode(ddlDiplomaStudyMode);
            BindGrade(ddlHighSchoolGrade);
            BindGrade(ddlSecondaryGrade);
            BindGrade(ddlHigherGrade);
            BindGrade(ddlDiplomaGrade);
            BindEducationMedium(ddlHighschoolMedium);
            BindEducationMedium(ddlHigherMedium);
            BindEducationMedium(ddlSecondaryMedium);
            BindEducationMedium(ddlDiplomaMedium);
            EducationDetails();
            bind10grade();
            bindSecondarygrade();
            binddiplomagrade();
            bindhighergrade();
            bindhigherCourses();
            SetControlsUniversitywise();
        }
    }
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname + " * " : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ") * ";
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
                    case "HAVE YOU COMPLETED HIGH SCHOOL":
                        highschool.Attributes.Add("style", "display:block;");
                        labelhighschool.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF HIGH SCHOOL EDUCATION":
                        highschoolCountry.Attributes.Add("style", "display:block;");
                        labelhighschoolCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "START DATE":
                        highschoolstartDate.Attributes.Add("style", "display:block;");
                        labelhighschoolstartDate.InnerHtml = setInnerHtml(fields[k]);
                        SecondarystartDate.Attributes.Add("style", "display:block;");
                        labelSecondarystartDate.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDate.Attributes.Add("style", "display:block;");
                        labelhigherstartDate.InnerHtml = setInnerHtml(fields[k]);
                        diplomastartDate.Attributes.Add("style", "display:block;");
                        labeldiplomastartDate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "END DATE":
                        highschoolendDate.Attributes.Add("style", "display:block;");
                        labelhighschoolendDate.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryendDate.Attributes.Add("style", "display:block;");
                        labelSecondaryendDate.InnerHtml = setInnerHtml(fields[k]);
                        higherendDate.Attributes.Add("style", "display:block;");
                        labelhigherendDate.InnerHtml = setInnerHtml(fields[k]);
                        diplomaendDate.Attributes.Add("style", "display:block;");
                        labeldiplomaendDate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF SCHOOL":
                        highschoolName.Attributes.Add("style", "display:block;");
                        labelhighschoolName.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryschoolName.Attributes.Add("style", "display:block;");
                        labelSecondaryschoolName.InnerHtml = setInnerHtml(fields[k]);
                        higherschoolName.Attributes.Add("style", "display:block;");
                        labelhigherschoolName.InnerHtml = setInnerHtml(fields[k]);
                        diplomaschoolName.Attributes.Add("style", "display:block;");
                        labeldiplomaschoolName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "QUALIFICATION TYPE":
                        highschoolQualificationtype.Attributes.Add("style", "display:block;");
                        labelhighschoolQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryQualificationtype.Attributes.Add("style", "display:block;");
                        labelSecondaryQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtype.Attributes.Add("style", "display:block;");
                        labelhigherQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        diplomaQualificationtype.Attributes.Add("style", "display:block;");
                        labeldiplomaQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "MODE OF STUDY":
                        highschoolstudymode.Attributes.Add("style", "display:block;");
                        labelhighschoolstudymode.InnerHtml = setInnerHtml(fields[k]);
                        Secondarystudymode.Attributes.Add("style", "display:block;");
                        labelSecondarystudymode.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymode.Attributes.Add("style", "display:block;");
                        labelhigherstudymode.InnerHtml = setInnerHtml(fields[k]);
                        diplomastudymode.Attributes.Add("style", "display:block;");
                        labeldiplomastudymode.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LANGUAGE (MEDIUM) OF STUDY":
                        highschoollanguage.Attributes.Add("style", "display:block;");
                        labelhighschoollanguage.InnerHtml = setInnerHtml(fields[k]);
                        Secondarylanguage.Attributes.Add("style", "display:block;");
                        labelSecondarylanguage.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguage.Attributes.Add("style", "display:block;");
                        labelhigherlanguage.InnerHtml = setInnerHtml(fields[k]);
                        diplomalanguage.Attributes.Add("style", "display:block;");
                        labeldiplomalanguage.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GRADE TYPE":
                        gradetype.Attributes.Add("style", "display:block;");
                        labelgradetype.InnerHtml = setInnerHtml(fields[k]);
                        Secondarygradetype.Attributes.Add("style", "display:block;");
                        labelSecondarygradetype.InnerHtml = setInnerHtml(fields[k]);
                        highergradetype.Attributes.Add("style", "display:block;");
                        labelhighergradetype.InnerHtml = setInnerHtml(fields[k]);
                        diplomagradetype.Attributes.Add("style", "display:block;");
                        labeldiplomagradetype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FINAL GRADE ACHIEVED":
                        highschoolgradeachieved.Attributes.Add("style", "display:block;");
                        labelgradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        Secondarygradeachieved.Attributes.Add("style", "display:block;");
                        labelSecondarygradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachieved.Attributes.Add("style", "display:block;");
                        labelhighergradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        diplomagradeachieved.Attributes.Add("style", "display:block;");
                        labeldiplomagradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                        ExpectedHighSchoolDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedHighSchoolDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedSecondaryDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedSecondaryDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedHigherDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedHigherDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedDiplomaDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedDiplomaDategrade.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                        highschoolverify.Attributes.Add("style", "display:block;");
                        labelhighschoolverify.InnerHtml = setInnerHtml(fields[k]);
                        Secondaryverify.Attributes.Add("style", "display:block;");
                        labelSecondaryverify.InnerHtml = setInnerHtml(fields[k]);
                        higherverify.Attributes.Add("style", "display:block;");
                        labelhigherverify.InnerHtml = setInnerHtml(fields[k]);
                        diplomaverify.Attributes.Add("style", "display:block;");
                        labeldiplomaverify.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        highschoolrelation.Attributes.Add("style", "display:block;");
                        labelhighschoolrelation.InnerHtml = setInnerHtml(fields[k]);
                        secondaryschoolrelation.Attributes.Add("style", "display:block;");
                        labelsecondaryschoolrelation.InnerHtml = setInnerHtml(fields[k]);
                        higherrelation.Attributes.Add("style", "display:block;");
                        labelhigherrelation.InnerHtml = setInnerHtml(fields[k]);
                        diplomarelation.Attributes.Add("style", "display:block;");
                        labeldiplomarelation.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactEmail.Attributes.Add("style", "display:block;");
                        labelhighschoolcontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        secondarycontactEmail.Attributes.Add("style", "display:block;");
                        labelsecondarycontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmail.Attributes.Add("style", "display:block;");
                        labelhighercontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        diplomacontactEmail.Attributes.Add("style", "display:block;");
                        labeldiplomacontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactMobile.Attributes.Add("style", "display:block;");
                        labelhighschoolcontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        secondarycontactMobile.Attributes.Add("style", "display:block;");
                        labelsecondarycontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobile.Attributes.Add("style", "display:block;");
                        labelhighercontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        diplomacontactMobile.Attributes.Add("style", "display:block;");
                        labeldiplomacontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HIGHEST EDUCATION":
                        higestEducation.Attributes.Add("style", "display:block;");
                        labelhigestEducation.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL? (YEAR 12)":
                        Secondary.Attributes.Add("style", "display:block;");
                        labelSecondary.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF SECONDARY EDUCATION":
                        SecondaryCountry.Attributes.Add("style", "display:block;");
                        labelSecondaryCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Add Subject and their Grades":
                        highshoolgrade.Attributes.Add("style", "display:block;");
                        btn10th.Value = setInnerHtml(fields[k]);
                        secondarygrade.Attributes.Add("style", "display:block;");
                        btn12th.Value = setInnerHtml(fields[k]);
                        highergrade.Attributes.Add("style", "display:block;");
                        btnhigher.Value = setInnerHtml(fields[k]);
                        diplomagrade.Attributes.Add("style", "display:block;");
                        btndiploma.Value = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU COMPLETED ANY HIGHER (UNDER GRADUATE, MASTERS OR PHD) DEGREE":
                        higher.Attributes.Add("style", "display:block;");
                        labelhigher.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Add Another Higher Qualification":
                        addanother.Attributes.Add("style", "display:block;");
                        btnAddanother.Text = setInnerHtml(fields[k]);
                        break;

                    case "HIGHER COURSE":
                        highercourse.Attributes.Add("style", "display:block;");
                        labelhighercourse.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of Higher Education":
                        higherCountry.Attributes.Add("style", "display:block;");
                        labelhigherCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU COMPLETED ANY DIPLOMA OR CERTIFICATE PROGRAMS":
                        diploma.Attributes.Add("style", "display:block;");
                        labeldiploma.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF DIPLOMA OR CERTIFICATE PROGRAMS":
                        diplomaCountry.Attributes.Add("style", "display:block;");
                        labeldiplomaCountry.InnerHtml = setInnerHtml(fields[k]);
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
                    case "HAVE YOU COMPLETED HIGH SCHOOL":
                        ichighschool.Attributes.Add("style", "display:block;");
                        ichighschool.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF HIGH SCHOOL EDUCATION":
                        ichighschoolCountry.Attributes.Add("style", "display:block;");
                        ichighschoolCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "START DATE":
                        ichighschoolstartDate.Attributes.Add("style", "display:block;");
                        ichighschoolstartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarystartDate.Attributes.Add("style", "display:block;");
                        icSecondarystartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstartDate.Attributes.Add("style", "display:block;");
                        ichigherstartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomastartDate.Attributes.Add("style", "display:block;");
                        icdiplomastartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "END DATE":
                        ichighschoolendDate.Attributes.Add("style", "display:block;");
                        ichighschoolendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryendDate.Attributes.Add("style", "display:block;");
                        icSecondaryendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherendDate.Attributes.Add("style", "display:block;");
                        ichigherendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaendDate.Attributes.Add("style", "display:block;");
                        icdiplomaendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF SCHOOL":
                        ichighschoolName.Attributes.Add("style", "display:block;");
                        ichighschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryschoolName.Attributes.Add("style", "display:block;");
                        icSecondaryschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherschoolName.Attributes.Add("style", "display:block;");
                        ichigherschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaschoolName.Attributes.Add("style", "display:block;");
                        icdiplomaschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "QUALIFICATION TYPE":
                        ichighschoolQualificationtype.Attributes.Add("style", "display:block;");
                        ichighschoolQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryQualificationtype.Attributes.Add("style", "display:block;");
                        icSecondaryQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherQualificationtype.Attributes.Add("style", "display:block;");
                        ichigherQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaQualificationtype.Attributes.Add("style", "display:block;");
                        icdiplomaQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;

                    case "MODE OF STUDY":
                        ichighschoolstudymode.Attributes.Add("style", "display:block;");
                        ichighschoolstudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarystudymode.Attributes.Add("style", "display:block;");
                        icSecondarystudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstudymode.Attributes.Add("style", "display:block;");
                        ichigherstudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomastudymode.Attributes.Add("style", "display:block;");
                        icdiplomastudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LANGUAGE (MEDIUM) OF STUDY":
                        ichighschoollanguage.Attributes.Add("style", "display:block;");
                        ichighschoollanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarylanguage.Attributes.Add("style", "display:block;");
                        icSecondarylanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherlanguage.Attributes.Add("style", "display:block;");
                        ichigherlanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomalanguage.Attributes.Add("style", "display:block;");
                        icdiplomalanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "GRADE TYPE":
                        icgradetype.Attributes.Add("style", "display:block;");
                        icgradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarygradetype.Attributes.Add("style", "display:block;");
                        icSecondarygradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradetype.Attributes.Add("style", "display:block;");
                        ichighergradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomagradetype.Attributes.Add("style", "display:block;");
                        icdiplomagradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "FINAL GRADE ACHIEVED":
                        ichighschoolgradeachieved.Attributes.Add("style", "display:block;");
                        ichighschoolgradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarygradeachieved.Attributes.Add("style", "display:block;");
                        icSecondarygradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradeachieved.Attributes.Add("style", "display:block;");
                        ichighergradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomagradeachieved.Attributes.Add("style", "display:block;");
                        icdiplomagradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                        icExpectedHighSchoolDategrade.Attributes.Add("style", "display:block;");
                        icExpectedHighSchoolDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedSecondaryDategrade.Attributes.Add("style", "display:block;");
                        icExpectedSecondaryDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedHigherDategrade.Attributes.Add("style", "display:block;");
                        icExpectedHigherDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedDiplomaDategrade.Attributes.Add("style", "display:block;");
                        icExpectedDiplomaDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                        ichighschoolverify.Attributes.Add("style", "display:block;");
                        ichighschoolverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryverify.Attributes.Add("style", "display:block;");
                        icSecondaryverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherverify.Attributes.Add("style", "display:block;");
                        ichigherverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaverify.Attributes.Add("style", "display:block;");
                        icdiplomaverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        ichighschoolrelation.Attributes.Add("style", "display:block;");
                        ichighschoolrelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icsecondaryschoolrelation.Attributes.Add("style", "display:block;");
                        icsecondaryschoolrelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherrelation.Attributes.Add("style", "display:block;");
                        ichigherrelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomarelation.Attributes.Add("style", "display:block;");
                        icdiplomarelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        ichighschoolcontactEmail.Attributes.Add("style", "display:block;");
                        ichighschoolcontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icsecondarycontactEmail.Attributes.Add("style", "display:block;");
                        icsecondarycontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactEmail.Attributes.Add("style", "display:block;");
                        ichighercontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomacontactEmail.Attributes.Add("style", "display:block;");
                        icdiplomacontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        ichighschoolcontactMobile.Attributes.Add("style", "display:block;");
                        ichighschoolcontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icsecondarycontactMobile.Attributes.Add("style", "display:block;");
                        icsecondarycontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactMobile.Attributes.Add("style", "display:block;");
                        ichighercontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomacontactMobile.Attributes.Add("style", "display:block;");
                        icdiplomacontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HIGHEST EDUCATION":
                        ichigestEducation.Attributes.Add("style", "display:block;");
                        ichigestEducation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL? (YEAR 12)":
                        icSecondary.Attributes.Add("style", "display:block;");
                        icSecondary.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF SECONDARY EDUCATION":
                        icSecondaryCountry.Attributes.Add("style", "display:block;");
                        icSecondaryCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HAVE YOU COMPLETED ANY HIGHER (UNDER GRADUATE, MASTERS OR PHD) DEGREE":
                        ichigher.Attributes.Add("style", "display:block;");
                        ichigher.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HIGHER COURSE":
                        ichighercourse.Attributes.Add("style", "display:block;");
                        ichighercourse.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Country of Higher Education":
                        ichigherCountry.Attributes.Add("style", "display:block;");
                        ichigherCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HAVE YOU COMPLETED ANY DIPLOMA OR CERTIFICATE PROGRAMS":
                        icdiploma.Attributes.Add("style", "display:block;");
                        icdiploma.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF DIPLOMA OR CERTIFICATE PROGRAMS":
                        icdiplomaCountry.Attributes.Add("style", "display:block;");
                        icdiplomaCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
    private void BindStudyMode(DropDownList ddl)
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

            ddl.DataSource = studymode;
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

    private void BindGrade(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddl.DataSource = grade;
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
    private void BindrelationswithContact(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.educationverificationcontactmaster.ToList();
            ddl.DataSource = grade;
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
    private void BindEducationMedium(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var medium = db.educationmediummaster.ToList();
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

    private void EducationDetails()
    {
        try
        {
            var EducationInfo = (from pInfo in db.applicanteducationdetails
                                 where pInfo.applicantid == userID && pInfo.universityid == universityID
                                 select pInfo).FirstOrDefault();
            if (EducationInfo != null)
            {
                if (EducationInfo.ishighschooldone == 1)
                    rblHighYes.Checked = true;
                else if (EducationInfo.ishighschooldone == 2)
                    rblHighNo.Checked = true;
                else
                    rblHighNot.Checked = true;
                if (EducationInfo.highschoolcountry != null)
                {
                    ddlCountryHighSchool.ClearSelection();
                    ddlCountryHighSchool.Items.FindByValue(Convert.ToString(EducationInfo.highschoolcountry)).Selected = true;
                    bindQualification(ddlHighSchoolQualificationType, Convert.ToInt32(EducationInfo.highschoolcountry));
                }

                if (EducationInfo.highschoolstartdate != null)
                {

                    string[] HighschoolStartDate = EducationInfo.highschoolstartdate.ToString().Split('-');
                    ddlHighSchoolStartDateMonth.ClearSelection();
                    ddlHighSchoolStartDateMonth.Items.FindByValue(Convert.ToString(HighschoolStartDate[0])).Selected = true;
                    ddlHighSchoolStartDateYear.ClearSelection();
                    ddlHighSchoolStartDateYear.Items.FindByValue(Convert.ToString(HighschoolStartDate[1])).Selected = true;
                }
                if (EducationInfo.highschoolendate != null)
                {
                    string[] HighschoolEndDate = EducationInfo.highschoolendate.ToString().Split('-');
                    ddlHighSchoolEndDateMonth.ClearSelection();
                    ddlHighSchoolEndDateMonth.Items.FindByValue(Convert.ToString(HighschoolEndDate[0])).Selected = true;
                    ddlHighSchoolEndDateYear.ClearSelection();
                    ddlHighSchoolEndDateYear.Items.FindByValue(Convert.ToString(HighschoolEndDate[1])).Selected = true;
                }


                txthighschoolName.Value = EducationInfo.highschoolname;

                if (EducationInfo.highschoolqualificationtype != null)
                {
                    ddlHighSchoolQualificationType.ClearSelection();
                    ddlHighSchoolQualificationType.Items.FindByValue(EducationInfo.highschoolqualificationtype.ToString()).Selected = true;
                }
                if (EducationInfo.highschoolmodeid != null)
                {
                    ddlHighSchoolStudyMode.ClearSelection();
                    ddlHighSchoolStudyMode.Items.FindByValue(EducationInfo.highschoolmodeid.ToString()).Selected = true;
                }

                if (EducationInfo.highschoolmediumid != null)
                {
                    ddlHighschoolMedium.ClearSelection();
                    ddlHighschoolMedium.Items.FindByValue(EducationInfo.highschoolmediumid.ToString()).Selected = true;
                }
                if (EducationInfo.highschoolgradetypeid != null)
                {
                    ddlHighSchoolGrade.ClearSelection();
                    ddlHighSchoolGrade.Items.FindByValue(EducationInfo.highschoolgradetypeid.ToString()).Selected = true;
                }

                if (EducationInfo.highschoolgradedeclared == 1)
                    rblYes.Checked = true;
                else if (EducationInfo.highschoolgradedeclared == 2)
                    rblYetToConduct.Checked = true;
                else
                    rblNot.Checked = true;
                if (EducationInfo.highschoolreusltdate != null)
                    txtExpectedHighSchoolResult.Value = Convert.ToDateTime(EducationInfo.highschoolreusltdate).ToString("yyyy-MM-dd");
                txtHighSchoolVerificationName.Value = EducationInfo.highschoolverificationname;

                if (EducationInfo.highschoolverificationrelationship != null)
                {
                    ddlHighSchoolVerificationRelationship.ClearSelection();
                    ddlHighSchoolVerificationRelationship.Items.FindByValue(EducationInfo.highschoolverificationrelationship.ToString()).Selected = true;
                }


                txtHighSchoolcontactEmail.Value = EducationInfo.highschoolverificationemail;
                txtHighSchoolcontactMobile.Value = EducationInfo.highschoolverificationmobile;
                txtHigestEducation.Value = EducationInfo.highestdegree;
                /// High School Details End-----

                /// Secondary Details
                /// 
                if (EducationInfo.issecondarydone == 1)
                    rblSecondaryYes.Checked = true;
                else if (EducationInfo.issecondarydone == 2)
                    rblSecondaryNo.Checked = true;
                else
                    rblSecondaryNot.Checked = true;
                if (EducationInfo.secondarycountry != null)
                {
                    ddlSecondaryCountry.ClearSelection();
                    ddlSecondaryCountry.Items.FindByValue(Convert.ToString(EducationInfo.secondarycountry)).Selected = true;
                    bindQualification(ddlSecondaryQualificationType, Convert.ToInt32(EducationInfo.secondarycountry));
                }
                if (EducationInfo.secondaryresultdate != null)
                    txtExpectedSecondaryResult.Value = Convert.ToDateTime(EducationInfo.secondaryresultdate).ToString("yyyy-MM-dd");
                if (EducationInfo.secondarystartdate != null)
                {
                    string[] SecondaryStartDate = EducationInfo.secondarystartdate.ToString().Split('-');
                    ddlSecondaryStartDateMonth.ClearSelection();
                    ddlSecondaryStartDateMonth.Items.FindByValue(Convert.ToString(SecondaryStartDate[0])).Selected = true;
                    ddlSecondaryStartDateYear.ClearSelection();
                    ddlSecondaryStartDateYear.Items.FindByValue(Convert.ToString(SecondaryStartDate[1])).Selected = true;
                }
                if (EducationInfo.secondaryendate != null)
                {
                    string[] SecondaryEndDate = EducationInfo.secondaryendate.ToString().Split('-');
                    ddlSecondaryEndDateMonth.ClearSelection();
                    ddlSecondaryEndDateMonth.Items.FindByValue(Convert.ToString(SecondaryEndDate[0])).Selected = true;
                    ddlSecondaryEndDateYear.ClearSelection();
                    ddlSecondaryEndDateYear.Items.FindByValue(Convert.ToString(SecondaryEndDate[1])).Selected = true;
                }

                txtSecondarySchoolName.Value = EducationInfo.secondaryname;

                if (EducationInfo.secondaryqualificationtype != null)
                {
                    ddlSecondaryQualificationType.ClearSelection();
                    ddlSecondaryQualificationType.Items.FindByValue(EducationInfo.secondaryqualificationtype.ToString()).Selected = true;
                }
                if (EducationInfo.secondarymodestudy != null)
                {
                    ddlSecondaryStudyMode.ClearSelection();
                    ddlSecondaryStudyMode.Items.FindByValue(EducationInfo.secondarymodestudy.ToString()).Selected = true;
                }
                if (EducationInfo.secondarymediumstudy != null)
                {
                    ddlSecondaryMedium.ClearSelection();
                    ddlSecondaryMedium.Items.FindByValue(EducationInfo.secondarymediumstudy.ToString()).Selected = true;
                }
                if (EducationInfo.secondarygradetypeid != null)
                {
                    ddlSecondaryGrade.ClearSelection();
                    ddlSecondaryGrade.Items.FindByValue(EducationInfo.secondarygradetypeid.ToString()).Selected = true;
                }
                if (EducationInfo.secondarygradedeclared == 1)
                    rblSecondarygradeachievedYes.Checked = true;
                else if (EducationInfo.secondarygradedeclared == 2)
                    SecondarygradeachievedYet.Checked = true;
                else
                    SecondarygradeachievedNo.Checked = true;


                txtSecondaryVerificationName.Value = EducationInfo.secondaryverificationname;
                if (EducationInfo.secondaryverificationrelationship != null)
                {
                    ddlSecondaryVerificationRelationship.ClearSelection();
                    ddlSecondaryVerificationRelationship.Items.FindByValue(EducationInfo.secondaryverificationrelationship.ToString()).Selected = true;
                }


                txtSecondarycontactEmail.Value = EducationInfo.secondaryverificationemail;
                txtSecondarycontactMobile.Value = EducationInfo.secondaryverificationmobile;

                /// Secondary Details End-----
                /// Diploma
                /// 
                if (EducationInfo.isdiplomadone == 1)
                    rbldiplomaYes.Checked = true;
                else if (EducationInfo.isdiplomadone == 2)
                    rbldiplomaNo.Checked = true;

                else
                    rbldiplomaNot.Checked = true;
                if (EducationInfo.diplomacountry != null)
                {
                    ddlDiplomaCountry.ClearSelection();
                    ddlDiplomaCountry.Items.FindByValue(Convert.ToString(EducationInfo.diplomacountry)).Selected = true;
                    bindQualification(ddlDiplomaQualificationType, Convert.ToInt32(EducationInfo.diplomacountry));
                }
                if (EducationInfo.diplomastartdate != null)
                {
                    string[] DiplomaStartDate = EducationInfo.diplomastartdate.ToString().Split('-');
                    ddlDiplomaStartDateMonth.ClearSelection();
                    ddlDiplomaStartDateMonth.Items.FindByValue(Convert.ToString(DiplomaStartDate[0])).Selected = true;
                    ddlDiplomaStartDateYear.ClearSelection();
                    ddlDiplomaStartDateYear.Items.FindByValue(Convert.ToString(DiplomaStartDate[1])).Selected = true;
                }
                if (EducationInfo.diplomaendate != null)
                {
                    string[] DiplomaEndDate = EducationInfo.diplomaendate.ToString().Split('-');
                    ddlDiplomaEndDateMonth.ClearSelection();
                    ddlDiplomaEndDateMonth.Items.FindByValue(Convert.ToString(DiplomaEndDate[0])).Selected = true;
                    ddlDiplomaEndDateYear.ClearSelection();
                    ddlDiplomaEndDateYear.Items.FindByValue(Convert.ToString(DiplomaEndDate[1])).Selected = true;
                }

                txtDiplomaschoolName.Value = EducationInfo.diplomaschoolname;

                if (EducationInfo.diplomaqualificationtype != null)
                {
                    ddlDiplomaQualificationType.ClearSelection();
                    ddlDiplomaQualificationType.Items.FindByValue(EducationInfo.diplomaqualificationtype.ToString()).Selected = true;
                }
                if (EducationInfo.diplomastudymodeid != null)
                {
                    ddlDiplomaStudyMode.ClearSelection();
                    ddlDiplomaStudyMode.Items.FindByValue(EducationInfo.diplomastudymodeid.ToString()).Selected = true;
                }
                if (EducationInfo.diplomamediumid != null)
                {
                    ddlDiplomaMedium.ClearSelection();
                    ddlDiplomaMedium.Items.FindByValue(EducationInfo.diplomamediumid.ToString()).Selected = true;
                }
                if (EducationInfo.diplomagradetypeid != null)
                {
                    ddlDiplomaGrade.ClearSelection();
                    ddlDiplomaGrade.Items.FindByValue(EducationInfo.diplomagradetypeid.ToString()).Selected = true;
                }
                if (EducationInfo.diplomagradeachieved == 1)
                    rblDiplomaGradeYes.Checked = true;
                else if (EducationInfo.diplomagradeachieved == 2)
                    rblDiplomaGradeYet.Checked = true;
                else
                    rblDiplomaGradeNot.Checked = true;


                if (EducationInfo.diplomaresultdate != null)
                    txtExpectedDiplomaResult.Value = Convert.ToDateTime(EducationInfo.diplomaresultdate).ToString("yyyy-MM-dd");
                txtDiplomaVerificationName.Value = EducationInfo.diplomaverificationname;
                if (EducationInfo.diplomaverificationrelationship != null)
                {
                    ddlDiplomaVerificationRelationship.ClearSelection();
                    ddlDiplomaVerificationRelationship.Items.FindByValue(EducationInfo.diplomaverificationrelationship.ToString()).Selected = true;
                }

                txtDiplomacontactEmail.Value = EducationInfo.diplomaverificationemail;
                txtDiplomacontactMobile.Value = EducationInfo.diplomaverificationmobile;

                if (EducationInfo.ishighereducation == 1)
                    rblhigherYes.Checked = true;
                else if (EducationInfo.ishighereducation == 2)
                    rblhigherNot.Checked = true;
                else
                    rblhigherNo.Checked = true;
                if (EducationInfo.lastsavetime != null)
                    lblSaveTime.Text = " Record was last saved at " + EducationInfo.lastsavetime.ToString();
            }

            var HigherEducation = (from pInfo in db.applicanthighereducation
                                   where pInfo.applicantid == userID && pInfo.universityid == universityID
                                   select pInfo).FirstOrDefault();
            if (HigherEducation != null)
            {
                if (HigherEducation.countryofhighereducation != null)
                {
                    ddlHigherCountry.ClearSelection();
                    ddlHigherCountry.Items.FindByValue(HigherEducation.countryofhighereducation).Selected = true;
                    bindQualification(ddlHigherQualificationType, Convert.ToInt32(HigherEducation.countryofhighereducation));
                }
                if (HigherEducation.coursename != null)
                {
                    ddlCourse.ClearSelection();
                    ddlCourse.Items.FindByValue(HigherEducation.coursename).Selected = true;
                }
                if (HigherEducation.startdate != null)
                {
                    string[] HigherStartDate = HigherEducation.startdate.ToString().Split('-');
                    ddlHigherStartDateMonth.ClearSelection();
                    ddlHigherStartDateMonth.Items.FindByValue(Convert.ToString(HigherStartDate[0])).Selected = true;
                    ddlHigherStartDateYear.ClearSelection();
                    ddlHigherStartDateYear.Items.FindByValue(Convert.ToString(HigherStartDate[1])).Selected = true;
                }
                if (HigherEducation.endate != null)
                {
                    string[] HigherEndDate = HigherEducation.endate.ToString().Split('-');
                    ddlHigherEndDateMonth.ClearSelection();
                    ddlHigherEndDateMonth.Items.FindByValue(Convert.ToString(HigherEndDate[0])).Selected = true;
                    ddlHigherEndDateYear.ClearSelection();
                    ddlHigherEndDateYear.Items.FindByValue(Convert.ToString(HigherEndDate[1])).Selected = true;
                }

                txtHigherschoolName.Value = HigherEducation.schoolname;

                if (HigherEducation.qualificationtype != null)
                {
                    ddlHigherQualificationType.ClearSelection();
                    ddlHigherQualificationType.Items.FindByValue(HigherEducation.qualificationtype.ToString()).Selected = true;
                }
                if (HigherEducation.studymodeid != null)
                {
                    ddlHigherStudyMode.ClearSelection();
                    ddlHigherStudyMode.Items.FindByValue(HigherEducation.studymodeid.ToString()).Selected = true;
                }
                if (HigherEducation.studymediumid != null)
                {
                    ddlHigherMedium.ClearSelection();
                    ddlHigherMedium.Items.FindByValue(HigherEducation.studymediumid.ToString()).Selected = true;
                }
                if (HigherEducation.gradetypeid != null)
                {
                    ddlHigherGrade.ClearSelection();
                    ddlHigherGrade.Items.FindByValue(HigherEducation.gradetypeid.ToString()).Selected = true;
                }


                if (HigherEducation.finalgradeacheived == 1)
                    rblhighergradeachievedYes.Checked = true;
                else if (HigherEducation.finalgradeacheived == 2)
                    rblhighergradeachievedYet.Checked = true;
                else
                    rblhighergradeachievedNo.Checked = true;
                if (HigherEducation.resultdate != null)
                    txtExpectedHigherDategrade.Value = Convert.ToDateTime(HigherEducation.resultdate).ToString("yyyy-MM-dd");
                txtHigherVerificationName.Value = HigherEducation.verificationname;
                if (HigherEducation.relationshipwithverification != null)
                {
                    ddlHigherVerificationRelationship.ClearSelection();
                    ddlHigherVerificationRelationship.Items.FindByValue(HigherEducation.relationshipwithverification.ToString()).Selected = true;
                }

                txtHighercontactEmail.Value = HigherEducation.verificationemail;
                txtHighercontactMobile.Value = HigherEducation.verificationmobile;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public void FillMonth(DropDownList ddl)
    {
        try
        {
            // ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;  //set current year as selected
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            //Fill Months
            ddl.Items.Add(new ListItem("Please select", "0"));
            for (int i = 1; i <= 12; i++)
            {
                ddl.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString().PadLeft(2, '0')));
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public void FillYears(DropDownList ddl)
    {
        try
        {
            int maxYers = DateTime.Now.Year;
            int minYrs = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString());
            ddl.Items.Add(new ListItem("Please select", "0"));
            for (int i = minYrs; i <= maxYers; i++)
            {
                ddl.Items.Add(i.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            string applicantName = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).Select(x => x.firstname + " " + x.lastname).FirstOrDefault();
            var mode = "new";
            var EducationInfo = (from pInfo in db.applicanteducationdetails
                                 where pInfo.applicantid == userID && pInfo.universityid == universityID
                                 select pInfo).FirstOrDefault();
            applicanteducationdetails objEdu = new applicanteducationdetails();
            if (EducationInfo != null)
            {
                mode = "update";
                objEdu = EducationInfo;
            }

            objEdu.applicantid = userID;

            /// High School Details
            if (rblHighYes.Checked)
            {
                objEdu.ishighschooldone = 1;
                objEdu.highschoolverificationkey = Guid.NewGuid().ToString();
                objEdu.ishighschoolverified = false;
            }
            else if (rblHighNo.Checked)
                objEdu.ishighschooldone = 2;
            else
                objEdu.ishighschooldone = 3;
            if (ddlCountryHighSchool.SelectedValue != "")
                objEdu.highschoolcountry = Convert.ToInt32(ddlCountryHighSchool.SelectedValue);

            if ((ddlHighSchoolStartDateMonth.SelectedValue != "") && (ddlHighSchoolStartDateYear.SelectedValue != ""))
                objEdu.highschoolstartdate = ddlHighSchoolStartDateMonth.SelectedValue + "-" + ddlHighSchoolStartDateYear.SelectedValue;
            if ((ddlHighSchoolEndDateMonth.SelectedValue != "") && (ddlHighSchoolEndDateYear.SelectedValue != ""))
                objEdu.highschoolendate = ddlHighSchoolEndDateMonth.SelectedValue + "-" + ddlHighSchoolEndDateYear.SelectedValue;
            objEdu.highschoolname = txthighschoolName.Value;
            if (ddlHighSchoolQualificationType.SelectedValue != "")
                objEdu.highschoolqualificationtype = Convert.ToInt32(ddlHighSchoolQualificationType.SelectedValue);
            if (ddlHigherStudyMode.SelectedValue != "")
                objEdu.highschoolmodeid = Convert.ToInt32(ddlHighSchoolStudyMode.SelectedValue);
            if (ddlHighschoolMedium.SelectedValue != "")
                objEdu.highschoolmediumid = Convert.ToInt32(ddlHighschoolMedium.SelectedValue);
            if (ddlHighSchoolGrade.SelectedValue != "")
                objEdu.highschoolgradetypeid = Convert.ToInt32(ddlHighSchoolGrade.SelectedValue);

            if (rblYes.Checked)
                objEdu.highschoolgradedeclared = 1;
            else if (rblYetToConduct.Checked)
                objEdu.highschoolgradedeclared = 2;
            else
                objEdu.highschoolgradedeclared = 3;
            if (txtExpectedHighSchoolResult.Value != "")
                objEdu.highschoolreusltdate = Convert.ToDateTime(txtExpectedHighSchoolResult.Value);
            objEdu.highschoolverificationname = txtHighSchoolVerificationName.Value;
            objEdu.highschoolverificationrelationship = Convert.ToInt32(ddlHighSchoolVerificationRelationship.SelectedValue);
            objEdu.highschoolverificationemail = txtHighSchoolcontactEmail.Value;
            objEdu.highschoolverificationmobile = txtHighSchoolcontactMobile.Value;
            objEdu.highestdegree = txtHigestEducation.Value;
            /// High School Details End-----

            /// Secondary Details
            if (rblSecondaryYes.Checked)
            {
                objEdu.issecondarydone = 1;
                objEdu.secondaryverificationkey = Guid.NewGuid().ToString();
                objEdu.issecondaryverified = false;
            }
            else if (rblSecondaryNo.Checked)
                objEdu.issecondarydone = 2;
            else
                objEdu.issecondarydone = 3;
            if (ddlSecondaryCountry.SelectedValue != "")
                objEdu.secondarycountry = Convert.ToInt32(ddlSecondaryCountry.SelectedValue);
            if ((ddlSecondaryStartDateMonth.SelectedValue != "") && (ddlSecondaryStartDateYear.SelectedValue != ""))
                objEdu.secondarystartdate = ddlSecondaryStartDateMonth.SelectedValue + "-" + ddlSecondaryStartDateYear.SelectedValue;
            if ((ddlSecondaryEndDateMonth.SelectedValue != "") && (ddlSecondaryEndDateYear.SelectedValue != ""))
                objEdu.secondaryendate = ddlSecondaryEndDateMonth.SelectedValue + "-" + ddlSecondaryEndDateYear.SelectedValue;

            objEdu.secondaryname = txtSecondarySchoolName.Value;
            if (ddlSecondaryQualificationType.SelectedValue != "")
                objEdu.secondaryqualificationtype = Convert.ToInt32(ddlSecondaryQualificationType.SelectedValue);
            if (ddlSecondaryStudyMode.SelectedValue != "")
                objEdu.secondarymodestudy = Convert.ToInt32(ddlSecondaryStudyMode.SelectedValue);
            if (ddlSecondaryMedium.SelectedValue != "")
                objEdu.secondarymediumstudy = Convert.ToInt32(ddlSecondaryMedium.SelectedValue);
            if (ddlSecondaryGrade.SelectedValue != "")
                objEdu.secondarygradetypeid = Convert.ToInt32(ddlSecondaryGrade.SelectedValue);
            if (rblSecondarygradeachievedYes.Checked)
                objEdu.secondarygradedeclared = 1;
            else if (SecondarygradeachievedYet.Checked)
                objEdu.secondarygradedeclared = 2;
            else
                objEdu.secondarygradedeclared = 3;
            if (txtExpectedSecondaryResult.Value != "")
                objEdu.secondaryresultdate = Convert.ToDateTime(txtExpectedSecondaryResult.Value);

            objEdu.secondaryverificationname = txtSecondaryVerificationName.Value;
            objEdu.secondaryverificationrelationship = Convert.ToInt32(ddlSecondaryVerificationRelationship.SelectedValue);
            objEdu.secondaryverificationemail = txtSecondarycontactEmail.Value;
            objEdu.secondaryverificationmobile = txtSecondarycontactMobile.Value;

            /// Secondary Details End-----
            /// Diploma
            if (rbldiplomaYes.Checked)
            {
                objEdu.isdiplomadone = 1;
                objEdu.diplomaverificationkey = Guid.NewGuid().ToString();
                objEdu.isdiplomaverified = false;
            }
            else if (rbldiplomaNo.Checked)
                objEdu.isdiplomadone = 2;
            else
                objEdu.isdiplomadone = 3;
            if (ddlDiplomaCountry.SelectedValue != "")
                objEdu.diplomacountry = Convert.ToInt32(ddlDiplomaCountry.SelectedValue);
            if ((ddlDiplomaStartDateMonth.SelectedValue != "") && (ddlDiplomaStartDateYear.SelectedValue != ""))
                objEdu.diplomastartdate = ddlDiplomaStartDateMonth.SelectedValue + "-" + ddlDiplomaStartDateYear.SelectedValue;
            if ((ddlDiplomaEndDateMonth.SelectedValue != "") && (ddlDiplomaEndDateYear.SelectedValue != ""))
                objEdu.diplomaendate = ddlDiplomaEndDateMonth.SelectedValue + "-" + ddlDiplomaEndDateYear.SelectedValue;


            objEdu.diplomaschoolname = txtDiplomaschoolName.Value;
            if (ddlDiplomaQualificationType.SelectedValue != "")
                objEdu.diplomaqualificationtype = Convert.ToInt32(ddlDiplomaQualificationType.SelectedValue);
            if (ddlDiplomaStudyMode.SelectedValue != "")
                objEdu.diplomastudymodeid = Convert.ToInt32(ddlDiplomaStudyMode.SelectedValue);
            if (ddlDiplomaMedium.SelectedValue != "")
                objEdu.diplomamediumid = Convert.ToInt32(ddlDiplomaMedium.SelectedValue);
            if (ddlDiplomaGrade.SelectedValue != "")
                objEdu.diplomagradetypeid = Convert.ToInt32(ddlDiplomaGrade.SelectedValue);
            if (rblDiplomaGradeYes.Checked)
                objEdu.diplomagradeachieved = 1;
            else if (rblDiplomaGradeYet.Checked)
                objEdu.diplomagradeachieved = 2;
            else
                objEdu.diplomagradeachieved = 3;
            if (txtExpectedDiplomaResult.Value != "")
                objEdu.diplomaresultdate = Convert.ToDateTime(txtExpectedDiplomaResult.Value);

            objEdu.diplomaverificationname = txtDiplomaVerificationName.Value;
            objEdu.diplomaverificationrelationship = Convert.ToInt32(ddlDiplomaVerificationRelationship.SelectedValue);
            objEdu.diplomaverificationemail = txtDiplomacontactEmail.Value;
            objEdu.diplomaverificationmobile = txtDiplomacontactMobile.Value;

            objEdu.lastsavetime = DateTime.Now;
            objEdu.iseducationdetailspresent = true;
            /// Diploma End-----
            /// 
            if (rblhigherYes.Checked)
                objEdu.ishighereducation = 1;
            else if (rblhigherNo.Checked)
                objEdu.ishighereducation = 2;
            else
                objEdu.ishighereducation = 3;
            objEdu.universityid = universityID;


            if (mode == "new")
                db.applicanteducationdetails.Add(objEdu);

            /// Saving higher Education Details
            string Cousrsename = ddlCourse.SelectedValue;
            var HigherEducation = (from pInfo in db.applicanthighereducation
                                   where pInfo.applicantid == userID && pInfo.coursename == Cousrsename
                                   select pInfo).FirstOrDefault();
            applicanthighereducation objEducation = new applicanthighereducation();
            if (ddlCourse.SelectedValue != "")
            {
                mode = "new";
                
                if (HigherEducation != null)
                {
                    mode = "update";
                    objEducation = HigherEducation;
                }
                objEducation.applicantid = userID;
                if (rblhigherYes.Checked)
                {
                    objEducation.finalgradeacheived = 1;
                    objEducation.highereducationverificationkey = Guid.NewGuid().ToString();
                    objEducation.ishighereducationverified = false;
                }
                else if (rblhigherNo.Checked)
                    objEducation.finalgradeacheived = 2;
                else
                    objEducation.finalgradeacheived = 3;

                if (ddlHigherCountry.SelectedValue != "")
                    objEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                objEducation.coursename = ddlCourse.SelectedValue;
                if ((ddlHigherStartDateMonth.SelectedValue != "") && (ddlHigherStartDateYear.SelectedValue != ""))
                    objEducation.startdate = ddlHigherStartDateMonth.SelectedValue + "-" + ddlHigherStartDateYear.SelectedValue;
                if ((ddlHigherEndDateMonth.SelectedValue != "") && (ddlHigherEndDateYear.SelectedValue != ""))
                    objEducation.endate = ddlHigherEndDateMonth.SelectedValue + "-" + ddlHigherEndDateYear.SelectedValue;

                objEducation.schoolname = txtHigherschoolName.Value;
                if (ddlHigherQualificationType.SelectedValue != "")
                    objEducation.qualificationtype = ddlHigherQualificationType.SelectedValue;
                if (ddlHigherStudyMode.SelectedValue != "")
                    objEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
                if (ddlHigherMedium.SelectedValue != "")
                    objEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
                if (ddlHigherGrade.SelectedValue != "")
                    objEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);

                if (rblhighergradeachievedYes.Checked)
                    objEducation.finalgradeacheived = 1;
                else if (rblhighergradeachievedYet.Checked)
                    objEducation.finalgradeacheived = 2;
                else
                    objEducation.finalgradeacheived = 3;
                if (txtExpectedHigherDategrade.Value != "")
                    objEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);

                objEducation.relationshipwithverification = Convert.ToInt32(ddlHigherVerificationRelationship.SelectedValue);
                objEducation.verificationemail = txtHighercontactEmail.Value;
                objEducation.verificationname = txtHigherVerificationName.Value;
                objEducation.verificationmobile = txtHighercontactMobile.Value;
                objEducation.universityid = universityID;
                if (mode == "new")
                    db.applicanthighereducation.Add(objEducation);

            }
            db.SaveChanges();

            if (rblHighYes.Checked)
            {
                string url = webURL + "verifyeducationdetails.aspx?key=" + objEdu.highschoolverificationkey +"&type=highschool";
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + objEdu.highschoolverificationname + ",<br/><br/>");

                sb.Append(applicantName + " has given your reference for high school education details check at the time of applying for his/her course.<br/>");
                sb.Append("Please validate education details of " + applicantName + " with link given below <br/>");
                sb.Append("<a href=" + url + ">Validate Now</a> <br/>");
                sb.Append("Thank You <br/>");
                sb.Append("The Application Center Validation Team <br/>");
                objCom.SendMail(objEdu.highschoolverificationemail, sb.ToString(), "Education Detail check for" + applicantName);
            }

            if (rblSecondaryYes.Checked)
            {
                string url = webURL + "verifyeducationdetails.aspx?key=" + objEdu.secondaryverificationkey + "&type=secondary";
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + objEdu.secondaryverificationname + ",<br/><br/>");

                sb.Append(applicantName + " has given your reference for secondary school education details check at the time of applying for his/her course.<br/>");
                sb.Append("Please validate education details of " + applicantName + " with link given below <br/>");
                sb.Append("<a href=" + url + ">Validate Now</a> <br/>");
                sb.Append("Thank You <br/>");
                sb.Append("The Application Center Validation Team <br/>");
                objCom.SendMail(objEdu.secondaryverificationemail, sb.ToString(), "Education Detail check for" + applicantName);
            }

            if (rbldiplomaYes.Checked)
            {
                string url = webURL + "verifyeducationdetails.aspx?key=" + objEdu.diplomaverificationkey + "&type=diploma";
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + objEdu.diplomaverificationname + ",<br/><br/>");

                sb.Append(applicantName + " has given your reference for diploma education details check at the time of applying for his/her course.<br/>");
                sb.Append("Please validate education details of " + applicantName + " with link given below <br/>");
                sb.Append("<a href=" + url + ">Validate Now</a> <br/>");
                sb.Append("Thank You <br/>");
                sb.Append("The Application Center Validation Team <br/>");
                objCom.SendMail(objEdu.diplomaverificationemail, sb.ToString(), "Education Detail check for" + applicantName);
            }

            if (ddlCourse.SelectedValue != "" && rblhigherYes.Checked)
            {
                string url = webURL + "verifyeducationdetails.aspx?key=" + objEducation.highereducationverificationkey + "&type=highereducation";
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + objEducation.verificationname + ",<br/><br/>");

                sb.Append(applicantName + " has given your reference for higher education details check at the time of applying for his/her course.<br/>");
                sb.Append("Please validate education details of " + applicantName + " with link given below <br/>");
                sb.Append("<a href=" + url + ">Validate Now</a> <br/>");
                sb.Append("Thank You <br/>");
                sb.Append("The Application Center Validation Team <br/>");
                objCom.SendMail(objEducation.verificationemail, sb.ToString(), "Education Detail check for" + applicantName);
            }

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetStudentDetailsCompletedStatus(userID, universityID);
            lblMessage.Text = "Your Education Details have been saved";
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);
            lblMessage.Visible = true;
        }

        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnAddanother_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var HigherEducation = (from pInfo in db.applicanthighereducation
                                   where pInfo.applicantid == userID && pInfo.coursename == ddlCourse.SelectedValue && pInfo.universityid == universityID
                                   select pInfo).FirstOrDefault();
            applicanthighereducation objEducation = new applicanthighereducation();
            if (HigherEducation != null)
            {
                mode = "update";
                objEducation = HigherEducation;
            }

            objEducation.applicantid = userID;
            if (rblhigherYes.Checked)
                objEducation.finalgradeacheived = 1;
            else if (rblhigherNo.Checked)
                objEducation.finalgradeacheived = 2;
            else
                objEducation.finalgradeacheived = 3;

            if (ddlHigherCountry.SelectedValue != "")
                objEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
            objEducation.coursename = ddlCourse.SelectedValue;
            if ((ddlHigherStartDateMonth.SelectedValue != "") && (ddlHigherStartDateYear.SelectedValue != ""))
                objEducation.startdate = ddlHigherStartDateMonth.SelectedValue + "-" + ddlDiplomaStartDateYear.SelectedValue;
            if ((ddlHigherEndDateMonth.SelectedValue != "") && (ddlHigherEndDateYear.SelectedValue != ""))
                objEducation.endate = ddlHigherEndDateMonth.SelectedValue + "-" + ddlHigherEndDateYear.SelectedValue;
            objEducation.schoolname = txtHigherschoolName.Value;
            if (ddlHigherQualificationType.SelectedValue != "")
                objEducation.qualificationtype = ddlHigherQualificationType.SelectedValue;
            if (ddlHigherStudyMode.SelectedValue != "")
                objEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
            if (ddlHigherMedium.SelectedValue != "")
                objEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
            if (ddlHigherGrade.SelectedValue != "")
                objEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);

            if (rblhighergradeachievedYes.Checked)
                objEducation.finalgradeacheived = 1;
            else if (rblhighergradeachievedYet.Checked)
                objEducation.finalgradeacheived = 2;
            else
                objEducation.finalgradeacheived = 3;
            if (txtExpectedHigherDategrade.Value != "")
                objEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);

            objEducation.relationshipwithverification = Convert.ToInt32(ddlHigherVerificationRelationship.SelectedValue);
            objEducation.verificationemail = txtHighercontactEmail.Value;
            objEducation.verificationname = txtHigherVerificationName.Value;
            objEducation.verificationmobile = txtHighercontactMobile.Value;
            if (mode == "new")
                db.applicanthighereducation.Add(objEducation);

            db.SaveChanges();
            bindhigherCourses();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindQualification(DropDownList ddl, int country)
    {
        try
        {
            var qualificationContriesWise = (from qm in db.qualificationmaster
                                             join qcm in db.qualificationcountriesmapping on qm.qualificationid equals qcm.qualificationid
                                             where qcm.countryid == country
                                             select new
                                             {
                                                 qualificationid = qm.qualificationid,
                                                 qualificationname = qm.qualificationname,
                                             }).ToList();

            ListItem lst = new ListItem("Please select", "0");

            ddl.DataSource = qualificationContriesWise;
            ddl.DataTextField = "qualificationname";
            ddl.DataValueField = "qualificationid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlCountryHighSchool_SelectedIndexChanged(object sender, EventArgs e)
    {

        bindQualification(ddlHighSchoolQualificationType, Convert.ToInt32(ddlCountryHighSchool.SelectedItem.Value));
    }
    protected void ddlSecondaryCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindQualification(ddlSecondaryQualificationType, Convert.ToInt32(ddlCountryHighSchool.SelectedItem.Value));
    }
    protected void ddlHigherCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindQualification(ddlHigherQualificationType, Convert.ToInt32(ddlCountryHighSchool.SelectedItem.Value));
    }
    protected void ddlDiplomaCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindQualification(ddlDiplomaQualificationType, Convert.ToInt32(ddlCountryHighSchool.SelectedItem.Value));
    }

    private void bind10grade()
    {
        try
        {
            var grade10 = (from a in db.applicantsubjectwisegrade
                           join g in db.grademaster on a.gradeid equals g.id
                           join sm in db.subjectmaster on a.subjectid equals sm.id into tmp
                           from x in tmp.DefaultIfEmpty()
                           where a.applicantid == userID && a.coursename == "tenth"

                           select new
                           {
                               applicantgradeid = a.applicantgradeid,
                               coursename = a.coursename,
                               othersubject = a.othersubject,
                               subject = x.description,
                               gradetype = g.description,
                               studentgrade = a.grade
                           }).ToList();
            grd10.DataSource = grade10;
            grd10.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void binddiplomagrade()
    {
        try
        {
            var gradediploma = (from a in db.applicantsubjectwisegrade
                                join g in db.grademaster on a.gradeid equals g.id
                                join sm in db.subjectmaster on a.subjectid equals sm.id into tmp
                                from x in tmp.DefaultIfEmpty()
                                where a.applicantid == userID && a.coursename == "diploma"

                                select new
                                {
                                    applicantgradeid = a.applicantgradeid,
                                    coursename = a.coursename,
                                    othersubject = a.othersubject,
                                    subject = x.description,
                                    gradetype = g.description,
                                    studentgrade = a.grade
                                }).ToList();
            grdDiploma.DataSource = gradediploma;
            grdDiploma.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void bindSecondarygrade()
    {
        try
        {
            var gradeSecondary = (from a in db.applicantsubjectwisegrade
                                  join g in db.grademaster on a.gradeid equals g.id
                                  join sm in db.subjectmaster on a.subjectid equals sm.id into tmp
                                  from x in tmp.DefaultIfEmpty()
                                  where a.applicantid == userID && a.coursename == "twelth"

                                  select new
                                  {
                                      applicantgradeid = a.applicantgradeid,
                                      coursename = a.coursename,
                                      othersubject = a.othersubject,
                                      subject = x.description,
                                      gradetype = g.description,
                                      studentgrade = a.grade
                                  }).ToList();
            grdSecondary.DataSource = gradeSecondary;
            grdSecondary.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void bindhighergrade()
    {
        try
        {
            var gradehigher = (from a in db.applicantsubjectwisegrade
                               join g in db.grademaster on a.gradeid equals g.id
                               join sm in db.subjectmaster on a.subjectid equals sm.id into tmp
                               from x in tmp.DefaultIfEmpty()
                               where a.applicantid == userID && (a.coursename == "UG" || a.coursename == "PG" || a.coursename == "Phd" || a.coursename == "Other")

                               select new
                               {
                                   applicantgradeid = a.applicantgradeid,
                                   coursename = a.coursename,
                                   othersubject = a.othersubject,
                                   subject = x.description,
                                   gradetype = g.description,
                                   studentgrade = a.grade
                               }).ToList();
            grdHigher.DataSource = gradehigher;
            grdHigher.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindhigherCourses()
    {
        try
        {
            var gradehigher = (from a in db.applicanthighereducation
                               where a.applicantid == userID && a.universityid == universityID

                               select new
                               {
                                   applicanthighereducationid = a.applicanthighereducationid,
                                   coursename = a.coursename,
                                   schoolname = a.schoolname,
                                   startdate = a.startdate,
                                   endate = a.endate
                               }).ToList();
            grdHigherCourses.DataSource = gradehigher;
            grdHigherCourses.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grd10_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grd10.DataKeys[e.RowIndex].Values[0]);
            applicantsubjectwisegrade grade = db.applicantsubjectwisegrade.Where(b => b.applicantgradeid == id).First();
            db.applicantsubjectwisegrade.Remove(grade);
            db.SaveChanges();
            bind10grade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdSecondary_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grdSecondary.DataKeys[e.RowIndex].Values[0]);
            applicantsubjectwisegrade grade = db.applicantsubjectwisegrade.Where(b => b.applicantgradeid == id).First();
            db.applicantsubjectwisegrade.Remove(grade);
            db.SaveChanges();
            bindSecondarygrade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdHigher_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grdHigher.DataKeys[e.RowIndex].Values[0]);
            applicantsubjectwisegrade grade = db.applicantsubjectwisegrade.Where(b => b.applicantgradeid == id).First();
            db.applicantsubjectwisegrade.Remove(grade);
            db.SaveChanges();
            bindhighergrade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdDiploma_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grdDiploma.DataKeys[e.RowIndex].Values[0]);
            applicantsubjectwisegrade grade = db.applicantsubjectwisegrade.Where(b => b.applicantgradeid == id).First();
            db.applicantsubjectwisegrade.Remove(grade);
            db.SaveChanges();
            binddiplomagrade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdDiploma_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grdDiploma_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grdDiploma.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdHigher_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grdHigher_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grdHigher.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdSecondary_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grdSecondary_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grdSecondary.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grd10_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grd10_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grd10.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdHigherCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grdHigherCourses.DataKeys[e.RowIndex].Values[0]);
            applicanthighereducation higher = db.applicanthighereducation.Where(b => b.applicanthighereducationid == id).First();
            db.applicanthighereducation.Remove(higher);
            db.SaveChanges();
            bindhigherCourses();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdHigherCourses_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grdHigherCourses_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grdHigherCourses.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[5].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdHigherCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void grdHigherCourses_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Edit"))

            {
                int coursename = Convert.ToInt32(e.CommandArgument.ToString());

                var HigherEducation = (from pInfo in db.applicanthighereducation
                                       where pInfo.applicantid == userID && pInfo.applicanthighereducationid == coursename
                                       select pInfo).FirstOrDefault();
                if (rblhigherYes.Checked)
                    HigherEducation.finalgradeacheived = 1;
                else if (rblhigherNo.Checked)
                    HigherEducation.finalgradeacheived = 2;
                else
                    HigherEducation.finalgradeacheived = 3;

                if (ddlHigherCountry.SelectedValue != "")
                    HigherEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                HigherEducation.coursename = ddlCourse.SelectedValue;
                if (HigherEducation.startdate != null)
                {
                    string[] HigherStartDate = HigherEducation.startdate.ToString().Split('-');
                    ddlHigherStartDateMonth.ClearSelection();
                    ddlHigherStartDateMonth.Items.FindByValue(Convert.ToString(HigherStartDate[0])).Selected = true;
                    ddlHigherStartDateYear.ClearSelection();
                    ddlHigherStartDateYear.Items.FindByValue(Convert.ToString(HigherStartDate[1])).Selected = true;
                }
                if (HigherEducation.endate != null)
                {
                    string[] HigherEndDate = HigherEducation.endate.ToString().Split('-');
                    ddlHigherEndDateMonth.ClearSelection();
                    ddlHigherEndDateMonth.Items.FindByValue(Convert.ToString(HigherEndDate[0])).Selected = true;
                    ddlHigherEndDateYear.ClearSelection();
                    ddlHigherEndDateYear.Items.FindByValue(Convert.ToString(HigherEndDate[1])).Selected = true;
                }
                HigherEducation.schoolname = txtHigherschoolName.Value;
                if (ddlHigherQualificationType.SelectedValue != "")
                    HigherEducation.qualificationtype = ddlHigherQualificationType.SelectedValue;
                if (ddlHigherStudyMode.SelectedValue != "")
                    HigherEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
                if (ddlHigherMedium.SelectedValue != "")
                    HigherEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
                if (ddlHigherGrade.SelectedValue != "")
                    HigherEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);

                if (rblhighergradeachievedYes.Checked)
                    HigherEducation.finalgradeacheived = 1;
                else if (rblhighergradeachievedYet.Checked)
                    HigherEducation.finalgradeacheived = 2;
                else
                    HigherEducation.finalgradeacheived = 3;
                if (txtExpectedHigherDategrade.Value != "")
                    HigherEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);

                if (HigherEducation.relationshipwithverification != null)
                {
                    ddlHigherVerificationRelationship.ClearSelection();
                    ddlHigherVerificationRelationship.Items.FindByValue(HigherEducation.relationshipwithverification.ToString()).Selected = true;
                }
                HigherEducation.verificationemail = txtHighercontactEmail.Value;
                HigherEducation.verificationname = txtHigherVerificationName.Value;
                HigherEducation.verificationmobile = txtHighercontactMobile.Value;
                btnAddanother.Text = "Update Info";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}