﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicanteducation : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string CourseName = "";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected List<applicanthighereducation> HigherEducation = new List<applicanthighereducation>();
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

            SetToolTips();

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
                {
                    lblhighschool.Text = "Yes";
                    BindHighSchoolDetails(EducationInfo);
                    higestEducation.Visible = false;
                }
                else if (EducationInfo.ishighschooldone == 2)
                {
                    lblhighschool.Text = "No- I am currently studying for my high school qualification ";
                    BindHighSchoolDetails(EducationInfo);
                    higestEducation.Visible = false;
                }
                else
                {
                    lblhighschool.Text = "No- I do not have a high school qualification ";
                    lblhigestEducation.Text = EducationInfo.highestdegree;
                    higestEducation.Visible = true;

                    highschoolCountry.Visible = false;
                    highschoolstartDate.Visible = false;
                    highschoolendDate.Visible = false;
                    highschoolName.Visible = false;
                    highschoolQualificationtype.Visible = false;
                    highschoolstudymode.Visible = false;
                    highschoollanguage.Visible = false;
                    gradetype.Visible = false;
                    highschoolgradeachieved.Visible = false;
                    ExpectedHighSchoolDategrade.Visible = false;
                    highschoolverify.Visible = false;
                    highschoolrelation.Visible = false;
                    highschoolcontactEmail.Visible = false;
                    highschoolcontactMobile.Visible = false;
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
                    SecondaryCountry.Visible = false;
                    SecondarystartDate.Visible = false;
                    SecondaryendDate.Visible = false;
                    SecondaryschoolName.Visible = false;
                    SecondaryQualificationtype.Visible = false;
                    Secondarystudymode.Visible = false;
                    Secondarylanguage.Visible = false;
                    Secondarygradetype.Visible = false;
                    Secondarygradeachieved.Visible = false;
                    ExpectedSecondaryDategrade.Visible = false;
                    Secondaryverify.Visible = false;
                    secondaryschoolrelation.Visible = false;
                    secondarycontactEmail.Visible = false;
                    secondarycontactMobile.Visible = false;
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
                    diplomaCountry.Visible = false;
                    diplomastartDate.Visible = false;
                    diplomaendDate.Visible = false;
                    diplomaschoolName.Visible = false;
                    diplomaQualificationtype.Visible = false;
                    diplomastudymode.Visible = false;
                    diplomalanguage.Visible = false;
                    diplomagradetype.Visible = false;
                    diplomagradeachieved.Visible = false;
                    ExpectedDiplomaDategrade.Visible = false;
                    diplomaverify.Visible = false;
                    diplomarelation.Visible = false;
                    diplomacontactEmail.Visible = false;
                    diplomacontactMobile.Visible = false;
                }


                if (EducationInfo.ishighereducation == 1)
                    lblhigher.Text = "Yes";
                else if (EducationInfo.ishighereducation == 2)
                    lblhigher.Text = "I am currently studying for my higher qualification";
                else
                    lblhigher.Text = "No- I do not have a higher qualification";

            }
            HigherEducation = (from pInfo in db.applicanthighereducation
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).ToList();
           
            //var HigherEducation = (from pInfo in db.applicanthighereducation
            //                       where pInfo.applicantid == userID && pInfo.universityid == universityID
            //                       select pInfo).FirstOrDefault();
            //if (HigherEducation != null)
            //{
            //    if (HigherEducation.countryofhighereducation != null)
            //    {
            //        ddlHigherCountry.ClearSelection();
            //        ddlHigherCountry.Items.FindByValue(HigherEducation.countryofhighereducation).Selected = true;
            //        bindQualification(ddlHigherQualificationType, Convert.ToInt32(HigherEducation.countryofhighereducation));
            //    }
            //    if (HigherEducation.coursename != null)
            //    {
            //        ddlCourse.ClearSelection();
            //        ddlCourse.Items.FindByValue(HigherEducation.coursename).Selected = true;
            //    }
            //    if (HigherEducation.startdate != null)
            //    {
            //        string[] HigherStartDate = HigherEducation.startdate.ToString().Split('-');
            //        ddlHigherStartDateMonth.ClearSelection();
            //        ddlHigherStartDateMonth.Items.FindByValue(Convert.ToString(HigherStartDate[0])).Selected = true;
            //        ddlHigherStartDateYear.ClearSelection();
            //        ddlHigherStartDateYear.Items.FindByValue(Convert.ToString(HigherStartDate[1])).Selected = true;
            //    }
            //    if (HigherEducation.endate != null)
            //    {
            //        string[] HigherEndDate = HigherEducation.endate.ToString().Split('-');
            //        ddlHigherEndDateMonth.ClearSelection();
            //        ddlHigherEndDateMonth.Items.FindByValue(Convert.ToString(HigherEndDate[0])).Selected = true;
            //        ddlHigherEndDateYear.ClearSelection();
            //        ddlHigherEndDateYear.Items.FindByValue(Convert.ToString(HigherEndDate[1])).Selected = true;
            //    }

            //    txtHigherschoolName.Value = HigherEducation.schoolname;

            //    if (HigherEducation.qualificationtype != null)
            //    {
            //        ddlHigherQualificationType.ClearSelection();
            //        ddlHigherQualificationType.Items.FindByValue(HigherEducation.qualificationtype.ToString()).Selected = true;
            //    }
            //    if (HigherEducation.studymodeid != null)
            //    {
            //        ddlHigherStudyMode.ClearSelection();
            //        ddlHigherStudyMode.Items.FindByValue(HigherEducation.studymodeid.ToString()).Selected = true;
            //    }
            //    if (HigherEducation.studymediumid != null)
            //    {
            //        ddlHigherMedium.ClearSelection();
            //        ddlHigherMedium.Items.FindByValue(HigherEducation.studymediumid.ToString()).Selected = true;
            //    }
            //    if (HigherEducation.gradetypeid != null)
            //    {
            //        ddlHigherGrade.ClearSelection();
            //        ddlHigherGrade.Items.FindByValue(HigherEducation.gradetypeid.ToString()).Selected = true;
            //    }


            //    if (HigherEducation.finalgradeacheived == 1)
            //        rblhighergradeachievedYes.Checked = true;
            //    else if (HigherEducation.finalgradeacheived == 2)
            //        rblhighergradeachievedYet.Checked = true;
            //    else
            //        rblhighergradeachievedNo.Checked = true;
            //    if (HigherEducation.resultdate != null)
            //        txtExpectedHigherDategrade.Value = Convert.ToDateTime(HigherEducation.resultdate).ToString("yyyy-MM-dd");
            //    txtHigherVerificationName.Value = HigherEducation.verificationname;
            //    if (HigherEducation.relationshipwithverification != null)
            //    {
            //        ddlHigherVerificationRelationship.ClearSelection();
            //        ddlHigherVerificationRelationship.Items.FindByValue(HigherEducation.relationshipwithverification.ToString()).Selected = true;
            //    }

            //    txtHighercontactEmail.Value = HigherEducation.verificationemail;
            //    txtHighercontactMobile.Value = HigherEducation.verificationmobile;
            //}
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

    //private void bindhigherCourses()
    //{
    //    try
    //    {
    //        var gradehigher = (from a in db.applicanthighereducation
    //                           where a.applicantid == userID && a.universityid == universityID

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
            lblgradeachieved.Text = "";
        else if (EducationInfo.highschoolgradedeclared == 2)
            lblgradeachieved.Text = "";
        else
            lblgradeachieved.Text = "";
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
            lblSecondarygradeachieved.Text = "";
        else if (EducationInfo.secondarygradedeclared == 2)
            lblSecondarygradeachieved.Text = "";
        else
            lblSecondarygradeachieved.Text = "";


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
            lbldiplomaCountry.Text = objCom.GetGrade(Convert.ToInt32(EducationInfo.diplomagradetypeid));
        }
        if (EducationInfo.diplomastartdate != null)
        {
            string[] DiplomaStartDate = EducationInfo.diplomastartdate.ToString().Split('-');
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
            lbldiplomagradeachieved.Text = "";
        else if (EducationInfo.diplomagradeachieved == 2)
            lbldiplomagradeachieved.Text = "";
        else
            lbldiplomagradeachieved.Text = "";


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












}