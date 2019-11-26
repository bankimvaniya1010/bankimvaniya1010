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
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected string LoginURL = "";
    public string logourl = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;        
        //string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerconfirmationemail.html"));
        if (!IsPostBack)
        {
            // BindCourses();
            // BindStudyLevel();
            //rblYear1.Text = DateTime.Now.Year.ToString();
            //rblYear2.Text = DateTime.Now.AddYears(1).Year.ToString();
            //rblYear3.Text = DateTime.Now.AddYears(2).Year.ToString();
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        lblerror.Visible = false;
        Common objCom = new Common();
        students usrObj = new students();
        applicantdetails objapplicant = new applicantdetails();
        try
        {
            var existingUser = (from cats in db.students
                                where cats.email.Equals(email.Value.Trim())
                                select cats.email).FirstOrDefault();
            if (string.IsNullOrEmpty(existingUser))
            {
                usrObj.name = name.Value.Trim();

                // string password = RandomPassword(8);
                // usrObj.password = objCom.EncodePasswordToMD5(password);
                // usrObj.role = 3;
                usrObj.email = email.Value.Trim();
                int otp = objCom.RandomNumber(100000, 999999);
                usrObj.otp = otp;
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.studylevelid = 1;// Convert.ToInt32(rblstudyLevel.SelectedValue);
                //if (rblYear1.Checked)
                //    usrObj.enrollmentyear = Convert.ToInt32(rblYear1.Text);
                //else if (rblYear2.Checked)
                //    usrObj.enrollmentyear = Convert.ToInt32(rblYear2.Text);
                //else if (rblYear3.Checked)
                //    usrObj.enrollmentyear = Convert.ToInt32(rblYear3.Text);

                usrObj.verificationkey = Guid.NewGuid().ToString();
                usrObj.isverified = false;
                db.students.Add(usrObj);
                db.SaveChanges();
                var id = usrObj.studentid;
                objapplicant.applicantid = id;
                // objapplicant = Convert.ToInt32(ddlUniversity.SelectedValue);
                objapplicant.email = email.Value.Trim();

                string[] nameArr = name.Value.Split(' ');
                objapplicant.firstname = nameArr[0];
                if(nameArr.Length > 1)
                    objapplicant.lastname = name.Value.Substring(nameArr[0].Length + 1);

                universityID = Utility.GetUniversityId();
                objapplicant.universityid = universityID;
                //objapplicant.middlename = mname.Value.Trim();
                //objapplicant.lastname = lname.Value.Trim();
                db.applicantdetails.Add(objapplicant);
                db.SaveChanges();
                // SaveCourses(id);
                var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                //string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerconfirmationemail.html"));
                //html = html.Replace("@UniversityName", university.university_name);
                //html = html.Replace("@universityLogo", webURL + "/Docs/" + universityID + "/" + university.logo);
                //html = html.Replace("@Name", name.Value == "" ? "Hello" : name.Value);
                //html = html.Replace("@Email", email.Value);

                //webURL = webURL + "verifystudent.aspx?key=" + usrObj.verificationkey;
                //html = html.Replace("@url", webURL);
                //html = html.Replace("@Loginurl", webURL + "/login.aspx");
                //webURL = "";
                //webURL = webURL + "registerconfimation.aspx?email="+ email.Value;

                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerconfirmationwithotp.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);
                //html = html.Replace("@universityLogo", "http://edu.applydirect.online/assets/dashboard/img/aiwt-logo.jpg");

                html = html.Replace("@Name", name.Value == "" ? "Hello" : name.Value);
                html = html.Replace("@Email", email.Value);
                html = html.Replace("@OTP", otp.ToString());
                LoginURL = webURL + "/login.aspx?active=1";
                html = html.Replace("@Loginurl", LoginURL);
                html = html.Replace("@UniversityEmailID", university.email);
                html = html.Replace("@UniversityChatID", university.chatid);
                html = html.Replace("@UniversityMobileNumber", university.mobile);

                objCom.SendMail(email.Value.Trim(), html, System.Configuration.ConfigurationManager.AppSettings["ActivationSubject"].ToString());
                webURL = "";
                webURL = webURL + "registerconfimation.aspx?email=" + email.Value;
                Response.Redirect(webURL, true);
            }

            else
            {
                lblerror.Visible = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void BindCourses()
    {
        //ListItem lst = new ListItem("Please select", "0");
        //var courses = db.registrationcourses.ToList();
        //lstCourse.DataSource = courses;
        //lstCourse.DataTextField = "coursename";
        //lstCourse.DataValueField = "courseid";
        //lstCourse.DataBind();
        //lstCourse.Items.Insert(0, lst);
    }
    private void BindStudyLevel()
    {

        //var studyLevel = db.studylevelmaster.ToList();
        //rblstudyLevel.DataSource = studyLevel;
        //rblstudyLevel.DataTextField = "studylevel";
        //rblstudyLevel.DataValueField = "studylevelid";
        //rblstudyLevel.DataBind();

    }
    private void SaveCourses(int studentid)
    {
        //for (int i = 0; i < lstCourse.Items.Count; i++)
        //{
        //    studentcoursemapping objCourse = new studentcoursemapping();
        //    if (lstCourse.Items[i].Selected == true)
        //    {
        //        objCourse.studentid = studentid;
        //        objCourse.courseid = Convert.ToInt32(lstCourse.Items[i].Value);
        //        db.studentcoursemapping.Add(objCourse);
        //        db.SaveChanges();
        //    }

        //}
    }

    
}