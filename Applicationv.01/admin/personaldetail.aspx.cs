using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_personaldetail : System.Web.UI.Page
{
    int adminId = 0, ApplicantID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();


    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
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
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
            SetToolTips();
            PopulatePersonalInfo();
            SetControlsUniversitywise();
            SetAdminComments();

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
                    lblGender.Text = "Prefer Not to Say";
                if (profileInfo.higheststudycompleted != null)
                {
                    lblhigheststudy.Text = objCom.GetHighestDegree(Convert.ToInt32(profileInfo.higheststudycompleted));
                }
                if (profileInfo.fieldofhigheststudy != null)
                {
                    lblfieldstudy.Text = objCom.GetHighestStudyField(Convert.ToInt32(profileInfo.fieldofhigheststudy));
                }
                if (profileInfo.studycompletedate != null)
                {
                    lblhighQualificationCompleteDate.Text = profileInfo.studycompletedate;
                }
                String qualificationCountry = "";
                if (profileInfo.countryofhigheststudy != null)
                {
                    qualificationCountry = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.countryofhigheststudy));
                    lblhighestQualificationCountry.Text = qualificationCountry;
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
                    case "Title":
                        icTitle.Attributes.Add("style", "display:block;");
                        icTitle.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "FIRST NAME":
                        icfirstname.Attributes.Add("style", "display:block;");
                        icfirstname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "FAMILY NAME":
                        iclastname.Attributes.Add("style", "display:block;");
                        iclastname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PREFERRED NAME":
                        icPreferredname.Attributes.Add("style", "display:block;");
                        icPreferredname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MIDDLE NAME(S)":
                        icmiddlename.Attributes.Add("style", "display:block;");
                        icmiddlename.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DATE OF BIRTH":
                        icDoB.Attributes.Add("style", "display:block;");
                        icDoB.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "GENDER":
                        icGender.Attributes.Add("style", "display:block;");
                        icGender.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CITIZENSHIP":
                        icNationality.Attributes.Add("style", "display:block;");
                        icNationality.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF BIRTH":
                        icBirthCountry.Attributes.Add("style", "display:block;");
                        icBirthCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MARITAL STATUS":
                        icMarital.Attributes.Add("style", "display:block;");
                        icMarital.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DO YOU HAVE ANY DISABILITY, IMPAIRMENT, OR A LONG TERM CONDITION":
                        icdisability.Attributes.Add("style", "display:block;");
                        icdisability.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DISABILITY DESCRIPTION":
                        icdisabilitydescription.Attributes.Add("style", "display:block;");
                        icdisabilitydescription.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ARE YOU REFERRED BY AGENT":
                        icAgent.Attributes.Add("style", "display:block;");
                        icAgent.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "AGENT NAME":
                        icAgentList.Attributes.Add("style", "display:block;");
                        icAgentList.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Highest study level successfully completed":
                        ichigheststudy.Attributes.Add("style", "display:block;");
                        ichigheststudy.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Highest study successfully completed field":
                        icfieldstudy.Attributes.Add("style", "display:block;");
                        icfieldstudy.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Country of highest qualification":
                        ichighestQualificationCountry.Attributes.Add("style", "display:block;");
                        ichighestQualificationCountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Year and Month of highest qualification":
                        ichighQualificationCompleteDate.Attributes.Add("style", "display:block;");
                        ichighQualificationCompleteDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
                    case "FAMILY NAME":
                        lastname.Attributes.Add("style", "display:block;");
                        passportsameasLastName.Attributes.Add("style", "display:block;");
                        labellastname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PREFERRED NAME":
                        preferedname.Attributes.Add("style", "display:block;");
                        labelpreferreName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MIDDLE NAME(S)":
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
                    case "CITIZENSHIP":
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
                    case "Highest study successfully completed field":
                        fieldstudy.Attributes.Add("style", "display:block;");
                        labelfieldstudy.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of highest qualification":
                        highestQualificationCountry.Attributes.Add("style", "display:block;");
                        labelhighestQualificationCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Year and Month of highest qualification":
                        highQualificationCompleteDate.Attributes.Add("style", "display:block;");
                        labelhighQualificationCompleteDate.InnerHtml = setInnerHtml(fields[k]);
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
                    txtTitle.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblTitleNo.Checked = true;
                    else
                        rblTitleYes.Checked = true;
                    break;
                case "First Name":
                    txtFirstName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblFirstNameNo.Checked = true;
                    else
                        rblFirstNameYes.Checked = true;
                    break;
                case "Passport First Name same as Above":
                    txtpassportsameasFirstName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblpassportsameasFirstNameNo.Checked = true;
                    else
                        rblpassportsameasFirstNameYes.Checked = true;
                    break;
                case "Family Name":
                    txtLastName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblLastNameNo.Checked = true;
                    else
                        rblLastNameYes.Checked = true;
                    break;
                case "Passport Family Name same as Above":
                    txtpassportsameasLastName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblpassportsameasLastNameNo.Checked = true;
                    else
                        rblpassportsameasLastNameYes.Checked = true;
                    break;
                case "Preferred Name":
                    txtPrefferedName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblPrefferedNameNo.Checked = true;
                    else
                        rblPrefferedNameYes.Checked = true;
                    break;
                case "Middle Name(s)":
                    txtMiddleName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblMiddleNameNo.Checked = true;
                    else
                        rblMiddleNameYes.Checked = true;
                    break;
                case "Passport Middle Name same as Above":
                    txtpassportsameasmiddlename.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblpassportsameasmiddlenameNo.Checked = true;
                    else
                        rblpassportsameasmiddlenameYes.Checked = true;
                    break;
                case "Date of birth":
                    txtDOB.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblDOBNo.Checked = true;
                    else
                        rblDOBYes.Checked = true;
                    break;
                case "Gender":
                    txtGender.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblGenderNo.Checked = true;
                    else
                        rblGenderYes.Checked = true;
                    break;
                case "Citizenship":
                    txtNationality.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblNationalityNo.Checked = true;
                    else
                        rblNationalityYes.Checked = true;
                    break;
                case "Do you ever use a Chinese Commercial Code Number for your names":
                    txtChineseCode.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblChineseCodeNo.Checked = true;
                    else
                        rblChineseCodeYes.Checked = true;
                    break;
                case "Chinese Commercial Code Number":
                    txtChineseCodeNo.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblChineseCodeNoNo.Checked = true;
                    else
                        rblChineseCodeNoYes.Checked = true;
                    break;
                case "In English, provide your patronymic name":
                    txtRussiaName.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblRussianNameNo.Checked = true;
                    else
                        rblRussianNameYes.Checked = true;
                    break;
                case "Do you have dual Citizenship":
                    txtDualNationlity.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblDualNationalityNo.Checked = true;
                    else
                        rblDualNationalityYes.Checked = true;
                    break;
                case "Citizenship(Second)":
                    txtOtherNation.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblSecondNationNo.Checked = true;
                    else
                        rblSecondNationYes.Checked = true;
                    break;
                case "Country of birth":
                    txtBirthCountry.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblBirthCountryNo.Checked = true;
                    else
                        rblBirthCountryYes.Checked = true;
                    break;
                case "Marital Status":
                    txtMarital.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblMaritalNo.Checked = true;
                    else
                        rblMaritalYes.Checked = true;
                    break;
                case "Spouse Name":
                    txtSpousename.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblspouseNameNo.Checked = true;
                    else
                        rblspouseNameYes.Checked = true;
                    break;
                case "Nationality of Spouse":
                    txtSpouseNationality.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblSpouseNatinalityNo.Checked = true;
                    else
                        rblSpouseNatinalityYes.Checked = true;
                    break;
                case "Spouse Date of birth":
                    txtSpouseDOB.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblSpouseDobNo.Checked = true;
                    else
                        rblSpouseDobYes.Checked = true;
                    break;
                case "Date of Marriage":
                    txtMarrigeDate.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblMarriagedateNo.Checked = true;
                    else
                        rblMarriagedateYes.Checked = true;
                    break;
                case "Do you have any disability, impairment, or a long term condition":
                    txtDisability.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblDisabilityNo.Checked = true;
                    else
                        rblDisabilityYes.Checked = true;
                    break;
                case "Disability Description":
                    txtDisabilityDescription.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rbldisabilitydescNo.Checked = true;
                    else
                        rbldisabilitydescYes.Checked = true;
                    break;
                case "Are you reffered by Agent":
                    txtAgent.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblAgentNo.Checked = true;
                    else
                        rblAgentYes.Checked = true;
                    break;
                case "Highest study level successfully completed":
                    txthigheststudy.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblhigheststudyNo.Checked = true;
                    else
                        rblhigheststudyYes.Checked = true;
                    break;
                case "Highest study successfully completed field":
                    txtfieldstudy.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rbfieldstudyNo.Checked = true;
                    else
                        rbfieldstudyYes.Checked = true;
                    break;
                case "Country of Highest Qualificatiion Achieved":
                    txthighestQualificationCountry.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rbhighestQualificationCountryNo.Checked = true;
                    else
                        rbhighestQualificationCountryYes.Checked = true;
                    break;
                case "Year and Month of highest qualification":
                    txthighQualificationCompleteDate.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rbhighQualificationCompleteDateNo.Checked = true;
                    else
                        rbhighQualificationCompleteDateYes.Checked = true;
                    break;
                case "Agent Name":
                    txtAgentList.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblAgentListNo.Checked = true;
                    else
                        rblAgentListYes.Checked = true;
                    break;

                default:
                    break;

            }

        }
        if (CustomControls.Count > 0)
            objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            if (title.Style.Value != "display: none")
                adminInputs.Add("Title", txtTitle.Value.Trim() + "~" + (rblTitleNo.Checked == true ? 0 : 1));
            if (firstname.Style.Value != "display: none")
            {
                adminInputs.Add("First Name", txtFirstName.Value.Trim() + "~" + (rblFirstNameNo.Checked == true ? 0 : 1));
                adminInputs.Add("Passport First Name same as Above", txtpassportsameasFirstName.Value.Trim() + "~" + (rblpassportsameasFirstNameNo.Checked == true ? 0 : 1));
            }
            if (lastname.Style.Value != "display: none")
            {
                adminInputs.Add("Family Name", txtLastName.Value.Trim() + "~" + (rblLastNameNo.Checked == true ? 0 : 1));
                adminInputs.Add("Passport Family Name same as Above", txtpassportsameasLastName.Value.Trim() + "~" + (rblpassportsameasLastNameNo.Checked == true ? 0 : 1));
            }
            if (preferedname.Style.Value != "display: none")
                adminInputs.Add("Preferred Name", txtPrefferedName.Value.Trim() + "~" + (rblPrefferedNameNo.Checked == true ? 0 : 1));
            if (middlename.Style.Value != "display: none")
            {
                adminInputs.Add("Middle Name(s)", txtMiddleName.Value.Trim() + "~" + (rblMiddleNameNo.Checked == true ? 0 : 1));
                adminInputs.Add("Passport Middle Name same as Above", txtpassportsameasmiddlename.Value.Trim() + "~" + (rblpassportsameasmiddlenameNo.Checked == true ? 0 : 1));
            }
            if (dob.Style.Value != "display: none")
                adminInputs.Add("Date of birth", txtDOB.Value.Trim() + "~" + (rblDOBNo.Checked == true ? 0 : 1));
            if (gender.Style.Value != "display: none")
                adminInputs.Add("Gender", txtGender.Value.Trim() + "~" + (rblGenderNo.Checked == true ? 0 : 1));
            if (nationality.Style.Value != "display: none")
                adminInputs.Add("Citizenship", txtNationality.Value.Trim() + "~" + (rblNationalityNo.Checked == true ? 0 : 1));
            if (chineseCode.Style.Value != "display: none")
                adminInputs.Add("Do you ever use a Chinese Commercial Code Number for your names", txtChineseCode.Value.Trim() + "~" + (rblChineseCodeNo.Checked == true ? 0 : 1));
            if (textChineseCodeDiv.Style.Value != "display: none")
                adminInputs.Add("Chinese Commercial Code Number", txtFirstName.Value.Trim() + "~" + (rblChineseCodeNoNo.Checked == true ? 0 : 1));
            if (russianName.Style.Value != "display: none")
                adminInputs.Add("In English, provide your patronymic name", txtRussiaName.Value.Trim() + "~" + (rblRussianNameNo.Checked == true ? 0 : 1));
            if (dualNationality.Style.Value != "display: none")
                adminInputs.Add("Do you have dual Citizenship", txtDualNationlity.Value.Trim() + "~" + (rblDualNationalityNo.Checked == true ? 0 : 1));
            if (secondNation.Style.Value != "display: none")
                adminInputs.Add("Citizenship(Second)", txtOtherNation.Value.Trim() + "~" + (rblSecondNationNo.Checked == true ? 0 : 1));
            if (birthcountry.Style.Value != "display: none")
                adminInputs.Add("Country of birth", txtBirthCountry.Value.Trim() + "~" + (rblBirthCountryNo.Checked == true ? 0 : 1));
            if (marital.Style.Value != "display: none")
                adminInputs.Add("Marital Status", txtMarital.Value.Trim() + "~" + (rblMaritalNo.Checked == true ? 0 : 1));
            if (statusMarried.Style.Value != "display: none")
                adminInputs.Add("Spouse Name", txtSpousename.Value.Trim() + "~" + (rblspouseNameNo.Checked == true ? 0 : 1));
            if (SpouseNationality.Style.Value != "display: none")
                adminInputs.Add("Nationality of Spouse", txtSpouseNationality.Value.Trim() + "~" + (rblSpouseNatinalityNo.Checked == true ? 0 : 1));
            if (SpouseDOB.Style.Value != "display: none")
                adminInputs.Add("Spouse Date of birth", txtSpouseDOB.Value.Trim() + "~" + (rblSpouseDobNo.Checked == true ? 0 : 1));
            if (MarriageDate.Style.Value != "display: none")
                adminInputs.Add("Date of Marriage", txtMarrigeDate.Value.Trim() + "~" + (rblMarriagedateNo.Checked == true ? 0 : 1));
            if (disability.Style.Value != "display: none")
                adminInputs.Add("Do you have any disability, impairment, or a long term condition", txtDisability.Value.Trim() + "~" + (rblDisabilityNo.Checked == true ? 0 : 1));
            if (disabilitydesc.Style.Value != "display: none")
                adminInputs.Add("Disability Description", txtDisabilityDescription.Value.Trim() + "~" + (rbldisabilitydescNo.Checked == true ? 0 : 1));
            if (agent.Style.Value != "display: none")
                adminInputs.Add("Are you reffered by Agent", txtAgent.Value.Trim() + "~" + (rblAgentNo.Checked == true ? 0 : 1));
            if (agentList.Style.Value != "display: none")
                adminInputs.Add("Agent Name", txtAgentList.Value.Trim() + "~" + (rblAgentListNo.Checked == true ? 0 : 1));
            if (higheststudy.Style.Value != "display: none")
                adminInputs.Add("Highest study level successfully completed", txthigheststudy.Value.Trim() + "~" + (rblhigheststudyNo.Checked == true ? 0 : 1));
            if (fieldstudy.Style.Value != "display: none")
                adminInputs.Add("Highest study successfully completed field", txtfieldstudy.Value.Trim() + "~" + (rbfieldstudyNo.Checked == true ? 0 : 1));
            if (highestQualificationCountry.Style.Value != "display: none")
                adminInputs.Add("Country of Highest Qualificatiion Achieved", txthighestQualificationCountry.Value.Trim() + "~" + (rbhighestQualificationCountryNo.Checked == true ? 0 : 1));
            if (highQualificationCompleteDate.Style.Value != "display: none")
                adminInputs.Add("Year and Month of highest qualification", txthighQualificationCompleteDate.Value.Trim() + "~" + (rbhighQualificationCompleteDateNo.Checked == true ? 0 : 1));
            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminId, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

}