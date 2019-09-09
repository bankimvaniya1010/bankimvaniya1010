using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorpersonaldetails : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();


    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
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
            objCom.AddCustomControlForSupervisor(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);

            PopulatePersonalInfo();
            SetControlsUniversitywise();
            SetAdminComments();
            PopulateSupervisorComments();
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
                if (profileInfo.higheststudycompleted != null)
                {
                    lblhigheststudy.Text = objCom.GetHighestDegree(Convert.ToInt32(profileInfo.higheststudycompleted));
                }
                String Nationality = "";
                if (profileInfo.nationality != null)
                {
                    Nationality = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.nationality));
                    lblNationality.Text = Nationality;
                }
                if (profileInfo.nationality != null)
                {
                    string appendText = "";
                    if (profileInfo.hasdualcitizenship.HasValue && profileInfo.hasdualcitizenship.Value)
                    {
                        appendText = "_True";
                        lblDualNationality.Text = "Yes";
                        dualNationality.Visible = true;
                        dualNationality.Style.Remove("display");
                    }
                    else
                    {
                        appendText = "_False";
                        if (profileInfo.hasdualcitizenship.HasValue)
                            lblDualNationality.Text = "NO";
                    }

                    if (Nationality.ToUpper() == GlobalVariables.GetChinaCountryName)
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
                    else if (Nationality.ToUpper() == GlobalVariables.GetRussiaCountryName)
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
                    dualNationality.Style.Remove("display");
                    secondNation.Style.Remove("display");
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
    private void SetControlsUniversitywise()
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
                        title.Attributes.Add("style", "display:block;");
                        labeltitle.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FIRST NAME":
                        firstname.Attributes.Add("style", "display:block;");
                        passportsameasFirstName.Attributes.Add("style", "display:block;");
                        labelfirstname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LAST NAME":
                        lastname.Attributes.Add("style", "display:block;");
                        passportsameasLastName.Attributes.Add("style", "display:block;");
                        labellastname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PREFERRED NAME":
                        preferedname.Attributes.Add("style", "display:block;");
                        labelpreferreName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "OTHER MIDDLE NAMES":
                        middlename.Attributes.Add("style", "display:block;");
                        passportsameasmiddlename.Attributes.Add("style", "display:block;");
                        labelmiddlename.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DATE OF BIRTH":
                        dob.Attributes.Add("style", "display:block;");
                        labeldob.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GENDER":
                        gender.Attributes.Add("style", "display:block;");
                        labelgender.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NATIONALITY AND CITIZENSHIP":
                        nationality.Attributes.Add("style", "display:block;");
                        labelNationality.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF BIRTH":
                        birthcountry.Attributes.Add("style", "display:block;");
                        labelbirthcountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MARITAL STATUS":
                        marital.Attributes.Add("style", "display:block;");
                        labelMarital.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DO YOU HAVE ANY DISABILITY, IMPAIRMENT, OR A LONG TERM CONDITION":
                        disability.Attributes.Add("style", "display:block;");
                        labeldisability.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DISABILITY DESCRIPTION":
                        disabilitydesc.Attributes.Add("style", "display:block;");
                        labeldisabilitydesc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ARE YOU REFERRED BY AGENT":
                        agent.Attributes.Add("style", "display:block;");
                        labelagent.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "AGENT NAME":
                        agentList.Attributes.Add("style", "display:block;");
                        labelagentList.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Highest study level successfully completed":
                        higheststudy.Attributes.Add("style", "display:block;");
                        labelhigheststudy.InnerHtml = setInnerHtml(fields[k]);
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
    private void SetAdminComments()
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "Title":
                    if (Comments[k].adminaction == 0)
                        rblTitleNo.Checked = true;
                    else
                        rblTitleYes.Checked = true;
                    lblTitleComments.Text = setComments(Comments[k]);
                    break;
                case "First Name":
                    if (Comments[k].adminaction == 0)
                        rblFirstNameNo.Checked = true;
                    else
                        rblFirstNameYes.Checked = true;
                    lblFirstNameComments.Text = setComments(Comments[k]);
                    break;
                case "Passport First Name same as Above":
                    lblpassportsameasFirstNameComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblpassportsameasFirstNameNo.Checked = true;
                    else
                        rblpassportsameasFirstNameYes.Checked = true;
                    break;
                case "Last Name":
                    lblLastNameComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblLastNameNo.Checked = true;
                    else
                        rblLastNameYes.Checked = true;
                    break;
                case "Passport Last Name same as Above":
                    lblpassportsameasLastNameComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblpassportsameasLastNameNo.Checked = true;
                    else
                        rblpassportsameasLastNameYes.Checked = true;
                    break;
                case "Preferred Name":
                    lblPrefferedNameComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblPrefferedNameNo.Checked = true;
                    else
                        rblPrefferedNameYes.Checked = true;
                    break;
                case "Other middle names":
                    lblMiddleNameComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblMiddleNameNo.Checked = true;
                    else
                        rblMiddleNameYes.Checked = true;
                    break;
                case "Passport Middle Name same as Above":
                    lblpassportsameasmiddlenameComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblpassportsameasmiddlenameNo.Checked = true;
                    else
                        rblpassportsameasmiddlenameYes.Checked = true;
                    break;
                case "Date of birth":
                    if (Comments[k].adminaction == 0)
                        rblDOBNo.Checked = true;
                    else
                        rblDOBYes.Checked = true;
                    lblDOBComments.Text = setComments(Comments[k]);
                    break;
                case "Gender":
                    if (Comments[k].adminaction == 0)
                        rblGenderNo.Checked = true;
                    else
                        rblGenderYes.Checked = true;
                    lblGenderComments.Text = setComments(Comments[k]);
                    break;
                case "Nationality and citizenship":
                    if (Comments[k].adminaction == 0)
                        rblNationalityNo.Checked = true;
                    else
                        rblNationalityYes.Checked = true;
                    lblNationalityComments.Text = setComments(Comments[k]);
                    break;
                case "Do you ever use a Chinese Commercial Code Number for your names":
                    if (Comments[k].adminaction == 0)
                        rblChineseCodeNo.Checked = true;
                    else
                        rblChineseCodeYes.Checked = true;
                    lblchineseCodeComments.Text = setComments(Comments[k]);
                    break;
                case "Chinese Commercial Code Number":
                    if (Comments[k].adminaction == 0)
                        rblChineseCodeNoNo.Checked = true;
                    else
                        rblChineseCodeNoYes.Checked = true;
                    lblChineseCodeNoComments.Text = setComments(Comments[k]);
                    break;
                case "In English, provide your patronymic name":
                    if (Comments[k].adminaction == 0)
                        rblRussianNameNo.Checked = true;
                    else
                        rblRussianNameYes.Checked = true;
                    lblrussianNameComments.Text = setComments(Comments[k]);
                    break;
                case "Do you have dual Citizenship":
                    if (Comments[k].adminaction == 0)
                        rblDualNationalityNo.Checked = true;
                    else
                        rblDualNationalityYes.Checked = true;
                    lblDualNationalityComments.Text = setComments(Comments[k]);
                    break;
                case "Nationality and citizenship(Second)":
                    if (Comments[k].adminaction == 0)
                        rblSecondNationNo.Checked = true;
                    else
                        rblSecondNationYes.Checked = true;
                    lblOtherNationComments.Text = setComments(Comments[k]);
                    break;
                case "Country of birth":
                    if (Comments[k].adminaction == 0)
                        rblBirthCountryNo.Checked = true;
                    else
                        rblBirthCountryYes.Checked = true;
                    lblBirthCountryComments.Text = setComments(Comments[k]);
                    break;
                case "Marital Status":
                    if (Comments[k].adminaction == 0)
                        rblMaritalNo.Checked = true;
                    else
                        rblMaritalYes.Checked = true;
                    lblMaritalComments.Text = setComments(Comments[k]);
                    break;
                case "Spouse Name":
                    if (Comments[k].adminaction == 0)
                        rblspouseNameNo.Checked = true;
                    else
                        rblspouseNameYes.Checked = true;
                    labelspouseNameComments.Text = setComments(Comments[k]);
                    break;
                case "Nationality of Spouse":
                    if (Comments[k].adminaction == 0)
                        rblSpouseNatinalityNo.Checked = true;
                    else
                        rblSpouseNatinalityYes.Checked = true;
                    lblSpouseNationalityComments.Text = setComments(Comments[k]);
                    break;
                case "Spouse Date of birth":
                    if (Comments[k].adminaction == 0)
                        rblSpouseDobNo.Checked = true;
                    else
                        rblSpouseDobYes.Checked = true;
                    labelSpouseDOBComments.Text = setComments(Comments[k]);
                    break;
                case "Date of Marriage":
                    if (Comments[k].adminaction == 0)
                        rblMarriagedateNo.Checked = true;
                    else
                        rblMarriagedateYes.Checked = true;
                    labelMarriagedateComments.Text = setComments(Comments[k]);
                    break;
                case "Do you have any disability, impairment, or a long term condition":
                    if (Comments[k].adminaction == 0)
                        rblDisabilityNo.Checked = true;
                    else
                        rblDisabilityYes.Checked = true;
                    lblDisabilityComments.Text = setComments(Comments[k]);
                    break;
                case "Disability Description":
                    if (Comments[k].adminaction == 0)
                        rbldisabilitydescNo.Checked = true;
                    else
                        rbldisabilitydescYes.Checked = true;
                    lbldisabilitydescComments.Text = setComments(Comments[k]);
                    break;
                case "Are you reffered by Agent":
                    if (Comments[k].adminaction == 0)
                        rblAgentNo.Checked = true;
                    else
                        rblAgentYes.Checked = true;
                    lblAgentComments.Text = setComments(Comments[k]);
                    break;
                case "Agent Name":
                    if (Comments[k].adminaction == 0)
                        rblAgentListNo.Checked = true;
                    else
                        rblAgentListYes.Checked = true;
                    lblAgentListComments.Text = setComments(Comments[k]);
                    break;
                case "Highest study level successfully completed":
                    lblhigheststudyComments.Text = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblhigheststudyNo.Checked = true;
                    else
                        rblhigheststudyYes.Checked = true;
                    break;
                default:
                    break;

            }

        }
        if (CustomControls.Count > 0)
            objCom.SetCustomDataCommentForSupervisor(formId, ApplicantID, CustomControls, mainDiv, Comments);
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