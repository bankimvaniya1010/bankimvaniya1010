using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Supervisoreducationdetails : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
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
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);

            PopulateSupervisorComments();
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
                  //  higestEducation.Visible = false;
                }
                else
                {
                    lblhighschool.Text = "No- I do not have a high school qualification ";
                   // lblhigestEducation.Text = EducationInfo.highestdegree;
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
                UG.Visible = false;
                PG.Visible = false;
                Phd.Visible = false;
                highercourseOther.Visible = false;
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
                PG.Visible = true;
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
                Phd.Visible = true;
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
                UG.Visible = true;
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
                OtherHigherCourse.Visible = true;
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
                    lblhighschoolComments.Text = setComments(Comments[k]);
                    break;
               
                case "Country of High School":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolCountryNo.Checked = true;
                    else
                        rblhighschoolCountryYes.Checked = true;
                    lblhighschoolCountryComments.Text = setComments(Comments[k]);
                    break;
                case "High School Start Date":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolstartDateNo.Checked = true;
                    else
                        rblhighschoolstartDateYes.Checked = true;
                    lblhighschoolstartDateComments.Text = setComments(Comments[k]);
                    break;
                case "High School End Date":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolendDateNo.Checked = true;
                    else
                        rblhighschoolendDateYes.Checked = true;
                    lblhighschoolendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolNameNo.Checked = true;
                    else
                        rblhighschoolNameYes.Checked = true;
                    lblhighschoolNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolQualificationtypeNo.Checked = true;
                    else
                        rblhighschoolQualificationtypeYes.Checked = true;
                    lblhighschoolQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolstudymodeNo.Checked = true;
                    else
                        rblhighschoolstudymodeYes.Checked = true;
                    lblhighschoolstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolstudymodeNo.Checked = true;
                    else
                        rblhighschoolstudymodeYes.Checked = true;
                    lblhighschoolstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblgradetypeNo.Checked = true;
                    else
                        rblgradetypeYes.Checked = true;
                    lblgradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolgradeachievedNo.Checked = true;
                    else
                        rblhighschoolgradeachievedYes.Checked = true;
                    lblgradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHighSchoolDategradeNo.Checked = true;
                    else
                        rblExpectedHighSchoolDategradeYes.Checked = true;
                    lblExpectedHighSchoolDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolverifyNo.Checked = true;
                    else
                        rblhighschoolverifyYes.Checked = true;
                    lblhighschoolverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolrelationNo.Checked = true;
                    else
                        rblhighschoolrelationYes.Checked = true;
                    lblhighschoolrelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolcontactEmailNo.Checked = true;
                    else
                        rblhighschoolcontactEmailYes.Checked = true;
                    lblhighschoolcontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        rblhighschoolcontactMobileNo.Checked = true;
                    else
                        rblhighschoolcontactMobileYes.Checked = true;
                    lblhighschoolcontactMobileComments.Text = setComments(Comments[k]);
                    break;
                case "High School Grade":
                    if (Comments[k].adminaction == 0)
                        rblhighshoolgradeNo.Checked = true;
                    else
                        rblhighshoolgradeYes.Checked = true;
                    lblhighshoolgradeComments.Text = setComments(Comments[k]);
                    break;
                case "Have you completed Senior Secondary school? (Year 12)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryNo.Checked = true;
                    else
                        rblSecondaryYes.Checked = true;
                    lblSecondaryComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Secondary Education":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryCountryNo.Checked = true;
                    else
                        rblSecondaryCountryYes.Checked = true;
                    lblSecondaryCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Secondary Start Date":
                    if (Comments[k].adminaction == 0)
                        rblSecondarystartDateNo.Checked = true;
                    else
                        rblSecondarystartDateYes.Checked = true;
                    lblSecondarystartDateComments.Text = setComments(Comments[k]);
                    break;
                case "Secondary End Date":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryendDateNo.Checked = true;
                    else
                        rblSecondaryendDateYes.Checked = true;
                    lblSecondaryendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryschoolNameNo.Checked = true;
                    else
                        rblSecondaryschoolNameYes.Checked = true;
                    lblSecondaryschoolNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryQualificationtypeNo.Checked = true;
                    else
                        rblSecondaryQualificationtypeYes.Checked = true;
                    lblSecondaryQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarystudymodeNo.Checked = true;
                    else
                        rblSecondarystudymodeYes.Checked = true;
                    lblSecondarystudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarylanguageNo.Checked = true;
                    else
                        rblSecondarylanguageYes.Checked = true;
                    lblSecondarylanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarygradetypeNo.Checked = true;
                    else
                        rblSecondarygradetypeYes.Checked = true;
                    lblSecondarygradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondarygradeachievedNo.Checked = true;
                    else
                        rblSecondarygradeachievedYes.Checked = true;
                    lblSecondarygradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedSecondaryDategradeNo.Checked = true;
                    else
                        rblExpectedSecondaryDategradeYes.Checked = true;
                    lblExpectedSecondaryDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblSecondaryverifyNo.Checked = true;
                    else
                        rblSecondaryverifyYes.Checked = true;
                    lblSecondaryverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblsecondaryschoolrelationNo.Checked = true;
                    else
                        rblsecondaryschoolrelationYes.Checked = true;
                    lblsecondaryschoolrelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblsecondarycontactEmailNo.Checked = true;
                    else
                        rblsecondarycontactEmailYes.Checked = true;
                    lblsecondarycontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        rblsecondarycontactMobileNo.Checked = true;
                    else
                        rblsecondarycontactMobileYes.Checked = true;
                    lblsecondarycontactMobileComments.Text = setComments(Comments[k]);
                    break;
                case "Secondary Grade":
                    if (Comments[k].adminaction == 0)
                        rblsecondarygradeNo.Checked = true;
                    else
                        rblsecondarygradeYes.Checked = true;
                    lblsecondarygradeComments.Text = setComments(Comments[k]);
                    break;
                case "Have you completed any Diploma or Certificate Programs":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaNo.Checked = true;
                    else
                        rbldiplomaYes.Checked = true;
                    lbldiplomaComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Diploma or Certificate Programs":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaCountryNo.Checked = true;
                    else
                        rbldiplomaCountryYes.Checked = true;
                    lbldiplomaCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Diploma Start Date":
                    if (Comments[k].adminaction == 0)
                        rbldiplomastartDateNo.Checked = true;
                    else
                        rbldiplomastartDateYes.Checked = true;
                    lbldiplomastartDateComments.Text = setComments(Comments[k]);
                    break;
                case "Diploma End Date":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaendDateNo.Checked = true;
                    else
                        rbldiplomaendDateYes.Checked = true;
                    lbldiplomaendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaschoolNameNo.Checked = true;
                    else
                        rbldiplomaschoolNameYes.Checked = true;
                    lbldiplomaschoolNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaQualificationtypeNo.Checked = true;
                    else
                        rbldiplomaQualificationtypeYes.Checked = true;
                    lbldiplomaQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomastudymodeNo.Checked = true;
                    else
                        rbldiplomastudymodeYes.Checked = true;
                    lbldiplomastudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomalanguageNo.Checked = true;
                    else
                        rbldiplomalanguageYes.Checked = true;
                    lbldiplomalanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomagradetypeNo.Checked = true;
                    else
                        rbldiplomagradetypeYes.Checked = true;
                    lbldiplomagradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomagradeachievedNo.Checked = true;
                    else
                        rbldiplomagradeachievedYes.Checked = true;
                    lbldiplomagradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedDiplomaDategradeNo.Checked = true;
                    else
                        rblExpectedDiplomaDategradeYes.Checked = true;
                    lblExpectedDiplomaDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomaverifyNo.Checked = true;
                    else
                        rbldiplomaverifyYes.Checked = true;
                    lbldiplomaverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomarelationNo.Checked = true;
                    else
                        rbldiplomarelationYes.Checked = true;
                    lbldiplomarelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomacontactEmailNo.Checked = true;
                    else
                        rbldiplomacontactEmailYes.Checked = true;
                    lbldiplomacontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        rbldiplomacontactMobileNo.Checked = true;
                    else
                        rbldiplomacontactMobileYes.Checked = true;
                    lbldiplomacontactMobileComments.Text = setComments(Comments[k]);
                    break;
                case "Diploma Grade":
                    if (Comments[k].adminaction == 0)
                        rbldiplomagradeNo.Checked = true;
                    else
                        rbldiplomagradeYes.Checked = true;
                    lbldiplomagradeComments.Text = setComments(Comments[k]);
                    break;
                case "Have you completed any Higher (Under Graduate, Masters or PhD) degree":
                    if (Comments[k].adminaction == 0)
                        rblhigherNo.Checked = true;
                    else
                        rblhigherYes.Checked = true;
                    lblhigherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercourseNo.Checked = true;
                    else
                        rblhighercourseYes.Checked = true;
                    lblhighercourseComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryNo.Checked = true;
                    else
                        rblhigherCountryYes.Checked = true;
                    lblhigherCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDateNo.Checked = true;
                    else
                        rblhigherstartDateYes.Checked = true;
                    lblhigherschoolstartDateComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDateNo.Checked = true;
                    else
                        rblhigherendDateYes.Checked = true;
                    lblhigherendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNameNo.Checked = true;
                    else
                        rblhigherschoolNameYes.Checked = true;
                    lblhigherschoolNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypeNo.Checked = true;
                    else
                        rblhigherQualificationtypeYes.Checked = true;
                    lblhigherQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodeNo.Checked = true;
                    else
                        rblhigherstudymodeYes.Checked = true;
                    lblhigherstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguageNo.Checked = true;
                    else
                        rblhigherlanguageYes.Checked = true;
                    lblhigherlanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypeNo.Checked = true;
                    else
                        rblhighergradetypeYes.Checked = true;
                    lblhighergradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedNo.Checked = true;
                    else
                        rblhighergradeachievedYes.Checked = true;
                    lblhighergradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(UG)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradeNo.Checked = true;
                    else
                        rblExpectedHigherDategradeYes.Checked = true;
                    lblExpectedHigherDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyNo.Checked = true;
                    else
                        rblhigherverifyYes.Checked = true;
                    lblhigherverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationNo.Checked = true;
                    else
                        rblhigherrelationYes.Checked = true;
                    lblhigherschoolrelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailNo.Checked = true;
                    else
                        rblhighercontactEmailYes.Checked = true;
                    lblhighercontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobileNo.Checked = true;
                    else
                        rblhighercontactMobileYes.Checked = true;
                    lblhighercontactMobileComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercoursePGNo.Checked = true;
                    else
                        rblhighercoursePGYes.Checked = true;
                    lblhighercoursePGComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryPGNo.Checked = true;
                    else
                        rblhigherCountryPGYes.Checked = true;
                    lblhigherCountryPGComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDatePGNo.Checked = true;
                    else
                        rblhigherstartDatePGYes.Checked = true;
                    lblhigherstartDatePGComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDatePGNo.Checked = true;
                    else
                        rblhigherendDatePGYes.Checked = true;
                    lblhigherendDatePGComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNamePGNo.Checked = true;
                    else
                        rblhigherschoolNamePGYes.Checked = true;
                    lblhigherschoolNamePGComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypePGNo.Checked = true;
                    else
                        rblhigherQualificationtypePGYes.Checked = true;
                    lblhigherQualificationtypePGComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodePGNo.Checked = true;
                    else
                        rblhigherstudymodePGYes.Checked = true;
                    lblhigherstudymodePGComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguagePGNo.Checked = true;
                    else
                        rblhigherlanguagePGYes.Checked = true;
                    lblhigherlanguagePGComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypePGNo.Checked = true;
                    else
                        rblhighergradetypePGYes.Checked = true;
                    lblhighergradetypePGComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedPGNo.Checked = true;
                    else
                        rblhighergradeachievedPGYes.Checked = true;
                    lblhighergradeachievedPGComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(PG)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradePGNo.Checked = true;
                    else
                        rblExpectedHigherDategradePGYes.Checked = true;
                    lblExpectedHigherDategradePGComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(PG)":
                    lblhigherverifyPGComments.Text = setComments(Comments[k]);
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
                    lblhigherrelationPGComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailPGNo.Checked = true;
                    else
                        rblhighercontactEmailPGYes.Checked = true;
                    lblhighercontactEmailPGComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(PG)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobilePGNo.Checked = true;
                    else
                        rblhighercontactMobilePGYes.Checked = true;
                    lblhighercontactMobilePGComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighercoursePhdNo.Checked = true;
                    else
                        rblhighercoursePhdYes.Checked = true;
                    lblhighercoursePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryPhdNo.Checked = true;
                    else
                        rblhigherCountryPhdYes.Checked = true;
                    lblhigherCountryPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDatePhdNo.Checked = true;
                    else
                        rblhigherstartDatePhdYes.Checked = true;
                    lblhigherstartDatePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDatePhdNo.Checked = true;
                    else
                        rblhigherendDatePhdYes.Checked = true;
                    lblhigherendDatePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNamePhdNo.Checked = true;
                    else
                        rblhigherschoolNamePhdYes.Checked = true;
                    lblhigherschoolNamePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypePhdNo.Checked = true;
                    else
                        rblhigherQualificationtypePhdYes.Checked = true;
                    lblhigherQualificationtypePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodePhdNo.Checked = true;
                    else
                        rblhigherstudymodePhdYes.Checked = true;
                    lblhigherstudymodePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguagePhdNo.Checked = true;
                    else
                        rblhigherlanguagePhdYes.Checked = true;
                    lblhigherlanguagePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypePhdNo.Checked = true;
                    else
                        rblhighergradetypePhdYes.Checked = true;
                    lblhighergradetypePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedPhdNo.Checked = true;
                    else
                        rblhighergradeachievedPhdYes.Checked = true;
                    lblhighergradeachievedPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradePhdNo.Checked = true;
                    else
                        rblExpectedHigherDategradePhdYes.Checked = true;
                    lblExpectedHigherDategradePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyPhdNo.Checked = true;
                    else
                        rblhigherverifyPhdYes.Checked = true;
                    lblhigherverifyPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationPhdNo.Checked = true;
                    else
                        rblhigherrelationPhdYes.Checked = true;
                    lblhigherrelationPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailPhdNo.Checked = true;
                    else
                        rblhighercontactEmailPhdYes.Checked = true;
                    lblhighercontactEmailPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobilePhdNo.Checked = true;
                    else
                        rblhighercontactMobilePhdYes.Checked = true;
                    lblhighercontactMobilePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(Other)":
                    if (Comments[k].adminaction == 0)
                        rblOtherHigherCourseNo.Checked = true;
                    else
                        rblOtherHigherCourseYes.Checked = true;
                    lblhighercourseOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherCountryOtherNo.Checked = true;
                    else
                        rblhigherCountryOtherYes.Checked = true;
                    lblhigherCountryOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstartDateOtherNo.Checked = true;
                    else
                        rblhigherstartDateOtherYes.Checked = true;
                    lblhigherstartDateOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherendDateOtherNo.Checked = true;
                    else
                        rblhigherendDateOtherYes.Checked = true;
                    lblhigherendDateOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherschoolNameOtherNo.Checked = true;
                    else
                        rblhigherschoolNameOtherYes.Checked = true;
                    lblhigherschoolNameOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherQualificationtypeOtherNo.Checked = true;
                    else
                        rblhigherQualificationtypeOtherYes.Checked = true;
                    lblhigherQualificationtypeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherstudymodeOtherNo.Checked = true;
                    else
                        rblhigherstudymodeOtherYes.Checked = true;
                    lblhigherstudymodeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherlanguageOtherNo.Checked = true;
                    else
                        rblhigherlanguageOtherYes.Checked = true;
                    lblhigherlanguageOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradetypeOtherNo.Checked = true;
                    else
                        rblhighergradetypeOtherYes.Checked = true;
                    lblhighergradetypeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeachievedOtherNo.Checked = true;
                    else
                        rblhighergradeachievedOtherYes.Checked = true;
                    lblhighergradeachievedOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Other)":
                    if (Comments[k].adminaction == 0)
                        rblExpectedHigherDategradeOtherNo.Checked = true;
                    else
                        rblExpectedHigherDategradeOtherYes.Checked = true;
                    lblExpectedHigherDategradeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherverifyOtherNo.Checked = true;
                    else
                        rblhigherverifyOtherYes.Checked = true;
                    lblhigherverifyOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhigherrelationOtherNo.Checked = true;
                    else
                        rblhigherrelationOtherYes.Checked = true;
                    lblhigherrelationOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactEmailOtherNo.Checked = true;
                    else
                        rblhighercontactEmailOtherYes.Checked = true;

                    lblhighercontactEmailOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        rblhighercontactMobileOtherNo.Checked = true;
                    else
                        rblhighercontactMobileOtherYes.Checked = true;

                    lblhighercontactMobileOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Grade":
                    if (Comments[k].adminaction == 0)
                        rblhighergradeNO.Checked = true;
                    else
                        rblhighergradeYes.Checked = true;

                    lblhighergradeComments.Text = setComments(Comments[k]);
                    break;
                default:
                    break;

            }
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
        }
    }
    private void HideDiploma()
    {
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
    private void HideHighSchool()
    {

       

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
    private void HideSecondary()
    {
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