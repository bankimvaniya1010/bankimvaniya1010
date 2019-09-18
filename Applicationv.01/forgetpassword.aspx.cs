using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.IO;

public partial class forgetpassword : System.Web.UI.Page
{
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var login = db.students.Where(l => l.email == email.Value).FirstOrDefault();
            if (login != null)
            {
                lblMessage.Visible = true;
                string password = System.Web.Security.Membership.GeneratePassword(8, 2);
                login.password = objCom.EncodePasswordToMD5(password);
                db.SaveChanges();
                universityID = Utility.GetUniversityId();
                var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/password.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "/Docs/" + login + "/" + university.logo);
                html = html.Replace("@Name", login.name == "" ? "Hello" : login.name);
                html = html.Replace("@Email", login.email);
                html = html.Replace("@OTP", password);
                html = html.Replace("@Loginurl", webURL + "/login.aspx");
                objCom.SendMail(login.email.Trim(), html, System.Configuration.ConfigurationManager.AppSettings["PasswordReset"].ToString().Replace("@UniversityName", university.university_name));
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