using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;
using NReco.PdfGenerator;
using System.IO;

public partial class gte_sop_builder : System.Web.UI.Page
{
    int UserID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCommon = new Common();
    string webURL = String.Empty;
    gte_applicantdetails applicantdetails;
    protected static List<faq> allQuestions = new List<faq>();
    int formId = 0, isFullService;
    public string Country_where_you_are_applying_to_study = "Not Set", FirstName = "Not Set", MiddleName = "Not Set", FamilyName = "Not Set", gteEvalution_date = "Not Set", dateofbirth = "Not Set", Nationality = "Not Set", gender = "Not Set", postaladdress = "Not Set", email = "Not Set", mobileno = "Not Set", levelofcourse = "Not Set";
    public string Answer_to_clarification_Question_42 = "Not Set", Nationality_of_Spouse = "Not Set", Date_of_Marriage = "NOt Set", age = "Not Set", MaritalStatus = "Not Set", Current_Residence_Country = "Not Set", Country_of_birth = "Not Set", dateyouintenttostartnextstudy = "Not Set", broadfiledofeducation = "Not Set", narrowfieldofeducation = "Not Set", detailedfieldofeducation = "Not Set", City = "Not Set", Country = "Not Set";
    public string Answer_to_Question_17_Section_1 = "Not Set", Answer_to_Question_15_Section_1 = "Not Set", Answer_to_Question_16_Section_1 = "Not Set", Answer_to_Question_14_Section_1 = "NOt Set", xx_years_yymonthhighestqualificationdate = "Not Set", Country_of_highest_educational_qualification, Answer_to_CQ_34 = "Not Set", Answer_to_CQ_35 = "Not Set", Answer_to_CQ_36 = "Not Set";
    public string Answer_to_CQ_12 = "Not Set", Answer_to_Question_21_Section_1 = "Not Set", Answer_to_CQ_13 = "Not Set", Answer_to_Questio_22_Section_1 = "Not Set", Answer_to_Clarification_Question_CQ1_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ2_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ36_Section_3 = "Not Set", Answer_to_Question_CQ38_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ37_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ4_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ8_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ6_Section_3 = "Not Set", Answer_to_Clarification_Question_CQ5_Section_3 = "Not Set";
    public string Answer_to_Question_16_Section_2 = "Not Set", Answer_to_Question_13_Section_2 = "Not Set", Answer_to_Question_14_Section_2 = "Not Set", Answer_to_Question_15_Section_2 = "Not Set", Answer_to_Question_18_Section_2 = "Not Set", Answer_to_Question_17_Section_2 = "Not Set", Work_Experience = "Not Set";
    public string Answer_to_Clarification_Question_CQ43_Section_1 = "Not Set", Answer_to_Clarification_Question_CQ44_Section_1 = "Not Set", Answer_to_Question_1_Section_2 = "Not Set", Answer_to_Question_2_Section_2 = "Not Set", Answer_to_Question_3_Section_2 = "Not Set", Answer_to_Question_4_Section_2 = "Not Set", Answer_to_Question_6_Section_2 = "Not Set", Answer_to_Question_5_Section_2 = "Not Set", Answer_to_Question_7_Section_2 = "Not Set", Answer_to_Question_8_Section_2 = "Not Set", Answer_to_Clarification_Question_CQ33_Section_3 = "Not Set", Home_Country = "Not Set";
    public string Answer_to_Question_11_Section_2 = "Not Set", Answer_to_Question_10_Section_2 = "Not Set", Answer_to_Question_8_Section_1 = "Not Set", Answer_to_Clarification_Question6_CQ6_Section_3 = "Not Set", Answer_to_CQ9_Section_3 = "Not Set", Answer_to_Clarification_Question45_CQ45_Section_3 = "Not Set", Educational_Institution = "Not Set", Answer_Q12_Section_2 = "Not Set", Answer_to_Question26_Section_1 = "Not Set", Answer_to_Question9_Section_2 = "Not Set", Answer_Clarification_Question48_CQ48_Section_3 = "Not Set", Answer_to_Clarification_Question13_CQ13_Section_3 = "Not Set", Answer_to_Clarification_Question16_CQ16_Section_3 = "Not Set", Answer_to_Clarification_Question11_CQ11_Section_3 = "Not Set", Answer_to_Clarification_Question17_CQ17_Section_3 = "Not Set", Answer_to_Clarification_Question31_CQ31_Section_3 = "Not Set", Answer_to_Clarification_Question18_CQ18_Section_3 = "Not Set", Answer_to_Clarification_Question10_CQ10_Section3 = "Not Set";
    public string Answer_to_CQ_19 = "Not Set", Education_Institution = "Not Set", Answer_to_CQ_20 = "Not Set", Answer_to_CQ_21 = "Not Set", Answer_to_CQ_22 = "Not Set", Answer_to_CQ_23 = "Not Set", Answer_to_CQ_24 = "Not Set", Answer_to_CQ_25 = "Not Set", Answer_to_CQ_26 = "Not Set", Answer_to_CQ_27 = "Not Set", Answer_to_CQ_28 = "Not Set", Answer_to_CQ_29 = "Not Set", Answer_to_CQ_30 = "Not Set", Answer_to_CQ_32 = "Not Set", Percentage_Score = "Not Set", Level_of_Understanding = "Not Set", Description_of_Level_of_Understanding = "Not Set";
    public string nationality, evidence_doc, CountryIamapplyingtoStudy, previoussttudy_gaps_doclist, situationhomecountry_doclist, valude_doclist, potentionalsituation_doclist, immigration_doclist, knowledge_doclist;
    int downloadPdf = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();

        if (Request.QueryString["downloadPdf"] != null)
            downloadPdf = Convert.ToInt32(Request.QueryString["downloadPdf"]);
        
