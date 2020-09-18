using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    string webURL = String.Empty;
    public int isfullservice;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        isfullservice =  (int)Session["isfullservice"];
        if (isfullservice == 1)
            isfullservicethenlbl.Text = "TO THE APPLICATION CENTER";
        else if (isfullservice == 0)
            isfullservicethenlbl.Text = "TO THE GTE DIRECT ONLINE CENTER (GOC)";
        else if (isfullservice == 2)
            isfullservicethenlbl.Text = "TO THE ASSESSMENT CENTER";

    }
}