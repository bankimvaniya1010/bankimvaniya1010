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

public partial class admin_universitydetails_CreateN : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
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
            BindCode();
            BindAge(); BindSize();
            Bindreligious_affiliation();
            BindSetting();
            Bindco_ed();
            Bindtypemaster();
            FillYears(ddlSubjectRankings); FillYears(ddlawardsYear); FillYears(ddlRankingsyear); FillYears(ddlAcademicRankingofWorldUniversities_year); FillYears(ddlQSWorldUniversityRanking_year); FillYears(ddlTimesHigherEducationRanking_year);
            Bindstudymode(); BindimpDate();
            objCommon.Bindadmisionfactor_dropdown_master(ddlessay);
            objCommon.Bindadmisionfactor_dropdown_master(ddlRecommendations);
            objCommon.Bindadmisionfactor_dropdown_master(ddlSecondaryschoolrecord);
            objCommon.Bindadmisionfactor_dropdown_master(ddlStandardizedtestscores);
            objCommon.Bindadmisionfactor_dropdown_master(ddlAlumni_aerelationship);
            objCommon.Bindadmisionfactor_dropdown_master(ddlExtracurricularactivities);
            objCommon.Bindadmisionfactor_dropdown_master(ddlParticulartalent_ability);
            objCommon.Bindadmisionfactor_dropdown_master(ddlVolunteerWork);
            objCommon.Bindadmisionfactor_dropdown_master(ddlWorkExperience);
            objCommon.Bindadmisionfactor_dropdown_master(ddlCharacter_personalqualities);
            objCommon.Bindadmisionfactor_dropdown_master(ddlClassrank);
            objCommon.Bindadmisionfactor_dropdown_master(ddlGeographicalresidence);
            objCommon.Bindadmisionfactor_dropdown_master(ddlMinorityaffiliation);
            objCommon.Bindadmisionfactor_dropdown_master(ddlStateresidency);
            objCommon.Bindadmisionfactor_dropdown_master(ddlInterview);
            objCommon.Bindadmisionfactor_dropdown_master(ddlReligiousaffiliationcommitment);
            objCommon.Bindadmisionfactor_dropdown_master(ddlGenuineStudentAssessment);
            BindBroadField(); BindNarrowField(); BindDetailedField();
            Bindstudeylevel();


        }
    }
    public void FillYears(DropDownList ddl)
    {
        try
        {
            int maxYers = DateTime.Now.Year;
            int minYrs = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString());
            ddl.Items.Add(new ListItem("Please Select Year", "0"));
            for (int i = minYrs; i <= maxYers; i++)
            {
                ddl.Items.Add(i.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void Bindstudeylevel()
    {
        try
        {
            var temp = (from bf in db.studylevelmaster
                        select new
                        {
                            fieldname = bf.studylevel,
                            id = bf.studylevelid,
                        }).Distinct().ToList();

            ListItem lst1 = new ListItem("Please select", "0");

            //chkLevelofStudyOffered.DataSource = temp;
            //chkLevelofStudyOffered.DataTextField = "fieldname";
            //chkLevelofStudyOffered.DataValueField = "id";
            //chkLevelofStudyOffered.DataBind();
            //chkLevelofStudyOffered.Items.Insert(0, lst1);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindBroadField()
    {
        try
        {
            var temp = (from bf in db.course_broadFields_master
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().ToList();


            CheckBoxList1.DataSource = temp;
            CheckBoxList1.DataTextField = "fieldname";
            CheckBoxList1.DataValueField = "id";
            CheckBoxList1.DataBind();

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetNarrowFields(int broadfieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from nf in db1.course_narrowFields_master
                    join mapp in db1.broad_narrow_mapping on broadfieldID equals mapp.broadField_Id
                    where nf.id == mapp.narrowField_Id
                    select new
                    {
                        fieldname = nf.fieldname,
                        id = nf.id,
                    }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetDetailedFields(int narrowfieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from df in db1.course_detailsField_master
                    join mapp in db1.narrow_detailed_mapping on narrowfieldID equals mapp.narrowField_Id
                    where df.id == mapp.deatailedField_Id
                    select new
                    {
                        fieldname = df.fieldname,
                        id = df.id,
                    }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }
    private void Bindstudymode()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            //var studymode = db.studymodemaster.ToList();
            //chkStudyModesOffered.DataSource = studymode;
            //chkStudyModesOffered.DataTextField = "description";
            //chkStudyModesOffered.DataValueField = "id";
            //chkStudyModesOffered.DataBind();
            //chkStudyModesOffered.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindimpDate()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var datetype_master = db.datetype_master.ToList();
            ddlimpDates.DataSource = datetype_master;
            ddlimpDates.DataTextField = "description";
            ddlimpDates.DataValueField = "id";
            ddlimpDates.DataBind();
            ddlimpDates.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void Bindtypemaster()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.type_master.ToList();
            ddltype.DataSource = type;
            ddltype.DataTextField = "description";
            ddltype.DataValueField = "id";
            ddltype.DataBind();
            ddltype.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void Bindco_ed()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var co_edList = db.co_ed_master.ToList();
            ddlSingleGender_Co_ed.DataSource = co_edList;
            ddlSingleGender_Co_ed.DataTextField = "description";
            ddlSingleGender_Co_ed.DataValueField = "id";
            ddlSingleGender_Co_ed.DataBind();
            ddlSingleGender_Co_ed.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindSetting()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.Setting_master.ToList();
            ddlsetting.DataSource = type;
            ddlsetting.DataTextField = "description";
            ddlsetting.DataValueField = "id";
            ddlsetting.DataBind();
            ddlsetting.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void Bindreligious_affiliation()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.religious_affiliation_master.ToList();
            ddlReligiousAffiliation.DataSource = type;
            ddlReligiousAffiliation.DataTextField = "description";
            ddlReligiousAffiliation.DataValueField = "id";
            ddlReligiousAffiliation.DataBind();
            ddlReligiousAffiliation.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindCode()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.code_regno_type_master.ToList();
            ddlcodetype.DataSource = type;
            ddlcodetype.DataTextField = "description";
            ddlcodetype.DataValueField = "id";
            ddlcodetype.DataBind();
            ddlcodetype.Items.Insert(0, lst);

            var List = db.tests_master.ToList();
            testList.DataSource = List;
            testList.DataTextField = "description";
            testList.DataValueField = "id";
            testList.DataBind();

            var impDates = db.datetype_master.ToList();
            ddlimpDates.DataSource = List;
            ddlimpDates.DataTextField = "description";
            ddlimpDates.DataValueField = "id";
            ddlimpDates.DataBind();
            ddlimpDates.Items.Insert(0, lst);

            var Selectivity = db.selectivity.ToList();
            ddlSelectivity.DataSource = Selectivity;
            ddlSelectivity.DataTextField = "description";
            ddlSelectivity.DataValueField = "id";
            ddlSelectivity.DataBind();
            ddlSelectivity.Items.Insert(0, lst);


        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindSize()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.size_master.ToList();
            ddlsize.DataSource = type;
            ddlsize.DataTextField = "description";
            ddlsize.DataValueField = "id";
            ddlsize.DataBind();
            ddlsize.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindAge()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.agenumber_master.ToList();
            ddlage.DataSource = type;
            ddlage.DataTextField = "description";
            ddlage.DataValueField = "id";
            ddlage.DataBind();
            ddlage.Items.Insert(0, lst);

            ddlage1.DataSource = type;
            ddlage1.DataTextField = "description";
            ddlage1.DataValueField = "id";
            ddlage1.DataBind();
            ddlage1.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCityDropdown(int countryId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.citymaster.Where(x => x.country_id == countryId).Select(x => new { x.city_id, x.name }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    
    private void sendNotification_toUniversityMail(int universityID, string email1 , string email2)
    {
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        dynamic admindata;
        int isFullService = university.full_service;//(int)Session["FullService"];

        if (isFullService == 0)
            admindata = db.adminusers.Where(x => x.universityId == universityID && x.roleid == 7).FirstOrDefault();
        else if (isFullService == 2)
            admindata = db.adminusers.Where(x => x.universityId == universityID && x.roleid == 13).FirstOrDefault();
        else
            admindata = db.adminusers.Where(x => x.universityId == universityID && x.roleid == 3).FirstOrDefault();

        string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/new_InstitutionCreation_Notification.html"));

        html = html.Replace("@UniversityName", university.university_name);
        html = html.Replace("@universityLogo", "https://" + university.hosturl + "/Docs/" + universityID + "/" + university.logo);

        html = html.Replace("@contactpersona", university.contact_person);
        var adminurl = "https://"+university.hosturl+ "/admin/login.aspx";
        html = html.Replace("@adminLoginurl", adminurl);
        html = html.Replace("@username", admindata.username);
        html = html.Replace("@password", university.CRICOS_Code);

        var registrationlink = "https://" + university.hosturl + "/register.aspx";
        html = html.Replace("@registrationlink", registrationlink);

        var studentURL = "https://" + university.hosturl + "/login.aspx";
        html = html.Replace("@studentURL", studentURL);

        var subject = "FREE TRIAL: Your account is set up & credited with $300";
        if (isFullService == 0)
            subject = "GTE DIRECT FREE TRIAL: Your account is set up & credited with $300";

        objCommon.SendMail(email1, html, subject);
        objCommon.SendMail(email2, html, subject);

        if (webURL.Contains("http://localhost:50180") || webURL.Contains("http://qc.")) { }
        else
            objCommon.SendMail("support@gte.direct", html, subject);

   }

    private void sendNotification_toUser(int universityID, string email) {
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        dynamic admindata;
        int isFullService = university.full_service;//(int)Session["FullService"];

        if (isFullService == 0)
            admindata = db.adminusers.Where(x => x.universityId == universityID && x.roleid == 7).FirstOrDefault();
        else if (isFullService == 2)
            admindata = db.adminusers.Where(x => x.universityId == universityID && x.roleid == 13).FirstOrDefault();
        else
            admindata = db.adminusers.Where(x => x.universityId == universityID && x.roleid == 3).FirstOrDefault();

        string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/new_InstitutionCreation_Notification_to_User.html"));

        html = html.Replace("@UniversityName", university.university_name);
        html = html.Replace("@universityLogo", "https://" + university.hosturl + "/Docs/" + universityID + "/" + university.logo);

        html = html.Replace("@contactpersona", university.contact_person);        
        var adminurl = "https://" + university.hosturl + "/admin/login.aspx";
        html = html.Replace("@adminLoginurl", adminurl);
        html = html.Replace("@username", admindata.username);
        html = html.Replace("@password", university.CRICOS_Code);

        var registrationlink = "https://" + university.hosturl + "/register.aspx";
        html = html.Replace("@registrationlink", registrationlink);

        var studentURL = "https://" + university.hosturl + "/login.aspx";
        html = html.Replace("@studentURL", studentURL);
        var subject = "Your Admin account is set up & ready for use.";
        if (isFullService == 0)
            subject = "GTE DIRECT: Your Admin account is set up & ready for use.";

        objCommon.SendMail(email, html, subject);
        if (webURL.Contains("http://localhost:50180") || webURL.Contains("http://qc.")) { }
        else
            objCommon.SendMail("support@gte.direct", html, subject);


    }

    private void createdfaultadminrole(string cricoscode, int uid, string email, string mobileno)
    {
        try
        {
            adminusers objadmin = new adminusers();

            objadmin.username = "ADMIN";
            objadmin.password = objCommon.EncodePasswordToMD5(cricoscode.Trim());
            objadmin.roleid = 7;
            objadmin.universityId = uid;
            objadmin.status = 1;
            objadmin.email = email;
            objadmin.mobile = mobileno;
            db.adminusers.Add(objadmin);
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void mappeduniversitytoform(int universityid, int service)
    {
        try
        {
            universitywiseformmapping objmapping = new universitywiseformmapping();
            var formlist = db.formmaster.Where(x => x.service == service || x.service == 3).Select(x => x.formid).ToList();
            foreach (var item in formlist)
            {
                objmapping.universityid = universityid;
                objmapping.formid = item;
                db.universitywiseformmapping.Add(objmapping);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void SavedMapped(string chknumber, int fieldID, string fieldname, int uid)
    {
        try
        {
            var mode = "new";
            university_datamapping objmapping = new university_datamapping();
            var data = db.university_datamapping.Where(x => x.fieldname == fieldID && x.chkfield_id == chknumber).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.fieldname = fieldID;
            objmapping.fieldname_ = fieldname;
            objmapping.chkfield_id = chknumber;
            objmapping.university_id = uid;
            if (mode == "new")
                db.university_datamapping.Add(objmapping);
            db.SaveChanges();

        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void save_tab1(university_master universityObj)
    {
        try
        {
            //BAsic
            universityObj.university_flag = Convert.ToInt32(ddlflag.SelectedValue);
            universityObj.codetype = Convert.ToInt32(ddlcodetype.SelectedItem.Value);
            universityObj.CRICOS_Code = txtcoderegNo.Value;
            universityObj.university_name = txtUniName.Value.Trim();
            universityObj.institutionlegalname = txtinstitutionlegalname.Value.Trim();
            universityObj.contact_person = txtUniContactPerson.Value.Trim();
            universityObj.UniContactPersonPosition = txtUniContactPersonPosition.Value.Trim();
            universityObj.email = txtEmail.Value.Trim();
            universityObj.mobile = txtMobile.Value.Trim();
            universityObj.address = txtUniAddress.Value.Trim();
            universityObj.cityid = Convert.ToInt32(hidCityField.Value);
            universityObj.primary_state = txtPrimaryState.Value.Trim();
            universityObj.primaryzipcode = txtprimaryzipcode.Value.Trim();
            universityObj.countryid = Convert.ToInt32(ddlCountry.SelectedValue);
            universityObj.website = txtUniWebsite.Value.Trim();
            universityObj.full_service = Convert.ToInt32(subscription.SelectedValue);
            if (Convert.ToInt32(subscription.SelectedValue) == 1)
                universityObj.sub_gte_service = Convert.ToInt32(ddlGTEService.SelectedValue);
            universityObj.numberof_applicant = txtapplicantno.Value.Trim();
            universityObj.emai_notification1 = txtnotification1.Text.Trim();
            universityObj.emai_notification2 = txtnotification2.Text.Trim();
            universityObj.acceptedmaxage = Convert.ToInt32(ddlage.SelectedValue);
            universityObj.acceptedminage = Convert.ToInt32(ddlage1.SelectedValue);
            universityObj.headerstripcolor = headerstripcolor.Value.Trim();
            universityObj.verticalnavigationcolor = verticalnavigationcolor.Value.Trim();
            universityObj.fontcolor = fontcolor.Value.Trim();
            var url = txthosturl.Value.Trim();
            if (url.ToLower().Contains("www."))
                url = url.Replace("www.", string.Empty);
            universityObj.hosturl = url;
            db.university_master.Add(universityObj);
            db.SaveChanges();
            docPath = docPath + "/" + universityObj.universityid + "/";
            if (logo.HasFile)  //fileupload control contains a file  
            {

                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(logo.PostedFile.FileName);
                string filename = universityObj.university_name.Replace(" ", "-") + extension;
                if (File.Exists(docPath + filename))
                    File.Delete(docPath + filename);
                logo.SaveAs(docPath + filename);
                universityObj.logo = filename;
                //check = db.SaveChanges();
            }
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab1"+ex.StackTrace.ToString()); }
    }
    private void save_tab2(university_master universityObj)
    {
        try
        {
            ////tab 3 OVERVIEW
            if (ddlAffiliation.SelectedValue != "0")
                universityObj.affiliation = ddlAffiliation.SelectedItem.Value;
            if (ddlsize.SelectedValue != "0")
                universityObj.size = Convert.ToInt32(ddlsize.SelectedItem.Value);
            if (ddlsetting.SelectedValue != "0")
                universityObj.setting = Convert.ToInt32(ddlsetting.SelectedItem.Value);
            if (ddlReligiousAffiliation.SelectedValue != "0")
                universityObj.ReligiousAffiliation = Convert.ToInt32(ddlReligiousAffiliation.SelectedItem.Value);
            if (ddlSingleGender_Co_ed.SelectedValue != "0")
                universityObj.SingleGender_Co_ed = Convert.ToInt32(ddlSingleGender_Co_ed.SelectedItem.Value);
            if (ddltype.SelectedValue != "0")
                universityObj.type = ddltype.SelectedItem.Value;

            universityObj.year_established = txtYearEstablish.Value.Trim();
            universityObj.short_description = txtUniSDescription.Value.Trim();
            universityObj.long_description = txtUniLDescription.Value.Trim();
            universityObj.noofcampus = txtnoofcampus.Value.Trim();
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab2="+ex.StackTrace.ToString()); }
    }
    private void save_tab3(university_master universityObj)
    {
        try
        {
            //COURSES
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    SavedMapped(li.Value, 31, "BORAD_FIELD", universityObj.universityid);
                }
            }
            foreach (ListItem li in CheckBoxList2.Items)
            {
                if (li.Selected)
                {
                    SavedMapped(li.Value, 32, "NARROW_FIELD", universityObj.universityid);
                }
            }
            foreach (ListItem li in CheckBoxList3.Items)
            {
                if (li.Selected)
                {
                    SavedMapped(li.Value, 33, "DETAILED_FIELD", universityObj.universityid);
                }
            }
            //STUDENT STATS
            universityObj.TotalEnrolledStudents = txtTotalEnrolledStudents.Text;
            universityObj.DoctoralStudents = txtDoctoralStudents.Text;
            universityObj.GraduateStudents = txtGraduateStudents.Text;
            universityObj.UnderGraduateStudents = txtUnderGraduateStudents.Text;
            universityObj.Certificate_DiplomaStudents = txtCertificate_DiplomaStudents.Text;
            universityObj.Non_awardStudents = txtNon_awardStudents.Text;
            universityObj.SchoolEducationStudents = txtSchoolEducationStudents.Text;
            universityObj.NoofAcademicStaff = txtNoofAcademicStaff.Text;
            universityObj.StafftoStudentRatio = txtStafftoStudentRatio.Text;
            universityObj.FemaleonCampus = txtFemaleonCampus.Text;
            universityObj.AverageAge = txtAverageAge.Text;
            universityObj.ofDomesticStudents = txtofDomesticStudents.Text;
            universityObj.InStateStudents = txtInStateStudents.Text;
            universityObj.ofInternationalStudents = txtofInternationalStudents.Text;
            universityObj.NoofNationalities = txtNoofNationalities.Text;
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab3"+ex.StackTrace.ToString()); }
    }
    private void save_tab4(university_master universityObj)
    {
        try
        {
            //ADMISSIONS
            universityObj.admission_description = txtAdmissionsDescrip.Text;
            universityObj.internationalstudent_description = txtInstrucForInternationalStud.Text;
            universityObj.applied_male_percentage = txtApplied_male.Text;
            universityObj.applied_female_percentage = txtApplied_female.Text;

            universityObj.expected_male_percentage = txtAccepted_male.Text;
            universityObj.expected_female_percentage = txtAccepted_female.Text;

            universityObj.decline_male_percentage = txtDeclined_male.Text;
            universityObj.decline_female_percentage = txtDeclined_female.Text;

            universityObj.AcceptanceRate = txtAcceptanceRate.Text;

            universityObj.FreshmanAdmitted_male_percentage = txtFreshman_male.Text;
            universityObj.FreshmanAdmitted_female_percentage = txtFreshman_female.Text;

            universityObj.international_percentage = txtInternational.Text;
            universityObj.domestic_percentage = txtDomestic.Text;
            foreach (ListItem li in testList.Items)
            {
                if (li.Selected)
                {
                    SavedMapped(li.Value, 41, "TESTS REQUIRED", universityObj.universityid);
                }
            }
            if (ddlSelectivity.SelectedValue != "0")
            {
                universityObj.selectivity = Convert.ToInt32(ddlSelectivity.SelectedValue);
            }
            if (ddlinterviewRequired.SelectedValue != "0")
            {
                universityObj.interviewRequired = Convert.ToInt32(ddlinterviewRequired.SelectedValue);
            }
            if (ddlApplicantfee.SelectedValue != "0")
            {
                universityObj.Applicantfee = Convert.ToInt32(ddlApplicantfee.SelectedValue);
            }
            if (ddlessay.SelectedValue != "0")
            {
                universityObj.Essay = Convert.ToInt32(ddlessay.SelectedValue);
            }
            if (ddlRecommendations.SelectedValue != "0")
            {
                universityObj.Recommendations = Convert.ToInt32(ddlRecommendations.SelectedValue);
            }
            if (ddlSecondaryschoolrecord.SelectedValue != "0")
            {
                universityObj.Secondary_school_record = Convert.ToInt32(ddlSecondaryschoolrecord.SelectedValue);
            }
            if (ddlStandardizedtestscores.SelectedValue != "0")
            {
                universityObj.Standardized_test_scores = Convert.ToInt32(ddlStandardizedtestscores.SelectedValue);
            }
            if (ddlAlumni_aerelationship.SelectedValue != "0")
            {
                universityObj.Alumni_relationship = Convert.ToInt32(ddlAlumni_aerelationship.SelectedValue);
            }
            if (ddlExtracurricularactivities.SelectedValue != "0")
            {
                universityObj.Extracurricular_activities = Convert.ToInt32(ddlExtracurricularactivities.SelectedValue);
            }
            if (ddlParticulartalent_ability.SelectedValue != "0")
            {
                universityObj.Particular_talent = Convert.ToInt32(ddlParticulartalent_ability.SelectedValue);
            }
            if (ddlVolunteerWork.SelectedValue != "0")
            {
                universityObj.Volunteer_Work = Convert.ToInt32(ddlVolunteerWork.SelectedValue);
            }
            if (ddlWorkExperience.SelectedValue != "0")
            {
                universityObj.Work_Experience = Convert.ToInt32(ddlWorkExperience.SelectedValue);
            }
            if (ddlCharacter_personalqualities.SelectedValue != "0")
            {
                universityObj.personal_qualities = Convert.ToInt32(ddlCharacter_personalqualities.SelectedValue);
            }
            if (ddlClassrank.SelectedValue != "0")
            {
                universityObj.Class_rank = Convert.ToInt32(ddlClassrank.SelectedValue);
            }
            if (ddlGeographicalresidence.SelectedValue != "0")
            {
                universityObj.Geographical_residence = Convert.ToInt32(ddlGeographicalresidence.SelectedValue);
            }
            if (ddlMinorityaffiliation.SelectedValue != "0")
            {
                universityObj.Minority_affiliation = Convert.ToInt32(ddlMinorityaffiliation.SelectedValue);
            }
            if (ddlStateresidency.SelectedValue != "0")
            {
                universityObj.State_residency = Convert.ToInt32(ddlStateresidency.SelectedValue);
            }
            if (ddlInterview.SelectedValue != "0")
            {
                universityObj.Interview = Convert.ToInt32(ddlInterview.SelectedValue);
            }
            if (ddlReligiousaffiliationcommitment.SelectedValue != "0")
            {
                universityObj.Religious_commitment = Convert.ToInt32(ddlReligiousaffiliationcommitment.SelectedValue);
            }
            if (ddlGenuineStudentAssessment.SelectedValue != "0")
            {
                universityObj.Genuine_Assessment = Convert.ToInt32(ddlGenuineStudentAssessment.SelectedValue);
            }
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab4="+ex.StackTrace.ToString()); }
    }
    private void save_tab5(university_master universityObj)
    {
        try
        {//DEADLINES
            if (ddlimpDates.SelectedValue != "0")
            {
                universityObj.impDates = Convert.ToInt32(ddlimpDates.SelectedValue);
            }
            universityObj.impdatesDescription = ttimpdatesDescription.Text;

            //FEE & FUNDING
            universityObj.avgTuitionFee = txtAvgTuitionFee.Text;
            universityObj.AvgFinancialAidPackage = txtAvgFinancialAidPackage.Text;
            universityObj.FinancialneedMet = txtFinancialneedMet.Text;
            foreach (ListItem li in chkdomesticstudent.Items)
            {
                if (li.Selected)
                {
                    SavedMapped(li.Value, 51, "Fee_anda-funding_domesti", universityObj.universityid);
                }
            }
            if (chkstudecarescholarship_.Checked == true)
                universityObj.studecarescholarship = 1;

            docPath = docPath + "/universitymasterdocuments/";

            //ACCREDITION & RANKINGS
            universityObj.AccreditationName = AccreditationName.Text;
            universityObj.accreditation_description = txtAccreditation.Text;
            if (AccreditationFile.HasFile)
            {
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(AccreditationFile.PostedFile.FileName);
                string filename = string.Concat(Guid.NewGuid(), extension);
                if (File.Exists(docPath + filename))
                    File.Delete(docPath + filename);
                AccreditationFile.SaveAs(docPath + filename);
                universityObj.AccreditationFile_path = filename;
            }
            if (ddlTimesHigherEducationRanking_year.SelectedValue != "0")
                universityObj.TimesHigherEducationRanking_year = ddlTimesHigherEducationRanking_year.SelectedValue;
            universityObj.timesHigherEducationRanking = txtTimesHigherEducationRanking.Text;

            if (ddlQSWorldUniversityRanking_year.SelectedValue != "0")
                universityObj.QSWorldUniversityRanking_year = ddlQSWorldUniversityRanking_year.SelectedValue;
            universityObj.QSWorldUniversityRanking = txtQSWorldUniversityRanking.Text;

            if (ddlAcademicRankingofWorldUniversities_year.SelectedValue != "0")
                universityObj.academicRankingofWorldUniversities_year = ddlAcademicRankingofWorldUniversities_year.SelectedValue;
            universityObj.academicRankingofWorldUniversities = txtAcademicRankingofWorldUniversities.Text;

            universityObj.rankings_name = txtRankings_name.Text;
            if (ddlRankingsyear.SelectedValue != "0")
                universityObj.rankings_year = ddlRankingsyear.SelectedValue;
            universityObj.rankings_description = txtRankings_description.Text;
            if (Rankings_FileUpload.HasFile)
            {

                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(Rankings_FileUpload.PostedFile.FileName);
                string filename = string.Concat(Guid.NewGuid(), extension);
                if (File.Exists(docPath + filename))
                    File.Delete(docPath + filename);
                Rankings_FileUpload.SaveAs(docPath + filename);
                universityObj.rankings_path = filename;
            }

            universityObj.awards_name = txtawardsname.Text;
            if (ddlawardsYear.SelectedValue != "0")
                universityObj.awards_year = ddlawardsYear.SelectedValue;
            universityObj.awards_descriptiom = txtawards.Text;
            if (awards_FileUpload.HasFile)
            {

                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(awards_FileUpload.PostedFile.FileName);
                string filename = string.Concat(Guid.NewGuid(), extension);
                if (File.Exists(docPath + filename))
                    File.Delete(docPath + filename);
                awards_FileUpload.SaveAs(docPath + filename);
                universityObj.awards_path = filename;
            }

            universityObj.subjectRankings_name = txtRankings_name.Text;
            if (ddlSubjectRankings.SelectedValue != "0")
                universityObj.subjectRankings_year = ddlSubjectRankings.SelectedValue;
            universityObj.subjectRankings_description = txtSubjectRankings.Text;
            if (SubjectRankingsFile.HasFile)
            {

                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(SubjectRankingsFile.PostedFile.FileName);
                string filename = string.Concat(Guid.NewGuid(), extension);
                if (File.Exists(docPath + filename))
                    File.Delete(docPath + filename);
                SubjectRankingsFile.SaveAs(docPath + filename);
                universityObj.subjectRankings_path = filename;
            }
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab5="+ex.StackTrace.ToString()); }
    }
    private void save_tab6(university_master universityObj)
    {
        try
        {
            ///////tab5
            universityObj.examInstruction = txtexamInstruction.Text.Trim();
            universityObj.notes_disclaimer = txtNotesDisclaimer.Value.Trim();
            universityObj.sop_instruction_for_applicant = txtUniversitySop.Text;
            universityObj.scholarship_instruction = txtUniversityScholarship.Text;
            universityObj.fee_payment_instructions = txtUniversityFeePayment.Text;
            universityObj.acceptance_terms = txtAcceptanceTerms.Text;
            universityObj.deferment_terms = txtDefermentTerms.Text;
            universityObj.rejection_terms = txtRejectionTerms.Text;
            universityObj.withdrawn_terms = txtWithdrawnTerms.Text;
            universityObj.application_instruction = txtUniversityApplication.Text;
            universityObj.supprot_service_instructions = txtsupportserviceInstructions.Text;
            universityObj.coe_instruction = txtUniversityCOE.Text;
            universityObj.visa_instructions = txtvisainstruction.Text;
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab6="+ex.StackTrace.ToString()); }
    }
    private void save_tab7(university_master universityObj)
    {
        try
        {
            if (txtUniLatitude.Value != "")
                universityObj.latitude = Convert.ToDecimal(txtUniLatitude.Value.Trim());
            if (txtUniLongitude.Value != "")
                universityObj.longitude = Convert.ToDecimal(txtUniLongitude.Value.Trim());
            if(ddlTimeZone.SelectedValue != "0")
                universityObj.time_zone = ddlTimeZone.SelectedValue;
            universityObj.closest_airport = txtUniAirport.Value.Trim();
            universityObj.distance_from_airport = txtUniAirportDistance.Value.Trim() + " " + airDistanceUnit.Value.Trim();
            universityObj.distance_from_railway = txtUniRailDistance.Value.Trim() + " " + railDistanceUnit.Value.Trim();
            universityObj.getting_around = txtUniGettingAround.Value.Trim();
            universityObj.chatid = txtunichatId.Value.Trim();
            universityObj.university_gtm_code = txtgtmcode.Text.Trim();
            universityObj.proctor1_name = txtproctorname1.Text.Trim();
            universityObj.proctor1_contactno = txtproctorno1.Text.Trim();
            universityObj.proctor1_email = txtproctoremail1.Text.Trim();
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog("tab7=" + ex.StackTrace.ToString()); }
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

                save_tab1(universityObj);
                save_tab2(universityObj);
                save_tab3(universityObj);
                save_tab4(universityObj);
                save_tab5(universityObj);
                save_tab6(universityObj);
                save_tab7(universityObj);

                //universityObj.Is_active = "1";
                //db.university_master.Add(universityObj);
                db.SaveChanges();
                mappeduniversitytoform(universityObj.universityid, universityObj.full_service);
                createdfaultadminrole(universityObj.CRICOS_Code, universityObj.universityid, universityObj.email, universityObj.mobile);
                //sendNotification_toUser(universityObj.universityid, universityObj.email);
                //sendNotification_toUniversityMail(universityObj.universityid, universityObj.emai_notification1, universityObj.emai_notification2);

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
    private void BindNarrowField()
    {
        try
        {
            var temp = (from bf in db.course_narrowFields_master
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().ToList();


            CheckBoxList2.DataSource = temp;
            CheckBoxList2.DataTextField = "fieldname";
            CheckBoxList2.DataValueField = "id";
            CheckBoxList2.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindDetailedField()
    {
        try
        {
            var temp = (from bf in db.course_detailsField_master
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().ToList();


            CheckBoxList3.DataSource = temp;
            CheckBoxList3.DataTextField = "fieldname";
            CheckBoxList3.DataValueField = "id";
            CheckBoxList3.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}