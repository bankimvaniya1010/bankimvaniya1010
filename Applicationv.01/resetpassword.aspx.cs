using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Resetpassword : System.Web.UI.Page
{
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    public string logourl = string.Empty;
    university_master university = new university_master();
    public string universityGTMCode = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;
        universityGTMCode = university.university_gtm_code;
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
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/password.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "/Docs/" + Utility.GetUniversityId() + "/" + university.logo);
                html = html.Replace("@Name", login.name == "" ? "Hello" : login.name);
                html = html.Replace("@Email", login.email);
                html = html.Replace("@OTP", password);
                html = html.Replace("@Loginurl", webURL + "login.aspx");
                objCom.SendMail(login.email.Trim(), html, "Password Reset Email");
                lblMessage.Text = "Password has been set and sent to your registered email address.";

                var isRecordPresent = db.applicantdetails.Any(x => x.applicantid == login.studentid && x.universityid == universityID);
                if (!isRecordPresent)
                {
                    applicantdetails objapplicant = new applicantdetails();
                    objapplicant.applicantid = login.studentid;
                    objapplicant.email = login.email.Trim();

                    string[] nameArr = login.name.Split(' ');
                    objapplicant.firstname = nameArr[0];
                    if (nameArr.Length > 1)
                        objapplicant.lastname = login.name.Substring(nameArr[0].Length + 1);

                    objapplicant.universityid = universityID;
                    db.applicantdetails.Add(objapplicant);
                    db.SaveChanges();
                }

                bool isDeclarationDoneByApplicant = false;
                bool isGteDeclarationDoneByApplicant;
                bool isProfileDetailsCompletedByApplicant;

                bool isFullService;
                bool isDeclarationCompleted;

                Session["LoginInfo"] = login;
                Session["UserID"] = login.studentid;
                Session["Role"] = "student";
                isGteDeclarationDoneByApplicant = objCom.IsGteDeclarationDoneByApplicant(login.studentid);
                isFullService = db.university_master.Where(x => x.universityid == universityID).Select(x => x.full_service).FirstOrDefault();

                if (isFullService)
                {
                    isDeclarationDoneByApplicant = objCom.IsDeclarationDoneByApplicant(login.studentid, universityID);
                    isDeclarationCompleted = isDeclarationDoneByApplicant;
                    isProfileDetailsCompletedByApplicant = objCom.SetStudentDetailsCompletedStatus(login.studentid, universityID);
                }
                else
                {
                    isDeclarationCompleted = isGteDeclarationDoneByApplicant;
                    isProfileDetailsCompletedByApplicant = objCom.SetGteStudentDetailsCompletedStatus(login.studentid, universityID);
                }

                Session["DeclarationDoneByApplicant"] = isDeclarationDoneByApplicant;
                Session["GteDeclarationDoneByApplicant"] = isGteDeclarationDoneByApplicant;
                Session["ProfileDetailsCompletedByApplicant"] = isProfileDetailsCompletedByApplicant;
                Session["FullService"] = isFullService;
                Session["DeclarationCompleted"] = isDeclarationCompleted;

                Response.Redirect(webURL + "default.aspx");
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