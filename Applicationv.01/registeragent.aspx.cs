using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class registeragent : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Common objCom = new Common();
        adminusers usrObj = new adminusers();
        applicantdetails objapplicant = new applicantdetails();
        try
        {

            var existingUser = (from cats in db.adminusers
                                where cats.username.Equals(username.Value.Trim())
                                select cats.username).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUser))
            {
                usrObj.name = name.Value.Trim();
                usrObj.username = username.Value.Trim();
                usrObj.password = objCom.EncodePasswordToMD5(password.Value.Trim());
                usrObj.roleid = 2;
                usrObj.email = email.Value.Trim();
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.status = 1;
               
                  
                db.adminusers.Add(usrObj);
                db.SaveChanges();
              
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + name.Value.Trim() + ",");
                webURL = webURL + "login.aspx";
                sb.Append("Thank You to register with us.<br/>");
                //sb.Append("Please login with below link <br/>" + webURL + " <br/>");
                sb.Append("Username:" + username.Value.Trim() + " <br/>");
                sb.Append("Password:" + password.Value.Trim() + " <br/>");
                sb.Append("Thank You GTE Backend Team");
                objCom.SendMail(email.Value.Trim(), sb.ToString(), "Registration with GTE");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your profile has been created')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username already taken try with something else')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}