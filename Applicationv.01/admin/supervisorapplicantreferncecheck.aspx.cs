using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorapplicantreferncecheck : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string Name = "", Email = "", Mobile = "";
    protected string NameTooltips = "", EmailTooltips = "", MobileTooltips = "";
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected List<admincomments> Comments = new List<admincomments>();
    protected List<applicantreferencecheck> referenccheckList = new List<applicantreferencecheck>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
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
        referenccheckList = db.applicantreferencecheck.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();
        SetControlsUniversitywise();
       
        Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        if (!IsPostBack)
        {
            PopulateSupervisorComments();
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
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
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

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
                    case "NAME":
                        Name = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        Mobile = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL":
                        Email = setInnerHtml(fields[k]);
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

    protected void btnReference_Click(object sender, EventArgs e)
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