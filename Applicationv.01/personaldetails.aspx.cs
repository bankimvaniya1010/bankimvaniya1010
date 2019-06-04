using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Globalization;
using System.Text;
public partial class personaldetails : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected int isStudyBefore = 0, isApplyBefore = 0;
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
            Response.Redirect(webURL + "default.aspx",true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            objCom.BindCountries(ddlBirthCountry);
            objCom.BindCountries(ddlNationality);
            BindAgent();
            BindTitle();
            FillMonth();
            FillYears();
            FillDays();
            BindDisability();
            PopulatePersonalInfo();
            SetToolTips();
            SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        }
    }
    public void FillMonth()
    {
        try
        {
            // ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;  //set current year as selected
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            //Fill Months
            for (int i = 1; i <= 12; i++)
            {
                ddlMonth.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public void FillYears()
    {
        try
        {
            int maxYers = DateTime.Now.AddYears(-15).Year;
            for (int i = 1975; i <= maxYers; i++)
            {
                ddlYear.Items.Add(i.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public void FillDays()
    {
        try
        {
            //getting numbner of days in selected month & year
            int noofdays = DateTime.DaysInMonth(Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue));

            //Fill days
            for (int i = 1; i <= noofdays; i++)
            {
                ddlDay.Items.Add(i.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        // ddlDay.Items.FindByValue(System.DateTime.Now.Day.ToString()).Selected = true;// Set current date as selected
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDays();
    }
    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDays();
    }
    private void BindTitle()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var title = db.titlemaster.ToList();
            ddlTitle.DataSource = title;
            ddlTitle.DataTextField = "titlename";
            ddlTitle.DataValueField = "titleid";
            ddlTitle.DataBind();
            ddlTitle.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindDisability()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var disability = db.disabilitymaster.ToList();
            ddlDisability.DataSource = disability;
            ddlDisability.DataTextField = "description";
            ddlDisability.DataValueField = "id";
            ddlDisability.DataBind();
            ddlDisability.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindAgent()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var agent = db.adminusers.Where(x => x.roleid == 2).ToList();
            ddlAgent.DataSource = agent;
            ddlAgent.DataTextField = "name";
            ddlAgent.DataValueField = "userid";
            ddlAgent.DataBind();
            ddlAgent.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                txtFirstName.Value = profileInfo.firstname;
                txtLastName.Value = profileInfo.lastname;
                txtMiddleName.Value = profileInfo.middlename;
                txtPreferedName.Value = profileInfo.prefferedname;
                txtTitle.Value = profileInfo.othertitle;
                if (profileInfo.title != null)
                {
                    ddlTitle.ClearSelection();
                    ddlTitle.Items.FindByValue(profileInfo.title.ToString()).Selected = true; ;// Set current date as selected
                }
                if (profileInfo.dateofbirth != null)
                {
                    DateTime dob = Convert.ToDateTime(profileInfo.dateofbirth);

                    FillMonth();
                    FillYears();
                    FillDays();
                    ddlMonth.ClearSelection();
                    ddlDay.ClearSelection();
                    ddlYear.ClearSelection();
                    ddlMonth.Items.FindByValue(dob.Month.ToString()).Selected = true;
                    ddlYear.Items.FindByValue(dob.Year.ToString()).Selected = true;
                    ddlDay.Items.FindByValue(dob.Day.ToString()).Selected = true;

                }
                if (profileInfo.gender == 1)
                    rbtnMale.Checked = true;
                else
                    rbtnFemale.Checked = true;
                if (profileInfo.nationality != null)
                {
                    ddlNationality.ClearSelection();
                    ddlNationality.Items.FindByValue(profileInfo.nationality.ToString()).Selected = true;
                }
                if (profileInfo.countryofbirth != null)
                {
                    ddlBirthCountry.ClearSelection();
                    ddlBirthCountry.Items.FindByValue(profileInfo.countryofbirth.ToString()).Selected = true;
                }
                if (profileInfo.maritalstatus != null)
                {
                    ddlMarital.ClearSelection();
                    ddlMarital.Items.FindByValue(profileInfo.maritalstatus.ToString()).Selected = true;
                }
                if (profileInfo.disabilitydescription != null)
                {
                    ddlDisability.ClearSelection();
                    ddlDisability.Items.FindByValue(profileInfo.disabilitydescription.ToString()).Selected = true;
                }
                if (profileInfo.isdisable == 1)
                    rblDisabilityYes.Checked = true;
                else
                    rblDisabilityNo.Checked = true;
                if (profileInfo.agentid != null)
                {
                    ddlAgent.ClearSelection();
                    ddlAgent.Items.FindByValue(profileInfo.agentid.ToString()).Selected = true;
                }
                if (profileInfo.isstudentreferbyagent == 1)
                    rblAgentYes.Checked = true;
                else
                    rblAgentNo.Checked = true;

                lblSaveTime.Text = " Record was last saved at " + profileInfo.personaldetailsavedtime.ToString();
                //if (profileInfo.haveyoustudyinstitue == 1)
                //{
                //    isStudyBefore = 1;
                //    txtStudentID.Value = profileInfo.studentid;
                //    rblStudyYes.Checked = true;
                //}
                //else
                //    rblStudyNO.Checked = true;
                //if (profileInfo.haveyouappliedinstitue == 1)
                //{
                //    isApplyBefore = 1;
                //    txtAppliedStudentID.Value = profileInfo.studentid;
                //    rblApplyYes.Checked = true;
                //}
                //else
                //    rblApplyNo.Checked = true;
                //txtCourseName.Value = profileInfo.coursename;
                //txtStudentID.Value = profileInfo.studentid;
                //if (profileInfo.courseenddate != null)
                //    txtCourseEndate.Value = Convert.ToDateTime(profileInfo.courseenddate).ToString("yyyy-MM-dd");
                //if (profileInfo.coursestartdate != null)
                //    txtCourseStartDate.Value = Convert.ToDateTime(profileInfo.coursestartdate).ToString("yyyy-MM-dd");

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
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();
            profileInfo.firstname = txtFirstName.Value;
            profileInfo.lastname = txtLastName.Value;
            profileInfo.middlename = txtMiddleName.Value;
            profileInfo.prefferedname = txtPreferedName.Value;
            if (ddlMarital.SelectedValue != "")
                profileInfo.maritalstatus = Convert.ToInt32(ddlMarital.SelectedValue);
            profileInfo.title = Convert.ToInt32(ddlTitle.SelectedValue);
            string dateofBirth = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + ddlDay.SelectedValue;
            profileInfo.dateofbirth = Convert.ToDateTime(dateofBirth);
            //ddlDay.Items.FindByValue(dob.Day.ToString()).Selected = true;
            // ddlMonth.Items.FindByValue(dob.Month.ToString()).Selected = true;
            // ddlYear.Items.FindByValue(dob.Year.ToString()).Selected = true;
            if (rbtnMale.Checked)
                profileInfo.gender = 1;
            else
                profileInfo.gender = 0;
            if (ddlNationality.SelectedValue != "")
                profileInfo.nationality = Convert.ToInt32(ddlNationality.SelectedValue);
            if (ddlBirthCountry.SelectedValue != "")
                profileInfo.countryofbirth = Convert.ToInt32(ddlBirthCountry.SelectedValue);
            profileInfo.othertitle = txtTitle.Value;
            profileInfo.personaldetailsavedtime = DateTime.Now;
            if (rblDisabilityYes.Checked)
                profileInfo.isdisable = 1;
            else
                profileInfo.isdisable = 2;
            if (ddlDisability.SelectedValue != "")
                profileInfo.disabilitydescription = ddlDisability.SelectedValue;
            if (rblAgentYes.Checked)
                profileInfo.isstudentreferbyagent = 1;
            else
                profileInfo.isstudentreferbyagent = 0;
            if (ddlAgent.SelectedValue != "")
                profileInfo.agentid = Convert.ToInt32(ddlAgent.SelectedValue);
            
            db.SaveChanges();
            lblMessage.Text = "Your Personal Details have been saved";
            lblMessage.Visible = true;



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

                    case "Title":
                        ddlTitle.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "OtherTitle":
                        txtTitle.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Firstname":
                        txtFirstName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Lastname":
                        txtLastName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Prefered":
                        txtPreferedName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Middlename":
                        txtMiddleName.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Dob":
                        ddlMonth.ToolTip = lstToolTips[k].tooltips;
                        ddlDay.ToolTip = lstToolTips[k].tooltips;
                        ddlYear.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Gender":
                        rbtnMale.Attributes.Add("title", lstToolTips[k].tooltips);
                        rbtnFemale.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Nationality":
                        ddlNationality.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "CountryofBirth":
                        ddlBirthCountry.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Maritalstatus":
                        ddlMarital.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Havedisability":
                        rblDisabilityNo.ToolTip = lstToolTips[k].tooltips;
                        rblDisabilityYes.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Disability":
                        ddlDisability.ToolTip = lstToolTips[k].tooltips;
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
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }
    private void SetControlsUniversitywise(int universityID)
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
                    case "IF DIDN'T FIND AGENT NAME IN THE LIST THEN ADD HIS EMAIL ID TO SENT REGISTRATION LINK":
                        addnewagent.Attributes.Add("style", "display:block;");
                        labeladdnewagent.InnerHtml = setInnerHtml(fields[k]);
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
    protected void btnNewAgent_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("Dear Agent,<br/>");
        sb.Append("Please find below registration page to The Application Center to get your credit <br/>");
        sb.Append(webURL + "registeragent.aspx" + " <br/>");
        sb.Append("Thank You Backend Team The Application Center,<br/>");
        objCom.SendMail(txtAgentname.Text, sb.ToString(), "Agent Registration Link");
    }
}