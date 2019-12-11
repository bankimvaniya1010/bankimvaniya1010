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

public partial class edituniversitydetails : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected string imagepath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            if (Request.QueryString["universityID"] != null)
            {
                int universityId;
                if (!Int32.TryParse(Request.QueryString["universityID"], out universityId))
                    Response.Redirect(webURL + "admin/default.aspx");

                university_master existingUninversity = db.university_master.Where(obj => obj.universityid == universityId).First();

                if (existingUninversity != null)
                {
                    ViewState["universityID"] = universityId;
                    objCommon.BindCountries(ddlCountry);
                    objCommon.BindTimeZone(ddlTimeZone);
                    bindCityDropdown(existingUninversity.cityid);

                    string[] airportDistanceValue = existingUninversity.distance_from_airport.Split(' ');
                    string[] railDistanceValue = existingUninversity.distance_from_railway.Split(' ');

                    txtUniName.Value = existingUninversity.university_name;
                    txthosturl.Value = existingUninversity.hosturl;
                    txtUniAddress.Value = existingUninversity.address;
                    txtUniContactPerson.Value = existingUninversity.contact_person;
                    txtUniWebsite.Value = existingUninversity.website;
                    txtUniAffiliation.Value = existingUninversity.affiliation;
                    txtEmail.Value = existingUninversity.email;
                    txtMobile.Value = existingUninversity.mobile;
                    txtunichatId.Value = existingUninversity.chatid;
                    txtUniType.Value = existingUninversity.type;
                    txtYearEstablish.Value = existingUninversity.year_established;
                    txtUniSDescription.Value = existingUninversity.short_description;
                    txtUniLDescription.Value = existingUninversity.long_description;
                    txtUniAirport.Value = existingUninversity.closest_airport;

                    txtUniAirportDistance.Value = airportDistanceValue[0];
                    foreach (ListItem item in airDistanceUnit.Items)
                    {
                        if (item.Text == airportDistanceValue[1])
                        {
                            item.Selected = true;
                            break;
                        }
                    }

                    txtUniRailDistance.Value = railDistanceValue[0];
                    foreach (ListItem item in railDistanceUnit.Items)
                    {
                        if (item.Text == railDistanceValue[1])
                        {
                            item.Selected = true;
                            break;
                        }
                    }

                    txtUniGettingAround.Value = existingUninversity.getting_around;
                    txtUniLatitude.Value = Convert.ToString(existingUninversity.latitude);
                    txtUniLongitude.Value = Convert.ToString(existingUninversity.longitude);

                    ddlTimeZone.SelectedValue = existingUninversity.time_zone;
                    hidCityField.Value = Convert.ToString(existingUninversity.cityid);
                    ddlCity.SelectedIndex = Convert.ToInt32(existingUninversity.cityid);
                    ddlCountry.SelectedIndex = existingUninversity.countryid;
                    txtUniAcceptedMaxAge.Value = Convert.ToString(existingUninversity.acceptedmaxage);
                    txtUniAcceptedMinAge.Value = Convert.ToString(existingUninversity.acceptedminage);
                    if (existingUninversity.headerstripcolor != "")
                        txtstripcolor.Value = existingUninversity.headerstripcolor;                        
                    if (existingUninversity.verticalnavigationcolor != "")
                        txtverticalnavigationcolor.Value = existingUninversity.verticalnavigationcolor;
                    if (existingUninversity.fontcolor != "")
                        txtfontcolor.Value = existingUninversity.fontcolor;
                    txtUniversitySop.Text = existingUninversity.sop_instruction_for_applicant;
                    txtUniversityScholarship.Text = existingUninversity.scholarship_instruction;
                    txtUniversityApplication.Text = existingUninversity.application_instruction;
                    txtUniversityCOE.Text = existingUninversity.coe_instruction;
                    txtUniversityFeePayment.Text = existingUninversity.fee_payment_instructions;
                    txtAcceptanceTerms.Text = existingUninversity.acceptance_terms;
                    txtDefermentTerms.Text = existingUninversity.deferment_terms;
                    txtRejectionTerms.Text = existingUninversity.rejection_terms;
                    txtWithdrawnTerms.Text = existingUninversity.withdrawn_terms;
                    txtsupportserviceInstructions.Text = existingUninversity.supprot_service_instructions;
                    txtvisainstruction.Text = existingUninversity.visa_instructions;
                    foreach (ListItem item in subscription.Items)
                    {
                        string value = existingUninversity.full_service ? "1" : "0";
                        if (item.Value == value)
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                    txtNotesDisclaimer.Value = existingUninversity.notes_disclaimer;
                    imagepath =  webURL + "/Docs/" + existingUninversity.universityid + "/" + existingUninversity.logo;
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University does not exists')", true);

            }
            else
                Response.Redirect(webURL + "admin/default.aspx");
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
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
        int check = -1;
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
            universityObj.chatid = txtunichatId.Value.Trim();
            universityObj.type = txtUniType.Value.Trim();
            universityObj.year_established = txtYearEstablish.Value.Trim();
            universityObj.short_description = txtUniSDescription.Value.Trim();
            universityObj.long_description = txtUniLDescription.Value.Trim();
            universityObj.cityid = Convert.ToInt32(hidCityField.Value.Trim());
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
            universityObj.headerstripcolor = txtstripcolor.Value.Trim();
            universityObj.verticalnavigationcolor = txtverticalnavigationcolor.Value.Trim();
            universityObj.fontcolor = txtfontcolor.Value;
            universityObj.sop_instruction_for_applicant = txtUniversitySop.Text;
            universityObj.scholarship_instruction = txtUniversityScholarship.Text;
            universityObj.application_instruction = txtUniversityApplication.Text;
            universityObj.coe_instruction = txtUniversityCOE.Text;
            universityObj.fee_payment_instructions = txtUniversityFeePayment.Text;
            universityObj.acceptance_terms = txtAcceptanceTerms.Text;
            universityObj.deferment_terms = txtDefermentTerms.Text;
            universityObj.rejection_terms = txtRejectionTerms.Text;
            universityObj.withdrawn_terms = txtWithdrawnTerms.Text;
            universityObj.supprot_service_instructions = txtsupportserviceInstructions.Text;
            universityObj.visa_instructions = txtvisainstruction.Text;
            if (logo.HasFile)  //fileupload control contains a file  
            {
                docPath = docPath + "/" + universityObj.universityid + "/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(logo.PostedFile.FileName);
                string filename = universityObj.university_name.Replace(" ", "-") + extension;
                if (File.Exists(docPath + filename))
                    File.Delete(docPath + filename);
                logo.SaveAs(docPath + filename);
                universityObj.logo = filename;
                check = db.SaveChanges();
            }
            if(check < 0)
                db.SaveChanges();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('University details updated successfully.');window.location='" + webURL + "admin/universitymaster.aspx';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
}