using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edituniversitycampus : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    string roleName = string.Empty;
    Logger objLog = new Logger();
    string webURL = String.Empty;
    int universityIDs = 0;
    Common objcom = new Common();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityIDs = Utility.GetUniversityId();
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);


        if (!IsPostBack)
        {
            if (Request.QueryString["universityCampusID"] != null)
            {
                int universityCampusId;
                if (!Int32.TryParse(Request.QueryString["universityCampusID"], out universityCampusId))
                    Response.Redirect(webURL + "admin/default.aspx");

                universitycampus existingUninversityCampus = db.universitycampus.Where(obj => obj.campusid == universityCampusId).First();

                if (existingUninversityCampus != null)
                {
                    ViewState["campusID"] = universityCampusId;

                    BindUniversityCampus(existingUninversityCampus);
                                     
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('INSTITUTION CAMPUS does not exists')", true);
            }
            else
                Response.Redirect(webURL + "admin/default.aspx");
        }
    }

    private void BindUniversityCampus(universitycampus existingUninversityCampus) {
        try {

            objcom.BindInstitution(ddlUniversity, existingUninversityCampus.universityid);
            if (existingUninversityCampus.universityid != 0)
            {
                ddlUniversity.ClearSelection();
                ddlUniversity.Items.FindByValue(existingUninversityCampus.universityid.ToString()).Selected = true;
            }
            objcom.BindCountries(ddlcountry);
            if (existingUninversityCampus.Ismaincampus != null)
                ddlmaincampus.Items.FindByValue(existingUninversityCampus.Ismaincampus.ToString()).Selected = true;
            txtCampName.Value = existingUninversityCampus.campusname;

            var countryID = db.citymaster.Where(x => x.city_id == existingUninversityCampus.cityid).Select(x => x.country_id).FirstOrDefault();
            BindCity(countryID);
            if (existingUninversityCampus.cityid != 0)
            {
                ddlcity.Items.FindByValue(existingUninversityCampus.cityid.ToString()).Selected = true;
                hidCityID.Value = existingUninversityCampus.cityid.ToString();
            }
            if (countryID != 0)
                ddlcountry.Items.FindByValue(countryID.ToString()).Selected = true;
            if (existingUninversityCampus.campussetting != null && existingUninversityCampus.campussetting != 0)
                ddlcampussetting.Items.FindByValue(existingUninversityCampus.campussetting.ToString()).Selected = true;
            txtcampusaddress.Value = existingUninversityCampus.campusaddress;
            txtLatitude.Value = existingUninversityCampus.campuslatitude;
            txtLongitude.Value = existingUninversityCampus.campuslongitude;
            txtclosetairport.Value = existingUninversityCampus.closest_airport;
            txtCampusAirportDistance.Value = existingUninversityCampus.distance_from_airport;
            if (existingUninversityCampus.airDistanceUnit != null)
                airDistanceUnit.Items.FindByValue(existingUninversityCampus.airDistanceUnit.ToString()).Selected = true;
            txtCampusclosestRailDistance.Value = existingUninversityCampus.closest_distance_from_railway;
            if (existingUninversityCampus.railclosestDistanceUnit != null && existingUninversityCampus.railclosestDistanceUnit != "0")
                railclosestDistanceUnit.Items.FindByValue(existingUninversityCampus.railclosestDistanceUnit.ToString()).Selected = true;
            txtCampusrailwaydistance.Value = existingUninversityCampus.distance_from_railway;
            if (existingUninversityCampus.railwaydistanceunit != null && existingUninversityCampus.railwaydistanceunit != "0")
                ddlrailwaydistanceunit.Items.FindByValue(existingUninversityCampus.railwaydistanceunit.ToString()).Selected = true;
            txtcampusGettingAround.Value = existingUninversityCampus.getting_around;

            txtplaceofinterestcampus_description.Value = existingUninversityCampus.placeofintrestdescription;
            txtplaceofinterestcampus_distance.Value = existingUninversityCampus.placeofintrestdistance;
            if (existingUninversityCampus.Fraternities != null && existingUninversityCampus.Fraternities != 0)
                ddlFraternities.Items.FindByValue(existingUninversityCampus.Fraternities.ToString()).Selected = true;
            if (existingUninversityCampus.Sororities != null && existingUninversityCampus.Sororities != 0)
                ddlSororities.Items.FindByValue(existingUninversityCampus.Sororities.ToString()).Selected = true;

            txttotalstu_campus.Value = existingUninversityCampus.totalstudent_campus;
            txtmale_percentage.Value = existingUninversityCampus.male_percentage;
            txtfemale_percentage.Value = existingUninversityCampus.female_percentage;
            txtaverageage.Value = existingUninversityCampus.averageage;
            txtdomesticstude.Value = existingUninversityCampus.domesticstude;
            txtstatestude.Value = existingUninversityCampus.statestude;
            txtinternationalstude.Value = existingUninversityCampus.internationalstude;
            txtnoofnationalty.Value = existingUninversityCampus.noofnationalty;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    
    private void bindUniversityDropdown(int universityID)
    {
        try
        {
            ListItem lst = new ListItem("Please select institution", "0");
            dynamic universityMaster;
            if (roleName.ToLower() == "admin")
                universityMaster = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityIDs = Convert.ToInt32(Session["universityId"]);
                universityMaster = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityIDs).ToList();
            }

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
            //ddlUniversity.SelectedIndex = universityID;
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int campusID = Convert.ToInt32(ViewState["campusID"]);

        universitycampus universityCampusObj = new universitycampus();
        try
        {
            var mode = "new";
            var data = db.universitycampus.Where(x => x.campusid == campusID).First();
            if (data != null)
            {
                mode = "update";
                universityCampusObj = data;
            }

            universityCampusObj.Ismaincampus = Convert.ToInt32(ddlmaincampus.SelectedValue);
            universityCampusObj.campusname = txtCampName.Value.Trim();
            universityCampusObj.campuscountry = Convert.ToInt32(ddlcountry.SelectedValue);
            universityCampusObj.cityid = Convert.ToInt32(hidCityID.Value);
            universityCampusObj.campussetting = Convert.ToInt32(ddlcampussetting.SelectedValue);
            universityCampusObj.campusaddress = txtcampusaddress.Value.Trim();
            universityCampusObj.campuslatitude = txtLatitude.Value.Trim();
            universityCampusObj.campuslongitude = txtLongitude.Value.Trim();

            universityCampusObj.closest_airport = txtclosetairport.Value.Trim();
            universityCampusObj.distance_from_airport = txtCampusAirportDistance.Value.Trim() + " " + airDistanceUnit.SelectedValue;
            universityCampusObj.closest_distance_from_railway = txtCampusclosestRailDistance.Value.Trim() + " " + railclosestDistanceUnit.SelectedValue;
            universityCampusObj.distance_from_railway = txtCampusrailwaydistance.Value.Trim() + " " + ddlrailwaydistanceunit.Value.Trim();
            universityCampusObj.getting_around = txtcampusGettingAround.Value.Trim();

            if (placeofinterestcampusimage.HasFile)
            {
                docPath = docPath + "/" + universityIDs + "/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(placeofinterestcampusimage.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                placeofinterestcampusimage.SaveAs(docPath + filename);
                universityCampusObj.placeofintrestimage = filename;
            }
            universityCampusObj.placeofintrestdescription = txtplaceofinterestcampus_description.Value.Trim();
            universityCampusObj.placeofintrestdistance = txtplaceofinterestcampus_distance.Value.Trim();

            universityCampusObj.Fraternities = Convert.ToInt32(ddlFraternities.SelectedValue);
            universityCampusObj.Sororities = Convert.ToInt32(ddlSororities.SelectedValue);
            universityCampusObj.totalstudent_campus = txttotalstu_campus.Value.Trim();
            universityCampusObj.male_percentage = txtmale_percentage.Value.Trim();
            universityCampusObj.female_percentage = txtfemale_percentage.Value.Trim();
            universityCampusObj.averageage = txtaverageage.Value.Trim();
            universityCampusObj.domesticstude = txtdomesticstude.Value.Trim();
            universityCampusObj.statestude = txtstatestude.Value.Trim();
            universityCampusObj.internationalstude = txtinternationalstude.Value.Trim();
            universityCampusObj.noofnationalty = txtnoofnationalty.Value.Trim();


            universityCampusObj.universityid = universityIDs;
            //universityCampusObj.faculty_description = txtFacultyDescription.Value.Trim();
            //universityCampusObj.research = txtCampResearch.Value.Trim();

            db.universitycampus.Add(universityCampusObj);
            if(mode=="new")
                db.SaveChanges();
            Response.Redirect(webURL + "admin/universitycampusmaster.aspx?universityID=" + universityCampusObj.universityid);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCityDropdown(int countryId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.citymaster.Where(x => x.country_id == countryId).Select(x => new { x.city_id, x.name }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    private void BindCity(int countryID)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var temp = db.citymaster.Where(x => x.country_id == countryID).ToList();
            ddlcity.DataSource = temp;
            ddlcity.DataTextField = "name";
            ddlcity.DataValueField = "city_id";
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }
}