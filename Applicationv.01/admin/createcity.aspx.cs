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
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        { objCommon.BindCountries(ddlCountry); }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int countryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);

        citymaster cityObj = new citymaster();
        try
        {
            var existingCity = (from cities in db.citymaster
                                where cities.name.Equals(txtCityName.Value.Trim()) && cities.country_id == countryId
                                select cities.name).FirstOrDefault();
            if (string.IsNullOrEmpty(existingCity))
            {
                cityObj.name = txtCityName.Value.Trim();
                cityObj.description = txtCityDescription.Value.Trim();
                cityObj.around = txtCityAround.Value.Trim();
                cityObj.country_id = countryId;
                cityObj.geting_there = txtCityReaching.Value.Trim();
                cityObj.weather = txtCityWeather.Value.Trim();
                cityObj.cost_of_living = txtCityCost.Value.Trim();

                db.citymaster.Add(cityObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('City already exists in this country')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error saving record. Please try again')", true);
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}