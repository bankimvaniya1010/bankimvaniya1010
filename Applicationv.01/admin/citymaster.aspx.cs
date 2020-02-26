using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_citymaster : System.Web.UI.Page
{
    Common objCommon = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int countryID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            objCommon.BindCountries(ddlCountry);
            if(Request.QueryString["countryID"] != null)
            {
                if (Int32.TryParse(Request.QueryString["countryID"], out countryID))
                {
                    ddlCountry.SelectedIndex = countryID;
                    BindGrid(countryID);
                }
            }
        }
    }

    protected void cityGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int cityId = Convert.ToInt32(cityGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/editcitydetails.aspx?cityID=" + cityId);
    }

    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        int countryID = Convert.ToInt32(ddlCountry.SelectedValue);
        BindGrid(countryID);
    }

    private void BindGrid(int countryID)
    {
        try
        {
            var citiesList = (from cm in db.citymaster
                                where cm.country_id == countryID
                                select new
                                {
                                    cityID = cm.city_id,
                                    cityName = cm.name,
                                    description = cm.description,
                                    costOfLiving = cm.cost_of_living,
                                    cityAround = cm.around,
                                    weather = cm.weather
                                }).ToList();
            if (citiesList != null)
            {
                cityGridView.DataSource = citiesList;
                cityGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnCreateCity_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/createcity.aspx");
    }

    protected void cityGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        cityGridView.PageIndex = e.NewPageIndex;
        BindGrid(countryID);
    }
}