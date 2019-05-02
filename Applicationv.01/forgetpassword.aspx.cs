using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
public partial class forgetpassword : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try { 
        var login = db.user.Where(l => l.email == email.Value).FirstOrDefault();
        if (login != null)
        {
            lblMessage.Visible = true;
            string password = System.Web.Security.Membership.GeneratePassword(8, 2);
            login.password = objCom.EncodePasswordToMD5(password);
            db.SaveChanges();
            StringBuilder sb = new StringBuilder();
            sb.Append("Dear User, <br/>");
            sb.Append("Please find below new password to access of GTE Portal<br/><br/>");
            sb.Append("Password:" + password + "<br/><br/> ");
            sb.Append("Thank You<br/><br/>");
            objCom.SendMail(email.Value, sb.ToString(), "Password Reset");
            lblMessage.Text = "We have sent the password to above mentioned email address";
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "We don't have record for above mentioned email address, Please write us for further support.";
        }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}