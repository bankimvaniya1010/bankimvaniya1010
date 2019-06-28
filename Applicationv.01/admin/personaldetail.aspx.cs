using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_personaldetail : System.Web.UI.Page
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
                    lblFirstName.Text = "Same as Passport firstname";
                else
                    lblFirstName.Text = profileInfo.firstname;
                if (profileInfo.ispassportlastname.HasValue && profileInfo.ispassportlastname.Value)
                    lblLastName.Text = "Same as Passport lastname";
                else
                    lblLastName.Text = profileInfo.lastname;
                if (profileInfo.ispassportmiddlename.HasValue && profileInfo.ispassportmiddlename.Value)
                    lblMiddleName.Text = "Same as Passport middlename";
                else
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
                String Nationality = "";
                if (profileInfo.nationality != null)
                {
                    Nationality = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.nationality2));
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
                    lblNationality.Text = "";
                    if (Nationality.ToUpper() == GlobalVariables.GetChinaCountryName)
                        //{
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
                    lblNationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.spousenationality));
                if (profileInfo.spousedob != null)
                {
                    labelSpouseDOB.Text = Convert.ToDateTime(profileInfo.spousedob).ToString("yyyy-MM-dd");
                }
                if (profileInfo.marriagedate != null)
                {
                    labelMarriagedate.Text = Convert.ToDateTime(profileInfo.marriagedate).ToString("yyyy-MM-dd");
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
                    case "LAST NAME":
                        iclastname.Attributes.Add("style", "display:block;");
                        iclastname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PREFERRED NAME":
                        icPreferredname.Attributes.Add("style", "display:block;");
                        icPreferredname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "OTHER MIDDLE NAMES":
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
                    case "NATIONALITY AND CITIZENSHIP":
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
                        labelfirstname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LAST NAME":
                        lastname.Attributes.Add("style", "display:block;");
                        labellastname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PREFERRED NAME":
                        preferedname.Attributes.Add("style", "display:block;");
                        labelpreferreName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "OTHER MIDDLE NAMES":
                        middlename.Attributes.Add("style", "display:block;");
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
                    break;
                case "First Name":
                    txtFirstName.Value = setComments(Comments[k]);
                    break;
                case "Last Name":
                    txtLastName.Value = setComments(Comments[k]);
                    break;
                case "Preferred Name":
                    txtPrefferedName.Value = setComments(Comments[k]);
                    break;
                case "Other middle names":
                    txtMiddleName.Value = setComments(Comments[k]);
                    break;
                case "Date of birth":
                    txtDOB.Value = setComments(Comments[k]);
                    break;
                case "Gender":
                    txtGender.Value = setComments(Comments[k]);
                    break;
                case "Nationality and citizenship":
                    txtNationality.Value = setComments(Comments[k]);
                    break;
                case "Do you ever use a Chinese Commercial Code Number for your names":
                    txtChineseCode.Value = setComments(Comments[k]);
                    break;
                case "Chinese Commercial Code Number":
                    txtChineseCodeNo.Value = setComments(Comments[k]);
                    break;
                case "In English, provide your patronymic name":
                    txtDualNationlity.Value = setComments(Comments[k]);
                    break;
                case "Nationality and citizenship(Second)":
                    txtOtherNation.Value = setComments(Comments[k]);
                    break;
                case "Country of birth":
                    txtBirthCountry.Value = setComments(Comments[k]);
                    break;
                case "Marital Status":
                    txtMarital.Value = setComments(Comments[k]);
                    break;
                case "Spouse Name":
                    txtSpousename.Value = setComments(Comments[k]);
                    break;
                case "Nationality of Spouse":
                    txtSpouseNationality.Value = setComments(Comments[k]);
                    break;
                case "Spouse Date of birth":
                    txtSpouseDOB.Value = setComments(Comments[k]);
                    break;
                case "Date of Marriage":
                    txtMarrigeDate.Value = setComments(Comments[k]);
                    break;
                case "Do you have any disability, impairment, or a long term condition":
                    txtDisability.Value = setComments(Comments[k]);
                    break;
                case "Disability Description":
                    txtDisabilityDescription.Value = setComments(Comments[k]);
                    break;
                case "Are you reffered by Agent":
                    txtAgent.Value = setComments(Comments[k]);
                    break;
                case "Agent Name":
                    txtAgentList.Value = setComments(Comments[k]);
                    break;
               
                default:
                    break;

            }

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            if (title.Style.Value != "display: none")
                adminInputs.Add("Title", txtTitle.Value.Trim());
            else if (firstname.Style.Value != "display: none")
                adminInputs.Add("First Name", txtFirstName.Value.Trim());
            else if (lastname.Style.Value != "display: none")
                adminInputs.Add("Last Name", txtLastName.Value.Trim());
            else if (preferedname.Style.Value != "display: none")
                adminInputs.Add("Preferred Name", txtPrefferedName.Value.Trim());
            else if (middlename.Style.Value != "display: none")
                adminInputs.Add("Other middle names", txtMiddleName.Value.Trim());
            else if (dob.Style.Value != "display: none")
                adminInputs.Add("Date of birth", txtDOB.Value.Trim());
            else if (gender.Style.Value != "display: none")
                adminInputs.Add("Gender", txtGender.Value.Trim());
            else if (nationality.Style.Value != "display: none")
                adminInputs.Add("Nationality and citizenship", txtNationality.Value.Trim());
            else if (chineseCode.Style.Value != "display: none")
                adminInputs.Add("Do you ever use a Chinese Commercial Code Number for your names", txtChineseCode.Value.Trim());
            else if (textChineseCodeDiv.Style.Value != "display: none")
                adminInputs.Add("Chinese Commercial Code Number", txtFirstName.Value.Trim());
            else if (russianName.Style.Value != "display: none")
                adminInputs.Add("In English, provide your patronymic name", txtRussiaName.Value.Trim());
            else if (dualNationality.Style.Value != "display: none")
                adminInputs.Add("Do you have dual Citizenship", txtDualNationlity.Value.Trim());
            else if (secondNation.Style.Value != "display: none")
                adminInputs.Add("Nationality and citizenship(Second)", txtOtherNation.Value.Trim());
            else if (birthcountry.Style.Value != "display: none")
                adminInputs.Add("Country of birth", txtBirthCountry.Value.Trim());
            else if (marital.Style.Value != "display: none")
                adminInputs.Add("Marital Status", txtMarital.Value.Trim());
            else if (statusMarried.Style.Value != "display: none")
                adminInputs.Add("Spouse Name", txtSpousename.Value.Trim());
            else if (SpouseNationality.Style.Value != "display: none")
                adminInputs.Add("Nationality of Spouse", txtSpouseNationality.Value.Trim());
            else if (SpouseDOB.Style.Value != "display: none")
                adminInputs.Add("Spouse Date of birth", txtSpouseDOB.Value.Trim());
            else if (MarriageDate.Style.Value != "display: none")
                adminInputs.Add("Date of Marriage", txtMarrigeDate.Value.Trim());
            else if (disability.Style.Value != "display: none")
                adminInputs.Add("Do you have any disability, impairment, or a long term condition", txtDisability.Value.Trim());
            else if (disabilitydesc.Style.Value != "display: none")
                adminInputs.Add("Disability Description", txtDisabilityDescription.Value.Trim());
            else if (agent.Style.Value != "display: none")
                adminInputs.Add("Are you reffered by Agent", txtAgent.Value.Trim());
            else if (agentList.Style.Value != "display: none")
                adminInputs.Add("Agent Name", txtAgentList.Value.Trim());
            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, userID, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

}