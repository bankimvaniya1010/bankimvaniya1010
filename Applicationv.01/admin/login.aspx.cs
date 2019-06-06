using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class admin_login : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            string encodedPassword = objCom.EncodePasswordToMD5(txt_pass.Text.ToString());
            var chkUser = (from usr in db.adminusers
                           where (usr.username.Equals(txtUser.Text.Trim()) && usr.password.Equals(encodedPassword))
                           select usr).FirstOrDefault();
            if (chkUser == null)
            {
                lbl_warning.Text = "Please enter valid user name and password.";
                pnl_warning.Visible = true;
            }
            else
            {
                pnl_warning.Visible = false;
                Session["LoginInfo"] = chkUser;
                Session["UserID"] = chkUser.adminid;
                Session["Role"] = chkUser.roleid;
                Response.Redirect(webURL + "admin/Default.aspx");              
               
            }
        }

        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}