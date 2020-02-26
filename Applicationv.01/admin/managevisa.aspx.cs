using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_managevisa : System.Web.UI.Page
{

    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
      
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var visaList = (from mv in db.managevisa
                            join c in db.citymaster on mv.cityid equals c.city_id
                            join v in db.visa on mv.visaid equals v.id
                              join curr in db.currency_master on mv.currencyid equals curr.id
                              select new
                              {
                                  id = mv.id,
                                  Visaname = v.description,
                                  City = c.name,
                                  currency = curr.currency_symbol,
                                  amount = mv.amount,
                                  extra_adult_amount= mv.extra_adult_amount==null ?0: mv.extra_adult_amount,
                                  extra_child_amount = mv.extra_child_amount == null ? 0 : mv.extra_child_amount
                              }).ToList();
            if (visaList != null)
            {
                VisaGridView.DataSource = visaList;
                VisaGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void VisaGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(VisaGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/editvisa.aspx?id=" + id);
    }

    protected void VisaGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        VisaGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}