        showContent();
    }

    private void showContent()
    {
        if (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr")
        {
            backNavLink.Visible = false;
            btnDownload.Visible = false;
            btnDiv.Attributes.Add("display","none");//.Style.Add("display", "none");
            int applicantId = 0;
            if (Request.QueryString["applicantId"] != null)
                applicantId = Convert.ToInt32(Request.QueryString["applicantId"]);

            int universityId = 0;
            if (Request.QueryString["universityId"] != null)
                universityId = Convert.ToInt32(Request.QueryString["universityId"]);
            SetString(applicantId, universityId);

        }
        else if (downloadPdf == 0)
        {
            if (!Utility.CheckStudentLogin())
                Response.Redirect(webURL + "Login.aspx", true);
            var objUser = (students)Session["LoginInfo"];
            UserID = objUser.studentid;
            universityID = Utility.GetUniversityId();
            //btnDiv.Attributes.Add("display", "block");
            isFullService = (int)Session["FullService"];
            var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
            if (!isVerifiedByAdmin)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
            var Isdetailscompleted = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).Select(x => x.Isdetailscompleted).FirstOrDefault();
            if (Isdetailscompleted == false)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Incomplete profile information. Please complete profile before proceeding.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

            }
            var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
            if (!isGteDeclarationDoneByApplicant)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Incomplete GTE declaration.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                return;
            }
            //if set to certification
            //if (isFullService == 0)
            //{

            //}
            var IsgteCertificatGenrated = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == universityID).Select(x => x.is_gte_certificate_generated).FirstOrDefault();
            if (IsgteCertificatGenrated == false || IsgteCertificatGenrated == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Incomplete Certification. Please complete GTE Certification .');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                return;
            }

            // gte question1 

            var answeredQuestion = db.gte_questions_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();
            var allQuestions = db.gte_questions_master.ToList();
            if (answeredQuestion.Count == allQuestions.Count)
            {
                var answeredQuestion2 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();
                var allQuestions2 = db.gte_question_master_part2.ToList();

                if (answeredQuestion2.Count == allQuestions2.Count)
                {
                    var applicantdetails_clarification = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
                    if (applicantdetails_clarification != null)
                    {
                        if (applicantdetails_clarification.Is_clarification_submitted != true)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                              "alert('Incomplete GTE Assessment .');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                            return;
                        }
                        else
                            SetString(UserID, universityID);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                              "alert('Incomplete GTE Assessment .');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                          "alert('Incomplete GTE Assessment .');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                return;
            }
            var applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
            var gte_applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();

            var Countryapplyingtostudy = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).Select(x => x.countryofeducationInstitution).FirstOrDefault();
            if (Countryapplyingtostudy != null)
                ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(Countryapplyingtostudy));

            if (applicantdetails != null && applicantdetails.nationality > 0)
            {
                ViewState["nationality"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.nationality));
                nationality = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.nationality));
            }
            else
            {
                if (gte_applicantdetails != null && gte_applicantdetails.nationality != null)
                {
                    ViewState["nationality"] = objCommon.GetCountryDiscription(Convert.ToInt32(gte_applicantdetails.nationality));
                    nationality = objCommon.GetCountryDiscription(Convert.ToInt32(gte_applicantdetails.nationality));
                }
            }

            var institutionDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();

            if (institutionDetails != null)
            {
                ViewState["eduInstitution"] = institutionDetails.university_name;
                ViewState["eduCity"] = institutionDetails.cityName;
            }

            if (isFullService == 1)
            {
                if (applicantdetails != null)
                {
                    if (applicantdetails.issameaspostal == 1)
                    {
                        if (applicantdetails.postalcountry > 0)
                            ViewState["homeCountry"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.postalcountry));
                    }
                    else if (applicantdetails.issameaspostal == 2)
                    {
                        if (applicantdetails.residentialcountry > 0)
                            ViewState["homeCountry"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.residentialcountry));
                    }
                    else
                        ViewState["homeCountry"] = string.Empty;
                }
            }
            else
            {
                if (applicantdetails != null && applicantdetails.residentialcountry != null)
                    ViewState["homeCountry"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.residentialcountry));
            }

            //if (isFullService == 0)
                if (gte_applicantdetails != null && gte_applicantdetails.residencecountry != null)
                    ViewState["homeCountry"] = objCommon.GetCountryDiscription(Convert.ToInt32(gte_applicantdetails.residencecountry));
        }
    }

    private void SetString(int UserID, int universityID)
    {
        allQuestions = objCommon.FaqQuestionList(Request.QueryString["formid"], universityID);

        var applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();

        //var gte_applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
        if (applicantdetails != null)
        {
            FirstName = " " + applicantdetails.firstname.ToUpper();
            MiddleName = applicantdetails.middlename.ToUpper();
            FamilyName = applicantdetails.lastname.ToUpper();
            //var clarification_response_submittedDate = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == UserID && x.university_id == universityID).Select(x => x.response_at).FirstOrDefault();
            gteEvalution_date = Convert.ToDateTime(applicantdetails.Is_clarification_submitted_date).ToString("dddd, dd MMMM yyyy"); //clarification_response_submittedDate.ToString("dddd, dd MMMM yyyy");

            dateofbirth = " " + Convert.ToDateTime(applicantdetails.dateofbirth).ToString("dd/MM/yyyy");
            if (applicantdetails.nationality != null)
                Nationality = " " + objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.nationality));

            int? genderid = applicantdetails.gender;
            if (applicantdetails.gender != null)
                gender = " " + db.gender_master.Where(x => x.id == genderid).Select(x => x.description).FirstOrDefault();

            postaladdress = " " + applicantdetails.postaladdrees1;
            if (applicantdetails.postaladdrees2 != null)
                postaladdress += ", " + applicantdetails.postaladdrees2;
            if (applicantdetails.postaladdrees3 != null)
                postaladdress += ", " + applicantdetails.postaladdrees3;
            if (applicantdetails.postalstate != null)
                postaladdress += applicantdetails.postalstate + ", " + objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.postalcountry));
            if (applicantdetails.postalpostcode != null)
                postaladdress += ", " + applicantdetails.postalpostcode;

            email = " " + applicantdetails.email;
            mobileno = " " + applicantdetails.mobileno;

            if (applicantdetails.broadFieldIDyouwillComplete != null)
            {
                broadfiledofeducation = objCommon.GetBroadFieldDescription(Convert.ToInt32(applicantdetails.broadFieldIDyouwillComplete));
                Answer_to_Question_21_Section_1 = objCommon.GetBroadFieldDescription(Convert.ToInt32(applicantdetails.broadFieldIDyouwillComplete));
            }
            if (applicantdetails.narrowFieldIDyouwillComplete != null)
            {
                narrowfieldofeducation = objCommon.GetNarrowFieldDescription(Convert.ToInt32(applicantdetails.narrowFieldIDyouwillComplete));
                Answer_to_Questio_22_Section_1 = objCommon.GetNarrowFieldDescription(Convert.ToInt32(applicantdetails.narrowFieldIDyouwillComplete));
            }
            if (applicantdetails.detailedFieldIDyouwillComplete != null)
                detailedfieldofeducation = objCommon.GetDetailedFieldDescription(Convert.ToInt32(applicantdetails.detailedFieldIDyouwillComplete));
            if (applicantdetails != null)
            {
                Education_Institution = objCommon.GetUniversityName(Convert.ToInt32(applicantdetails.nameofuniversityappliedfor));
                City = objCommon.GetCityName(Convert.ToInt32(applicantdetails.cityofeducationInstitution));
                Answer_to_Question26_Section_1= objCommon.GetCityName(Convert.ToInt32(applicantdetails.cityofeducationInstitution));
                Country = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
                dateyouintenttostartnextstudy = applicantdetails.commencementdate;
                Country_of_birth = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofbirth));
                Current_Residence_Country = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.residentialcountry));
            }
            MaritalStatus = objCommon.GetMaritalStatusDiscrition(Convert.ToInt32(applicantdetails.maritalstatus));
            age = CalculateAge(Convert.ToDateTime(applicantdetails.dateofbirth)).ToString();
            Answer_to_Question_8_Section_1 = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.residentialcountry));
            Home_Country = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.postalcountry));
            Educational_Institution = objCommon.GetUniversityName(Convert.ToInt32(universityID));
            var clarification_response_question39 = objCommon.GetClarification_applicantResponse(UserID, 39);
            var clarification_response_question40 = objCommon.GetClarification_applicantResponse(UserID, 40);
            var clarification_response_question41 = objCommon.GetClarification_applicantResponse(UserID, 41);
            var clarification_response_question42 = objCommon.GetClarification_applicantResponse(UserID, 42);

            if (!string.IsNullOrEmpty(clarification_response_question39))
                Date_of_Marriage = clarification_response_question39;
            if (!string.IsNullOrEmpty(clarification_response_question40))
                Nationality_of_Spouse = objCommon.GetCountryDiscription(Convert.ToInt32(clarification_response_question40));
            if (!string.IsNullOrEmpty(clarification_response_question42))
                Answer_to_clarification_Question_42 = clarification_response_question42;

            if (applicantdetails != null && applicantdetails.countryofeducationInstitution != null)
                Country_where_you_are_applying_to_study = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
            if (applicantdetails != null && applicantdetails.levelofcourse != null)
                levelofcourse = objCommon.GetHighestDegree(Convert.ToInt32(applicantdetails.levelofcourse));

            if (applicantdetails.maritalstatus == 3)
                statement1.Attributes.Add("style", "display:block;");

            if (applicantdetails.maritalstatus != 1)
            {
                if (clarification_response_question41 != null)
                {
                    if (clarification_response_question41 == "1")
                        statement2.Attributes.Add("style", "display:block");
                    else if (clarification_response_question41 == "2")
                        statement3.Attributes.Add("style", "display:block");
                    else if (clarification_response_question41 == "3")
                        statement4.Attributes.Add("style", "display:block");
                    else if (clarification_response_question41 == "4")
                        statement5.Attributes.Add("style", "display:block");
                    else if (clarification_response_question41 == "5")
                        statement6.Attributes.Add("style", "display:block");
                }
            }

            if (applicantdetails != null && applicantdetails.highestqualifiactionachieved != null)
                Answer_to_Question_14_Section_1 = objCommon.GetHighestDegree(Convert.ToInt32(applicantdetails.highestqualifiactionachieved));

            if (applicantdetails.broadFieldID != null)
                Answer_to_Question_15_Section_1 = objCommon.GetBroadFieldDescription(Convert.ToInt32(applicantdetails.broadFieldID));

            if (applicantdetails.narrowFieldID != null)
                Answer_to_Question_16_Section_1 = objCommon.GetNarrowFieldDescription(Convert.ToInt32(applicantdetails.narrowFieldID));

            if (applicantdetails.broadFieldID != null)
                Answer_to_Question_17_Section_1 = objCommon.GetDetailedFieldDescription(Convert.ToInt32(applicantdetails.detailedFieldID));

            if (applicantdetails != null && applicantdetails.highestqualificationdate != null)
            {
                DateTime dt1 = Convert.ToDateTime(applicantdetails.highestqualificationdate);
                DateTime dt = Convert.ToDateTime(DateTime.UtcNow);

                TimeSpan span = dt - dt1;

                int years = span.Days / 365;
                int months = (span.Days % 365) / 31;
                xx_years_yymonthhighestqualificationdate = years + " Years, " + months + " Months";
            }
            if (applicantdetails != null && applicantdetails.highestqualificationcountry != null)
                Country_of_highest_educational_qualification = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.highestqualificationcountry));

            var clarification_response_question34 = objCommon.GetClarification_applicantResponse(UserID, 34);
            var clarification_response_question35 = objCommon.GetClarification_applicantResponse(UserID, 35);
            var clarification_response_question36 = objCommon.GetClarification_applicantResponse(UserID, 36);
            var clarification_response_question12 = objCommon.GetClarification_applicantResponse(UserID, 12);
            var clarification_response_question13 = objCommon.GetClarification_applicantResponse(UserID, 13);
            var clarification_response_question1 = objCommon.GetClarification_applicantResponse(UserID, 1);
            var clarification_response_question2 = objCommon.GetClarification_applicantResponse(UserID, 2);
            var clarification_response_question37 = objCommon.GetClarification_applicantResponse(UserID, 37);
            var clarification_response_question38 = objCommon.GetClarification_applicantResponse(UserID, 38);
            var clarification_response_question4 = objCommon.GetClarification_applicantResponse(UserID, 4);
            var clarification_response_question5 = objCommon.GetClarification_applicantResponse(UserID, 5);
            var clarification_response_question6 = objCommon.GetClarification_applicantResponse(UserID, 6);
            var clarification_response_question8 = objCommon.GetClarification_applicantResponse(UserID, 8);
            var clarification_response_question48 = objCommon.GetClarification_applicantResponse(UserID, 48);
            var clarification_response_question16 = objCommon.GetClarification_applicantResponse(UserID, 16);
            var clarification_response_question11 = objCommon.GetClarification_applicantResponse(UserID, 11);
            var clarification_response_question17 = objCommon.GetClarification_applicantResponse(UserID, 17);
            var clarification_response_question10 = objCommon.GetClarification_applicantResponse(UserID, 10);
            var clarification_response_question18 = objCommon.GetClarification_applicantResponse(UserID, 18);
            var clarification_response_question31 = objCommon.GetClarification_applicantResponse(UserID, 31);
            var clarification_response_question19 = objCommon.GetClarification_applicantResponse(UserID, 19);
            var clarification_response_question20 = objCommon.GetClarification_applicantResponse(UserID, 20);
            var clarification_response_question21 = objCommon.GetClarification_applicantResponse(UserID, 21);
            var clarification_response_question22 = objCommon.GetClarification_applicantResponse(UserID, 22);
            var clarification_response_question23 = objCommon.GetClarification_applicantResponse(UserID, 23);
            var clarification_response_question24 = objCommon.GetClarification_applicantResponse(UserID, 24);
            var clarification_response_question25 = objCommon.GetClarification_applicantResponse(UserID, 25);
            var clarification_response_question26 = objCommon.GetClarification_applicantResponse(UserID, 26);
            var clarification_response_question27 = objCommon.GetClarification_applicantResponse(UserID, 27);
            var clarification_response_question28 = objCommon.GetClarification_applicantResponse(UserID, 28);
            var clarification_response_question29 = objCommon.GetClarification_applicantResponse(UserID, 29);
            var clarification_response_question30 = objCommon.GetClarification_applicantResponse(UserID, 30);
            var clarification_response_question32 = objCommon.GetClarification_applicantResponse(UserID, 32);
            var clarification_response_question45 = objCommon.GetClarification_applicantResponse(UserID, 45);

            if (!string.IsNullOrEmpty(clarification_response_question45))
                Answer_to_Clarification_Question45_CQ45_Section_3 = clarification_response_question45;
            if (!string.IsNullOrEmpty(clarification_response_question19))
                Answer_to_CQ_19 = clarification_response_question19;
            if (!string.IsNullOrEmpty(clarification_response_question20))
                Answer_to_CQ_20 = clarification_response_question20;
            if (!string.IsNullOrEmpty(clarification_response_question21))
                Answer_to_CQ_21 = clarification_response_question21;
            if (!string.IsNullOrEmpty(clarification_response_question22))
                Answer_to_CQ_22 = clarification_response_question22;
            if (!string.IsNullOrEmpty(clarification_response_question23))
                Answer_to_CQ_23 = clarification_response_question23;
            if (!string.IsNullOrEmpty(clarification_response_question24))
                Answer_to_CQ_24 = clarification_response_question24;
            if (!string.IsNullOrEmpty(clarification_response_question25))
                Answer_to_CQ_25 = clarification_response_question25;
            if (!string.IsNullOrEmpty(clarification_response_question26))
                Answer_to_CQ_26 = clarification_response_question26;
            if (!string.IsNullOrEmpty(clarification_response_question27))
                Answer_to_CQ_27 = clarification_response_question27;
            if (!string.IsNullOrEmpty(clarification_response_question28))
                Answer_to_CQ_28 = clarification_response_question28;
            if (!string.IsNullOrEmpty(clarification_response_question29))
                Answer_to_CQ_29 = clarification_response_question29;
            if (!string.IsNullOrEmpty(clarification_response_question30))
                Answer_to_CQ_30 = clarification_response_question30;
            if (!string.IsNullOrEmpty(clarification_response_question32))
                Answer_to_CQ_32 = clarification_response_question32;

            if (clarification_response_question10 != null)
                Answer_to_Clarification_Question10_CQ10_Section3 = clarification_response_question10;
            if (clarification_response_question18 != null)
                Answer_to_Clarification_Question18_CQ18_Section_3 = clarification_response_question18;
            if (clarification_response_question31 != null)
                Answer_to_Clarification_Question31_CQ31_Section_3 = clarification_response_question31;

            if (clarification_response_question48 != null)
                Answer_Clarification_Question48_CQ48_Section_3 = clarification_response_question48;
            if (clarification_response_question16 != null)
                Answer_to_Clarification_Question16_CQ16_Section_3 = clarification_response_question16;
            if (clarification_response_question11 != null)
                Answer_to_Clarification_Question11_CQ11_Section_3 = clarification_response_question11;
            if (clarification_response_question17 != null)
                Answer_to_Clarification_Question17_CQ17_Section_3 = clarification_response_question17;

            if (clarification_response_question4 != null)
                Answer_to_Clarification_Question_CQ4_Section_3 = clarification_response_question4;
            if (clarification_response_question5 != null)
                Answer_to_Clarification_Question_CQ5_Section_3 = clarification_response_question5;
            if (clarification_response_question6 != null)
            {
                Answer_to_Clarification_Question_CQ6_Section_3 = clarification_response_question6;
                Answer_to_Clarification_Question_CQ6_Section_3 = clarification_response_question6;
                Answer_to_Clarification_Question6_CQ6_Section_3 = clarification_response_question6;
            }
            if (clarification_response_question8 != null)
                Answer_to_Clarification_Question_CQ8_Section_3 = clarification_response_question8;


            if (clarification_response_question37 != null)
                Answer_to_Clarification_Question_CQ37_Section_3 = clarification_response_question37;
            if (clarification_response_question38 != null)
                Answer_to_Question_CQ38_Section_3 = clarification_response_question38;

            if (clarification_response_question34 != null)
                Answer_to_CQ_34 = clarification_response_question34;
            if (clarification_response_question35 != null)
                Answer_to_CQ_35 = clarification_response_question35;
            if (clarification_response_question36 != null)
            {
                Answer_to_CQ_36 = clarification_response_question36;
                Answer_to_Clarification_Question_CQ36_Section_3 = clarification_response_question36;
            }
            if (clarification_response_question12 != null)
                Answer_to_CQ_12 = clarification_response_question12;
            if (clarification_response_question13 != null)
            {
                Answer_to_CQ_13 = clarification_response_question13;
                Answer_to_Clarification_Question13_CQ13_Section_3 = clarification_response_question13;
            }
            if (clarification_response_question1 != null)
                Answer_to_Clarification_Question_CQ1_Section_3 = clarification_response_question1;
            if (clarification_response_question2 != null)
                Answer_to_Clarification_Question_CQ2_Section_3 = clarification_response_question2;


            var AnswerQuestion_Section2_13 = AddContentInText2(objCommon.GetSection2Answer(UserID, 13));
            var AnswerQuestion_Section2_14 = AddContentInText2(objCommon.GetSection2Answer(UserID, 14));
            var AnswerQuestion_Section2_15 = AddContentInText2(objCommon.GetSection2Answer(UserID, 15));
            var AnswerQuestion_Section2_16 = AddContentInText2(objCommon.GetSection2Answer(UserID, 16));
            var AnswerQuestion_Section2_17 = AddContentInText2(objCommon.GetSection2Answer(UserID, 17));
            var AnswerQuestion_Section2_18 = AddContentInText2(objCommon.GetSection2Answer(UserID, 18));
            var AnswerQuestion_Section2_2 = AddContentInText2(objCommon.GetSection2Answer(UserID, 2));
            var AnswerQuestion_Section2_3 = AddContentInText2(objCommon.GetSection2Answer(UserID, 3));
            var AnswerQuestion_Section2_4 = AddContentInText2(objCommon.GetSection2Answer(UserID, 4));
            var AnswerQuestion_Section2_5 = AddContentInText2(objCommon.GetSection2Answer(UserID, 5));
            var AnswerQuestion_Section2_6 = AddContentInText2(objCommon.GetSection2Answer(UserID, 6));
            var AnswerQuestion_Section2_7 = AddContentInText2(objCommon.GetSection2Answer(UserID, 7));
            var AnswerQuestion_Section2_8 = AddContentInText2(objCommon.GetSection2Answer(UserID, 8));
            var AnswerQuestion_Section2_10 = AddContentInText2(objCommon.GetSection2Answer(UserID, 10));
            var AnswerQuestion_Section2_11 = AddContentInText2(objCommon.GetSection2Answer(UserID, 11));
            var AnswerQuestion_Section2_12 = AddContentInText2(objCommon.GetSection2Answer(UserID, 12));
            var AnswerQuestion_Section2_1 = AddContentInText2(objCommon.GetSection2Answer(UserID, 1));
            var AnswerQuestion_Section2_9 = AddContentInText2(objCommon.GetSection2Answer(UserID, 9));

            if (AnswerQuestion_Section2_9 != null)
                Answer_to_Question9_Section_2 = AnswerQuestion_Section2_9;
            if (AnswerQuestion_Section2_1 != null)
                Answer_to_Question_1_Section_2 = AnswerQuestion_Section2_1;
            if (AnswerQuestion_Section2_12 != null)
                Answer_Q12_Section_2 = AnswerQuestion_Section2_12;
            if (AnswerQuestion_Section2_13 != null)
                Answer_to_Question_13_Section_2 = AnswerQuestion_Section2_13;
            if (AnswerQuestion_Section2_14 != null)
                Answer_to_Question_14_Section_2 = AnswerQuestion_Section2_14;
            if (AnswerQuestion_Section2_15 != null)
                Answer_to_Question_15_Section_2 = AnswerQuestion_Section2_15;
            if (AnswerQuestion_Section2_16 != null)
                Answer_to_Question_16_Section_2 = AnswerQuestion_Section2_16;
            if (AnswerQuestion_Section2_17 != null)
                Answer_to_Question_17_Section_2 = AnswerQuestion_Section2_17;
            if (AnswerQuestion_Section2_18 != null)
                Answer_to_Question_18_Section_2 = AnswerQuestion_Section2_18;
            var clarification_response_question43 = objCommon.GetClarification_applicantResponse(UserID, 43);
            if (!string.IsNullOrEmpty(clarification_response_question43))
                Answer_to_Clarification_Question_CQ43_Section_1 = clarification_response_question43;
            var clarification_response_question44 = objCommon.GetClarification_applicantResponse(UserID, 44);
            if (!string.IsNullOrEmpty(clarification_response_question44))
                Answer_to_Clarification_Question_CQ44_Section_1 = clarification_response_question44;
            var clarification_response_question33 = objCommon.GetClarification_applicantResponse(UserID, 33);
            if (!string.IsNullOrEmpty(clarification_response_question33))
                Answer_to_Clarification_Question_CQ33_Section_3 = clarification_response_question33;
            var clarification_response_question9 = objCommon.GetClarification_applicantResponse(UserID, 9);
            if (clarification_response_question9 != null)
                Answer_to_CQ9_Section_3 = clarification_response_question9;
            if (AnswerQuestion_Section2_8 != null)
                Answer_to_Question_8_Section_2 = AnswerQuestion_Section2_8;
            if (AnswerQuestion_Section2_4 != null)
                Answer_to_Question_4_Section_2 = AnswerQuestion_Section2_4;
            if (AnswerQuestion_Section2_5 != null)
                Answer_to_Question_5_Section_2 = AnswerQuestion_Section2_5;
            if (AnswerQuestion_Section2_6 != null)
                Answer_to_Question_6_Section_2 = AnswerQuestion_Section2_6;
            if (AnswerQuestion_Section2_7 != null)
                Answer_to_Question_7_Section_2 = AnswerQuestion_Section2_7;
            if (AnswerQuestion_Section2_3 != null)
                Answer_to_Question_3_Section_2 = AnswerQuestion_Section2_3;
            if (AnswerQuestion_Section2_2 != null)
                Answer_to_Question_2_Section_2 = AnswerQuestion_Section2_2;
            if (AnswerQuestion_Section2_10 != null)
                Answer_to_Question_10_Section_2 = AnswerQuestion_Section2_10;
            if (AnswerQuestion_Section2_11 != null)
                Answer_to_Question_11_Section_2 = AnswerQuestion_Section2_11;


            var levelodstudy_systemlevel = objCommon.GetStudy_systemlevel(Convert.ToInt32(applicantdetails.levelofcourse)) - objCommon.GetStudy_systemlevel(Convert.ToInt32(applicantdetails.highestqualifiactionachieved));
            if (levelodstudy_systemlevel <= -2)
                previous_stat1.Attributes.Add("style", "display:block;");
            else if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel < 1)
                previous_stat2.Attributes.Add("style", "display:block;");
            else if (levelodstudy_systemlevel == 0)
                previous_stat3.Attributes.Add("style", "display:block;");
            else if (1 < levelodstudy_systemlevel && levelodstudy_systemlevel > 3)
                previous_stat4.Attributes.Add("style", "display:block;");

            if (applicantdetails.broadFieldID != null && applicantdetails.broadFieldID == 12 && applicantdetails.narrowFieldID != null && applicantdetails.narrowFieldID == 68 && (applicantdetails.broadFieldID != applicantdetails.broadFieldIDyouwillComplete))
                previous_stat5.Attributes.Add("style", "display:block;");

            if (applicantdetails.broadFieldID != null && applicantdetails.broadFieldIDyouwillComplete != null)
                if (applicantdetails.broadFieldID == applicantdetails.broadFieldIDyouwillComplete)
                    previous_stat6.Attributes.Add("style", "display:block;");

            if (applicantdetails.broadFieldID != null && applicantdetails.broadFieldID == 12 && applicantdetails.narrowFieldID != null && applicantdetails.narrowFieldID == 68 && (applicantdetails.narrowFieldID != applicantdetails.narrowFieldIDyouwillComplete))
                previous_stat7.Attributes.Add("style", "display:block;");

            if (applicantdetails.narrowFieldID != null && applicantdetails.narrowFieldIDyouwillComplete != null)
            {

                if (applicantdetails.narrowFieldID == applicantdetails.narrowFieldIDyouwillComplete)
                    previous_stat8.Attributes.Add("style", "display:block;");
            }


            if (objCommon.GetSection3Answer(UserID, 1) == true)
                previous_stat9.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 1) == false)
                previous_stat10.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 9) == true)
                previous_stat11.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 9) == false)
                previous_stat12.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 2) == true)
                previous_stat13.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 2) == false)
                previous_stat14.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 6) == true)
                previous_stat15.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 6) == false)
                previous_stat16.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 4) == true)
                previous_stat17.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 4) == false)
                previous_stat18.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 12) == true)
                previous_stat19.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 12) == false)
                previous_stat20.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 15) == true)
                previous_stat21.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 15) == false)
                previous_stat22.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 8) == true)
                previous_stat23.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 8) == false)
                previous_stat24.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 7) == true)
                previous_stat25.Attributes.Add("style", "display:block;");
            if (applicantdetails != null)
            {
                if (applicantdetails.workexperience != null)
                {
                    if (applicantdetails.workexperience == 1)
                        employment_stat1.Attributes.Add("style", "display:block;");
                    else
                    {
                        Work_Experience = objCommon.Getworkexperience(Convert.ToInt32(applicantdetails.workexperience));
                        employment_stat2.Attributes.Add("style", "display:block;");
                    }
                }
                if (applicantdetails.Iscurrentlyworking != null)
                {
                    if (applicantdetails.Iscurrentlyworking == 1)
                        employment_stat3.Attributes.Add("style", "display:block;");
                    else
                        employment_stat4.Attributes.Add("style", "display:block;");
                }
                if (applicantdetails.Isjoboffered != null && applicantdetails.Isjoboffered == 1)
                    employment_stat5.Attributes.Add("style", "display:block;");

            }
            if (objCommon.GetSection3Answer(UserID, 46) == true)
                ties_stat1.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 46) == false)
                ties_stat2.Attributes.Add("style", "display:block;");


            if (objCommon.GetSection3Answer(UserID, 18) == true)
                potential_state1.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 18) == false)
                potential_state2.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 8) == true)
                potential_state3.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 8) == false)
                potential_state4.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 16) == false)
                potential_state5.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 16) == true)
                potential_state6.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 19) == true)
                potential_state7.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 19) == false)
                potential_state8.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 47) == true)
                potential_state9.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 47) == false)
                potential_state10.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 48) == true)
                potential_state11.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 48) == false)
                potential_state12.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 49) == true)
                potential_state13.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 49) == false)
                potential_state14.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 25) == true)
                potential_state15.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 25) == false)
                potential_state16.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 45) == true)
                potential_state17.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 45) == false)
                potential_state18.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 3) == true)
                potential_state19.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 3) == false)
                potential_state20.Attributes.Add("style", "display:block;");


            if (objCommon.GetSection3Answer(UserID, 24) == true)
                immi_stat1.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 24) == false)
                immi_stat2.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 21) == true)
                immi_stat3.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 21) == false)
                immi_stat4.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 26) == true)
                immi_stat5.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 26) == false)
                immi_stat6.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 27) == true)
                immi_stat7.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 27) == false)
                immi_stat8.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 17) == true)
                immi_stat9.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 17) == false)
                immi_stat10.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 43) == true)
                immi_stat11.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 43) == false)
                immi_stat12.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 28) == true)
                immi_stat13.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 28) == false)
                immi_stat14.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 20) == true)
                immi_stat15.Attributes.Add("style", "display:block;");
            else if (objCommon.GetSection3Answer(UserID, 20) == false)
                immi_stat16.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 13) == true)
                immi_stat17.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 14) == true)
                immi_stat18.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 31) == true && objCommon.GetSection3Answer(UserID, 32) == true && objCommon.GetSection3Answer(UserID, 33) == true && objCommon.GetSection3Answer(UserID, 34) == true && objCommon.GetSection3Answer(UserID, 35) == true && objCommon.GetSection3Answer(UserID, 36) == true && objCommon.GetSection3Answer(UserID, 37) == true && objCommon.GetSection3Answer(UserID, 38) == true && objCommon.GetSection3Answer(UserID, 39) == true && objCommon.GetSection3Answer(UserID, 40) == true && objCommon.GetSection3Answer(UserID, 41) == true && objCommon.GetSection3Answer(UserID, 42) == true && objCommon.GetSection3Answer(UserID, 44) == true)
                criminal_statement1.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 31) == false || objCommon.GetSection3Answer(UserID, 32) == false || objCommon.GetSection3Answer(UserID, 33) == false || objCommon.GetSection3Answer(UserID, 34) == false || objCommon.GetSection3Answer(UserID, 35) == false || objCommon.GetSection3Answer(UserID, 36) == false || objCommon.GetSection3Answer(UserID, 37) == false || objCommon.GetSection3Answer(UserID, 38) == false || objCommon.GetSection3Answer(UserID, 39) == false || objCommon.GetSection3Answer(UserID, 40) == false || objCommon.GetSection3Answer(UserID, 41) == false || objCommon.GetSection3Answer(UserID, 42) == false || objCommon.GetSection3Answer(UserID, 44) == false)
                criminal_statement2.Attributes.Add("style", "display:block;");

            if (objCommon.GetSection3Answer(UserID, 31) == false)
                criminal_statement3.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 32) == false)
                criminal_statement4.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 33) == false)
                criminal_statement5.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 34) == false)
                criminal_statement6.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 35) == false)
                criminal_statement7.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 36) == false)
                criminal_statement8.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 37) == false)
                criminal_statement9.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 38) == false)
                criminal_statement10.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 39) == false)
                criminal_statement11.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 40) == false)
                criminal_statement12.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 41) == false)
                criminal_statement13.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 42) == false)
                criminal_statement14.Attributes.Add("style", "display:block;");
            if (objCommon.GetSection3Answer(UserID, 44) == false)
                criminal_statement15.Attributes.Add("style", "display:block;");

            evidence_doc = "- " + objCommon.GetDocumentName(183) + "<br/>" + "- " + objCommon.GetDocumentName(184) + "<br/>" + "- " + objCommon.GetDocumentName(185) + "<br/>" + "- " + objCommon.GetDocumentName(186) + "<br/>";
            previoussttudy_gaps_doclist = "- " + objCommon.GetDocumentName(188) + "<br/>" + "- " + objCommon.GetDocumentName(189) + "<br/>" + "- " + objCommon.GetDocumentName(190) + "<br/>";

            if (applicantdetails.Iscurrentlyworking == 1 || applicantdetails.Isjoboffered == 1)
            {
                if (applicantdetails.Iscurrentlyworking == 1)
                    valude_doclist = "- " + objCommon.GetDocumentName(193) + "<br/>";
                if (applicantdetails.Isjoboffered == 1)
                    valude_doclist += "- " + objCommon.GetDocumentName(194) + "<br/>";
            }
            else
                doc3.Attributes.Add("style", "display:none;");

            //2
            situationhomecountry_doclist = "- " + objCommon.GetDocumentName(196) + "<br/>" + "- " + objCommon.GetDocumentName(197) + "<br/>" + "- " + objCommon.GetDocumentName(198) + "<br/>";

            if (applicantdetails.maritalstatus == 3)
                potentionalsituation_doclist = "- " + objCommon.GetDocumentName(200) + "<br/>";
            if (applicantdetails.maritalstatus == 2)
                potentionalsituation_doclist += "- " + objCommon.GetDocumentName(201) + "<br/>";
            if (!string.IsNullOrEmpty(objCommon.GetClarification_applicantResponse(UserID, 41)) && objCommon.GetClarification_applicantResponse(UserID, 41) != "0")
                potentionalsituation_doclist += "- " + objCommon.GetDocumentName(202) + "<br/>";
            if (objCommon.GetSection3Answer(UserID, 16) == false)
                potentionalsituation_doclist += "- " + objCommon.GetDocumentName(203) + "<br/>";
            if (applicantdetails.maritalstatus == 3 || applicantdetails.maritalstatus == 2 || objCommon.GetClarification_applicantResponse(UserID, 41) != "1" || objCommon.GetSection3Answer(UserID, 16) == false)
            { }
            else
                doc5.Attributes.Add("style", "display:none;");

            var sec3_28 = objCommon.GetSection3Answer(UserID, 28);
            var sec3_14 = objCommon.GetSection3Answer(UserID, 14);

            if (sec3_28 == false)
            {
                if (sec3_28 == false && sec3_14 == true)
                    immigration_doclist = "- " + objCommon.GetDocumentName(205) + "<br/>";

                immigration_doclist += "- " + objCommon.GetDocumentName(206) + "<br/>";
            }
            else
                doc6.Attributes.Add("style", "display:none;");

            CountryIamapplyingtoStudy = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));

            var gte_progressbar_Certification = db.gte_progressbar.Where(x => x.universityId == universityID && x.applicantid == UserID).FirstOrDefault();

            if (gte_progressbar_Certification != null)
            {
                if (gte_progressbar_Certification != null && gte_progressbar_Certification.is_gte_certificate_generated == true)
                    knowledge_doclist = "- " + objCommon.GetDocumentName(208) + "<br/>";
                else
                    doc7.Attributes.Add("style", "display:none;");

                if (gte_progressbar_Certification.is_gte_certificate_generated != null)
                {
                    if (gte_progressbar_Certification.is_gte_certificate_generated == true)
                    {

                        studentvisarequirement2.Attributes.Add("style", "display:block;");
                        studentvisarequirement3.Attributes.Add("style", "display:block;");
                        studentvisarequirement4.Attributes.Add("style", "display:block;");
                        studentvisarequirement5.Attributes.Add("style", "display:block;");
                        Percentage_Score = gte_progressbar_Certification.gte_perdentage_score;

                        var certificate_grade = db.gte_certificatelevel_description.Select(x => x.grade).ToList();
                        dynamic certificate = null;

                        foreach (var item in certificate_grade)
                        {
                            if (gte_progressbar_Certification.performance_category.ToLower() == item.ToLower())
                            {
                                certificate = db.gte_certificatelevel_description.Where(x => x.grade == gte_progressbar_Certification.performance_category).FirstOrDefault();
                            }
                        }
                        if (certificate == null)
                        {
                            int id = Convert.ToInt32(gte_progressbar_Certification.performance_category);
                            certificate = db.gte_certificatelevel_description.Where(x => x.id == id).FirstOrDefault();

                        }
                        if (certificate != null)
                        {
                            Level_of_Understanding = certificate.grade;
                            Description_of_Level_of_Understanding = certificate.description;
                        }
                    }
                    else if (gte_progressbar_Certification.is_gte_certificate_generated == false)
                    {
                        studentvisarequirement1.Attributes.Add("style", "display:block;");
                    }
                }
            }

            if (applicantdetails.isstudentreferbyagent != null)
            {
                if (applicantdetails.isstudentreferbyagent == 0)
                    ifAgentNo.Attributes.Add("style", "display:block");
                else
                    ifAgentYes.Attributes.Add("style", "display:block");
            }
        }
    }

    private string AddContentInText2(string text)
    {
        if (text.Contains("#HomeCountry#"))
            text = text.Replace("#HomeCountry#", Convert.ToString(ViewState["homeCountry"]));
        if (text.Contains("#City#"))
            text = text.Replace("#City#", Convert.ToString(ViewState["eduCity"]));
        if (text.Contains("#Country_where_I_intend_to_study#"))
            text = text.Replace("#Country_where_I_intend_to_study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Country_where_I intend_to_study#"))
            text = text.Replace("#Country_where_I intend_to_study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Education_Institution#"))
            text = text.Replace("#Education_Institution#", Convert.ToString(ViewState["eduInstitution"]));
        if (text.Contains("#Nationality#"))
            text = text.Replace("#Nationality#", Convert.ToString(ViewState["nationality"]));
        if (text.Contains("#EducationalInstitution#"))
            text = text.Replace("#EducationalInstitution#", Convert.ToString(ViewState["eduInstitution"]));
        if (text.Contains("#ClickToKnowMore#"))
            text = text.Replace("#ClickToKnowMore#", "<lable id=lblClick style=\"color: DodgerBlue;\"> Click to know more </label>");
        if (text.Contains("#FirstName#"))
            text = text.Replace("#FirstName#", objCommon.GetApplicantFirstName(UserID));
        return text;
    }

    private int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
            age = age - 1;

        return age;
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try
        {
            int applicantID = Convert.ToInt32(Session["UserID"].ToString());
            int universityID = Utility.GetUniversityId();

            if (!(applicantID == 0 || universityID == 0))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                         "alert('Invalid Student Details');window.location='" + webURL + "/default.aspx';", true);

            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.Default;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "sop_reportN.aspx?token=YKUcfdhNWwp17azByk&downloadPdf=1&applicantId=" + applicantID + "&universityId=" + universityID, null, filePath);


            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=SOP_Report.pdf");
            HttpContext.Current.Response.TransmitFile(filePath);

            HttpContext.Current.Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

}