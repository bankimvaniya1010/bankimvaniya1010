using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_managemealplan : System.Web.UI.Page
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
            var courseList = (from mp in db.managemealplan
                              join m in db.managemeal on mp.mealid equals m.id
                              join c in db.citymaster on mp.cityid equals c.city_id
                              join curr in db.currency_master on mp.currencyid equals curr.id
                              select new
                              {
                                  id = mp.id,
                                  Mealname = m.description,
                                  City = c.name,
                                  currency = curr.currency_symbol,
                                  amount = mp.amount,
                                  extra_adult_percentage = mp.extra_adult_percentage == null ? 0 : mp.extra_adult_percentage,
                                  extra_child_percentage = mp.extra_child_percentage == null ? 0 : mp.extra_child_percentage

                              }).ToList();
            if (courseList != null)
            {
                MealGridView.DataSource = courseList;
                MealGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void MealGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(MealGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/editmealplan.aspx?id=" + id);
    }

    protected void MealGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MealGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}