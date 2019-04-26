using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicanteducation : System.Web.UI.Page
{

    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        if (!IsPostBack)
        {
            SetToolTips();
            BindStudyMode1();
            BindStudyMode2();
            BindStudyMode3();
            BindStudyMode4();
            BindGrade1();
            BindGrade2();
            BindGrade3();
            BindGrade4();
            BindEducationMedium1();
            BindEducationMedium2();
            BindEducationMedium3();
            BindEducationMedium4();
            EducationDetails();
            bind10grade();
            bindSecondarygrade();
            binddiplomagrade();
            bindhighergrade();
            bindhigherCourses();
            //SetControlsUniversitywise(1);
        }
    }
    private void SetControlsUniversitywise(int universityID)
    {

        var fields = (from pfm in db.primaryfieldmaster
                      join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                      where ufm.universityid == universityID && ufm.formid == 2
                      select new
                      {
                          primaryfiledname = pfm.primaryfiledname,

                      }).ToList();
        if (fields.Count == 0)
        {
            fields = (from pfm in db.primaryfieldmaster
                      join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                      where ufm.formid == 2
                      select new
                      {
                          primaryfiledname = pfm.primaryfiledname,

                      }).ToList();
        }
        for (int k = 0; k < fields.Count; k++)
        {
            switch (fields[k].primaryfiledname)
            {
                case "HAVE YOU COMPLETED HIGH SCHOOL":
                    highschool.Attributes.Add("style", "display:block;");
                    labelhighschool.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "COUNTRY OF HIGH SCHOOL EDUCATION":
                    highschoolCountry.Attributes.Add("style", "display:block;");
                    labelhighschoolCountry.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "START DATE":
                    highschoolstartDate.Attributes.Add("style", "display:block;");
                    labelhighschoolstartDate.InnerHtml = fields[k].primaryfiledname;
                    SecondarystartDate.Attributes.Add("style", "display:block;");
                    labelSecondarystartDate.InnerHtml = fields[k].primaryfiledname;
                    higherstartDate.Attributes.Add("style", "display:block;");
                    labelhigherstartDate.InnerHtml = fields[k].primaryfiledname;
                    diplomastartDate.Attributes.Add("style", "display:block;");
                    labeldiplomastartDate.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "END DATE":
                    highschoolendDate.Attributes.Add("style", "display:block;");
                    labelhighschoolendDate.InnerHtml = fields[k].primaryfiledname;
                    SecondaryendDate.Attributes.Add("style", "display:block;");
                    labelSecondaryendDate.InnerHtml = fields[k].primaryfiledname;
                    higherendDate.Attributes.Add("style", "display:block;");
                    labelhigherendDate.InnerHtml = fields[k].primaryfiledname;
                    diplomaendDate.Attributes.Add("style", "display:block;");
                    labeldiplomaendDate.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "NAME OF SCHOOL":
                    highschool.Attributes.Add("style", "display:block;");
                    labelhighschool.InnerHtml = fields[k].primaryfiledname;
                    SecondaryschoolName.Attributes.Add("style", "display:block;");
                    labelSecondaryschoolName.InnerHtml = fields[k].primaryfiledname;
                    higherschoolName.Attributes.Add("style", "display:block;");
                    labelhigherschoolName.InnerHtml = fields[k].primaryfiledname;
                    diplomaschoolName.Attributes.Add("style", "display:block;");
                    labeldiplomaschoolName.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "QUALIFICATION TYPE":
                    highschoolQualificationtype.Attributes.Add("style", "display:block;");
                    labelhighschoolQualificationtype.InnerHtml = fields[k].primaryfiledname;
                    SecondaryQualificationtype.Attributes.Add("style", "display:block;");
                    labelSecondaryQualificationtype.InnerHtml = fields[k].primaryfiledname;
                    higherQualificationtype.Attributes.Add("style", "display:block;");
                    labelhigherQualificationtype.InnerHtml = fields[k].primaryfiledname;
                    diplomaQualificationtype.Attributes.Add("style", "display:block;");
                    labeldiplomaQualificationtype.InnerHtml = fields[k].primaryfiledname;
                    break;

                case "MODE OF STUDY":
                    highschoolstudymode.Attributes.Add("style", "display:block;");
                    labelhighschoolstudymode.InnerHtml = fields[k].primaryfiledname;
                    Secondarystudymode.Attributes.Add("style", "display:block;");
                    labelSecondarystudymode.InnerHtml = fields[k].primaryfiledname;
                    higherstudymode.Attributes.Add("style", "display:block;");
                    labelhigherstudymode.InnerHtml = fields[k].primaryfiledname;
                    diplomastudymode.Attributes.Add("style", "display:block;");
                    labeldiplomastudymode.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "LANGUAGE (MEDIUM) OF STUDY":
                    highschoollanguage.Attributes.Add("style", "display:block;");
                    labelhighschoollanguage.InnerHtml = fields[k].primaryfiledname;
                    Secondarylanguage.Attributes.Add("style", "display:block;");
                    labelSecondarylanguage.InnerHtml = fields[k].primaryfiledname;
                    higherlanguage.Attributes.Add("style", "display:block;");
                    labelhigherlanguage.InnerHtml = fields[k].primaryfiledname;
                    diplomalanguage.Attributes.Add("style", "display:block;");
                    labeldiplomalanguage.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "GRADE TYPE":
                    gradetype.Attributes.Add("style", "display:block;");
                    labelgradetype.InnerHtml = fields[k].primaryfiledname;
                    Secondarygradetype.Attributes.Add("style", "display:block;");
                    labelSecondarygradetype.InnerHtml = fields[k].primaryfiledname;
                    highergradetype.Attributes.Add("style", "display:block;");
                    labelhighergradetype.InnerHtml = fields[k].primaryfiledname;
                    diplomagradetype.Attributes.Add("style", "display:block;");
                    labeldiplomagradetype.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "FINAL GRADE ACHIEVED":
                    highschoolgradeachieved.Attributes.Add("style", "display:block;");
                    labelgradeachieved.InnerHtml = fields[k].primaryfiledname;
                    Secondarygradeachieved.Attributes.Add("style", "display:block;");
                    labelSecondarygradeachieved.InnerHtml = fields[k].primaryfiledname;
                    highergradeachieved.Attributes.Add("style", "display:block;");
                    labelhighergradeachieved.InnerHtml = fields[k].primaryfiledname;
                    diplomagradeachieved.Attributes.Add("style", "display:block;");
                    labeldiplomagradeachieved.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                    ExpectedHighSchoolDategrade.Attributes.Add("style", "display:block;");
                    labelExpectedHighSchoolDategrade.InnerHtml = fields[k].primaryfiledname;
                    ExpectedSecondaryDategrade.Attributes.Add("style", "display:block;");
                    labelExpectedSecondaryDategrade.InnerHtml = fields[k].primaryfiledname;
                    ExpectedHigherDategrade.Attributes.Add("style", "display:block;");
                    labelExpectedHigherDategrade.InnerHtml = fields[k].primaryfiledname;
                    ExpectedDiplomaDategrade.Attributes.Add("style", "display:block;");
                    labelExpectedDiplomaDategrade.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                    highschoolverify.Attributes.Add("style", "display:block;");
                    labelhighschoolverify.InnerHtml = fields[k].primaryfiledname;
                    Secondaryverify.Attributes.Add("style", "display:block;");
                    labelSecondaryverify.InnerHtml = fields[k].primaryfiledname;
                    higherverify.Attributes.Add("style", "display:block;");
                    labelhigherverify.InnerHtml = fields[k].primaryfiledname;
                    diplomaverify.Attributes.Add("style", "display:block;");
                    labeldiplomaverify.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "RELATIONSHIP WITH THE CONTACT":
                    highschoolrelation.Attributes.Add("style", "display:block;");
                    labelhighschoolrelation.InnerHtml = fields[k].primaryfiledname;
                    secondaryschoolrelation.Attributes.Add("style", "display:block;");
                    labelsecondaryschoolrelation.InnerHtml = fields[k].primaryfiledname;
                    higherrelation.Attributes.Add("style", "display:block;");
                    labelhigherrelation.InnerHtml = fields[k].primaryfiledname;
                    diplomarelation.Attributes.Add("style", "display:block;");
                    labeldiplomarelation.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                    highschoolcontactEmail.Attributes.Add("style", "display:block;");
                    labelhighschoolcontactEmail.InnerHtml = fields[k].primaryfiledname;
                    secondarycontactEmail.Attributes.Add("style", "display:block;");
                    labelsecondarycontactEmail.InnerHtml = fields[k].primaryfiledname;
                    highercontactEmail.Attributes.Add("style", "display:block;");
                    labelhighercontactEmail.InnerHtml = fields[k].primaryfiledname;
                    diplomacontactEmail.Attributes.Add("style", "display:block;");
                    labeldiplomacontactEmail.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                    highschoolcontactMobile.Attributes.Add("style", "display:block;");
                    labelhighschoolcontactMobile.InnerHtml = fields[k].primaryfiledname;
                    secondarycontactMobile.Attributes.Add("style", "display:block;");
                    labelsecondarycontactMobile.InnerHtml = fields[k].primaryfiledname;
                    highercontactMobile.Attributes.Add("style", "display:block;");
                    labelhighercontactMobile.InnerHtml = fields[k].primaryfiledname;
                    diplomacontactMobile.Attributes.Add("style", "display:block;");
                    labeldiplomacontactMobile.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "HIGHEST EDUCATION":
                    higestEducation.Attributes.Add("style", "display:block;");
                    labelhigestEducation.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL? (YEAR 12)":
                    Secondary.Attributes.Add("style", "display:block;");
                    labelSecondary.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "COUNTRY OF SECONDARY EDUCATION":
                    SecondaryCountry.Attributes.Add("style", "display:block;");
                    labelSecondaryCountry.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "Add Subject and their Grades":
                    highshoolgrade.Attributes.Add("style", "display:block;");
                    btn10th.Value = fields[k].primaryfiledname;
                    secondarygrade.Attributes.Add("style", "display:block;");
                    btn12th.Value = fields[k].primaryfiledname;
                    highergrade.Attributes.Add("style", "display:block;");
                    btnhigher.Value = fields[k].primaryfiledname;
                    diplomagrade.Attributes.Add("style", "display:block;");
                    btndiploma.Value = fields[k].primaryfiledname;
                    break;
                case "HAVE YOU COMPLETED ANY HIGHER (UNDER GRADUATE, MASTERS OR PHD) DEGREE":
                    higher.Attributes.Add("style", "display:block;");
                    labelhigher.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "Add Another Higher Qualification":
                    addanother.Attributes.Add("style", "display:block;");
                    btnAddanother.Text = fields[k].primaryfiledname;
                    break;

                case "HIGHER COURSE":
                    highercourse.Attributes.Add("style", "display:block;");
                    labelhighercourse.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "Country of Higher Education":
                    higherCountry.Attributes.Add("style", "display:block;");
                    labelhigherCountry.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "HAVE YOU COMPLETED ANY DIPLOMA OR CERTIFICATE PROGRAMS":
                    diploma.Attributes.Add("style", "display:block;");
                    labeldiploma.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "COUNTRY OF DIPLOMA OR CERTIFICATE PROGRAMS":
                    diplomaCountry.Attributes.Add("style", "display:block;");
                    labeldiplomaCountry.InnerHtml = fields[k].primaryfiledname;
                    break;
                default:
                    break;
            }
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
                        txtDiplomaQualificationtype.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherQualificationtype.Attributes.Add("title", lstToolTips[k].tooltips);
                        txthighschoolQualificationtype.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondaryQualificationtype.Attributes.Add("title", lstToolTips[k].tooltips);
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
                        txtDiplomaVerify.Attributes.Add("title", lstToolTips[k].tooltips);
                        txthighschoolverify.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtSecondaryverify.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherVerification.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ContactRelation":
                        txtDiplomaRelation.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHigherRelation.Attributes.Add("title", lstToolTips[k].tooltips);
                        txthighschoolrelation.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtsecondaryschoolrelation.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ContactMobile":
                        txtdiplomacontactMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        txthighercontactMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtMobilehighSchool.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtsecondarycontactMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ContactEmail":
                        txtDiplomacontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtHighercontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txthighschoolcontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtsecondarycontactEmail.Attributes.Add("title", lstToolTips[k].tooltips);
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
    private void BindStudyMode2()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.studymodemaster.ToList();

            ddlDiplomaStudyMode.DataSource = studymode;
            ddlDiplomaStudyMode.DataTextField = "description";
            ddlDiplomaStudyMode.DataValueField = "id";
            ddlDiplomaStudyMode.DataBind();
            ddlDiplomaStudyMode.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindStudyMode3()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.studymodemaster.ToList();
            ddlSecondaryStudyMode.DataSource = studymode;
            ddlSecondaryStudyMode.DataTextField = "description";
            ddlSecondaryStudyMode.DataValueField = "id";
            ddlSecondaryStudyMode.DataBind();
            ddlSecondaryStudyMode.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindStudyMode4()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.studymodemaster.ToList();

            ddlHigherStudyMode.DataSource = studymode;
            ddlHigherStudyMode.DataTextField = "description";
            ddlHigherStudyMode.DataValueField = "id";
            ddlHigherStudyMode.DataBind();
            ddlHigherStudyMode.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindStudyMode1()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.studymodemaster.ToList();
            ddlHighSchoolStudyMode.DataSource = studymode;
            ddlHighSchoolStudyMode.DataTextField = "description";
            ddlHighSchoolStudyMode.DataValueField = "id";
            ddlHighSchoolStudyMode.DataBind();
            ddlHighSchoolStudyMode.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }




    }
    private void BindGrade2()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddlDiplomaGrade.DataSource = grade;
            ddlDiplomaGrade.DataTextField = "description";
            ddlDiplomaGrade.DataValueField = "id";
            ddlDiplomaGrade.DataBind();
            ddlDiplomaGrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindGrade3()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddlHigherGrade.DataSource = grade;
            ddlHigherGrade.DataTextField = "description";
            ddlHigherGrade.DataValueField = "id";
            ddlHigherGrade.DataBind();
            ddlHigherGrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindGrade4()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddlSecondaryGrade.DataSource = grade;
            ddlSecondaryGrade.DataTextField = "description";
            ddlSecondaryGrade.DataValueField = "id";
            ddlSecondaryGrade.DataBind();
            ddlSecondaryGrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindGrade1()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddlHighSchoolGrade.DataSource = grade;
            ddlHighSchoolGrade.DataTextField = "description";
            ddlHighSchoolGrade.DataValueField = "id";
            ddlHighSchoolGrade.DataBind();
            ddlHighSchoolGrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindEducationMedium1()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var medium = db.educationmediummaster.ToList();
            ddlHighschoolMedium.DataSource = medium;
            ddlHighschoolMedium.DataTextField = "description";
            ddlHighschoolMedium.DataValueField = "id";
            ddlHighschoolMedium.DataBind();
            ddlHighschoolMedium.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindEducationMedium2()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var medium = db.educationmediummaster.ToList();
            ddlSecondaryMedium.DataSource = medium;
            ddlSecondaryMedium.DataTextField = "description";
            ddlSecondaryMedium.DataValueField = "id";
            ddlSecondaryMedium.DataBind();
            ddlSecondaryMedium.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindEducationMedium3()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var medium = db.educationmediummaster.ToList();
            ddlHigherMedium.DataSource = medium;
            ddlHigherMedium.DataTextField = "description";
            ddlHigherMedium.DataValueField = "id";
            ddlHigherMedium.DataBind();
            ddlHigherMedium.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindEducationMedium4()
    {

        ListItem lst = new ListItem("Please select", "0");
        var medium = db.educationmediummaster.ToList();
        ddlDiplomaMedium.DataSource = medium;
        ddlDiplomaMedium.DataTextField = "description";
        ddlDiplomaMedium.DataValueField = "id";
        ddlDiplomaMedium.DataBind();
        ddlDiplomaMedium.Items.Insert(0, lst);
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
                if (EducationInfo.highschoolcountry != null)
                {
                    ddlCountryHighSchool.ClearSelection();
                    ddlCountryHighSchool.Items.FindByValue(EducationInfo.highschoolcountry).Selected = true;
                }
                if (EducationInfo.highschoolgradetypeid != null)
                {
                    ddlHighSchoolGrade.ClearSelection();
                    ddlHighSchoolGrade.Items.FindByValue(EducationInfo.highschoolgradetypeid.ToString()).Selected = true;
                }
                if (EducationInfo.highschoolmediumid != null)
                {
                    ddlHighschoolMedium.ClearSelection();
                    ddlHighschoolMedium.Items.FindByValue(EducationInfo.highschoolmediumid.ToString()).Selected = true;
                }
                if (EducationInfo.highschoolmodeid != null)
                {
                    ddlHighSchoolStudyMode.ClearSelection();
                    ddlHighSchoolStudyMode.Items.FindByValue(EducationInfo.highschoolmodeid.ToString()).Selected = true;
                }
                if (EducationInfo.highschoolendate != null)
                    txtEndDate.Value = EducationInfo.highschoolendate.ToString();
                if (EducationInfo.ishighschooldone == 1)
                    rblHighYes.Checked = true;
                else if (EducationInfo.ishighschooldone == 2)
                    rblHighNo.Checked = true;
                else
                    rblHighNot.Checked = true;
                if (EducationInfo.highschoolgradedeclared == 1)
                    rblYes.Checked = true;
                else if (EducationInfo.highschoolgradedeclared == 2)
                    rblYetToConduct.Checked = true;
                else
                    rblNot.Checked = true;
                txthighschoolQualificationtype.Value = EducationInfo.highschoolqualificationtype;


                txthighschoolrelation.Value = EducationInfo.highschoolrelationship;
                if (EducationInfo.highschoolreusltdate != null)
                    txtExpectedHighSchoolResult.Value = Convert.ToDateTime(EducationInfo.highschoolreusltdate).ToString("yyyy-MM-dd");
                txthighschoolName.Value = EducationInfo.highschoolname;
                if (EducationInfo.highschoolstartdate != null)
                    txtStartDate.Value = Convert.ToDateTime(EducationInfo.highschoolstartdate).ToString("yyyy-MM-dd");
                if (EducationInfo.highschoolendate != null)
                    txtEndDate.Value = Convert.ToDateTime(EducationInfo.highschoolendate).ToString("yyyy-MM-dd");


                txthighschoolcontactEmail.Value = EducationInfo.highschoolverificationemail;
                txthighschoolverify.Value = EducationInfo.highschoolverificationname;
                txtHigestEducation.Value = EducationInfo.highestdegree;
                /// High School Details End-----

                /// Secondary Details
                /// 
                if (EducationInfo.secondarycountry != null)
                {
                    ddlSecondaryCountry.ClearSelection();
                    ddlSecondaryCountry.Items.FindByValue(EducationInfo.secondarycountry).Selected = true;
                }
                if (EducationInfo.secondarygradetypeid != null)
                {
                    ddlSecondaryGrade.ClearSelection();
                    ddlSecondaryGrade.Items.FindByValue(EducationInfo.secondarygradetypeid.ToString()).Selected = true;
                }
                if (EducationInfo.secondarymediumstudy != null)
                {
                    ddlSecondaryMedium.ClearSelection();
                    ddlSecondaryMedium.Items.FindByValue(EducationInfo.secondarymediumstudy.ToString()).Selected = true;
                }
                if (EducationInfo.secondarymodestudy != null)
                {
                    ddlSecondaryStudyMode.ClearSelection();
                    ddlSecondaryStudyMode.Items.FindByValue(EducationInfo.secondarymodestudy.ToString()).Selected = true;
                }


                if (EducationInfo.secondaryendate != null)
                    txtSecondaryEndDate.Value = EducationInfo.secondaryendate.ToString();
                if (EducationInfo.issecondarydone == 1)
                    rblSecondaryYes.Checked = true;
                else if (EducationInfo.issecondarydone == 2)
                    rblSecondaryNo.Checked = true;
                else
                    rblSecondaryNot.Checked = true;

                if (EducationInfo.secondarygradedeclared == 1)
                    rblSecondarygradeachievedYes.Checked = true;
                else if (EducationInfo.secondarygradedeclared == 2)
                    SecondarygradeachievedYet.Checked = true;
                else
                    SecondarygradeachievedNo.Checked = true;

                txtSecondaryQualificationtype.Value = EducationInfo.secondaryqualifucationtype;
                txtsecondaryschoolrelation.Value = EducationInfo.relationshipwitnsecondaryverification;
                if (EducationInfo.secondaryresultdate != null)
                    txtExpectedSecondaryResult.Value = Convert.ToDateTime(EducationInfo.secondaryresultdate).ToString("yyyy-MM-dd");
                txtSecondarySchoolName.Value = EducationInfo.secondaryname;
                if (EducationInfo.secondarystartdate != null)
                    txtSecondaryStartDate.Value = Convert.ToDateTime(EducationInfo.secondarystartdate).ToString("yyyy-MM-dd");
                if (EducationInfo.secondaryendate != null)
                    txtSecondaryEndDate.Value = Convert.ToDateTime(EducationInfo.secondaryendate).ToString("yyyy-MM-dd");


                txtsecondarycontactEmail.Value = EducationInfo.secondaryverificationemail;
                txtSecondaryverify.Value = EducationInfo.secondaryverificationname;
                /// Secondary Details End-----
                /// Diploma
                /// 
                if (EducationInfo.diplomacountry != null)
                {
                    ddlDiplomaCountry.ClearSelection();
                    ddlDiplomaCountry.Items.FindByValue(EducationInfo.diplomacountry).Selected = true;
                }
                if (EducationInfo.diplomagradetypeid != null)
                {
                    ddlDiplomaGrade.ClearSelection();
                    ddlDiplomaGrade.Items.FindByValue(EducationInfo.diplomagradetypeid.ToString()).Selected = true;
                }
                if (EducationInfo.diplomamediumid != null)
                {
                    ddlDiplomaMedium.ClearSelection();
                    ddlDiplomaMedium.Items.FindByValue(EducationInfo.diplomamediumid.ToString()).Selected = true;
                }
                if (EducationInfo.diplomastudymodeid != null)
                {
                    ddlDiplomaStudyMode.ClearSelection();
                    ddlDiplomaStudyMode.Items.FindByValue(EducationInfo.diplomastudymodeid.ToString()).Selected = true;
                }
                if (txtDiplomaEndDate.Value != "")
                    txtDiplomaEndDate.Value = EducationInfo.diplomaendate.ToString();
                if (EducationInfo.isdiplomadone == 1)
                    rbldiplomaYes.Checked = true;
                else if (EducationInfo.isdiplomadone == 2)
                    rbldiplomaNo.Checked = true;

                else
                    rbldiplomaNot.Checked = true;

                if (EducationInfo.diplomagradeachieved == 1)
                    rblDiplomaGradeYes.Checked = true;
                else if (EducationInfo.diplomagradeachieved == 2)
                    rblDiplomaGradeYet.Checked = true;
                else
                    rblDiplomaGradeNot.Checked = true;


                txtDiplomaQualificationtype.Value = EducationInfo.diplomaqualificationtype;
                txtDiplomaRelation.Value = EducationInfo.relationshipwithdiplomaverification;
                if (EducationInfo.diplomaresultdate != null)
                    txtExpectedDiplomaResult.Value = Convert.ToDateTime(EducationInfo.diplomaresultdate).ToString("yyyy-MM-dd");
                txtDiplomaschoolName.Value = EducationInfo.diplomaschoolname;
                if (EducationInfo.diplomastartdate != null)
                    txtDiplomaStartDate.Value = Convert.ToDateTime(EducationInfo.diplomastartdate).ToString("yyyy-MM-dd");
                if (EducationInfo.diplomaendate != null)
                    txtDiplomaEndDate.Value = Convert.ToDateTime(EducationInfo.diplomaendate).ToString("yyyy-MM-dd");


                txtDiplomacontactEmail.Value = EducationInfo.diplomaverificationemail;
                txtDiplomaVerify.Value = EducationInfo.diplomaverificationname;
                if (EducationInfo.ishighereducation == 1)
                    rblhigherYes.Checked = true;
                else if (EducationInfo.ishighereducation == 2)
                    rblhigherNo.Checked = true;
                else
                    rblhigherNot.Checked = true;
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
                if (HigherEducation.gradetypeid != null)
                {
                    ddlHigherGrade.ClearSelection();
                    ddlHigherGrade.Items.FindByValue(HigherEducation.gradetypeid.ToString()).Selected = true;
                }
                if (HigherEducation.studymediumid != null)
                {
                    ddlHigherMedium.ClearSelection();
                    ddlHigherMedium.Items.FindByValue(HigherEducation.studymediumid.ToString()).Selected = true;
                }
                if (HigherEducation.studymodeid != null)
                {
                    ddlHigherStudyMode.ClearSelection();
                    ddlHigherStudyMode.Items.FindByValue(HigherEducation.studymodeid.ToString()).Selected = true;
                }
                if (HigherEducation.finalgradeacheived == 1)
                    rblhigherYes.Checked = true;
                else if (HigherEducation.finalgradeacheived == 2)
                    rblhigherNo.Checked = true;
                else
                    rblhigherNot.Checked = true;

                if (HigherEducation.finalgradeacheived == 1)
                    rblhighergradeachievedYes.Checked = true;
                else if (HigherEducation.finalgradeacheived == 2)
                    rblhighergradeachievedYet.Checked = true;
                else
                    rblhighergradeachievedNo.Checked = true;



                txtHigherQualificationtype.Value = HigherEducation.qualificationtype;
                txtHigherRelation.Value = HigherEducation.relationshipwithverification;
                if (HigherEducation.resultdate != null)
                    txtExpectedHigherDategrade.Value = Convert.ToDateTime(HigherEducation.resultdate).ToString("yyyy-MM-dd");
                txtHigherschoolName.Value = HigherEducation.schoolname;
                if (txtHigherStartDate.Value != "")
                    txtHigherStartDate.Value = Convert.ToDateTime(HigherEducation.startdate).ToString("yyyy-MM-dd");
                if (txtHigherEndDate.Value != "")
                    txtHigherEndDate.Value = Convert.ToDateTime(HigherEducation.endate).ToString("yyyy-MM-dd");


                txtHighercontactEmail.Value = HigherEducation.verificationemail;
                txtHigherVerification.Value = HigherEducation.verificationname;
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
                objEdu.highschoolcountry = ddlCountryHighSchool.SelectedValue;
                if (txtEndDate.Value != "")
                    objEdu.highschoolendate = Convert.ToDateTime(txtEndDate.Value);
                if (rblHighYes.Checked)
                    objEdu.ishighschooldone = 1;
                else if (rblHighNo.Checked)
                    objEdu.ishighschooldone = 2;
                else
                    objEdu.ishighschooldone = 3;
                if (rblYes.Checked)
                    objEdu.highschoolgradedeclared = 1;
                else if (rblYetToConduct.Checked)
                    objEdu.highschoolgradedeclared = 2;
                else
                    objEdu.highschoolgradedeclared = 3;
                if (ddlHighSchoolGrade.SelectedValue != "")
                    objEdu.highschoolgradetypeid = Convert.ToInt32(ddlHighSchoolGrade.SelectedValue);
                objEdu.highschoolqualificationtype = txthighschoolQualificationtype.Value;
                objEdu.highschoolrelationship = txthighschoolrelation.Value;
                if (txtExpectedHighSchoolResult.Value != "")
                    objEdu.highschoolreusltdate = Convert.ToDateTime(txtExpectedHighSchoolResult.Value);
                objEdu.highschoolname = txthighschoolName.Value;
                if (txtStartDate.Value != "")
                    objEdu.highschoolstartdate = Convert.ToDateTime(txtStartDate.Value);
                if (txtEndDate.Value != "")
                    objEdu.highschoolendate = Convert.ToDateTime(txtEndDate.Value);
                if (ddlHighschoolMedium.SelectedValue != "")
                    objEdu.highschoolmediumid = Convert.ToInt32(ddlHighschoolMedium.SelectedValue);
                if (ddlHigherStudyMode.SelectedValue != "")
                    objEdu.highschoolmodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);

                objEdu.highschoolverificationemail = txtHighercontactEmail.Value;
                objEdu.highschoolverificationname = txtHigherVerification.Value;
                objEdu.highestdegree = txtHigestEducation.Value;
                /// High School Details End-----

                /// Secondary Details
                objEdu.secondarycountry = ddlSecondaryCountry.SelectedValue;
                if (txtSecondaryEndDate.Value != "")
                    objEdu.secondaryendate = Convert.ToDateTime(txtSecondaryEndDate.Value);
                if (rblSecondaryYes.Checked)
                    objEdu.issecondarydone = 1;
                else if (rblSecondaryNo.Checked)
                    objEdu.issecondarydone = 2;
                else
                    objEdu.issecondarydone = 3;
                if (rblSecondarygradeachievedYes.Checked)
                    objEdu.secondarygradedeclared = 1;
                else if (SecondarygradeachievedYet.Checked)
                    objEdu.secondarygradedeclared = 2;
                else
                    objEdu.secondarygradedeclared = 3;
                if (ddlSecondaryGrade.SelectedValue != "")
                    objEdu.secondarygradetypeid = Convert.ToInt32(ddlSecondaryGrade.SelectedValue);
                objEdu.secondaryqualifucationtype = txtSecondaryQualificationtype.Value;
                objEdu.relationshipwitnsecondaryverification = txtsecondaryschoolrelation.Value;
                if (txtExpectedSecondaryResult.Value != "")
                    objEdu.secondaryresultdate = Convert.ToDateTime(txtExpectedSecondaryResult.Value);
                objEdu.secondaryname = txtSecondarySchoolName.Value;
                if (txtSecondaryStartDate.Value != "")
                    objEdu.secondarystartdate = Convert.ToDateTime(txtSecondaryStartDate.Value);
                if (txtSecondaryEndDate.Value != "")
                    objEdu.secondaryendate = Convert.ToDateTime(txtSecondaryEndDate.Value);
                if (ddlSecondaryMedium.SelectedValue != "")
                    objEdu.secondarymediumstudy = Convert.ToInt32(ddlSecondaryMedium.SelectedValue);
                if (ddlSecondaryStudyMode.SelectedValue != "")
                    objEdu.secondarymodestudy = Convert.ToInt32(ddlSecondaryStudyMode.SelectedValue);
                objEdu.secondaryverificationemail = txtsecondarycontactEmail.Value;
                objEdu.secondaryverificationname = txtSecondaryverify.Value;
                /// Secondary Details End-----
                /// Diploma
                objEdu.diplomacountry = ddlDiplomaCountry.SelectedValue;
                if (txtDiplomaEndDate.Value != "")
                    objEdu.diplomaendate = Convert.ToDateTime(txtDiplomaEndDate.Value);
                if (rbldiplomaYes.Checked)
                    objEdu.isdiplomadone = 1;
                else if (rbldiplomaNo.Checked)
                    objEdu.isdiplomadone = 2;
                else
                    objEdu.isdiplomadone = 3;
                if (rblDiplomaGradeYes.Checked)
                    objEdu.diplomagradeachieved = 1;
                else if (rblDiplomaGradeYet.Checked)
                    objEdu.diplomagradeachieved = 2;
                else
                    objEdu.diplomagradeachieved = 3;
                if (ddlDiplomaGrade.SelectedValue != "")
                    objEdu.diplomagradetypeid = Convert.ToInt32(ddlDiplomaGrade.SelectedValue);
                objEdu.diplomaqualificationtype = txtDiplomaQualificationtype.Value;
                objEdu.relationshipwithdiplomaverification = txtDiplomaRelation.Value;
                if (txtExpectedDiplomaResult.Value != "")
                    objEdu.diplomaresultdate = Convert.ToDateTime(txtExpectedDiplomaResult.Value);
                objEdu.diplomaschoolname = txtDiplomaschoolName.Value;
                if (txtDiplomaStartDate.Value != "")
                    objEdu.diplomastartdate = Convert.ToDateTime(txtDiplomaStartDate.Value);
                if (txtDiplomaEndDate.Value != "")
                    objEdu.diplomaendate = Convert.ToDateTime(txtDiplomaEndDate.Value);
                if (ddlDiplomaMedium.SelectedValue != "")
                    objEdu.diplomamediumid = Convert.ToInt32(ddlDiplomaMedium.SelectedValue);
                if (ddlDiplomaStudyMode.SelectedValue != "")
                    objEdu.diplomastudymodeid = Convert.ToInt32(ddlDiplomaStudyMode.SelectedValue);
                objEdu.diplomaverificationemail = txtDiplomacontactEmail.Value;
                objEdu.diplomaverificationname = txtDiplomaVerify.Value;
                if (rblhigherYes.Checked)
                    objEdu.ishighereducation = 1;
                else if (rblhigherNo.Checked)
                    objEdu.ishighereducation = 2;
                else
                    objEdu.ishighereducation = 3;
                objEdu.highschoolverificationmobile = txthighercontactMobile.Value;
                objEdu.secondaryverificationmobile = txtsecondarycontactEmail.Value;
                objEdu.diplomaverificationmobile = txtdiplomacontactMobile.Value;
                objEdu.lastsavetime = DateTime.Now;
                /// Diploma End-----
                db.applicanteducationdetails.Add(objEdu);

            }
            else
            {

                EducationInfo.highschoolcountry = ddlCountryHighSchool.SelectedValue;
                if (txtEndDate.Value != "")
                    EducationInfo.highschoolendate = Convert.ToDateTime(txtEndDate.Value);
                if (rblHighYes.Checked)
                    EducationInfo.ishighschooldone = 1;
                else if (rblHighNo.Checked)
                    EducationInfo.ishighschooldone = 2;
                else
                    EducationInfo.ishighschooldone = 3;
                if (rblYes.Checked)
                    EducationInfo.highschoolgradedeclared = 1;
                else if (rblYetToConduct.Checked)
                    EducationInfo.highschoolgradedeclared = 2;
                else
                    EducationInfo.highschoolgradedeclared = 3;
                if (ddlHighSchoolGrade.SelectedValue != "")
                    EducationInfo.highschoolgradetypeid = Convert.ToInt32(ddlHighSchoolGrade.SelectedValue);
                EducationInfo.highschoolqualificationtype = txthighschoolQualificationtype.Value;
                EducationInfo.highschoolrelationship = txthighschoolrelation.Value;
                if (txtExpectedHighSchoolResult.Value != "")
                    EducationInfo.highschoolreusltdate = Convert.ToDateTime(txtExpectedHighSchoolResult.Value);
                EducationInfo.highschoolname = txthighschoolName.Value;
                if (txtStartDate.Value != "")
                    EducationInfo.highschoolstartdate = Convert.ToDateTime(txtStartDate.Value);
                if (txtEndDate.Value != "")
                    EducationInfo.highschoolendate = Convert.ToDateTime(txtEndDate.Value);
                if (ddlHighschoolMedium.SelectedValue != "")
                    EducationInfo.highschoolmediumid = Convert.ToInt32(ddlHighschoolMedium.SelectedValue);
                if (ddlHigherStudyMode.SelectedValue != "")
                    EducationInfo.highschoolmodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);

                EducationInfo.highschoolverificationemail = txtHighercontactEmail.Value;
                EducationInfo.highschoolverificationname = txtHigherVerification.Value;
                EducationInfo.highestdegree = txtHigestEducation.Value;
                /// High School Details End-----

                /// Secondary Details
                EducationInfo.secondarycountry = ddlSecondaryCountry.SelectedValue;
                if (txtSecondaryEndDate.Value != "")
                    EducationInfo.secondaryendate = Convert.ToDateTime(txtSecondaryEndDate.Value);
                if (rblSecondaryYes.Checked)
                    EducationInfo.issecondarydone = 1;
                else if (rblSecondaryNo.Checked)
                    EducationInfo.issecondarydone = 2;
                else
                    EducationInfo.issecondarydone = 3;
                if (rblSecondarygradeachievedYes.Checked)
                    EducationInfo.secondarygradedeclared = 1;
                else if (SecondarygradeachievedYet.Checked)
                    EducationInfo.secondarygradedeclared = 2;
                else
                    EducationInfo.secondarygradedeclared = 3;
                if (ddlSecondaryGrade.SelectedValue != "")
                    EducationInfo.secondarygradetypeid = Convert.ToInt32(ddlSecondaryGrade.SelectedValue);
                EducationInfo.secondaryqualifucationtype = txtSecondaryQualificationtype.Value;
                EducationInfo.relationshipwitnsecondaryverification = txtsecondaryschoolrelation.Value;
                if (txtExpectedSecondaryResult.Value != "")
                    EducationInfo.secondaryresultdate = Convert.ToDateTime(txtExpectedSecondaryResult.Value);
                EducationInfo.secondaryname = txtSecondarySchoolName.Value;
                if (txtSecondaryStartDate.Value != "")
                    EducationInfo.secondarystartdate = Convert.ToDateTime(txtSecondaryStartDate.Value);
                if (txtSecondaryEndDate.Value != "")
                    EducationInfo.secondaryendate = Convert.ToDateTime(txtSecondaryEndDate.Value);
                if (ddlSecondaryMedium.SelectedValue != "")
                    EducationInfo.secondarymediumstudy = Convert.ToInt32(ddlSecondaryMedium.SelectedValue);
                if (ddlSecondaryStudyMode.SelectedValue != "")
                    EducationInfo.secondarymodestudy = Convert.ToInt32(ddlSecondaryStudyMode.SelectedValue);
                EducationInfo.secondaryverificationemail = txtsecondarycontactEmail.Value;
                EducationInfo.secondaryverificationname = txtSecondaryverify.Value;
                /// Secondary Details End-----
                /// Diploma
                EducationInfo.diplomacountry = ddlDiplomaCountry.SelectedValue;
                if (txtDiplomaEndDate.Value != "")
                    EducationInfo.diplomaendate = Convert.ToDateTime(txtDiplomaEndDate.Value);
                if (rbldiplomaYes.Checked)
                    EducationInfo.isdiplomadone = 1;
                else if (rbldiplomaNo.Checked)
                    EducationInfo.isdiplomadone = 2;
                else
                    EducationInfo.isdiplomadone = 3;
                if (rblDiplomaGradeYes.Checked)
                    EducationInfo.diplomagradeachieved = 1;
                else if (rblDiplomaGradeYet.Checked)
                    EducationInfo.diplomagradeachieved = 2;
                else
                    EducationInfo.diplomagradeachieved = 3;
                if (ddlDiplomaGrade.SelectedValue != "")
                    EducationInfo.diplomagradetypeid = Convert.ToInt32(ddlDiplomaGrade.SelectedValue);
                EducationInfo.diplomaqualificationtype = txtDiplomaQualificationtype.Value;
                EducationInfo.relationshipwithdiplomaverification = txtDiplomaRelation.Value;
                if (txtExpectedDiplomaResult.Value != "")
                    EducationInfo.diplomaresultdate = Convert.ToDateTime(txtExpectedDiplomaResult.Value);
                EducationInfo.diplomaschoolname = txtDiplomaschoolName.Value;
                if (txtDiplomaStartDate.Value != "")
                    EducationInfo.diplomastartdate = Convert.ToDateTime(txtDiplomaStartDate.Value);
                if (txtDiplomaEndDate.Value != "")
                    EducationInfo.diplomaendate = Convert.ToDateTime(txtDiplomaEndDate.Value);
                if (ddlDiplomaMedium.SelectedValue != "")
                    EducationInfo.diplomamediumid = Convert.ToInt32(ddlDiplomaMedium.SelectedValue);
                if (ddlDiplomaStudyMode.SelectedValue != "")
                    EducationInfo.diplomastudymodeid = Convert.ToInt32(ddlDiplomaStudyMode.SelectedValue);
                EducationInfo.diplomaverificationemail = txtDiplomacontactEmail.Value;
                EducationInfo.diplomaverificationname = txtDiplomaVerify.Value;
                if (rblhigherYes.Checked)
                    EducationInfo.ishighereducation = 1;
                else if (rblhigherNo.Checked)
                    EducationInfo.ishighereducation = 2;
                else
                    EducationInfo.ishighereducation = 3;
                EducationInfo.highschoolverificationmobile = txthighercontactMobile.Value;
                EducationInfo.secondaryverificationmobile = txtsecondarycontactEmail.Value;
                EducationInfo.diplomaverificationmobile = txtdiplomacontactMobile.Value;
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
                    objEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                    objEducation.coursename = ddlCourse.SelectedValue;
                    if (txtHigherEndDate.Value != "")
                        objEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
                    if (rblhigherYes.Checked)
                        objEducation.finalgradeacheived = 1;
                    else if (rblhigherNo.Checked)
                        objEducation.finalgradeacheived = 2;
                    else
                        objEducation.finalgradeacheived = 3;
                    if (rblhighergradeachievedYes.Checked)
                        objEducation.finalgradeacheived = 1;
                    else if (rblhighergradeachievedYet.Checked)
                        objEducation.finalgradeacheived = 2;
                    else
                        objEducation.finalgradeacheived = 3;
                    if (ddlHigherGrade.SelectedValue != "")
                        objEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);
                    objEducation.qualificationtype = txtHigherQualificationtype.Value;
                    objEducation.relationshipwithverification = txtHigherRelation.Value;
                    if (txtExpectedHigherDategrade.Value != "")
                        objEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);
                    objEducation.schoolname = txtHigherschoolName.Value;
                    if (txtHigherStartDate.Value != "")
                        objEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                    if (txtHigherEndDate.Value != "")
                        objEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
                    if (ddlHigherMedium.SelectedValue != "")
                        objEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
                    if (ddlHigherStudyMode.SelectedValue != "")
                        objEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
                    objEducation.verificationemail = txtHighercontactEmail.Value;
                    objEducation.verificationname = txtHigherVerification.Value;
                    objEducation.verificationmobile = txthighercontactMobile.Value;
                    db.applicanthighereducation.Add(objEducation);
                }
                else
                {

                    HigherEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                    HigherEducation.coursename = ddlCourse.SelectedValue;
                    if (txtHigherEndDate.Value != "")
                        HigherEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
                    if (rblhigherYes.Checked)
                        HigherEducation.finalgradeacheived = 1;
                    else if (rblhigherNo.Checked)
                        HigherEducation.finalgradeacheived = 2;
                    else
                        HigherEducation.finalgradeacheived = 3;
                    if (rblhighergradeachievedYes.Checked)
                        HigherEducation.finalgradeacheived = 1;
                    else if (rblhighergradeachievedYet.Checked)
                        HigherEducation.finalgradeacheived = 2;
                    else
                        HigherEducation.finalgradeacheived = 3;
                    if (ddlHigherGrade.SelectedValue != "")
                        HigherEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);
                    HigherEducation.qualificationtype = txtHigherQualificationtype.Value;
                    HigherEducation.relationshipwithverification = txtHigherRelation.Value;
                    if (txtExpectedHigherDategrade.Value != "")
                        HigherEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);
                    HigherEducation.schoolname = txtHigherschoolName.Value;
                    if (txtHigherStartDate.Value != "")
                        HigherEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                    if (txtHigherEndDate.Value != "")
                        HigherEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
                    if (ddlHigherMedium.SelectedValue != "")
                        HigherEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
                    if (ddlHigherStudyMode.SelectedValue != "")
                        HigherEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
                    HigherEducation.verificationemail = txtHighercontactEmail.Value;
                    HigherEducation.verificationname = txtHigherVerification.Value;
                    HigherEducation.verificationmobile = txthighercontactMobile.Value;
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
                objEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                objEducation.coursename = ddlCourse.SelectedValue;
                if (txtHigherEndDate.Value != "")
                    objEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
                if (rblhigherYes.Checked)
                    objEducation.finalgradeacheived = 1;
                else if (rblhigherNo.Checked)
                    objEducation.finalgradeacheived = 2;
                else
                    objEducation.finalgradeacheived = 3;
                if (rblhighergradeachievedYes.Checked)
                    objEducation.finalgradeacheived = 1;
                else if (rblhighergradeachievedYet.Checked)
                    objEducation.finalgradeacheived = 2;
                else
                    objEducation.finalgradeacheived = 3;
                if (ddlHigherGrade.SelectedValue != "")
                    objEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);
                objEducation.qualificationtype = txtHigherQualificationtype.Value;
                objEducation.relationshipwithverification = txtHigherRelation.Value;
                if (txtExpectedHigherDategrade.Value != "")
                    objEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);
                objEducation.schoolname = txtHigherschoolName.Value;
                if (txtHigherStartDate.Value != "")
                    objEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                if (ddlHigherMedium.SelectedValue != "")
                    objEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
                if (ddlHigherStudyMode.SelectedValue != "")
                    objEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
                objEducation.verificationemail = txtHighercontactEmail.Value;
                objEducation.verificationname = txtHigherVerification.Value;
                objEducation.verificationmobile = txthighercontactMobile.Value;
                db.applicanthighereducation.Add(objEducation);
            }
            else
            {

                HigherEducation.countryofhighereducation = ddlHigherCountry.SelectedValue;
                HigherEducation.coursename = ddlCourse.SelectedValue;
                if (txtHigherEndDate.Value != "")
                    HigherEducation.endate = Convert.ToDateTime(txtHigherEndDate.Value);
                if (rblhigherYes.Checked)
                    HigherEducation.finalgradeacheived = 1;
                else if (rblhigherNo.Checked)
                    HigherEducation.finalgradeacheived = 2;
                else
                    HigherEducation.finalgradeacheived = 3;
                if (rblhighergradeachievedYes.Checked)
                    HigherEducation.finalgradeacheived = 1;
                else if (rblhighergradeachievedYet.Checked)
                    HigherEducation.finalgradeacheived = 2;
                else
                    HigherEducation.finalgradeacheived = 3;
                if (ddlHigherGrade.SelectedValue != "")
                    HigherEducation.gradetypeid = Convert.ToInt32(ddlHigherGrade.SelectedValue);
                HigherEducation.qualificationtype = txtHigherQualificationtype.Value;
                HigherEducation.relationshipwithverification = txtHigherRelation.Value;
                if (txtExpectedHigherDategrade.Value != "")
                    HigherEducation.resultdate = Convert.ToDateTime(txtExpectedHigherDategrade.Value);
                HigherEducation.schoolname = txtHigherschoolName.Value;
                if (txtHigherStartDate.Value != "")
                    HigherEducation.startdate = Convert.ToDateTime(txtHigherStartDate.Value);
                if (ddlHigherMedium.SelectedValue != "")
                    HigherEducation.studymediumid = Convert.ToInt32(ddlHigherMedium.SelectedValue);
                if (ddlHigherStudyMode.SelectedValue != "")
                    HigherEducation.studymodeid = Convert.ToInt32(ddlHigherStudyMode.SelectedValue);
                HigherEducation.verificationemail = txtHighercontactEmail.Value;
                HigherEducation.verificationname = txtHigherVerification.Value;
                HigherEducation.verificationmobile = txthighercontactMobile.Value;
            }
            db.SaveChanges();
            bindhigherCourses();
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

                if (HigherEducation.finalgradeacheived == 1)
                    rblhigherYes.Checked = true;
                else if (HigherEducation.finalgradeacheived == 2)
                    rblhigherNo.Checked = true;
                else
                    rblhigherNot.Checked = true;

                if (HigherEducation.finalgradeacheived == 1)
                    rblhighergradeachievedYes.Checked = true;
                else if (HigherEducation.finalgradeacheived == 2)
                    rblhighergradeachievedYet.Checked = true;
                else
                    rblhighergradeachievedNo.Checked = true;
                if (HigherEducation.gradetypeid != null)
                {
                    ddlHigherGrade.ClearSelection();
                    ddlHigherGrade.Items.FindByValue(HigherEducation.gradetypeid.ToString()).Selected = true;
                }


                txtHigherQualificationtype.Value = HigherEducation.qualificationtype;
                txtHigherRelation.Value = HigherEducation.relationshipwithverification;
                if (HigherEducation.resultdate != null)
                    txtExpectedHigherDategrade.Value = Convert.ToDateTime(HigherEducation.resultdate).ToString("yyyy-MM-dd");
                txtHigherschoolName.Value = HigherEducation.schoolname;
                if (txtHigherStartDate.Value != "")
                    txtHigherStartDate.Value = Convert.ToDateTime(HigherEducation.startdate).ToString("yyyy-MM-dd");
                if (txtHigherEndDate.Value != "")
                    txtHigherEndDate.Value = Convert.ToDateTime(HigherEducation.endate).ToString("yyyy-MM-dd");
                if (HigherEducation.studymediumid != null)
                {
                    ddlHigherMedium.ClearSelection();
                    ddlHigherMedium.Items.FindByValue(HigherEducation.studymediumid.ToString()).Selected = true;
                }
                if (HigherEducation.studymodeid != null)
                {
                    ddlHigherStudyMode.ClearSelection();
                    ddlHigherStudyMode.Items.FindByValue(HigherEducation.studymodeid.ToString()).Selected = true;
                }

                txtHighercontactEmail.Value = HigherEducation.verificationemail;
                txtHigherVerification.Value = HigherEducation.verificationname;
                btnAddanother.Text = "Update Info";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}