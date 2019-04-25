using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class admin_Default : System.Web.UI.Page
{
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL +"Login.aspx");
        if (Session["Role"].ToString() != "1")
        {
            //lblwarning.Text = "You are not authorised access this page";
            //pnlLink.Visible = false;
        }
    }
}