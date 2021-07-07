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

public partial class admin_createuniversitycampus : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    Common objcom = new Common();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string roleName = string.Empty;
    int universityID = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);


        if (!IsPostBack)
        {
            objcom.BindCountries(ddlcountry);
            bindUniversityDropdown(); }
    }

    private void bindUniversityDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            dynamic universityMaster;
            if (roleName.ToLower() == "admin")
                universityMaster = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                universityMaster = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int universityId = Convert.ToInt32(ddlUniversity.SelectedItem.Value);
        universitycampus universityCampusObj = new universitycampus();
        try
        {
            var existingUniversityCampus = (from universityCampus in db.universitycampus
                                            where universityCampus.campusname.Equals(txtCampName.Value.Trim()) && universityCampus.universityid == universityId
                                            select universityCampus.campusname).FirstOrDefault();

            if (string.IsNullOrEmpty(existingUniversityCampus))
            {
                universityCampusObj.Ismaincampus = Convert.ToInt32(ddlmaincampus.SelectedValue);
                universityCampusObj.campusname = txtCampName.Value.Trim();
                if(ddlcountry.SelectedValue!= "0")
                    universityCampusObj.campuscountry = Convert.ToInt32(ddlcountry.SelectedValue);
                universityCampusObj.cityid = Convert.ToInt32(hidCityID.Value);
                if(ddlcampussetting.SelectedValue != "0")
                    universityCampusObj.campussetting = Convert.ToInt32(ddlcampussetting.SelectedValue);
                universityCampusObj.campusaddress = txtcampusaddress.Value.Trim();
                universityCampusObj.campuslatitude = txtLatitude.Value.Trim();
                universityCampusObj.campuslongitude = txtLongitude.Value.Trim();

                universityCampusObj.closest_airport = txtclosetairport.Value.Trim();
                universityCampusObj.distance_from_airport = txtCampusAirportDistance.Value.Trim();
                if (airDistanceUnit.SelectedValue != "0")
                    universityCampusObj.airDistanceUnit = airDistanceUnit.SelectedValue;
                universityCampusObj.closest_distance_from_railway = txtCampusclosestRailDistance.Value.Trim();
                if (railclosestDistanceUnit.SelectedValue != "0")
                    universityCampusObj.railclosestDistanceUnit = railclosestDistanceUnit.SelectedValue;
                universityCampusObj.distance_from_railway = txtCampusrailwaydistance.Value.Trim();
                if (ddlrailwaydistanceunit.SelectedValue != "0")
                    universityCampusObj.railwaydistanceunit = ddlrailwaydistanceunit.SelectedValue;
                universityCampusObj.getting_around = txtcampusGettingAround.Value.Trim();

                if (placeofinterestcampusimage.HasFile)
                {
                    docPath = docPath + "/" + universityID + "/";
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(placeofinterestcampusimage.PostedFile.FileName);
                    string filename = Guid.NewGuid() + extension;
                    placeofinterestcampusimage.SaveAs(docPath + filename);
                    universityCampusObj.placeofintrestimage = filename;
               }
                universityCampusObj.placeofintrestdescription = txtplaceofinterestcampus_description.Value.Trim();
                universityCampusObj.placeofintrestdistance = txtplaceofinterestcampus_distance.Value.Trim();
                if (ddlFraternities.SelectedValue != "0")
                    universityCampusObj.Fraternities = Convert.ToInt32(ddlFraternities.SelectedValue);
                if (ddlSororities.SelectedValue != "0")
                    universityCampusObj.Sororities = Convert.ToInt32(ddlSororities.SelectedValue);
                universityCampusObj.totalstudent_campus = txttotalstu_campus.Value.Trim();
                universityCampusObj.male_percentage = txtmale_percentage.Value.Trim();
                universityCampusObj.female_percentage = txtfemale_percentage.Value.Trim();
                universityCampusObj.averageage = txtaverageage.Value.Trim();
                universityCampusObj.domesticstude = txtdomesticstude.Value.Trim();
                universityCampusObj.statestude = txtstatestude.Value.Trim();
                universityCampusObj.internationalstude = txtinternationalstude.Value.Trim();
                universityCampusObj.noofnationalty = txtnoofnationalty.Value.Trim();


                universityCampusObj.universityid = universityId;
                universityCampusObj.faculty_description = ".";
                universityCampusObj.research = ".";
                universityCampusObj.description= ".";

                db.universitycampus.Add(universityCampusObj);
                db.SaveChanges();

                string[] facilitiesList = hidFacilities.Value.Split(';');
                string[] facilitiesCostList = hidFacilityCost.Value.Split(';');
                string[] facilitiesPriceList = hidFacilityPrice.Value.Split(';');
                string[] facilitiesLocationList = hidFacilityLocation.Value.Split(';');
                string[] facilitiesDistanceList = hidFacilityDistance.Value.Split(';');

                int facilitiesCount = facilitiesList.Length;
                for (int i = 0; i < facilitiesCount - 1; i++)
                {
                    facility_campus_mapping mapping = new facility_campus_mapping();

                    mapping.campusId = universityCampusObj.campusid;
                    mapping.facilityId = Convert.ToInt32(facilitiesList[i]);
                    mapping.IsFree = facilitiesCostList[i] == "free";
                    if (!mapping.IsFree)
                        mapping.cost = Convert.ToInt32(facilitiesPriceList[i]);

                    mapping.facility_site = facilitiesLocationList[i];
                    if (mapping.facility_site == "offsite")
                        mapping.distance = facilitiesDistanceList[i];

                    db.facility_campus_mapping.Add(mapping);
                    db.SaveChanges();
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                       "alert('Record Inserted successfully.');window.location='" + webURL + "admin/universitycampusmaster.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University Campus already exists')", true);
            }
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
        
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetAllFacilities()
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.facilitiesmaster.Select(x => new { x.id , x.facility_name }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
}