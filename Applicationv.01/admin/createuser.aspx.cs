using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class createuser : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string roleName = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);


        if (!IsPostBack)
        { bindDropdown(); }
    }

    private void bindDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic roleMaster = db.rolemaster.ToList();

            ddlRole.DataSource = roleMaster;
            ddlRole.DataBind();
            ddlRole.DataTextField = "rolename";
            ddlRole.DataValueField = "roleid";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, lst);
            if (roleName.ToLower() == "university")
            {
                ListItem removeListItem = ddlRole.Items.FindByText("Admin");
                ddlRole.Items.Remove(removeListItem);
            }
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
            int selectedrole = Convert.ToInt32(ddlRole.SelectedValue);
            var existingUser = (from cats in db.adminusers
                                where (cats.username == txtUsername.Value.Trim() && cats.email == txtEmail.Value && cats.roleid == selectedrole)
                                select cats).SingleOrDefault();                              
                                
            if (existingUser != null)
            {
                usrObj.name = txtName.Value.Trim();
                usrObj.username = txtUsername.Value.Trim();
                usrObj.mobile = TxtMobile.Value.Trim();
                usrObj.password = objCom.EncodePasswordToMD5(Txtpassword.Value.Trim());
                usrObj.roleid = Convert.ToInt32(ddlRole.SelectedItem.Value);
                usrObj.email = txtEmail.Value.Trim();
                usrObj.universityId = Utility.GetUniversityId();
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.status = 1;
                db.adminusers.Add(usrObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username with entered email already available')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}