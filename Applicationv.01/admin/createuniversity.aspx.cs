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
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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
                universityObj.chatid = txtunichatId.Value.Trim();
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
                universityObj.full_service = Convert.ToInt32(subscription.SelectedValue);
                universityObj.notes_disclaimer = txtNotesDisclaimer.Value.Trim();
                universityObj.logo = "";
                universityObj.headerstripcolor = headerstripcolor.Value.Trim();
                universityObj.verticalnavigationcolor = verticalnavigationcolor.Value.Trim();
                universityObj.fontcolor = fontcolor.Value.Trim();
                universityObj.sop_instruction_for_applicant = txtUniversitySop.Text;
                universityObj.scholarship_instruction = txtUniversityScholarship.Text;
                universityObj.acceptance_terms = txtAcceptanceTerms.Text;
                universityObj.deferment_terms = txtDefermentTerms.Text;
                universityObj.rejection_terms = txtRejectionTerms.Text;
                universityObj.withdrawn_terms = txtWithdrawnTerms.Text;
                universityObj.application_instruction = txtUniversityApplication.Text;
                universityObj.supprot_service_instructions = txtsupportserviceInstructions.Text;
                universityObj.fee_payment_instructions = txtUniversityFeePayment.Text;
                universityObj.coe_instruction = txtUniversityCOE.Text;
                universityObj.visa_instructions = txtvisainstruction.Text;
                universityObj.university_gtm_code = txtgtmcode.Text.Trim();
                universityObj.proctor1_name = txtproctorname1.Text.Trim();
                universityObj.proctor1_contactno = txtproctorno1.Text.Trim();
                universityObj.proctor1_email = txtproctoremail1.Text.Trim();
                universityObj.examInstruction = txtexamInstruction.Text.Trim();
                universityObj.emai_notification1 = txtnotification1.Text.Trim();
                universityObj.emai_notification2 = txtnotification2.Text.Trim();
                universityObj.numberof_applicant = Convert.ToInt32(txtapplicantno.Value.Trim());

                var url = txthosturl.Value.Trim();
                if(url.ToLower().Contains("www."))
                    url = url.Replace("www.", string.Empty);
                universityObj.hosturl = url;
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
                mappeduniversitytoform(universityObj.universityid, universityObj.full_service);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Record Inserted Successfully');window.location='" + Request.ApplicationPath + "admin/universitymaster.aspx';", true);
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

    private void mappeduniversitytoform(int universityid, int service)
    {
        try {
            universitywiseformmapping objmapping = new universitywiseformmapping();
            var formlist = db.formmaster.Where(x => x.service == service && x.service == 3).ToList();
            for(int formid = 0; formid < formlist.Count; formid++)
            {
                objmapping.universityid = universityid;
                objmapping.formid = formid;
                db.universitywiseformmapping.Add(objmapping);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}