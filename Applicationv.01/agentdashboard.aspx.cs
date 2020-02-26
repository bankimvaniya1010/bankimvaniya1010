using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (adminusers)Session["LoginInfo"];
        userID = objUser.adminid;
        if (!IsPostBack)
            BindService();

    }

    protected void gridApplication_DataBinding(object sender, EventArgs e)
    {

    }

    

    private void BindService()
    {
        try
        {
            var applicantList = (from a in db.applicantdetails
                                where a.agentid== userID
                                 select new
                                 {
                                     applicantid = a.applicantid,
                                     name = a.firstname,
                                     email = a.email,
                                     passport_no = a.passportno
                                    
                                 }).ToList();
            if (applicantList != null)
            {
                gvApplicant.DataSource = applicantList;
                gvApplicant.DataBind();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
}