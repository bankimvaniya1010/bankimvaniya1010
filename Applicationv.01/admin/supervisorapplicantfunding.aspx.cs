using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorapplicantfunding : System.Web.UI.Page
{
    int formId = 0;
    Common objCom = new Common();
    int SupervisorID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected List<admincomments> Comments = new List<admincomments>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        SupervisorID = Convert.ToInt32(Session["UserID"]);
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
        CustomControls = objCom.CustomControlist(formId, universityID);
        Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControlForSupervisor(CustomControls, mainDiv, Comments);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
            SetAdminComments();
            PopulateFundingDetails();
            PopulateSupervisorComments();
        }
    }

    private void PopulateFundingDetails()
    {
        try
        {
            var fundingInfo = (from fInfo in db.applicantfundingmaster
                               where fInfo.applicantid == ApplicantID && fInfo.universityid == universityID
                               select fInfo).FirstOrDefault();
            if (fundingInfo != null)
            {

                if (fundingInfo.studyoption != null)
                {
                    lblstudy.Text = objCom.GetStudyOption(Convert.ToInt32(fundingInfo.studyoption));

                }
                if (fundingInfo.familymember != null)
                {
                    lblfamilymember.Text = objCom.GetFamilyMember(Convert.ToInt32(fundingInfo.familymember));
                }
                if (fundingInfo.accommodationplan != null)
                {
                    lblaccommodation.Text = objCom.GetAccomdation(Convert.ToInt32(fundingInfo.accommodationplan));
                }
                if (fundingInfo.managemeal != null)
                {
                    lblmanagemeal.Text = objCom.GetMeal(Convert.ToInt32(fundingInfo.managemeal));
                }
                if (fundingInfo.transportchoice != null)
                {
                    lbltransportchoice.Text = objCom.GetTransportChoice(Convert.ToInt32(fundingInfo.transportchoice));
                }
                if (fundingInfo.trips != null)
                {
                    lblTrips.Text = objCom.GetTrips(Convert.ToInt32(fundingInfo.trips));
                }

                if (fundingInfo.entertainment != null)
                {
                    lblentertainment.Text = objCom.GetEntertainment(Convert.ToInt32(fundingInfo.entertainment));
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
                case "Would you study-n-live alone or would your family members come along":
                    if (Comments[k].adminaction == 0)
                        rblstudyNo.Checked = true;
                    else
                        rblstudyYes.Checked = true;
                    lblstudyComments.Text = setComments(Comments[k]);
                    break;
                case "No of Family members":
                    if (Comments[k].adminaction == 0)
                        rblfamilymemberNo.Checked = true;
                    else
                        rblfamilymemberYes.Checked = true;
                    lblfamilymemberComments.Text = setComments(Comments[k]);
                    break;
                case "Select the kind of accommodation you plan to have":
                    if (Comments[k].adminaction == 0)
                        rblaccommodationNo.Checked = true;
                    else
                        rblaccommodationYes.Checked = true;
                    lblaccommodationComments.Text = setComments(Comments[k]);
                    break;
                case "Select the kind of accommodation you plan to have(Meal)":
                    if (Comments[k].adminaction == 0)
                        rblmanagemealNo.Checked = true;
                    else
                        rblmanagemealYes.Checked = true;
                    lblmanagemealComments.Text = setComments(Comments[k]);
                    break;
                case "Select your preferred choice of transport in the city":
                    if (Comments[k].adminaction == 0)
                        rbltransportchoiceNo.Checked = true;
                    else
                        rbltransportchoiceYes.Checked = true;
                    lbltransportchoiceComments.Text = setComments(Comments[k]);
                    break;
                case "No of Trips you plan to take to your home country in a year":
                    if (Comments[k].adminaction == 0)
                        rblTripsNo.Checked = true;
                    else
                        rblTripsYes.Checked = true;
                    lblTripsComments.Text = setComments(Comments[k]);
                    break;
                case "How often in a week do you typically go out (entertainment)":
                    if (Comments[k].adminaction == 0)
                        rblentertainmentNo.Checked = true;
                    else
                        rblentertainmentYes.Checked = true;
                    lblentertainmentComments.Text = setComments(Comments[k]);
                    break;
                default:
                    break;

            }
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
        }
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

    protected void btn_fundingdetails_Click(object sender, EventArgs e)
    {
        try
        {
            int ActionValue = 0;
            if (rbApproved.Checked)
                ActionValue = 1;
            else if (rbDenied.Checked)
                ActionValue = 2;
            objCom.SaveSupervisorComments(ApplicantID, universityID, formId, SupervisorID, txtComments.Text, ActionValue);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}