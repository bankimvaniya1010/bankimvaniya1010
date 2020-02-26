using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_manageaccomdation : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
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
            var courseList = (from am in db.manageaccomdationplan
                              join a in db.accommodationplan on am.accomdationid equals a.id
                              join c in db.citymaster on am.cityid equals c.city_id
                              join curr in db.currency_master on am.currencyid equals curr.id
                              select new
                              {
                                  id = am.id,
                                  Accomdationname = a.description,
                                  City = c.name,
                                  currency = curr.currency_symbol,
                                  amount = am.amount,
                                  extra_adult_percentage = am.extra_adult_percentage == null ? 0 : am.extra_adult_percentage,
                                  extra_child_percentage = am.extra_child_percentage == null ? 0 : am.extra_child_percentage
                              }).ToList();
            if (courseList != null)
            {
                AccomdationGridView.DataSource = courseList;
                AccomdationGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void AccomdationGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(AccomdationGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/editmanageaccomdation.aspx?id=" + id);
    }

    protected void AccomdationGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        AccomdationGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}