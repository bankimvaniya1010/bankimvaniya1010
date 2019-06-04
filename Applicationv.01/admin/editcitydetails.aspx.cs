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
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");

        if (!IsPostBack)
        {
            if (Request.QueryString["cityID"] != null)
            {
                int cityID;
                if (!Int32.TryParse(Request.QueryString["cityID"], out cityID))
                    Response.Redirect("~/admin/default.aspx");

                citymaster existingCity = db.citymaster.Where(obj => obj.city_id == cityID).First();

                if (existingCity != null)
                {
                    ViewState["cityID"] = cityID;
                    objCommon.BindCountries(ddlCountry);

                    txtCityAround.Value = existingCity.around;
                    txtCityDescription.Value = existingCity.description;
                    txtCityName.Value = existingCity.name;
                    txtCityWeather.Value = existingCity.weather;
                    txtCityReaching.Value = existingCity.geting_there;

                    if(existingCity.cost_of_living.HasValue)
                        txtCityCost.Value = Convert.ToString(existingCity.cost_of_living);

                    ddlCountry.SelectedIndex = Convert.ToInt32(existingCity.country_id);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('City does not exists')", true);

            }
            else
                Response.Redirect("~/admin/default.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int cityID = Convert.ToInt32(ViewState["cityID"]);
        citymaster cityObj = db.citymaster.Where(x => x.city_id == cityID).First();
        try
        {
            cityObj.name = txtCityName.Value.Trim();
            cityObj.description = txtCityDescription.Value.Trim();
            cityObj.around = txtCityAround.Value.Trim();
            cityObj.country_id = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            cityObj.geting_there = txtCityReaching.Value.Trim();
            cityObj.weather = txtCityWeather.Value.Trim();
            if (!string.IsNullOrEmpty(txtCityCost.Value))
                cityObj.cost_of_living = Convert.ToDecimal(txtCityCost.Value.Trim());

            db.SaveChanges();
            Response.Redirect("~/admin/citymaster.aspx?countryID=" + cityObj.country_id);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}