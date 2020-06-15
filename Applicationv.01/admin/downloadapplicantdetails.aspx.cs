using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_downloadpersonal : System.Web.UI.Page
{
    protected int ApplicantID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    protected List<applicantreferencecheck> referenccheckList = new List<applicantreferencecheck>();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected List<customfieldmaster> CustomControlsPersonal = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsConatct = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsKYS = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsEdu = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsLang = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsEmp = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsRef = new List<customfieldmaster>();
    protected List<customfieldmaster> CustomControlsSocial = new List<customfieldmaster>();
    protected string logoURL = "", NationalityValue = "";
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected List<applicantemployerdetails> EmployersDetail = new List<applicantemployerdetails>();
    protected List<admincomments> Comments = new List<admincomments>();
    protected List<admincomments> RefComments = new List<admincomments>();
    protected string Name = "", RefrenceEmail = "", RefrenceMobile = "";
    protected string employmentInfo = "", yearsOfexp = "", employerwebsite = "", employer = "", employercity = "", employercountry = "", position = "", startdate = "", enddate = "", BriefDescription = "", reportingmanger = "", employmentverification = "", relationship = "", emailEmployment = "", linkedin = "";
    protected Common objCom = new Common();
    protected List<applicanthighereducation> HigherEducation = new List<applicanthighereducation>();
    public List<applicantresidencehistory> lstOfResidences = new List<applicantresidencehistory>();
    public string universitycountry, nameofinstitue;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "" || Request.QueryString["downloadPdf"] == null || Request.QueryString["downloadPdf"].ToString() == "")
        {
        }
        else
        {
            int downloadPdf = 0;
            int.TryParse(Request.QueryString["downloadPdf"].ToString(), out downloadPdf);

            if ((downloadPdf == 0 && Utility.CheckAdminLogin()) || (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr"))
            {
                universityID = Utility.GetUniversityId();
                ApplicantID = Convert.ToInt32(Request.QueryString["id"].ToString());

                nameofinstitue = Convert.ToString(Session["universityName"]);
                int unicountryID = Convert.ToInt32(Session["universityCountry"]);
                universitycountry = objCom.GetCountryDiscription(unicountryID);

                CustomControlsPersonal = objCom.CustomControlist(1, universityID);
                CustomControlsConatct = objCom.CustomControlist(2, universityID);
                CustomControlsKYS = objCom.CustomControlist(3, universityID);
                CustomControlsEdu = objCom.CustomControlist(4, universityID);
                CustomControlsLang = objCom.CustomControlist(5, universityID);
                CustomControlsRef = objCom.CustomControlist(6, universityID);
                CustomControlsSocial = objCom.CustomControlist(8, universityID);
                CustomControlsEmp = objCom.CustomControlist(7, universityID);
                EmployersDetail = db.applicantemployerdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();

                SetControlsUniversitywiseEmployment(7);
                Comments = objCom.GetAdminComments(7, universityID, ApplicantID);
                RefComments = objCom.GetAdminComments(6, universityID, ApplicantID);
                referenccheckList = db.applicantreferencecheck.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();
                SetControlsUniversitywiseRef(6);

                if (!IsPostBack)
                {
                    //if (CustomControls.Count > 0)
                    //    objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
                    var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                    logoURL = webURL + "/Docs/" + universityID + "/" + university.logo;
                    // Personal Detail Page
                    SetPersonalControlsUniversitywise(1);
                    PopulatePersonalInfo();
                    SetPersonalAdminComments(1);
                    PopulatePersonalSupervisorComments(1);
                    // contact Detail page

                    SetConatctControlsUniversitywise(2);
                    PopulateConatctInfo();
                    SetContactAdminComments(2);
                    PopulateConatctSupervisorComments(2);
                    // KYS Deatils

                    SetControlsUniversitywiseKYS(3);
                    PopulateKYSDetails();
                    SetAdminCommentsKYS(3);
                    PopulateSupervisorCommentsKYS(3);
                    // eDUCATION

                    SetControlsUniversitywiseEducation(4);
                    EducationDetails();
                    SetAdminCommentseducation(4);
                    PopulateSupervisorCommentsEducation(4);
                    //Language
                    SetControlsUniversitywiseLanguage(5);
                    SetAdminCommentsLanguage(5);
                    PopulateLanguageDetails();
                    PopulateSupervisorCommentsLanguage(5);
                    // Employment


                    SetControlsUniversitywise(8);
                    PopulateSocailInfo();
                    SetAdminCommentsSocail(8);
                    PopulateSupervisorCommentsSocial(8);
                }
            }
        }              
    }

    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                string Title = "";
                if (profileInfo.title != null)
                {
                    Title = objCom.GetTitle(Convert.ToInt32(profileInfo.title));
                    if (Title == "Others")
                        Title = profileInfo.othertitle;
                }
                lblTitle.Text = Title;
                if (profileInfo.ispassportfirstname.HasValue && profileInfo.ispassportfirstname.Value)
                    lblpassportsameasFirstName.Text = "Yes";
                else
                    lblpassportsameasFirstName.Text = "No";
                if (profileInfo.ispassportlastname.HasValue && profileInfo.ispassportlastname.Value)
                    lblpassportsameasLastName.Text = "Yes";
                else
                    lblLastName.Text = "No";
                if (profileInfo.ispassportmiddlename.HasValue && profileInfo.ispassportmiddlename.Value)
                    lblpassportsameasmiddlename.Text = "Yes";
                else
                    lblpassportsameasmiddlename.Text = "No";

                lblFirstName.Text = profileInfo.firstname;
                lblLastName.Text = profileInfo.lastname;
                lblMiddleName.Text = profileInfo.middlename;
                lblPrefferedName.Text = profileInfo.prefferedname;
                if (profileInfo.dateofbirth != null)
                {
                    lblDOB.Text = Convert.ToDateTime(profileInfo.dateofbirth).ToString("yyyy-MM-dd");

                }
                if (profileInfo.gender == 1)
                    lblGender.Text = "Male";
                else if (profileInfo.gender == 0)
                    lblGender.Text = "Female";
                else if (profileInfo.gender == 2)
                    lblGender.Text = "Other";
                else if (profileInfo.gender == 3)
                    lblGender.Text = "Prefer Not to say";
                if (profileInfo.higheststudycompleted != null)
                {
                    lblhigheststudy.Text = objCom.GetHighestDegree(Convert.ToInt32(profileInfo.higheststudycompleted));
                }
                if (profileInfo.fieldofhigheststudy != null)
                {
                    lblfieldofhigheststudy.Text = objCom.GetHighestStudyField(Convert.ToInt32(profileInfo.fieldofhigheststudy));
                }
                if (profileInfo.countryofhigheststudy != null)
                {
                    lblhighestQualificationCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.countryofhigheststudy));
                }
                if (profileInfo.studycompletedate != null)
                {
                    lblehighQualificationCompleteDate.Text = profileInfo.studycompletedate;                    
                }
                
                if (profileInfo.nationality != null)
                {
                    NationalityValue = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.nationality));
                    lblNationality.Text = NationalityValue;
                }
                if (profileInfo.nationality != null)
                {
                    string appendText = "";
                    if (profileInfo.hasdualcitizenship.HasValue && profileInfo.hasdualcitizenship.Value)
                    {
                        dualNationality.Visible = true;
                        lblDualNationality.Text = "Yes";
                      
                        
                    }
                    else
                    {
                        appendText = "_False";
                        if (profileInfo.hasdualcitizenship.HasValue)
                            lblDualNationality.Text = "NO";
                    }

                    if (NationalityValue.ToUpper() == GlobalVariables.GetChinaCountryName)
                    {
                        if (profileInfo.haschinesecodenumber.HasValue && profileInfo.haschinesecodenumber.Value)
                        {
                            lblchineseCode.Text = "Yes";
                            lblChineseCodeNo.Text = profileInfo.chinesecodenumber;
                            chineseCode.Visible = true;
                            labelChineseCode.Visible = true;
                            //rblChineseCodeNo.Visible = true;
                            //rblChineseCodeYes.Visible = true;
                            textChineseCodeDiv.Visible = true;

                            chineseCode.Style.Remove("display");
                            textChineseCodeDiv.Style.Remove("display");
                        }
                    }
                    else if (NationalityValue.ToUpper() == GlobalVariables.GetRussiaCountryName)
                    {
                        if (!string.IsNullOrEmpty(profileInfo.patronymicname))
                        {
                            lblrussianName.Text = profileInfo.patronymicname;
                            russianName.Visible = true;
                            russianName.Style.Remove("display");
                        }
                    }
                }

                if (profileInfo.nationality2.HasValue && profileInfo.nationality2.Value > 0)
                {
                    lblDualNationality.Text = "Yes";
                    lblOtherNation.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.nationality2));
                    secondNation.Visible = true;
                 
                }
                else
                {
                    lblDualNationality.Text = "No";
                }
                if (profileInfo.countryofbirth != null)
                {
                    lblBirthCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.countryofbirth));
                }
                if (profileInfo.maritalstatus != null)
                {
                    lblMarital.Text = objCom.GetMaritalStatus(Convert.ToInt32(profileInfo.maritalstatus));
                }
                if (profileInfo.isdisable == 1)
                {
                    lblDisability.Text = "Yes";
                    if (profileInfo.disabilitydescription != null)
                        lbldisabilitydesc.Text = objCom.GetDisability(Convert.ToInt32(profileInfo.disabilitydescription));
                }
                else
                {
                    lblDisability.Text = "No";
                    lbldisabilitydesc.Text = "";
                    disabilitydesc.Visible = false;
                }
                if (profileInfo.isstudentreferbyagent == 1)
                {
                    lblAgent.Text = "Yes";
                    if (profileInfo.agentid != null)
                    {
                        lblAgentList.Text = objCom.GetAgentName(Convert.ToInt32(profileInfo.agentid));
                    }
                }
                else
                {
                    lblAgent.Text = "No";
                    lblAgentList.Text = "";
                    agentList.Visible = false;
                }



                if (profileInfo.ismarried.HasValue && profileInfo.ismarried.Value)
                {
                    statusMarried.Visible = true;
                    statusMarried.Style.Remove("display");
                    labelspouseName.Text = profileInfo.spousename;
                    if (profileInfo.spousenationality != null)
                        lblSpouseNationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.spousenationality));
                    if (profileInfo.spousedob != null)
                    {
                        labelSpouseDOB.Text = Convert.ToDateTime(profileInfo.spousedob).ToString("yyyy-MM-dd");
                    }
                    if (profileInfo.marriagedate != null)
                    {
                        labelMarriagedate.Text = Convert.ToDateTime(profileInfo.marriagedate).ToString("yyyy-MM-dd");
                    }
                    SpouseNationality.Style.Remove("display");
                    SpouseDOB.Style.Remove("display");
                    MarriageDate.Style.Remove("display");
                }


            }
        }

        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private String setInnerHtml(dynamic obj)
    {
        return obj.primaryfiledname;
    }
    private void SetPersonalControlsUniversitywise(int formId)
    {
        try
        {
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
                    case "Title":
                        title.Visible = true;
                        labeltitle.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FIRST NAME":
                        firstname.Visible = true;
                        passportsameasFirstName.Visible = true;
                        labelfirstname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FAMILY NAME":
                        lastname.Visible = true;
                        passportsameasLastName.Visible = true;
                        labellastname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PREFERRED NAME":
                        preferedname.Visible = true;
                        labelpreferreName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MIDDLE NAME(S)":
                        middlename.Visible = true;
                        passportsameasmiddlename.Visible = true;
                        labelmiddlename.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DATE OF BIRTH":
                        dob.Visible = true;
                        labeldob.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GENDER":
                        gender.Visible = true;
                        labelgender.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CITIZENSHIP":
                        nationality.Visible = true;
                        labelNationality.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF BIRTH":
                        birthcountry.Visible = true;
                        labelbirthcountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MARITAL STATUS":
                        marital.Visible = true;
                        labelMarital.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DO YOU HAVE ANY DISABILITY, IMPAIRMENT OR LONG-TERM CONDITION? ":
                        disability.Visible = true;
                        labeldisability.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DISABILITY DESCRIPTION":
                        disabilitydesc.Visible = true;
                        labeldisabilitydesc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ARE YOU REFERRED BY AGENT":
                        agent.Visible = true;
                        labelagent.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "AGENT NAME":
                        agentList.Visible = true;
                        labelagentList.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HIGHEST LEVEL OF STUDY SUCCESSFULLY COMPLETED":
                        higheststudy.Visible = true;
                        labelhigheststudy.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    //case "IF YOU DIDN’T FIND YOUR AGENT NAME IN THE LIST, ADD YOUR AGENT’S EMAILL ID TO SEND THEM A REGISTRATION LINK":
                    //    addnewagent.Attributes.Add("style", "display:block;");
                    //    labeladdnewagent.InnerHtml = setInnerHtml(fields[k]);
                    //    break;
                    case "HIGHEST FIELD OF STUDY SUCCESSFULLY COMPLETED":
                        fieldstudy.Visible = true;
                        lblfieldstudy.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of highest qualification":
                        highestQualificationCountry.Visible = true;
                        labelhighestQualificationCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Year and Month of highest qualification":
                        highQualificationCompleteDate.Visible = true;
                        lblhighQualificationCompleteDate.InnerHtml = setInnerHtml(fields[k]);
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
    private String setComments(dynamic obj)
    {
        return obj.comments;
    }
    private void SetPersonalAdminComments(int formId)
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "Title":
                    if (Comments[k].adminaction == 0)
                        imgTitleNo.Visible = true;
                    else
                        imgTitleYes.Visible = true;
                    lblTitleComments.Text = setComments(Comments[k]);
                    break;
                case "First Name":
                    if (Comments[k].adminaction == 0)
                        imgFirstNameNo.Visible = true;
                    else
                        imgFirstNameYes.Visible = true;
                    lblFirstNameComments.Text = setComments(Comments[k]);
                    break;
                case "Family Name":
                    if (Comments[k].adminaction == 0)
                        imglastnameNo.Visible = true;
                    else
                        imglastnameYes.Visible = true;
                    lblLastNameComments.Text = setComments(Comments[k]);
                    break;
                case "Preferred Name":
                    if (Comments[k].adminaction == 0)
                        imgpreferednameNo.Visible = true;
                    else
                        imgpreferednameYes.Visible = true;
                    lblPrefferedNameComments.Text = setComments(Comments[k]);
                    break;
                case "Middle Name(s)":
                    if (Comments[k].adminaction == 0)
                        imgmiddlenameNo.Visible = true;
                    else
                        imgmiddlenameYes.Visible = true;
                    lblMiddleNameComments.Text = setComments(Comments[k]);
                    break;
                case "Date of birth":
                    if (Comments[k].adminaction == 0)
                        imgdobNo.Visible = true;
                    else
                        imgdobYes.Visible = true;
                    lblDOBComments.Text = setComments(Comments[k]);
                    break;
                case "Gender":
                    if (Comments[k].adminaction == 0)
                        imggenderNo.Visible = true;
                    else
                        imggenderYes.Visible = true;
                    lblGenderComments.Text = setComments(Comments[k]);
                    break;
                case "Citizenship":
                    if (Comments[k].adminaction == 0)
                        imgnationalityNo.Visible = true;
                    else
                        imgnationalityYes.Visible = true;
                    lblNationalityComments.Text = setComments(Comments[k]);
                    break;
                case "Do you ever use a Chinese Commercial Code Number for your names":
                    if (Comments[k].adminaction == 0)
                        imgchineseCodeNo.Visible = true;
                    else
                        imgchineseCodeYes.Visible = true;
                    lblchineseCodeComments.Text = setComments(Comments[k]);
                    break;
                case "Chinese Commercial Code Number":
                    if (Comments[k].adminaction == 0)
                        imgChineseCodeNoNo.Visible = true;
                    else
                        imgChineseCodeNoYes.Visible = true;
                    lblChineseCodeNoComments.Text = setComments(Comments[k]);
                    break;
                case "In English, provide your patronymic name":
                    if (Comments[k].adminaction == 0)
                        imgrussianNameNo.Visible = true;
                    else
                        imgrussianNameYes.Visible = true;
                    lblrussianNameComments.Text = setComments(Comments[k]);
                    break;
                case "Do you have dual Citizenship":
                    if (Comments[k].adminaction == 0)
                        imgdualNationalityNo.Visible = true;
                    else
                        imgdualNationalityYes.Visible = true;
                    lblDualNationalityComments.Text = setComments(Comments[k]);
                    break;
                case "Citizenship(Second)":
                    if (Comments[k].adminaction == 0)
                        imgsecondNationNo.Visible = true;
                    else
                        imgsecondNationYes.Visible = true;
                    lblOtherNationComments.Text = setComments(Comments[k]);
                    break;
                case "Country of birth":
                    if (Comments[k].adminaction == 0)
                        imgbirthcountryNo.Visible = true;
                    else
                        imgbirthcountryYes.Visible = true;
                    lblBirthCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Marital Status":
                    if (Comments[k].adminaction == 0)
                        imgmaritalNo.Visible = true;
                    else
                        imgmaritalYes.Visible = true;
                    lblMaritalComments.Text = setComments(Comments[k]);
                    break;
                case "Spouse Name":
                    if (Comments[k].adminaction == 0)
                        imgspouseNameNo.Visible = true;
                    else
                        imgspouseNameYes.Visible = true;
                    labelspouseNameComments.Text = setComments(Comments[k]);
                    break;
                case "Nationality of Spouse":
                    if (Comments[k].adminaction == 0)
                        imgSpouseNationalityNo.Visible = true;
                    else
                        imgSpouseNationalityYes.Visible = true;
                    lblSpouseNationalityComments.Text = setComments(Comments[k]);
                    break;
                case "Spouse Date of birth":
                    if (Comments[k].adminaction == 0)
                        imgSpouseDOBNo.Visible = true;
                    else
                        imgSpouseDOBYes.Visible = true;
                    labelSpouseDOBComments.Text = setComments(Comments[k]);
                    break;
                case "Date of Marriage":
                    if (Comments[k].adminaction == 0)
                        imgMarriageDateNo.Visible = true;
                    else
                        imgMarriageDateYes.Visible = true;
                    labelMarriagedateComments.Text = setComments(Comments[k]);
                    break;
                case "Do you have any disability, impairment, or a long term condition":
                    if (Comments[k].adminaction == 0)
                        imgDisabilityNo.Visible = true;
                    else
                        imgDisabilityYes.Visible = true;
                    lblDisabilityComments.Text = setComments(Comments[k]);
                    break;
                case "Disability Description":
                    if (Comments[k].adminaction == 0)
                        imgdisabilitydescNo.Visible = true;
                    else
                        imgdisabilitydescYes.Visible = true;
                    lbldisabilitydescComments.Text = setComments(Comments[k]);
                    break;
                case "Are you reffered by Agent":
                    if (Comments[k].adminaction == 0)
                        imgAgentNo.Visible = true;
                    else
                        imgAgentYes.Visible = true;
                    lblAgentComments.Text = setComments(Comments[k]);
                    break;
                case "Agent Name":
                    if (Comments[k].adminaction == 0)
                        imgAgentListNo.Visible = true;
                    else
                        imgAgentListYes.Visible = true;
                    lblAgentListComments.Text = setComments(Comments[k]);
                    break;
                case "Highest study level successfully completed":
                    if (Comments[k].adminaction == 0)
                        imghigheststudyNo.Visible = true;
                    else
                        imghigheststudyYes.Visible = true;
                    lblhigheststudyComments.Text = setComments(Comments[k]);
                    break;
                case "Highest study successfully completed field":
                    if (Comments[k].adminaction == 0)
                        imghigheststudyfieldNo.Visible = true;
                    else
                        imghigheststudyfieldYes.Visible = true;
                    lblhigheststudyfieldComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Highest Qualificatiion Achieved":
                    if (Comments[k].adminaction == 0)
                        highestQualificationCountryNo.Visible = true;
                    else
                        highestQualificationCountryYes.Visible = true;
                    lblhighestQualificationCountrycomment.Text = setComments(Comments[k]);
                    break;
                case "Year and Month of highest qualification":
                    if (Comments[k].adminaction == 0)
                        highQualificationCompleteDateNo.Visible = true;
                    else
                        highQualificationCompleteDateYes.Visible = true;
                    lblhighQualificationCompleteDatecomments.Text = setComments(Comments[k]);
                    break;

                default:
                    break;

            }

        }
        //if (CustomControls.Count > 0)
        //    objCom.SetCustomDataCommentForSupervisor(formId, ApplicantID, CustomControls, mainDiv, Comments);
    }
    private void PopulatePersonalSupervisorComments(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtPersonalComments.Text = comments[0].comments;

        }
    }

    private void PopulateConatctInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                lblEmail.Text = profileInfo.email;
                lblMobile.Text = profileInfo.mobileno;
                lblHomePhone.Text = profileInfo.homephone;
                if (profileInfo.haveskypeid == 1)
                {
                    lblSkype.Text = "Yes";
                    lblSkypeDescription.Text = profileInfo.skypeid;
                    skypeDesc.Visible = true;
                }
                else if (profileInfo.haveskypeid == 0)
                {
                    lblSkype.Text = "No";
                    lblSkypeDescription.Text = "";
                    skypeDesc.Visible = false;
                }

                if (profileInfo.havewhatsup == 1)
                {
                    lblWhatsapp.Text = "Yes";
                    if (profileInfo.isdifferentwhatsapp == 1)
                    {
                        lblWhatsapphave.Text = "Yes";
                        whatsappDesc.Visible = false;
                    }
                    else if (profileInfo.isdifferentwhatsapp == 2)
                    {
                        lblWhatsapphave.Text = "No";
                        lblWhastappDesription.Text = profileInfo.whatsappno;                        
                    }
                }
                else if (profileInfo.havewhatsup == 2)
                {
                    lblWhatsapp.Text = "No";
                    whatsappHave.Visible = false;
                    whatsappDesc.Visible = false;
                }


                lblPostalAddress.Text = profileInfo.postaladdrees1 + "," + profileInfo.postaladdrees2 + "," + profileInfo.postaladdrees3 + 
                    "," + profileInfo.postalcity + "," + profileInfo.postalstate + "," + profileInfo.postalpostcode;

                if (profileInfo.postalcountry != null)
                {
                    lblPostalAddress.Text += "," + objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.postalcountry));
                }
                if (profileInfo.issameaspostal == 1)
                {
                    lblAddress.Text = "Yes";
                    lblResidential.Text = lblPostalAddress.Text;
                }
                else if (profileInfo.issameaspostal == 2)
                {
                    lblAddress.Text = "No";
                    lblResidential.Text = profileInfo.residentialaddress1 + "," + profileInfo.residentialaddress2 + "," + profileInfo.residentialaddress3 + "," + profileInfo.residentialcity + "," + profileInfo.residentialstate + "," + profileInfo.residentailpostcode;

                    if (profileInfo.residentialcountry != null)
                    {
                        lblPostalAddress.Text += "," + objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.residentialcountry));
                    }
                }
                if (profileInfo.haspreviousresidence.HasValue && profileInfo.haspreviousresidence.Value)
                {
                    lblCurrentAddress.Text = "Yes";
                    CurrentAddress.Visible = true;
                    lstOfResidences = db.applicantresidencehistory.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();

                    //lblPrevAddStartDate.Text = Convert.ToDateTime(lstOfResidences[0].residencestartdate).ToString("yyyy-MM-dd");
                    //lblPrevAddEndDate.Text = Convert.ToDateTime(lstOfResidences[0].residenceenddate).ToString("yyyy-MM-dd");
                    //lblprevAddress1.Text = lstOfResidences[0].residenceaddress1;
                    //lblprevAddress2.Text = lstOfResidences[0].residenceaddress2;
                    //lblprevAddress3.Text = lstOfResidences[0].residenceaddress3;
                    //lblprevAddressCity.Text = lstOfResidences[0].residentialcity;
                    //lblprevAddressState.Text = lstOfResidences[0].residentialstate;
                    //lblprevAddressPostalCode.Text = lstOfResidences[0].residencepostcode;
                    //if (lstOfResidences[0].residentialcountry != null)
                    //{

                    //    lblPrevAddressCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(lstOfResidences[0].residentialcountry));
                    //}

                    addressHistory.Visible = true;

                    for (int i = 1; i < lstOfResidences.Count; i++)
                    {
                        hidAddress1.Value += lstOfResidences[i].residenceaddress1 + ";";
                        hidAddress2.Value += lstOfResidences[i].residenceaddress2 + ";";
                        hidAddress3.Value += lstOfResidences[i].residenceaddress3 + ";";
                        hidAddressCity.Value += lstOfResidences[i].residentialcity + ";";
                        hidAddressStartDate.Value += Convert.ToDateTime(lstOfResidences[i].residencestartdate).ToString("yyyy-MM-dd") + ";";
                        hidAddressEndDate.Value += Convert.ToDateTime(lstOfResidences[i].residenceenddate).ToString("yyyy-MM-dd") + ";";
                        hidAddressState.Value += lstOfResidences[i].residentialstate + ";";
                        hidAddressPostalCode.Value += lstOfResidences[i].residencepostcode + ";";
                        hidAddressCountry.Value += objCom.GetCountryDiscription(Convert.ToInt32(lstOfResidences[i].residentialcountry)) + ";";
                    }
                }
                else if (profileInfo.haspreviousresidence.HasValue && !profileInfo.haspreviousresidence.Value)
                    lblCurrentAddress.Text = "No";
                lblNominneName.Text = profileInfo.nomineefullname;
                lblNomineeEmail.Text = profileInfo.nomineeemail;
                lblNomineeMobile.Text = profileInfo.nomineemobile;
                lblNomineeRealtion.Text = profileInfo.relationshipwithnominee;
                DateTime zeroTime = new DateTime(1, 1, 1);
                DateTime Dob = Convert.ToDateTime(profileInfo.dateofbirth);
                Age objAge = new Age(Dob, DateTime.Now);
                if (objAge.Years < 18)
                {
                    guardianname.Visible = true;
                    guardianrelation.Visible = true;
                    guardianemail.Visible = true;
                    guardianmobile.Visible = true;
                }
                else
                {
                    guardianname.Visible = false;
                    guardianrelation.Visible = false;
                    guardianemail.Visible = false;
                    guardianmobile.Visible = false;
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    private void SetConatctControlsUniversitywise(int formId)
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
                    case "EMAIL":
                        email.Visible = true;
                        labelemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        mobile.Visible = true;
                        labelMobile.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HOME PHONE":
                        phone.Visible = true;
                        labelphone.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA SKYPE?":
                        skype.Visible = true;
                        labelskype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "SKYPE ID":
                        skypeDesc.Visible = true;
                        labelskypeDesc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA WHATSAPP?":
                        whatsapp.Visible = true;
                        labelwhatsapp.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "IS YOUR WHATSAPP NUMBER SAME AS YOUR MOBILE NUMBER ABOVE?":
                        whatsappHave.Visible = true;
                        labelwhatsappHave.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WHATSAPP NUMBER":
                        whatsappDesc.Visible = true;
                        labelwhatsappDesc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "POSTAL ADDRESS":
                        postal.Visible = true;
                        labelpostal.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "IS YOUR POSTAL ADDRESS THE SAME AS YOUR CURRENT RESIDENTIAL ADDRESS?":
                        address.Visible = true;
                        //previousaddress.Visible = true;
                        labeladdress.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CURRENT RESIDENTIAL ADDRESS":
                        residential.Visible = true;
                        labelResidential.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GUARDIAN FULL NAME":
                        guardianname.Visible = true;
                        labelguardianname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH GUARDIAN":
                        guardianrelation.Visible = true;
                        labelrelation.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL OF GUARDIAN":
                        guardianemail.Visible = true;
                        labelguardianemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER OF GUARDIAN":
                        guardianmobile.Visible = true;
                        labelguardianmobile.InnerHtml = setInnerHtml(fields[k]);
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

    private void SetContactAdminComments(int formId)
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "EMAIL":
                    if (Comments[k].adminaction == 0)
                        imgEmailNo.Visible = true;
                    else
                        imgEmailYes.Visible = true;
                    lblEmailComments.Text = setComments(Comments[k]);
                    break;
                case "MOBILE/CELLULAR NUMBER":
                    if (Comments[k].adminaction == 0)
                        imgMobileNo.Visible = true;
                    else
                        imgMobileYes.Visible = true;
                    lblMobileComments.Text = setComments(Comments[k]);
                    break;
                case "HOME PHONE":
                    if (Comments[k].adminaction == 0)
                        imgHomePhoneNo.Visible = true;
                    else
                        imgHomePhoneYes.Visible = true;
                    lblHomePhoneComments.Text = setComments(Comments[k]);
                    break;
                case "WOULD YOU LIKE TO CONNECT VIA SKYPE?":
                    if (Comments[k].adminaction == 0)
                        imgSkypeNo.Visible = true;
                    else
                        imgSkypeYes.Visible = true;
                    lblSkypeComments.Text = setComments(Comments[k]);
                    break;
                case "SKYPE ID":
                    if (Comments[k].adminaction == 0)
                        imgSkypeDescriptionNo.Visible = true;
                    else
                        imgSkypeDescriptionYes.Visible = true;
                    lblSkypeDescriptionComments.Text = setComments(Comments[k]);
                    break;
                case "WOULD YOU LIKE TO CONNECT VIA WHATSAPP?":
                    if (Comments[k].adminaction == 0)
                        imgWhatsappNo.Visible = true;
                    else
                        imgWhatsappYes.Visible = true;
                    lblWhatsappComments.Text = setComments(Comments[k]);
                    break;
                case "IS YOUR WHATSAPP NUMBER SAME AS YOUR MOBILE NUMBER ABOVE?":
                    if (Comments[k].adminaction == 0)
                        imgWhatsapphaveNo.Visible = true;
                    else
                        imgWhatsapphaveYes.Visible = true;
                    lblWhatsapphaveComments.Text = setComments(Comments[k]);
                    break;
                case "WHATSAPP NUMBER":
                    if (Comments[k].adminaction == 0)
                        imgwhatsappDescNo.Visible = true;
                    else
                        imgwhatsappDescYes.Visible = true;
                    lblWhastappDesriptionComments.Text = setComments(Comments[k]);
                    break;
                case "POSTAL ADDRESS":
                    if (Comments[k].adminaction == 0)
                        imgPostalAddressNo.Visible = true;
                    else
                        imgPostalAddressYes.Visible = true;
                    lblPostalAddressComments.Text = setComments(Comments[k]);
                    break;
                case "IS YOUR POSTAL ADDRESS THE SAME AS YOUR CURRENT RESIDENTIAL ADDRESS?":
                    if (Comments[k].adminaction == 0)
                        imgAddressNo.Visible = true;
                    else
                        imgAddressYes.Visible = true;
                    lblAddressComments.Text = setComments(Comments[k]);
                    break;
                case "CURRENT RESIDENTIAL ADDRESS":
                    if (Comments[k].adminaction == 0)
                        imgResidentialNo.Visible = true;
                    else
                        imgResidentialYes.Visible = true;
                    lblResidentialComments.Text = setComments(Comments[k]);
                    break;
                case "GUARDIAN FULL NAME":
                    if (Comments[k].adminaction == 0)
                        imgNominneNameNo.Visible = true;
                    else
                        imgNominneNameYes.Visible = true;
                    lblNominneNameComments.Text = setComments(Comments[k]);
                    break;
                case "RELATIONSHIP WITH GUARDIAN":
                    if (Comments[k].adminaction == 0)
                        imgNomineeRealtionNo.Visible = true;
                    else
                        imgNomineeRealtionYes.Visible = true;
                    lblNomineeRealtionComments.Text = setComments(Comments[k]);
                    break;
                case "EMAIL OF GUARDIAN":
                    if (Comments[k].adminaction == 0)
                        imgNomineeEmailNo.Visible = true;
                    else
                        imgNomineeEmailYes.Visible = true;
                    lblNomineeEmailComments.Text = setComments(Comments[k]);
                    break;
                case "MOBILE/CELLULAR NUMBER OF GUARDIAN":
                    if (Comments[k].adminaction == 0)
                        imgNomineeMobileNo.Visible = true;
                    else
                        imgNomineeMobileYes.Visible = true;
                    lblNomineeMobileComments.Text = setComments(Comments[k]);
                    break;
                case "PREVIOUS ADDRESS HISTORY DETAILS":
                    if (Comments[k].adminaction == 0)
                        imgAddressHistoryNo.Visible = true;
                    else
                        imgAddressHistoryYes.Visible = true;
                    lblAddressHistoryComments.Text = setComments(Comments[k]);
                    break;
                case "HAVE YOU BEEN LIVING IN THE CURRENT ADDRESS FOR LESS THAN 1 YEAR ?":
                    if (Comments[k].adminaction == 0)
                        imgCurrentAddressNo.Visible = true;
                    else
                        imgCurrentAddressYes.Visible = true;
                    lblCurrentAddressComments.Text = setComments(Comments[k]);
                    break;

                default:
                    break;

            }

        }
       
    }
    private void PopulateConatctSupervisorComments(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtConatct.Text = comments[0].comments;

        }
    }
    private void PopulateKYSDetails()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                lblPassportNo.Text = profileInfo.passportno;
                if (profileInfo.passportissuedate != null)
                    lblDateOfissue.Text = Convert.ToDateTime(profileInfo.passportissuedate).ToString("yyyy-MM-dd");
                if (profileInfo.passportexpirydate != null)
                    lblExpiryDate.Text = Convert.ToDateTime(profileInfo.passportexpirydate).ToString("yyyy-MM-dd");
                lblissueplace.Text = profileInfo.passportissuecity;
                if (profileInfo.passportissuecountry != null)
                {
                    lblcountryIssue.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.passportissuecountry));
                }
                if (profileInfo.alternativeproofdobId != null)
                {
                    lblalternatedobIdentitytype.Text = objCom.GetDOBProof(Convert.ToInt32(profileInfo.alternativeproofdobId));
                }
                if (profileInfo.alternativeresidenceproofId != null)
                {
                    lblalternateresidenceIdentitytype.Text = objCom.GetAddressProof(Convert.ToInt32(profileInfo.alternativeresidenceproofId));
                }
                if (profileInfo.alternativeIdentityproofId != null)
                {
                    lblalternateIdentitytype.Text = objCom.GetIdentityProof(Convert.ToInt32(profileInfo.alternativeIdentityproofId));
                }

                lblalternatedobIdentityNo.Text = profileInfo.alternativeproofdobno;
                lblalternateresidenceIdentityNo.Text = profileInfo.alternativeresidenceproofno;
                lblalternateIdentityNo.Text = profileInfo.alternativeIdentityproofno;

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulateSocailInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                
                lblFacebook.Text = profileInfo.facebookprofle;
                if(profileInfo.havefacebookaccount != null && profileInfo.havefacebookaccount == true)
                    lblFacebook.Text = "User has opted, he has no facebook account";
                
                lblLinkedin.Text = profileInfo.linkedprofile;
                if (profileInfo.havelinkedinaccount != null && profileInfo.havelinkedinaccount == true)
                    lblLinkedin.Text = "User has opted, he has no linked account";
                
                lblTwitter.Text = profileInfo.twiterprofile;
                if (profileInfo.havetwitteraccount != null && profileInfo.havetwitteraccount == true)
                    lblTwitter.Text = "User has opted, he has no twitter account";
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
   
    private void SetControlsUniversitywise(int formId)
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
                    case "LINKEDIN PROFILE":
                        linkedinsocail.Visible = true;
                        labellinked.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FACEBOOK PROFILE":
                        facebook.Visible = true;
                        labelfacebook.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TWITTER HANDLE":
                        twitter.Visible = true;
                        labeltwitter.InnerHtml = setInnerHtml(fields[k]);
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
   
    private void SetAdminCommentsSocail(int formId)
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "LINKEDIN PROFILE":
                    if (Comments[k].adminaction == 0)
                       imgLinkedinNo.Visible = true;
                    else
                        imgLinkedinYes.Visible = true;
                    lblLinkedinComments.Text = setComments(Comments[k]);
                    break;
                case "FACEBOOK PROFILE":
                    if (Comments[k].adminaction == 0)
                        imglblFacebookNo.Visible = true;
                    else
                        imglblFacebookYes.Visible = true;
                    lblFacebookComments.Text = setComments(Comments[k]);
                    break;
                case "TWITTER HANDLE":
                    if (Comments[k].adminaction == 0)
                        imgtwitterNo.Visible = true;
                    else
                        imgtwitterYes.Visible = true;
                    lblTwitterComments.Text = setComments(Comments[k]);
                    break;

                default:
                    break;

            }
          
        }
    }
    private void PopulateSupervisorCommentsSocial(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtSocial.Text = comments[0].comments;
           
        }
    }


    private void SetControlsUniversitywiseKYS(int formId)
    {
        try
        {

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
                    case "PASSPORT NUMBER":
                        passportno.Visible = true;
                        labelpassportno.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DATE OF ISSUE":
                        dateofissue.Visible = true;
                        labeldateofissue.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF ISSUE":
                        countryIssue.Visible = true;
                        labelcountryIssue.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PASSPORT EXPIRY DATE":
                        expirydate.Visible = true;
                        labelexpirydate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CITY OF ISSUE":
                        issueplace.Visible = true;
                        labelissueplace.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ALTERNATIVE PROOF OF IDENTITY":
                        alternateIdentitytype.Visible = true;
                        alternateIdentityNo.Visible = true;
                        labelalternateIdentitytype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ALTERNATIVE PROOF OF DATE OF BIRTH":
                        alternatedobIdentitytype.Visible = true;
                        alternatedobIdentityNo.Visible = true;
                        labelalternatedobIdentitytype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ALTERNATIVE PROOF OF RESIDENCE":
                        alternateresidenceIdentitytype.Visible = true;
                        alternateresidenceIdentityNo.Visible = true;
                        labelalternateresidenceIdentitytype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "IDENTITY NUMBER":
                        labelalternateIdentityNo.InnerHtml = setInnerHtml(fields[k]);
                        labelalternatedobIdentityNo.InnerHtml = setInnerHtml(fields[k]);
                        labelalternateresidenceIdentityNo.InnerHtml = setInnerHtml(fields[k]);
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
  
    private void SetAdminCommentsKYS(int formId)
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "Passport Number":
                    if (Comments[k].adminaction == 0)
                        imgPassportNoNo.Visible = true;
                    else
                        imgPassportNoYes.Visible = true;
                    labelpassportnoComments.Text = setComments(Comments[k]);
                    break;
                case "Date of Issue":
                    if (Comments[k].adminaction == 0)
                        imgDateOfissueNo.Visible = true;
                    else
                        imgDateOfissueYes.Visible = true;
                    lblDateOfissueComments.Text = setComments(Comments[k]);
                    break;
                case "PASSPORT Expiry Date":
                    if (Comments[k].adminaction == 0)
                        imgExpiryDateNo.Visible = true;
                    else
                        imgExpiryDateYes.Visible = true;
                    lblExpiryDateComments.Text = setComments(Comments[k]);
                    break;
                case "COUNTRY OF ISSUE":
                    if (Comments[k].adminaction == 0)
                        imgcountryIssueNo.Visible = true;
                    else
                        imgcountryIssueYes.Visible = true;
                    lblcountryIssueComments.Text = setComments(Comments[k]);
                    break;
                case "CITY OF ISSUE":
                    if (Comments[k].adminaction == 0)
                        imgissueplaceNo.Visible = true;
                    else
                        imgissueplaceYes.Visible = true;
                    lblissueplaceComments.Text = setComments(Comments[k]);
                    break;
                case "Select Identity Proof Type":
                    if (Comments[k].adminaction == 0)
                        imgalternateIdentitytypeNo.Visible = true;
                    else
                        imgalternateIdentitytypeYes.Visible = true;
                    lblalternateIdentitytypeComments.Text = setComments(Comments[k]);
                    break;
                case "Identity Proof Number":
                    if (Comments[k].adminaction == 0)
                        imgalternateIdentityNoNo.Visible = true;
                    else
                        imgalternateIdentityNoYes.Visible = true;
                    lblalternateIdentityNoComments.Text = setComments(Comments[k]);
                    break;
                case "Select DOB Proof Type":
                    if (Comments[k].adminaction == 0)
                        imgalternatedobIdentitytypeNo.Visible = true;
                    else
                        imgalternatedobIdentitytypeYes.Visible = true;
                    lblalternatedobIdentitytypeComments.Text = setComments(Comments[k]);
                    break;
                case "DOB proof Number":
                    if (Comments[k].adminaction == 0)
                        imgalternatedobIdentityNoNo.Visible = true;
                    else
                        imgalternatedobIdentityNoYes.Visible = true;
                    lblalternatedobIdentityNoComments.Text = setComments(Comments[k]);
                    break;
                case "Select Residence Proof Type":
                    if (Comments[k].adminaction == 0)
                        imgalternateresidenceIdentitytypeNo.Visible = true;
                    else
                        imgalternateresidenceIdentitytypeYes.Visible = true;
                    lblalternateresidenceIdentitytypeComments.Text = setComments(Comments[k]);
                    break;
                case "Residence Proof Number":
                    if (Comments[k].adminaction == 0)
                        imgalternateresidenceIdentityNoNo.Visible = true;
                    else
                        imgalternateresidenceIdentityNoYes.Visible = true;
                    lblalternateresidenceIdentityNoComments.Text = setComments(Comments[k]);
                    break;


                default:
                    break;

            }

        }
      
    }
    private void PopulateSupervisorCommentsKYS(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtKnowyournfo.Text = comments[0].comments;
           
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
                //USI
                if (EducationInfo.haveyoustudiedbefore == 1)
                {
                    lblstudiedbefore.Text = "Yes";
                    HaveUSINo.Visible = true;
                    if (EducationInfo.haveusi_number != null && EducationInfo.haveusi_number == 1)
                    {
                        lblHaveUSINo.Text = "Yes";
                        USINumber.Visible = true;
                        lblUSINumber.Text = EducationInfo.usi_number;
                    }
                    else if (EducationInfo.haveusi_number != null && EducationInfo.haveusi_number == 2)
                        lblHaveUSINo.Text = "No";
                    else if (EducationInfo.haveusi_number != null && EducationInfo.haveusi_number == 3)
                        lblHaveUSINo.Text = "I am not sure";
                }
                else if (EducationInfo.haveyoustudiedbefore == 0)
                {
                    lblstudiedbefore.Text = "No";
                }
                if (EducationInfo.haveusi_number != null && (EducationInfo.haveusi_number == 2 || EducationInfo.haveusi_number == 3))
                {
                    haveyoustudiedininstitution.Visible = true;
                    if (EducationInfo.studentinstitutionID != null)
                    {
                        lblhaveyoustudiedininstitution.Text = "Yes";
                        studentID.Visible = true;
                        lblstudentID.Text = EducationInfo.studentinstitutionID;
                    }
                    else
                        lblhaveyoustudiedininstitution.Text = "No";

                }
                //
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
                highschool.Attributes.Add("style", "display:block");
                highschoolstudymode.Attributes.Add("style", "display:none");//as in student it is hidden

                /// High School Details End-----

                /// Secondary Details
                /// 
                if (EducationInfo.ishighschooldone == 1 || EducationInfo.ishighschooldone == 2)
                {
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
                    Secondary.Attributes.Add("style", "display:block");
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
                diploma.Attributes.Add("style", "display:block");

                higher.Attributes.Add("style", "display:block");
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
    private void HideDiploma()
    {
        diplomaCountry.Visible = false;
        diplomastartDate.Visible = false;
        diplomaendDate.Visible = false;
        diplomaName.Visible = false;
        diplomaQualificationtype.Visible = false;
        diplomastudymode.Visible = false;
        diplomalanguage.Visible = false;
        diplomagradetype.Visible = false;
        diplomagradeachieved.Visible = false;
        ExpecteddiplomaDategrade.Visible = false;
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
        SecondaryName.Visible = false;
        SecondaryQualificationtype.Visible = false;
        Secondarystudymode.Visible = false;
        Secondarylanguage.Visible = false;
        Secondarygradetype.Visible = false;
        Secondarygradeachieved.Visible = false;
        ExpectedSecondaryDategrade.Visible = false;
        Secondaryverify.Visible = false;
        Secondaryrelation.Visible = false;
        SecondarycontactEmail.Visible = false;
        SecondarycontactMobile.Visible = false;
    }
    private void SetControlsUniversitywiseEducation(int formId)
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
                    case "HAVE YOU COMPLETED HIGH SCHOOL?":
                        highschool.Visible = true;
                        labelhighschool.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY WHERE YOU HAVE STUDIED HIGH SCHOOL":
                        highschoolCountry.Visible = true;
                        labelhighschoolCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "START DATE":
                        highschoolstartDate.Visible = true;
                        labelhighschoolstartDate.InnerHtml = setInnerHtml(fields[k]);
                        SecondarystartDate.Visible = true;
                        labelSecondarystartDate.InnerHtml = setInnerHtml(fields[k]);
                        diplomastartDate.Visible = true;
                        labeldiplomastartDate.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDate.Visible = true;
                        labelhigherstartDate.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDatePG.Visible = true;
                        labelhigherstartDatePG.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDatePhd.Visible = true;
                        labelhigherstartDatePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherstartDateOther.Visible = true;
                        labelhigherstartDateOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "END DATE":
                        highschoolendDate.Visible = true;
                        labelhighschoolendDate.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryendDate.Visible = true;
                        labelSecondaryendDate.InnerHtml = setInnerHtml(fields[k]);
                        diplomaendDate.Visible = true;
                        labeldiplomaendDate.InnerHtml = setInnerHtml(fields[k]);
                        higherendDate.Visible = true;
                        labelhigherendDate.InnerHtml = setInnerHtml(fields[k]);
                        higherendDatePG.Visible = true;
                        labelhigherendDatePG.InnerHtml = setInnerHtml(fields[k]);
                        higherendDatePhd.Visible = true;
                        labelhigherendDatePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherendDateOther.Visible = true;
                        labelhigherendDateOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF SCHOOL":
                        highschoolName.Visible = true;
                        labelhighschoolName.InnerHtml = setInnerHtml(fields[k]);
                        SecondaryName.Visible = true;
                        labelSecondaryName.InnerHtml = setInnerHtml(fields[k]);
                        diplomaName.Visible = true;
                        labeldiplomaName.InnerHtml = setInnerHtml(fields[k]);
                        higherName.Visible = true;
                        labelhigherName.InnerHtml = setInnerHtml(fields[k]);
                        higherNamePG.Visible = true;
                        labelhigherNamePG.InnerHtml = setInnerHtml(fields[k]);
                        higherNamePhd.Visible = true;
                        labelhigherNamePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherNameOther.Visible = true;
                        labelhigherNameOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF HIGH SCHOOL QUALIFICATION":
                        highschoolQualificationtype.Visible = true;
                        labelhighschoolQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "QUALIFICATION NAME":                        
                        SecondaryQualificationtype.Visible = true;
                        labelSecondaryQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        diplomaQualificationtype.Visible = true;
                        labeldiplomaQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtype.Visible = true;
                        labelhigherQualificationtype.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtypePG.Visible = true;
                        labelhigherQualificationtypePG.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtypePhd.Visible = true;
                        labelhigherQualificationtypePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherQualificationtypeOther.Visible = true;
                        labelhigherQualificationtypeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "MODE OF STUDY":
                        highschoolstudymode.Visible = true;
                        labelhighschoolstudymode.InnerHtml = setInnerHtml(fields[k]);
                        Secondarystudymode.Visible = true;
                        labelSecondarystudymode.InnerHtml = setInnerHtml(fields[k]);
                        diplomastudymode.Visible = true;
                        labeldiplomastudymode.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymode.Visible = true;
                        labelhigherstudymode.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymodePG.Visible = true;
                        labelhigherstudymodePG.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymodePhd.Visible = true;
                        labelhigherstudymodePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherstudymodeOther.Visible = true;
                        labelhigherstudymodeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LANGUAGE (MEDIUM) OF STUDY":
                        highschoollanguage.Visible = true;
                        labelhighschoollanguage.InnerHtml = setInnerHtml(fields[k]);
                        Secondarylanguage.Visible = true;
                        labelSecondarylanguage.InnerHtml = setInnerHtml(fields[k]);
                        diplomalanguage.Visible = true;
                        labeldiplomalanguage.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguage.Visible = true;
                        labelhigherlanguage.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguagePG.Visible = true;
                        labelhigherlanguagePG.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguagePhd.Visible = true;
                        labelhigherlanguagePhd.InnerHtml = setInnerHtml(fields[k]);
                        higherlanguageOther.Visible = true;
                        labelhigherlanguageOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GRADE TYPE":
                        gradetype.Visible = true;
                        labelgradetype.InnerHtml = setInnerHtml(fields[k]);
                        Secondarygradetype.Visible = true;
                        labelSecondarygradetype.InnerHtml = setInnerHtml(fields[k]);
                        diplomagradetype.Visible = true;
                        labeldiplomagradetype.InnerHtml = setInnerHtml(fields[k]);
                        highergradetype.Visible = true;
                        labelhighergradetype.InnerHtml = setInnerHtml(fields[k]);
                        highergradetypePG.Visible = true;
                        labelhighergradetypePG.InnerHtml = setInnerHtml(fields[k]);
                        highergradetypePhd.Visible = true;
                        labelhighergradetypePhd.InnerHtml = setInnerHtml(fields[k]);
                        highergradetypeOther.Visible = true;
                        labelhighergradetypeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FINAL GRADE ACHIEVED":
                        highschoolgradeachieved.Visible = true;
                        labelgradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        Secondarygradeachieved.Visible = true;
                        labelSecondarygradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        diplomagradeachieved.Visible = true;
                        labeldiplomagradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachieved.Visible = true;
                        labelhighergradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachievedPG.Visible = true;
                        labelhighergradeachievedPG.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachievedPhd.Visible = true;
                        labelhighergradeachievedPhd.InnerHtml = setInnerHtml(fields[k]);
                        highergradeachievedOther.Visible = true;
                        labelhighergradeachievedOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPECTED DATES WHEN RESULTS WILL BE DECLARED":
                        ExpectedHighSchoolDategrade.Visible = true;
                        labelExpectedHighSchoolDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedSecondaryDategrade.Visible = true;
                        labelExpectedSecondaryDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpecteddiplomaDategrade.Visible = true;
                        labelExpecteddiplomaDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedhigherDategrade.Visible = true;
                        labelExpectedhigherDategrade.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedhigherDategradePG.Visible = true;
                        labelExpectedhigherDategradePG.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedhigherDategradePhd.Visible = true;
                        labelExpectedhigherDategradePhd.InnerHtml = setInnerHtml(fields[k]);
                        ExpectedhigherDategradeOther.Visible = true;
                        labelExpectedhigherDategradeOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY THIS QUALIFICATION":
                        highschoolverify.Visible = true;
                        labelhighschoolverify.InnerHtml = setInnerHtml(fields[k]);
                        Secondaryverify.Visible = true;
                        labelSecondaryverify.InnerHtml = setInnerHtml(fields[k]);
                        diplomaverify.Visible = true;
                        labeldiplomaverify.InnerHtml = setInnerHtml(fields[k]);
                        higherverify.Visible = true;
                        labelhigherverify.InnerHtml = setInnerHtml(fields[k]);
                        higherverifyPG.Visible = true;
                        labelhigherverifyPG.InnerHtml = setInnerHtml(fields[k]);
                        higherverifyPhd.Visible = true;
                        labelhigherverifyPhd.InnerHtml = setInnerHtml(fields[k]);
                        higherverifyOther.Visible = true;
                        labelhigherverifyOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        highschoolrelation.Visible = true;
                        labelhighschoolrelation.InnerHtml = setInnerHtml(fields[k]);
                        Secondaryrelation.Visible = true;
                        labelSecondaryrelation.InnerHtml = setInnerHtml(fields[k]);
                        diplomarelation.Visible = true;
                        labeldiplomarelation.InnerHtml = setInnerHtml(fields[k]);
                        higherrelation.Visible = true;
                        labelhigherrelation.InnerHtml = setInnerHtml(fields[k]);
                        higherrelationPG.Visible = true;
                        labelhigherrelationPG.InnerHtml = setInnerHtml(fields[k]);
                        higherrelationPhd.Visible = true;
                        labelhigherrelationPhd.InnerHtml = setInnerHtml(fields[k]);
                        higherrelationOther.Visible = true;
                        labelhigherrelationOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactEmail.Visible = true;
                        labelhighschoolcontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        SecondarycontactEmail.Visible = true;
                        labelSecondarycontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        diplomacontactEmail.Visible = true;
                        labeldiplomacontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmail.Visible = true;
                        labelhighercontactEmail.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmailPG.Visible = true;
                        labelhighercontactEmailPG.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmailPhd.Visible = true;
                        labelhighercontactEmailPhd.InnerHtml = setInnerHtml(fields[k]);
                        highercontactEmailOther.Visible = true;
                        labelhighercontactEmailOther.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER OF CONTACT WHO CAN VERIFY YOUR QUALIFICATION":
                        highschoolcontactMobile.Visible = true;
                        labelhighschoolcontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        SecondarycontactMobile.Visible = true;
                        labelSecondarycontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        diplomacontactMobile.Visible = true;
                        labeldiplomacontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobile.Visible = true;
                        labelhighercontactMobile.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobilePG.Visible = true;
                        labelhighercontactMobilePG.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobilePhd.Visible = true;
                        labelhighercontactMobilePhd.InnerHtml = setInnerHtml(fields[k]);
                        highercontactMobileOther.Visible = true;
                        labelhighercontactMobileOther.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "HAVE YOU COMPLETED SENIOR SECONDARY SCHOOL (YEAR 12)?":
                        Secondary.Visible = true;
                        labelSecondary.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF SECONDARY EDUCATION":
                        SecondaryCountry.Visible = true;
                        labelSecondaryCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    //case "Add Subject and their Grades":
                    //    highshoolgrade.Visible = true;
                    //    btn10th.Value = setInnerHtml(fields[k]);
                    //    secondarygrade.Visible = true;
                    //    btn12th.Value = setInnerHtml(fields[k]);
                    //    highergrade.Visible = true;
                    //    btnhigher.Value = setInnerHtml(fields[k]);
                    //    diplomagrade.Visible = true;
                    //    btndiploma.Value = setInnerHtml(fields[k]);
                    //    break;
                    case "HAVE YOU COMPLETED A DEGREE HIGHER THAN YEAR 12?":
                        higher.Visible = true;
                        labelhigher.InnerHtml = setInnerHtml(fields[k]);
                        break;


                    case "HIGHER COURSE":
                        highercourse.Visible = true;
                        labelhighercourse.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of Higher Education":
                        higherCountry.Visible = true;
                        labelhigherCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU COMPLETED ANY DIPLOMA OR CERTIFICATE PROGRAM(S)?":
                        diploma.Visible = true;
                        labeldiploma.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF DIPLOMA OR CERTIFICATE PROGRAMS":
                        diplomaCountry.Visible = true;
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
    private void SetAdminCommentseducation(int formId)
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "Have you completed high school":
                    if (Comments[k].adminaction == 0)
                        imghighschoolNo.Visible = true;
                    else
                        imghighschoolYes.Visible = true;
                    lblhighschoolComments.Text = setComments(Comments[k]);
                    break;

                case "Country of High School":
                    if (Comments[k].adminaction == 0)
                        imghighschoolCountryNo.Visible = true;
                    else
                        imghighschoolCountryYes.Visible = true;
                    lblhighschoolCountryComments.Text = setComments(Comments[k]);
                    break;
                case "High School Start Date":
                    if (Comments[k].adminaction == 0)
                        imghighschoolstartDateNo.Visible = true;
                    else
                        imghighschoolstartDateYes.Visible = true;
                    lblhighschoolstartDateComments.Text = setComments(Comments[k]);
                    break;
                case "High School End Date":
                    if (Comments[k].adminaction == 0)
                        imghighschoolendDateNo.Visible = true;
                    else
                        imghighschoolendDateYes.Visible = true;
                    lblhighschoolendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolNameNo.Visible = true;
                    else
                        imghighschoolNameYes.Visible = true;
                    lblhighschoolNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Type(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolQualificationtypeNo.Visible = true;
                    else
                        imghighschoolQualificationtypeYes.Visible = true;
                    lblhighschoolQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolstudymodeNo.Visible = true;
                    else
                        imghighschoolstudymodeYes.Visible = true;
                    lblhighschoolstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolstudymodeNo.Visible = true;
                    else
                        imghighschoolstudymodeYes.Visible = true;
                    lblhighschoolstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imggradetypeNo.Visible = true;
                    else
                        imggradetypeYes.Visible = true;
                    lblgradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolgradeachievedNo.Visible = true;
                    else
                        imghighschoolgradeachievedYes.Visible = true;
                    lblgradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imgExpectedHighSchoolDategradeNo.Visible = true;
                    else
                        imgExpectedHighSchoolDategradeYes.Visible = true;
                    lblExpectedHighSchoolDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolverifyNo.Visible = true;
                    else
                        imghighschoolverifyYes.Visible = true;
                    lblhighschoolverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolrelationNo.Visible = true;
                    else
                        imghighschoolrelationYes.Visible = true;
                    lblhighschoolrelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolcontactEmailNo.Visible = true;
                    else
                        imghighschoolcontactEmailYes.Visible = true;
                    lblhighschoolcontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(HighSchool)":
                    if (Comments[k].adminaction == 0)
                        imghighschoolcontactMobileNo.Visible = true;
                    else
                        imghighschoolcontactMobileYes.Visible = true;
                    lblhighschoolcontactMobileComments.Text = setComments(Comments[k]);
                    break;
              
                case "Have you completed Senior Secondary school? (Year 12)":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryNo.Visible = true;
                    else
                        imgSecondaryYes.Visible = true;
                    lblSecondaryComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Secondary Education":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryCountryNo.Visible = true;
                    else
                        imgSecondaryCountryYes.Visible = true;
                    lblSecondaryCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Secondary Start Date":
                    if (Comments[k].adminaction == 0)
                        imgSecondarystartDateNo.Visible = true;
                    else
                        imgSecondarystartDateYes.Visible = true;
                    lblSecondarystartDateComments.Text = setComments(Comments[k]);
                    break;
                case "Secondary End Date":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryendDateNo.Visible = true;
                    else
                        imgSecondaryendDateYes.Visible = true;
                    lblSecondaryendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryNameNo.Visible = true;
                    else
                        imgSecondaryNameYes.Visible = true;
                    lblSecondaryNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryQualificationtypeNo.Visible = true;
                    else
                        imgSecondaryQualificationtypeYes.Visible = true;
                    lblSecondaryQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondarystudymodeNo.Visible = true;
                    else
                        imgSecondarystudymodeYes.Visible = true;
                    lblSecondarystudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondarylanguageNo.Visible = true;
                    else
                        imgSecondarylanguageYes.Visible = true;
                    lblSecondarylanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondarygradetypeNo.Visible = true;
                    else
                        imgSecondarygradetypeYes.Visible = true;
                    lblSecondarygradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondarygradeachievedNo.Visible = true;
                    else
                        imgSecondarygradeachievedYes.Visible = true;
                    lblSecondarygradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgExpectedSecondaryDategradeNo.Visible = true;
                    else
                        imgExpectedSecondaryDategradeYes.Visible = true;
                    lblExpectedSecondaryDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryverifyNo.Visible = true;
                    else
                        imgSecondaryverifyYes.Visible = true;
                    lblSecondaryverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondaryrelationNo.Visible = true;
                    else
                        imgSecondaryrelationYes.Visible = true;
                    lblSecondaryrelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondarycontactEmailNo.Visible = true;
                    else
                        imgSecondarycontactEmailYes.Visible = true;
                    lblSecondarycontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Secondary)":
                    if (Comments[k].adminaction == 0)
                        imgSecondarycontactMobileNo.Visible = true;
                    else
                        imgSecondarycontactMobileYes.Visible = true;
                    lblSecondarycontactMobileComments.Text = setComments(Comments[k]);
                    break;
              
                case "Have you completed any Diploma or Certificate Programs":
                    if (Comments[k].adminaction == 0)
                        imgdiplomaNo.Visible = true;
                    else
                        imgdiplomaYes.Visible = true;
                    lbldiplomaComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Diploma or Certificate Programs":
                    if (Comments[k].adminaction == 0)
                        imgdiplomaCountryNo.Visible = true;
                    else
                        imgdiplomaCountryYes.Visible = true;
                    lbldiplomaCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Diploma Start Date":
                    if (Comments[k].adminaction == 0)
                        imgdiplomastartDateNo.Visible = true;
                    else
                        imgdiplomastartDateYes.Visible = true;
                    lbldiplomastartDateComments.Text = setComments(Comments[k]);
                    break;
                case "Diploma End Date":
                    if (Comments[k].adminaction == 0)
                        imgdiplomaendDateNo.Visible = true;
                    else
                        imgdiplomaendDateYes.Visible = true;
                    lbldiplomaendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomaNameNo.Visible = true;
                    else
                        imgdiplomaNameYes.Visible = true;
                    lbldiplomaNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomaQualificationtypeNo.Visible = true;
                    else
                        imgdiplomaQualificationtypeYes.Visible = true;
                    lbldiplomaQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomastudymodeNo.Visible = true;
                    else
                        imgdiplomastudymodeYes.Visible = true;
                    lbldiplomastudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomalanguageNo.Visible = true;
                    else
                        imgdiplomalanguageYes.Visible = true;
                    lbldiplomalanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomagradetypeNo.Visible = true;
                    else
                        imgdiplomagradetypeYes.Visible = true;
                    lbldiplomagradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomagradeachievedNo.Visible = true;
                    else
                        imgdiplomagradeachievedYes.Visible = true;
                    lbldiplomagradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgExpecteddiplomaDategradeNo.Visible = true;
                    else
                        imgExpecteddiplomaDategradeYes.Visible = true;
                    lblExpecteddiplomaDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomaverifyNo.Visible = true;
                    else
                        imgdiplomaverifyYes.Visible = true;
                    lbldiplomaverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomarelationNo.Visible = true;
                    else
                        imgdiplomarelationYes.Visible = true;
                    lbldiplomarelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomacontactEmailNo.Visible = true;
                    else
                        imgdiplomacontactEmailYes.Visible = true;
                    lbldiplomacontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Diploma)":
                    if (Comments[k].adminaction == 0)
                        imgdiplomacontactMobileNo.Visible = true;
                    else
                        imgdiplomacontactMobileYes.Visible = true;
                    lbldiplomacontactMobileComments.Text = setComments(Comments[k]);
                    break;
               
                case "Have you completed any Higher (Under Graduate, Masters or PhD) degree":
                    if (Comments[k].adminaction == 0)
                        imghigherNo.Visible = true;
                    else
                        imghigherYes.Visible = true;
                    lblhigherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(UG)":
                    if (Comments[k].adminaction == 0)
                        imghighercourseNo.Visible = true;
                    else
                        imghighercourseYes.Visible = true;
                    lblhighercourseComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherCountryNo.Visible = true;
                    else
                        imghigherCountryYes.Visible = true;
                    lblhigherCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherstartDateNo.Visible = true;
                    else
                        imghigherstartDateYes.Visible = true;
                    lblhigherstartDateComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherendDateNo.Visible = true;
                    else
                        imghigherendDateYes.Visible = true;
                    lblhigherendDateComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherNameNo.Visible = true;
                    else
                        imghigherNameYes.Visible = true;
                    lblhigherNameComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherQualificationtypeNo.Visible = true;
                    else
                        imghigherQualificationtypeYes.Visible = true;
                    lblhigherQualificationtypeComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherstudymodeNo.Visible = true;
                    else
                        imghigherstudymodeYes.Visible = true;
                    lblhigherstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherlanguageNo.Visible = true;
                    else
                        imghigherlanguageYes.Visible = true;
                    lblhigherlanguageComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(UG)":
                    if (Comments[k].adminaction == 0)
                        imghighergradetypeNo.Visible = true;
                    else
                        imghighergradetypeYes.Visible = true;
                    lblhighergradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(UG)":
                    if (Comments[k].adminaction == 0)
                        imghighergradeachievedNo.Visible = true;
                    else
                        imghighergradeachievedYes.Visible = true;
                    lblhighergradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(UG)":
                    if (Comments[k].adminaction == 0)
                        imgExpectedhigherDategradeNo.Visible = true;
                    else
                        imgExpectedhigherDategradeYes.Visible = true;
                    lblExpectedhigherDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherverifyNo.Visible = true;
                    else
                        imghigherverifyYes.Visible = true;
                    lblhigherverifyComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(UG)":
                    if (Comments[k].adminaction == 0)
                        imghigherrelationNo.Visible = true;
                    else
                        imghigherrelationYes.Visible = true;
                    lblhigherrelationComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactEmailNo.Visible = true;
                    else
                        imghighercontactEmailYes.Visible = true;
                    lblhighercontactEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(UG)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactMobileNo.Visible = true;
                    else
                        imghighercontactMobileYes.Visible = true;
                    lblhighercontactMobileComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(PG)":
                    if (Comments[k].adminaction == 0)
                        imghighercoursePGNo.Visible = true;
                    else
                        imghighercoursePGYes.Visible = true;
                    lblhighercoursePGComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherCountryPGNo.Visible = true;
                    else
                        imghigherCountryPGYes.Visible = true;
                    lblhigherCountryPGComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherstartDatePGNo.Visible = true;
                    else
                        imghigherstartDatePGYes.Visible = true;
                    lblhigherstartDatePGComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherendDatePGNo.Visible = true;
                    else
                        imghigherendDatePGYes.Visible = true;
                    lblhigherendDatePGComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherNamePGNo.Visible = true;
                    else
                        imghigherNamePGYes.Visible = true;
                    lblhigherNamePGComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherQualificationtypePGNo.Visible = true;
                    else
                        imghigherQualificationtypePGYes.Visible = true;
                    lblhigherQualificationtypePGComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherstudymodePGNo.Visible = true;
                    else
                        imghigherstudymodePGYes.Visible = true;
                    lblhigherstudymodePGComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherlanguagePGNo.Visible = true;
                    else
                        imghigherlanguagePGYes.Visible = true;
                    lblhigherlanguagePGComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(PG)":
                    if (Comments[k].adminaction == 0)
                        imghighergradetypePGNo.Visible = true;
                    else
                        imghighergradetypePGYes.Visible = true;
                    lblhighergradetypePGComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(PG)":
                    if (Comments[k].adminaction == 0)
                        imghighergradeachievedPGNo.Visible = true;
                    else
                        imghighergradeachievedPGYes.Visible = true;
                    lblhighergradeachievedPGComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(PG)":
                    if (Comments[k].adminaction == 0)
                        imgExpectedhigherDategradePGNo.Visible = true;
                    else
                        imgExpectedhigherDategradePGYes.Visible = true;
                    lblExpectedhigherDategradePGComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(PG)":
                    lblhigherverifyPGComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        imghigherverifyPGNo.Visible = true;
                    else
                        imghigherverifyPGYes.Visible = true;
                    break;
                case "Relationship with the Contact(PG)":
                    if (Comments[k].adminaction == 0)
                        imghigherrelationPGNo.Visible = true;
                    else
                        imghigherrelationPGYes.Visible = true;
                    lblhigherrelationPGComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(PG)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactEmailPGNo.Visible = true;
                    else
                        imghighercontactEmailPGYes.Visible = true;
                    lblhighercontactEmailPGComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(PG)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactMobilePGNo.Visible = true;
                    else
                        imghighercontactMobilePGYes.Visible = true;
                    lblhighercontactMobilePGComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghighercoursePhdNo.Visible = true;
                    else
                        imghighercoursePhdYes.Visible = true;
                    lblhighercoursePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherCountryPhdNo.Visible = true;
                    else
                        imghigherCountryPhdYes.Visible = true;
                    lblhigherCountryPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherstartDatePhdNo.Visible = true;
                    else
                        imghigherstartDatePhdYes.Visible = true;
                    lblhigherstartDatePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherendDatePhdNo.Visible = true;
                    else
                        imghigherendDatePhdYes.Visible = true;
                    lblhigherendDatePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherNamePhdNo.Visible = true;
                    else
                        imghigherNamePhdYes.Visible = true;
                    lblhigherNamePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherQualificationtypePhdNo.Visible = true;
                    else
                        imghigherQualificationtypePhdYes.Visible = true;
                    lblhigherQualificationtypePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherstudymodePhdNo.Visible = true;
                    else
                        imghigherstudymodePhdYes.Visible = true;
                    lblhigherstudymodePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherlanguagePhdNo.Visible = true;
                    else
                        imghigherlanguagePhdYes.Visible = true;
                    lblhigherlanguagePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghighergradetypePhdNo.Visible = true;
                    else
                        imghighergradetypePhdYes.Visible = true;
                    lblhighergradetypePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghighergradeachievedPhdNo.Visible = true;
                    else
                        imghighergradeachievedPhdYes.Visible = true;
                    lblhighergradeachievedPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Phd)":
                    if (Comments[k].adminaction == 0)
                        imgExpectedhigherDategradePhdNo.Visible = true;
                    else
                        imgExpectedhigherDategradePhdYes.Visible = true;
                    lblExpectedhigherDategradePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherverifyPhdNo.Visible = true;
                    else
                        imghigherverifyPhdYes.Visible = true;
                    lblhigherverifyPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghigherrelationPhdNo.Visible = true;
                    else
                        imghigherrelationPhdYes.Visible = true;
                    lblhigherrelationPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactEmailPhdNo.Visible = true;
                    else
                        imghighercontactEmailPhdYes.Visible = true;
                    lblhighercontactEmailPhdComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Phd)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactMobilePhdNo.Visible = true;
                    else
                        imghighercontactMobilePhdYes.Visible = true;
                    lblhighercontactMobilePhdComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Course(Other)":
                    if (Comments[k].adminaction == 0)
                        highercourseOtherNo.Visible = true;
                    else
                        highercourseOtherYes.Visible = true;
                    lblhighercourseOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Country of Higher Education(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherCountryOtherNo.Visible = true;
                    else
                        imghigherCountryOtherYes.Visible = true;
                    lblhigherCountryOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher Start Date(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherstartDateOtherNo.Visible = true;
                    else
                        imghigherstartDateOtherYes.Visible = true;
                    lblhigherstartDateOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Higher End Date(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherendDateOtherNo.Visible = true;
                    else
                        imghigherendDateOtherYes.Visible = true;
                    lblhigherendDateOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Name of School(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherNameOtherNo.Visible = true;
                    else
                        imghigherNameOtherYes.Visible = true;
                    lblhigherNameOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Qualification Name(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherQualificationtypeOtherNo.Visible = true;
                    else
                        imghigherQualificationtypeOtherYes.Visible = true;
                    lblhigherQualificationtypeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Mode of study(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherstudymodeOtherNo.Visible = true;
                    else
                        imghigherstudymodeOtherYes.Visible = true;
                    lblhigherstudymodeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Language (Medium) of Study(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherlanguageOtherNo.Visible = true;
                    else
                        imghigherlanguageOtherYes.Visible = true;
                    lblhigherlanguageOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Grade Type(Other)":
                    if (Comments[k].adminaction == 0)
                        imghighergradetypeOtherNo.Visible = true;
                    else
                        imghighergradetypeOtherYes.Visible = true;
                    lblhighergradetypeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Final Grade Achieved(Other)":
                    if (Comments[k].adminaction == 0)
                        imghighergradeachievedOtherNo.Visible = true;
                    else
                        imghighergradeachievedOtherYes.Visible = true;
                    lblhighergradeachievedOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Expected dates when results will be declared(Other)":
                    if (Comments[k].adminaction == 0)
                        imgExpectedhigherDategradeOtherNo.Visible = true;
                    else
                        imgExpectedhigherDategradeOtherYes.Visible = true;
                    lblExpectedhigherDategradeOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Contact who can verify this qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherverifyOtherNo.Visible = true;
                    else
                        imghigherverifyOtherYes.Visible = true;
                    lblhigherverifyOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with the Contact(Other)":
                    if (Comments[k].adminaction == 0)
                        imghigherrelationOtherNo.Visible = true;
                    else
                        imghigherrelationOtherYes.Visible = true;
                    lblhigherrelationOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Email ID of Contact who can verify your qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactEmailOtherNo.Visible = true;
                    else
                        imghighercontactEmailOtherYes.Visible = true;

                    lblhighercontactEmailOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of Contact who can verify your qualification(Other)":
                    if (Comments[k].adminaction == 0)
                        imghighercontactMobileOtherNo.Visible = true;
                    else
                        imghighercontactMobileOtherYes.Visible = true;

                    lblhighercontactMobileOtherComments.Text = setComments(Comments[k]);
                    break;
                case "Have you studied IN before?":
                    if (Comments[k].adminaction == 0)
                        studiedNo.Visible = true;
                    else
                        studiedYes.Visible = true;

                    txtstudiedbefore.Text = setComments(Comments[k]);
                    break;
                case "Do You have an Australian  Unique Student Identifier (USI) Number?":
                    if (Comments[k].adminaction == 0)
                        USINumberNo.Visible = true;
                    else
                        USINumberYes.Visible = true;

                    txtHaveUSINo.Text = setComments(Comments[k]);
                    break;
                case "Enter Your Australian Unique Student Identifier (USI) Number Here":
                    if (Comments[k].adminaction == 0)
                        USINoNo.Visible = true;
                    else
                        USINoYes.Visible = true;

                    txtUSINumber.Text = setComments(Comments[k]);
                    break;
                case "Have you STUDIED at nameofinstitue before?":
                    if (Comments[k].adminaction == 0)
                        studiedininstitutionNo.Visible = true;
                    else
                        studiedininstitutionYes.Visible = true;

                    txthaveyoustudiedininstitution.Text = setComments(Comments[k]);
                    break;
                case "Enter Your Student Number/ Student ID":
                    if (Comments[k].adminaction == 0)
                        studentIDNO.Visible = true;
                    else
                        studentIDYes.Visible = true;

                    txtstudentID.Text = setComments(Comments[k]);
                    break;
                default:
                    break;

            }
           
        }
    }
    private void PopulateSupervisorCommentsEducation(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtEducation.Text = comments[0].comments;
            
        }
    }

    private void SetControlsUniversitywiseLanguage(int formId)
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
                    case "WHICH LANGUAGE DO YOU SPEAK AT HOME?":
                        homelanguage.Visible = true;
                        labelhomelanguage.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU STUDIED AN ELICOS COURSE?":
                        EnglishBackground.Visible = true;
                        labelEnglishBackground.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE":
                        Language.Visible = true;
                        labelLanguage.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "YEAR OF COMPLETION/EXPECTED":
                        YearCompletion.Visible = true;
                        labelYearCompletion.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF COLLEGE OR UNIVERSITY":
                        NameCollege.Visible = true;
                        labelNameCollege.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "QUALIFICATION TYPE":
                        QualificationType.Visible = true;
                        labelQualificationType.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Name of Qualification":
                        QualificationName.Visible = true;
                        labelQualificationName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MODE OF STUDY":
                        studymode.Visible = true;
                        labelstudymode.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GRADE TYPE":
                        gradetype.Visible = true;
                        labelgradetype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FINAL GRADE ACHIEVED":
                        gradeachieved.Visible = true;
                        labelgradeachieved.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                        ExpectedDategrade.Visible = true;
                        labelExpectedDategrade.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HAVE YOU TAKEN ANY ENGLISH LANGUAGE TEST?":
                        isgiventest_yes_or_no.Visible = true;
                        EnglishTest.Visible = true;
                        lbl_isgiventest_yes_or_no.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CEFR LEVEL":
                        CEFR.Visible = true;
                        labelCEFR.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST REPORT REFERENCE NUMBER":
                        testRefno.Visible = true;
                        labeltestRefno.InnerHtml = setInnerHtml(fields[k]);
                        break;


                    //IELTS
                    case "TEST NAME":
                        testName.Visible = true;
                        labeltestName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE NUMBER":
                        CandidateNo.Visible = true;
                        labelCandidateNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CANDIDATE ID":
                        CandidateID.Visible = true;
                        labelCandidateID.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CENTER NUMBER":
                        CentreNo.Visible = true;
                        labelCentreNo.InnerHtml = setInnerHtml(fields[k]);
                        labelptetestcenterNo.InnerHtml = setInnerHtml(fields[k]);
                        labeltofelcenterNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST DATE":
                        ieltsTestDate.Visible = true;
                        labelieltsTestDate.InnerHtml = setInnerHtml(fields[k]);                        
                        labelpteTestDate.InnerHtml = setInnerHtml(fields[k]);
                        labeltofelTestDate.InnerHtml = setInnerHtml(fields[k]);

                        break;
                    case "SPEAKING SCORE":
                        SpeakingScore.Visible = true;
                        labelSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LISTENING SCORE":
                        ListeningScore.Visible = true;
                        labelListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "READING SCORE":
                        ReadingScore.Visible = true;
                        labelReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WRITING SCORE":
                        WritingScore.Visible = true;
                        labelWritingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TOTAL SCORE":
                        LanguageScore.Visible = true;
                      labelLanguageScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    //PTE

                    case "COMMUNICATIVE SKILLS READING":
                        pteReadingScore.Visible = true;
                        labelpteReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS LISTENING":
                        pteListeningScore.Visible = true;
                        labelpteListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS SPEAKING":
                        pteSpeakingScore.Visible = true;
                        labelpteSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COMMUNICATIVE SKILLS WRITING":
                        pteWritingScore.Visible = true;
                        labelpteWritingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PTE TOTAL SCORE":
                        pteTotalScore.Visible = true;
                        labelpteTotalScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TEST TAKER ID":
                        ptetesttaker.Visible = true;
                        labelptetesttaker.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PTE REGISTRATION NUMBER":
                        pteregistrationno.Visible = true;                        
                        break;
                    case "PTE CENTER COUNTRY":
                        ptecentercountry.Visible = true;                        
                        break;
                    case "PTE CENTER NUMBER":
                        ptetestcenterNo.Visible = true;
                        //labelptetestcenterNo.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PTE TEST DATE":
                        pteTestDate.Visible = true;
                        //labelpteTestDate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    //TOFEL
                    case "Reading iBT Scaled Score":
                        tofelReadingScore.Visible = true;
                        labeltofelReadingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Listening iBT Scaled Score":
                        tofelListeningScore.Visible = true;
                        labeltofelListeningScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Speaking iBT Scaled Score":
                        tofelSpeakingScore.Visible = true;
                        labeltofelSpeakingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Writing iBT Scaled Score":
                        tofelWritingScore.Visible = true;
                        labeltofelWritingScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Total Score (iBT Scaled Score)":
                        tofelTotalScore.Visible = true;
                        labeltofelTotalScore.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "TOFEL REGISTRATION NUMBER":
                        tofelregistrationno.Visible = true;
                        break;
                    case "TOFEL CENTER NUMBER":
                        tofelcenterNo.Visible = true;                        
                        break;
                    case "TOFEL CENTER COUNTRY":
                        tofelcentercountry.Visible = true;
                        break;
                    case "TOFEL TEST DATE":
                        tofelTestDate.Visible = true;
                        break;
                    case "TEST CENTER COUNTRY":
                        tofelcentercountry.Visible = true;
                        labeltofelcentercountry.InnerHtml = setInnerHtml(fields[k]);
                        labelptecentercountry.InnerHtml = setInnerHtml(fields[k]);
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
                    lblEnglishBackground.Text = "Yes";
                else if (LanguageInfo.isenglishintesive == 2)
                    lblEnglishBackground.Text = "No, I am currently studying an ELICOS course";
                else if (LanguageInfo.isenglishintesive == 3)
                {
                    lblEnglishBackground.Text = "No, I am not studying / have not studied an ELICOS course";
                    //hide fields on NO                    
                    Language.Visible = false;
                    YearCompletion.Visible = false;
                    NameCollege.Visible = false;
                    studymode.Visible = false;
                    QualificationType.Visible = false;
                    QualificationName.Visible = false;
                    Langgradetype.Visible = false;
                    gradeachieved.Visible = false;
                    ExpectedDategrade.Visible = false;
                }
                if (LanguageInfo.isenglishintesive != 3)
                {
                    if (LanguageInfo.countryofcourse != null)
                        lblLanguage.Text = objCom.GetCountryDiscription(Convert.ToInt32(LanguageInfo.countryofcourse));


                    if (LanguageInfo.studymode != null)
                    {
                        lblstudymode.Text = objCom.GetStudyMode(Convert.ToInt32(LanguageInfo.studymode));
                    }
                    if (LanguageInfo.gradetype != null)
                    {
                        lblLanggradetype.Text = objCom.GetGrade(Convert.ToInt32(LanguageInfo.gradetype));
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
                        lblLanggradeachieved.Text = "Results Declared";
                    else if (LanguageInfo.isfinalgradeachieved == 2)
                        lblLanggradeachieved.Text = "Examination not conducted yet";
                    else if (LanguageInfo.isfinalgradeachieved == 3)
                        lblLanggradeachieved.Text = "Examination Conducted, but Result not declared";
                }

                if (LanguageInfo.isgiventest_yes_or_no == 1)
                {
                    lblisgiventest_yes_or_no.Text = "Yes";
                    if (LanguageInfo.giveenglishtest == 1)
                    {
                        Ilet.Visible = true;
                        lblEnglishTest.Text = "IELTS";
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
                        PTE.Visible = true;
                        lblEnglishTest.Text = "PTE";
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
                        Tofel.Visible = true;
                        lblEnglishTest.Text = "TOEFL iBT";
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

                    testRefno.Visible = false;
                    CEFR.Visible = false;
                }
                else if (LanguageInfo.isgiventest_yes_or_no == 0)
                {
                    EnglishTest.Visible = false;
                    Ilet.Visible = false;
                    PTE.Visible = false;
                    Tofel.Visible = false;

                    lblisgiventest_yes_or_no.Text = "No";
                    lbltestRefno.Text = LanguageInfo.testreportreferenceno;
                    if (LanguageInfo.cefrlevel != null)
                    {
                        lblCEFR.Text = objCom.GetCEFR(Convert.ToInt32(LanguageInfo.cefrlevel));
                    }
                }                    
            }
        }

        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }   
    private void SetAdminCommentsLanguage(int formId)
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "WHICH LANGUAGE DO YOU SPEAK AT HOME?":
                    if (Comments[k].adminaction == 0)
                        imghomelanguageNo.Visible = true;
                    else
                        imghomelanguageYes.Visible = true;
                    lblhomelanguageComments.Text = setComments(Comments[k]);
                    break;
                case "HAVE YOU STUDIED AN ELICOS COURSE?":
                    if (Comments[k].adminaction == 0)
                        imgEnglishBackgroundNo.Visible = true;
                    else
                        imgEnglishBackgroundYes.Visible = true;
                    lblEnglishBackgroundComments.Text = setComments(Comments[k]);
                    break;
                case "COUNTRY OF ENGLISH LANGUAGE INTENSIVE COURSE":
                    if (Comments[k].adminaction == 0)
                        imgLanguageNo.Visible = true;
                    else
                        imgLanguageYes.Visible = true;
                    lblLanguageComments.Text = setComments(Comments[k]);
                    break;
                case "YEAR OF COMPLETION/EXPECTED":
                    if (Comments[k].adminaction == 0)
                        imgYearCompletionNo.Visible = true;
                    else
                        imgYearCompletionYes.Visible = true;
                    lblYearCompletionComments.Text = setComments(Comments[k]);
                    break;
                case "NAME OF COLLEGE OR UNIVERSITY":
                    if (Comments[k].adminaction == 0)
                        imgNameCollegeYes.Visible = true;
                    else
                        imgNameCollegeNo.Visible = true;
                    lblNameCollegeComments.Text = setComments(Comments[k]);
                    break;
                case "MODE OF STUDY":
                    if (Comments[k].adminaction == 0)
                        imgstudymodeNo.Visible = true;
                    else
                        imgstudymodeYes.Visible = true;
                    lblstudymodeComments.Text = setComments(Comments[k]);
                    break;
                case "QUALIFICATION TYPE":
                    if (Comments[k].adminaction == 0)
                        imgQualificationTypeNo.Visible = true;
                    else
                        imgQualificationTypeYes.Visible = true;
                    lblQualificationTypeComments.Text = setComments(Comments[k]);
                    break;
                case "Name of Qualification":
                    if (Comments[k].adminaction == 0)
                        imgQualificationNameNo.Visible = true;
                    else
                        imgQualificationNameYes.Visible = true;
                    lblQualificationNameComments.Text = setComments(Comments[k]);
                    break;
                case "GRADE TYPE":
                    if (Comments[k].adminaction == 0)
                        imgLanggradetypeNo.Visible = true;
                    else
                        imgLanggradetypeYes.Visible = true;
                    lblLanggradetypeComments.Text = setComments(Comments[k]);
                    break;
                case "FINAL GRADE ACHIEVED":
                    if (Comments[k].adminaction == 0)
                        imggradeachievedNo.Visible = true;
                    else
                        imggradeachievedYes.Visible = true;
                    lblLanggradeachievedComments.Text = setComments(Comments[k]);
                    break;
                case "EXPECTED DATE WHEN RESULTS WILL BE DECLARED":
                    if (Comments[k].adminaction == 0)
                        imgExpectedDategradeNo.Visible = true;
                    else
                        imgExpectedDategradeYes.Visible = true;
                    lblExpectedDategradeComments.Text = setComments(Comments[k]);
                    break;
                case "HAVE YOU TAKEN ANY ENGLISH LANGUAGE TEST?":
                    if (Comments[k].adminaction == 0)
                    {
                        imgEnglishTestNo.Visible = true;
                        isgiventest_no.Visible = true;
                    }
                    else
                    {
                        imgEnglishTestYes.Visible = true;
                        isgiventest_yes.Visible = true;
                    }
                    lblisgiventest_yes_or_noComment.Text = setComments(Comments[k]);
                    lblEnglishTestComments.Text = setComments(Comments[k]);
                    break;
                case "TEST NAME":
                    if (Comments[k].adminaction == 0)
                        imgtestNameNo.Visible = true;
                    else
                        imgtestNameYes.Visible = true;
                    lbltestNameComments.Text = setComments(Comments[k]);
                    break;
                case "CENTER NUMBER":
                    if (Comments[k].adminaction == 0)
                        imgCentreNoNo.Visible = true;
                    else
                        imgCentreNoYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgptetestcenterNoNo.Visible = true;
                    else
                        imgptetestcenterNoYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelcenterNoNo.Visible = true;
                    else
                        imgtofelcenterNoYes.Visible = true;
                    lblCentreNoComments.Text = setComments(Comments[k]);
                    lblptetestcenterNoComments.Text = setComments(Comments[k]);
                    lbltofelcenterNoComments.Text = setComments(Comments[k]);
                    break;
                case "CANDIDATE NUMBER":
                    if (Comments[k].adminaction == 0)
                        imgCandidateNoNo.Visible = true;
                    else
                        imgCandidateNoYes.Visible = true;
                    lblCandidateNoComments.Text = setComments(Comments[k]);
                    break;
                case "CANDIDATE ID":
                    if (Comments[k].adminaction == 0)
                        imgCandidateIDNo.Visible = true;
                    else
                        imgCandidateIDYes.Visible = true;
                    lblCandidateIDComments.Text = setComments(Comments[k]);
                    break;
                case "TEST DATE":
                    if (Comments[k].adminaction == 0)
                        imgieltsTestDateNo.Visible = true;
                    else
                        imgieltsTestDateYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgpteTestDateNo.Visible = true;
                    else
                        imgpteTestDateYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelTestDateNo.Visible = true;
                    else
                        imgtofelTestDateYes.Visible = true;
                    lblieltsTestDateComments.Text = setComments(Comments[k]);
                    lblpteTestDateComments.Text = setComments(Comments[k]);
                    lbltofelTestDateComments.Text = setComments(Comments[k]);
                    break;
                case "TOTAL SCORE":
                    if (Comments[k].adminaction == 0)
                        imgLanguageScoreNo.Visible = true;
                    else
                        imgLanguageScoreYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgpteTotalScoreNo.Visible = true;
                    else
                        imgpteTotalScoreYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelTotalScoreNo.Visible = true;
                    else
                        imgtofelTotalScoreYes.Visible = true;
                    lblLanguageScoreComments.Text = setComments(Comments[k]);
                    lblpteTotalScoreComments.Text = setComments(Comments[k]);
                    lbltofelTotalScoreComments.Text = setComments(Comments[k]);
                    break;
                case "SPEAKING SCORE":
                    if (Comments[k].adminaction == 0)
                        imgSpeakingScoreIletNo.Visible = true;
                    else
                        imgSpeakingScoreIletYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgpteSpeakingScoreNo.Visible = true;
                    else
                        imgpteSpeakingScoreYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelSpeakingScoreNo.Visible = true;
                    else
                        imgtofelSpeakingScoreYes.Visible = true;
                    lblSpeakingScoreComments.Text = setComments(Comments[k]);
                    lblpteSpeakingScoreComments.Text = setComments(Comments[k]);
                    lbltofelSpeakingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "LISTENING SCORE":
                    if (Comments[k].adminaction == 0)
                        imgListeningScoreIletNo.Visible = true;
                    else
                        imgListeningScoreIletYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgpteListeningScoreNo.Visible = true;
                    else
                        imgpteListeningScoreYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelListeningScoreNo.Visible = true;
                    else
                        imgtofelListeningScoreYes.Visible = true;
                    lblListeningScoreComments.Text = setComments(Comments[k]);
                    lblpteListeningScoreComments.Text = setComments(Comments[k]);
                    lbltofelListeningScoreComments.Text = setComments(Comments[k]);
                    break;
                case "READING SCORE":
                    if (Comments[k].adminaction == 0)
                        imgReadingScoreIeltNo.Visible = true;
                    else
                        imgReadingScoreIeltYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgpteReadingScoreNo.Visible = true;
                    else
                        imgpteReadingScoreYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelReadingScoreNo.Visible = true;
                    else
                        imgtofelReadingScoreYes.Visible = true;
                    lblReadingScoreComments.Text = setComments(Comments[k]);
                    lblpteReadingScoreComments.Text = setComments(Comments[k]);
                    lbltofelReadingScoreComments.Text = setComments(Comments[k]);
                    break;
                case "WRITING SCORE":
                    if (Comments[k].adminaction == 0)
                        imgWritingScoreIletNo.Visible = true;
                    else
                        imgWritingScoreIletYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgpteWritingScoreNo.Visible = true;
                    else
                        imgpteWritingScoreYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelWritingScoreNo.Visible = true;
                    else
                        imgtofelWritingScoreYes.Visible = true;
                    lblWritingScoreComments.Text = setComments(Comments[k]);
                    lblpteWritingScoreComments.Text = setComments(Comments[k]);
                    lbltofelWritingScoreComments.Text = setComments(Comments[k]);
                    break;

                case "REGISTRATION NUMBER":
                    if (Comments[k].adminaction == 0)
                        imgpteregistrationnoNo.Visible = true;
                    else
                        imgpteregistrationnoYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelregistrationnoNo.Visible = true;
                    else
                        imgtofelregistrationnoYes.Visible = true;
                    lblpteregistrationnoComments.Text = setComments(Comments[k]);
                    lbltofelregistrationnoComments.Text = setComments(Comments[k]);
                    break;
                case "TEST CENTER COUNTRY":
                    if (Comments[k].adminaction == 0)
                        imgptecentercountryNo.Visible = true;
                    else
                        imgptecentercountryYes.Visible = true;
                    if (Comments[k].adminaction == 0)
                        imgtofelcentercountryNo.Visible = true;
                    else
                        imgtofelcentercountryYes.Visible = true;
                    lblptecentercountryComments.Text = setComments(Comments[k]);
                    lbltofelcentercountryComments.Text = setComments(Comments[k]);
                    break;
                case "Test Taker ID":
                    lblptetesttakerComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        imgptetesttakerNo.Visible = true;
                    else
                        imgptetesttakerYes.Visible = true;
                    break;
                case "CEFR LEVEL":
                    lblCEFRComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        imgCEFRNo.Visible = true;
                    else
                        imgCEFRYes.Visible = true;
                    break;
                case "TEST REPORT REFERENCE NUMBER":
                    lbltestRefnoComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        imgtestRefnoNo.Visible = true;
                    else
                        imgtestRefnoYes.Visible = true;
                    break;
                default:
                    break;

            }
            
        }
    }
    private void PopulateSupervisorCommentsLanguage(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtLanguage.Text = comments[0].comments;
           
        }
    }

    private void SetControlsUniversitywiseEmployment(int formId)
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
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        employmentInfo = setInnerHtml(fields[k]);
                        break;
                    case "WEBSITE":
                        employerwebsite = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF EMPLOYER ORGANISATION":
                        employer = setInnerHtml(fields[k]);
                        break;

                    case "CITY OF EMPLOYER’S LOCATION":
                        employercity = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF EMPLOYER’S LOCATION":
                        employercountry = setInnerHtml(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        position = setInnerHtml(fields[k]);
                        break;
                    case "START DATE OF EMPLOYMENT":
                        startdate = setInnerHtml(fields[k]);
                        break;
                    case "END DATE OF EMPLOYMENT":
                        enddate = setInnerHtml(fields[k]);
                        break;
                    case "BRIEF JOB DESCRIPTION":
                        BriefDescription = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverification = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationship = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        emailEmployment = setInnerHtml(fields[k]);
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedin = setInnerHtml(fields[k]);
                        break;
                    //case "HOW MANY YEARS OF WORK EXPERIENCE DO YOU WISH TO RECORD?":                        
                    //    yearsOfexp = setInnerHtml(fields[k]);
                    //    break;
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
    private void PopulateSupervisorCommentsEmployment(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
           txtEmp.Text = comments[0].comments;
           
        }
    }

    private void SetControlsUniversitywiseRef(int formId)
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
                    case "NAME":
                        Name = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        RefrenceMobile = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL":
                        RefrenceEmail = setInnerHtml(fields[k]);
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
    private void PopulateSupervisorCommentsRef(int formId)
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtRef.Text = comments[0].comments;
          
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
        else if (EducationInfo.highschoolgradedeclared == 3)
            lblgradeachieved.Text = "Examination Conducted, but Result not declared";
        if (EducationInfo.highschoolgradedeclared == 1 || EducationInfo.highschoolgradedeclared == 2)
            ExpectedHighSchoolDategrade.Visible = false;

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

        lblSecondaryName.Text = EducationInfo.secondaryname;
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
        else if (EducationInfo.secondarygradedeclared == 3)
            lblSecondarygradeachieved.Text = "Examination Conducted, but Result not declared";
        if (EducationInfo.secondarygradedeclared == 1 || EducationInfo.secondarygradedeclared == 2)
            ExpectedSecondaryDategrade.Visible = false;
        lblSecondaryverify.Text = EducationInfo.secondaryverificationname;
        if (EducationInfo.secondaryverificationrelationship != null)
        {
            lblSecondaryrelation.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo.secondaryverificationrelationship));
        }


        lblSecondarycontactEmail.Text = EducationInfo.secondaryverificationemail;
        lblSecondarycontactMobile.Text = EducationInfo.secondaryverificationmobile;
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

        lbldiplomaName.Text = EducationInfo.diplomaschoolname;

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
        else if (EducationInfo.diplomagradeachieved == 3)
            lbldiplomagradeachieved.Text = "Examination Conducted, but Result not declared";

        if (EducationInfo.diplomagradeachieved == 1 || EducationInfo.diplomagradeachieved == 2)
            ExpecteddiplomaDategrade.Visible = true;

        if (EducationInfo.diplomaresultdate != null)
            lblExpecteddiplomaDategrade.Text = Convert.ToDateTime(EducationInfo.diplomaresultdate).ToString("yyyy-MM-dd");
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

                lblhigherNamePG.Text = EducationInfo[k].schoolname;

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
                else if (EducationInfo[k].finalgradeacheived == 3)
                    lblhighergradeachievedPG.Text = "Examination Conducted, but Result not declared";

                if (EducationInfo[k].finalgradeacheived == 1 || EducationInfo[k].finalgradeacheived == 2)
                    labelExpectedhigherDategradePG.Visible = false;
                if (EducationInfo[k].resultdate != null)
                    lblExpectedhigherDategradePG.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
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

                lblhigherNamePhd.Text = EducationInfo[k].schoolname;

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
                else if (EducationInfo[k].finalgradeacheived == 9)
                    lblhighergradeachievedPhd.Text = "Examination Conducted, but Result not declared";

                if (EducationInfo[k].finalgradeacheived == 1 || EducationInfo[k].finalgradeacheived == 2)
                    ExpectedhigherDategradePhd.Visible = false;

                if (EducationInfo[k].resultdate != null)
                    lblExpectedhigherDategradePhd.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
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
                    lblhigherstartDate.Text = EducationInfo[k].startdate;
                }
                if (EducationInfo[k].endate != null)
                {

                    lblhigherendDate.Text = EducationInfo[k].endate;
                }

                lblhigherName.Text = EducationInfo[k].schoolname;

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
                else if (EducationInfo[k].finalgradeacheived == 3)
                    lblhighergradeachieved.Text = "Examination Conducted, but Result not declared";


                if (EducationInfo[k].resultdate != null)
                    lblExpectedhigherDategrade.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
                lblhigherverify.Text = EducationInfo[k].verificationname;
                if (EducationInfo[k].relationshipwithverification != null)
                {
                    lblhigherrelation.Text = objCom.GetVerificationRelation(Convert.ToInt32(EducationInfo[k].relationshipwithverification));
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

                lblhigherNameOther.Text = EducationInfo[k].schoolname;

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
                else if (EducationInfo[k].finalgradeacheived == 3)
                    lblhighergradeachievedOther.Text = "Examination Conducted, but Result not declared";

                if (EducationInfo[k].finalgradeacheived == 1 || EducationInfo[k].finalgradeacheived == 2)
                    labelExpectedhigherDategradeOther.Visible = false;

                if (EducationInfo[k].resultdate != null)
                    lblExpectedhigherDategradeOther.Text = Convert.ToDateTime(EducationInfo[k].resultdate).ToString("yyyy-MM-dd");
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
}