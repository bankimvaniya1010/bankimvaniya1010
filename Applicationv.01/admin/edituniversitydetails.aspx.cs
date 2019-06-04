using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edituniversitydetails : System.Web.UI.Page
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
            if (Request.QueryString["universityID"] != null)
            {
                int universityId;
                if (!Int32.TryParse(Request.QueryString["universityID"], out universityId))
                    Response.Redirect("~/admin/default.aspx");

                university_master existingUninversity = db.university_master.Where(obj => obj.universityid == universityId).First();

                if (existingUninversity != null)
                {
                    ViewState["universityID"] = universityId;
                    objCommon.BindCountries(ddlCountry);
                    bindCityDropdown(existingUninversity.cityid.Value);

                    txtUniName.Value = existingUninversity.university_name;
                    txtUniAddress.Value = existingUninversity.address;
                    txtUniContactPerson.Value = existingUninversity.contact_person;
                    txtUniWebsite.Value = existingUninversity.website;
                    txtUniAffiliation.Value = existingUninversity.affiliation;
                    txtEmail.Value = existingUninversity.email;
                    txtMobile.Value = existingUninversity.mobile;
                    txtUniType.Value = existingUninversity.type;
                    txtYearEstablish.Value = existingUninversity.year_established;
                    txtUniSDescription.Value = existingUninversity.short_description;
                    txtUniLDescription.Value = existingUninversity.long_description;
                    txtUniTimeZone.Value = existingUninversity.time_zone;
                    txtUniAirport.Value = existingUninversity.closest_airport;
                    txtUniAirportDistance.Value = existingUninversity.distance_from_airport;
                    txtUniRailDistance.Value = existingUninversity.distance_from_railway;
                    txtUniGettingAround.Value = existingUninversity.getting_around;

                    if (existingUninversity.latitude.HasValue)
                        txtUniLatitude.Value = Convert.ToString(existingUninversity.latitude);
                    if (existingUninversity.longitude.HasValue)
                        txtUniLongitude.Value =Convert.ToString(existingUninversity.longitude);

                    hidCityField.Value = Convert.ToString(existingUninversity.cityid);
                    ddlCity.SelectedIndex = Convert.ToInt32(existingUninversity.cityid);
                    ddlCountry.SelectedIndex = existingUninversity.countryid.Value;
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University does not exists')", true);

            }
            else
                Response.Redirect("~/admin/default.aspx");
        }
    }

    private void bindCityDropdown(int cityId)
    {
        try
        {
            List<citymaster> cityMaster = db.citymaster.ToList();

            ddlCity.DataSource = cityMaster;
            ddlCity.DataBind();
            ddlCity.DataTextField = "name";
            ddlCity.DataValueField = "city_id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("Please Select", ""));
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
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
        int universityID = Convert.ToInt32(ViewState["universityID"]);
        university_master universityObj = db.university_master.Where(x => x.universityid == universityID).First();
        try
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
            universityObj.cityid = Convert.ToInt32(hidCityField.Value.Trim());
            universityObj.countryid = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            universityObj.time_zone = txtUniTimeZone.Value.Trim();
            universityObj.closest_airport = txtUniAirport.Value.Trim();
            universityObj.distance_from_airport = txtUniAirportDistance.Value.Trim();
            universityObj.distance_from_railway = txtUniRailDistance.Value.Trim();
            universityObj.getting_around = txtUniGettingAround.Value.Trim();

            if (!string.IsNullOrEmpty(txtUniLatitude.Value.Trim()))
                universityObj.latitude = Convert.ToDecimal(txtUniLatitude.Value.Trim());
            if (!string.IsNullOrEmpty(txtUniLongitude.Value.Trim()))
                universityObj.longitude = Convert.ToDecimal(txtUniLongitude.Value.Trim());

            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved Successfully')", true);
            Response.Redirect("~/admin/universitymaster.aspx");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}