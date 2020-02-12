using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_forgetpassword : System.Web.UI.Page
{
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    public string logourl = string.Empty;
    university_master university = new university_master();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;        
        if (!IsPostBack)
            bindRole();
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            int roleId = Convert.ToInt32(ddlrole.SelectedValue);
            var adminlogin = db.adminusers.Where(l => l.email == email.Value && l.roleid == roleId && l.universityId == universityID).FirstOrDefault();
            if (adminlogin != null)
            {
                lblMessage.Visible = true;
                string password = System.Web.Security.Membership.GeneratePassword(8, 2);
                adminlogin.password = objCom.EncodePasswordToMD5(password);
                adminlogin.status = 0;
                db.SaveChanges();

                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/password.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "/Docs/" + Utility.GetUniversityId() + "/" + university.logo);
                html = html.Replace("@Name", adminlogin.name);
                html = html.Replace("@Email", adminlogin.username);
                html = html.Replace("@OTP", password);
                html = html.Replace("@Loginurl", webURL + "admin/login.aspx");
                objCom.SendMail(adminlogin.email.Trim(), html, "Password Reset Email");

                lblMessage.Text = "We have sent the password to above mentioned email address";
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "We don't have record for above mentioned email address and selected role, Please write us for further support.";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindRole()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic roleMaster = db.rolemaster.ToList();

            ddlrole.DataSource = roleMaster;
            ddlrole.DataBind();
            ddlrole.DataTextField = "rolename";
            ddlrole.DataValueField = "roleid";
            ddlrole.DataBind();
            ddlrole.Items.Insert(0, lst);
            ListItem removeListItem = ddlrole.Items.FindByText("Admin");
            ddlrole.Items.Remove(removeListItem);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

}