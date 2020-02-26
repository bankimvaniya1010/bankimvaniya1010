using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_managetransportchoice : System.Web.UI.Page
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
            var courseList = (from mt in db.managetransportchoice
                              join t in db.transportchoice on mt.transportchoice equals t.id
                              join c in db.citymaster on mt.cityid equals c.city_id
                              join curr in db.currency_master on mt.currencyid equals curr.id
                              select new
                              {
                                  id = mt.id,
                                  TransportChoicename = t.description,
                                  City = c.name,
                                  currency = curr.currency_symbol,
                                  amount = mt.amount,
                                  extra_adult_percentage = mt.extra_adult_percentage == null ? 0 : mt.extra_adult_percentage,
                                  extra_child_percentage = mt.extra_child_percentage == null ? 0 : mt.extra_child_percentage

                              }).ToList();
            if (courseList != null)
            {
                TransportChoiceGridView.DataSource = courseList;
                TransportChoiceGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void TransportChoiceGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(TransportChoiceGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/edittransportchoice.aspx?id=" + id);
    }

    protected void TransportChoiceGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        TransportChoiceGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}