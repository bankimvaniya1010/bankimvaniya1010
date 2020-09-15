using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gte_studentdetailsaspx : System.Web.UI.Page
{
    int formId = 0;
    Common objCom = new Common();
    int adminID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminID = Convert.ToInt32(Session["UserID"]);
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

        if (!IsPostBack)
        {            
            SetAdminComments();
            PopulatePersonalInfo();
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
                case "Date Of Birth":
                    {
                        txtdobComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rbldobNo.Checked = true;
                        else
                            rbldobYes.Checked = true;
                    }
                    break;               
                case "Country of Citizenship":
{
                        txtnationalityComment.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblnationalityyNo.Checked = true;
                        else
                            rblnationalityyYes.Checked = true;
                    }
                    break;
                case "Country of Birth":
                    {
                        txtbirthcountryComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblbirthcountryNo.Checked = true;
                        else
                            rblbirthcountryYes.Checked = true;
                    }
                    break;
                case 
                    "Current Country of Residence":
{
                        txtcountryrsidenceComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblcountryrsidenceNo.Checked = true;
                        else
                            rblcountryrsidenceYes.Checked = true;
                    }
                    break;
                case 
                    "Marital Status": 
{
                        txtmaritalstatusComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblmaritalstatusNo.Checked = true;
                        else
                            rblmaritalstatusYes.Checked = true;
                    }
                    break;
                case 
                    "Date of Marriage":
{
                        txtmarriagedateComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblmarriagedateNo.Checked = true;
                        else
                            rblmarriagedateYes.Checked = true;
                    }
                    break;
                case 
                    "Nationality of Spouse": 
{
                        txtspousenationalityComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblspousenationalityNo.Checked = true;
                        else
                            rblspousenationalityYes.Checked = true;
                    }
                    break;
                case 
                    "Name of Highest Qualification Completed": 
{
                        txthighestqualificationComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblhighestqualificationNo.Checked = true;
                        else
                            rblhighestqualificationYes.Checked = true;
                    }
                    break;
                case 
                    "Level of Highest Qualification Achieved": 
{
                        txthighestqualificationAchievedComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblhighestqualificationAchievedNo.Checked = true;
                        else
                            rblhighestqualificationAchievedYes.Checked = true;
                    }
                    break;
                case 
                    "Field of study of Highest Qualification": 
{
                        txthighestqualificationfieldComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblhighestqualificationfieldNo.Checked = true;
                        else
                            rblhighestqualificationfieldYes.Checked = true;
                    }
                    break;
                case 
                    "Year and month the highest qualification was completed": 
{
                        txthighestqualificationdateComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblhighestqualificationdateNo.Checked = true;
                        else
                            rblhighestqualificationdateYes.Checked = true;
                    }
                    break;
                case 
                    "country of highest Qualification": 
{
                        txthighestqualificationcountryComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblhighestqualificationcountryNo.Checked = true;
                        else
                            rblhighestqualificationcountryYes.Checked = true;
                    }
                    break;
                case 
                    "WORK EXPERIENCE (NUMBER OF YEARS)":
{
                        txtworkexperienceComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblworkexperienceNo.Checked = true;
                        else
                            rblworkexperienceYes.Checked = true;
                    }
                    break;
                case 
                    "TYPE OF WORK EXPERIENCE": 
{
                        txttypeofworkexperienceComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rbltypeofworkexperienceNo.Checked = true;
                        else
                            rbltypeofworkexperienceYes.Checked = true;
                    }
                    break;
                case 
                    "NAME OF UNIVERSITY YOU ARE APPLYING TO": 
{
                        txtuniversitynameComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rbluniversitynameNo.Checked = true;
                        else
                            rbluniversitynameYes.Checked = true;
                    }
                    break;
                case 
                    "Country where chosen Educational Institution is located": 
{
                        txtuniversityCountryComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rbluniversityCountryNo.Checked = true;
                        else
                            rbluniversityCountryYes.Checked = true;
                    }
                    break;
                case 
                    "CITY WHERE CHOSEN UNIVERSITY IS LOCATED": 
{
                        txteduinstitutioncityComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rbleduinstitutioncityNo.Checked = true;
                        else
                            rbleduinstitutioncityYes.Checked = true;
                    }
                    break;
                case 
                    "Level of Course you are applying for": 
{
                        txtcourseappliedComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblcourseappliedNo.Checked = true;
                        else
                            rblcourseappliedYes.Checked = true;
                    }
                    break;
                case 
                    "FIELD OF STUDY YOU ARE APPLYING TO": 
{
                        txtfieldofstudyComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblfieldofstudyNo.Checked = true;
                        else
                            rblfieldofstudyYes.Checked = true;
                    }
                    break;
                case 
                    "Name of Course you are applying for (First Choice)": 
{
                        txtnameofcourseComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblnameofcourseNo.Checked = true;
                        else
                            rblnameofcourseYes.Checked = true;
                    }
                    break;
                case "Date of course commencement": 
                    {
                        txtcommencementdateComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblcommencementdateNo.Checked = true;
                        else
                            rblcommencementdateYes.Checked = true;
                    }
                    break;
                case 
                    "ESTIMATED ANNUAL TUITION FEE AND LIVING COSTS ": 
{
                        txtannualfeeComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblannualfeeNo.Checked = true;
                        else
                            rblannualfeeYes.Checked = true;
                    }
                    break;
                case 
                    "Are you reffered by Agent": 
{
                        txtagentComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblagentNo.Checked = true;
                        else
                            rblagentYes.Checked = true;
                    }
                    break;
                case 
                    "Agent Name": 
{
                        txtagentListComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblagentListNo.Checked = true;
                        else
                            rblagentListYes.Checked = true;
                    }
                    break;
                case 
                    "If didn't find agent name in the list then add his email ID to sent registeration link": 
{
                        txtaddnewagentComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rbladdnewagentNo.Checked = true;
                        else
                            rbladdnewagentYes.Checked = true;
                    }
                    break;
                default:
                    break;

            }
          
        }
    }

    private void PopulatePersonalInfo()
    {
        try
        {
            var studentInfo = (from pInfo in db.gte_applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (studentInfo != null)
            {
                if (studentInfo.dateofbirth != null)
                    txtdob.Text = Convert.ToDateTime(studentInfo.dateofbirth).ToString("yyyy-MM-dd");
                if (studentInfo.nationality != null)
                {
                    lblnationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(studentInfo.nationality));
                }
                if (studentInfo.countryofbirth != null)
                {
                    txtbirthcountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(studentInfo.countryofbirth));
                }
                if (studentInfo.maritalstatus != null)
                {
                    lblmaritalstatus.Text = objCom.GetMaritalStatusDiscrition(Convert.ToInt32(studentInfo.maritalstatus));
                }
                if (studentInfo.maritalstatus == 3) {
                    if (studentInfo.dateofmarriage != null)
                        txtmarriagedate.Text = Convert.ToDateTime(studentInfo.dateofmarriage).ToString("yyyy-MM-dd");

                    if (studentInfo.nationalityofspouse != null)
                    {
                        txtspousenationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(studentInfo.nationalityofspouse));
                    }
                }
                txthighestqualification.Text = studentInfo.highestqualificationname;

                if (studentInfo.highestqualifiactionachieved != null)
                {
                    txthighestqualificationAchieved.Text = objCom.GetHighestDegree(Convert.ToInt32(studentInfo.highestqualifiactionachieved));
                }
                if (studentInfo.highestqualificationfield != null)
                {
                    txthighestqualificationfield.Text = objCom.GetHighestStudyField(Convert.ToInt32(studentInfo.highestqualifiactionachieved));
                }
                if (studentInfo.highestqualificationdate != null)
                {
                    txthighestqualificationdate.Text = studentInfo.highestqualificationdate;
                }

                if (studentInfo.highestqualificationcountry != null)
                {
                    txthighestqualificationcountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(studentInfo.highestqualificationcountry));
                }

                if (studentInfo.levelofcourse != null)
                {
                    txtcourseapplied.Text = objCom.GetHighestDegree(Convert.ToInt32(studentInfo.levelofcourse));
                }

                if (studentInfo.fieldofstudyapplied != null)
                {
                    txtfieldofstudy.Text = objCom.GetHighestStudyField(Convert.ToInt32(studentInfo.fieldofstudyapplied));
                }
                txtnameofcourse.Text = studentInfo.coursename;
                if (studentInfo.workexperience != null && studentInfo.workexperience != 0)
                {
                    txtworkexperience.Text = objCom.Getworkexperience(Convert.ToInt32(studentInfo.workexperience));
                }
                if (studentInfo.workexperience != null && studentInfo.workexperience == 0)
                {
                    txtworkexperience.Text = objCom.Getworkexperience(Convert.ToInt32(studentInfo.workexperience));
                }
                if (studentInfo.typeofworkexperience != null)
                {
                    txttypeofworkexperience.Text = objCom.GetTypeworkexperience(Convert.ToInt32(studentInfo.typeofworkexperience));
                }
                if (studentInfo.residencecountry != null)
                {
                    txtcountryrsidence.Text = objCom.GetCountryDiscription(Convert.ToInt32(studentInfo.residencecountry));
                }
                if (studentInfo.tuitionandlivingcost != null)
                {
                    txtannualfee.Text = objCom.GettuitionAndlivingcostmaster(Convert.ToInt32(studentInfo.tuitionandlivingcost));
                }
                if (studentInfo.nameofuniversityappliedfor != null)
                {
                    txtuniversityname.Text = objCom.GetUniversityName(Convert.ToInt32(studentInfo.nameofuniversityappliedfor));
                }
                if (studentInfo.countryofeducationInstitution != null)
                {
                    txtuniversityCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(studentInfo.countryofeducationInstitution));
                }
                if (studentInfo.cityofeducationInstitution != null)
                {
                    txteduinstitutioncity.Text = objCom.GetCityName(Convert.ToInt32(studentInfo.cityofeducationInstitution));
                }
                if (studentInfo.commencementdate != null)
                {
                    txtcommencementdate.Text = studentInfo.commencementdate;
                }

                //agent
                if (studentInfo.isstudentreferbyagent == 1)
                    txtagent.Text = "Yes";
                else if (studentInfo.isstudentreferbyagent == 0)
                    txtagent.Text = "No";

                if (studentInfo.isstudentreferbyagent == 1)
                {
                    agentList.Attributes.Add("style", "display:block");
                    if (studentInfo.agentid != null)
                    {
                        txtagentList.Text = objCom.Get_AgentName(Convert.ToInt32(studentInfo.agentid));
                    }
                    if (studentInfo.registeragent_email != null)
                    {
                        addnewagent.Attributes.Add("style", "display:block");
                        txtaddnewagent.Text = studentInfo.registeragent_email;
                    }
                }
                
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            adminInputs.Add("Date Of Birth", txtdobComments.Value.Trim() + "~" + (rbldobNo.Checked == true ? 0 : 1));

            adminInputs.Add("Country of Citizenship", txtnationalityComment.Value.Trim() + "~" + (rblnationalityyNo.Checked == true ? 0 : 1));
            adminInputs.Add("Country of Birth", txtbirthcountryComments.Value.Trim() + "~" + (rblbirthcountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("Current Country of Residence", txtcountryrsidenceComments.Value.Trim() + "~" + (rblcountryrsidenceNo.Checked == true ? 0 : 1));
            adminInputs.Add("Marital Status", txtmaritalstatusComments.Value.Trim() + "~" + (rblmarriagedateNo.Checked == true ? 0 : 1));
            if (fieldcontainer.Style.Value != "display: none") { 
                adminInputs.Add("Date of Marriage", txtmarriagedateComments.Value.Trim() + "~" + (rblmarriagedateNo.Checked == true ? 0 : 1));
                adminInputs.Add("Nationality of Spouse", txtspousenationalityComments.Value.Trim() + "~" + (rblspousenationalityNo.Checked == true ? 0 : 1));
            }
            adminInputs.Add("Name of Highest Qualification Completed", txthighestqualificationComments.Value.Trim() + "~" + (rblhighestqualificationNo.Checked == true ? 0 : 1));
            adminInputs.Add("Level of Highest Qualification Achieved", txthighestqualificationAchievedComments.Value.Trim() + "~" + (rblhighestqualificationAchievedNo.Checked == true ? 0 : 1));
            adminInputs.Add("Field of study of Highest Qualification", txthighestqualificationfieldComments.Value.Trim() + "~" + (rblhighestqualificationfieldNo.Checked == true ? 0 : 1));
            adminInputs.Add("Year and month the highest qualification was completed", txthighestqualificationdateComments.Value.Trim() + "~" + (rblhighestqualificationdateNo.Checked == true ? 0 : 1));
            adminInputs.Add("country of highest Qualification", txthighestqualificationcountryComments.Value.Trim() + "~" + (rblhighestqualificationcountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("WORK EXPERIENCE (NUMBER OF YEARS)", txtworkexperienceComments.Value.Trim() + "~" + (rblworkexperienceNo.Checked == true ? 0 : 1));
            adminInputs.Add("TYPE OF WORK EXPERIENCE", txttypeofworkexperienceComments.Value.Trim() + "~" + (rbltypeofworkexperienceNo.Checked == true ? 0 : 1));
            adminInputs.Add("NAME OF UNIVERSITY YOU ARE APPLYING TO", txtuniversitynameComments.Value.Trim() + "~" + (rbluniversitynameNo.Checked == true ? 0 : 1));
            adminInputs.Add("Country where chosen Educational Institution is located", txtuniversityCountryComments.Value.Trim() + "~" + (rbluniversityCountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("CITY WHERE CHOSEN UNIVERSITY IS LOCATED", txteduinstitutioncityComments.Value.Trim() + "~" + (rbleduinstitutioncityNo.Checked == true ? 0 : 1));
            adminInputs.Add("Level of Course you are applying for", txtcourseappliedComments.Value.Trim() + "~" + (rblcourseappliedNo.Checked == true ? 0 : 1));
            adminInputs.Add("FIELD OF STUDY YOU ARE APPLYING TO", txtfieldofstudyComments.Value.Trim() + "~" + (rblfieldofstudyNo.Checked == true ? 0 : 1));
            adminInputs.Add("Name of Course you are applying for (First Choice)", txtnameofcourseComments.Value.Trim() + "~" + (rblnameofcourseNo.Checked == true ? 0 : 1));
            adminInputs.Add("Date of course commencement", txtcommencementdateComments.Value.Trim() + "~" + (rblcommencementdateNo.Checked == true ? 0 : 1));
            adminInputs.Add("ESTIMATED ANNUAL TUITION FEE AND LIVING COSTS ", txtannualfeeComments.Value.Trim() + "~" + (rblannualfeeNo.Checked == true ? 0 : 1));
            adminInputs.Add("Are you reffered by Agent", txtagentComments.Value.Trim() + "~" + (rblagentNo.Checked == true ? 0 : 1));
            if (agentList.Style.Value != "display: none")            
                adminInputs.Add("Agent Name", txtagentListComments.Value.Trim() + "~" + (rblagentListNo.Checked == true ? 0 : 1));
            if (addnewagent.Style.Value != "display: none")
                adminInputs.Add("If didn't find agent name in the list then add his email ID to sent registeration link", txtaddnewagentComments.Value.Trim() + "~" + (rbladdnewagentNo.Checked == true ? 0 : 1));

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminID, adminInputs);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved successfully')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}