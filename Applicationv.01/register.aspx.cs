using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
public partial class register : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourses();
            BindStudyLevel();
            rblYear1.Text = DateTime.Now.Year.ToString();
            rblYear2.Text = DateTime.Now.AddYears(1).Year.ToString();
            rblYear3.Text = DateTime.Now.AddYears(2).Year.ToString();
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Common objCom = new Common();
        students usrObj = new students();
        applicantdetails objapplicant = new applicantdetails();
        try
        {
            var existingUser = (from cats in db.students
                                where cats.username.Equals(username.Value.Trim())
                                select cats.username).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUser))
            {
                usrObj.name = name.Value.Trim();
                usrObj.username = username.Value.Trim();
                usrObj.password = objCom.EncodePasswordToMD5(password.Value.Trim());
                // usrObj.role = 3;
                usrObj.email = email.Value.Trim();
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.studylevelid = Convert.ToInt32(rblstudyLevel.SelectedValue);
                if (rblYear1.Checked)
                    usrObj.enrollmentyear = Convert.ToInt32(rblYear1.Text);
                else if (rblYear2.Checked)
                    usrObj.enrollmentyear = Convert.ToInt32(rblYear2.Text);
                else if (rblYear3.Checked)
                    usrObj.enrollmentyear = Convert.ToInt32(rblYear3.Text);

                usrObj.verificationkey = Guid.NewGuid().ToString();
                usrObj.isverified = false;
                db.students.Add(usrObj);
                db.SaveChanges();
                var id = usrObj.studentid;
                objapplicant.applicantid = id;
                // objapplicant = Convert.ToInt32(ddlUniversity.SelectedValue);
                objapplicant.email = email.Value.Trim();
                objapplicant.firstname = name.Value.Trim();
                db.applicantdetails.Add(objapplicant);
                db.SaveChanges();
                SaveCourses(id);
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + name.Value.Trim() + ",");
                webURL = webURL + "verifystudent.aspx?referencekey="+ usrObj.verificationkey;
                sb.Append("Thank You to register with us. We have sent a link to fill the personal details. Please fill the forms<br/>");
                sb.Append("Please login with below link <br/>" + webURL + " <br/>");
                sb.Append("Username:" + username.Value.Trim() + " <br/>");
                sb.Append("Password:" + password.Value.Trim() + " <br/>");
                sb.Append("Thank You GTE Backend Team");
                objCom.SendMail(email.Value.Trim(), sb.ToString(), "Registration with GTE");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your profile has been created and please login to view other steps')", true);
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
    private void BindCourses()
    {
        ListItem lst = new ListItem("Please select", "0");
        var courses = db.registrationcourses.ToList();
        lstCourse.DataSource = courses;
        lstCourse.DataTextField = "coursename";
        lstCourse.DataValueField = "courseid";
        lstCourse.DataBind();
        lstCourse.Items.Insert(0, lst);
    }
    private void BindStudyLevel()
    {

        var studyLevel = db.studylevelmaster.ToList();
        rblstudyLevel.DataSource = studyLevel;
        rblstudyLevel.DataTextField = "studylevel";
        rblstudyLevel.DataValueField = "studylevelid";
        rblstudyLevel.DataBind();

    }
    private void SaveCourses(int studentid)
    {
        for (int i = 0; i < lstCourse.Items.Count; i++)
        {
            studentcoursemapping objCourse = new studentcoursemapping();
            if (lstCourse.Items[i].Selected == true)
            {
                objCourse.studentid = studentid;
                objCourse.courseid = Convert.ToInt32(lstCourse.Items[i].Value);
                db.studentcoursemapping.Add(objCourse);
                db.SaveChanges();
            }

        }
    }
}