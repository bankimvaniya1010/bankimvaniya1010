using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    int roleid = 0;
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleid = Convert.ToInt32(Session["Role"].ToString());
        string name = db.adminusers.Where(x => x.roleid == roleid).Select(x => x.name).FirstOrDefault();
        lbladminname.Text = name;
    }
   
}
