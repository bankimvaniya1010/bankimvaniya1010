using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_proctormasterListing : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }
    private void BindGrid()
    {
        try
        {
            var List = (from am in db.proctor_master
                        join a in db.countriesmaster on am.country equals a.id
                        join c in db.citymaster on am.city equals c.city_id
                        select new
                        {
                            id = am.proctorID,
                            name = am.name,
                            email = am.email,
                            mobile = am.mobile,
                            country = a.country_name,
                            City = c.name,
                            timezone = am.timezone,
                        }).ToList();
            if (List != null)
            {
                ProctorGridView.DataSource = List;
                ProctorGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void ProctorGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ProctorGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}