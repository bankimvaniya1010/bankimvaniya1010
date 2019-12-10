using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    int adminID = 0 , roleid = 0;    
    string webURL = String.Empty;
    public string roleName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        
        adminID = Convert.ToInt32(Session["UserID"].ToString());
        string name = db.adminusers.Where(x => x.adminid == adminID).Select(x => x.name).FirstOrDefault();       
        lbladminname.Text = name;
        
        roleName = Utility.GetRoleName();
    }

}
