using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantvisa : System.Web.UI.Page
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
            PopulateVisaInfo();
        }
    }



    private void PopulateVisaInfo()
    {
        try
        {
            var VisaInfo = (from pInfo in db.applicantvisadetails
                            where pInfo.applicantid == userID && pInfo.universityid == universityID
                            select pInfo).FirstOrDefault();
            if (VisaInfo != null)
            {
                if (VisaInfo.hasvisa == 1)
                    lblHaveVisa.Text = "Yes";
                else if (VisaInfo.hasvisa == 2)
                    lblHaveVisa.Text = "No - I will need to apply for an international student visa";
                if (VisaInfo.applicantvisatype != null)
                {
                    lblvisa.Text = objCom.GetVisaType(Convert.ToInt32(VisaInfo.applicantvisatype));

                }
                if (VisaInfo.validityfrom != null)
                    lblvalidityFrom.Text = Convert.ToDateTime(VisaInfo.validityfrom).ToString("yyyy-MM-dd");
                if (VisaInfo.validityto != null)
                    lblvalidityTo.Text = Convert.ToDateTime(VisaInfo.validityto).ToString("yyyy-MM-dd");
                lblvisano.Text = VisaInfo.visano;
                if (VisaInfo.firstvisit != null)
                    lblfirstvisit.Text = Convert.ToDateTime(VisaInfo.firstvisit).ToString("yyyy-MM-dd");
                lblvisacity.Text = VisaInfo.city;
                if (VisaInfo.visaapplied == 1)
                    lblvisaapplied.Text = "Country where the college is located";
                else if (VisaInfo.visaapplied == 2)
                    lblvisaapplied.Text = "Offshore";
                if (VisaInfo.country != null)
                {
                    lblvisacountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.country));

                }
                if (VisaInfo.havelivedearlier == 1)
                    lblPreviuosstay.Text = "Yes";
                else if (VisaInfo.havelivedearlier == 2)
                    lblPreviuosstay.Text = "No";
                if (VisaInfo.haveparent == 1)
                    lblparent.Text = "Yes";
                else if (VisaInfo.haveparent == 2)
                    lblparent.Text = "No";
                if (VisaInfo.isvisadenied == 1)
                    lblDeniedVisa.Text = "Yes";
                else if (VisaInfo.isvisadenied == 2)
                    lblDeniedVisa.Text = "No";
                if (VisaInfo.isparentvisadenied == 1)
                    lblparentdeny.Text = "Yes";
                else if (VisaInfo.isparentvisadenied == 2)
                    lblparentdeny.Text = "No";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }



}