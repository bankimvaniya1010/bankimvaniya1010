using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Managehealthinsurance : System.Web.UI.Page
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
            var courseList = (from mi in db.managehealth_insurance
                              join i in db.health_insurance on mi.insuranceid equals i.id
                              join c in db.citymaster on mi.cityid equals c.city_id
                              join curr in db.currency_master on mi.currencyid equals curr.id
                              select new
                              {
                                  id = mi.id,
                                  HealthInsurancename = i.description,
                                  City = c.name,
                                  currency = curr.currency_symbol,
                                  amount = mi.amount,
                                  extra_adult_amount = mi.extra_adult_amount == null ? 0 : mi.extra_adult_amount,
                                  extra_child_amount = mi.extra_child_amount == null ? 0 : mi.extra_child_amount

                              }).ToList();
            if (courseList != null)
            {
                HealthInsuranceGridView.DataSource = courseList;
                HealthInsuranceGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void HealthInsuranceGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(HealthInsuranceGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/edithealthinsurance.aspx?id=" + id);
    }

    protected void HealthInsuranceGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        HealthInsuranceGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}