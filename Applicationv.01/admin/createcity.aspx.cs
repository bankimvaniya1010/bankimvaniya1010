using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createcity : System.Web.UI.Page
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
        { objCommon.BindCountries(ddlCountry); }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        decimal cityCost;
        int countryId = -1;

        if(!Decimal.TryParse(txtCityCost.Value.Trim(), out cityCost))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter city's cost of living')", true);
            return;
        }
        if(!Int32.TryParse(ddlCountry.SelectedItem.Value, out countryId))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select country for city')", true);
            return;
        }

        citymaster cityObj = new citymaster();
        try
        {
            var existingCity = (from cities in db.citymaster
                                where cities.name.Equals(txtCityName.Value.Trim()) && cities.country_id == countryId
                                select cities.name).SingleOrDefault();
            if (string.IsNullOrEmpty(existingCity))
            {
                cityObj.name = txtCityName.Value.Trim();
                cityObj.description = txtCityDescription.Value.Trim();
                cityObj.cost_of_living = cityCost;
                cityObj.around = txtCityAround.Value.Trim();
                cityObj.country_id = countryId;
                cityObj.geting_there = txtCityReaching.Value.Trim();
                cityObj.weather = txtCityWeather.Value.Trim();

                db.citymaster.Add(cityObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('City alreaady exists in this country')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}