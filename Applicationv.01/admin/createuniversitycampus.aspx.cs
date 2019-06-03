﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createuniversitycampus : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");

        if (!IsPostBack)
        { bindFacilityDropdown(); }
    }

    private void bindFacilityDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            List<facilitiesmaster> facilityMaster = db.facilitiesmaster.ToList();

            ddlFacilities.DataSource = facilityMaster;
            ddlFacilities.DataBind();
            ddlFacilities.DataTextField = "facility_name";
            ddlFacilities.DataValueField = "id";
            ddlFacilities.DataBind();
            ddlFacilities.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int universityId = -1;
        int facilityID;

        if (!Int32.TryParse(ddlFacilities.SelectedItem.Value, out facilityID))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select facility for university')", true);
            return;
        }
        if (!Int32.TryParse(txtUniID.Value.Trim(), out universityId))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter university ID')", true);
            return;
        }

        universitycampus universityCampusObj = new universitycampus();
        try
        {
            var existingUniversityCampus = (from universityCampus in db.universitycampus
                                            where universityCampus.campusname.Equals(txtCampName.Value.Trim()) && universityCampus.universityid == universityId
                                            select universityCampus.campusname).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUniversityCampus))
            {
                universityCampusObj.campusname = txtCampName.Value.Trim();
                universityCampusObj.description = txtCampDescription.Value.Trim();
                universityCampusObj.facilities = txtCampFacility.Value.Trim();
                universityCampusObj.faculty_description = txtFacultyDescription.Value.Trim();
                universityCampusObj.research = txtCampResearch.Value.Trim();
                universityCampusObj.universityid = universityId;
                universityCampusObj.facility_id = facilityID;
                
                db.universitycampus.Add(universityCampusObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
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
}