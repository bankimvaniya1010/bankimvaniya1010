using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edituniversitycampus : System.Web.UI.Page
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
            if (Request.QueryString["universityCampusID"] != null)
            {
                int universityCampusId;
                if (!Int32.TryParse(Request.QueryString["universityCampusID"], out universityCampusId))
                    Response.Redirect("~/admin/Default.aspx");

                universitycampus existingUninversityCampus = db.universitycampus.Where(obj => obj.campusid == universityCampusId).First();

                if (existingUninversityCampus != null)
                {
                    ViewState["campusID"] = universityCampusId;
                    bindUniversityDropdown(existingUninversityCampus.universityid);

                    txtCampName.Value = existingUninversityCampus.campusname;
                    //txtUniID.Value = Convert.ToString(existingUninversityCampus.universityid.Value);
                    txtCampDescription.Value = existingUninversityCampus.description;
                    txtCampResearch.Value = existingUninversityCampus.research;
                    txtFacultyDescription.Value = existingUninversityCampus.faculty_description;
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University Campus does not exists')", true);
            }
            else
                Response.Redirect("~/admin/Default.aspx");
        }
    }

    private void bindUniversityDropdown(int universityID)
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            List<university_master> universityMaster = db.university_master.ToList();

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataBind();
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.SelectedIndex = universityID;
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int campusID = Convert.ToInt32(ViewState["campusID"]);
        int facilityID;
        int universityId;

        universitycampus universityCampusObj = db.universitycampus.Where(x => x.campusid == campusID).First();
        try
        {
            universityCampusObj.campusname = txtCampName.Value.Trim();
            universityCampusObj.description = txtCampDescription.Value.Trim();
            //universityCampusObj.facilities = txtCampFacility.Value.Trim();
            universityCampusObj.faculty_description = txtFacultyDescription.Value.Trim();
            universityCampusObj.research = txtCampResearch.Value.Trim();

            //if (Int32.TryParse(txtUniID.Value.Trim(), out universityId))
            //    universityCampusObj.universityid = universityId;

            //if (Int32.TryParse(ddlFacilities.SelectedItem.Value, out facilityID))
            //    universityCampusObj.facility_id = facilityID;

            db.SaveChanges();
            Response.Redirect("~/admin/universitycampusmaster.aspx?universityID=" + universityCampusObj.universityid);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}