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
    string webURL = String.Empty;
    public string isfullservicethenlbl = string.Empty, studlogin;
    int universityID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (universityID == -1)
        {
            Response.Redirect(Request.Url.Host.ToLower().ToString(), true);
            return;
        }
        else
            Session["universityId"] = universityID;
        int isfullservice = (int)Session["isfullservice"];

        if (isfullservice == 0)
            isfullservicethenlbl = " GTE DIRECT CENTRE";
        else if (isfullservice == 1)
            isfullservicethenlbl = " APPLICATION CENTRE";
        else if (isfullservice == 2)
            isfullservicethenlbl = " ASSESSMENT CENTRE";
        studlogin = webURL + "login.aspx";
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            string encodedPassword = objCom.EncodePasswordToMD5(txt_pass.Text.ToString());
            int universityID = Utility.GetUniversityId();
            var chkUser = (from usr in db.adminusers
                           where (usr.username.Equals(txtUser.Text.Trim()) && usr.password.Equals(encodedPassword))
                           select usr).FirstOrDefault();
            if (chkUser == null)
            {
                lbl_warning.Text = "Please enter valid user name and password.";
                pnl_warning.Visible = true;
            }
            else if (!(chkUser.rolemaster.rolename.ToUpper() == "ADMIN") && chkUser.universityId != universityID)
            {
                lbl_warning.Text = "Please Log on to correct admin portal.";
                pnl_warning.Visible = true;
            }
            else
            {
                if (chkUser.status == 0)
                    Response.Redirect(webURL + "admin/resetpassword.aspx", true);
                else
                {

                    if (chkUser.universityId == universityID)
                        Session["universityId"] = chkUser.universityId;
                    else
                        Session["universityId"] = universityID;

                    pnl_warning.Visible = false;
                    Session["LoginInfo"] = chkUser;
                    Session["UserID"] = chkUser.adminid;
                    Session["Role"] = chkUser.roleid;
                    Response.Redirect(webURL + "admin/default.aspx");
                }
            }
        }

        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}