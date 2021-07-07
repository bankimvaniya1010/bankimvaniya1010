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

public partial class admin_universitydetails_editN : System.Web.UI.Page
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
            int universityId;
            if (!Int32.TryParse(Request.QueryString["universityID"], out universityId))
                Response.Redirect(webURL + "admin/default.aspx");
            BindBroadField(); BindNarrowField(); BindDetailedField();
            BindDropdowns(universityId);
            FillYears(ddlSubjectRankings); FillYears(ddlawardsYear); FillYears(ddlRankingsyear); FillYears(ddlAcademicRankingofWorldUniversities_year); FillYears(ddlQSWorldUniversityRanking_year); FillYears(ddlTimesHigherEducationRanking_year);
            objCommon.Bindadmisionfactor_dropdown_master(ddlessay);objCommon.Bindadmisionfactor_dropdown_master(ddlRecommendations); objCommon.Bindadmisionfactor_dropdown_master(ddlSecondaryschoolrecord); objCommon.Bindadmisionfactor_dropdown_master(ddlStandardizedtestscores); objCommon.Bindadmisionfactor_dropdown_master(ddlAlumni_aerelationship); objCommon.Bindadmisionfactor_dropdown_master(ddlExtracurricularactivities);
            objCommon.Bindadmisionfactor_dropdown_master(ddlParticulartalent_ability); objCommon.Bindadmisionfactor_dropdown_master(ddlVolunteerWork); objCommon.Bindadmisionfactor_dropdown_master(ddlWorkExperience); objCommon.Bindadmisionfactor_dropdown_master(ddlCharacter_personalqualities); objCommon.Bindadmisionfactor_dropdown_master(ddlClassrank); objCommon.Bindadmisionfactor_dropdown_master(ddlGeographicalresidence);
            objCommon.Bindadmisionfactor_dropdown_master(ddlGenuineStudentAssessment); objCommon.Bindadmisionfactor_dropdown_master(ddlReligiousaffiliationcommitment); objCommon.Bindadmisionfactor_dropdown_master(ddlInterview); objCommon.Bindadmisionfactor_dropdown_master(ddlMinorityaffiliation); objCommon.Bindadmisionfactor_dropdown_master(ddlStateresidency);

            BindAge(); BindAge1();
            objCommon.BindCountries(ddlCountry);
            objCommon.BindTimeZone(ddlTimeZone);
            if (Request.QueryString["universityID"] != null)
            {
                PopulateUniversity(universityId);
            }
            else
                Response.Redirect(webURL + "admin/default.aspx");
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
    private void PopulateUniversity(int universityId) {
        try {

            university_master existingUninversity = db.university_master.Where(obj => obj.universityid == universityId && obj.IsDeleted != 1).First();
                        
            if (existingUninversity != null)
            {
                ViewState["universityID"] = universityId;

                //objCommon.BindCountries(ddlCountry);
                //objCommon.BindTimeZone(ddlTimeZone);
                txtcoderegNo.Value = existingUninversity.CRICOS_Code;
                string[] airportDistanceValue = null;
                string[] railDistanceValue = null;

                if (!string.IsNullOrEmpty(existingUninversity.distance_from_airport))
                {
                    airportDistanceValue = existingUninversity.distance_from_airport.Split(' ');
                }
                if (!string.IsNullOrEmpty(existingUninversity.distance_from_railway))
                {
                    railDistanceValue = existingUninversity.distance_from_railway.Split(' ');
                }

                if (airportDistanceValue != null)
                {
                    txtUniAirportDistance.Value = airportDistanceValue[0];
                    foreach (ListItem item in airDistanceUnit.Items)
                    {
                        if (item.Text == airportDistanceValue[1])
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
                if (railDistanceValue != null)
                {
                    txtUniRailDistance.Value = railDistanceValue[0];
                    foreach (ListItem item in railDistanceUnit.Items)
                    {
                        if (item.Text == railDistanceValue[1])
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
                if (existingUninversity.codetype != null && existingUninversity.codetype != 0)
                {
                    ddlcodetype.ClearSelection();
                    ddlcodetype.Items.FindByValue(existingUninversity.codetype.ToString()).Selected = true;
                }

                

                txtUniName.Value = existingUninversity.university_name;
                txtinstitutionlegalname.Value = existingUninversity.institutionlegalname;
                txtnoofcampus.Value = existingUninversity.noofcampus;
                if (existingUninversity.university_flag != null)
                {
                    ddlflag.ClearSelection();
                    ddlflag.Items.FindByValue(existingUninversity.university_flag.ToString()).Selected = true;
                }
                txthosturl.Value = existingUninversity.hosturl;
                txtUniAddress.Value = existingUninversity.address;
                txtUniContactPerson.Value = existingUninversity.contact_person;
                txtUniContactPersonPosition.Value = existingUninversity.UniContactPersonPosition;
                txtUniWebsite.Value = existingUninversity.website;
                txtPrimaryState.Value = existingUninversity.primary_state;
                txtprimaryzipcode.Value = existingUninversity.primaryzipcode;
                if (existingUninversity.countryid != null)
                {
                    ddlCountry.ClearSelection();
                    ddlCountry.Items.FindByValue(existingUninversity.countryid.ToString()).Selected = true;
                }

                if (!string.IsNullOrEmpty(existingUninversity.affiliation)  && existingUninversity.affiliation != "0")
                {
                    ddlAffiliation.ClearSelection();
                    ddlAffiliation.Items.FindByValue(existingUninversity.affiliation.ToString()).Selected = true;
                }
                if (existingUninversity.size  != null && existingUninversity.size != 0)
                {
                    ddlsize.ClearSelection();
                    ddlsize.Items.FindByValue(existingUninversity.size.ToString()).Selected = true;
                }

                if (existingUninversity.setting != null && existingUninversity.setting!= 0)
                {
                    ddlsetting.ClearSelection();
                    ddlsetting.Items.FindByValue(existingUninversity.setting.ToString()).Selected = true;
                }
                if (existingUninversity.ReligiousAffiliation != null && existingUninversity.ReligiousAffiliation != 0)
                {
                    ddlReligiousAffiliation.ClearSelection();
                    ddlReligiousAffiliation.Items.FindByValue(existingUninversity.ReligiousAffiliation.ToString()).Selected = true;
                }
              
                if (existingUninversity.SingleGender_Co_ed != null && existingUninversity.SingleGender_Co_ed != 0)
                {
                    ddlSingleGender_Co_ed.ClearSelection();
                    ddlSingleGender_Co_ed.Items.FindByValue(existingUninversity.SingleGender_Co_ed.ToString()).Selected = true;
                }
                if (existingUninversity.type != null && existingUninversity.type !="0")
                {
                    ddltype.ClearSelection();
                    ddltype.Items.FindByValue(existingUninversity.type.ToString()).Selected = true;
                }
                txtEmail.Value = existingUninversity.email;
                txtMobile.Value = existingUninversity.mobile;
                txtunichatId.Value = existingUninversity.chatid;
                //txtUniType.Value = existingUninversity.type;
                txtYearEstablish.Value = existingUninversity.year_established;
                txtUniSDescription.Value = existingUninversity.short_description;
                txtUniLDescription.Value = existingUninversity.long_description;
                txtUniAirport.Value = existingUninversity.closest_airport;
                txtapplicantno.Value = existingUninversity.numberof_applicant.ToString();

                txtUniGettingAround.Value = existingUninversity.getting_around;
                if (existingUninversity.latitude != null)
                    txtUniLatitude.Value = Convert.ToString(existingUninversity.latitude);
                if (existingUninversity.longitude != null)
                    txtUniLongitude.Value = Convert.ToString(existingUninversity.longitude);


                if (existingUninversity.time_zone != null && existingUninversity.time_zone != "0")
                {
                    ddlTimeZone.ClearSelection();
                    ddlTimeZone.Items.FindByValue(existingUninversity.time_zone.ToString());
                }
                hidCityField.Value = Convert.ToString(existingUninversity.cityid);
                bindCityDropdown(Convert.ToInt32(existingUninversity.countryid));
                if (existingUninversity.cityid != null)
                    ddlCity.Items.FindByValue(existingUninversity.cityid.ToString()).Selected = true;

                if (existingUninversity.full_service != null)
                {
                    subscription.ClearSelection();
                    subscription.Items.FindByValue(existingUninversity.full_service.ToString()).Selected = true;
                }
                if (existingUninversity.full_service == 1)
                {
                    Divgteservice.Attributes.Add("style", "display:block");
                    if (existingUninversity.sub_gte_service != null)
                    {
                        ddlGTEService.ClearSelection();
                        ddlGTEService.Items.FindByValue(existingUninversity.sub_gte_service.ToString()).Selected = true;
                    }
                }
                if (existingUninversity.acceptedmaxage != null )
                {
                    ddlage.ClearSelection();
                    ddlage.Items.FindByValue(existingUninversity.acceptedmaxage.ToString()).Selected = true;
                }
                if (existingUninversity.acceptedminage != null)
                {
                    ddlage1.ClearSelection();
                    ddlage1.Items.FindByValue(existingUninversity.acceptedminage.ToString()).Selected = true;
                }
                //txtUniAcceptedMaxAge.Value = Convert.ToString(existingUninversity.acceptedmaxage);
                //txtUniAcceptedMinAge.Value = Convert.ToString(existingUninversity.acceptedminage);
                if (existingUninversity.headerstripcolor != "")
                    headerstripcolor.Value = existingUninversity.headerstripcolor;
                if (existingUninversity.verticalnavigationcolor != "")
                    verticalnavigationcolor.Value = existingUninversity.verticalnavigationcolor;
                if (existingUninversity.fontcolor != "")
                    fontcolor.Value = existingUninversity.fontcolor;
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
                if (!string.IsNullOrEmpty(existingUninversity.university_gtm_code))
                    txtgtmcode.Text = Convert.ToString(existingUninversity.university_gtm_code);
                txtproctorname1.Text = existingUninversity.proctor1_name;
                txtproctorno1.Text = existingUninversity.proctor1_contactno;
                txtproctoremail1.Text = existingUninversity.proctor1_email;
                txtexamInstruction.Text = existingUninversity.examInstruction;
                txtnotification1.Text = existingUninversity.emai_notification1;
                txtnotification2.Text = existingUninversity.emai_notification2;

                //foreach (ListItem item in subscription.Items)
                //{
                //    string value = Convert.ToString(existingUninversity.full_service) ? "1" : "0";
                //    if (item.Value == value)
                //    {
                //        item.Selected = true;
                //        break;
                //    }
                //}
                txtNotesDisclaimer.Value = existingUninversity.notes_disclaimer;
                    
                if (existingUninversity.logo != null)
                {
                    imagepath = webURL + "/Docs/" + existingUninversity.universityid + "/" + existingUninversity.logo;
                    hidLogo.Value = existingUninversity.logo;
                }
                //ADMISSIONS
                txtAdmissionsDescrip.Text = existingUninversity.admission_description ;
                txtInstrucForInternationalStud.Text = existingUninversity.internationalstudent_description;
                txtApplied_male.Text = existingUninversity.applied_male_percentage;
                txtApplied_female.Text = existingUninversity.applied_female_percentage;

                txtAccepted_male.Text = existingUninversity.expected_male_percentage;
                txtAccepted_female.Text = existingUninversity.expected_female_percentage;

                txtDeclined_male.Text = existingUninversity.decline_male_percentage;
                txtDeclined_female.Text = existingUninversity.decline_female_percentage;

                txtAcceptanceRate.Text = existingUninversity.AcceptanceRate;

                txtFreshman_male.Text = existingUninversity.FreshmanAdmitted_male_percentage;
                 txtFreshman_female.Text = existingUninversity.FreshmanAdmitted_female_percentage;

                txtInternational.Text = existingUninversity.international_percentage ;
                txtDomestic.Text = existingUninversity.domestic_percentage;

                PopulateMapping(testList, universityId, 41);

                if (existingUninversity.selectivity != null)
                {
                    ddlSelectivity.ClearSelection();
                    ddlSelectivity.Items.FindByValue(existingUninversity.selectivity.ToString()).Selected = true;
                }
                if (existingUninversity.interviewRequired != null)
                {
                    ddlinterviewRequired.ClearSelection();
                    ddlinterviewRequired.Items.FindByValue(existingUninversity.interviewRequired.ToString()).Selected = true;
                }
                if (existingUninversity.Applicantfee != null)
                {
                    ddlApplicantfee.ClearSelection();
                    ddlApplicantfee.Items.FindByValue(existingUninversity.Applicantfee.ToString()).Selected = true;
                }
                if (existingUninversity.Essay != null)
                {
                    ddlessay.ClearSelection();
                    ddlessay.Items.FindByValue(existingUninversity.Essay.ToString()).Selected = true;
                }
                if (existingUninversity.Recommendations != null)
                {
                    ddlRecommendations.ClearSelection();
                    ddlRecommendations.Items.FindByValue(existingUninversity.Recommendations.ToString()).Selected = true;
                }
                if (existingUninversity.Secondary_school_record != null)
                {
                    ddlSecondaryschoolrecord.ClearSelection();
                    ddlSecondaryschoolrecord.Items.FindByValue(existingUninversity.Secondary_school_record.ToString()).Selected = true;
                }
                if (existingUninversity.Standardized_test_scores != null)
                {
                    ddlStandardizedtestscores.ClearSelection();
                    ddlStandardizedtestscores.Items.FindByValue(existingUninversity.Standardized_test_scores.ToString()).Selected = true;
                }
                if (existingUninversity.Alumni_relationship != null)
                {
                    ddlAlumni_aerelationship.ClearSelection();
                    ddlAlumni_aerelationship.Items.FindByValue(existingUninversity.Alumni_relationship.ToString()).Selected = true;
                }
                if (existingUninversity.Extracurricular_activities != null)
                {
                    ddlExtracurricularactivities.ClearSelection();
                    ddlExtracurricularactivities.Items.FindByValue(existingUninversity.Extracurricular_activities.ToString()).Selected = true;
                }
                if (existingUninversity.Particular_talent != null)
                {
                    ddlParticulartalent_ability.ClearSelection();
                    ddlParticulartalent_ability.Items.FindByValue(existingUninversity.Particular_talent.ToString()).Selected = true;
                }
                if (existingUninversity.Volunteer_Work != null)
                {
                    ddlVolunteerWork.ClearSelection();
                    ddlVolunteerWork.Items.FindByValue(existingUninversity.Volunteer_Work.ToString()).Selected = true;
                }
                if (existingUninversity.Work_Experience != null)
                {
                    ddlWorkExperience.ClearSelection();
                    ddlWorkExperience.Items.FindByValue(existingUninversity.Work_Experience.ToString()).Selected = true;
                }
                if (existingUninversity.personal_qualities != null)
                {
                    ddlCharacter_personalqualities.ClearSelection();
                    ddlCharacter_personalqualities.Items.FindByValue(existingUninversity.personal_qualities.ToString()).Selected = true;
                }
                if (existingUninversity.Class_rank != null)
                {
                    ddlClassrank.ClearSelection();
                    ddlClassrank.Items.FindByValue(existingUninversity.Class_rank.ToString()).Selected = true;
                }
                if (existingUninversity.Geographical_residence != null)
                {
                    ddlGeographicalresidence.ClearSelection();
                    ddlGeographicalresidence.Items.FindByValue(existingUninversity.Geographical_residence.ToString()).Selected = true;
                }
                if (existingUninversity.Minority_affiliation != null)
                {
                    ddlMinorityaffiliation.ClearSelection();
                    ddlMinorityaffiliation.Items.FindByValue(existingUninversity.Minority_affiliation.ToString()).Selected = true;
                }
                if (existingUninversity.State_residency != null)
                {
                    ddlStateresidency.ClearSelection();
                    ddlStateresidency.Items.FindByValue(existingUninversity.State_residency.ToString()).Selected = true;
                }
                if (existingUninversity.Interview != null)
                {
                    ddlInterview.ClearSelection();
                    ddlInterview.Items.FindByValue(existingUninversity.Interview.ToString()).Selected = true;
                }
                if (existingUninversity.Religious_commitment != null)
                {
                    ddlReligiousaffiliationcommitment.ClearSelection();
                    ddlReligiousaffiliationcommitment.Items.FindByValue(existingUninversity.Religious_commitment.ToString()).Selected = true;
                }
                if (existingUninversity.Genuine_Assessment != null)
                {
                    ddlGenuineStudentAssessment.ClearSelection();
                    ddlGenuineStudentAssessment.Items.FindByValue(existingUninversity.Genuine_Assessment.ToString()).Selected = true;
                }
                //DEADLINES
                if (existingUninversity.impDates != null && existingUninversity.impDates != 0)
                {
                    ddlimpDates.ClearSelection();
                    ddlimpDates.Items.FindByValue(existingUninversity.impDates.ToString()).Selected = true;
                }
                ttimpdatesDescription.Text = existingUninversity.impdatesDescription;

                //FEE & FUNDING
                txtAvgTuitionFee.Text = existingUninversity.avgTuitionFee;
                txtAvgFinancialAidPackage.Text = existingUninversity.AvgFinancialAidPackage;
                txtFinancialneedMet.Text = existingUninversity.FinancialneedMet;
                if (existingUninversity.studecarescholarship == 1 )
                    chkstudecarescholarship_.Checked = true;

                PopulateMapping(chkdomesticstudent, universityId, 51);

                //ACCREDITION & RANKINGS
                AccreditationName.Text= existingUninversity.AccreditationName;
                txtAccreditation.Text= existingUninversity.accreditation_description;
                if (existingUninversity.AccreditationFile_path != null)
                {
                    accreditationLink.Text = "View File";
                    accreditationLink.NavigateUrl = webURL + "/Docs/"+existingUninversity.universityid+ "/universitymasterdocuments/" + existingUninversity.AccreditationFile_path;
                    Hid_accreditation.Value = existingUninversity.AccreditationFile_path;
                }
                if (existingUninversity.TimesHigherEducationRanking_year != null) {
                    ddlTimesHigherEducationRanking_year.ClearSelection();
                    ddlTimesHigherEducationRanking_year.Items.FindByValue(existingUninversity.TimesHigherEducationRanking_year.ToString()).Selected = true;
                }
                txtTimesHigherEducationRanking.Text = existingUninversity.timesHigherEducationRanking;

                if (existingUninversity.QSWorldUniversityRanking_year != null)
                {
                    ddlQSWorldUniversityRanking_year.ClearSelection();
                    ddlQSWorldUniversityRanking_year.Items.FindByValue(existingUninversity.QSWorldUniversityRanking_year.ToString()).Selected = true;
                }
                txtQSWorldUniversityRanking.Text = existingUninversity.QSWorldUniversityRanking;
                if (existingUninversity.academicRankingofWorldUniversities_year != null)
                {
                    ddlAcademicRankingofWorldUniversities_year.ClearSelection();
                    ddlAcademicRankingofWorldUniversities_year.Items.FindByValue(existingUninversity.academicRankingofWorldUniversities_year.ToString()).Selected = true;
                }
                txtAcademicRankingofWorldUniversities.Text = existingUninversity.academicRankingofWorldUniversities;
                txtRankings_name.Text = existingUninversity.rankings_name;
                if (existingUninversity.rankings_year != null)
                {
                    ddlRankingsyear.ClearSelection();
                    ddlRankingsyear.Items.FindByValue(existingUninversity.rankings_year.ToString()).Selected = true;
                }
                existingUninversity.rankings_description = txtRankings_description.Text;
                if (existingUninversity.rankings_path != null)
                {
                    RankingsLink.Text = "View File";
                    RankingsLink.NavigateUrl = webURL + "/Docs/" + existingUninversity.universityid + "/universitymasterdocuments/" + existingUninversity.rankings_path;
                    HidRankings.Value = existingUninversity.rankings_path;
                }
                txtawardsname.Text = existingUninversity.awards_name;
                if (existingUninversity.awards_year != null)
                {
                    ddlawardsYear.ClearSelection();
                    ddlawardsYear.Items.FindByValue(existingUninversity.awards_year.ToString()).Selected = true;
                }
                txtawards.Text = existingUninversity.awards_descriptiom;
                if (existingUninversity.awards_path != null)
                {
                    awardsLink.Text = "View File";
                    awardsLink.NavigateUrl = webURL + "/Docs/" + existingUninversity.universityid + "/universitymasterdocuments/" + existingUninversity.awards_path;
                    Hidawards.Value = existingUninversity.awards_path;
                }

                txtRankings_name.Text = existingUninversity.subjectRankings_name;
                if (existingUninversity.subjectRankings_year != null)
                {
                    ddlSubjectRankings.ClearSelection();
                    ddlSubjectRankings.Items.FindByValue(existingUninversity.subjectRankings_year.ToString()).Selected = true;
                }
                txtSubjectRankings.Text = existingUninversity.subjectRankings_description;
                if (existingUninversity.subjectRankings_path != null)
                {
                    SubjectRankingsFileLink.Text = "View File";
                    SubjectRankingsFileLink.NavigateUrl = webURL + "/Docs/" + existingUninversity.universityid + "/universitymasterdocuments/" + existingUninversity.subjectRankings_path;
                    HidSubjectRankingsFile.Value = existingUninversity.subjectRankings_path;
                }
                //STUDENT STATS
                txtTotalEnrolledStudents.Text = existingUninversity.TotalEnrolledStudents ;
                txtDoctoralStudents.Text = existingUninversity.DoctoralStudents;
                txtGraduateStudents.Text = existingUninversity.GraduateStudents;
                 txtUnderGraduateStudents.Text = existingUninversity.UnderGraduateStudents;
                txtCertificate_DiplomaStudents.Text = existingUninversity.Certificate_DiplomaStudents;
                txtNon_awardStudents.Text = existingUninversity.Non_awardStudents;
                txtSchoolEducationStudents.Text = existingUninversity.SchoolEducationStudents;
                txtNoofAcademicStaff.Text = existingUninversity.NoofAcademicStaff;
                txtStafftoStudentRatio.Text = existingUninversity.StafftoStudentRatio;
                txtFemaleonCampus.Text = existingUninversity.FemaleonCampus;
                txtAverageAge.Text = existingUninversity.AverageAge ;
                txtofDomesticStudents.Text = existingUninversity.ofDomesticStudents;
                txtInStateStudents.Text = existingUninversity.InStateStudents;
                txtofInternationalStudents.Text = existingUninversity.ofInternationalStudents;
                txtNoofNationalities.Text = existingUninversity.NoofNationalities;

                ////COURSES
                PopulateMapping(CheckBoxList1, universityId, 31);
                PopulateMapping(CheckBoxList2, universityId, 32);
                PopulateMapping(CheckBoxList3, universityId, 33);
                tctcoursedescription.Text = existingUninversity.courseDescription ;
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University does not exists')", true);
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString()); }
    }

    private void PopulateMapping(CheckBoxList chk_, int uid, int fieldname) {
        try {
            chk_.ClearSelection();
            var universityWise = db.university_datamapping.Where(x => x.fieldname == fieldname && x.university_id == uid).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chk_.Items.FindByValue(universityWise[k].chkfield_id.ToString()).Selected = true;
            }
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
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindAge1()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var type = db.agenumber_master.ToList();
           
            ddlage1.DataSource = type;
            ddlage1.DataTextField = "description";
            ddlage1.DataValueField = "id";
            ddlage1.DataBind();
            ddlage1.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindDropdowns(int uid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var code_type = db.code_regno_type_master.ToList();
            ddlcodetype.DataSource = code_type;
            ddlcodetype.DataTextField = "description";
            ddlcodetype.DataValueField = "id";
            ddlcodetype.DataBind();
            ddlcodetype.Items.Insert(0, lst);

            var size = db.size_master.ToList();
            ddlsize.DataSource = size;
            ddlsize.DataTextField = "description";
            ddlsize.DataValueField = "id";
            ddlsize.DataBind();
            ddlsize.Items.Insert(0, lst);

            var settings = db.Setting_master.ToList();
            ddlsetting.DataSource = settings;
            ddlsetting.DataTextField = "description";
            ddlsetting.DataValueField = "id";
            ddlsetting.DataBind();
            ddlsetting.Items.Insert(0, lst);

            var religious = db.religious_affiliation_master.ToList();
            ddlReligiousAffiliation.DataSource = religious;
            ddlReligiousAffiliation.DataTextField = "description";
            ddlReligiousAffiliation.DataValueField = "id";
            ddlReligiousAffiliation.DataBind();
            ddlReligiousAffiliation.Items.Insert(0, lst);

            var co_ed_master = db.co_ed_master.ToList();
            ddlSingleGender_Co_ed.DataSource = co_ed_master;
            ddlSingleGender_Co_ed.DataTextField = "description";
            ddlSingleGender_Co_ed.DataValueField = "id";
            ddlSingleGender_Co_ed.DataBind();
            ddlSingleGender_Co_ed.Items.Insert(0, lst);

            var type = db.type_master.ToList();
            ddltype.DataSource = type;
            ddltype.DataTextField = "description";
            ddltype.DataValueField = "id";
            ddltype.DataBind();
            ddltype.Items.Insert(0, lst);

            var Selectivity = db.selectivity.ToList();
            ddlSelectivity.DataSource = Selectivity;
            ddlSelectivity.DataTextField = "description";
            ddlSelectivity.DataValueField = "id";
            ddlSelectivity.DataBind();
            ddlSelectivity.Items.Insert(0, lst);

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

            //var StudyModesOffered = db.studymodemaster.Where(x => x.universityid == uid).ToList();
            //chkStudyModesOffered.DataSource = StudyModesOffered;
            //chkStudyModesOffered.DataTextField = "description";
            //chkStudyModesOffered.DataValueField = "id";
            //chkStudyModesOffered.DataBind();

            //var studylevelmaster = db.studylevelmaster.ToList();
            //chkLevelofStudyOffered.DataSource = studylevelmaster;
            //chkLevelofStudyOffered.DataTextField = "studylevel";
            //chkLevelofStudyOffered.DataValueField = "studylevelid";
            //chkLevelofStudyOffered.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void bindCityDropdown(int countryId)
    {
        try
        {
            var cityMaster = db.citymaster.Where(x => x.country_id == countryId).ToList();

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
        university_master universityObj = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).First();
        try
        {
            docPath = docPath + "/" + universityObj.universityid + "/";
            save_tab1(universityObj);
            save_tab2(universityObj);
            save_tab3(universityObj);
            save_tab4(universityObj);
            save_tab5(universityObj);
            save_tab6(universityObj);
            save_tab7(universityObj);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('University details updated successfully.');window.location='" + webURL + "admin/universitymaster.aspx';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    private void save_tab1(university_master universityObj) {
        try {
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    private void save_tab2(university_master universityObj)
    {
        try {
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    private void save_tab3(university_master universityObj)
    {
        try {
            //COURSES
            List<int> broadIDList = new List<int>();
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    broadIDList.Add(Convert.ToInt32(li.Value));
                    
                }
            }
           SavedMapped(31, "BORAD_FIELD", universityObj.universityid,broadIDList);
            
            List<int> narrowList = new List<int>();
            foreach (ListItem li in CheckBoxList2.Items)
            {
                if (li.Selected)
                {
                    narrowList.Add(Convert.ToInt32(li.Value));

                }
            }
           SavedMapped(32, "NARROW_FIELD", universityObj.universityid,narrowList);

            List<int> deatiledList = new List<int>();
            foreach (ListItem li in CheckBoxList3.Items)
            {
                if (li.Selected)
                {
                    deatiledList.Add(Convert.ToInt32(li.Value));
                }
            }
            SavedMapped(33, "DETAILED_FIELD", universityObj.universityid, deatiledList);


            universityObj.courseDescription = tctcoursedescription.Text;
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    private void save_tab4(university_master universityObj)
    {
        try {
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

            List<int> lst = new List<int>();
            foreach (ListItem li in testList.Items)
            {
                if (li.Selected)
                {
                    lst.Add(Convert.ToInt32(li.Value));
                }
            }
            SavedMapped(41, "TESTS REQUIRED", universityObj.universityid, lst);

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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
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

            List<int> chkdomesticstudentlst = new List<int>();
            foreach (ListItem li in chkdomesticstudent.Items)
            {
                if (li.Selected)
                {
                    chkdomesticstudentlst.Add(Convert.ToInt32(li.Value));
                }
            }
            SavedMapped(51, "Fee_anda-funding_domesti", universityObj.universityid, chkdomesticstudentlst);

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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    private void save_tab7(university_master universityObj)
    {
        try {
            if (txtUniLatitude.Value != "")
                universityObj.latitude = Convert.ToDecimal(txtUniLatitude.Value.Trim());
            if (txtUniLongitude.Value != "")
                universityObj.longitude = Convert.ToDecimal(txtUniLongitude.Value.Trim());
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
        catch (Exception ex) { objLog.WriteLog("tab7="+ex.StackTrace.ToString()); }
    }
    
    private void SavedMapped(int fieldID, string fieldname,int uid, List<int> selectedID) {
        try {

            IEnumerable<university_datamapping> list = db.university_datamapping.Where(x =>x.university_id == uid && x.fieldname == fieldID).ToList();
            // Use Remove Range function to delete all records at once
            db.university_datamapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();

            foreach (var item in selectedID) {

                university_datamapping objmapping = new university_datamapping();

                objmapping.fieldname = fieldID;
                objmapping.fieldname_ = fieldname;
                objmapping.chkfield_id = item.ToString();
                objmapping.university_id = uid;
                db.university_datamapping.Add(objmapping);
                db.SaveChanges();

            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
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
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetNarrow(int broadID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var narrow = (from nf in db1.course_narrowFields_master
                      join mapp in db1.broad_narrow_mapping on broadID equals mapp.broadField_Id
                      where nf.id == mapp.narrowField_Id
                      select new
                      {
                          fieldname = nf.fieldname,
                          id = nf.id,
                      }).Distinct().OrderBy(x => x.id).ToList();

        return JsonConvert.SerializeObject(narrow);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetDetailed(int narrowID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var temp = (from df in db1.course_detailsField_master
                    join mapp in db1.narrow_detailed_mapping on narrowID equals mapp.narrowField_Id
                    where df.id == mapp.deatailedField_Id
                    select new
                    {
                        fieldname = df.fieldname,
                        id = df.id,
                    }).Distinct().OrderBy(x => x.id).ToList();

        return JsonConvert.SerializeObject(temp);
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