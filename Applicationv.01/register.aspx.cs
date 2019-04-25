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
            rblYear1.Text = DateTime.Now.Year.ToString();
            rblYear2.Text = DateTime.Now.AddYears(1).Year.ToString();
            rblYear3.Text = DateTime.Now.AddYears(2).Year.ToString();
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Common objCom = new Common();
        user usrObj = new user();
        applicantdetails objapplicant = new applicantdetails();
        try
        {

            var existingUser = (from cats in db.user
                                where cats.username.Equals(username.Value.Trim())
                                select cats.username).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUser))
            {
                usrObj.name = name.Value.Trim();
                usrObj.username = username.Value.Trim();
                usrObj.password = objCom.EncodePasswordToBase64(password.Value.Trim());
                usrObj.role = 3;
                usrObj.email = email.Value.Trim();
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.status = 1;
                if (rblYear1.Checked)
                    usrObj.year = Convert.ToInt32(rblYear1.Text);
                else if (rblYear2.Checked)
                    usrObj.year = Convert.ToInt32(rblYear2.Text);

                usrObj.year = Convert.ToInt32(rblYear3.Text);
                if(ddlDegree.SelectedValue!="")
                usrObj.degreeid = Convert.ToInt32(ddlDegree.SelectedValue);
                if (ddlCourse.SelectedValue != "")
                    usrObj.courseid = Convert.ToInt32(ddlCourse.SelectedValue);
                db.user.Add(usrObj);
                db.SaveChanges();
                var id = usrObj.userid;
                objapplicant.applicantid = id;
                // objapplicant = Convert.ToInt32(ddlUniversity.SelectedValue);
                objapplicant.email = email.Value.Trim();
                objapplicant.firstname = name.Value.Trim();
                db.applicantdetails.Add(objapplicant);
                db.SaveChanges();
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + name.Value.Trim() + ",");
                webURL = webURL + "login.aspx";
                sb.Append("Thank You to register with us We have sent a link to fill the personal details. Please fill the forms<br/>");
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
        var courses = db.coursemaster.ToList();
        ddlCourse.DataSource = courses;
        ddlCourse.DataTextField = "coursename";
        ddlCourse.DataValueField = "courseid";
        ddlCourse.DataBind();
        ddlCourse.Items.Insert(0, lst);
    }
}