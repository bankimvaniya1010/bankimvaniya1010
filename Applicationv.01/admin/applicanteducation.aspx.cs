using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicanteducation : System.Web.UI.Page
{
    int formId = 0;
    int adminId = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string CourseName = "";
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected List<applicanthighereducation> HigherEducation = new List<applicanthighereducation>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();        
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminId = Convert.ToInt32(Session["UserID"]);
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

            SetToolTips();
            SetAdminComments();
            EducationDetails();
            bind10grade();
            bindSecondarygrade();
            binddiplomagrade();
            bindhighergrade();
            // bindhigherCourses();
            SetControlsUniversitywise();
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
                    case "HAVE YOU COMPLETED HIGH SCHOOL":
                        highschool.Attributes.Add("style", "display:block;");
                        labelhighschool.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF HIGH SCHOOL":
                        highschoolCountry.Attributes.Add("style", "display:block;");
                        labelhighschoolCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "START DATE":
                        highschoolstartDate.Attributes.Add("style", "display:block;");
                        labelhighschoolstartDate.InnerHtml = setInnerHtml(fields[k]);
                        SecondarystartDate.Attributes.Add("style", "display:block;");
                        labelSecondarystartDate.InnerHtml = setInnerHtml(fields[k]);
                        diplomastartDate.Attributes.Add("style", "display:block;");
                        labeldiplomastartDate.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDate.Attributes.Add("style", "display:block;");
                        labelhigherstartDate.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDatePG.Attributes.Add("style", "display:block;");
                        labelhigherstartDatePG.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDatePhd.Attributes.Add("style", "display:block;");
                        labelhigherstartDatePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDateOther.Attributes.Add("style", "display:block;");
                        labelhigherstartDateOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "END DATE":
                        highschoolendDate.Attributes.Add("style", "display:block;");
                        labelhighschoolendDate.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryendDate.Attributes.Add("style", "display:block;");
                        labelSecondaryendDate.InnerHtml = setInnerHtml(fields[k]);
                        diplomaendDate.Attributes.Add("style", "display:block;");
                        labeldiplomaendDate.InnerHtml = setInnerHtml(fields[k]);
                        higherendDate.Attributes.Add("style", "display:block;");
                        labelhigherendDate.InnerHtml = setInnerHtml(fields[k]);
                        higherendDatePG.Attributes.Add("style", "display:block;");
                        labelhigherendDatePG.InnerHtml = setInnerHtml(fields[k]);
                        higherendDatePhd.Attributes.Add("style", "display:block;");
                        labelhigherendDatePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherendDateOther.Attributes.Add("style", "display:block;");
                        labelhigherendDateOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF SCHOOL":
                        highschoolName.Attributes.Add("style", "display:block;");
                        labelhighschoolName.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryschoolName.Attributes.Add("style", "display:block;");
                        labelSecondaryschoolName.InnerHtml = setInnerHtml(fields[k]);
                        diplomaschoolName.Attributes.Add("style", "display:block;");
                        labeldiplomaschoolName.InnerHtml = setInnerHtml(fields[k]);
                        higherschoolName.Attributes.Add("style", "display:block;");
                        labelhigherschoolName.InnerHtml = setInnerHtml(fields[k]);
                        higherschoolNamePG.Attributes.Add("style", "display:block;");
                        labelhigherschoolNamePG.InnerHtml = setInnerHtml(fields[k]);
                        higherschoolNamePhd.Attributes.Add("style", "display:block;");
                        labelhigherschoolNamePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherschoolNameOther.Attributes.Add("style", "display:block;");
                        labelhigherschoolNameOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "QUALIFICATION NAME":
                        highschoolQualificationtype.Attributes.Add("style", "display:block;");
                        labelhighschoolQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryQualificationtype.Attributes.Add("style", "display:block;");
                        labelSecondaryQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        diplomaQualificationtype.Attributes.Add("style", "display:block;");
                        labeldiplomaQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtype.Attributes.Add("style", "display:block;");
                        labelhigherQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtypePG.Attributes.Add("style", "display:block;");
                        labelhigherQualificationtypePG.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtypePhd.Attributes.Add("style", "display:block;");
                        labelhigherQualificationtypePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtypeOther.Attributes.Add("style", "display:block;");
                        labelhigherQualificationtypeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "MODE OF STUDY":
                        highschoolstudymode.Attributes.Add("style", "display:block;");
                        labelhighschoolstudymode.InnerHtml = setInnerHtml(fields[k]);
                        Secondarystudymode.Attributes.Add("style", "display:block;");
                        labelSecondarystudymode.InnerHtml = setInnerHtml(fields[k]);
                        diplomastudymode.Attributes.Add("style", "display:block;");
                        labeldiplomastudymode.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymode.Attributes.Add("style", "display:block;");
                        labelhigherstudymode.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymodePG.Attributes.Add("style", "display:block;");
                        labelhigherstudymodePG.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymodePhd.Attributes.Add("style", "display:block;");
                        labelhigherstudymodePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymodeOther.Attributes.Add("style", "display:block;");
                        labelhigherstudymodeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LANGUAGE (MEDIUM) OF STUDY":
                        highschoollanguage.Attributes.Add("style", "display:block;");
                        labelhighschoollanguage.InnerHtml = setInnerHtml(fields[k]);
                        Secondarylanguage.Attributes.Add("style", "display:block;");
                        labelSecondarylanguage.InnerHtml = setInnerHtml(fields[k]);
                        diplomalanguage.Attributes.Add("style", "display:block;");
                        labeldiplomalanguage.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguage.Attributes.Add("style", "display:block;");
                        labelhigherlanguage.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguagePG.Attributes.Add("style", "display:block;");
                        labelhigherlanguagePG.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguagePhd.Attributes.Add("style", "display:block;");
                        labelhigherlanguagePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguageOther.Attributes.Add("style", "display:block;");
                        labelhigherlanguageOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GRADE TYPE":
                        gradetype.Attributes.Add("style", "display:block;");
                        labelgradetype.InnerHtml = setInnerHtml(fields[k]);
                        Secondarygradetype.Attributes.Add("style", "display:block;");
                        labelSecondarygradetype.InnerHtml = setInnerHtml(fields[k]);
                        diplomagradetype.Attributes.Add("style", "display:block;");
                        labeldiplomagradetype.InnerHtml = setInnerHtml(fields[k]);
                        highergradetype.Attributes.Add("style", "display:block;");
                        labelhighergradetype.InnerHtml = setInnerHtml(fields[k]);
                        highergradetypePG.Attributes.Add("style", "display:block;");
                        labelhighergradetypePG.InnerHtml = setInnerHtml(fields[k]);
                        highergradetypePhd.Attributes.Add("style", "display:block;");
                        labelhighergradetypePhd.InnerHtml = setInnerHtml(fields[k]);
                        highergradetypeOther.Attributes.Add("style", "display:block;");
                        labelhighergradetypeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FINAL GRADE ACHIEVED":
                        highschoolgradeachieved.Attributes.Add("style", "display:block;");
                        labelgradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        Secondarygradeachieved.Attributes.Add("style", "display:block;");
                        labelSecondarygradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        diplomagradeachieved.Attributes.Add("style", "display:block;");
                        labeldiplomagradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachieved.Attributes.Add("style", "display:block;");
                        labelhighergradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachievedPG.Attributes.Add("style", "display:block;");
                        labelhighergradeachievedPG.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachievedPhd.Attributes.Add("style", "display:block;");
                        labelhighergradeachievedPhd.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachievedOther.Attributes.Add("style", "display:block;");
                        labelhighergradeachievedOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                        ExpectedHighSchoolDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedHighSchoolDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedSecondaryDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedSecondaryDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedDiplomaDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedDiplomaDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedHigherDategrade.Attributes.Add("style", "display:block;");
                        labelExpectedHigherDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedHigherDategradePG.Attributes.Add("style", "display:block;");
                        labelExpectedHigherDategradePG.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedHigherDategradePhd.Attributes.Add("style", "display:block;");
                        labelExpectedHigherDategradePhd.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedHigherDategradeOther.Attributes.Add("style", "display:block;");
                        labelExpectedHigherDategradeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                        highschoolverify.Attributes.Add("style", "display:block;");
                        labelhighschoolverify.InnerHtml = setInnerHtml(fields[k]);
                        Secondaryverify.Attributes.Add("style", "display:block;");
                        labelSecondaryverify.InnerHtml = setInnerHtml(fields[k]);
                        diplomaverify.Attributes.Add("style", "display:block;");
                        labeldiplomaverify.InnerHtml = setInnerHtml(fields[k]);
                        higherverify.Attributes.Add("style", "display:block;");
                        labelhigherverify.InnerHtml = setInnerHtml(fields[k]);
                        higherverifyPG.Attributes.Add("style", "display:block;");
                        labelhigherverifyPG.InnerHtml = setInnerHtml(fields[k]);
                        higherverifyPhd.Attributes.Add("style", "display:block;");
                        labelhigherverifyPhd.InnerHtml = setInnerHtml(fields[k]);
                        higherverifyOther.Attributes.Add("style", "display:block;");
                        labelhigherverifyOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        highschoolrelation.Attributes.Add("style", "display:block;");
                        labelhighschoolrelation.InnerHtml = setInnerHtml(fields[k]);
                        secondaryschoolrelation.Attributes.Add("style", "display:block;");
                        labelsecondaryschoolrelation.InnerHtml = setInnerHtml(fields[k]);
                        diplomarelation.Attributes.Add("style", "display:block;");
                        labeldiplomarelation.InnerHtml = setInnerHtml(fields[k]);
                        higherrelation.Attributes.Add("style", "display:block;");
                        labelhigherrelation.InnerHtml = setInnerHtml(fields[k]);
                        higherrelationPG.Attributes.Add("style", "display:block;");
                        labelhigherrelationPG.InnerHtml = setInnerHtml(fields[k]);
                        higherrelationPhd.Attributes.Add("style", "display:block;");
                        labelhigherrelationPhd.InnerHtml = setInnerHtml(fields[k]);
                        higherrelationOther.Attributes.Add("style", "display:block;");
                        labelhigherrelationOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactEmail.Attributes.Add("style", "display:block;");
                        labelhighschoolcontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        secondarycontactEmail.Attributes.Add("style", "display:block;");
                        labelsecondarycontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        diplomacontactEmail.Attributes.Add("style", "display:block;");
                        labeldiplomacontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmail.Attributes.Add("style", "display:block;");
                        labelhighercontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmailPG.Attributes.Add("style", "display:block;");
                        labelhighercontactEmailPG.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmailPhd.Attributes.Add("style", "display:block;");
                        labelhighercontactEmailPhd.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmailOther.Attributes.Add("style", "display:block;");
                        labelhighercontactEmailOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactMobile.Attributes.Add("style", "display:block;");
                        labelhighschoolcontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        secondarycontactMobile.Attributes.Add("style", "display:block;");
                        labelsecondarycontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        diplomacontactMobile.Attributes.Add("style", "display:block;");
                        labeldiplomacontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobile.Attributes.Add("style", "display:block;");
                        labelhighercontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobilePG.Attributes.Add("style", "display:block;");
                        labelhighercontactMobilePG.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobilePhd.Attributes.Add("style", "display:block;");
                        labelhighercontactMobilePhd.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobileOther.Attributes.Add("style", "display:block;");
                        labelhighercontactMobileOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                  
                    case "HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL? (YEAR 12)":
                        Secondary.Attributes.Add("style", "display:block;");
                        labelSecondary.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF SECONDARY EDUCATION":
                        SecondaryCountry.Attributes.Add("style", "display:block;");
                        labelSecondaryCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    //case "Add Subject and their Grades":
                    //    highshoolgrade.Attributes.Add("style", "display:block;");
                    //    btn10th.Value = setInnerHtml(fields[k]);
                    //    secondarygrade.Attributes.Add("style", "display:block;");
                    //    btn12th.Value = setInnerHtml(fields[k]);
                    //    highergrade.Attributes.Add("style", "display:block;");
                    //    btnhigher.Value = setInnerHtml(fields[k]);
                    //    diplomagrade.Attributes.Add("style", "display:block;");
                    //    btndiploma.Value = setInnerHtml(fields[k]);
                    //    break;
                    case "HAVE YOU COMPLETED ANY HIGHER (UNDER GRADUATE, MASTERS OR PHD) DEGREE":
                        higher.Attributes.Add("style", "display:block;");
                        labelhigher.InnerHtml = setInnerHtml(fields[k]);
                        break;


                    case "HIGHER COURSE":
                        //highercourse.Attributes.Add("style", "display:block;");
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
                    case "HAVE YOU COMPLETED HIGH SCHOOL":
                        ichighschool.Attributes.Add("style", "display:block;");
                        ichighschool.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF HIGH SCHOOL":
                        ichighschoolCountry.Attributes.Add("style", "display:block;");
                        ichighschoolCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "START DATE":
                        ichighschoolstartDate.Attributes.Add("style", "display:block;");
                        ichighschoolstartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarystartDate.Attributes.Add("style", "display:block;");
                        icSecondarystartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomastartDate.Attributes.Add("style", "display:block;");
                        icdiplomastartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstartDate.Attributes.Add("style", "display:block;");
                        ichigherstartDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstartDatePG.Attributes.Add("style", "display:block;");
                        ichigherstartDatePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstartDatePhd.Attributes.Add("style", "display:block;");
                        ichigherstartDatePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstartDateOther.Attributes.Add("style", "display:block;");
                        ichigherstartDateOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "END DATE":
                        ichighschoolendDate.Attributes.Add("style", "display:block;");
                        ichighschoolendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryendDate.Attributes.Add("style", "display:block;");
                        icSecondaryendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaendDate.Attributes.Add("style", "display:block;");
                        icdiplomaendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherendDate.Attributes.Add("style", "display:block;");
                        ichigherendDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherendDatePG.Attributes.Add("style", "display:block;");
                        ichigherendDatePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherendDatePhd.Attributes.Add("style", "display:block;");
                        ichigherendDatePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherendDatePhd.Attributes.Add("style", "display:block;");
                        ichigherendDatePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF SCHOOL":
                        ichighschoolName.Attributes.Add("style", "display:block;");
                        ichighschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryschoolName.Attributes.Add("style", "display:block;");
                        icSecondaryschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaschoolName.Attributes.Add("style", "display:block;");
                        icdiplomaschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherschoolName.Attributes.Add("style", "display:block;");
                        ichigherschoolName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherschoolNamePG.Attributes.Add("style", "display:block;");
                        ichigherschoolNamePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherschoolNamePhd.Attributes.Add("style", "display:block;");
                        ichigherschoolNamePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherschoolNameOther.Attributes.Add("style", "display:block;");
                        ichigherschoolNameOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "QUALIFICATION NAME":
                        ichighschoolQualificationtype.Attributes.Add("style", "display:block;");
                        ichighschoolQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryQualificationtype.Attributes.Add("style", "display:block;");
                        icSecondaryQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaQualificationtype.Attributes.Add("style", "display:block;");
                        icdiplomaQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherQualificationtype.Attributes.Add("style", "display:block;");
                        ichigherQualificationtype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherQualificationtypePG.Attributes.Add("style", "display:block;");
                        ichigherQualificationtypePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherQualificationtypePhd.Attributes.Add("style", "display:block;");
                        ichigherQualificationtypePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherQualificationtypeOther.Attributes.Add("style", "display:block;");
                        ichigherQualificationtypeOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;

                    case "MODE OF STUDY":
                        ichighschoolstudymode.Attributes.Add("style", "display:block;");
                        ichighschoolstudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarystudymode.Attributes.Add("style", "display:block;");
                        icSecondarystudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomastudymode.Attributes.Add("style", "display:block;");
                        icdiplomastudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstudymode.Attributes.Add("style", "display:block;");
                        ichigherstudymode.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstudymodePG.Attributes.Add("style", "display:block;");
                        ichigherstudymodePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstudymodePhd.Attributes.Add("style", "display:block;");
                        ichigherstudymodePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherstudymodeOther.Attributes.Add("style", "display:block;");
                        ichigherstudymodeOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LANGUAGE (MEDIUM) OF STUDY":
                        ichighschoollanguage.Attributes.Add("style", "display:block;");
                        ichighschoollanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarylanguage.Attributes.Add("style", "display:block;");
                        icSecondarylanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomalanguage.Attributes.Add("style", "display:block;");
                        icdiplomalanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherlanguage.Attributes.Add("style", "display:block;");
                        ichigherlanguage.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherlanguagePG.Attributes.Add("style", "display:block;");
                        ichigherlanguagePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherlanguagePhd.Attributes.Add("style", "display:block;");
                        ichigherlanguagePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherlanguageOther.Attributes.Add("style", "display:block;");
                        ichigherlanguageOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "GRADE TYPE":
                        icgradetype.Attributes.Add("style", "display:block;");
                        icgradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarygradetype.Attributes.Add("style", "display:block;");
                        icSecondarygradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomagradetype.Attributes.Add("style", "display:block;");
                        icdiplomagradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradetype.Attributes.Add("style", "display:block;");
                        ichighergradetype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradetypePG.Attributes.Add("style", "display:block;");
                        ichighergradetypePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradetypePhd.Attributes.Add("style", "display:block;");
                        ichighergradetypePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradetypeOther.Attributes.Add("style", "display:block;");
                        ichighergradetypeOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "FINAL GRADE ACHIEVED":
                        ichighschoolgradeachieved.Attributes.Add("style", "display:block;");
                        ichighschoolgradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondarygradeachieved.Attributes.Add("style", "display:block;");
                        icSecondarygradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomagradeachieved.Attributes.Add("style", "display:block;");
                        icdiplomagradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradeachieved.Attributes.Add("style", "display:block;");
                        ichighergradeachieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradeachievedPG.Attributes.Add("style", "display:block;");
                        ichighergradeachievedPG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradeachievedPhd.Attributes.Add("style", "display:block;");
                        ichighergradeachievedPhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighergradeachievedOther.Attributes.Add("style", "display:block;");
                        ichighergradeachievedOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                        icExpectedHighSchoolDategrade.Attributes.Add("style", "display:block;");
                        icExpectedHighSchoolDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedSecondaryDategrade.Attributes.Add("style", "display:block;");
                        icExpectedSecondaryDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedDiplomaDategrade.Attributes.Add("style", "display:block;");
                        icExpectedDiplomaDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedHigherDategrade.Attributes.Add("style", "display:block;");
                        icExpectedHigherDategrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedHigherDategradePG.Attributes.Add("style", "display:block;");
                        icExpectedHigherDategradePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedHigherDategradePhd.Attributes.Add("style", "display:block;");
                        icExpectedHigherDategradePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icExpectedHigherDategradeOther.Attributes.Add("style", "display:block;");
                        icExpectedHigherDategradeOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                        ichighschoolverify.Attributes.Add("style", "display:block;");
                        ichighschoolverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icSecondaryverify.Attributes.Add("style", "display:block;");
                        icSecondaryverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomaverify.Attributes.Add("style", "display:block;");
                        icdiplomaverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherverify.Attributes.Add("style", "display:block;");
                        ichigherverify.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherverifyPG.Attributes.Add("style", "display:block;");
                        ichigherverifyPG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherverifyPhd.Attributes.Add("style", "display:block;");
                        ichigherverifyPhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherverifyOther.Attributes.Add("style", "display:block;");
                        ichigherverifyOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        ichighschoolrelation.Attributes.Add("style", "display:block;");
                        ichighschoolrelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icsecondaryschoolrelation.Attributes.Add("style", "display:block;");
                        icsecondaryschoolrelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomarelation.Attributes.Add("style", "display:block;");
                        icdiplomarelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherrelation.Attributes.Add("style", "display:block;");
                        ichigherrelation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherrelationPG.Attributes.Add("style", "display:block;");
                        ichigherrelationPG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherrelationPhd.Attributes.Add("style", "display:block;");
                        ichigherrelationPhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichigherrelationOther.Attributes.Add("style", "display:block;");
                        ichigherrelationOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        ichighschoolcontactEmail.Attributes.Add("style", "display:block;");
                        ichighschoolcontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icsecondarycontactEmail.Attributes.Add("style", "display:block;");
                        icsecondarycontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomacontactEmail.Attributes.Add("style", "display:block;");
                        icdiplomacontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactEmail.Attributes.Add("style", "display:block;");
                        ichighercontactEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactEmailPG.Attributes.Add("style", "display:block;");
                        ichighercontactEmailPG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactEmailPhd.Attributes.Add("style", "display:block;");
                        ichighercontactEmailPhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactEmailOther.Attributes.Add("style", "display:block;");
                        ichighercontactEmailOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        ichighschoolcontactMobile.Attributes.Add("style", "display:block;");
                        ichighschoolcontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icsecondarycontactMobile.Attributes.Add("style", "display:block;");
                        icsecondarycontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icdiplomacontactMobile.Attributes.Add("style", "display:block;");
                        icdiplomacontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactMobile.Attributes.Add("style", "display:block;");
                        ichighercontactMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactMobilePG.Attributes.Add("style", "display:block;");
                        ichighercontactMobilePG.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactMobilePhd.Attributes.Add("style", "display:block;");
                        ichighercontactMobilePhd.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        ichighercontactMobileOther.Attributes.Add("style", "display:block;");
                        ichighercontactMobileOther.Attributes.Add("data-tipso", setTooltips(fields[k]));
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

    private void EducationDetails()
    {
        try
        {
            var EducationInfo = (from pInfo in db.applicanteducationdetails
                                 where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                                 select pInfo).FirstOrDefault();
            if (EducationInfo != null)
            {
                if (EducationInfo.ishighschooldone == 1)
                {
                    lblhighschool.Text = "Yes";
                    BindHighSchoolDetails(EducationInfo);
                   // higestEducation.Visible = false;
                }
                else if (EducationInfo.ishighschooldone == 2)
                {
                    lblhighschool.Text = "No- I am currently studying for my high school qualification";
                    BindHighSchoolDetails(EducationInfo);
                //    higestEducation.Visible = false;
                }
                else
                {
                    lblhighschool.Text = "No- I do not have a high school qualification ";
                    //lblhigestEducation.Text = EducationInfo.highestdegree;
                    HideHighSchool();
                }

                /// High School Details End-----

                /// Secondary Details
                /// 
                if (EducationInfo.issecondarydone == 1)
                {
                    lblSecondary.Text = "Yes";
                    BindSecondary(EducationInfo);
                }
                else if (EducationInfo.issecondarydone == 2)
                {
                    lblSecondary.Text = "No - I am currently still studying for my Senior Secondary";
                    BindSecondary(EducationInfo);
                }
                else
                {
                    lblSecondary.Text = "No - I do not have a Senior Secondary qualification";
                    HideSecondary();
                }


                /// Secondary Details End-----
                /// Diploma
                /// 
                if (EducationInfo.isdiplomadone == 1)
                {
                    BindDiploma(EducationInfo);
                    lbldiploma.Text = "Yes";
                }
                else if (EducationInfo.isdiplomadone == 2)
                {
                    BindDiploma(EducationInfo);
                    lbldiploma.Text = "I am currently studying for my Diploma/Certificate";
                }
                else
                {
                    lbldiploma.Text = "No - I do not have a Diploma/Certificate qualification";
                    HideDiploma();
                }


                if (EducationInfo.ishighereducation == 1)
                    lblhigher.Text = "Yes";
                else if (EducationInfo.ishighereducation == 2)
                    lblhigher.Text = "I am currently studying for my higher qualification";
                else
                    lblhigher.Text = "No- I do not have a higher qualification";

            }
            else
            {
                HideHighSchool();
                HideSecondary();
                HideDiploma();
            }
            HigherEducation = (from pInfo in db.applicanthighereducation
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).ToList();
            if (HigherEducation == null)
            {
                UG.Attributes.Add("style", "display: none");
                PG.Attributes.Add("style", "display: none");
                Phd.Attributes.Add("style", "display: none");
                highercourseOther.Attributes.Add("style", "display: none");
            }
            else
                BindHigher(HigherEducation);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bind10grade()
    {
        try
        {
            var grade10 = (from a in db.applicantsubjectwisegrade
                           join g in db.grademaster on a.gradeid equals g.id
                           join sm in db.subjectmaster on a.subjectid equals sm.id into tmp
                           from x in tmp.DefaultIfEmpty()
                           where a.applicantid == ApplicantID && a.coursename == "tenth"

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
                                where a.applicantid == ApplicantID && a.coursename == "diploma"

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
                                  where a.applicantid == ApplicantID && a.coursename == "twelth"

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
                               where a.applicantid == ApplicantID && (a.coursename == "UG" || a.coursename == "PG" || a.coursename == "Phd" || a.coursename == "Other")

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

    //private void bindhigherCourses()
    //{
    //    try
    //    {
    //        var gradehigher = (from a in db.applicanthighereducation
    //                           where a.applicantid == ApplicantID && a.universityid == universityID

    //                           select new
    //                           {
    //                               applicanthighereducationid = a.applicanthighereducationid,
    //                               coursename = a.coursename,
    //                               schoolname = a.schoolname,
    //                               startdate = a.startdate,
    //                               endate = a.endate
    //                           }).ToList();
    //        grdHigherCourses.DataSource = gradehigher;
    //        grdHigherCourses.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    private void BindHighSchoolDetails(applicanteducationdetails EducationInfo)
    {
        if (EducationInfo.highschoolcountry != null)
        {
            lblhighschoolCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo.highschoolcountry));
        }
        if (EducationInfo.highschoolstartdate != null)
        {
            lblhighschoolstartDate.Text = EducationInfo.highschoolstartdate;
        }
        if (EducationInfo.highschoolendate != null)
        {
            lblhighschoolendDate.Text = EducationInfo.highschoolendate.ToString();
        }
        lblhighschoolName.Text = EducationInfo.highschoolname;
        if (EducationInfo.highschoolqualificationtype != null)
        {
            lblhighschoolQualificationtype.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo.highschoolqualificationtype));
        }
        if (EducationInfo.highschoolmodeid != null)
        {
            lblhighschoolstudymode.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo.highschoolmodeid));
        }

        if (EducationInfo.highschoolmediumid != null)
        {
            lblhighschoollanguage.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo.highschoolmediumid));
        }
        if (EducationInfo.highschoolgradetypeid != null)
        {
            lblgradetype.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo.highschoolgradetypeid));
        }

        if (EducationInfo.highschoolgradedeclared == 1)
            lblgradeachieved.Text = "Results Declared";
        else if (EducationInfo.highschoolgradedeclared == 2)
            lblgradeachieved.Text = "Examination not conducted yet";
        else
            lblgradeachieved.Text = "Examination Conducted, but Result not declared";
        if (EducationInfo.highschoolreusltdate != null)
            lblExpectedHighSchoolDategrade.Text = Convert.ToDateTime(EducationInfo.highschoolreusltdate).ToString("yyyy-MM-dd");
        lblhighschoolverify.Text = EducationInfo.highschoolverificationname;

        if (EducationInfo.highschoolverificationrelationship != null)
        {
            lblhighschoolrelation.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo.highschoolverificationrelationship));
        }
        lblhighschoolcontactEmail.Text = EducationInfo.highschoolverificationemail;
        lblhighschoolcontactMobile.Text = EducationInfo.highschoolverificationmobile;

    }
    private void BindSecondary(applicanteducationdetails EducationInfo)
    {
        if (EducationInfo.secondarycountry != null)
        {
            lblSecondaryCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo.secondarycountry));
        }
        if (EducationInfo.secondaryresultdate != null)
            lblExpectedSecondaryDategrade.Text = Convert.ToDateTime(EducationInfo.secondaryresultdate).ToString("yyyy-MM-dd");
        if (EducationInfo.secondarystartdate != null)
        {
            lblSecondarystartDate.Text = EducationInfo.secondarystartdate;
        }
        if (EducationInfo.secondaryendate != null)
        {
            lblSecondaryendDate.Text = EducationInfo.secondaryendate;
        }

        lblSecondaryschoolName.Text = EducationInfo.secondaryname;
        if (EducationInfo.secondaryqualificationtype != null)
        {
            lblSecondaryQualificationtype.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo.secondaryqualificationtype));
        }
        if (EducationInfo.secondarymodestudy != null)
        {
            lblSecondarystudymode.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo.secondarymodestudy));
        }

        if (EducationInfo.secondarymediumstudy != null)
        {
            lblSecondarylanguage.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo.secondarymediumstudy));
        }
        if (EducationInfo.secondarygradetypeid != null)
        {
            lblSecondarygradetype.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo.secondarygradetypeid));
        }


        if (EducationInfo.secondarygradedeclared == 1)
            lblSecondarygradeachieved.Text = "Results Declared";
        else if (EducationInfo.secondarygradedeclared == 2)
            lblSecondarygradeachieved.Text = "Examination not conducted yet";
        else
            lblSecondarygradeachieved.Text = "Examination Conducted, but Result not declared";


        lblSecondaryverify.Text = EducationInfo.secondaryverificationname;
        if (EducationInfo.secondaryverificationrelationship != null)
        {
            lblsecondaryschoolrelation.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo.secondaryverificationrelationship));
        }


        lblsecondarycontactEmail.Text = EducationInfo.secondaryverificationemail;
        lblsecondarycontactMobile.Text = EducationInfo.secondaryverificationmobile;
    }
    private void BindDiploma(applicanteducationdetails EducationInfo)
    {
        if (EducationInfo.diplomacountry != null)
        {
            lbldiplomaCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo.diplomagradetypeid));
        }
        if (EducationInfo.diplomastartdate != null)
        {

            lbldiplomastartDate.Text = EducationInfo.diplomastartdate;
        }
        if (EducationInfo.diplomaendate != null)
        {

            lbldiplomaendDate.Text = EducationInfo.diplomaendate;
        }

        lbldiplomaschoolName.Text = EducationInfo.diplomaschoolname;

        if (EducationInfo.diplomaqualificationtype != null)
        {
            lbldiplomaQualificationtype.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo.diplomaqualificationtype));
        }
        if (EducationInfo.diplomastudymodeid != null)
        {
            lbldiplomastudymode.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo.diplomastudymodeid));
        }
        if (EducationInfo.diplomamediumid != null)
        {
            lbldiplomalanguage.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo.diplomamediumid));
        }
        if (EducationInfo.diplomagradetypeid != null)
        {
            lbldiplomagradetype.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo.diplomagradetypeid));
        }
        if (EducationInfo.diplomagradeachieved == 1)
            lbldiplomagradeachieved.Text = "Results Declared";
        else if (EducationInfo.diplomagradeachieved == 2)
            lbldiplomagradeachieved.Text = "Examination not conducted yet";
        else
            lbldiplomagradeachieved.Text = "Examination Conducted, but Result not declared";


        if (EducationInfo.diplomaresultdate != null)
            lblExpectedDiplomaDategrade.Text = Convert.ToDateTime(EducationInfo.diplomaresultdate).ToString("yyyy-MM-dd");
        lbldiplomaverify.Text = EducationInfo.diplomaverificationname;
        if (EducationInfo.diplomaverificationrelationship != null)
        {
            lbldiplomarelation.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo.diplomaverificationrelationship));
        }

        lbldiplomacontactEmail.Text = EducationInfo.diplomaverificationemail;
        lbldiplomacontactMobile.Text = EducationInfo.diplomaverificationmobile;
    }
    private void BindHigher(List<applicanthighereducation> EducationInfo)
    {
        for (int k = 0; k < EducationInfo.Count; k++)
        {
            if (EducationInfo[k].coursename.ToLower() == "pg")
            {
                PG.Attributes.Add("style", "display: block");
                lblhighercoursePG.Text = EducationInfo[k].coursename;
                if (EducationInfo[k].countryofhighereducation != null)
                {
                    lblhigherCountryPG.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo[k].countryofhighereducation));
                }
                if (EducationInfo[k].startdate != null)
                {
                    lblhigherstartDatePG.Text = EducationInfo[k].startdate;
                }
                if (EducationInfo[k].endate != null)
                {

                    lblhigherendDatePG.Text = EducationInfo[k].endate;
                }

                lblhigherschoolNamePG.Text = EducationInfo[k].schoolname;

                if (EducationInfo[k].qualificationtype != null)
                {
                    lblhigherQualificationtypePG.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo[k].qualificationtype));
                }
                if (EducationInfo[k].studymodeid != null)
                {
                    lblhigherstudymodePG.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo[k].studymodeid));
                }
                if (EducationInfo[k].studymediumid != null)
                {
                    lblhigherlanguagePG.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo[k].studymediumid));
                }
                if (EducationInfo[k].gradetypeid != null)
                {
                    lblhighergradetypePG.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo[k].gradetypeid));
                }
                if (EducationInfo[k].finalgradeacheived == 1)
                    lblhighergradeachievedPG.Text = "Results Declared";
                else if (EducationInfo[k].finalgradeacheived == 2)
                    lblhighergradeachievedPG.Text = "Examination not conducted yet";
                else
                    lblhighergradeachievedPG.Text = "Examination Conducted, but Result not declared";


                if (EducationInfo[k].resultdate != null)
                    lblExpectedHigherDategradePG.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
                lblhigherverifyPG.Text = EducationInfo[k].verificationname;
                if (EducationInfo[k].relationshipwithverification != null)
                {
                    lblhigherrelationPG.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo[k].relationshipwithverification));
                }

                lblhighercontactEmailPG.Text = EducationInfo[k].verificationemail;
                lblhighercontactMobilePG.Text = EducationInfo[k].verificationmobile;
            }
            else if (EducationInfo[k].coursename.ToLower() == "phd")
            {
                Phd.Attributes.Add("style", "display: block");
                lblhighercoursePhd.Text = EducationInfo[k].coursename;
                if (EducationInfo[k].countryofhighereducation != null)
                {
                    lblhigherCountryPhd.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo[k].countryofhighereducation));
                }
                if (EducationInfo[k].startdate != null)
                {
                    lblhigherstartDatePhd.Text = EducationInfo[k].startdate;
                }
                if (EducationInfo[k].endate != null)
                {

                    lblhigherendDatePhd.Text = EducationInfo[k].endate;
                }

                lblhigherschoolNamePhd.Text = EducationInfo[k].schoolname;

                if (EducationInfo[k].qualificationtype != null)
                {
                    lblhigherQualificationtypePhd.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo[k].qualificationtype));
                }
                if (EducationInfo[k].studymodeid != null)
                {
                    lblhigherstudymodePhd.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo[k].studymodeid));
                }
                if (EducationInfo[k].studymediumid != null)
                {
                    lblhigherlanguagePhd.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo[k].studymediumid));
                }
                if (EducationInfo[k].gradetypeid != null)
                {
                    lblhighergradetypePhd.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo[k].gradetypeid));
                }
                if (EducationInfo[k].finalgradeacheived == 1)
                    lblhighergradeachievedPhd.Text = "Results Declared";
                else if (EducationInfo[k].finalgradeacheived == 2)
                    lblhighergradeachievedPhd.Text = "Examination not conducted yet";
                else
                    lblhighergradeachievedPhd.Text = "Examination Conducted, but Result not declared";


                if (EducationInfo[k].resultdate != null)
                    lblExpectedHigherDategradePhd.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
                lblhigherverifyPhd.Text = EducationInfo[k].verificationname;
                if (EducationInfo[k].relationshipwithverification != null)
                {
                    lblhigherrelationPhd.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo[k].relationshipwithverification));
                }

                lblhighercontactEmailPhd.Text = EducationInfo[k].verificationemail;
                lblhighercontactMobilePhd.Text = EducationInfo[k].verificationmobile;
            }
            else if (EducationInfo[k].coursename.ToLower() == "ug")
            {
                UG.Attributes.Add("style", "display: block");
                lblhighercourse.Text = EducationInfo[k].coursename;
                if (EducationInfo[k].countryofhighereducation != null)
                {
                    lblhigherCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo[k].countryofhighereducation));
                }
                if (EducationInfo[k].startdate != null)
                {
                    lblhigherschoolstartDate.Text = EducationInfo[k].startdate;
                }
                if (EducationInfo[k].endate != null)
                {

                    lblhigherendDate.Text = EducationInfo[k].endate;
                }

                lblhigherschoolName.Text = EducationInfo[k].schoolname;

                if (EducationInfo[k].qualificationtype != null)
                {
                    lblhigherQualificationtype.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo[k].qualificationtype));
                }
                if (EducationInfo[k].studymodeid != null)
                {
                    lblhigherstudymode.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo[k].studymodeid));
                }
                if (EducationInfo[k].studymediumid != null)
                {
                    lblhigherlanguage.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo[k].studymediumid));
                }
                if (EducationInfo[k].gradetypeid != null)
                {
                    lblhighergradetype.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo[k].gradetypeid));
                }
                if (EducationInfo[k].finalgradeacheived == 1)
                    lblhighergradeachieved.Text = "Results Declared";
                else if (EducationInfo[k].finalgradeacheived == 2)
                    lblhighergradeachieved.Text = "Examination not conducted yet";
                else
                    lblhighergradeachieved.Text = "Examination Conducted, but Result not declared";



                if (EducationInfo[k].resultdate != null)
                    lblExpectedHigherDategrade.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
                lblhigherverify.Text = EducationInfo[k].verificationname;
                if (EducationInfo[k].relationshipwithverification != null)
                {
                    lblhigherschoolrelation.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo[k].relationshipwithverification));
                }

                lblhighercontactEmail.Text = EducationInfo[k].verificationemail;
                lblhighercontactMobile.Text = EducationInfo[k].verificationmobile;
            }
            else
            {
                OtherHigherCourse.Attributes.Add("style", "display: block");
                lblhighercourseOther.Text = EducationInfo[k].coursename;
                if (EducationInfo[k].countryofhighereducation != null)
                {
                    lblhigherCountryOther.Text = objCom.GetCountryDiscription(Convert.ToInt32(EducationInfo[k].countryofhighereducation));
                }
                if (EducationInfo[k].startdate != null)
                {
                    lblhigherstartDateOther.Text = EducationInfo[k].startdate;
                }
                if (EducationInfo[k].endate != null)
                {

                    lblhigherendDateOther.Text = EducationInfo[k].endate;
                }

                lblhigherschoolNameOther.Text = EducationInfo[k].schoolname;

                if (EducationInfo[k].qualificationtype != null)
                {
                    lblhigherQualificationtypeOther.Text = objCom.GetQualificationType(Convert.ToInt32(EducationInfo[k].qualificationtype));
                }
                if (EducationInfo[k].studymodeid != null)
                {
                    lblhigherstudymodeOther.Text = objCom.GetStudyMode(Convert.ToInt32(EducationInfo[k].studymodeid));
                }
                if (EducationInfo[k].studymediumid != null)
                {
                    lblhigherlanguageOther.Text = objCom.GetStudyMedium(Convert.ToInt32(EducationInfo[k].studymediumid));
                }
                if (EducationInfo[k].gradetypeid != null)
                {
                    lblhighergradetypeOther.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo[k].gradetypeid));
                }
                if (EducationInfo[k].finalgradeacheived == 1)
                    lblhighergradeachievedOther.Text = "Results Declared";
                else if (EducationInfo[k].finalgradeacheived == 2)
                    lblhighergradeachievedOther.Text = "Examination not conducted yet";
                else
                    lblhighergradeachievedOther.Text = "Examination Conducted, but Result not declared";

                if (EducationInfo[k].resultdate != null)
                    lblExpectedHigherDategradeOther.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
                lblhigherverify.Text = EducationInfo[k].verificationname;
                if (EducationInfo[k].relationshipwithverification != null)
                {
                    lblhigherrelationOther.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo[k].relationshipwithverification));
                }

                lblhighercontactEmailOther.Text = EducationInfo[k].verificationemail;
                lblhighercontactMobileOther.Text = EducationInfo[k].verificationmobile;
            }
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
                case "Have you completed high school":
                     if (Comments[k].adminaction == 0)
                        rblhighschoolNo.Checked = true;
                    else
                        rblhighschoolYes.Checked = true;
                    txthighschool.Value = setComments(Comments[k]);
                    break;
             
                case "Country of High School":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolCountryNo.Checked = true;
                    else
                        rblhighschoolCountryYes.Checked = true;
                    txthighschoolCountry.Value = setComments(Comments[k]);
                    break;
                case "High School Start Date":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolstartDateNo.Checked = true;
                    else
                        rblhighschoolstartDateYes.Checked = true;
                    txthighschoolstartDate.Value = setComments(Comments[k]);
                    break;
                case "High School End Date":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolendDateNo.Checked = true;
                    else
                        rblhighschoolendDateYes.Checked = true;
                    txthighschoolendDate.Value = setComments(Comments[k]);
                    break;
                case "Name of School(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolNameNo.Checked = true;
                    else
                        rblhighschoolNameYes.Checked = true;
                    txthighschoolName.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolQualificationtypeNo.Checked = true;
                    else
                        rblhighschoolQualificationtypeYes.Checked = true;
                    txthighschoolQualificationtype.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolstudymodeNo.Checked = true;
                    else
                        rblhighschoolstudymodeYes.Checked = true;
                    txthighschoolstudymode.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolstudymodeNo.Checked = true;
                    else
                        rblhighschoolstudymodeYes.Checked = true;
                    txthighschoolstudymode.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblgradetypeNo.Checked = true;
                    else
                        rblgradetypeYes.Checked = true;
                    txtgradetype.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolgradeachievedNo.Checked = true;
                    else
                        rblhighschoolgradeachievedYes.Checked = true;
                    txthighschoolgradeachieved.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHighSchoolDategradeNo.Checked = true;
                    else
                        rblExpectedHighSchoolDategradeYes.Checked = true;
                    txtExpectedHighSchoolDategrade.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolverifyNo.Checked = true;
                    else
                        rblhighschoolverifyYes.Checked = true;
                    txthighschoolverify.Value = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolrelationNo.Checked = true;
                    else
                        rblhighschoolrelationYes.Checked = true;
                    txthighschoolrelation.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolcontactEmailNo.Checked = true;
                    else
                        rblhighschoolcontactEmailYes.Checked = true;
                    txthighschoolcontactEmail.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolcontactMobileNo.Checked = true;
                    else
                        rblhighschoolcontactMobileYes.Checked = true;
                    txthighschoolcontactMobile.Value = setComments(Comments[k]);
                    break;
                case "High School Grade":
                    if (Comments[k].adminaction == 0)
                        rblhighshoolgradeNo.Checked = true;
                    else
                        rblhighshoolgradeYes.Checked = true;
                    txthighschoolgrade.Value = setComments(Comments[k]);
                    break;
                case "Have you completed Senior Secondary school? (Year 12)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryNo.Checked = true;
                    else
                        rblSecondaryYes.Checked = true;
                    txtSecondary.Value = setComments(Comments[k]);
                    break;
                case "Country of Secondary Education":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryCountryNo.Checked = true;
                    else
                        rblSecondaryCountryYes.Checked = true;
                    txtSecondaryCountry.Value = setComments(Comments[k]);
                    break;
                case "Secondary Start Date":
                    if (Comments[k].adminaction == 0)
                        rblSecondarystartDateNo.Checked = true;
                    else
                        rblSecondarystartDateYes.Checked = true;
                    txtSecondarystartDate.Value = setComments(Comments[k]);
                    break;
                case "Secondary End Date":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryendDateNo.Checked = true;
                    else
                        rblSecondaryendDateYes.Checked = true;
                    txtSecondaryendDate.Value = setComments(Comments[k]);
                    break;
                case "Name of School(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryschoolNameNo.Checked = true;
                    else
                        rblSecondaryschoolNameYes.Checked = true;
                    txtSecondaryschoolName.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryQualificationtypeNo.Checked = true;
                    else
                        rblSecondaryQualificationtypeYes.Checked = true;
                    txtSecondaryQualificationtype.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarystudymodeNo.Checked = true;
                    else
                        rblSecondarystudymodeYes.Checked = true;
                    txtSecondarystudymode.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarylanguageNo.Checked = true;
                    else
                        rblSecondarylanguageYes.Checked = true;
                    txtSecondarylanguage.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarygradetypeNo.Checked = true;
                    else
                        rblSecondarygradetypeYes.Checked = true;
                    txtSecondarygradetype.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarygradeachievedNo.Checked = true;
                    else
                        rblSecondarygradeachievedYes.Checked = true;
                    txtSecondarygradeachieved.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedSecondaryDategradeNo.Checked = true;
                    else
                        rblExpectedSecondaryDategradeYes.Checked = true;
                    txtExpectedSecondaryDategrade.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryverifyNo.Checked = true;
                    else
                        rblSecondaryverifyYes.Checked = true;
                    txtSecondaryverify.Value = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblsecondaryschoolrelationNo.Checked = true;
                    else
                        rblsecondaryschoolrelationYes.Checked = true;
                    txtsecondaryschoolrelation.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblsecondarycontactEmailNo.Checked = true;
                    else
                        rblsecondarycontactEmailYes.Checked = true;
                    txtsecondarycontactEmail.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblsecondarycontactMobileNo.Checked = true;
                    else
                        rblsecondarycontactMobileYes.Checked = true;
                    txtsecondarycontactMobile.Value = setComments(Comments[k]);
                    break;
                case "Secondary Grade":
                    if (Comments[k].adminaction == 0)
                        rblsecondarygradeNo.Checked = true;
                    else
                        rblsecondarygradeYes.Checked = true;
                    txtSecondaryGrade.Value = setComments(Comments[k]);
                    break;
                case "Have you completed any Diploma or Certificate Programs":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaNo.Checked = true;
                    else
                        rbldiplomaYes.Checked = true;
                    txtdiploma.Value = setComments(Comments[k]);
                    break;
                case "Country of Diploma or Certificate Programs":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaCountryNo.Checked = true;
                    else
                        rbldiplomaCountryYes.Checked = true;
                    txtdiplomaCountry.Value = setComments(Comments[k]);
                    break;
                case "Diploma Start Date":
                    if (Comments[k].adminaction == 0)
                        rbldiplomastartDateNo.Checked = true;
                    else
                        rbldiplomastartDateYes.Checked = true;
                    txtdiplomastartDate.Value = setComments(Comments[k]);
                    break;
                case "Diploma End Date":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaendDateNo.Checked = true;
                    else
                        rbldiplomaendDateYes.Checked = true;
                    txtdiplomaendDate.Value = setComments(Comments[k]);
                    break;
                case "Name of School(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaschoolNameNo.Checked = true;
                    else
                        rbldiplomaschoolNameYes.Checked = true;
                    txtdiplomaschoolName.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaQualificationtypeNo.Checked = true;
                    else
                        rbldiplomaQualificationtypeYes.Checked = true;
                    txtdiplomaQualificationtype.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomastudymodeNo.Checked = true;
                    else
                        rbldiplomastudymodeYes.Checked = true;
                    txtdiplomastudymode.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomalanguageNo.Checked = true;
                    else
                        rbldiplomalanguageYes.Checked = true;
                    txtdiplomalanguage.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomagradetypeNo.Checked = true;
                    else
                        rbldiplomagradetypeYes.Checked = true;
                    txtdiplomagradetype.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomagradeachievedNo.Checked = true;
                    else
                        rbldiplomagradeachievedYes.Checked = true;
                    txtdiplomagradeachieved.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedDiplomaDategradeNo.Checked = true;
                    else
                        rblExpectedDiplomaDategradeYes.Checked = true;
                    txtExpectedDiplomaDategrade.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaverifyNo.Checked = true;
                    else
                        rbldiplomaverifyYes.Checked = true;
                    txtdiplomaverify.Value = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomarelationNo.Checked = true;
                    else
                        rbldiplomarelationYes.Checked = true;
                    txtdiplomarelation.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomacontactEmailNo.Checked = true;
                    else
                        rbldiplomacontactEmailYes.Checked = true;
                    txtdiplomacontactEmail.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomacontactMobileNo.Checked = true;
                    else
                        rbldiplomacontactMobileYes.Checked = true;
                    txtdiplomacontactMobile.Value = setComments(Comments[k]);
                    break;
                case "Diploma Grade":
                    if (Comments[k].adminaction == 0)
                        rbldiplomagradeNo.Checked = true;
                    else
                        rbldiplomagradeYes.Checked = true;
                    txtDiplomaGrade.Value = setComments(Comments[k]);
                    break;
                case "Have you completed any Higher (Under Graduate, Masters or PhD) degree":
                    if (Comments[k].adminaction == 0)
                        rblhigherNo.Checked = true;
                    else
                        rblhigherYes.Checked = true;
                    txthigher.Value = setComments(Comments[k]);
                    break;
                case "Higher Course(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercourseNo.Checked = true;
                    else
                        rblhighercourseYes.Checked = true;
                    txthighercourse.Value = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryNo.Checked = true;
                    else
                        rblhigherCountryYes.Checked = true;
                    txthigherCountry.Value = setComments(Comments[k]);
                    break;
                case "Higher Start Date(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDateNo.Checked = true;
                    else
                        rblhigherstartDateYes.Checked = true;
                    txthigherstartDate.Value = setComments(Comments[k]);
                    break;
                case "Higher End Date(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDateNo.Checked = true;
                    else
                        rblhigherendDateYes.Checked = true;
                    txthigherendDate.Value = setComments(Comments[k]);
                    break;
                case "Name of School(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNameNo.Checked = true;
                    else
                        rblhigherschoolNameYes.Checked = true;
                    txthigherschoolName.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypeNo.Checked = true;
                    else
                        rblhigherQualificationtypeYes.Checked = true;
                    txthigherQualificationtype.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodeNo.Checked = true;
                    else
                        rblhigherstudymodeYes.Checked = true;
                    txthigherstudymode.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguageNo.Checked = true;
                    else
                        rblhigherlanguageYes.Checked = true;
                    txthigherlanguage.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypeNo.Checked = true;
                    else
                        rblhighergradetypeYes.Checked = true;
                    txthighergradetype.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedNo.Checked = true;
                    else
                        rblhighergradeachievedYes.Checked = true;
                    txthighergradeachieved.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(UG)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradeNo.Checked = true;
                    else
                        rblExpectedHigherDategradeYes.Checked = true;
                    txtExpectedHigherDategrade.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyNo.Checked = true;
                    else
                        rblhigherverifyYes.Checked = true;
                    txthigherverify.Value = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationNo.Checked = true;
                    else
                        rblhigherrelationYes.Checked = true;
                    txthigherrelation.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailNo.Checked = true;
                    else
                        rblhighercontactEmailYes.Checked = true;
                    txthighercontactEmail.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobileNo.Checked = true;
                    else
                        rblhighercontactMobileYes.Checked = true;
                    txthighercontactMobile.Value = setComments(Comments[k]);
                    break;
                case "Higher Course(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercoursePGNo.Checked = true;
                    else
                        rblhighercoursePGYes.Checked = true;
                    txthighercoursePG.Value = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryPGNo.Checked = true;
                    else
                        rblhigherCountryPGYes.Checked = true;
                    txthigherCountryPG.Value = setComments(Comments[k]);
                    break;
                case "Higher Start Date(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDatePGNo.Checked = true;
                    else
                        rblhigherstartDatePGYes.Checked = true;
                    txthigherstartDatePG.Value = setComments(Comments[k]);
                    break;
                case "Higher End Date(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDatePGNo.Checked = true;
                    else
                        rblhigherendDatePGYes.Checked = true;
                    txthigherendDatePG.Value = setComments(Comments[k]);
                    break;
                case "Name of School(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNamePGNo.Checked = true;
                    else
                        rblhigherschoolNamePGYes.Checked = true;
                    txthigherschoolNamePG.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypePGNo.Checked = true;
                    else
                        rblhigherQualificationtypePGYes.Checked = true;
                    txthigherQualificationtypePG.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodePGNo.Checked = true;
                    else
                        rblhigherstudymodePGYes.Checked = true;
                    txthigherstudymodePG.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguagePGNo.Checked = true;
                    else
                        rblhigherlanguagePGYes.Checked = true;
                    txthigherlanguagePG.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypePGNo.Checked = true;
                    else
                        rblhighergradetypePGYes.Checked = true;
                    txthighergradetypePG.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedPGNo.Checked = true;
                    else
                        rblhighergradeachievedPGYes.Checked = true;
                    txthighergradeachievedPG.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(PG)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradePGNo.Checked = true;
                    else
                        rblExpectedHigherDategradePGYes.Checked = true;
                    txtExpectedHigherDategradePG.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(PG)":
                    txthigherverifyPG.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyPGNo.Checked = true;
                    else
                        rblhigherverifyPGYes.Checked = true;
                    break;
                case "Relationship with the Contact(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationPGNo.Checked = true;
                    else
                        rblhigherrelationPGYes.Checked = true;
                    txthigherrelationPG.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailPGNo.Checked = true;
                    else
                        rblhighercontactEmailPGYes.Checked = true;
                    txthighercontactEmailPG.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobilePGNo.Checked = true;
                    else
                        rblhighercontactMobilePGYes.Checked = true;
                    txthighercontactMobilePG.Value = setComments(Comments[k]);
                    break;
                case "Higher Course(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighercoursePhdNo.Checked = true;
                    else
                        rblhighercoursePhdYes.Checked = true;
                    txthighercoursePhd.Value = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryPhdNo.Checked = true;
                    else
                        rblhigherCountryPhdYes.Checked = true;
                    txthigherCountryPhd.Value = setComments(Comments[k]);
                    break;
                case "Higher Start Date(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDatePhdNo.Checked = true;
                    else
                        rblhigherstartDatePhdYes.Checked = true;
                    txthigherstartDatePhd.Value = setComments(Comments[k]);
                    break;
                case "Higher End Date(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDatePhdNo.Checked = true;
                    else
                        rblhigherendDatePhdYes.Checked = true;
                    txthigherendDatePhd.Value = setComments(Comments[k]);
                    break;
                case "Name of School(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNamePhdNo.Checked = true;
                    else
                        rblhigherschoolNamePhdYes.Checked = true;
                    txthigherschoolNamePhd.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypePhdNo.Checked = true;
                    else
                        rblhigherQualificationtypePhdYes.Checked = true;
                    txthigherQualificationtypePhd.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodePhdNo.Checked = true;
                    else
                        rblhigherstudymodePhdYes.Checked = true;
                    txthigherstudymodePhd.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguagePhdNo.Checked = true;
                    else
                        rblhigherlanguagePhdYes.Checked = true;
                    txthigherlanguagePhd.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypePhdNo.Checked = true;
                    else
                        rblhighergradetypePhdYes.Checked = true;
                    txthighergradetypePhd.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedPhdNo.Checked = true;
                    else
                        rblhighergradeachievedPhdYes.Checked = true;
                    txthighergradeachievedPhd.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradePhdNo.Checked = true;
                    else
                        rblExpectedHigherDategradePhdYes.Checked = true;
                    txtExpectedHigherDategradePhd.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyPhdNo.Checked = true;
                    else
                        rblhigherverifyPhdYes.Checked = true;
                    txthigherverifyPhd.Value = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationPhdNo.Checked = true;
                    else
                        rblhigherrelationPhdYes.Checked = true;
                    txthigherrelationPhd.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailPhdNo.Checked = true;
                    else
                        rblhighercontactEmailPhdYes.Checked = true;
                    txthighercontactEmailPhd.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobilePhdNo.Checked = true;
                    else
                        rblhighercontactMobilePhdYes.Checked = true;
                    txthighercontactMobilePhd.Value = setComments(Comments[k]);
                    break;
                case "Higher Course(Other)":
                    if (Comments[k].adminaction == 0)
                        rblOtherHigherCourseNo.Checked = true;
                    else
                        rblOtherHigherCourseYes.Checked = true;
                    txthighercourseOther.Value = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryOtherNo.Checked = true;
                    else
                        rblhigherCountryOtherYes.Checked = true;
                    txthigherCountryOther.Value = setComments(Comments[k]);
                    break;
                case "Higher Start Date(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDateOtherNo.Checked = true;
                    else
                        rblhigherstartDateOtherYes.Checked = true;
                    txthigherstartDateOther.Value = setComments(Comments[k]);
                    break;
                case "Higher End Date(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDateOtherNo.Checked = true;
                    else
                        rblhigherendDateOtherYes.Checked = true;
                    txthigherendDateOther.Value = setComments(Comments[k]);
                    break;
                case "Name of School(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNameOtherNo.Checked = true;
                    else
                        rblhigherschoolNameOtherYes.Checked = true;
                    txthigherschoolNameOther.Value = setComments(Comments[k]);
                    break;
                case "Qualification Name(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypeOtherNo.Checked = true;
                    else
                        rblhigherQualificationtypeOtherYes.Checked = true;
                    txthigherQualificationtypeOther.Value = setComments(Comments[k]);
                    break;
                case "Mode of study(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodeOtherNo.Checked = true;
                    else
                        rblhigherstudymodeOtherYes.Checked = true;
                    txthigherstudymodeOther.Value = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguageOtherNo.Checked = true;
                    else
                        rblhigherlanguageOtherYes.Checked = true;
                    txthigherlanguageOther.Value = setComments(Comments[k]);
                    break;
                case "Grade Type(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypeOtherNo.Checked = true;
                    else
                        rblhighergradetypeOtherYes.Checked = true;
                    txthighergradetypeOther.Value = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedOtherNo.Checked = true;
                    else
                        rblhighergradeachievedOtherYes.Checked = true;
                    txthighergradeachievedOther.Value = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Other)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradeOtherNo.Checked = true;
                    else
                        rblExpectedHigherDategradeOtherYes.Checked = true;
                    txtExpectedHigherDategradeOther.Value = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyOtherNo.Checked = true;
                    else
                        rblhigherverifyOtherYes.Checked = true;
                    txthigherverifyOther.Value = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationOtherNo.Checked = true;
                    else
                        rblhigherrelationOtherYes.Checked = true;
                    txthigherrelationOther.Value = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailOtherNo.Checked = true;
                    else
                        rblhighercontactEmailOtherYes.Checked = true;
                  
                    txthighercontactEmailOther.Value = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobileOtherNo.Checked = true;
                    else
                        rblhighercontactMobileOtherYes.Checked = true;
                   
                    txthighercontactMobileOther.Value = setComments(Comments[k]);
                    break;
                case "Higher Grade":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeNO.Checked = true;
                    else
                        rblhighergradeYes.Checked = true;
                  
                    txtHigherGrade.Value = setComments(Comments[k]);
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
            if ((highschool.Style.Value != "display: none") && ((lblhighschool.Text == "Yes") || (lblhighschool.Text == "No- I am currently studying for my high school qualification")))
            {
                adminInputs.Add("Have you completed high school", txthighschool.Value.Trim() + "~" + (rblhighschoolNo.Checked == true ? 0 : 1));
                if (highschoolCountry.Style.Value != "display: none")
                    adminInputs.Add("Country of High School", txthighschoolCountry.Value.Trim() + "~" + (rblhighschoolCountryNo.Checked == true ? 0 : 1));
                if (highschoolstartDate.Style.Value != "display: none")
                    adminInputs.Add("High School Start Date", txthighschoolstartDate.Value.Trim() + "~" + (rblhighschoolstartDateNo.Checked == true ? 0 : 1));
                if (highschoolendDate.Style.Value != "display: none")
                    adminInputs.Add("High School End Date", txthighschoolendDate.Value.Trim() + "~" + (rblhighschoolendDateNo.Checked == true ? 0 : 1));
                if (highschoolName.Style.Value != "display: none")
                    adminInputs.Add("Name of School(HighSchool)", txthighschoolName.Value.Trim() + "~" + (rblhighschoolNameNo.Checked == true ? 0 : 1));
                if (highschoolQualificationtype.Style.Value != "display: none")
                    adminInputs.Add("Qualification Name(HighSchool)", txthighschoolQualificationtype.Value.Trim() + "~" + (rblhighschoolQualificationtypeNo.Checked == true ? 0 : 1));
                if (highschoolstudymode.Style.Value != "display: none")
                    adminInputs.Add("Mode of study(HighSchool)", txthighschoolstudymode.Value.Trim() + "~" + (rblhighschoolstudymodeNo.Checked == true ? 0 : 1));
                if (highschoollanguage.Style.Value != "display: none")
                    adminInputs.Add("Language (Medium) of Study(HighSchool)", txthighschoollanguage.Value.Trim() + "~" + (rblhighschoollanguageNo.Checked == true ? 0 : 1));
                if (gradetype.Style.Value != "display: none")
                    adminInputs.Add("Grade Type(HighSchool)", txtgradetype.Value.Trim() + "~" + (rblgradetypeNo.Checked == true ? 0 : 1));
                if (highschoolgradeachieved.Style.Value != "display: none")
                    adminInputs.Add("Final Grade Achieved(HighSchool)", txthighschoolgradeachieved.Value.Trim() + "~" + (rblhighschoolgradeachievedNo.Checked == true ? 0 : 1));
                if (ExpectedHighSchoolDategrade.Style.Value != "display: none")
                    adminInputs.Add("Expected dates when results will be declared(HighSchool)", txtExpectedHighSchoolDategrade.Value.Trim() + "~" + (rblExpectedHighSchoolDategradeNo.Checked == true ? 0 : 1));
                if (highschoolverify.Style.Value != "display: none")
                    adminInputs.Add("Name of Contact who can verify this qualification(HighSchool)", txthighschoolverify.Value.Trim() + "~" + (rblhighschoolverifyNo.Checked == true ? 0 : 1));
                if (highschoolrelation.Style.Value != "display: none")
                    adminInputs.Add("Relationship with the Contact(HighSchool)", txthighschoolrelation.Value.Trim() + "~" + (rblhighschoolrelationNo.Checked == true ? 0 : 1));
                if (highschoolcontactEmail.Style.Value != "display: none")
                    adminInputs.Add("Email ID of Contact who can verify your qualification(HighSchool)", txthighschoolcontactEmail.Value.Trim() + "~" + (rblhighschoolcontactEmailNo.Checked == true ? 0 : 1));
                if (highschoolcontactMobile.Style.Value != "display: none")
                    adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(HighSchool)", txthighschoolcontactMobile.Value.Trim() + "~" + (rblhighschoolcontactMobileNo.Checked == true ? 0 : 1));
                if (highshoolgrade.Style.Value != "display: none")
                    adminInputs.Add("High School Grade", txthighschoolgrade.Value.Trim() + "~" + (rblhighshoolgradeNo.Checked == true ? 0 : 1));

            }
            else
            {
                adminInputs.Add("Have you completed high school", txthighschool.Value.Trim() + "~" + (rblhighschoolNo.Checked == true ? 0 : 1));
                           }
            if ((Secondary.Style.Value != "display: none") && ((lblSecondary.Text == "Yes") || (lblSecondary.Text == "No - I am currently still studying for my Senior Secondary")))
            {
                adminInputs.Add("Have you completed Senior Secondary school? (Year 12)", txtSecondary.Value.Trim() + "~" + (rblSecondaryNo.Checked == true ? 0 : 1));
                if (SecondaryCountry.Style.Value != "display: none")
                    adminInputs.Add("Country of Secondary Education", txtSecondaryCountry.Value.Trim() + "~" + (rblSecondaryCountryNo.Checked == true ? 0 : 1));
                if (SecondarystartDate.Style.Value != "display: none")
                    adminInputs.Add("Secondary Start Date", txtSecondarystartDate.Value.Trim() + "~" + (rblSecondarystartDateNo.Checked == true ? 0 : 1));
                if (SecondaryendDate.Style.Value != "display: none")
                    adminInputs.Add("Secondary End Date", txtSecondaryendDate.Value.Trim() + "~" + (rblSecondaryendDateNo.Checked == true ? 0 : 1));
                if (SecondaryschoolName.Style.Value != "display: none")
                    adminInputs.Add("Name of School(Secondary)", txtSecondaryschoolName.Value.Trim() + "~" + (rblSecondaryschoolNameNo.Checked == true ? 0 : 1));
                if (SecondaryQualificationtype.Style.Value != "display: none")
                    adminInputs.Add("Qualification Name(Secondary)", txtSecondaryQualificationtype.Value.Trim() + "~" + (rblSecondaryQualificationtypeNo.Checked == true ? 0 : 1));
                if (Secondarystudymode.Style.Value != "display: none")
                    adminInputs.Add("Mode of study(Secondary)", txtSecondarystudymode.Value.Trim() + "~" + (rblSecondarystudymodeNo.Checked == true ? 0 : 1));
                if (Secondarylanguage.Style.Value != "display: none")
                    adminInputs.Add("Language (Medium) of Study(Secondary)", txtSecondarylanguage.Value.Trim() + "~" + (rblSecondarylanguageNo.Checked == true ? 0 : 1));
                if (Secondarygradetype.Style.Value != "display: none")
                    adminInputs.Add("Grade Type(Secondary)", txtSecondarygradetype.Value.Trim() + "~" + (rblSecondarygradetypeNo.Checked == true ? 0 : 1));
                if (Secondarygradeachieved.Style.Value != "display: none")
                    adminInputs.Add("Final Grade Achieved(Secondary)", txtSecondarygradeachieved.Value.Trim() + "~" + (rblSecondarygradeachievedNo.Checked == true ? 0 : 1));
                if (ExpectedSecondaryDategrade.Style.Value != "display: none")
                    adminInputs.Add("Expected dates when results will be declared(Secondary)", txtExpectedSecondaryDategrade.Value.Trim() + "~" + (rblExpectedSecondaryDategradeNo.Checked == true ? 0 : 1));
                if (Secondaryverify.Style.Value != "display: none")
                    adminInputs.Add("Name of Contact who can verify this qualification(Secondary)", txtSecondaryverify.Value.Trim() + "~" + (rblSecondaryverifyNo.Checked == true ? 0 : 1));
                if (secondaryschoolrelation.Style.Value != "display: none")
                    adminInputs.Add("Relationship with the Contact(Secondary)", txtsecondaryschoolrelation.Value.Trim() + "~" + (rblsecondaryschoolrelationNo.Checked == true ? 0 : 1));
                if (secondarycontactEmail.Style.Value != "display: none")
                    adminInputs.Add("Email ID of Contact who can verify your qualification(Secondary)", txtsecondarycontactEmail.Value.Trim() + "~" + (rblsecondarycontactEmailNo.Checked == true ? 0 : 1));
                if (secondarycontactMobile.Style.Value != "display: none")
                    adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(Secondary)", txtsecondarycontactMobile.Value.Trim() + "~" + (rblsecondarycontactMobileNo.Checked == true ? 0 : 1));
                if (secondarygrade.Style.Value != "display: none")
                    adminInputs.Add("Secondary Grade", txtSecondaryGrade.Value.Trim() + "~" + (rblsecondarygradeNo.Checked == true ? 0 : 1));
            }
            else
            {
                adminInputs.Add("Have you completed Senior Secondary school? (Year 12)", txtSecondary.Value.Trim() + "~" + (rblSecondaryNo.Checked == true ? 0 : 1));


            }
            if ((diploma.Style.Value != "display: none") && ((lbldiploma.Text == "Yes") || (lbldiploma.Text == "I am currently studying for my Diploma/Certificate")))
            {
                adminInputs.Add("Have you completed any Diploma or Certificate Programs", txtdiploma.Value.Trim() + "~" + (rbldiplomaNo.Checked == true ? 0 : 1));
                if (diplomaCountry.Style.Value != "display: none")
                    adminInputs.Add("Country of Diploma or Certificate Programs", txtdiplomaCountry.Value.Trim() + "~" + (rbldiplomaCountryNo.Checked == true ? 0 : 1));
                if (diplomastartDate.Style.Value != "display: none")
                    adminInputs.Add("Diploma Start Date", txtdiplomastartDate.Value.Trim() + "~" + (rbldiplomastartDateNo.Checked == true ? 0 : 1));
                if (diplomaendDate.Style.Value != "display: none")
                    adminInputs.Add("Diploma End Date", txtdiplomaendDate.Value.Trim() + "~" + (rbldiplomaendDateNo.Checked == true ? 0 : 1));
                if (diplomaschoolName.Style.Value != "display: none")
                    adminInputs.Add("Name of School(Diploma)", txtdiplomaschoolName.Value.Trim() + "~" + (rbldiplomaschoolNameNo.Checked == true ? 0 : 1));
                if (diplomaQualificationtype.Style.Value != "display: none")
                    adminInputs.Add("Qualification Name(Diploma)", txtdiplomaQualificationtype.Value.Trim() + "~" + (rbldiplomaQualificationtypeNo.Checked == true ? 0 : 1));
                if (diplomastudymode.Style.Value != "display: none")
                    adminInputs.Add("Mode of study(Diploma)", txtdiplomastudymode.Value.Trim() + "~" + (rbldiplomastudymodeNo.Checked == true ? 0 : 1));
                if (diplomalanguage.Style.Value != "display: none")
                    adminInputs.Add("Language (Medium) of Study(Diploma)", txtdiplomalanguage.Value.Trim() + "~" + (rbldiplomalanguageNo.Checked == true ? 0 : 1));
                if (diplomagradetype.Style.Value != "display: none")
                    adminInputs.Add("Grade Type(Diploma)", txtdiplomagradetype.Value.Trim() + "~" + (rbldiplomagradetypeNo.Checked == true ? 0 : 1));
                if (diplomagradeachieved.Style.Value != "display: none")
                    adminInputs.Add("Final Grade Achieved(Diploma)", txtdiplomagradeachieved.Value.Trim() + "~" + (rbldiplomagradeachievedNo.Checked == true ? 0 : 1));
                if (ExpectedDiplomaDategrade.Style.Value != "display: none")
                    adminInputs.Add("Expected dates when results will be declared(Diploma)", txtExpectedDiplomaDategrade.Value.Trim() + "~" + (rblExpectedDiplomaDategradeNo.Checked == true ? 0 : 1));
                if (diplomaverify.Style.Value != "display: none")
                    adminInputs.Add("Name of Contact who can verify this qualification(Diploma)", txtdiplomaverify.Value.Trim() + "~" + (rbldiplomaverifyNo.Checked == true ? 0 : 1));
                if (diplomarelation.Style.Value != "display: none")
                    adminInputs.Add("Relationship with the Contact(Diploma)", txtdiplomarelation.Value.Trim() + "~" + (rbldiplomarelationNo.Checked == true ? 0 : 1));
                if (diplomacontactEmail.Style.Value != "display: none")
                    adminInputs.Add("Email ID of Contact who can verify your qualification(Diploma)", txtdiplomacontactEmail.Value.Trim() + "~" + (rbldiplomacontactEmailNo.Checked == true ? 0 : 1));
                if (diplomacontactMobile.Style.Value != "display: none")
                    adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(Diploma)", txtdiplomacontactMobile.Value.Trim() + "~" + (rbldiplomacontactMobileNo.Checked == true ? 0 : 1));
                if (diplomagrade.Style.Value != "display: none")
                    adminInputs.Add("Diploma Grade", txtDiplomaGrade.Value.Trim() + "~" + (rbldiplomagradeNo.Checked == true ? 0 : 1));
            }
            else
            {
                adminInputs.Add("Have you completed any Diploma or Certificate Programs", txtdiploma.Value.Trim() + "~" + (rbldiplomaNo.Checked == true ? 0 : 1));


            }

            if ((higher.Style.Value != "display: none") && ((lblhigher.Text == "Yes") || (lblhigher.Text == "I am currently studying for my higher qualification")))
            {
                adminInputs.Add("Have you completed any Higher (Under Graduate, Masters or PhD) degree", txthigher.Value.Trim() + "~" + (rblhigherNo.Checked == true ? 0 : 1));
                if (UG.Visible == true)
                {
                    if (highercourse.Style.Value != "display: none")
                        adminInputs.Add("Higher Course(UG)", txthighercourse.Value.Trim() + "~" + (rblhighercourseNo.Checked == true ? 0 : 1));
                    if (higherCountry.Style.Value != "display: none")
                        adminInputs.Add("Country of Higher Education(UG)", txthigherCountry.Value.Trim() + "~" + (rblhigherCountryNo.Checked == true ? 0 : 1));
                    if (higherstartDate.Style.Value != "display: none")
                        adminInputs.Add("Higher Start Date(UG)", txthigherstartDate.Value.Trim() + "~" + (rblhigherstartDateNo.Checked == true ? 0 : 1));
                    if (higherendDate.Style.Value != "display: none")
                        adminInputs.Add("Higher End Date(UG)", txthigherendDate.Value.Trim() + "~" + (rblhigherendDateNo.Checked == true ? 0 : 1));
                    if (higherschoolName.Style.Value != "display: none")
                        adminInputs.Add("Name of School(UG)", txthigherschoolName.Value.Trim() + "~" + (rblhigherschoolNameNo.Checked == true ? 0 : 1));
                    if (higherQualificationtype.Style.Value != "display: none")
                        adminInputs.Add("Qualification Name(UG)", txthigherQualificationtype.Value.Trim() + "~" + (rblhigherQualificationtypeNo.Checked == true ? 0 : 1));
                    if (higherstudymode.Style.Value != "display: none")
                        adminInputs.Add("Mode of study(UG)", txthigherstudymode.Value.Trim() + "~" + (rblhigherstudymodeNo.Checked == true ? 0 : 1));
                    if (higherlanguage.Style.Value != "display: none")
                        adminInputs.Add("Language (Medium) of Study(UG)", txthigherlanguage.Value.Trim() + "~" + (rblhigherlanguageNo.Checked == true ? 0 : 1));
                    if (highergradetype.Style.Value != "display: none")
                        adminInputs.Add("Grade Type(UG)", txthighergradetype.Value.Trim() + "~" + (rblhighergradetypeNo.Checked == true ? 0 : 1));
                    if (highergradeachieved.Style.Value != "display: none")
                        adminInputs.Add("Final Grade Achieved(UG)", txthighergradeachieved.Value.Trim() + "~" + (rblhighergradeachievedNo.Checked == true ? 0 : 1));
                    if (ExpectedHigherDategrade.Style.Value != "display: none")
                        adminInputs.Add("Expected dates when results will be declared(UG)", txtExpectedHigherDategrade.Value.Trim() + "~" + (rblExpectedHigherDategradeNo.Checked == true ? 0 : 1));
                    if (higherverify.Style.Value != "display: none")
                        adminInputs.Add("Name of Contact who can verify this qualification(UG)", txthigherverify.Value.Trim() + "~" + (rblhigherverifyNo.Checked == true ? 0 : 1));
                    if (higherrelation.Style.Value != "display: none")
                        adminInputs.Add("Relationship with the Contact(UG)", txthigherrelation.Value.Trim() + "~" + (rblhigherrelationNo.Checked == true ? 0 : 1));
                    if (highercontactEmail.Style.Value != "display: none")
                        adminInputs.Add("Email ID of Contact who can verify your qualification(UG)", txthighercontactEmail.Value.Trim() + "~" + (rblhighercontactEmailNo.Checked == true ? 0 : 1));
                    if (highercontactMobile.Style.Value != "display: none")
                        adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(UG)", txthighercontactMobile.Value.Trim() + "~" + (rblhighercontactMobileNo.Checked == true ? 0 : 1));
                }
                else if (PG.Visible == true)
                {
                    if (highercoursePG.Style.Value != "display: none")
                        adminInputs.Add("Higher Course(PG)", txthighercoursePG.Value.Trim() + "~" + (rblhighercoursePGNo.Checked == true ? 0 : 1));
                    if (higherCountryPG.Style.Value != "display: none")
                        adminInputs.Add("Country of Higher Education(PG)", txthigherCountryPG.Value.Trim() + "~" + (rblhigherCountryPGNo.Checked == true ? 0 : 1));
                    if (higherstartDatePG.Style.Value != "display: none")
                        adminInputs.Add("Higher Start Date(PG)", txthigherstartDatePG.Value.Trim() + "~" + (rblhigherstartDatePGNo.Checked == true ? 0 : 1));
                    if (higherendDatePG.Style.Value != "display: none")
                        adminInputs.Add("Higher End Date(PG)", txthigherendDatePG.Value.Trim() + "~" + (rblhigherendDatePGNo.Checked == true ? 0 : 1));
                    if (higherschoolNamePG.Style.Value != "display: none")
                        adminInputs.Add("Name of School(PG)", txthigherschoolNamePG.Value.Trim() + "~" + (rblhigherschoolNamePGNo.Checked == true ? 0 : 1));
                    if (higherQualificationtypePG.Style.Value != "display: none")
                        adminInputs.Add("Qualification Name(PG)", txthigherQualificationtypePG.Value.Trim() + "~" + (rblhigherQualificationtypePGNo.Checked == true ? 0 : 1));
                    if (higherstudymodePG.Style.Value != "display: none")
                        adminInputs.Add("Mode of study(PG)", txthigherstudymodePG.Value.Trim() + "~" + (rblhigherstudymodePGNo.Checked == true ? 0 : 1));
                    if (higherlanguagePG.Style.Value != "display: none")
                        adminInputs.Add("Language (Medium) of Study(PG)", txthigherlanguagePG.Value.Trim() + "~" + (rblhigherlanguagePGNo.Checked == true ? 0 : 1));
                    if (highergradetypePG.Style.Value != "display: none")
                        adminInputs.Add("Grade Type(PG)", txthighergradetypePG.Value.Trim() + "~" + (rblhighergradetypePGNo.Checked == true ? 0 : 1));
                    if (highergradeachievedPG.Style.Value != "display: none")
                        adminInputs.Add("Final Grade Achieved(PG)", txthighergradeachievedPG.Value.Trim() + "~" + (rblhighergradeachievedPGNo.Checked == true ? 0 : 1));
                    if (ExpectedHigherDategradePG.Style.Value != "display: none")
                        adminInputs.Add("Expected dates when results will be declared(PG)", txtExpectedHigherDategradePG.Value.Trim() + "~" + (rblExpectedHigherDategradePGNo.Checked == true ? 0 : 1));
                    if (higherverifyPG.Style.Value != "display: none")
                        adminInputs.Add("Name of Contact who can verify this qualification(PG)", txthigherverifyPG.Value.Trim() + "~" + (rblhigherverifyPGNo.Checked == true ? 0 : 1));
                    if (higherrelationPG.Style.Value != "display: none")
                        adminInputs.Add("Relationship with the Contact(PG)", txthigherrelationPG.Value.Trim() + "~" + (rblhigherrelationPGNo.Checked == true ? 0 : 1));
                    if (highercontactEmailPG.Style.Value != "display: none")
                        adminInputs.Add("Email ID of Contact who can verify your qualification(PG)", txthighercontactEmailPG.Value.Trim() + "~" + (rblhighercontactEmailPGNo.Checked == true ? 0 : 1));
                    if (highercontactMobilePG.Style.Value != "display: none")
                        adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(PG)", txthighercontactMobilePG.Value.Trim() + "~" + (rblhighercontactMobilePGNo.Checked == true ? 0 : 1));
                }
                else if (Phd.Visible == true)
                {
                    if (highercoursePhd.Style.Value != "display: none")
                        adminInputs.Add("Higher Course(Phd)", txthighercoursePhd.Value.Trim() + "~" + (rblhighercoursePhdNo.Checked == true ? 0 : 1));
                    if (higherCountryPhd.Style.Value != "display: none")
                        adminInputs.Add("Country of Higher Education(Phd)", txthigherCountryPhd.Value.Trim() + "~" + (rblhigherCountryPhdNo.Checked == true ? 0 : 1));
                    if (higherstartDatePhd.Style.Value != "display: none")
                        adminInputs.Add("Higher Start Date(Phd)", txthigherstartDatePhd.Value.Trim() + "~" + (rblhigherstartDatePhdNo.Checked == true ? 0 : 1));
                    if (higherendDatePhd.Style.Value != "display: none")
                        adminInputs.Add("Higher End Date(Phd)", txthigherendDatePhd.Value.Trim() + "~" + (rblhigherendDatePhdNo.Checked == true ? 0 : 1));
                    if (higherschoolNamePhd.Style.Value != "display: none")
                        adminInputs.Add("Name of School(Phd)", txthigherschoolNamePhd.Value.Trim() + "~" + (rblhigherschoolNamePhdNo.Checked == true ? 0 : 1));
                    if (higherQualificationtypePhd.Style.Value != "display: none")
                        adminInputs.Add("Qualification Name(Phd)", txthigherQualificationtypePhd.Value.Trim() + "~" + (rblhigherQualificationtypePhdNo.Checked == true ? 0 : 1));
                    if (higherstudymodePhd.Style.Value != "display: none")
                        adminInputs.Add("Mode of study(Phd)", txthigherstudymodePhd.Value.Trim() + "~" + (rblhigherstudymodePhdNo.Checked == true ? 0 : 1));
                    if (higherlanguagePhd.Style.Value != "display: none")
                        adminInputs.Add("Language (Medium) of Study(Phd)", txthigherlanguagePhd.Value.Trim() + "~" + (rblhigherlanguagePhdNo.Checked == true ? 0 : 1));
                    if (highergradetypePhd.Style.Value != "display: none")
                        adminInputs.Add("Grade Type(Phd)", txthighergradetypePhd.Value.Trim() + "~" + (rblhighergradetypePhdNo.Checked == true ? 0 : 1));
                    if (highergradeachievedPhd.Style.Value != "display: none")
                        adminInputs.Add("Final Grade Achieved(Phd)", txthighergradeachievedPhd.Value.Trim() + "~" + (rblhighergradeachievedPhdNo.Checked == true ? 0 : 1));
                    if (ExpectedHigherDategradePhd.Style.Value != "display: none")
                        adminInputs.Add("Expected dates when results will be declared(Phd)", txtExpectedHigherDategradePhd.Value.Trim() + "~" + (rblExpectedHigherDategradePhdNo.Checked == true ? 0 : 1));
                    if (higherverifyPhd.Style.Value != "display: none")
                        adminInputs.Add("Name of Contact who can verify this qualification(Phd)", txthigherverifyPhd.Value.Trim() + "~" + (rblhigherverifyPhdNo.Checked == true ? 0 : 1));
                    if (higherrelationPhd.Style.Value != "display: none")
                        adminInputs.Add("Relationship with the Contact(Phd)", txthigherrelationPhd.Value.Trim() + "~" + (rblhigherrelationPhdNo.Checked == true ? 0 : 1));
                    if (highercontactEmailPhd.Style.Value != "display: none")
                        adminInputs.Add("Email ID of Contact who can verify your qualification(Phd)", txthighercontactEmailPhd.Value.Trim() + "~" + (rblhighercontactEmailPhdNo.Checked == true ? 0 : 1));
                    if (highercontactMobilePhd.Style.Value != "display: none")
                        adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(Phd)", txthighercontactMobilePhd.Value.Trim() + "~" + (rblhighercontactMobilePhdNo.Checked == true ? 0 : 1));
                }
                else
                {
                    if (highercourseOther.Style.Value != "display: none")
                        adminInputs.Add("Higher Course(Other)", txthighercourseOther.Value.Trim() + "~" + (rblOtherHigherCourseNo.Checked == true ? 0 : 1));
                    if (higherCountryOther.Style.Value != "display: none")
                        adminInputs.Add("Country of Higher Education(Other)", txthigherCountryOther.Value.Trim() + "~" + (rblhigherCountryOtherNo.Checked == true ? 0 : 1));
                    if (higherstartDateOther.Style.Value != "display: none")
                        adminInputs.Add("Higher Start Date(Other)", txthigherstartDateOther.Value.Trim() + "~" + (rblhigherstartDateOtherNo.Checked == true ? 0 : 1));
                    if (higherendDateOther.Style.Value != "display: none")
                        adminInputs.Add("Higher End Date(Other)", txthigherendDateOther.Value.Trim() + "~" + (rblhigherendDateOtherNo.Checked == true ? 0 : 1));
                    if (higherschoolNameOther.Style.Value != "display: none")
                        adminInputs.Add("Name of School(Other)", txthigherschoolNameOther.Value.Trim() + "~" + (rblhigherschoolNameOtherNo.Checked == true ? 0 : 1));
                    if (higherQualificationtypeOther.Style.Value != "display: none")
                        adminInputs.Add("Qualification Name(Other)", txthigherQualificationtypeOther.Value.Trim() + "~" + (rblhigherQualificationtypeOtherNo.Checked == true ? 0 : 1));
                    if (higherstudymodeOther.Style.Value != "display: none")
                        adminInputs.Add("Mode of study(Other)", txthigherstudymodeOther.Value.Trim() + "~" + (rblhigherstudymodeOtherNo.Checked == true ? 0 : 1));
                    if (higherlanguageOther.Style.Value != "display: none")
                        adminInputs.Add("Language (Medium) of Study(Other)", txthigherlanguageOther.Value.Trim() + "~" + (rblhigherlanguageOtherNo.Checked == true ? 0 : 1));
                    if (highergradetypeOther.Style.Value != "display: none")
                        adminInputs.Add("Grade Type(Other)", txthighergradetypeOther.Value.Trim() + "~" + (rblhighergradetypeOtherNo.Checked == true ? 0 : 1));
                    if (highergradeachievedOther.Style.Value != "display: none")
                        adminInputs.Add("Final Grade Achieved(Other)", txthighergradeachievedOther.Value.Trim() + "~" + (rblhighergradeachievedOtherNo.Checked == true ? 0 : 1));
                    if (ExpectedHigherDategradeOther.Style.Value != "display: none")
                        adminInputs.Add("Expected dates when results will be declared(Other)", txtExpectedHigherDategradeOther.Value.Trim() + "~" + (rblExpectedHigherDategradeOtherNo.Checked == true ? 0 : 1));
                    if (higherverifyOther.Style.Value != "display: none")
                        adminInputs.Add("Name of Contact who can verify this qualification(Other)", txthigherverifyOther.Value.Trim() + "~" + (rblhigherverifyOtherNo.Checked == true ? 0 : 1));
                    if (higherrelationOther.Style.Value != "display: none")
                        adminInputs.Add("Relationship with the Contact(Other)", txthigherrelationOther.Value.Trim() + "~" + (rblhigherrelationOtherNo.Checked == true ? 0 : 1));
                    if (highercontactEmailOther.Style.Value != "display: none")
                        adminInputs.Add("Email ID of Contact who can verify your qualification(Other)", txthighercontactEmailOther.Value.Trim() + "~" + (rblhighercontactEmailOtherNo.Checked == true ? 0 : 1));
                    if (highercontactMobileOther.Style.Value != "display: none")
                        adminInputs.Add("Mobile/Cellular Number of Contact who can verify your qualification(Other)", txthighercontactMobileOther.Value.Trim() + "~" + (rblhighercontactMobileOtherNo.Checked == true ? 0 : 1));

                }
                if (highergrade.Style.Value != "display: none")
                    adminInputs.Add("Higher Grade", txtHigherGrade.Value.Trim() + "~" + (rblhighergradeNO.Checked == true ? 0 : 1));
            }
            else
            {
                adminInputs.Add("Have you completed any Higher (Under Graduate, Masters or PhD) degree", txthigher.Value.Trim() + "~" + (rblhigherNo.Checked == true ? 0 : 1));
            }
            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminId, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void HideDiploma()
    {
        diplomaCountry.Attributes.Add("style", "display: none");
        diplomastartDate.Attributes.Add("style", "display: none");
        diplomaendDate.Attributes.Add("style", "display: none");
        diplomaschoolName.Attributes.Add("style", "display: none");
        diplomaQualificationtype.Attributes.Add("style", "display: none");
        diplomastudymode.Attributes.Add("style", "display: none");
        diplomalanguage.Attributes.Add("style", "display: none");
        diplomagradetype.Attributes.Add("style", "display: none");
        diplomagradeachieved.Attributes.Add("style", "display: none");
        ExpectedDiplomaDategrade.Attributes.Add("style", "display: none");
        diplomaverify.Attributes.Add("style", "display: none");
        diplomarelation.Attributes.Add("style", "display: none");
        diplomacontactEmail.Attributes.Add("style", "display: none");
        diplomacontactMobile.Attributes.Add("style", "display: none");
    }
    private void HideHighSchool()
    {



        highschoolCountry.Attributes.Add("style", "display: none");
        highschoolstartDate.Attributes.Add("style", "display: none");
        highschoolendDate.Attributes.Add("style", "display: none");
        highschoolName.Attributes.Add("style", "display: none");
        highschoolQualificationtype.Attributes.Add("style", "display: none");
        highschoolstudymode.Attributes.Add("style", "display: none");
        highschoollanguage.Attributes.Add("style", "display: none");
        gradetype.Attributes.Add("style", "display: none");
        highschoolgradeachieved.Attributes.Add("style", "display: none");
        ExpectedHighSchoolDategrade.Attributes.Add("style", "display: none");
        highschoolverify.Attributes.Add("style", "display: none");
        highschoolrelation.Attributes.Add("style", "display: none");
        highschoolcontactEmail.Attributes.Add("style", "display: none");
        highschoolcontactMobile.Attributes.Add("style", "display: none");
    }
    private void HideSecondary()
    {
        SecondaryCountry.Attributes.Add("style", "display: none");
        SecondarystartDate.Attributes.Add("style", "display: none");
        SecondaryendDate.Attributes.Add("style", "display: none");
        SecondaryschoolName.Attributes.Add("style", "display: none");
        SecondaryQualificationtype.Attributes.Add("style", "display: none");
        Secondarystudymode.Attributes.Add("style", "display: none");
        Secondarylanguage.Attributes.Add("style", "display: none");
        Secondarygradetype.Attributes.Add("style", "display: none");
        Secondarygradeachieved.Attributes.Add("style", "display: none");
        ExpectedSecondaryDategrade.Attributes.Add("style", "display: none");
        Secondaryverify.Attributes.Add("style", "display: none");
        secondaryschoolrelation.Attributes.Add("style", "display: none");
        secondarycontactEmail.Attributes.Add("style", "display: none");
        secondarycontactMobile.Attributes.Add("style", "display: none");
    }
}