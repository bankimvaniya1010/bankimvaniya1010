using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantfunding : System.Web.UI.Page
{
    int formId = 0;
    Common objCom = new Common();
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

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
            SetAdminComments();
            PopulateFundingDetails();
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
                    txtstudy.Value = setComments(Comments[k]);
                    break;
                case "No of Family members":
                    txtfamilymember.Value = setComments(Comments[k]);
                    break;
                case "Select the kind of accommodation you plan to have":
                    txtaccommodation.Value = setComments(Comments[k]);
                    break;
                case "Select the kind of accommodation you plan to have(Meal)":
                    txtmanagemeal.Value = setComments(Comments[k]);
                    break;
                case "Select your preferred choice of transport in the city":
                    txttransportchoice.Value = setComments(Comments[k]);
                    break;
                case "No of Trips you plan to take to your home country in a year":
                    txtTrips.Value = setComments(Comments[k]);
                    break;
                case "How often in a week do you typically go out (entertainment)":
                    txtentertainment.Value = setComments(Comments[k]);
                    break;
                default:
                    break;

            }

        }
    }
    protected void btn_fundingdetails_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {

            adminInputs.Add("Would you study-n-live alone or would your family members come along", txtstudy.Value.Trim());
            adminInputs.Add("No of Family members", txtfamilymember.Value.Trim());
            adminInputs.Add("Select the kind of accommodation you plan to have", txtaccommodation.Value.Trim());
            adminInputs.Add("Select the kind of accommodation you plan to have(Meal)", txtmanagemeal.Value.Trim());
            adminInputs.Add("Select your preferred choice of transport in the city", txttransportchoice.Value.Trim());
            adminInputs.Add("No of Trips you plan to take to your home country in a year", txtTrips.Value.Trim());
            adminInputs.Add("How often in a week do you typically go out (entertainment) ", txtentertainment.Value.Trim());
           
            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(userID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(userID, universityID, formId, userID, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}