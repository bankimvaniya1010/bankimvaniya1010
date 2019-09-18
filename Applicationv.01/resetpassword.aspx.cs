using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

public partial class Resetpassword : System.Web.UI.Page
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
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Visible = true;
            int otp = 0;
            if (oldpassword.Value != "")
                otp = Convert.ToInt32(oldpassword.Value);
            var login = db.students.Where(l => l.otp == otp && (l.ispasswordset==false || l.ispasswordset == null)).FirstOrDefault();
            if (login != null)
            {
                lblMessage.Visible = true;
                string password = newpassword.Value;
                login.password = objCom.EncodePasswordToMD5(password);
                login.ispasswordset = true;
                login.isverified = true;
                db.SaveChanges();
                universityID = Utility.GetUniversityId();
                var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/password.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "/Docs/" + Utility.GetUniversityId() + "/" + university.logo);
                html = html.Replace("@Name", login.name == "" ? "Hello" : login.name);
                html = html.Replace("@Email", login.email);
                html = html.Replace("@OTP", password);
                html = html.Replace("@Loginurl", webURL + "/login.aspx");
                objCom.SendMail(login.email.Trim(), html, System.Configuration.ConfigurationManager.AppSettings["PasswordReset"].ToString().Replace("@UniversityName", university.university_name));
                lblMessage.Text = "Password has been set and sent to your registered email address.";
            }
            else
            {
               
                lblMessage.Text = "Entered old password is not correct, Please write us for further support.";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
}