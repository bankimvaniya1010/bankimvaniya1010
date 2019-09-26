using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;
using System.IO;

public partial class admin_createuniversity : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            objCommon.BindCountries(ddlCountry);
            objCommon.BindTimeZone(ddlTimeZone);
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
        university_master universityObj = new university_master();
        try
        {
            var existingUniversity = (from universities in db.university_master
                                      where universities.university_name.Equals(txtUniName.Value.Trim())
                                      select universities.university_name).FirstOrDefault();
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
                universityObj.long_description = txtUniLDescription.Value.Trim();
                universityObj.cityid = Convert.ToInt32(hidCityField.Value);
                universityObj.countryid = Convert.ToInt32(ddlCountry.SelectedItem.Value);
                universityObj.time_zone = ddlTimeZone.SelectedItem.Value;
                universityObj.closest_airport = txtUniAirport.Value.Trim();
                universityObj.distance_from_airport = txtUniAirportDistance.Value.Trim() + " " + airDistanceUnit.Value.Trim();
                universityObj.distance_from_railway = txtUniRailDistance.Value.Trim() + " " + railDistanceUnit.Value.Trim();
                universityObj.getting_around = txtUniGettingAround.Value.Trim();
                universityObj.latitude = Convert.ToDecimal(txtUniLatitude.Value.Trim());
                universityObj.longitude = Convert.ToDecimal(txtUniLongitude.Value.Trim());
                universityObj.acceptedmaxage = Convert.ToInt32(txtUniAcceptedMaxAge.Value.Trim());
                universityObj.acceptedminage = Convert.ToInt32(txtUniAcceptedMinAge.Value.Trim());
                universityObj.full_service = Convert.ToInt32(subscription.Value) == 1;
                universityObj.notes_disclaimer = txtNotesDisclaimer.Value.Trim();
                universityObj.logo = "";
                universityObj.headerstripcolor = headerstripcolor.Value;
                universityObj.verticalnavigationcolor = verticalnavigationcolor.Value;
                universityObj.fontcolor = fontcolor.Value;
                universityObj.sop_instruction_for_applicant = txtUniversitySop.Text;
                universityObj.scholarship_instruction = txtUniversityScholarship.Text;
                universityObj.acceptance_terms = txtAcceptanceTerms.Text;
                universityObj.deferment_terms = txtDefermentTerms.Text;
                universityObj.rejection_terms = txtRejectionTerms.Text;
                universityObj.withdrawn_terms = txtWithdrawnTerms.Text;
                db.university_master.Add(universityObj);
                db.SaveChanges();
                if (logo.HasFile)  //fileupload control contains a file  
                {
                    docPath = docPath + "/" + universityObj.universityid + "/";
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(logo.PostedFile.FileName);
                    string filename = universityObj.university_name.Replace(" ", "-") + extension;
                    logo.SaveAs(docPath + filename);
                    universityObj.logo = filename;
                    db.SaveChanges();
                }
               
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