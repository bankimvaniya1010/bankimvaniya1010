using System;
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
    protected int isStudyBefore = 0, isApplyBefore = 0;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
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
            userID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, userID, CustomControls, mainDiv);

            PopulateFundingDetails();
        }
    }



    private void PopulateFundingDetails()
    {
        try
        {
            var fundingInfo = (from fInfo in db.applicantfundingmaster
                               where fInfo.applicantid == userID && fInfo.universityid == universityID
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


}