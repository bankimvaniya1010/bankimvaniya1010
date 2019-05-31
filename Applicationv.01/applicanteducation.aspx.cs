using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicanteducation : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityid = 0;
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
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            objCom.BindCountries(ddlCountryHighSchool);
            objCom.BindCountries(ddlDiplomaCountry);
            objCom.BindCountries(ddlHigherCountry);
            objCom.BindCountries(ddlSecondaryCountry);

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
            SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
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
                fields = (from pfm in db.primaryfieldmaster

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
                    case "HAVE YOU COMPLETED HIGH SCHOOL":
                        highschool.Attributes.Add("style", "display:block;");
                        labelhighschool.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COUNTRY OF HIGH SCHOOL EDUCATION":
                        highschoolCountry.Attributes.Add("style", "display:block;");
                        labelhighschoolCountry.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "START DATE":
                        highschoolstartDate.Attributes.Add("style", "display:block;");
                        labelhighschoolstartDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        SecondarystartDate.Attributes.Add("style", "display:block;");
                        labelSecondarystartDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherstartDate.Attributes.Add("style", "display:block;");
                        labelhigherstartDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomastartDate.Attributes.Add("style", "display:block;");
                        labeldiplomastartDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "END DATE":
                        highschoolendDate.Attributes.Add("style", "display:block;");
                        labelhighschoolendDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        SecondaryendDate.Attributes.Add("style", "display:block;");
                        labelSecondaryendDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherendDate.Attributes.Add("style", "display:block;");
                        labelhigherendDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomaendDate.Attributes.Add("style", "display:block;");
                        labeldiplomaendDate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "NAME OF SCHOOL":
                        highschoolName.Attributes.Add("style", "display:block;");
                        labelhighschoolName.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        SecondaryschoolName.Attributes.Add("style", "display:block;");
                        labelSecondaryschoolName.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherschoolName.Attributes.Add("style", "display:block;");
                        labelhigherschoolName.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomaschoolName.Attributes.Add("style", "display:block;");
                        labeldiplomaschoolName.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "QUALIFICATION TYPE":
                        highschoolQualificationtype.Attributes.Add("style", "display:block;");
                        labelhighschoolQualificationtype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        SecondaryQualificationtype.Attributes.Add("style", "display:block;");
                        labelSecondaryQualificationtype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherQualificationtype.Attributes.Add("style", "display:block;");
                        labelhigherQualificationtype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomaQualificationtype.Attributes.Add("style", "display:block;");
                        labeldiplomaQualificationtype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;

                    case "MODE OF STUDY":
                        highschoolstudymode.Attributes.Add("style", "display:block;");
                        labelhighschoolstudymode.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        Secondarystudymode.Attributes.Add("style", "display:block;");
                        labelSecondarystudymode.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherstudymode.Attributes.Add("style", "display:block;");
                        labelhigherstudymode.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomastudymode.Attributes.Add("style", "display:block;");
                        labeldiplomastudymode.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "LANGUAGE (MEDIUM) OF STUDY":
                        highschoollanguage.Attributes.Add("style", "display:block;");
                        labelhighschoollanguage.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        Secondarylanguage.Attributes.Add("style", "display:block;");
                        labelSecondarylanguage.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherlanguage.Attributes.Add("style", "display:block;");
                        labelhigherlanguage.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomalanguage.Attributes.Add("style", "display:block;");
                        labeldiplomalanguage.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "GRADE TYPE":
                        gradetype.Attributes.Add("style", "display:block;");
                        labelgradetype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        Secondarygradetype.Attributes.Add("style", "display:block;");
                        labelSecondarygradetype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        highergradetype.Attributes.Add("style", "display:block;");
                        labelhighergradetype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomagradetype.Attributes.Add("style", "display:block;");
                        labeldiplomagradetype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "FINAL GRADE ACHIEVED":
                        highschoolgradeachieved.Attributes.Add("style", "display:block;");
                        labelgradeachieved.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        Secondarygradeachieved.Attributes.Add("style", "display:block;");
                        labelSecondarygradeachieved.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        highergradeachieved.Attributes.Add("style", "display:block;");
                        labelhighergradeachieved.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomagradeachieved.Attributes.Add("style", "display:block;");
                        labeldiplomagradeachieved.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                        ExpectedHighSchoolDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedHighSchoolDategrade.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        ExpectedSecondaryDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedSecondaryDategrade.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        ExpectedHigherDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedHigherDategrade.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        ExpectedDiplomaDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedDiplomaDategrade.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                        highschoolverify.Attributes.Add("style", "display:block;");
                        labelhighschoolverify.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        Secondaryverify.Attributes.Add("style", "display:block;");
                        labelSecondaryverify.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherverify.Attributes.Add("style", "display:block;");
                        labelhigherverify.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomaverify.Attributes.Add("style", "display:block;");
                        labeldiplomaverify.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        highschoolrelation.Attributes.Add("style", "display:block;");
                        labelhighschoolrelation.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        secondaryschoolrelation.Attributes.Add("style", "display:block;");
                        labelsecondaryschoolrelation.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        higherrelation.Attributes.Add("style", "display:block;");
                        labelhigherrelation.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomarelation.Attributes.Add("style", "display:block;");
                        labeldiplomarelation.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactEmail.Attributes.Add("style", "display:block;");
                        labelhighschoolcontactEmail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        secondarycontactEmail.Attributes.Add("style", "display:block;");
                        labelsecondarycontactEmail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        highercontactEmail.Attributes.Add("style", "display:block;");
                        labelhighercontactEmail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomacontactEmail.Attributes.Add("style", "display:block;");
                        labeldiplomacontactEmail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactMobile.Attributes.Add("style", "display:block;");
                        labelhighschoolcontactMobile.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        secondarycontactMobile.Attributes.Add("style", "display:block;");
                        labelsecondarycontactMobile.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        highercontactMobile.Attributes.Add("style", "display:block;");
                        labelhighercontactMobile.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomacontactMobile.Attributes.Add("style", "display:block;");
                        labeldiplomacontactMobile.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HIGHEST EDUCATION":
                        higestEducation.Attributes.Add("style", "display:block;");
                        labelhigestEducation.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL? (YEAR 12)":
                        Secondary.Attributes.Add("style", "display:block;");
                        labelSecondary.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COUNTRY OF SECONDARY EDUCATION":
                        SecondaryCountry.Attributes.Add("style", "display:block;");
                        labelSecondaryCountry.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "Add Subject and their Grades":
                        highshoolgrade.Attributes.Add("style", "display:block;");
                        btn10th.Value = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        secondarygrade.Attributes.Add("style", "display:block;");
                        btn12th.Value = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        highergrade.Attributes.Add("style", "display:block;");
                        btnhigher.Value = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        diplomagrade.Attributes.Add("style", "display:block;");
                        btndiploma.Value = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HAVE YOU COMPLETED ANY HIGHER (UNDER GRADUATE, MASTERS OR PHD) DEGREE":
                        higher.Attributes.Add("style", "display:block;");
                        labelhigher.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "Add Another Higher Qualification":
                        addanother.Attributes.Add("style", "display:block;");
                        btnAddanother.Text = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;

                    case "HIGHER COURSE":
                        highercourse.Attributes.Add("style", "display:block;");
                        labelhighercourse.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "Country of Higher Education":
                        higherCountry.Attributes.Add("style", "display:block;");
                        labelhigherCountry.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HAVE YOU COMPLETED ANY DIPLOMA OR CERTIFICATE PROGRAMS":
                        diploma.Attributes.Add("style", "display:block;");
                        labeldiploma.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COUNTRY OF DIPLOMA OR CERTIFICATE PROGRAMS":
                        diplomaCountry.Attributes.Add("style", "display:block;");
                        labeldiplomaCountry.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
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


                    case "Schoolingdone":
                        rblHighYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblHighNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblHighNot.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblSecondaryNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblSecondaryNot.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblSecondaryYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblhigherYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblhigherNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblhigherNot.Attributes.Add("title", lstToolTips[k].tooltips);
                        rbldiplomaYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rbldiplomaNot.Attributes.Add("title", lstToolTips[k].tooltips);
                        rbldiplomaNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;

                    case "CountryofEducation":
                        ddlCountryHighSchool.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlSecondaryCountry.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHigherCountry.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlDiplomaCountry.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "StartDate":
                        txtStartDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtDiplomaStartDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherStartDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondaryStartDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Endate":
                        txtEndDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtDiplomaEndDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherEndDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondaryEndDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Schoolname":
                        txtSecondarySchoolName.Attributes.Add("title", lstToolTips[k].tooltips);
                        txthighschoolName.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherschoolName.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtDiplomaschoolName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Qualificationtype":
                        ddlDiplomaQualificationType.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHigherQualificationType.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHighSchoolQualificationType.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlSecondaryQualificationType.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Studymode":
                        ddlDiplomaStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHigherStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHighSchoolStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlSecondaryStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Studymedium":
                        ddlDiplomaStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHigherStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHighSchoolStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlSecondaryStudyMode.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Gradetype":
                        ddlHigherGrade.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlHighSchoolGrade.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlSecondaryGrade.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlDiplomaGrade.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Finalgradeachived":
                        rblDiplomaGradeNot.ToolTip = lstToolTips[k].tooltips;
                        rblDiplomaGradeYes.ToolTip = lstToolTips[k].tooltips;
                        rblDiplomaGradeYet.ToolTip = lstToolTips[k].tooltips;
                        rblhighergradeachievedNo.ToolTip = lstToolTips[k].tooltips;
                        rblhighergradeachievedYes.ToolTip = lstToolTips[k].tooltips;
                        rblhighergradeachievedYet.ToolTip = lstToolTips[k].tooltips;
                        rblSecondarygradeachievedYes.ToolTip = lstToolTips[k].tooltips;
                        rblSecondaryNo.ToolTip = lstToolTips[k].tooltips;
                        rblSecondaryNot.ToolTip = lstToolTips[k].tooltips;
                        rblhighergradeachievedNo.ToolTip = lstToolTips[k].tooltips;
                        rblhighergradeachievedYes.ToolTip = lstToolTips[k].tooltips;
                        rblhighergradeachievedYet.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Expectedresult":
                        txtExpectedDiplomaResult.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtExpectedHighSchoolResult.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtExpectedSecondaryResult.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtExpectedHigherDategrade.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "Contactname":
                        txtHighSchoolVerificationName.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherVerificationName.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondaryVerificationName.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtDiplomaVerificationName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ContactRelation":
                        txtHighSchoolVerificationRelationship.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherVerificationRelationship.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondaryVerificationRelationship.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtDiplomaVerificationRelationship.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ContactMobile":
                        txtDiplomacontactMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHighSchoolcontactMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondarycontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHighercontactMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ContactEmail":
                        txtDiplomacontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHighercontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHighSchoolcontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondarycontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
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
    private void BindStudyMode(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.studymodemaster.ToList();

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
                                 where pInfo.applicantid == userID
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
                }
                if (EducationInfo.highschoolstartdate != null)
                    txtStartDate.Value = Convert.ToDateTime(EducationInfo.highschoolstartdate).ToString("yyyy-MM-dd");
                if (EducationInfo.highschoolendate != null)
                    txtEndDate.Value = Convert.ToDateTime(EducationInfo.highschoolendate).ToString("yyyy-MM-dd");
                txthighschoolName.Value = EducationInfo.highschoolname;
                bindQualification(ddlHighSchoolQualificationType, Convert.ToInt32(EducationInfo.highschoolcountry));
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

                txtHighSchoolVerificationRelationship.Value = EducationInfo.highschoolverificationrelationship;

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
                }
                if (EducationInfo.secondaryresultdate != null)
                    txtExpectedSecondaryResult.Value = Convert.ToDateTime(EducationInfo.secondaryresultdate).ToString("yyyy-MM-dd");

                if (EducationInfo.secondarystartdate != null)
                    txtSecondaryStartDate.Value = Convert.ToDateTime(EducationInfo.secondarystartdate).ToString("yyyy-MM-dd");
                if (EducationInfo.secondaryendate != null)
                    txtSecondaryEndDate.Value = Convert.ToDateTime(EducationInfo.secondaryendate).ToString("yyyy-MM-dd");
                txtSecondarySchoolName.Value = EducationInfo.secondaryname;
                bindQualification(ddlSecondaryQualificationType, Convert.ToInt32(EducationInfo.secondarycountry));
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
                txtSecondaryVerificationRelationship.Value = EducationInfo.secondaryverificationrelationship;
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
                }
                if (EducationInfo.diplomastartdate != null)
                    txtDiplomaStartDate.Value = Convert.ToDateTime(EducationInfo.diplomastartdate).ToString("yyyy-MM-dd");
                if (EducationInfo.diplomaendate != null)
                    txtDiplomaEndDate.Value = Convert.ToDateTime(EducationInfo.diplomaendate).ToString("yyyy-MM-dd");
                txtDiplomaschoolName.Value = EducationInfo.diplomaschoolname;
                bindQualification(ddlDiplomaQualificationType, Convert.ToInt32(EducationInfo.diplomacountry));
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
                txtDiplomaVerificationRelationship.Value = EducationInfo.diplomaverificationrelationship;
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
                                   where pInfo.applicantid == userID
                                   select pInfo).FirstOrDefault();
            if (HigherEducation != null)
            {
                if (HigherEducation.countryofhighereducation != null)
                {
                    ddlHigherCountry.ClearSelection();
                    ddlHigherCountry.Items.FindByValue(HigherEducation.countryofhighereducation).Selected = true;
                }
                if (HigherEducation.coursename != null)
                {
                    ddlCourse.ClearSelection();
                    ddlCourse.Items.FindByValue(HigherEducation.coursename).Selected = true;
                }
                if (txtHigherStartDate.Value != "")
                    txtHigherStartDate.Value = Convert.ToDateTime(HigherEducation.startdate).ToString("yyyy-MM-dd");
                if (txtHigherEndDate.Value != "")
                    txtHigherEndDate.Value = Convert.ToDateTime(HigherEducation.endate).ToString("yyyy-MM-dd");
                txtHigherschoolName.Value = HigherEducation.schoolname;
                bindQualification(ddlHigherQualificationType, Convert.ToInt32(HigherEducation.countryofhighereducation));
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
                txtHigherVerificationRelationship.Value = HigherEducation.relationshipwithverification;
                txtHighercontactEmail.Value = HigherEducation.verificationemail;
                txtHighercontactMobile.Value = HigherEducation.verificationmobile;
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
            var EducationInfo = (from pInfo in db.applicanteducationdetails
                                 where pInfo.applicantid == userID
                                 select pInfo).FirstOrDefault();
            applicanteducationdetails objEdu = new applicanteducationdetails();
            if (EducationInfo == null)
            {
                objEdu.applicantid = userID;

                /// High School Details
                if (rblHighYes.Checked)
                    objEdu.ishighschooldone = 1;
                else if (rblHighNo.Checked)
                    objEdu.ishighschooldone = 2;
                else
                    objEdu.ishighschooldone = 3;
                if (ddlCountryHighSchool.SelectedValue != "")
                    objEdu.highschoolcountry = Convert.ToInt32(ddlCountryHighSchool.SelectedValue);
                if (txtStartDate.Value != "")
                    objEdu.highschoolstartdate = Convert.ToDateTime(txtStartDate.Value);
                if (txtEndDate.Value != "")
                    objEdu.highschoolendate = Convert.ToDateTime(txtEndDate.Value);
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
                objEdu.highschoolverificationrelationship = txtHighSchoolVerificationRelationship.Value;
                objEdu.highschoolverificationemail = txtHighSchoolcontactEmail.Value;
                objEdu.highschoolverificationmobile = txtHighSchoolcontactMobile.Value;
                objEdu.highestdegree = txtHigestEducation.Value;
                /// High School Details End-----

                /// Secondary Details
                if (rblSecondaryYes.Checked)
                    objEdu.issecondarydone = 1;
                else if (rblSecondaryNo.Checked)
                    objEdu.issecondarydone = 2;
                else
                    objEdu.issecondarydone = 3;
                if (ddlSecondaryCountry.SelectedValue != "")
                    objEdu.secondarycountry = Convert.ToInt32(ddlSecondaryCountry.SelectedValue);
                if (txtSecondaryStartDate.Value != "")
                    objEdu.secondarystartdate = Convert.ToDateTime(txtSecondaryStartDate.Value);
                if (txtSecondaryEndDate.Value != "")
                    objEdu.secondaryendate = Convert.ToDateTime(txtSecondaryEndDate.Value);

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
                objEdu.secondaryverificationrelationship = txtSecondaryVerificationRelationship.Value;
                objEdu.secondaryverificationemail = txtSecondarycontactEmail.Value;
                objEdu.secondaryverificationmobile = txtSecondarycontactMobile.Value;

                /// Secondary Details End-----
                /// Diploma
                if (rbldiplomaYes.Checked)
                    objEdu.isdiplomadone = 1;
                else if (rbldiplomaNo.Checked)
                    objEdu.isdiplomadone = 2;
                else
                    objEdu.isdiplomadone = 3;
                if (ddlDiplomaCountry.SelectedValue != "")
                    objEdu.diplomacountry = Convert.ToInt32(ddlDiplomaCountry.SelectedValue);
                if (txtDiplomaStartDate.Value != "")
                    objEdu.diplomastartdate = Convert.ToDateTime(txtDiplomaStartDate.Value);
                if (txtDiplomaEndDate.Value != "")
                    objEdu.diplomaendate = Convert.ToDateTime(txtDiplomaEndDate.Value);
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
                objEdu.diplomaverificationrelationship = txtDiplomaVerificationRelationship.Value;
                objEdu.diplomaverificationemail = txtDiplomacontactEmail.Value;
                objEdu.diplomaverificationmobile = txtDiplomacontactMobile.Value;

                objEdu.lastsavetime = DateTime.Now;
                /// Diploma End-----
                /// 
                if (rblhigherYes.Checked)
                    objEdu.ishighereducation = 1;
                else if (rblhigherNo.Checked)
                    objEdu.ishighereducation = 2;
                else
                    objEdu.ishighereducation = 3;
                db.applicanteducationdetails.Add(objEdu);

            }
            else
            {

                /// High School Details
                if (rblHighYes.Checked)
                    EducationInfo.ishighschooldone = 1;
                else if (rblHighNo.Checked)
                    EducationInfo.ishighschooldone = 2;
                else
                    EducationInfo.ishighschooldone = 3;
                if (ddlCountryHighSchool.SelectedValue != "")
                    EducationInfo.highschoolcountry = Convert.ToInt32(ddlCountryHighSchool.SelectedValue);
                if (txtStartDate.Value != "")
                    EducationInfo.highschoolstartdate = Convert.ToDateTime(txtStartDate.Value);
                if (txtEndDate.Value != "")
                    EducationInfo.highschoolendate = Convert.ToDateTime(txtEndDate.Value);
                EducationInfo.highschoolname = txthighschoolName.Value;
                if (ddlHighSchoolQualificationType.SelectedValue != "")
                    EducationInfo.highschoolqualificationtype = Convert.ToInt32(ddlHighSchoolQualificationType.SelectedValue);
                if (ddlHigherStudyMode.SelectedValue != "")
                    EducationInfo.highschoolmodeid = Convert.ToInt32(ddlHighSchoolStudyMode.SelectedValue);
                if (ddlHighschoolMedium.SelectedValue != "")
                    EducationInfo.highschoolmediumid = Convert.ToInt32(ddlHighschoolMedium.SelectedValue);
                if (ddlHighSchoolGrade.SelectedValue != "")
                    EducationInfo.highschoolgradetypeid = Convert.ToInt32(ddlHighSchoolGrade.SelectedValue);

                if (rblYes.Checked)
                    EducationInfo.highschoolgradedeclared = 1;
                else if (rblYetToConduct.Checked)
                    EducationInfo.highschoolgradedeclared = 2;
                else
                    EducationInfo.highschoolgradedeclared = 3;
                if (txtExpectedHighSchoolResult.Value != "")
                    EducationInfo.highschoolreusltdate = Convert.ToDateTime(txtExpectedHighSchoolResult.Value);
                EducationInfo.highschoolverificationname = txtHighSchoolVerificationName.Value;
                EducationInfo.highschoolverificationrelationship = txtHighSchoolVerificationRelationship.Value;
                EducationInfo.highschoolverificationemail = txtHighSchoolcontactEmail.Value;
                EducationInfo.highschoolverificationmobile = txtHighSchoolcontactMobile.Value;
                EducationInfo.highestdegree = txtHigestEducation.Value;
                /// High School Details End-----

                /// Secondary Details
                if (rblSecondaryYes.Checked)
                    EducationInfo.issecondarydone = 1;
                else if (rblSecondaryNo.Checked)
                    EducationInfo.issecondarydone = 2;
                else
                    EducationInfo.issecondarydone = 3;
                if (ddlSecondaryCountry.SelectedValue != "")
                    EducationInfo.secondarycountry = Convert.ToInt32(ddlSecondaryCountry.SelectedValue);
                if (txtSecondaryStartDate.Value != "")
                    EducationInfo.secondarystartdate = Convert.ToDateTime(txtSecondaryStartDate.Value);
                if (txtSecondaryEndDate.Value != "")
                    EducationInfo.secondaryendate = Convert.ToDateTime(txtSecondaryEndDate.Value);

                EducationInfo.secondaryname = txtSecondarySchoolName.Value;
                if (ddlSecondaryQualificationType.SelectedValue != "")
                    EducationInfo.secondaryqualificationtype = Convert.ToInt32(ddlSecondaryQualificationType.SelectedValue);
                if (ddlSecondaryStudyMode.SelectedValue != "")
                    EducationInfo.secondarymodestudy = Convert.ToInt32(ddlSecondaryStudyMode.SelectedValue);
                if (ddlSecondaryMedium.SelectedValue != "")
                    EducationInfo.secondarymediumstudy = Convert.ToInt32(ddlSecondaryMedium.SelectedValue);
                if (ddlSecondaryGrade.SelectedValue != "")
                    EducationInfo.secondarygradetypeid = Convert.ToInt32(ddlSecondaryGrade.SelectedValue);
                if (rblSecondarygradeachievedYes.Checked)
                    EducationInfo.secondarygradedeclared = 1;
                else if (SecondarygradeachievedYet.Checked)
                    EducationInfo.secondarygradedeclared = 2;
                else
                    EducationInfo.secondarygradedeclared = 3;
                if (txtExpectedSecondaryResult.Value != "")
                    EducationInfo.secondaryresultdate = Convert.ToDateTime(txtExpectedSecondaryResult.Value);

                EducationInfo.secondaryverificationname = txtSecondaryVerificationName.Value;
                EducationInfo.secondaryverificationrelationship = txtSecondaryVerificationRelationship.Value;
                EducationInfo.secondaryverificationemail = txtSecondarycontactEmail.Value;
                EducationInfo.secondaryverificationmobile = txtSecondarycontactMobile.Value;

                /// Secondary Details End-----
                /// Diploma
                if (rbldiplomaYes.Checked)
                    EducationInfo.isdiplomadone = 1;
                else if (rbldiplomaNo.Checked)
                    EducationInfo.isdiplomadone = 2;
                else
                    EducationInfo.isdiplomadone = 3;
                if (ddlDiplomaCountry.SelectedValue != "")
                    EducationInfo.diplomacountry = Convert.ToInt32(ddlDiplomaCountry.SelectedValue);
                if (txtDiplomaStartDate.Value != "")
                    EducationInfo.diplomastartdate = Convert.ToDateTime(txtDiplomaStartDate.Value);
                if (txtDiplomaEndDate.Value != "")
                    EducationInfo.diplomaendate = Convert.ToDateTime(txtDiplomaEndDate.Value);
                EducationInfo.diplomaschoolname = txtDiplomaschoolName.Value;
                if (ddlDiplomaQualificationType.SelectedValue != "")
                    EducationInfo.diplomaqualificationtype = Convert.ToInt32(ddlDiplomaQualificationType.SelectedValue);
                if (ddlDiplomaStudyMode.SelectedValue != "")
                    EducationInfo.diplomastudymodeid = Convert.ToInt32(ddlDiplomaStudyMode.SelectedValue);
                if (ddlDiplomaMedium.SelectedValue != "")
                    EducationInfo.diplomamediumid = Convert.ToInt32(ddlDiplomaMedium.SelectedValue);
                if (ddlDiplomaGrade.SelectedValue != "")
                    EducationInfo.diplomagradetypeid = Convert.ToInt32(ddlDiplomaGrade.SelectedValue);
                if (rblDiplomaGradeYes.Checked)
                    EducationInfo.diplomagradeachieved = 1;
                else if (rblDiplomaGradeYet.Checked)
                    EducationInfo.diplomagradeachieved = 2;
                else
                    EducationInfo.diplomagradeachieved = 3;
                if (txtExpectedDiplomaResult.Value != "")
                    EducationInfo.diplomaresultdate = Convert.ToDateTime(txtExpectedDiplomaResult.Value);

                EducationInfo.diplomaverificationname = txtDiplomaVerificationName.Value;
                EducationInfo.diplomaverificationrelationship = txtDiplomaVerificationRelationship.Value;
                EducationInfo.diplomaverificationemail = txtDiplomacontactEmail.Value;
                EducationInfo.diplomaverificationmobile = txtDiplomacontactMobile.Value;

                EducationInfo.lastsavetime = DateTime.Now;
                /// Diploma End-----
                /// 
                if (rblhigherYes.Checked)
                    EducationInfo.ishighereducation = 1;
                else if (rblhigherNo.Checked)
                    EducationInfo.ishighereducation = 2;
                else
                    EducationInfo.ishighereducation = 3;
                EducationInfo.lastsavetime = DateTime.Now;
            }

            string Cousrsename = ddlCourse.SelectedValue;
            var HigherEducation = (from pInfo in db.applicanthighereducation
                                   where pInfo.applicantid == userID && pInfo.coursename == Cousrsename
                                   select pInfo).FirstOrDefault();

            if (ddlCourse.SelectedValue != "")
            {
                applicanthighereducation objEducation = new applicanthighereducation();
                if (HigherEducation == null)
                {
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
                    if (txtHigherStartDate.Value != "")
                        objEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                    if (txtHigherEndDate.Value != "")
                        objEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
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

                    objEducation.relationshipwithverification = txtHigherVerificationRelationship.Value;
                    objEducation.verificationemail = txtHighercontactEmail.Value;
                    objEducation.verificationname = txtHigherVerificationName.Value;
                    objEducation.verificationmobile = txtHighercontactMobile.Value;

                    db.applicanthighereducation.Add(objEducation);
                }
                else
                {

                    if (rblhigherYes.Checked)
                        HigherEducation.finalgradeacheived = 1;
                    else if (rblhigherNo.Checked)
                        HigherEducation.finalgradeacheived = 2;
                    else
                        HigherEducation.finalgradeacheived = 3;

                    if (ddlHigherCountry.SelectedValue != "")
                        HigherEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                    HigherEducation.coursename = ddlCourse.SelectedValue;
                    if (txtHigherStartDate.Value != "")
                        HigherEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                    if (txtHigherEndDate.Value != "")
                        HigherEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
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

                    HigherEducation.relationshipwithverification = txtHigherVerificationRelationship.Value;
                    HigherEducation.verificationemail = txtHighercontactEmail.Value;
                    HigherEducation.verificationname = txtHigherVerificationName.Value;
                    HigherEducation.verificationmobile = txtHighercontactMobile.Value;
                }
            }
            db.SaveChanges();
            lblMessage.Text = "Your Education Details have been saved";
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
            var HigherEducation = (from pInfo in db.applicanthighereducation
                                   where pInfo.applicantid == userID && pInfo.coursename == ddlCourse.SelectedValue
                                   select pInfo).FirstOrDefault();
            applicanthighereducation objEducation = new applicanthighereducation();
           
            if (HigherEducation == null)
            {
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
                if (txtHigherStartDate.Value != "")
                    objEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                if (txtHigherEndDate.Value != "")
                    objEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
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

                objEducation.relationshipwithverification = txtHigherVerificationRelationship.Value;
                objEducation.verificationemail = txtHighercontactEmail.Value;
                objEducation.verificationname = txtHigherVerificationName.Value;
                objEducation.verificationmobile = txtHighercontactMobile.Value;

                db.applicanthighereducation.Add(objEducation);
            }
            else
            {

                if (rblhigherYes.Checked)
                    HigherEducation.finalgradeacheived = 1;
                else if (rblhigherNo.Checked)
                    HigherEducation.finalgradeacheived = 2;
                else
                    HigherEducation.finalgradeacheived = 3;

                if (ddlHigherCountry.SelectedValue != "")
                    HigherEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                HigherEducation.coursename = ddlCourse.SelectedValue;
                if (txtHigherStartDate.Value != "")
                    HigherEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                if (txtHigherEndDate.Value != "")
                    HigherEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
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

                HigherEducation.relationshipwithverification = txtHigherVerificationRelationship.Value;
                HigherEducation.verificationemail = txtHighercontactEmail.Value;
                HigherEducation.verificationname = txtHigherVerificationName.Value;
                HigherEducation.verificationmobile = txtHighercontactMobile.Value;
            }
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
                                             where qcm.countriesid == country
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
                           where a.applicantid == userID && a.courseid == "tenth"

                           select new
                           {
                               applicantgradeid = a.applicantgradeid,
                               courseid = a.courseid,
                               subject = a.subject,
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
                                where a.applicantid == userID && a.courseid == "diploma"

                                select new
                                {
                                    applicantgradeid = a.applicantgradeid,
                                    courseid = a.courseid,
                                    subject = a.subject,
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
                                  where a.applicantid == userID && a.courseid == "twelth"

                                  select new
                                  {
                                      applicantgradeid = a.applicantgradeid,
                                      courseid = a.courseid,
                                      subject = a.subject,
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
                               where a.applicantid == userID && (a.courseid == "UG" || a.courseid == "PG" || a.courseid == "Phd" || a.courseid == "Other")

                               select new
                               {
                                   applicantgradeid = a.applicantgradeid,
                                   courseid = a.courseid,
                                   subject = a.subject,
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
                               where a.applicantid == userID

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
                        LinkButton lb = (LinkButton)row.Cells[4].Controls[0];
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
                        LinkButton lb = (LinkButton)row.Cells[4].Controls[0];
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
                        LinkButton lb = (LinkButton)row.Cells[4].Controls[0];
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
                        LinkButton lb = (LinkButton)row.Cells[4].Controls[0];
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
                int courseid = Convert.ToInt32(e.CommandArgument.ToString());

                var HigherEducation = (from pInfo in db.applicanthighereducation
                                       where pInfo.applicantid == userID && pInfo.applicanthighereducationid == courseid
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
                if (txtHigherStartDate.Value != "")
                    HigherEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                if (txtHigherEndDate.Value != "")
                    HigherEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
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

                HigherEducation.relationshipwithverification = txtHigherVerificationRelationship.Value;
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