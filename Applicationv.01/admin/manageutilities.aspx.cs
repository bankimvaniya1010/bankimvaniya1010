using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_manageutilities : System.Web.UI.Page
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
            var courseList = (from mu in db.manageutilities
                              join u in db.utilities on mu.utilityid equals u.id
                              join c in db.citymaster on mu.cityid equals c.city_id
                              join curr in db.currency_master on mu.currencyid equals curr.id
                              select new
                              {
                                  id = mu.id,
                                  Utilitiesname = u.description,
                                  City = c.description,
                                  currency = curr.currency_symbol,
                                  amount = mu.amount,
                                  extra_adult_percentage = mu.extra_adult_percentage == null ? 0 : mu.extra_adult_percentage,
                                  extra_child_percentage = mu.extra_child_percentage == null ? 0 : mu.extra_child_percentage

                              }).ToList();
            if (courseList != null)
            {
                UtilitiesGridView.DataSource = courseList;
                UtilitiesGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void UtilitiesGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(UtilitiesGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/editutilities.aspx?id=" + id);
    }

    protected void UtilitiesGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UtilitiesGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}