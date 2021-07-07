﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

public partial class forgetpassword : System.Web.UI.Page
{
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    public string logourl = string.Empty;
    public string universityGTMCode = string.Empty;
    university_master university = new university_master();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;
        universityGTMCode = university.university_gtm_code;
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var login = db.students.Where(l => l.email == email.Value).FirstOrDefault();
            if (login != null && !login.isverified)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Account is not activated. Please use OTP sent to your registered mail to activate your account.";
            }
            else if (login != null)
            {
                lblMessage.Visible = true;
                string password = System.Web.Security.Membership.GeneratePassword(8, 2);
                login.password = objCom.EncodePasswordToMD5(password);
                db.SaveChanges();

                string servicename = string.Empty;
                string statement = string.Empty;
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/password.html"));

                if (university.full_service == 2)
                {
                    servicename = "Assessment";
                    statement = "login";
                }
                else
                {
                    servicename = "Application";
                    statement = "start your application, continue an existing application, upload additional documents or check the status of a previously-submitted application.";
                }
                var subject = "Password Reset Email";
                if (university.full_service == 0)
                    subject = "GTE Direct : Password Reset Email";

                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "/Docs/" + Utility.GetUniversityId() + "/" + university.logo);
                html = html.Replace("@Name", login.name == "" ? "Hello" : login.name);
                html = html.Replace("@Email", login.email);
                html = html.Replace("@OTP", password);
                html = html.Replace("@servicename", servicename);
                html = html.Replace("@statement", statement);

                html = html.Replace("@Loginurl", webURL + "login.aspx");
                if (university.full_service == 0)
                    html = html.Replace("@team", "GTE Direct Team");
                else
                    html = html.Replace("@team", "The " + servicename + "Centres Team");

                objCom.SendMail(login.email.Trim(), html, subject);

                //string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/password.html"));
                //html = html.Replace("@UniversityName", university.university_name);
                //html = html.Replace("@universityLogo", webURL + "/Docs/" + login + "/" + university.logo);
                //html = html.Replace("@Name", login.name == "" ? "Hello" : login.name);
                //html = html.Replace("@Email", login.email);
                //html = html.Replace("@OTP", password);
                //html = html.Replace("@Loginurl", webURL + "login.aspx");
                //objCom.SendMail(login.email.Trim(), html, "Password Reset Email");
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