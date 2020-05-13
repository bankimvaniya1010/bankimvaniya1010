using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_updatepassword : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int userID = 0, universityID = 0, roleID = 0;
    string webURL = String.Empty;    

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        var objUser = (adminusers)Session["LoginInfo"];
        userID = objUser.adminid;
        roleID = objUser.roleid;
        if (!IsPostBack)
        {            
        }

    }

    protected void btnupdatepassword_Click(object sender, EventArgs e)
    {
        try
        {
            var existingPassword = objCom.EncodePasswordToMD5(txtexsistingpassword.Value);
            var existingUser = (from user in db.adminusers
                                where user.adminid == userID && user.roleid == roleID && user.password == existingPassword
                                select user).SingleOrDefault();

            if (existingUser != null)
            {
                var password = objCom.EncodePasswordToMD5(txtconfirmpassword.Value.Trim());
                existingUser.password = password;
                db.SaveChanges();
                lblMessage.Text = "Your Password has been changed!";
                lblMessage.Visible = true;

            }
            else
            {
                lblErrorMessage.Text = "Please enter valid existing Password.";
                lblErrorMessage.Visible = true;
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}