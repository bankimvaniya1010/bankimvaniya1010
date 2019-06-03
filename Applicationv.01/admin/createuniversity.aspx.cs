using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;

public partial class admin_createuniversity : System.Web.UI.Page
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
            objCommon.BindCountries(ddlCountry);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCityDropdown(int countryId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.citymaster.Where(x => x.country_id == countryId).Select(x => new { x.city_id, x.name }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        decimal latitude;
        decimal longitude;
        int countryValue;
        int cityValue;

        if (!Decimal.TryParse(txtUniLatitude.Value.Trim(), out latitude))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter university's latitude')", true);
            return;
        }
        if (!Decimal.TryParse(txtUniLongitude.Value.Trim(), out longitude))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter university's longitude')", true);
            return;
        }
        if (!Int32.TryParse(hidCityField.Value.Trim(), out cityValue))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select city for university')", true);
            return;
        }
        if (!Int32.TryParse(ddlCountry.SelectedItem.Value, out countryValue))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select country for university')", true);
            return;
        }

        university_master universityObj = new university_master();
        try
        {
            var existingUniversity = (from universities in db.university_master
                                where universities.university_name.Equals(txtUniName.Value.Trim())
                                select universities.university_name).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUniversity))
            {
                universityObj.university_name = txtUniName.Value.Trim();
                universityObj.address = txtUniAddress.Value.Trim();
                universityObj.website = txtUniWebsite.Value.Trim();
                universityObj.contact_person = txtUniContactPerson.Value.Trim();
                universityObj.affiliation = txtUniAffiliation.Value.Trim();
                universityObj.email = txtEmail.Value.Trim();
                universityObj.mobile = txtMobile.Value.Trim();
                universityObj.type = txtUniType.Value.Trim();
                universityObj.year_established = txtYearEstablish.Value.Trim();
                universityObj.short_description = txtUniSDescription.Value.Trim();
                universityObj.long_description = txtUniLatitude.Value.Trim();
                universityObj.cityid = cityValue;
                universityObj.countryid = countryValue;
                universityObj.latitude = latitude;
                universityObj.longitude = longitude;
                universityObj.time_zone = txtUniTimeZone.Value.Trim();
                universityObj.closest_airport = txtUniAirport.Value.Trim();
                universityObj.distance_from_airport = txtUniAirportDistance.Value.Trim();
                universityObj.distance_from_railway = txtUniRailDistance.Value.Trim();
                universityObj.getting_around = txtUniGettingAround.Value.Trim();

                db.university_master.Add(universityObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University already exists')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}