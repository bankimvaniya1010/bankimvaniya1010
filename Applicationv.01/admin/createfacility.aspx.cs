using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addfacility : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        facilitiesmaster facilityObj = new facilitiesmaster();
        try
        {
            var existingFacility = (from facilities in db.facilitiesmaster
                                where facilities.facility_name.Equals(txtFacilityName.Value.Trim())
                                select facilities.facility_name).FirstOrDefault();
            if (string.IsNullOrEmpty(existingFacility))
            {
                facilityObj.facility_name = txtFacilityName.Value.Trim();

                db.facilitiesmaster.Add(facilityObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Facility already exists)", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}