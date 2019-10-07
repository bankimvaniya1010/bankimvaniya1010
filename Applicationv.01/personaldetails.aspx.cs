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
    int userID = 0, ApplicantID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected int isStudyBefore = 0, isApplyBefore = 0;
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Utility.GetUniversityId();       
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !isDeclarationCompleted)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlBirthCountry);
            objCom.BindCountries(ddlNationality, true);
            objCom.BindCountries(ddlOtherNation);
            objCom.BindCountries(ddlSpouseNationality);
            objCom.BindCountries(ddlHighestQualificationCountry);
            BindMaritalstatus();
            BindHighestStudy();
            BindFieldOfStudy();
            BindAgent();
            BindTitle();
            FillMonth(ddlHighQualificationCompletedMonth);
            FillYears(ddlHighQualificationCompletedYear, false);
            FillMonth(ddlMonth);
            FillYears(ddlYear);
           // FillDays(ddlDay, ddlYear, ddlMonth);
            BindDisability();
            FillMonth(ddlMarriageMonth);
            FillYears(ddlMarriageYear);
           // FillDays(ddlMarriageDate, ddlMarriageYear, ddlMarriageMonth);
            FillMonth(ddlSpouseDOBMonth);
            FillYears(ddlSpouseDOBYear);
           // FillDays(ddlSpouseDOBDate, ddlSpouseDOBYear, ddlSpouseDOBMonth);
            PopulatePersonalInfo();
            SetToolTips();
            SetControlsUniversitywise();

            int maxAge = db.university_master.Where(x => x.universityid == universityID).Select(x => x.acceptedmaxage).First();
            int minAge = db.university_master.Where(x => x.universityid == universityID).Select(x => x.acceptedminage).First();

            GlobalVariables.universityMaxAge = maxAge;
            GlobalVariables.universityMinAge = minAge;
        }
    }
    public void BindHighestStudy()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var title = db.studylevelmaster.ToList();
            ddlhigheststudy.DataSource = title;
            ddlhigheststudy.DataTextField = "studylevel";
            ddlhigheststudy.DataValueField = "studylevelid";
            ddlhigheststudy.DataBind();
            ddlhigheststudy.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void BindFieldOfStudy()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var discipline_master = db.majordiscipline_master.ToList();
            ddlfieldstudy.DataSource = discipline_master;
            ddlfieldstudy.DataTextField = "description";
            ddlfieldstudy.DataValueField = "id";
            ddlfieldstudy.DataBind();
            ddlfieldstudy.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public void FillMonth(DropDownList ddl)
    {
        try
        {
            // ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;  //set current year as selected
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            //Fill Months
            ddl.Items.Add(new ListItem("Please select", "0"));
            for (int i = 1; i <= 12; i++)
            {
                ddl.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public void FillYears(DropDownList ddl, bool setDefaultMaxYears = true)
    {
        try
        {
            int maxYers = setDefaultMaxYears ? DateTime.Now.AddYears(-15).Year : DateTime.Now.Year;
            ddl.Items.Add(new ListItem("Please select", "0"));
            for (int i = 1975; i <= maxYers; i++)
            {
                ddl.Items.Add(i.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public void FillDays(DropDownList ddl, DropDownList ddlFromYear, DropDownList ddlFromMonth)
    {
        try
        {
            ddl.Items.Clear();
            ddl.Items.Add("Select Day");
            List<dynamic> daysData = new List<dynamic>();
            daysData.Add(new { displayName = "Select Day", value = 0 });
            if (Convert.ToInt32(ddlFromYear.SelectedValue) > 0 && Convert.ToInt32(ddlFromMonth.SelectedValue) > 0)
            {
                //getting numbner of days in selected month & year
                int noofdays = DateTime.DaysInMonth(Convert.ToInt32(ddlFromYear.SelectedValue), Convert.ToInt32(ddlFromMonth.SelectedValue));
                //Fill days         

                for (int i = 1; i <= noofdays; i++)
                {
                    daysData.Add(new { displayName = i.ToString(), value = i });
                }
            }
            ddl.DataSource = daysData;
            ddl.DataTextField = "displayName";
            ddl.DataValueField = "value";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        // ddlDay.Items.FindByValue(System.DateTime.Now.Day.ToString()).Selected = true;// Set current date as selected
    }


    private void BindMaritalstatus()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var title = db.maritalstatusmaster.ToList();
            ddlMarital.DataSource = title;
            ddlMarital.DataTextField = "description";
            ddlMarital.DataValueField = "id";
            ddlMarital.DataBind();
            ddlMarital.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
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
            var agent = db.agentmaster.ToList();
            ddlAgent.DataSource = agent;
            ddlAgent.DataTextField = "agentname";
            ddlAgent.DataValueField = "agentid";
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
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                txtTitle.Value = profileInfo.othertitle;
                if (profileInfo.title != null)
                {
                    ddlTitle.ClearSelection();
                    ddlTitle.Items.FindByValue(profileInfo.title.ToString()).Selected = true;
                }
                txtFirstName.Value = profileInfo.firstname;
                txtLastName.Value = profileInfo.lastname;
                txtMiddleName.Value = profileInfo.middlename;
                txtPreferedName.Value = profileInfo.prefferedname;
                if (profileInfo.dateofbirth != null)
                {
                    DateTime dob = Convert.ToDateTime(profileInfo.dateofbirth);
                    FillMonth(ddlMonth);
                    FillYears(ddlYear);
                    
                    ddlMonth.ClearSelection();                    
                    ddlYear.ClearSelection();
                    ddlMonth.Items.FindByValue(dob.Month.ToString()).Selected = true;
                    ddlYear.Items.FindByValue(dob.Year.ToString()).Selected = true;                    
                    FillDays(ddlDay, ddlYear, ddlMonth);
                    ddlDay.Items.FindByValue(dob.Day.ToString()).Selected = true;
                    hidDOBDate.Value = dob.Day.ToString();

                }
                if (profileInfo.gender == 1)
                    rbtnMale.Checked = true;
                else if (profileInfo.gender == 0)
                    rbtnFemale.Checked = true;
                else if (profileInfo.gender == 2)
                    rbtnOther.Checked = true;
                else if (profileInfo.gender == 3)
                    rbtnPreferNot.Checked = true;

                if (profileInfo.higheststudycompleted != null) {
                    ddlhigheststudy.ClearSelection();
                    ddlhigheststudy.Items.FindByValue(profileInfo.higheststudycompleted.ToString()).Selected = true;
                }
                if (profileInfo.fieldofhigheststudy != null)
                {
                    ddlfieldstudy.ClearSelection();
                    ddlfieldstudy.Items.FindByValue(profileInfo.fieldofhigheststudy.ToString()).Selected = true;
                }
                if (profileInfo.studycompletedate != null)
                {
                    string[] studyCompleteDate = profileInfo.studycompletedate.ToString().Split('-');
                    ddlHighQualificationCompletedMonth.ClearSelection();
                    ddlHighQualificationCompletedMonth.Items.FindByValue(Convert.ToString(studyCompleteDate[0])).Selected = true;
                    ddlHighQualificationCompletedYear.ClearSelection();
                    ddlHighQualificationCompletedYear.Items.FindByValue(Convert.ToString(studyCompleteDate[1])).Selected = true;
                }

                if (profileInfo.nationality != null)
                {
                    string appendText = "_False";
                    var addDualCitizenshipText = db.countriesmaster.Where(x => x.id == profileInfo.nationality.Value).Select(x => x.dual_citizenship_allowed).FirstOrDefault();
                    if (addDualCitizenshipText)
                        appendText = "_True";
                    if (profileInfo.hasdualcitizenship.HasValue && profileInfo.hasdualcitizenship.Value)
                    {
                        rblNationalityYes.Checked = true;
                        dualNationality.Visible = true;
                        dualNationality.Style.Remove("display");
                    }
                    else
                    {
                        if (profileInfo.hasdualcitizenship.HasValue)
                            rblNationalityNo.Checked = false;
                    }
                    ddlNationality.ClearSelection();
                    ddlNationality.Items.FindByValue(profileInfo.nationality.ToString() + appendText).Selected = true;

                    if (ddlNationality.SelectedItem.Text.ToUpper() == GlobalVariables.GetChinaCountryName)
                    {
                        if (profileInfo.haschinesecodenumber.HasValue && profileInfo.haschinesecodenumber.Value)
                        {
                            rblChineseCodeYes.Checked = true;
                            txtChineseCodeNumber.Value = profileInfo.chinesecodenumber;
                            chineseCode.Visible = true;
                            labelChineseCode.Visible = true;
                            rblChineseCodeNo.Visible = true;
                            rblChineseCodeYes.Visible = true;
                            textChineseCodeDiv.Visible = true;

                            chineseCode.Style.Remove("display");
                            textChineseCodeDiv.Style.Remove("display");
                        }
                    }
                    else if (ddlNationality.SelectedItem.Text.ToUpper() == GlobalVariables.GetRussiaCountryName)
                    {
                        if (!string.IsNullOrEmpty(profileInfo.patronymicname))
                        {
                            txtPatronymicName.Value = profileInfo.patronymicname;
                            russianName.Visible = true;
                            russianName.Style.Remove("display");
                        }
                    }
                }

                if (profileInfo.nationality2.HasValue && profileInfo.nationality2.Value > 0)
                {
                    rblNationalityYes.Checked = true;
                    ddlOtherNation.ClearSelection();
                    ddlOtherNation.Items.FindByValue(profileInfo.nationality2.ToString()).Selected = true;
                    secondNation.Visible = true;
                    dualNationality.Style.Remove("display");
                    secondNation.Style.Remove("display");
                }
                if (profileInfo.countryofbirth != null)
                {
                    ddlBirthCountry.ClearSelection();
                    ddlBirthCountry.Items.FindByValue(profileInfo.countryofbirth.ToString()).Selected = true;
                }
                if (profileInfo.countryofhigheststudy != null)
                {
                    ddlHighestQualificationCountry.ClearSelection();
                    ddlHighestQualificationCountry.Items.FindByValue(profileInfo.countryofhigheststudy.ToString()).Selected = true;
                }
                if (profileInfo.maritalstatus != null)
                {
                    ddlMarital.ClearSelection();
                    ddlMarital.Items.FindByValue(profileInfo.maritalstatus.ToString()).Selected = true;
                }
                if (profileInfo.isdisable == 1)
                    rblDisabilityYes.Checked = true;
                else if (profileInfo.isdisable == 2)
                    rblDisabilityNo.Checked = true;
                if (profileInfo.disabilitydescription != null)
                {
                    ddlDisability.ClearSelection();
                    ddlDisability.Items.FindByValue(profileInfo.disabilitydescription.ToString()).Selected = true;
                }
                if (profileInfo.isstudentreferbyagent == 1)
                    rblAgentYes.Checked = true;
                else if (profileInfo.isstudentreferbyagent == 0)
                    rblAgentNo.Checked = true;
                if (profileInfo.agentid != null)
                {
                    ddlAgent.ClearSelection();
                    ddlAgent.Items.FindByValue(profileInfo.agentid.ToString()).Selected = true;
                }

                if (profileInfo.ispassportfirstname.HasValue && profileInfo.ispassportfirstname.Value)
                    passportFirstName.Checked = profileInfo.ispassportfirstname.Value;

                if (profileInfo.ispassportlastname.HasValue && profileInfo.ispassportlastname.Value)
                    passportLastName.Checked = profileInfo.ispassportlastname.Value;

                if (profileInfo.ispassportmiddlename.HasValue && profileInfo.ispassportmiddlename.Value)
                    passportMiddleName.Checked = profileInfo.ispassportmiddlename.Value;

                if (profileInfo.ismarried.HasValue && profileInfo.ismarried.Value)
                {
                    statusMarried.Visible = true;
                    statusMarried.Style.Remove("display");
                    txtSpouseName.Value = profileInfo.spousename;
                    ddlSpouseNationality.ClearSelection();
                    ddlSpouseNationality.Items.FindByValue(profileInfo.spousenationality.ToString()).Selected = true;
                    if (profileInfo.spousedob != null)
                    {
                        DateTime spousedob = Convert.ToDateTime(profileInfo.spousedob);
                        FillMonth(ddlSpouseDOBMonth);
                        FillYears(ddlSpouseDOBYear);

                        ddlSpouseDOBMonth.ClearSelection();                        
                        ddlSpouseDOBYear.ClearSelection();
                        ddlSpouseDOBMonth.Items.FindByValue(spousedob.Month.ToString()).Selected = true;
                        ddlSpouseDOBYear.Items.FindByValue(spousedob.Year.ToString()).Selected = true;
                        FillDays(ddlSpouseDOBDate, ddlSpouseDOBYear, ddlSpouseDOBMonth);
                        ddlSpouseDOBDate.Items.FindByValue(spousedob.Day.ToString()).Selected = true;
                    }
                    if (profileInfo.marriagedate != null)
                    {
                        DateTime marriagedate = Convert.ToDateTime(profileInfo.marriagedate);
                        FillMonth(ddlMarriageMonth);
                        FillYears(ddlMarriageYear);

                        ddlMarriageMonth.ClearSelection();                       
                        ddlMarriageYear.ClearSelection();
                        ddlMarriageMonth.Items.FindByValue(marriagedate.Month.ToString()).Selected = true;
                        ddlMarriageYear.Items.FindByValue(marriagedate.Year.ToString()).Selected = true;
                        FillDays(ddlMarriageDate, ddlMarriageYear, ddlMarriageMonth);
                        ddlMarriageDate.Items.FindByValue(marriagedate.Day.ToString()).Selected = true;
                    }
                }

                lblSaveTime.Text = " Record was last saved at " + profileInfo.personaldetailsavedtime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void SavePersonaldetails()
    {
        try
        {
            var mode = "new";
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            applicantdetails objapplicantDetail = new applicantdetails();
            if (profileInfo != null)
            {
                mode = "update";
                objapplicantDetail = profileInfo;
            }
            objapplicantDetail.title = Convert.ToInt32(ddlTitle.SelectedValue);
            objapplicantDetail.othertitle = txtTitle.Value;
            objapplicantDetail.firstname = txtFirstName.Value;
            objapplicantDetail.lastname = txtLastName.Value;
            objapplicantDetail.middlename = txtMiddleName.Value;
            objapplicantDetail.prefferedname = txtPreferedName.Value;
            string dateofBirth = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + hidDOBDate.Value;
            objapplicantDetail.dateofbirth = Convert.ToDateTime(dateofBirth);
            if (rbtnMale.Checked)
                objapplicantDetail.gender = 1;
            else if (rbtnFemale.Checked)
                objapplicantDetail.gender = 0;
            else if (rbtnOther.Checked)
                objapplicantDetail.gender = 2;
            else if (rbtnPreferNot.Checked)
                objapplicantDetail.gender = 3;

            if (ddlNationality.SelectedValue != "")
            {
                string[] array = ddlNationality.SelectedValue.Split('_');
                objapplicantDetail.nationality = Convert.ToInt32(array[0]);
            }
            if (ddlOtherNation.SelectedValue != "" && Convert.ToInt32(ddlOtherNation.SelectedValue) > 0)
                objapplicantDetail.nationality2 = Convert.ToInt32(ddlOtherNation.SelectedValue);
            if (objapplicantDetail.nationality2.HasValue && objapplicantDetail.nationality.HasValue)
                objapplicantDetail.hasdualcitizenship = true;
            if (rblNationalityNo.Checked)
                objapplicantDetail.hasdualcitizenship = false;
            if (rblChineseCodeYes.Checked)
            {
                objapplicantDetail.chinesecodenumber = txtChineseCodeNumber.Value.Trim();
                objapplicantDetail.haschinesecodenumber = true;
            }
            else if (rblChineseCodeNo.Checked)
                objapplicantDetail.haschinesecodenumber = false;
            if (txtPatronymicName.Value != "")
                objapplicantDetail.patronymicname = txtPatronymicName.Value.Trim();
            if (ddlBirthCountry.SelectedValue != "")
                objapplicantDetail.countryofbirth = Convert.ToInt32(ddlBirthCountry.SelectedValue);
            if (ddlHighestQualificationCountry.SelectedValue != "")
                objapplicantDetail.countryofhigheststudy = Convert.ToInt32(ddlHighestQualificationCountry.SelectedValue);
            if ((ddlHighQualificationCompletedMonth.SelectedValue != "") && (ddlHighQualificationCompletedYear.SelectedValue != ""))
                objapplicantDetail.studycompletedate = ddlHighQualificationCompletedMonth.SelectedValue + "-" + ddlHighQualificationCompletedYear.SelectedValue;
            if (ddlMarital.SelectedValue != "")
                objapplicantDetail.maritalstatus = Convert.ToInt32(ddlMarital.SelectedValue);
            if (rblDisabilityYes.Checked)
                objapplicantDetail.isdisable = 1;
            else if (rblDisabilityNo.Checked)
                objapplicantDetail.isdisable = 2;
            if (ddlDisability.SelectedValue != "")
                objapplicantDetail.disabilitydescription = ddlDisability.SelectedValue;
            if (rblAgentYes.Checked)
                objapplicantDetail.isstudentreferbyagent = 1;
            else if (rblAgentNo.Checked)
                objapplicantDetail.isstudentreferbyagent = 0;
            if (ddlAgent.SelectedValue != "")
                objapplicantDetail.agentid = Convert.ToInt32(ddlAgent.SelectedValue);
            objapplicantDetail.applicantid = userID;
            objapplicantDetail.universityid = universityID;
            objapplicantDetail.personaldetailsavedtime = DateTime.Now;
            objapplicantDetail.ispersonaldetailspresent = true;
            if (ddlhigheststudy.SelectedValue != null)
            {
                objapplicantDetail.higheststudycompleted = Convert.ToInt32(ddlhigheststudy.SelectedValue);
            }
            if (ddlfieldstudy.SelectedValue != null)
                objapplicantDetail.fieldofhigheststudy = Convert.ToInt32(ddlfieldstudy.SelectedValue);
            if (ddlMarital.SelectedItem.Text == "Married")
            {
                string spouseDateofBirth = ddlSpouseDOBYear.SelectedValue + "-" + ddlSpouseDOBMonth.SelectedValue + "-" + hidSpouseDOBDateField.Value;
                string marriageDate = ddlMarriageYear.SelectedValue + "-" + ddlMarriageMonth.SelectedValue + "-" + hidMarriageDateField.Value;

                objapplicantDetail.ismarried = true;
                objapplicantDetail.spousedob = Convert.ToDateTime(spouseDateofBirth);
                objapplicantDetail.marriagedate = Convert.ToDateTime(marriageDate);
                objapplicantDetail.spousename = txtSpouseName.Value.Trim();
                objapplicantDetail.spousenationality = Convert.ToInt32(ddlSpouseNationality.SelectedValue);
            }

            objapplicantDetail.ispassportfirstname = passportFirstName.Checked;
            objapplicantDetail.ispassportlastname = passportLastName.Checked;
            objapplicantDetail.ispassportmiddlename = passportMiddleName.Checked;
            if (mode == "new")
                db.applicantdetails.Add(objapplicantDetail);
            db.SaveChanges();
            PopulatePersonalInfo();
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetStudentDetailsCompletedStatus(userID, universityID);

            lblMessage.Text = "Your Personal Details have been saved";
            //            lblMessage.Visible = true;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        SavePersonaldetails();
    }

    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.universitywisetooltipmaster
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
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
                    case "IF DIDN'T FIND AGENT NAME IN THE LIST THEN ADD HIS EMAIL ID TO SENT REGISTRATION LINK":
                        icNewAgent.Attributes.Add("style", "display:block;");
                        icNewAgent.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
                    case "Title":
                        title.Attributes.Add("style", "display:block;");
                        labeltitle.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FIRST NAME":
                        firstname.Attributes.Add("style", "display:block;");
                        labelfirstname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "FAMILY NAME":
                        lastname.Attributes.Add("style", "display:block;");
                        labellastname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "PREFERRED NAME":
                        preferedname.Attributes.Add("style", "display:block;");
                        labelpreferreName.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MIDDLE NAME(S)":
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
                    case "IF DIDN'T FIND AGENT NAME IN THE LIST THEN ADD HIS EMAIL ID TO SENT REGISTRATION LINK":
                        addnewagent.Attributes.Add("style", "display:block;");
                        labeladdnewagent.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Highest study level successfully completed":
                        higheststudy.Attributes.Add("style", "display:block;");
                        lblhigheststudy.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Highest study successfully completed field":
                        fieldstudy.Attributes.Add("style", "display:block;");
                        lblfieldstudy.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of highest qualification":
                        highestQualificationCountry.Attributes.Add("style", "display:block;");
                        labelhighestQualificationCountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Year and Month of highest qualification":
                        highQualificationCompleteDate.Attributes.Add("style", "display:block;");
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
    protected void btnNewAgent_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("Dear Agent,<br/>");
        sb.Append("Please find below registration page to The Application Center to get your credit <br/>");
        sb.Append(webURL + "registeragent.aspx" + " <br/>");
        sb.Append("Thank You Backend Team The Application Center,<br/>");
        objCom.SendMail(txtAgentname.Text, sb.ToString(), "Agent Registration Link");
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        SavePersonaldetails();
        Response.Redirect("applicantcontactdetail.aspx?formid=2",true);
    }
}

  