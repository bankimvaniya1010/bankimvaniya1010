using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.IO;

public partial class register : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected string LoginURL = "";
    public string logourl = string.Empty;
    public string universityGTMCode = string.Empty;
    public int? noofregistered = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;
        universityGTMCode = university.university_gtm_code;
        if(university.numberof_applicant != null)
            noofregistered = university.numberof_applicant;
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        lblerror.Visible = false;
        Common objCom = new Common();
        students usrObj = new students();
        applicantdetails objapplicant = new applicantdetails();
        try
        {
            var registeredapplicant = db.applicantdetails.Where(x => x.universityid == universityID).ToList();
            if (noofregistered != 0 && registeredapplicant.Count >= noofregistered)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Number of applicant Exhausted. Contact your institution adminstrator')", true);
            }
            else
            {
                var existingUser = (from cats in db.students
                                    where cats.email.Equals(email.Value.Trim())
                                    select cats.email).FirstOrDefault();
                if (string.IsNullOrEmpty(existingUser))
                {
                    usrObj.name = name.Value.Trim();

                    usrObj.email = email.Value.Trim();
                    int otp = objCom.RandomNumber(100000, 999999);
                    usrObj.otp = otp;
                    usrObj.studylevelid = 1;

                    usrObj.verificationkey = Guid.NewGuid().ToString();
                    usrObj.isverified = false;
                    db.students.Add(usrObj);
                    db.SaveChanges();
                    var id = usrObj.studentid;
                    objapplicant.applicantid = id;
                    objapplicant.email = email.Value.Trim();

                    string[] nameArr = name.Value.Split(' ');
                    objapplicant.firstname = nameArr[0];
                    if (nameArr.Length > 1)
                        objapplicant.lastname = name.Value.Substring(nameArr[0].Length + 1);

                    universityID = Utility.GetUniversityId();
                    objapplicant.universityid = universityID;
                    db.applicantdetails.Add(objapplicant);
                    db.SaveChanges();
                    var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                    //sender email notification to university 
                    if (university.emai_notification1 != null)
                    {
                        sendNotification(university.emai_notification1, email.Value, id);
                    }

                    if (university.emai_notification2 != null)
                    {
                        sendNotification(university.emai_notification2, email.Value, id);
                    }
                    //end
                    string html = string.Empty;
                    string emailsubject = string.Empty;

                    if (university.full_service == 0)// if (Utility.GetUniversityId() == 13) exsisting now change acc #376
                    {
                        html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_direct_signupNotification.html"));
                        emailsubject = "Welcome to GTE-Direct Online Centre (GOC)";
                    }
                    else if (university.full_service == 1)
                    {
                        html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerconfirmationwithotp.html"));
                        emailsubject = "Application Centre Account Created Email";
                    }
                    else if (university.full_service == 2)
                    {
                        html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/assessment_signupNotification.html"));
                        emailsubject = "Your Assessment Centre Account has been created";
                    }

                    html = html.Replace("@UniversityName", university.university_name);
                    html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

                    html = html.Replace("@Name", name.Value == "" ? "Hello" : name.Value);
                    html = html.Replace("@Email", email.Value);
                    html = html.Replace("@OTP", otp.ToString());
                    LoginURL = webURL + "/login.aspx?active=1";
                    html = html.Replace("@activeLoginurl", LoginURL);
                    html = html.Replace("@Loginurl", webURL + "login.aspx");
                    html = html.Replace("@UniversityEmailID", university.email);
                    html = html.Replace("@UniversityChatID", university.chatid);
                    html = html.Replace("@UniversityMobileNumber", university.mobile);

                    objCom.SendMail(email.Value.Trim(), html, emailsubject);
                    webURL = "";
                    webURL = webURL + "registerconfimation.aspx?email=" + email.Value;
                    Response.Redirect(webURL, true);
                }
                else
                    lblerror.Visible = true;
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void sendNotification(string notificationemail, string studentemail,int studentid) {
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();

        string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerNotification.html"));
        html = html.Replace("@UniversityName", university.university_name);
        html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);
        
        html = html.Replace("@Email", studentemail);
        html = html.Replace("@studentid", Convert.ToString(studentid));
        objCom.SendMail(notificationemail, html, "New Applicant Registered");
    }
}