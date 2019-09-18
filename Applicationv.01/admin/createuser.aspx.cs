using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class createuser : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        { bindDropdown(); }
    }

    private void bindDropdown()
    {
        try
        {
            List<rolemaster> roleMaster = db.rolemaster.ToList();

        ddlRole.DataSource = roleMaster;
        ddlRole.DataBind();
        ddlRole.DataTextField = "rolename";
        ddlRole.DataValueField = "roleid";
        ddlRole.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Common objCom = new Common();
        adminusers usrObj = new adminusers();
        try
        {

            var existingUser = (from cats in db.adminusers
                                where cats.username.Equals(txtUsername.Value.Trim())
                                select cats.username).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUser))
            {
                usrObj.name = txtName.Value.Trim();
                usrObj.username = txtUsername.Value.Trim();
                usrObj.mobile = TxtMobile.Value.Trim();
                usrObj.password = objCom.EncodePasswordToMD5(Txtpassword.Value.Trim());
                usrObj.roleid = Convert.ToInt32(ddlRole.SelectedItem.Value);
                usrObj.email = txtEmail.Value.Trim();
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.status = 1;
                db.adminusers.Add(usrObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username already available')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}