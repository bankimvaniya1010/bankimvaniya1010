using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_resetpassword : System.Web.UI.Page
{
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    public string logourl = string.Empty;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            string otp = string.Empty;
            if (oldpassword.Value != "")
                otp = objCom.EncodePasswordToMD5(oldpassword.Value);
            var adminlogin = db.adminusers.Where(l => l.password == otp).FirstOrDefault();
            if (adminlogin != null)
            {                
                string password = newpassword.Value;
                adminlogin.password = objCom.EncodePasswordToMD5(password);
                adminlogin.status = 1;
                db.SaveChanges();

                if (adminlogin.universityId == universityID)
                    Session["universityId"] = adminlogin.universityId;
                else
                    Session["universityId"] = universityID;

                Session["LoginInfo"] = adminlogin;
                Session["UserID"] = adminlogin.adminid;
                Session["Role"] = adminlogin.roleid;

                Response.Redirect(webURL + "admin/default.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Entered old password is not correct, Please write us for further support.";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}