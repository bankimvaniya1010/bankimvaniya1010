using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createcampusfacilitymapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");

        if (!IsPostBack)
        {
            bindUniversityDropDown();
            bindFacilityDropDown();
        }
    }

    private void bindUniversityDropDown()
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            List<university_master> universityMaster = db.university_master.ToList();

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

    private void bindFacilityDropDown()
    {
        try
        {
            ListItem lst = new ListItem("Please select facility", "0");
            List<facilitiesmaster> facilityMaster = db.facilitiesmaster.ToList();

            ddlFacility.DataSource = facilityMaster;
            ddlFacility.DataTextField = "facility_name";
            ddlFacility.DataValueField = "id";
            ddlFacility.DataBind();
            ddlFacility.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCampusDropdown(int universityID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.universitycampus.Where(x => x.universityid == universityID).Select(x => new { x.campusid, x.campusname }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int campusId = Convert.ToInt32(hidCampusField.Value.Trim());
        int facilityId = Convert.ToInt32(ddlFacility.SelectedItem.Value);

        facility_campus_mapping mappingObj = new facility_campus_mapping();
        try
        {
            var existingMapping = (from mapping in db.facility_campus_mapping
                                where mapping.campusId == campusId && mapping.facilityId == facilityId
                                select mapping).FirstOrDefault();
            if (existingMapping == null)
            {
                mappingObj.facilityId = facilityId;
                mappingObj.campusId = campusId;

                mappingObj.IsFree = ddlFacilityCost.SelectedIndex == 1;
                if (!mappingObj.IsFree)
                    mappingObj.cost = Convert.ToInt32(txtFacilityCost.Value.Trim());

                mappingObj.facility_site = ddlFacilityLocation.Value;
                if(mappingObj.facility_site == "Offsite")
                    mappingObj.distance = txtFacilityDistance.Value.Trim();

                db.facility_campus_mapping.Add(mappingObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Facility already mapped with Campus')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}