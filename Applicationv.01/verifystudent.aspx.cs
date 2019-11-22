using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifystudent : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected string LoginURL = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null)
            {
                string referenceKey = Request.QueryString["key"];
                students student = db.students.Where(obj => obj.verificationkey == referenceKey).FirstOrDefault();

                if (student != null)
                {
                    if (student.isverified)
                    {
                        afterVerfication.Visible = false;
                        verified.Visible = true;
                    }
                    else
                    {
                        student.isverified = true;
                        db.SaveChanges();
                        universityID = Utility.GetUniversityId();
                        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                        string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerconfirmationwithotp.html"));
                        html = html.Replace("@UniversityName", university.university_name);
                        html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);
                        //html = html.Replace("@universityLogo", "http://edu.applydirect.online/assets/dashboard/img/aiwt-logo.jpg");

                        html = html.Replace("@Name", student.name == "" ? "Hello" : student.name);
                        html = html.Replace("@Email", student.email);
                        html = html.Replace("@OTP", student.otp.ToString());
                        if (student.ispasswordset == true)
                            LoginURL = webURL + "/login.aspx";
                        else
                            LoginURL = webURL + "/login.aspx?active=1";
                        html = html.Replace("@Loginurl", LoginURL);
                        objCom.SendMail(student.email.Trim(), html, System.Configuration.ConfigurationManager.AppSettings["ActivationSubject"].ToString().Replace("@UniversityName", university.university_name));

                        verified.Visible = false;
                        afterVerfication.Visible = true;
                    }

                }
                else
                    Response.Redirect(webURL + "login.aspx");
            }
            else
                Response.Redirect(webURL + "login.aspx");
        }
    }
}