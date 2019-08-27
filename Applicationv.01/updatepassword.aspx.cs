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
    int userID = 0, universityID;
   
    students objstudents = new students();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        
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
                txtexsistingpassword.Value = "";
                lblMessage.Text = "Your Password has been changed!";
                lblMessage.Visible = true;
               
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please check your Exsisting Password.')", true);
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}