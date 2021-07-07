using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editcitydetails : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        
        if (!IsPostBack)
        {
            if (Request.QueryString["cityID"] != null)
            {
                int cityID;
                if (!Int32.TryParse(Request.QueryString["cityID"], out cityID))
                    Response.Redirect(webURL + "admin/default.aspx");

                citymaster existingCity = db.citymaster.Where(obj => obj.city_id == cityID).First();

                if (existingCity != null)
                {
                    ddlCountry.Enabled = false;
                    ddlCountry.Attributes.Add("class", "form-control");
                    objCommon.BindCountries(ddlCountry);
                    populate(existingCity);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('City does not exists')", true);

            }
            else
                Response.Redirect(webURL + "admin/default.aspx");
        }
    }
    private void populate(citymaster existingCity) {
        try {

            txtCityAround.Value = existingCity.around;
            txtCityDescription.Value = existingCity.description;
            txtCityName.Value = existingCity.name;
            txtCityWeather.Value = existingCity.weather;
            txtCityReaching.Value = existingCity.geting_there;
            txtCityCost.Value = existingCity.cost_of_living;
            if (existingCity.country_id != null)
            {
                ddlCountry.ClearSelection();
                ddlCountry.Items.FindByValue(existingCity.country_id.ToString()).Selected = true;

            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int cityID;
        if (!Int32.TryParse(Request.QueryString["cityID"], out cityID))
            Response.Redirect(webURL + "admin/default.aspx");
        
        citymaster cityObj = db.citymaster.Where(x => x.city_id == cityID).First();
        try
        {
            cityObj.name = txtCityName.Value.Trim();
            cityObj.description = txtCityDescription.Value.Trim();
            cityObj.around = txtCityAround.Value.Trim();
            cityObj.country_id = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            cityObj.geting_there = txtCityReaching.Value.Trim();
            cityObj.weather = txtCityWeather.Value.Trim();
            cityObj.cost_of_living = txtCityCost.Value.Trim();

            db.SaveChanges();
            Response.Redirect(webURL + "admin/citymaster.aspx?countryID=" + cityObj.country_id);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error editing record. Please try again')", true);
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}