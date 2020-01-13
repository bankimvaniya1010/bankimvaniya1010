using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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
            if (Request.QueryString["universityCampusID"] != null)
            {
                int universityCampusId;
                if (!Int32.TryParse(Request.QueryString["universityCampusID"], out universityCampusId))
                    Response.Redirect(webURL + "admin/default.aspx");

                universitycampus existingUninversityCampus = db.universitycampus.Where(obj => obj.campusid == universityCampusId).First();

                if (existingUninversityCampus != null)
                {
                    ViewState["campusID"] = universityCampusId;
                    bindUniversityDropdown(existingUninversityCampus.universityid);

                    txtCampName.Value = existingUninversityCampus.campusname;
                    txtCampDescription.Value = existingUninversityCampus.description;
                    txtCampResearch.Value = existingUninversityCampus.research;
                    txtFacultyDescription.Value = existingUninversityCampus.faculty_description;

                    var countryID = db.citymaster.Where(x => x.city_id == existingUninversityCampus.cityid).Select(x => x.country_id).FirstOrDefault();

                    BindCity(countryID);
                    ddlcity.Items.FindByValue(existingUninversityCampus.cityid.ToString()).Selected = true;
                    
                    objcom.BindCountries(ddlcountry);
                    ddlcountry.Items.FindByValue(countryID.ToString()).Selected = true;                    
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University Campus does not exists')", true);
            }
            else
                Response.Redirect(webURL + "admin/default.aspx");
        }
    }

    private void bindUniversityDropdown(int universityID)
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            dynamic universityMaster;
            if (roleName.ToLower() == "admin")
                universityMaster = db.university_master.ToList();
            else
            {
                universityIDs = Convert.ToInt32(Session["universityId"]);
                universityMaster = db.university_master.Where(x => x.universityid == universityIDs).ToList();
            }

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
            ddlUniversity.SelectedIndex = universityID;
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int campusID = Convert.ToInt32(ViewState["campusID"]);

        universitycampus universityCampusObj = db.universitycampus.Where(x => x.campusid == campusID).First();        
        try
        {
            universityCampusObj.universityid = Convert.ToInt32(ddlUniversity.SelectedItem.Value);
            universityCampusObj.campusname = txtCampName.Value.Trim();
            universityCampusObj.description = txtCampDescription.Value.Trim();
            universityCampusObj.faculty_description = txtFacultyDescription.Value.Trim();
            universityCampusObj.research = txtCampResearch.Value.Trim();
            universityCampusObj.cityid = Convert.ToInt32(hidCityID.Value);
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