using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_manageentertainment : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var courseList = (from me in db.manageentertainment
                              join e in db.entertainment on me.entertainmentid equals e.id
                              join c in db.citymaster on me.cityid equals c.city_id
                              join curr in db.currency_master on me.currencyid equals curr.id
                              select new
                              {
                                  id = me.id,
                                  Entertainmentname = e.description,
                                  City = c.description,
                                  currency = curr.currency_symbol,
                                  amount = me.amount,
                                  extra_adult_percentage = me.extra_adult_percentage == null ? 0 : me.extra_adult_percentage,
                                  extra_child_percentage = me.extra_child_percentage == null ? 0 : me.extra_child_percentage

                              }).ToList();
            if (courseList != null)
            {
                EntertainmentGridView.DataSource = courseList;
                EntertainmentGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void EntertainmentGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(EntertainmentGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/editentertainment.aspx?id=" + id);
    }

    protected void EntertainmentGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        EntertainmentGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}