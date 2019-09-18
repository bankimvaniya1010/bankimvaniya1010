using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class updatepassword : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    protected static List<faq> allQuestions = new List<faq>();
    int userID = 0, universityID;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    students objstudents = new students();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack) {
            allQuestions = objCom.FaqQuestionList();
        }
        
    }
  
    protected void btnupdatepassword_Click(object sender, EventArgs e)
    {
        try
        {
            var existingPassword = objCom.EncodePasswordToMD5(txtexsistingpassword.Value);
            var existingUser = (from user in db.students
                                where user.studentid == userID && user.password == existingPassword
                                select user).SingleOrDefault();

            if (existingUser != null)
            {
                var password = objCom.EncodePasswordToMD5(txtconfirmpassword.Value.Trim());
                existingUser.password = password;
                db.SaveChanges();                
                lblMessage.Text = "Your Password has been changed!";
                lblMessage.Visible = true;
               
            }
            else
            {
                lblErrorMessage.Text = "Please enter valid existing Password.";
                lblErrorMessage.Visible = true;
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}