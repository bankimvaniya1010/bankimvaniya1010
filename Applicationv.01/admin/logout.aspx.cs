using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_logout : System.Web.UI.Page
{
    Logger objLog = new Logger();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        Session["universityId"] = null;
        Session["universityName"] = null;

        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        try
        {
            Session.Clear();
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

        Response.Redirect(webURL + "admin/login.aspx");
    }
}