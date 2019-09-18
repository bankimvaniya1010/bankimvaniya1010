using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class referencecheck : System.Web.UI.Page
{
    string referenceKey = "";
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        if ((Request.QueryString["referncekey"] != null) && (Request.QueryString["referncekey"] != ""))
            referenceKey = Convert.ToString(Request.QueryString["referncekey"]);
        else
            Response.Redirect("error.aspx", true);

        var RefInfo = (from pInfo in db.applicantreferencecheck
                       where pInfo.referncekey == referenceKey
                       select pInfo).FirstOrDefault();
        if (RefInfo == null)
            Response.Redirect("error.aspx", true);
        else
        {
            if (RefInfo.isverified == 1)
            {
                message.Visible = true;
                button.Visible = false;
                confirmation.Visible = false;
            }
            else
            {
                confirmation.Visible = true;
                button.Visible = true;
            }
        }
    }
    
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var RefInfo = (from pInfo in db.applicantreferencecheck
                           where pInfo.referncekey == referenceKey
                           select pInfo).FirstOrDefault();
            if (chkVerify.Checked)
                RefInfo.isverified = 1;
            else
                RefInfo.isverified = 1;
            RefInfo.referenceverifiedtime = DateTime.Now;
            db.SaveChanges();
            lblMessages.Visible = true;           
            button.Visible = false;
            confirmation.Visible = false;
        }
       
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}