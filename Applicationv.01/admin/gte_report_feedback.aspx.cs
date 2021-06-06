using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class admin_gte_report_feedback : System.Web.UI.Page
{
    public string AL_Level,tag8_class1, tag8_class2, tag8_class3, high_taglist, retrentionrisk_decision, VerificationvideoURL, recommendtionText, courseapplied, packagapplied, institutionapplied, gtereportNo, universityid, candidateno, logourl, recommendationURL, chkboxURL4_1, chkboxURL4_2, chkboxURL4_3, CountryIamapplyingtoStudy,
         certificationdate, overallscore, GTECertificateNO, ratingimplies, StudentName, grade, rangeofpercentage, profileimage, recommendedwithcaution, GTEFeedback_reportdate, proctorremarks_ifverified, proctorremarks_ifdisqualify,
         institutionNo, facilitingagent, sponsoringclient, passportno, countryofresidence, nationality, gender, dateofbirth, middlename, firstname, familyname, reportsubmitteddate, ipaddress,
         tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag1_score, tag2_score, tag3_score, tag4_score, tag5_score, tag6_score, tag7_score,
         AnswertoQuestion_1_Section2_class, AnswertoQuestion_2_Section2_class, AnswertoQuestion_3_Section2_class, AnswertoQuestion_4_Section2_class, AnswertoQuestion_5_Section2_class, AnswertoQuestion_6_Section2_class, AnswertoQuestion_7_Section2_class, AnswertoQuestion_8_Section2_class,
         AnswertoQuestion_13Section2_class, AnswertoQuestion_14Section2_class, AnswertoQuestion_15Section2_class, AnswertoQuestion_16Section2_class, AnswertoQuestion_17Section2_class, AnswertoQuestion_18Section2_class,
         citizenship, age, Isoffshore, maritalstatus, marriedyears, spousecitizenship, Isdependent, noofdependents, sec3_46_class, tag1clr, tag2clr, tag3clr, tag4clr, tag5clr, tag6clr, tag7clr, tag8clr,
         checkboxurl_5_1, checkboxurl_5_2, checkboxurl_5_3, checkboxurl_5_4, checkboxurl_5_5, checkboxurl_5_6, instutionname, criminal_class1, criminal_class2, criminal_class3,
         classRR_13_5, classRR_13_10, classRR_13_11, classRR_13_29, classRR_13_30, classRR_13_49, RRisk_5, RRisk_10, RRisk_11, RRisk_29, RRisk_30, RRisk_49,
         PSbox10_1, PSbox10_2, PSbox10_3, PSbox10_4, PSbox10_5, PSbox10_6, PSbox10_7, PSbox10_8, PSbox10_9, PSbox10_10, PSbox10_11, PSbox10_12, PSbox10_13, PSbox10_14, PSbox10_15, PSbox10_16, PSbox10_17,
         classPS_10_1, classPS_10_2, classPS_10_3, classPS_10_4, classPS_10_5, classPS_10_6, classPS_10_7, classPS_10_8, classPS_10_9, classPS_10_10, classPS_10_11, classPS_10_12, classPS_10_13, classPS_10_14,
         CQ_Ques_1, CQ_Ques_2, CQ_Ques_4, CQ_Ques_5, CQ_Ques_8, CQ_Ques_12, CQ_Ques_13, CQ_Ques_34, CQ_Ques_35, CQ_Ques_36, CQ_Ques_37, CQ_Ques_38, CQ_Ans_1, CQ_Ans_2, CQ_Ans_4, CQ_Ans_5, CQ_Ans_8, CQ_Ans_12, CQ_Ans_13, CQ_Ans_34, CQ_Ans_35, CQ_Ans_36, CQ_Ans_37, CQ_Ans_38,
         CQ_Ques_3, CQ_Ques_46, CQ_Ques_47, CQ_Ans_3, CQ_Ans_46, CQ_Ans_47, CQ_Ques_9, CQ_Ques_39, CQ_Ques_40, CQ_Ques_41, CQ_Ques_42, CQ_Ques_45, CQ_Ans_9, CQ_Ans_39, CQ_Ans_40, CQ_Ans_41, CQ_Ans_42, CQ_Ans_45,
         IsjobofferedinhomecountryClass, iscurrwrkngclass, AnswertoQuestion_16_Section2, AnswertoQuestion_13_Section2, AnswertoQuestion_14_Section2, AnswertoQuestion_15_Section2, AnswertoQuestion_18_Section2, AnswertoQuestion_17_Section2, Iscurrentlyemployed, workexpericeyears, Isjobofferedinhomecountry,
         class16_1, class16_2, class16_3, class16_4, class16_5, class16_6, class16_7, class16_8, class16_9, class16_10, class16_11, class16_12, AnswertoQuestion_18_Section3, AnswertoQuestion_45_Section3, AnswertoQuestion_19_Section3, AnswertoQuestion_8_Section3, AnswertoQuestion_16_Section3, AnswertoQuestion_3_Section3, AnswertoQuestion_47_Section3, AnswertoQuestion_48_Section3, AnswertoQuestion_49_Section3, AnswertoQuestion_11_Section2, AnswertoQuestion_10_Section2, AnswertoQuestion_12_Section2,
         CQ_Ques_43, CQ_Ques_44, CQ_Ans_43, CQ_Ans_44, AnswertoQuestion_1_Section2, AnswertoQuestion_2_Section2, AnswertoQuestion_3_Section2, AnswertoQuestion_4_Section2, AnswertoQuestion_5_Section2, AnswertoQuestion_6_Section2, AnswertoQuestion_7_Section2, AnswertoQuestion_8_Section2,
         RGcmnt_10, RGcmnt_11, RGcmnt_12, sectin3_46, sectin3_46_Y_N, RGcmnt_1, RGcmnt_2, RGcmnt_3, RGcmnt_4, RGcmnt_5, RGcmnt_6, RGcmnt_7, RGcmnt_8, classPS_15_8, classPS_15_9, section3_20, section3_14, CQ_Ques_7, CQ_Ques_10, CQ_Ques_11, CQ_Ques_14, CQ_Ques_15, CQ_Ques_16, CQ_Ques_31, CQ_Ques_48, CQ_Ans_7, CQ_Ans_10, CQ_Ans_11, CQ_Ans_14, CQ_Ans_15, CQ_Ans_16, CQ_Ans_31, CQ_Ans_48,
         classPS_15_1, classPS_15_2, classPS_15_3, classPS_15_4, classPS_15_5, classPS_15_6, classPS_15_7, section3_24, section3_21, section3_26, section3_27, section3_17, section3_43, section3_28,
         servity_tag_1, servity_tag_2, servity_tag_3, servity_tag_4, servity_tag_5, servity_tag_6, servity_tag_7, servity_tag_8, risk_1, risk_2, risk_3, risk_4, risk_5, risk_6, risk_7, risk_8,
         satisfaction_1, satisfaction_2, satisfaction_3, satisfaction_4, satisfaction_5, satisfaction_6, satisfaction_7, satisfaction_8, servity_final, satisfaction_final, risk_final,
         pg2_s3_31, pg2_s3_32, pg2_s3_33, pg2_s3_34, pg2_s3_35, pg2_s3_36, pg2_s3_37, pg2_s3_3839, pg2_s3_40, pg2_s3_41, pg2_s3_42, pg2_s3_43, pg2_s3_44, div31, div32, div33, div34, div35, div36, div37, div3839, div40, div41, div42, div43, div44,
         blck_cls_risk_final, blck_cls_satisfaction_final, blck_cls_servity_final, blck_cls_1, blck_cls_2, blck_cls_3, blck_cls_4, blck_cls_5, blck_cls_6, blck_cls_7, blck_cls_8, blck_cls_9, blck_cls_10, blck_cls_11, blck_cls_12, blck_cls_13, blck_cls_14, blck_cls_15, blck_cls_16, blck_cls_17, blck_cls_18, blck_cls_19, blck_cls_20, blck_cls_21, blck_cls_22, blck_cls_23, blck_cls_24,
        block_risk_final, block_satisfaction_final, block_servity_final, block_1, block_2, block_3, block_4, block_5, block_6, block_7, block_8, block_9, block_10, block_11, block_12, block_13, block_14, block_15, block_16, block_17, block_18, block_19, block_20, block_21, block_22, block_23, block_24
        , RGcmnt_sec2_13, RGcmnt_sec2_14, RGcmnt_sec2_15, RGcmnt_sec2_16, RGcmnt_sec2_17, RGcmnt_sec2_18, evidence_doc, previoussttudy_gaps_doclist, situationhomecountry_doclist, valude_doclist, potentionalsituation_doclist, immigration_doclist, knowledge_doclist
         , potentional_block_cls1, potentional_score1, potentional_levelodrisk, potentional_block_cls2, potentional_score2, potentional_satisfaction, potentional_block_cls3, potentional_score3, potentional_servity,
         immihistory_blockclass2, immihistory_blockclass3, immihistory_blockclass1, immihistory_score1, immihistory_score2, immihistory_score3, immihistory_levelofrisk, immihistory_satisfaction, immihistory_severity, homecountry_percentage1, homecountry_percentage2, homecountry_percentage3, homecountry_blockclass1, homecountry_blockclass2, homecountry_blockclass3, homecountry_score1, homecountry_score2, homecountry_score3,
         retentionrisk_percentage1, retentionrisk_percentage2, retentionrisk_percentage3, retentionrisk_blockclass1, retentionrisk_blockclass2, retentionrisk_blockclass3, retentionrisk_score1, retentionrisk_score2, retentionrisk_score3,
         previous_blockclass1, previous_blockclass2, previous_blockclass3, previous_score1, previous_score2, previous_score3, previous_percentage1, previous_percentage2, previous_percentage3, employment_percentage1, employment_percentage2, employment_percentage3, employment_blockclass1, employment_blockclass2, employment_blockclass3, employment_score1, employment_score2, employment_score3;

    public int ApplicantID = 0, universityID = 0,app_licant_ID = 0, aid=0;
    public string webURL = String.Empty;
    public GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    int downloadPdf = 0;
    int userScore = 0;
    int section1Question;
    int section2Question;
    public string CID;
    public int IsFeedback = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        webURL = Utility.GetWebUrl();

        if (Request.QueryString["downloadPdf"] != null)
            downloadPdf = Convert.ToInt32(Request.QueryString["downloadPdf"]);



        if ((Request.QueryString["CID"] != null) || (Request.QueryString["CID"].ToString() != ""))
            CID = Request.QueryString["CID"];
        if (CID == "NO")
        {
            int aid = 0;
            if ((Request.QueryString["id"] != null) || (Request.QueryString["id"].ToString() != ""))
                 aid= Convert.ToInt32(Request.QueryString["id"]);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Report not yet genrated.');window.location='" + webURL + "admin/manageapplicant.aspx?ID=" + aid + "';", true);
        }
        else
        {
            if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "" || Request.QueryString["downloadPdf"] == null || Request.QueryString["downloadPdf"].ToString() == "")
            {
                showContent(CID);
            }
            else
            {

                int.TryParse(Request.QueryString["downloadPdf"].ToString(), out downloadPdf);
                if ((Request.QueryString["CID"] != null) || (Request.QueryString["CID"].ToString() != ""))
                    CID = Request.QueryString["CID"];
                if (downloadPdf == 0 || (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr"))
                {
                    showContent(CID);
                }

            }
        }


    }
    private void showContent(string CID)
    {
        try
        {
            //if (downloadPdf != 1)
            //{
            //    btnDiv.Style.Remove("display");
            //    btnDownload.Visible = true;
            //}
            var Personal = db.applicantdetails.Where(x => x.gtereportNO == CID).FirstOrDefault();
            //int ApplicantID = Convert.ToInt32(Personal.applicantid);
            ApplicantID = Convert.ToInt32(Personal.applicantid);
            aid = Convert.ToInt32(Personal.applicantid);
            int universityID = Utility.GetUniversityId();
            var admin_response = db.gte_report_admin_comment.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID).FirstOrDefault();
            var gteprogressbar = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();

            var video_data = db.gte_videouploadmaster.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.type.ToLower() == "verification video").FirstOrDefault();
            if (video_data != null)
                VerificationvideoURL = webURL + "/Docs/admin_verification_video/" + universityID + "/" + ApplicantID + "/" + video_data.documentpath;
            else
                QR_verificationDiv.Attributes.Add("style", "display:none;");

            if (Personal != null)
            {

                if (Personal.postalcountry != null)
                    ViewState["homeCountry"] = objCom.GetCountryDiscription(Convert.ToInt32(Personal.postalcountry));
                if (Personal.nationality != null)
                    ViewState["nationality"] = objCom.GetCountryDiscription(Convert.ToInt32(Personal.nationality));

                if (Personal.countryofeducationInstitution != null)
                    ViewState["Countryapplyingtostudy"] = objCom.GetCountryDiscription(Convert.ToInt32(Personal.countryofeducationInstitution));

                var institutionDetails = db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.university_name, x.universityid, x.logo, cityName = x.citymaster.name }).FirstOrDefault();

                if (institutionDetails != null)
                {
                    logourl = webURL + "/Docs/" + institutionDetails.universityid + "/" + institutionDetails.logo;
                    instutionname = institutionDetails.university_name;

                    ViewState["eduInstitution"] = institutionDetails.university_name;
                    //ViewState["eduCity"] = institutionDetails.cityName;
                }
                ViewState["eduCity"] = objCom.GetCityName(Convert.ToInt32(Personal.cityofeducationInstitution));
                candidateno = Personal.applicantid.ToString();
                StudentName = Personal.firstname;
                familyname = Personal.lastname;
                firstname = Personal.firstname;
                middlename = Personal.middlename;
                dateofbirth = Convert.ToDateTime(Personal.dateofbirth).ToString("dd-MM-yyyy");
                institutionNo = Personal.universityid.ToString();
                gtereportNo = Personal.gtereportNO;
                CID = Personal.gtereportNO;
                courseapplied = objCom.GetDetailedFieldDescription(Convert.ToInt32(Personal.detailedFieldIDyouwillComplete));
                int? genderid = Personal.gender;
                if (Personal.gender != null)
                    gender = " " + db.gender_master.Where(x => x.id == genderid).Select(x => x.description).FirstOrDefault();

                if (Personal.nationality != null)
                    nationality = objCom.GetCountryDiscription(Convert.ToInt32(Personal.nationality));
                if (Personal.residentialcountry != null)
                    countryofresidence = objCom.GetCountryDiscription(Convert.ToInt32(Personal.residentialcountry));

                citizenship = objCom.GetCountryDiscription(Convert.ToInt32(Personal.countryof_citizenship));
                age = CalculateAge(Convert.ToDateTime(Personal.dateofbirth)).ToString();

                if (objCom.GetSection3Answer(ApplicantID, 14) == true)
                    Isoffshore = "YES";
                else
                    Isoffshore = "NO";
                maritalstatus = objCom.GetMaritalStatusDiscrition(Convert.ToInt32(Personal.maritalstatus));
                //if (Personal.maritalstatus == 3)
                //    marriedyears = CalculateAge(Convert.ToDateTime(objCom.GetClarification_applicantResponse(ApplicantID, 39))).ToString() + "YEARS";
                //else
                //    marriedyears = string.Empty;

                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 40)))
                    spousecitizenship = objCom.GetCountryDiscription(Convert.ToInt32(objCom.GetClarification_applicantResponse(ApplicantID, 40)));
                else
                    spousecitizenship = "None";
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 41)))
                {
                    Isdependent = "Yes";
                    int id = Convert.ToInt32(objCom.GetClarification_applicantResponse(ApplicantID, 41));
                    noofdependents = db.Number_of_dependents.Where(x => x.id == id).Select(x => x.description).FirstOrDefault();
                }
                else
                {
                    Isdependent = "No";
                    noofdependents = "No";
                }
                int levelofcourse = Convert.ToInt32(Personal.levelofcourse);
                var levelofstudy_tag = db.studylevelmaster.Where(x => x.studylevelid == levelofcourse).Select(x => x.AL_grouping_id).FirstOrDefault();
                int countryid = Convert.ToInt32(Personal.countryof_citizenship);

                var al_data = db.al_country_mapping_master.Where(x => x.countryid == countryid && x.al_group_id == levelofstudy_tag).FirstOrDefault();
                if (al_data != null)
                    AL_Level = "AL-" + al_data.value;
                else
                    AL_Level = string.Empty;

                passportno = Personal.passportno;
                sponsoringclient = objCom.GetUniversityName(universityID);
                if (Personal.isstudentreferbyagent == 1)
                {
                    if (Personal.agentid != null)
                        facilitingagent = db.agentmaster.Where(x => x.agentid == Personal.agentid).Select(x => x.agentname).FirstOrDefault();
                }
                else /*if (Personal.isstudentreferbyagent == 0)*/
                    facilitingagent = "None";
                if (!string.IsNullOrEmpty(Personal.what_package))
                    packagapplied = Personal.what_package;
                else
                    packagapplied = "None";
                recommendationURL = webURL + "/Docs/GTEProfileDetail/" + Personal.profilephoto; //webURL + "assets/GTEReport/user-img.png";

                CountryIamapplyingtoStudy = objCom.GetCountryDiscription(Convert.ToInt32(Personal.countryofeducationInstitution));

                ////page2

                if (admin_response != null)
                {
                    if (admin_response.recommendedwithcaution == 1)
                    {
                        recommendedwithcaution = webURL + "assets/GTEReport/tumb_right.png";
                        recommendtionText = "Recommended" + "<br><br>";
                    }
                    else if (admin_response.recommendedwithcaution == 2)
                    {
                        recommendedwithcaution = webURL + "assets/GTEReport/tumb.png";
                        recommendtionText = "Recommended" + "<br>" + " with caution";
                    }
                    else if (admin_response.recommendedwithcaution == 3)
                    {
                        recommendedwithcaution = webURL + "assets/GTEReport/tumb_down.png";
                        recommendtionText = " Not Recommended" + "<br><br>";
                    }
                    if (admin_response.reported_date != null)
                        GTEFeedback_reportdate = Convert.ToDateTime(admin_response.reported_date).ToString("dd MMM yyyy");

                    if (admin_response.verificationreport_proctorremark != null)
                        proctorremarks_ifverified = admin_response.verificationreport_proctorremark;

                    if (admin_response.proctoringreport_proctorremark != null)
                        proctorremarks_ifdisqualify = admin_response.proctoringreport_proctorremark;

                    if (admin_response.verificationreport_4_1 != null && admin_response.verificationreport_4_1 == 1)
                        chkboxURL4_1 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        chkboxURL4_1 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.verificationreport_4_2 != null && admin_response.verificationreport_4_2 == 1)
                        chkboxURL4_2 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        chkboxURL4_2 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.verificationreport_4_3 != null && admin_response.verificationreport_4_3 == 1)
                        chkboxURL4_3 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        chkboxURL4_3 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.proctoringreport_5_1 != null && admin_response.proctoringreport_5_1 == 1)
                        checkboxurl_5_1 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        checkboxurl_5_1 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.proctoringreport_5_2 != null && admin_response.proctoringreport_5_2 == 1)
                        checkboxurl_5_2 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        checkboxurl_5_2 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.proctoringreport_5_3 != null && admin_response.proctoringreport_5_3 == 1)
                        checkboxurl_5_3 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        checkboxurl_5_3 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.proctoringreport_5_4 != null && admin_response.proctoringreport_5_4 == 1)
                        checkboxurl_5_4 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        checkboxurl_5_4 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.proctoringreport_5_5 != null && admin_response.proctoringreport_5_5 == 1)
                        checkboxurl_5_5 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        checkboxurl_5_5 = webURL + "assets/GTEReport/checkbox-cross.png";

                    if (admin_response.proctoringreport_5_6 != null && admin_response.proctoringreport_5_6 == 1)
                        checkboxurl_5_6 = webURL + "assets/GTEReport/checkbox-checcked.png";
                    else
                        checkboxurl_5_6 = webURL + "assets/GTEReport/checkbox-cross.png";

                }
                else
                {
                    chkboxURL4_1 = webURL + "assets/GTEReport/checkbox.png";
                    chkboxURL4_2 = webURL + "assets/GTEReport/checkbox.png";
                    chkboxURL4_3 = webURL + "assets/GTEReport/checkbox.png";

                    checkboxurl_5_1 = webURL + "assets/GTEReport/checkbox.png";
                    checkboxurl_5_2 = webURL + "assets/GTEReport/checkbox.png";
                    checkboxurl_5_3 = webURL + "assets/GTEReport/checkbox.png";
                    checkboxurl_5_4 = webURL + "assets/GTEReport/checkbox.png";
                    checkboxurl_5_5 = webURL + "assets/GTEReport/checkbox.png";
                    checkboxurl_5_6 = webURL + "assets/GTEReport/checkbox.png";
                }


                if (objCom.GetSection3Answer(ApplicantID, 31) == true) { pg2_s3_31 = "crm-box-wrpr bg-gry"; div31 = "has-cross"; }
                else
                    pg2_s3_31 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 32) == true) { pg2_s3_32 = "crm-box-wrpr bg-gry"; div32 = "has-cross"; }
                else
                    pg2_s3_32 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 33) == true) { pg2_s3_33 = "crm-box-wrpr bg-gry"; div33 = "has-cross"; }
                else
                    pg2_s3_33 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 34) == true) { pg2_s3_34 = "crm-box-wrpr bg-gry"; div34 = "has-cross"; }
                else
                    pg2_s3_34 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 35) == true) { pg2_s3_35 = "crm-box-wrpr bg-gry"; div35 = "has-cross"; }
                else
                    pg2_s3_35 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 36) == true) { pg2_s3_36 = "crm-box-wrpr bg-gry"; div36 = "has-cross"; }
                else
                    pg2_s3_36 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 37) == true) { pg2_s3_37 = "crm-box-wrpr bg-gry"; div37 = "has-cross"; }
                else
                    pg2_s3_37 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 38) == true && objCom.GetSection3Answer(ApplicantID, 39) == true) { pg2_s3_3839 = "crm-box-wrpr bg-gry"; div3839 = "has-cross"; }
                else
                    pg2_s3_3839 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 40) == true) { pg2_s3_40 = "crm-box-wrpr bg-gry"; div40 = "has-cross"; }
                else
                    pg2_s3_40 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 41) == true) { pg2_s3_41 = "crm-box-wrpr bg-gry"; div41 = "has-cross"; }
                else
                    pg2_s3_41 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 42) == true) { pg2_s3_42 = "crm-box-wrpr bg-gry"; div42 = "has-cross"; }
                else
                    pg2_s3_42 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 43) == true) { pg2_s3_43 = "crm-box-wrpr bg-gry"; div43 = "has-cross"; }
                else
                    pg2_s3_43 = "crm-box-wrpr bg-red-l";

                if (objCom.GetSection3Answer(ApplicantID, 44) == true) { pg2_s3_44 = "crm-box-wrpr bg-gry"; div44 = "has-cross"; }
                else
                    pg2_s3_44 = "crm-box-wrpr bg-red-l";

                //page3

                if (gteprogressbar != null)
                {
                    string activityDate = Convert.ToDateTime(gteprogressbar.gte_declaration_completed_date).ToString("dd/MM/yyyy hh:mm tt");
                    var datearr = activityDate.Split(' ');
                    reportsubmitteddate = datearr[1] + " " + datearr[2] + " (GMT) on " + datearr[0];
                    ipaddress = gteprogressbar.activity_ip;

                    overallscore = gteprogressbar.gte_perdentage_score;

                    if (gteprogressbar.performance_category != null)
                    {
                        int gradeid = Convert.ToInt32(gteprogressbar.performance_category);
                        var data = db.gte_certificatelevel_description.Where(x => x.id == gradeid).FirstOrDefault();
                        ratingimplies = data.description;
                        grade = data.grade;
                        rangeofpercentage = data.percentage;
                    }
                }
                tag1 = GetTag(1);
                tag2 = GetTag(2);
                tag3 = GetTag(3);
                tag4 = GetTag(4);
                tag5 = GetTag(5);
                tag6 = GetTag(6);
                tag7 = GetTag(7);

                var Tag1_total = GetSection1_tag_scoring("1", ApplicantID, universityID) + GetSection2_tag_scoring("1", ApplicantID, universityID);
                tag1_score = GetScoring(Tag1_total);

                var Tag2_total = GetSection1_tag_scoring("2", ApplicantID, universityID) + GetSection2_tag_scoring("2", ApplicantID, universityID);
                tag2_score = GetScoring(Tag2_total);

                var Tag3_total = GetSection1_tag_scoring("3", ApplicantID, universityID) + GetSection2_tag_scoring("3", ApplicantID, universityID);
                tag3_score = GetScoring(Tag3_total);

                var Tag4_total = GetSection1_tag_scoring("4", ApplicantID, universityID) + GetSection2_tag_scoring("4", ApplicantID, universityID);
                tag4_score = GetScoring(Tag4_total);

                var Tag5_total = GetSection1_tag_scoring("5", ApplicantID, universityID) + GetSection2_tag_scoring("5", ApplicantID, universityID);
                tag5_score = GetScoring(Tag5_total);

                var Tag6_total = GetSection1_tag_scoring("6", ApplicantID, universityID) + GetSection2_tag_scoring("6", ApplicantID, universityID);
                tag6_score = GetScoring(Tag6_total);

                var Tag7_total = GetSection1_tag_scoring("7", ApplicantID, universityID) + GetSection2_tag_scoring("7", ApplicantID, universityID);
                tag7_score = GetScoring(Tag7_total);
                CQ_Ques_1 = AddContentInText2(objCom.GetClarification_Question(1));
                CQ_Ques_2 = AddContentInText2(objCom.GetClarification_Question(2));
                CQ_Ques_4 = AddContentInText2(objCom.GetClarification_Question(4));
                CQ_Ques_5 = AddContentInText2(objCom.GetClarification_Question(5));
                CQ_Ques_8 = AddContentInText2(objCom.GetClarification_Question(8));
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 1)))
                { CQ_Ans_1 = objCom.GetClarification_applicantResponse(ApplicantID, 1); cq1.Attributes.Add("style", "display:block;"); cqans_1.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 2)))
                { CQ_Ans_2 = objCom.GetClarification_applicantResponse(ApplicantID, 2); cq2.Attributes.Add("style", "display:block;"); cqans_2.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 4)))
                { CQ_Ans_4 = objCom.GetClarification_applicantResponse(ApplicantID, 4); cq4.Attributes.Add("style", "display:block;"); cqans_4.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 5)))
                { CQ_Ans_5 = objCom.GetClarification_applicantResponse(ApplicantID, 5); cq5.Attributes.Add("style", "display:block;"); cqans_5.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 8)))
                { CQ_Ans_8 = objCom.GetClarification_applicantResponse(ApplicantID, 8); cq8.Attributes.Add("style", "display:block;"); cqans_8.Attributes.Add("style", "display:block;"); }
                //other cq in other page
                //10
                if (objCom.GetSection3Answer(ApplicantID, 1) == true) { classPS_10_1 = "cd-info-box bg-red"; PSbox10_1 = "YES"; }
                else { classPS_10_1 = "cd-info-box bg-green-l"; PSbox10_1 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 2) == false) { classPS_10_2 = "cd-info-box bg-red"; PSbox10_2 = "YES"; }
                else { classPS_10_2 = "cd-info-box bg-green-l"; PSbox10_2 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 4) == false) { classPS_10_3 = "cd-info-box bg-red"; PSbox10_3 = "YES"; }
                else { classPS_10_3 = "cd-info-box bg-green-l"; PSbox10_3 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 6) == false) { classPS_10_4 = "cd-info-box bg-red"; PSbox10_4 = "YES"; }
                else { classPS_10_4 = "cd-info-box bg-green-l"; PSbox10_4 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 7) == true) { classPS_10_5 = "cd-info-box bg-red"; PSbox10_5 = "YES"; }
                else { classPS_10_5 = "cd-info-box bg-green-l"; PSbox10_5 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 9) == false) { classPS_10_6 = "cd-info-box bg-red"; PSbox10_6 = "YES"; }
                else { classPS_10_6 = "cd-info-box bg-green-l"; PSbox10_6 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 12) == false) { classPS_10_7 = "cd-info-box bg-red"; PSbox10_7 = "YES"; }
                else { classPS_10_7 = "cd-info-box bg-green-l"; PSbox10_7 = "NO"; }

                classPS_10_8 = "cd-info-box bg-green-l"; PSbox10_8 = "NO";

                if (objCom.GetSection3Answer(ApplicantID, 15) == false) { classPS_10_9 = "cd-info-box bg-red"; PSbox10_9 = "YES"; }
                else { classPS_10_9 = "cd-info-box bg-green-l"; PSbox10_9 = "NO"; }

                //S3/A10 & 11/T =Y
                var levelodstudy_systemlevel = objCom.GetStudy_systemlevel(Convert.ToInt32(Personal.levelofcourse)) - objCom.GetStudy_systemlevel(Convert.ToInt32(Personal.highestqualifiactionachieved));
                if (levelodstudy_systemlevel <= -2 && (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel < 1))
                { classPS_10_10 = "cd-info-box bg-red"; PSbox10_10 = "YES"; }
                else { classPS_10_10 = "cd-info-box bg-green-l"; PSbox10_10 = "NO"; }

                //s3/A12/T=Y
                if (levelodstudy_systemlevel == 0)
                { classPS_10_11 = "cd-info-box bg-red"; PSbox10_11 = "YES"; }
                else
                { classPS_10_11 = "cd-info-box bg-green-l"; PSbox10_11 = "NO"; }

                //s3/A16/T=Y
                if (Personal.broadFieldID != null && Personal.broadFieldID == 12 && Personal.narrowFieldID != null && Personal.narrowFieldID == 68 && (Personal.broadFieldID != Personal.broadFieldIDyouwillComplete))
                { classPS_10_12 = "cd-info-box bg-red"; PSbox10_12 = "YES"; }
                else
                { classPS_10_12 = "cd-info-box bg-green-l"; PSbox10_12 = "NO"; }

                //s3/A17/T=Y
                if (Personal.broadFieldID != null && Personal.broadFieldID == 12 && Personal.narrowFieldID != null && Personal.narrowFieldID == 68 && (Personal.narrowFieldID != Personal.narrowFieldIDyouwillComplete))
                { classPS_10_13 = "cd-info-box bg-red"; PSbox10_13 = "YES"; }
                else
                { classPS_10_13 = "cd-info-box bg-green-l"; PSbox10_13 = "NO"; }

                // s3 / A18 / T = Y  IF Question 28 = None (no full time work experience)
                if (Personal.workexperience == 1)
                { classPS_10_14 = "cd-info-box bg-red"; PSbox10_14 = "YES"; }
                else
                { classPS_10_14 = "cd-info-box bg-green-l"; PSbox10_14 = "NO"; }



                ////page4
                CQ_Ques_12 = AddContentInText2(objCom.GetClarification_Question(12));
                CQ_Ques_13 = AddContentInText2(objCom.GetClarification_Question(13));
                CQ_Ques_34 = AddContentInText2(objCom.GetClarification_Question(34));
                CQ_Ques_35 = AddContentInText2(objCom.GetClarification_Question(35));

                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 36)))
                { CQ_Ans_36 = objCom.GetClarification_applicantResponse(ApplicantID, 36); cq36.Attributes.Add("style", "display:block;"); cqans_36.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 37)))
                { CQ_Ans_37 = objCom.GetClarification_applicantResponse(ApplicantID, 37); cq37.Attributes.Add("style", "display:block;"); cqans_37.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 38)))
                { CQ_Ans_38 = objCom.GetClarification_applicantResponse(ApplicantID, 38); cq38.Attributes.Add("style", "display:block;"); cqans_38.Attributes.Add("style", "display:block;"); }


                RGcmnt_sec2_13 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 13));
                RGcmnt_sec2_14 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 14));
                RGcmnt_sec2_15 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 15));
                RGcmnt_sec2_16 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 16));
                RGcmnt_sec2_17 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 17));
                RGcmnt_sec2_18 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 18));


                CQ_Ques_3 = AddContentInText2(objCom.GetClarification_Question(3));
                CQ_Ques_46 = AddContentInText2(objCom.GetClarification_Question(46));
                CQ_Ques_47 = AddContentInText2(objCom.GetClarification_Question(47));

                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 3)))
                { CQ_Ans_3 = objCom.GetClarification_applicantResponse(ApplicantID, 3); cq3.Attributes.Add("style", "display:block;"); cqans_3.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 46)))
                { CQ_Ans_46 = objCom.GetClarification_applicantResponse(ApplicantID, 46); cq46.Attributes.Add("style", "display:block;"); cqans_46.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 47)))
                { CQ_Ans_47 = objCom.GetClarification_applicantResponse(ApplicantID, 47); cq47.Attributes.Add("style", "display:block;"); cqans_47.Attributes.Add("style", "display:block;"); }

                if (objCom.GetSection3Answer(ApplicantID, 5) == true) { classRR_13_5 = "cd-info-box bg-red"; RRisk_5 = "YES"; }
                else { classRR_13_5 = "cd-info-box bg-green-l"; RRisk_5 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 10) == true) { classRR_13_10 = "cd-info-box bg-red"; RRisk_10 = "HIGH"; }
                else { classRR_13_10 = "cd-info-box bg-green-l"; RRisk_10 = "LOW"; }

                if (objCom.GetSection3Answer(ApplicantID, 11) == true) { classRR_13_11 = "cd-info-box bg-red"; RRisk_11 = "HIGH"; }
                else { classRR_13_11 = "cd-info-box bg-green-l"; RRisk_11 = "LOW"; }

                if (objCom.GetSection3Answer(ApplicantID, 29) == true) { classRR_13_29 = "cd-info-box bg-red"; RRisk_29 = "HIGH"; }
                else { classRR_13_29 = "cd-info-box bg-green-l"; RRisk_29 = "LOW"; }

                if (objCom.GetSection3Answer(ApplicantID, 30) == true) { classRR_13_30 = "cd-info-box bg-red"; RRisk_30 = "HIGH"; }
                else { classRR_13_30 = "cd-info-box bg-green-l"; RRisk_30 = "LOW"; }

                if (objCom.GetSection3Answer(ApplicantID, 49) == true) { classRR_13_49 = "cd-info-box bg-green-l"; RRisk_49 = "YES"; }
                else { classRR_13_49 = "cd-info-box bg-red"; RRisk_49 = "NO"; }

                ////page4.1

                var AnswertoQuestion_13Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 13));
                if (!string.IsNullOrEmpty(AnswertoQuestion_13Section2))
                    AnswertoQuestion_13_Section2 = AnswertoQuestion_13Section2;

                if (objCom.GetSection2_BlckClr(ApplicantID, 13) == "red")
                    AnswertoQuestion_13Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_13Section2_class = "cd-info-box bg-green-l wid-163";

                var AnswertoQuestion_14Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 14));
                if (!string.IsNullOrEmpty(AnswertoQuestion_14Section2))
                    AnswertoQuestion_14_Section2 = AnswertoQuestion_14Section2;
                if (objCom.GetSection2_BlckClr(ApplicantID, 14) == "red")
                    AnswertoQuestion_14Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_14Section2_class = "cd-info-box bg-green-l wid-163";

                var AnswertoQuestion_15Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 15));
                if (!string.IsNullOrEmpty(AnswertoQuestion_15Section2))
                    AnswertoQuestion_15_Section2 = AnswertoQuestion_15Section2;
                if (objCom.GetSection2_BlckClr(ApplicantID, 15) == "red")
                    AnswertoQuestion_15Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_15Section2_class = "cd-info-box bg-green-l wid-163";

                var AnswertoQuestion_16Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 16));
                if (!string.IsNullOrEmpty(AnswertoQuestion_16Section2))
                    AnswertoQuestion_16_Section2 = AnswertoQuestion_16Section2;
                if (objCom.GetSection2_BlckClr(ApplicantID, 16) == "red")
                    AnswertoQuestion_16Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_16Section2_class = "cd-info-box bg-green-l wid-163";


                var AnswertoQuestion_17Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 17));
                if (!string.IsNullOrEmpty(AnswertoQuestion_17Section2))
                    AnswertoQuestion_17_Section2 = AnswertoQuestion_17Section2;
                if (objCom.GetSection2_BlckClr(ApplicantID, 17) == "red")
                    AnswertoQuestion_17Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_17Section2_class = "cd-info-box bg-green-l wid-163";

                var AnswertoQuestion_18Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 18));
                if (!string.IsNullOrEmpty(AnswertoQuestion_18Section2))
                    AnswertoQuestion_18_Section2 = AnswertoQuestion_18Section2;
                if (objCom.GetSection2_BlckClr(ApplicantID, 18) == "red")
                    AnswertoQuestion_18Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_18Section2_class = "cd-info-box bg-green-l wid-163";

                if (Personal.Iscurrentlyworking != null)
                {
                    if (Personal.Iscurrentlyworking == 1)
                    { Iscurrentlyemployed = "YES"; iscurrwrkngclass = "cd-info-box bg-green-l wid-107"; }
                    else
                    { Iscurrentlyemployed = "NO"; iscurrwrkngclass = "cd-info-box bg-red wid-107"; }
                }
                else { Iscurrentlyemployed = "NO"; iscurrwrkngclass = "cd-info-box bg-red wid-107"; }

                if (Personal.workexperience != null)
                    workexpericeyears = db.workexperienceyearsmaster.Where(x => x.workexperienceyearsid == Personal.workexperience).Select(x => x.description).FirstOrDefault();

                if (Personal.Isjoboffered != null)
                {
                    if (Personal.Isjoboffered == 1) { Isjobofferedinhomecountry = "YES"; IsjobofferedinhomecountryClass = "cd-info-box bg-green-l wid-107"; }
                    else { Isjobofferedinhomecountry = "NO"; IsjobofferedinhomecountryClass = "cd-info-box bg-red wid-107"; }
                }

                CQ_Ques_36 = AddContentInText2(objCom.GetClarification_Question(36));
                CQ_Ques_37 = AddContentInText2(objCom.GetClarification_Question(37));
                CQ_Ques_38 = AddContentInText2(objCom.GetClarification_Question(38));
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 12)))
                { CQ_Ans_12 = objCom.GetClarification_applicantResponse(ApplicantID, 12); cq12.Attributes.Add("style", "display:block;"); cqans_12.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 13)))
                { CQ_Ans_13 = objCom.GetClarification_applicantResponse(ApplicantID, 13); cq13.Attributes.Add("style", "display:block;"); cqans_13.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 34)))
                { CQ_Ans_34 = objCom.GetClarification_applicantResponse(ApplicantID, 34); cq34.Attributes.Add("style", "display:block;"); cqans_34.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 35)))
                { CQ_Ans_35 = objCom.GetClarification_applicantResponse(ApplicantID, 35); cq35.Attributes.Add("style", "display:block;"); cqans_35.Attributes.Add("style", "display:block;"); }



                ////page5
                CQ_Ques_7 = AddContentInText2(objCom.GetClarification_Question(7));
                CQ_Ques_10 = AddContentInText2(objCom.GetClarification_Question(10));
                CQ_Ques_11 = AddContentInText2(objCom.GetClarification_Question(11));
                CQ_Ques_14 = AddContentInText2(objCom.GetClarification_Question(14));
                CQ_Ques_15 = AddContentInText2(objCom.GetClarification_Question(15));
                CQ_Ques_16 = AddContentInText2(objCom.GetClarification_Question(16));
                CQ_Ques_31 = AddContentInText2(objCom.GetClarification_Question(31));
                CQ_Ques_48 = AddContentInText2(objCom.GetClarification_Question(48));

                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 7)))
                { CQ_Ans_7 = objCom.GetClarification_applicantResponse(ApplicantID, 7); cq7.Attributes.Add("style", "display:block;"); cqans_7.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 10)))
                { CQ_Ans_10 = objCom.GetClarification_applicantResponse(ApplicantID, 10); cq10.Attributes.Add("style", "display:block;"); cqans_10.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 11)))
                { CQ_Ans_11 = objCom.GetClarification_applicantResponse(ApplicantID, 11); cq11.Attributes.Add("style", "display:block;"); cqans_11.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 14)))
                { CQ_Ans_14 = objCom.GetClarification_applicantResponse(ApplicantID, 14); cq14.Attributes.Add("style", "display:block;"); cqans_14.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 15)))
                { CQ_Ans_15 = objCom.GetClarification_applicantResponse(ApplicantID, 15); cq15.Attributes.Add("style", "display:block;"); cqans_15.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 16)))
                { CQ_Ans_16 = objCom.GetClarification_applicantResponse(ApplicantID, 16); cq16.Attributes.Add("style", "display:block;"); cqans_16.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 31)))
                { CQ_Ans_31 = objCom.GetClarification_applicantResponse(ApplicantID, 31); cq31.Attributes.Add("style", "display:block;"); cqans_31.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 48)))
                { CQ_Ans_48 = objCom.GetClarification_applicantResponse(ApplicantID, 48); cq48.Attributes.Add("style", "display:block;"); cqans_48.Attributes.Add("style", "display:block;"); }

                if (objCom.GetSection3Answer(ApplicantID, 24) == true) { classPS_15_1 = "cd-info-box bg-red"; section3_24 = "NO"; }
                else { classPS_15_1 = "cd-info-box bg-green-l"; section3_24 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 21) == false) { classPS_15_2 = "cd-info-box bg-red"; section3_21 = "YES"; }
                else { classPS_15_2 = "cd-info-box bg-green-l"; section3_21 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 26) == false) { classPS_15_3 = "cd-info-box bg-red"; section3_26 = "YES"; }
                else { classPS_15_3 = "cd-info-box bg-green-l"; section3_26 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 27) == false) { classPS_15_4 = "cd-info-box bg-red"; section3_27 = "YES"; }
                else { classPS_15_4 = "cd-info-box bg-green-l"; section3_27 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 17) == false) { classPS_15_5 = "cd-info-box bg-red"; section3_17 = "YES"; }
                else { classPS_15_5 = "cd-info-box bg-green-l"; section3_17 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 43) == false) { classPS_15_6 = "cd-info-box bg-red"; section3_43 = "YES"; }
                else { classPS_15_6 = "cd-info-box bg-green-l"; section3_43 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 28) == true) { classPS_15_7 = "cd-info-box bg-red"; section3_28 = "YES"; }
                else { classPS_15_7 = "cd-info-box bg-green-l"; section3_28 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 20) == true) { classPS_15_8 = "cd-info-box bg-red"; section3_20 = "YES"; }
                else { classPS_15_8 = "cd-info-box bg-green-l"; section3_20 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 14) == true) { classPS_15_9 = "cd-info-box bg-green-l"; section3_14 = "YES"; }
                else { classPS_15_9 = "cd-info-box bg-red"; section3_14 = "NO"; }

                RGcmnt_1 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 1));
                RGcmnt_2 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 2));
                RGcmnt_3 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 3));
                RGcmnt_4 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 4));
                RGcmnt_5 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 5));
                RGcmnt_6 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 6));
                RGcmnt_7 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 7));
                RGcmnt_8 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 8));


                CQ_Ques_43 = AddContentInText2(objCom.GetClarification_Question(43));
                CQ_Ques_44 = AddContentInText2(objCom.GetClarification_Question(44));
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 43)))
                { CQ_Ans_43 = objCom.GetClarification_applicantResponse(ApplicantID, 43); cq43.Attributes.Add("style", "display:block;"); cqans_43.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 44)))
                { CQ_Ans_44 = objCom.GetClarification_applicantResponse(ApplicantID, 44); cq44.Attributes.Add("style", "display:block;"); cqans_44.Attributes.Add("style", "display:block;"); }

                AnswertoQuestion_1_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 1));
                if (objCom.GetSection2_BlckClr(ApplicantID, 1) == "red")
                    AnswertoQuestion_1_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_1_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_2_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 2));
                if (objCom.GetSection2_BlckClr(ApplicantID, 2) == "red")
                    AnswertoQuestion_2_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_2_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_3_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 3));
                if (objCom.GetSection2_BlckClr(ApplicantID, 3) == "red")
                    AnswertoQuestion_3_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_3_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_4_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 4));
                if (objCom.GetSection2_BlckClr(ApplicantID, 4) == "red")
                    AnswertoQuestion_4_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_4_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_5_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 5));
                if (objCom.GetSection2_BlckClr(ApplicantID, 5) == "red")
                    AnswertoQuestion_5_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_5_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_6_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 6));
                if (objCom.GetSection2_BlckClr(ApplicantID, 6) == "red")
                    AnswertoQuestion_6_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_6_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_7_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 7));
                if (objCom.GetSection2_BlckClr(ApplicantID, 7) == "red")
                    AnswertoQuestion_7_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_7_Section2_class = "cd-info-box bg-green-l wid-163";

                AnswertoQuestion_8_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 8));
                if (objCom.GetSection2_BlckClr(ApplicantID, 8) == "red")
                    AnswertoQuestion_8_Section2_class = "cd-info-box bg-red wid-163";
                else
                    AnswertoQuestion_8_Section2_class = "cd-info-box bg-green-l wid-163";

                //page6
                if (objCom.GetSection3Answer(ApplicantID, 18) == false) { class16_1 = "cd-info-box bg-red font7"; AnswertoQuestion_18_Section3 = "NO"; }
                else { class16_1 = "cd-info-box bg-green-l font7"; AnswertoQuestion_18_Section3 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 45) == false) { class16_2 = "cd-info-box bg-red font7"; AnswertoQuestion_45_Section3 = "NO"; }
                else { class16_2 = "cd-info-box bg-green-l font7"; AnswertoQuestion_45_Section3 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 19) == false) { class16_3 = "cd-info-box bg-red font7"; AnswertoQuestion_19_Section3 = "NO"; }
                else { class16_3 = "cd-info-box bg-green-l font7"; AnswertoQuestion_19_Section3 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 8) == false) { class16_4 = "cd-info-box bg-red font7"; AnswertoQuestion_8_Section3 = "NO"; }
                else { class16_4 = "cd-info-box bg-green-l font7"; AnswertoQuestion_8_Section3 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 16) == false) { class16_5 = "cd-info-box bg-red font7"; AnswertoQuestion_16_Section3 = "YES"; }
                else { class16_5 = "cd-info-box bg-green-l font7"; AnswertoQuestion_16_Section3 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 3) == false) { class16_6 = "cd-info-box bg-red font7"; AnswertoQuestion_3_Section3 = "NO"; }
                else { class16_6 = "cd-info-box bg-green-l font7"; AnswertoQuestion_3_Section3 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 47) == false) { class16_7 = "cd-info-box bg-red font7"; AnswertoQuestion_47_Section3 = "NO"; }
                else { class16_7 = "cd-info-box bg-green-l font7"; AnswertoQuestion_47_Section3 = "YES"; }

                if (objCom.GetSection3Answer(ApplicantID, 48) == true) { class16_8 = "cd-info-box bg-green-l font7"; AnswertoQuestion_48_Section3 = "YES"; }
                else { class16_8 = "cd-info-box bg-red font7"; AnswertoQuestion_48_Section3 = "NO"; }

                if (objCom.GetSection3Answer(ApplicantID, 49) == true) { class16_9 = "cd-info-box bg-green-l font7"; AnswertoQuestion_49_Section3 = "YES"; }
                else { class16_9 = "cd-info-box bg-red font7"; AnswertoQuestion_49_Section3 = "NO"; }


                AnswertoQuestion_11_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 11));
                if (objCom.GetSection2_BlckClr(ApplicantID, 11) == "red")
                    class16_11 = "cd-info-box bg-red wid155";
                else
                    class16_11 = "cd-info-box bg-green-l wid155";

                AnswertoQuestion_10_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 10));
                if (objCom.GetSection2_BlckClr(ApplicantID, 10) == "red")
                    class16_10 = "cd-info-box bg-red wid155";
                else
                    class16_10 = "cd-info-box bg-green-l wid155";

                AnswertoQuestion_12_Section2 = AddContentInText2(objCom.GetSection2Answer(ApplicantID, 12));
                if (objCom.GetSection2_BlckClr(ApplicantID, 12) == "red")
                    class16_12 = "cd-info-box bg-red wid155";
                else
                    class16_12 = "cd-info-box bg-green-l wid155";


                if (objCom.GetSection3Answer(ApplicantID, 46) == true)
                {
                    sectin3_46 = "TRUE"; sectin3_46_Y_N = "YES"; sec3_46_class = "cd-info-box bg-red wid-107";
                }
                else
                {
                    sectin3_46 = "FALSE"; sectin3_46_Y_N = "NO"; sec3_46_class = "cd-info-box bg-green-l wid-107";
                }
                CQ_Ques_9 = AddContentInText2(objCom.GetClarification_Question(9));
                CQ_Ques_39 = AddContentInText2(objCom.GetClarification_Question(39));
                CQ_Ques_40 = AddContentInText2(objCom.GetClarification_Question(40));
                CQ_Ques_41 = AddContentInText2(objCom.GetClarification_Question(41));
                CQ_Ques_42 = AddContentInText2(objCom.GetClarification_Question(42));
                CQ_Ques_45 = AddContentInText2(objCom.GetClarification_Question(45));

                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 9)))
                { CQ_Ans_9 = objCom.GetClarification_applicantResponse(ApplicantID, 9); cq9.Attributes.Add("style", "display:block;"); cqans_9.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 39)))
                { CQ_Ans_39 = objCom.GetClarification_applicantResponse(ApplicantID, 39); cq39.Attributes.Add("style", "display:block;"); cqans_39.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 40)))
                { CQ_Ans_40 = objCom.GetCountryDiscription(Convert.ToInt32(objCom.GetClarification_applicantResponse(ApplicantID, 40))); cq40.Attributes.Add("style", "display:block;"); cqans_40.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 41)))
                {
                    int id = Convert.ToInt32(objCom.GetClarification_applicantResponse(ApplicantID, 41));
                    var dependent = db.Number_of_dependents.Where(x => x.id == id).Select(x => x.description).FirstOrDefault();
                    CQ_Ans_41 = dependent; cq41.Attributes.Add("style", "display:block;");
                    cqans_41.Attributes.Add("style", "display:block;");
                }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 42)))
                { CQ_Ans_42 = objCom.GetClarification_applicantResponse(ApplicantID, 42); cq42.Attributes.Add("style", "display:block;"); cqans_42.Attributes.Add("style", "display:block;"); }
                if (!string.IsNullOrEmpty(objCom.GetClarification_applicantResponse(ApplicantID, 45)))
                { CQ_Ans_45 = objCom.GetClarification_applicantResponse(ApplicantID, 45); cq45.Attributes.Add("style", "display:block;"); cqans_45.Attributes.Add("style", "display:block;"); }

                RGcmnt_10 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 10));
                RGcmnt_11 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 11));
                RGcmnt_12 = AddContentInText2(objCom.Get_RGCmnt_Section2(ApplicantID, 12));

                evidence_doc = "- " + objCom.GetDocumentName(183) + "<br/>" + "- " + objCom.GetDocumentName(184) + "<br/>" + "- " + objCom.GetDocumentName(185) + "<br/>" + "- " + objCom.GetDocumentName(186) + "<br/>";
                previoussttudy_gaps_doclist = "- " + objCom.GetDocumentName(188) + "<br/>" + "- " + objCom.GetDocumentName(189) + "<br/>" + "- " + objCom.GetDocumentName(190) + "<br/>";

                if (Personal.Iscurrentlyworking == 1 || Personal.Isjoboffered == 1)
                {
                    if (Personal.Iscurrentlyworking == 1)
                        valude_doclist = "- " + objCom.GetDocumentName(193) + "<br/>";
                    if (Personal.Isjoboffered == 1)
                        valude_doclist += "- " + objCom.GetDocumentName(194) + "<br/>";
                }
                else
                    doc3.Attributes.Add("style", "display:none;");

                //2
                situationhomecountry_doclist = "- " + objCom.GetDocumentName(196) + "<br/>" + "- " + objCom.GetDocumentName(197) + "<br/>" + "- " + objCom.GetDocumentName(198) + "<br/>";

                if (Personal.maritalstatus == 3)
                    potentionalsituation_doclist = "- " + objCom.GetDocumentName(200) + "<br/>";
                if (Personal.maritalstatus == 2)
                    potentionalsituation_doclist += "- " + objCom.GetDocumentName(201) + "<br/>";
                if (objCom.GetClarification_applicantResponse(ApplicantID, 41) != "0")
                    potentionalsituation_doclist += "- " + objCom.GetDocumentName(202) + "<br/>";
                if (objCom.GetSection3Answer(ApplicantID, 16) == false)
                    potentionalsituation_doclist += "- " + objCom.GetDocumentName(203) + "<br/>";
                if (Personal.maritalstatus == 3 || Personal.maritalstatus == 2 || objCom.GetClarification_applicantResponse(ApplicantID, 41) != "1" || objCom.GetSection3Answer(ApplicantID, 16) == false)
                { }
                else
                    doc5.Attributes.Add("style", "display:none;");

                var sec3_28 = objCom.GetSection3Answer(ApplicantID, 28);
                var sec3_14 = objCom.GetSection3Answer(ApplicantID, 14);

                if (sec3_28 == false)
                {
                    if (sec3_28 == false && sec3_14 == true)
                        immigration_doclist = "- " + objCom.GetDocumentName(205) + "<br/>";

                    immigration_doclist += "- " + objCom.GetDocumentName(206) + "<br/>";
                }
                else
                    doc6.Attributes.Add("style", "display:none;");

                if (gteprogressbar != null && gteprogressbar.is_gte_certificate_generated == true)
                    knowledge_doclist = "- " + objCom.GetDocumentName(208) + "<br/>";
                else
                    doc7.Attributes.Add("style", "display:none;");

                calculateMatrix(ApplicantID, universityID);
                Bindchart(ApplicantID);
                //var gte_report_matrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();
                //if (gte_report_matrixValue.Count == 0)
                //    calculateMatrix(ApplicantID, universityID);
                //else
                //    calculateMatrix_show(ApplicantID, universityID);
                //Bindchart(ApplicantID);
            }
            //calculateMatrix(ApplicantID, universityID);            
            //DataTable _objdt = new DataTable();
            //_objdt = GetDataForChart();
            //BindDataToChartcontrol(_objdt);
            //Bindchart(ApplicantID);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    public void BindDataToChartcontrol(DataTable _objdt)
    {

        Chart1.DataSource = _objdt;
        Chart1.DataBind();

    }
    protected DataTable GetDataForChart()
    {
        DataTable dt = new DataTable();
        // all columns

        dt.Columns.Add("country", typeof(string));
        dt.Columns.Add("growth", typeof(Int32));
        //dt.Columns.Add("severity", typeof(string));

        dt.Rows.Add("20", 30);
        dt.Rows.Add("40", 10);
        dt.Rows.Add("60", 65);
        dt.Rows.Add("80", 5);
        dt.Rows.Add("100", 6);

        return dt;
    }
    //private void calculateMatrix_show(int aid, int uid)
    //{
    //    try
    //    {
    //        var tag_list = db.question_tag_master.ToList();
    //        var grandtotal_A = 0;
    //        var grandtotal_B = 0;
    //        var grandtotal_C = 0;
    //        var grandtotal_D = 0;

    //        foreach (var item in tag_list)
    //        {
    //            var gte_report_matrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == item.id).FirstOrDefault();
    //            if (item.id != 1)
    //            {
    //                if (item.id == 2)
    //                {                        
    //                    risk_1 = objCom.GetMatrixValue("1", item.id, 1,ApplicantID); block_1 = objCom.GetMatrixValue("1", item.id, 2, ApplicantID); blck_cls_1 = objCom.GetMatrixValue("1", item.id, 3, ApplicantID);
    //                    satisfaction_1 = objCom.GetMatrixValue("2", item.id, 1, ApplicantID); block_2 = objCom.GetMatrixValue("2", item.id, 2, ApplicantID); blck_cls_2 = objCom.GetMatrixValue("2", item.id, 3, ApplicantID);
    //                    servity_tag_1 = objCom.GetMatrixValue("3", item.id, 1, ApplicantID); block_3 = objCom.GetMatrixValue("3", item.id, 2, ApplicantID); blck_cls_3 = objCom.GetMatrixValue("3", item.id, 3, ApplicantID);

    //                    previous_percentage1 = objCom.GetMatrixValue("1", item.id, 1, ApplicantID); previous_score1 = objCom.GetMatrixValue("1", item.id, 2, ApplicantID); previous_blockclass1 = objCom.GetMatrixValue("1", item.id, 3, ApplicantID);
    //                    previous_percentage2 = objCom.GetMatrixValue("2", item.id, 1, ApplicantID); previous_score2 = objCom.GetMatrixValue("2", item.id, 2, ApplicantID); previous_blockclass2 = objCom.GetMatrixValue("2", item.id, 3, ApplicantID);
    //                    previous_percentage3 = objCom.GetMatrixValue("3", item.id, 1, ApplicantID); previous_score3 = objCom.GetMatrixValue("3", item.id, 2, ApplicantID); previous_blockclass3 = objCom.GetMatrixValue("3", item.id, 3, ApplicantID);

    //                }
    //                if (item.id == 5)
    //                {
    //                    risk_2 = objCom.GetMatrixValue("1", item.id, 1, ApplicantID); block_4 = objCom.GetMatrixValue("1", item.id, 2, ApplicantID); blck_cls_4 = objCom.GetMatrixValue("1", item.id, 3, ApplicantID);
    //                    satisfaction_2 = objCom.GetMatrixValue("2", item.id, 1, ApplicantID); block_5 = objCom.GetMatrixValue("2", item.id, 2, ApplicantID); blck_cls_5 = objCom.GetMatrixValue("2", item.id, 3, ApplicantID);
    //                    servity_tag_2 = objCom.GetMatrixValue("3", item.id, 1, ApplicantID); block_6 = objCom.GetMatrixValue("3", item.id, 2, ApplicantID); blck_cls_6 = objCom.GetMatrixValue("3", item.id, 3, ApplicantID);

    //                    employment_percentage1 = objCom.GetMatrixValue("1", item.id, 1, ApplicantID); ; employment_score1 = objCom.GetMatrixValue("1", item.id, 2, ApplicantID); employment_blockclass1 = objCom.GetMatrixValue("1", item.id, 3, ApplicantID);
    //                    employment_percentage2 = objCom.GetMatrixValue("2", item.id, 1, ApplicantID); ; employment_score2 = objCom.GetMatrixValue("2", item.id, 2, ApplicantID); employment_blockclass2 = objCom.GetMatrixValue("2", item.id, 3, ApplicantID);
    //                    employment_percentage3 = objCom.GetMatrixValue("3", item.id, 1, ApplicantID); ; employment_score3 = objCom.GetMatrixValue("3", item.id, 2, ApplicantID); employment_blockclass3 = objCom.GetMatrixValue("3", item.id, 3, ApplicantID);

    //                }
    //                //if (item.id == 3)
    //                //{
    //                //    risk_3 = F; block_7 = setScore_text(userPercentageScore1, 1); blck_cls_7 = setScore_class(userPercentageScore1, 1);
    //                //    satisfaction_3 = E; block_8 = setScore_text(userPercentageScore, 2); blck_cls_8 = setScore_class(userPercentageScore, 2);
    //                //    servity_tag_3 = D; block_9 = setScore_text(Convert.ToInt32(D), 3); blck_cls_9 = setScore_class(Convert.ToInt32(D), 3);

    //                //    homecountry_percentage1 = F; homecountry_score1 = setScore_text(userPercentageScore1, 1); homecountry_blockclass1 = setScore_class_perpage(userPercentageScore1, 1);
    //                //    homecountry_percentage2 = E; homecountry_score2 = setScore_text(userPercentageScore, 2); homecountry_blockclass2 = setScore_class_perpage(userPercentageScore, 2);
    //                //    homecountry_percentage3 = D; homecountry_score3 = setScore_text(Convert.ToInt32(D), 3); homecountry_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3);

    //                //}
    //                //if (item.id == 4)
    //                //{
    //                //    risk_4 = F; block_10 = setScore_text(userPercentageScore1, 1); blck_cls_10 = setScore_class(userPercentageScore1, 1);
    //                //    satisfaction_4 = E; block_11 = setScore_text(userPercentageScore, 2); blck_cls_11 = setScore_class(userPercentageScore, 2);
    //                //    servity_tag_4 = D; block_12 = setScore_text(Convert.ToInt32(D), 3); blck_cls_12 = setScore_class(Convert.ToInt32(D), 3);

    //                //    potentional_levelodrisk = F; potentional_score1 = setScore_text(userPercentageScore1, 1); potentional_block_cls1 = setScore_class_perpage(userPercentageScore1, 1);
    //                //    potentional_satisfaction = E; potentional_score2 = setScore_text(userPercentageScore, 2); potentional_block_cls2 = setScore_class_perpage(userPercentageScore, 2);
    //                //    potentional_servity = D; potentional_score3 = setScore_text(Convert.ToInt32(D), 3); potentional_block_cls3 = setScore_class_perpage(Convert.ToInt32(D), 3);

    //                //}
    //                //if (item.id == 6)
    //                //{
    //                //    risk_5 = F; block_13 = setScore_text(userPercentageScore1, 1); blck_cls_13 = setScore_class(userPercentageScore1, 1);
    //                //    satisfaction_5 = E; block_14 = setScore_text(userPercentageScore, 2); blck_cls_14 = setScore_class(userPercentageScore, 2);
    //                //    servity_tag_5 = D; block_15 = setScore_text(Convert.ToInt32(D), 3); blck_cls_15 = setScore_class(Convert.ToInt32(D), 3);

    //                //    immihistory_levelofrisk = F; immihistory_score1 = setScore_text(userPercentageScore1, 1); immihistory_blockclass1 = setScore_class_perpage(userPercentageScore1, 1);
    //                //    immihistory_satisfaction = E; immihistory_score2 = setScore_text(userPercentageScore, 2); immihistory_blockclass2 = setScore_class_perpage(userPercentageScore, 2);
    //                //    immihistory_severity = D; immihistory_score3 = setScore_text(Convert.ToInt32(D), 3); immihistory_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3);

    //                //}
    //                //if (item.id == 9)
    //                //{
    //                //    risk_6 = F; block_16 = setScore_text(userPercentageScore1, 1); blck_cls_16 = setScore_class(userPercentageScore1, 1);
    //                //    satisfaction_6 = E; block_17 = setScore_text(userPercentageScore, 2); blck_cls_17 = setScore_class(userPercentageScore, 2);
    //                //    servity_tag_6 = D; block_18 = setScore_text(Convert.ToInt32(D), 3); blck_cls_18 = setScore_class(Convert.ToInt32(D), 3);

    //                //    retentionrisk_percentage1 = F; retentionrisk_score1 = setScore_text(userPercentageScore1, 1); retentionrisk_blockclass1 = setScore_class_perpage(userPercentageScore1, 1);
    //                //    retentionrisk_percentage2 = E; retentionrisk_score2 = setScore_text(userPercentageScore, 2); retentionrisk_blockclass2 = setScore_class_perpage(userPercentageScore, 2);
    //                //    retentionrisk_percentage3 = D; retentionrisk_score3 = setScore_text(Convert.ToInt32(D), 3); retentionrisk_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3);

    //                //}
    //                //if (item.id == 8)
    //                //{
    //                //    risk_7 = F; block_19 = setScore_text(userPercentageScore1, 1); blck_cls_19 = setScore_class(userPercentageScore1, 1);
    //                //    satisfaction_7 = E; block_20 = setScore_text(userPercentageScore, 2); blck_cls_20 = setScore_class(userPercentageScore, 2);
    //                //    servity_tag_7 = D; block_21 = setScore_text(Convert.ToInt32(D), 3); blck_cls_21 = setScore_class(Convert.ToInt32(D), 3);

    //                //    criminal_class1 = setScore_class_perpage(userPercentageScore1, 1);
    //                //    criminal_class2 = setScore_class_perpage(userPercentageScore, 2);
    //                //    criminal_class3 = setScore_class_perpage(Convert.ToInt32(D), 3);

    //                //}
    //                //if (item.id == 10)
    //                //{
    //                //    risk_8 = F; block_22 = setScore_text(userPercentageScore1, 1); blck_cls_22 = setScore_class(userPercentageScore1, 1);
    //                //    satisfaction_8 = E; block_23 = setScore_text(userPercentageScore, 2); blck_cls_23 = setScore_class(userPercentageScore, 2);
    //                //    servity_tag_8 = Convert.ToString(D); block_24 = setScore_text(Convert.ToInt32(D), 3); blck_cls_24 = setScore_class(Convert.ToInt32(D), 3);
    //                //}
    //            }
    //        }
    //        // E=(C/A)*100 % grand total %
    //        var userScore_grand = Convert.ToDouble(grandtotal_C) / Convert.ToDouble(grandtotal_A);
    //        int userPercentageScore_grand = (int)Math.Round((decimal)userScore_grand * 100);
    //        var grandtotal_E = userPercentageScore_grand + "%";

    //        // F=(D/B)*100 % grand total %
    //        var userScore1_grand = Convert.ToDouble(grandtotal_D) / Convert.ToDouble(grandtotal_B);
    //        int userPercentageScore1_grand = (int)Math.Round((decimal)userScore1_grand * 100);
    //        var grandtotal_F = userPercentageScore1_grand + "%";

    //        risk_final = grandtotal_F; block_risk_final = setScore_text(userPercentageScore1_grand, 1); blck_cls_risk_final = setScore_class(userPercentageScore1_grand, 4);
    //        satisfaction_final = grandtotal_E; block_satisfaction_final = setScore_text(userPercentageScore_grand, 2); blck_cls_satisfaction_final = setScore_class(userPercentageScore_grand, 5);
    //        servity_final = grandtotal_D.ToString(); block_servity_final = setScore_text(Convert.ToInt32(grandtotal_D), 3); blck_cls_servity_final = setScore_class(Convert.ToInt32(grandtotal_D), 6);
    //    }
    //    catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    //}

    protected DataTable BindDatatable(int aid)
    {
        DataTable dt = new DataTable();
        // all columns

        dt.Columns.Add("levelofrisk", typeof(string));
        dt.Columns.Add("levelofsatisfaction", typeof(Int32));
        dt.Columns.Add("severity", typeof(string));



        //to print rows
        dt.Rows.Add(objCom.GetMatrixValue("1", 2, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 2, 1, aid)), objCom.GetMatrixValue("3", 2, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 5, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 5, 1, aid)), objCom.GetMatrixValue("3", 5, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 3, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 3, 1, aid)), objCom.GetMatrixValue("3", 3, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 4, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 4, 1, aid)), objCom.GetMatrixValue("3", 4, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 6, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 6, 1, aid)), objCom.GetMatrixValue("3", 6, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 9, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 9, 1, aid)), objCom.GetMatrixValue("3", 9, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 8, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 8, 1, aid)), objCom.GetMatrixValue("3", 8, 1, aid));
        dt.Rows.Add(objCom.GetMatrixValue("1", 10, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 10, 1, aid)), objCom.GetMatrixValue("3", 10, 1, aid));
        //dt.Rows.Add(objCom.GetMatrixValue("1", 0, 1, aid), Convert.ToInt32(objCom.GetMatrixValue("2", 0, 1, aid)), objCom.GetMatrixValue("3", 0, 1, aid));

        //dt.Rows.Add(30, 23, 10);
        //dt.Rows.Add(10, 85, 1);
        //dt.Rows.Add(65, 53, 3);
        //dt.Rows.Add(6, 58, 3);
        //dt.Rows.Add(5, 56, 3);
        //dt.Rows.Add(25, 43, 60);
        //dt.Rows.Add(32, 3,70);
        //dt.Rows.Add(54, 5,80);

        return dt;
    }


    private void Bindchart(int aid)
    {

        DataTable ChartData = BindDatatable(aid);

        //storing total rows count to loop on each Record    
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];
        string[] SizePointMember = new string[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis    
            XPointMember[count] = ChartData.Rows[count]["levelofrisk"].ToString();
            //storing values for Y Axis    
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["levelofsatisfaction"]);
            SizePointMember[count] = ChartData.Rows[count]["severity"].ToString();

        }
        //binding chart control    
        Chart1.Series[1].Points.DataBindXY(XPointMember, YPointMember, SizePointMember);
        //Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 20;
        ////Chart1.ChartAreas["ChartArea1"].AxisX.IsMarginVisible = false;

        //Chart1.Series[1].XValueMember = "XPointMember";

        //Chart1.ChartAreas["ChartArea1"].AxisX.Minimum = 0;
        // Chart1.ChartAreas["ChartArea1"].AxisX.Maximum = 100;
        // Chart1.ChartAreas["ChartArea1"].AxisX.IsMarginVisible = true;

        // Chart1.ChartAreas[0].AxisX.IsMarginVisible = true;
        // Chart1.ChartAreas[0].AxisX.Minimum = 0;
        // Chart1.ChartAreas[0].AxisX.Maximum = 100;


        foreach (Series series in Chart1.Series)
        {
            for (int i = 0; i < series.Points.Count; i++)
            {
                DataPoint dp = series.Points[i];
                if (i == 0)
                {
                    dp.Color = System.Drawing.Color.LightBlue; tag1clr = "criteria-tbl-box bg-orange";
                }//series.Color;
                else if (i == 1)
                {
                    dp.Color = System.Drawing.Color.Orange; tag2clr = "criteria-tbl-box bg-orange";
                }
                else if (i == 2)
                {
                    dp.Color = System.Drawing.Color.DimGray; tag3clr = "criteria-tbl-box bg-orange";
                }
                else if (i == 3)
                {
                    dp.Color = System.Drawing.Color.Yellow; tag4clr = "criteria-tbl-box bg-grey";
                }
                else if (i == 4)
                {
                    dp.Color = System.Drawing.Color.CornflowerBlue; tag5clr = "criteria-tbl-box bg-yellow";
                }
                else if (i == 5)
                {
                    dp.Color = System.Drawing.Color.LightGreen; tag6clr = "criteria-tbl-box bg-blue";
                }
                else if (i == 6)
                {
                    dp.Color = System.Drawing.Color.BlueViolet; tag7clr = "criteria-tbl-box bg-green-l";
                }
                else if (i == 7)
                {
                    dp.Color = System.Drawing.Color.Chocolate; tag8clr = "criteria-tbl-box bg-chock";
                }

            }
            //foreach (DataPoint dp in series.Points)
            //{

            //    dp.Color = System.Drawing.Color.Red;//series.Color;
            //}
        }
        ////foreach (var lbl in Chart1.ChartAreas[0].AxisX.CustomLabels)
        ////{
        ////    int monthNumber = int.Parse(lbl.Text);
        ////    if (monthNumber >= 1 && monthNumber <= 12)
        ////        lbl.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(monthNumber);
        ////    else
        ////        lbl.Text = "";
        ////}
        ////Setting width of line    
        //Chart1.Series[0].BorderWidth = 1;
        ////setting Chart type     
        //Chart1.Series[0].ChartType = SeriesChartType.Bubble;

        ////Hide or show chart back GridLines    
        //// Chart1.ChartAreas["ChartArea1"].AxisX.MajorGrid.Enabled = false;    
        //// Chart1.ChartAreas["ChartArea1"].AxisY.MajorGrid.Enabled = false;    

        ////Enabled 3D    
        //// Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;    


    }
    private string AddContentInText2(string text)
    {
        if (text.Contains("#HomeCountry#"))
            text = text.Replace("#HomeCountry#", Convert.ToString(ViewState["homeCountry"]));
        if (text.Contains("#City#"))
            text = text.Replace("#City#", Convert.ToString(ViewState["eduCity"]));
        if (text.Contains("#Country_where_I_intend_to_study#"))
            text = text.Replace("#Country_where_I_intend_to_study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Country_I_am_applying_to_Study#"))
            text = text.Replace("#Country_I_am_applying_to_Study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Country_where_I intend_to_study#"))
            text = text.Replace("#Country_where_I intend_to_study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Country_I_am_applying_to_Study#"))
            text = text.Replace("#Country_I_am_applying_to_Study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Education_Institution#"))
            text = text.Replace("#Education_Institution#", Convert.ToString(ViewState["eduInstitution"]));
        if (text.Contains("#Nationality#"))
            text = text.Replace("#Nationality#", Convert.ToString(ViewState["nationality"]));
        if (text.Contains("#EducationalInstitution#"))
            text = text.Replace("#EducationalInstitution#", Convert.ToString(ViewState["eduInstitution"]));
        if (text.Contains("#ClickToKnowMore#"))
            text = text.Replace("#ClickToKnowMore#", "<lable id=lblClick style=\"color: DodgerBlue;\"> Click to know more </label>");
        if (text.Contains("#FirstName#"))
            text = text.Replace("#FirstName#", objCom.GetApplicantFirstName(ApplicantID));
        return text;
    }

    private int GetSection1_tag_scoring(string tag_id, int applicantID, int universityID)
    {
        int tagwiseScore_section1 = 0;
        try
        {
            var Questions_tag_Count = db.gte_preliminary_section_questionmaster.Where(x => x.question_tag == tag_id).ToList();

            var answered_tag_questionid = db.gtepreliminarysection_applicantanswers.Where(x => x.applicantId == applicantID && x.universityId == universityID).ToList();

            List<int> question_answered_ID = new List<int>();

            foreach (var tagitem in Questions_tag_Count)
            {
                int tagitemid = tagitem.gte_questionID;
                foreach (var answeredque in answered_tag_questionid)
                {
                    int answeredqueid = answeredque.gte_preliminary_section_question_id;
                    if (tagitemid == answeredqueid)
                    {
                        question_answered_ID.Add(answeredqueid);
                        break;
                    }
                }
            }
            var list = question_answered_ID;
            //check the ans are correct or not
            if (question_answered_ID.Count > 0)
            {
                foreach (var queID in question_answered_ID)
                {
                    string que_correctans = objCom.getSes1_correctans(queID);
                    string applicant_ans = objCom.getApplicant_sec1_ans(applicantID, universityID, queID);
                    if (que_correctans == applicant_ans)
                    {
                        tagwiseScore_section1 = tagwiseScore_section1 + 1;
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section1;
    }
    private int GetSection2_tag_scoring(string tag_id, int applicantID, int universityID)
    {
        int tagwiseScore_section2 = 0;
        try
        {
            var Questions_tag_Count = db.gte_preliminary_questionmaster.Where(x => x.question_tag == tag_id).ToList();

            var answered_tag_questionid = db.gte_preliminaryapplicantanswers.Where(x => x.applicantid == applicantID && x.universityId == universityID).ToList();

            List<int> question_answered_ID = new List<int>();

            foreach (var tagitem in Questions_tag_Count)
            {
                int tagitemid = tagitem.gte_preliminaryid;
                foreach (var answeredque in answered_tag_questionid)
                {
                    int answeredqueid = answeredque.gte_preliminary_question_id;
                    if (tagitemid == answeredqueid)
                    {
                        question_answered_ID.Add(answeredqueid);
                        break;
                    }
                }
            }
            var list = question_answered_ID;
            //check the ans are correct or not
            if (question_answered_ID.Count > 0)
            {
                foreach (var queID in question_answered_ID)
                {
                    string que_correctans = objCom.getSes2_correctans(queID);
                    string applicant_ans = objCom.getApplicant_sec2_ans(applicantID, universityID, queID);
                    if (que_correctans == applicant_ans)
                    {
                        tagwiseScore_section2 = tagwiseScore_section2 + 1;
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section2;
    }
    private string GetTag(int id)
    {
        string tagname = string.Empty;
        try
        {
            var master = db.question_tag_master.Where(x => x.id == id).FirstOrDefault();
            if (master != null)
                tagname = master.tagname;
            else
                tagname = string.Empty;
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagname;
    }
    private string GetScoring(int correct_marks_obtain)
    {
        string score = string.Empty;
        try
        {
            if (correct_marks_obtain == 4)
                score = "Very Good";
            else if (correct_marks_obtain == 3)
                score = "Good";
            else if (correct_marks_obtain == 2)
                score = "Moderate";
            else if (correct_marks_obtain == 1)
                score = "Low";
            else if (correct_marks_obtain == 0)
                score = "Very Low";
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return score;
    }
    private int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
            age = age - 1;

        return age;
    }

    private void SaveMatrixValue(string colid, int tagid, string percentage, string score, string block_class, int aid, int uid)
    {
        try
        {
            var mode = "new";
            gte_report_matrixValue objmapping = new gte_report_matrixValue();
            var data = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == tagid && x.colname == colid).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = aid;
            objmapping.universityid = uid;
            objmapping.tag_id = tagid;
            objmapping.colname = colid;
            objmapping.percentage = percentage;
            objmapping.score = score;
            objmapping.block_class = block_class;
            if (mode == "new")
                db.gte_report_matrixValue.Add(objmapping);
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void calculateMatrix(int aid, int uid)
    {
        try
        {

            var tag_list = db.question_tag_master.ToList();
            var grandtotal_A = tag_list.Where(x => x.id == 11).Select(x => x.gte_max_total_score).FirstOrDefault();
            var grandtotal_B = tag_list.Where(x => x.id == 11).Select(x => x.risk_max_total_score).FirstOrDefault(); ;
            var grandtotal_C = 0;
            var grandtotal_D = 0;

            foreach (var item in tag_list)
            {
                if (item.id != 1)
                {
                    var A = Convert.ToInt32(item.gte_max_total_score);
                    var B = Convert.ToInt32(item.risk_max_total_score);
                    dynamic C = 0; dynamic D = 0;
                    if (item.id == 10)
                    {
                        C = Calculate_section1_Auto_GTESCore(item.id.ToString(), aid, uid);
                        D = Calculate_section1_Auto_RISKCore(item.id.ToString(), aid, uid);

                    }
                    else
                    {
                        C = (Calculate_section2_GTE_Score(item.id.ToString(), aid, uid) + Calculate_section3_GTE_Score(item.id.ToString(), aid, uid) + Calculate_section1_Auto_GTESCore(item.id.ToString(), aid, uid)).ToString();
                        D = (Calculate_section1_Auto_RISKCore(item.id.ToString(), aid, uid) + Calculate_section3_RISK_Score(item.id.ToString(), aid, uid) + Calculate_section2_RISK_Score(item.id.ToString(), aid, uid)).ToString();
                    }

                    // E=(C/A)*100 %
                    var userScore = Convert.ToDouble(C) / Convert.ToDouble(A);
                    int userPercentageScore = (int)Math.Round((decimal)userScore * 100);
                    var E = userPercentageScore + "%";

                    // F=(D/B)*100 %
                    var userScore1 = Convert.ToDouble(D) / Convert.ToDouble(B);
                    int userPercentageScore1 = (int)Math.Round((decimal)userScore1 * 100);
                    var F = userPercentageScore1 + "%";

                    //
                    //grandtotal_A = 112;// grandtotal_A + A;
                    //grandtotal_B = 159;// grandtotal_B+ B;
                    grandtotal_C = grandtotal_C + Convert.ToInt32(C);
                    grandtotal_D = grandtotal_D + Convert.ToInt32(D);

                    if (item.id == 2)
                    {
                        risk_1 = F; block_1 = setScore_text(userPercentageScore1, 1, 0); blck_cls_1 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_1 = E; block_2 = setScore_text(userPercentageScore, 2, 0); blck_cls_2 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_1 = D; block_3 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_3 = setScore_class(Convert.ToInt32(D), 3, 0);

                        previous_percentage1 = F; previous_score1 = setScore_text(userPercentageScore1, 1, 0); previous_blockclass1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        previous_percentage2 = E; previous_score2 = setScore_text(userPercentageScore, 2, 0); previous_blockclass2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        previous_percentage3 = D; previous_score3 = setScore_text(Convert.ToInt32(D), 3, 0); previous_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);

                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_1, blck_cls_1, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_2, blck_cls_2, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_1, block_3, blck_cls_3, aid, uid);
                        }
                    }
                    if (item.id == 5)
                    {
                        risk_2 = F; block_4 = setScore_text(userPercentageScore1, 1, 0); blck_cls_4 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_2 = E; block_5 = setScore_text(userPercentageScore, 2, 0); blck_cls_5 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_2 = D; block_6 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_6 = setScore_class(Convert.ToInt32(D), 3, 0);

                        employment_percentage1 = F; employment_score1 = setScore_text(userPercentageScore1, 1, 0); employment_blockclass1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        employment_percentage2 = E; employment_score2 = setScore_text(userPercentageScore, 2, 0); employment_blockclass2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        employment_percentage3 = D; employment_score3 = setScore_text(Convert.ToInt32(D), 3, 0); employment_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);
                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_4, blck_cls_4, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_5, blck_cls_5, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_2, block_6, blck_cls_6, aid, uid);
                        }
                    }
                    if (item.id == 3)
                    {
                        risk_3 = F; block_7 = setScore_text(userPercentageScore1, 1, 0); blck_cls_7 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_3 = E; block_8 = setScore_text(userPercentageScore, 2, 0); blck_cls_8 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_3 = D; block_9 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_9 = setScore_class(Convert.ToInt32(D), 3, 0);

                        homecountry_percentage1 = F; homecountry_score1 = setScore_text(userPercentageScore1, 1, 0); homecountry_blockclass1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        homecountry_percentage2 = E; homecountry_score2 = setScore_text(userPercentageScore, 2, 0); homecountry_blockclass2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        homecountry_percentage3 = D; homecountry_score3 = setScore_text(Convert.ToInt32(D), 3, 0); homecountry_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);
                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_7, blck_cls_7, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_8, blck_cls_8, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_3, block_9, blck_cls_9, aid, uid);
                        }
                    }
                    if (item.id == 4)
                    {
                        risk_4 = F; block_10 = setScore_text(userPercentageScore1, 1, 0); blck_cls_10 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_4 = E; block_11 = setScore_text(userPercentageScore, 2, 0); blck_cls_11 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_4 = D; block_12 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_12 = setScore_class(Convert.ToInt32(D), 3, 0);

                        potentional_levelodrisk = F; potentional_score1 = setScore_text(userPercentageScore1, 1, 0); potentional_block_cls1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        potentional_satisfaction = E; potentional_score2 = setScore_text(userPercentageScore, 2, 0); potentional_block_cls2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        potentional_servity = D; potentional_score3 = setScore_text(Convert.ToInt32(D), 3, 0); potentional_block_cls3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);
                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_10, blck_cls_10, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_11, blck_cls_11, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_4, block_12, blck_cls_12, aid, uid);
                        }
                    }
                    if (item.id == 6)
                    {
                        risk_5 = F; block_13 = setScore_text(userPercentageScore1, 1, 0); blck_cls_13 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_5 = E; block_14 = setScore_text(userPercentageScore, 2, 0); blck_cls_14 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_5 = D; block_15 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_15 = setScore_class(Convert.ToInt32(D), 3, 0);

                        immihistory_levelofrisk = F; immihistory_score1 = setScore_text(userPercentageScore1, 1, 0); immihistory_blockclass1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        immihistory_satisfaction = E; immihistory_score2 = setScore_text(userPercentageScore, 2, 0); immihistory_blockclass2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        immihistory_severity = D; immihistory_score3 = setScore_text(Convert.ToInt32(D), 3, 0); immihistory_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);
                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_13, blck_cls_13, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_14, blck_cls_14, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_5, block_15, blck_cls_15, aid, uid);
                        }
                    }
                    if (item.id == 9)
                    {
                        risk_6 = F; block_16 = setScore_text(userPercentageScore1, 1, 0); blck_cls_16 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_6 = E; block_17 = setScore_text(userPercentageScore, 2, 0); blck_cls_17 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_6 = D; block_18 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_18 = setScore_class(Convert.ToInt32(D), 3, 0);

                        retentionrisk_percentage1 = F; retentionrisk_score1 = setScore_text(userPercentageScore1, 1, 0); retentionrisk_blockclass1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        retentionrisk_percentage2 = E; retentionrisk_score2 = setScore_text(userPercentageScore, 2, 0); retentionrisk_blockclass2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        retentionrisk_percentage3 = D; retentionrisk_score3 = setScore_text(Convert.ToInt32(D), 3, 0); retentionrisk_blockclass3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);
                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_16, blck_cls_16, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_17, blck_cls_17, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_6, block_18, blck_cls_18, aid, uid);
                        }

                        if ((block_16.ToUpper() == "HIGH" || block_16.ToUpper() == "VERY HIGH") && (block_18.ToUpper() == "HIGH" || block_18.ToUpper() == "VERY HIGH"))
                            retrentionrisk_decision = "be";
                        else
                            retrentionrisk_decision = "not be";
                    }
                    if (item.id == 8)
                    {
                        risk_7 = F; block_19 = setScore_text(userPercentageScore1, 1, 0); blck_cls_19 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_7 = E; block_20 = setScore_text(userPercentageScore, 2, 0); blck_cls_20 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_7 = D; block_21 = setScore_text(Convert.ToInt32(D), 3, 0); blck_cls_21 = setScore_class(Convert.ToInt32(D), 3, 0);

                        criminal_class1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        criminal_class2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        criminal_class3 = setScore_class_perpage(Convert.ToInt32(D), 3, 0);
                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_19, blck_cls_19, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_20, blck_cls_20, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_7, block_21, blck_cls_21, aid, uid);
                        }
                    }
                    if (item.id == 10)
                    {
                        risk_8 = F; block_22 = setScore_text(userPercentageScore1, 1, 0); blck_cls_22 = setScore_class(userPercentageScore1, 1, 0);
                        satisfaction_8 = E; block_23 = setScore_text(userPercentageScore, 2, 0); blck_cls_23 = setScore_class(userPercentageScore, 2, 0);
                        servity_tag_8 = Convert.ToString(D); block_24 = setScore_text(Convert.ToInt32(D), 3, 8); blck_cls_24 = setScore_class(Convert.ToInt32(D), 3, 8);

                        tag8_class1 = setScore_class_perpage(userPercentageScore1, 1, 0);
                        tag8_class2 = setScore_class_perpage(userPercentageScore, 2, 0);
                        tag8_class3 = setScore_class_perpage(Convert.ToInt32(D), 3, 8);

                        var gte_reportmatrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == item.id).ToList();
                        if (gte_reportmatrixValue.Count == 0)
                        {
                            SaveMatrixValue("1", item.id, userPercentageScore1.ToString(), block_22, blck_cls_22, aid, uid);
                            SaveMatrixValue("2", item.id, userPercentageScore.ToString(), block_23, blck_cls_23, aid, uid);
                            SaveMatrixValue("3", item.id, servity_tag_8, block_24, blck_cls_24, aid, uid);
                        }
                    }
                }
            }
            // E=(C/A)*100 % grand total %
            var userScore_grand = Convert.ToDouble(grandtotal_C) / Convert.ToDouble(grandtotal_A);
            int userPercentageScore_grand = (int)Math.Round((decimal)userScore_grand * 100);
            var grandtotal_E = userPercentageScore_grand + "%";

            // F=(D/B)*100 % grand total %
            var userScore1_grand = Convert.ToDouble(grandtotal_D) / Convert.ToDouble(grandtotal_B);
            int userPercentageScore1_grand = (int)Math.Round((decimal)userScore1_grand * 100);
            var grandtotal_F = userPercentageScore1_grand + "%";

            risk_final = grandtotal_F; block_risk_final = setScore_text(userPercentageScore1_grand, 1, 0); blck_cls_risk_final = setScore_class(userPercentageScore1_grand, 4, 0);
            satisfaction_final = grandtotal_E; block_satisfaction_final = setScore_text(userPercentageScore_grand, 2, 0); blck_cls_satisfaction_final = setScore_class(userPercentageScore_grand, 5, 0);
            servity_final = grandtotal_D.ToString(); block_servity_final = setScore_text(Convert.ToInt32(grandtotal_D), 3, 100); blck_cls_servity_final = setScore_class(Convert.ToInt32(grandtotal_D), 6, 100);

            var gte_report_matrixValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == uid && x.tag_id == 0).ToList();
            if (gte_report_matrixValue.Count == 0)
            {
                SaveMatrixValue("1", 0, userPercentageScore1_grand.ToString(), block_risk_final, blck_cls_risk_final, aid, uid);
                SaveMatrixValue("2", 0, userPercentageScore_grand.ToString(), block_satisfaction_final, blck_cls_satisfaction_final, aid, uid);
                SaveMatrixValue("3", 0, servity_final, block_servity_final, blck_cls_servity_final, aid, uid);
            }

            if (block_1.ToUpper() == "HIGH" || block_1.ToUpper() == "VERY HIGH")
                high_taglist += "Previous Study and Gaps";
            if (block_4.ToUpper() == "HIGH" || block_4.ToUpper() == "VERY HIGH")
                high_taglist += ", Value of Course";
            if (block_7.ToUpper() == "HIGH" || block_7.ToUpper() == "VERY HIGH")
                high_taglist += ", Situations in Home Country";
            if (block_10.ToUpper() == "HIGH" || block_10.ToUpper() == "VERY HIGH")
                high_taglist += ", Potential Situation in Australia";
            if (block_13.ToUpper() == "HIGH" || block_13.ToUpper() == "VERY HIGH")
                high_taglist += ", Immigration History";
            if (block_16.ToUpper() == "HIGH" || block_16.ToUpper() == "VERY HIGH")
                high_taglist += ", Conversion & Retention Risk";
            if (block_19.ToUpper() == "HIGH" || block_19.ToUpper() == "VERY HIGH")
                high_taglist += ", Character & Criminal Recort";
            if (high_taglist == null)
                tagtext.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private string setScore_class_perpage(int score, int colid, int tag_id)
    {
        string class_ = string.Empty;
        try
        {
            if (colid == 1)
            {
                if (score >= 40)
                    class_ = "us-lvl-box-inner bg-red";
                else if (30 <= score && score < 40)
                    class_ = "us-lvl-box-inner bg-orange";
                else if (20 <= score && score < 30)
                    class_ = "us-lvl-box-inner bg-yellow";
                else if (10 <= score && score < 20)
                    class_ = "us-lvl-box-inner bg-green-l";
                else if (score < 10)
                    class_ = "us-lvl-box-inner bg-green";
            }
            if (colid == 2)
            {
                if (score > 90)
                    class_ = "us-lvl-box-inner bg-green";
                else if (80 < score && score <= 90)
                    class_ = "us-lvl-box-inner bg-green-l";
                else if (70 < score && score <= 80)
                    class_ = "us-lvl-box-inner bg-yellow";
                else if (50 < score && score <= 70)
                    class_ = "us-lvl-box-inner bg-orange";
                else if (score <= 50)
                    class_ = "us-lvl-box-inner bg-red";
            }
            if (colid == 3)
            {
                if (tag_id == 8)
                {
                    if (score == 5)
                        class_ = "us-lvl-box-inner bg-red";
                    else if (3 <= score && score <= 4)
                        class_ = "us-lvl-box-inner bg-orange";
                    else if (score == 2)
                        class_ = "us-lvl-box-inner bg-yellow";
                    else if (score == 1)
                        class_ = "us-lvl-box-inner bg-green-l";
                    else if (score == 0)
                        class_ = "us-lvl-box-inner bg-green";
                }
                else
                {
                    if (score >= 10)
                        class_ = "us-lvl-box-inner bg-red";
                    else if (9 <= score && score < 10)
                        class_ = "us-lvl-box-inner bg-orange";
                    else if (6 <= score && score <= 8)
                        class_ = "us-lvl-box-inner bg-yellow";
                    else if (2 <= score && score <= 5)
                        class_ = "us-lvl-box-inner bg-green-l";
                    else if (0 <= score && score <= 1)
                        class_ = "us-lvl-box-inner bg-green";
                }
            }
            //asdasdasd
            //if (colid == 1)
            //{
            //    if (score >= 40)
            //        class_ = "us-lvl-box-inner bg-red";
            //    else if (30 <= score && score < 40)
            //        class_ = "us-lvl-box-inner bg-orange";
            //    else if (20 <= score && score < 30)
            //        class_ = "us-lvl-box-inner bg-yellow";
            //    else if (10 <= score && score < 20)
            //        class_ = "us-lvl-box-inner bg-green-l";
            //    else if (score < 10)
            //        class_ = "us-lvl-box-inner bg-green";
            //}
            //if (colid == 2)
            //{
            //    if (score > 90)
            //        class_ = "us-lvl-box-inner bg-green";
            //    else if (80 < score && score <= 90)
            //        class_ = "us-lvl-box-inner bg-green-l";
            //    else if (70 < score && score <= 80)
            //        class_ = "us-lvl-box-inner bg-yellow";
            //    else if (50 < score && score <= 70)
            //        class_ = "us-lvl-box-inner bg-orange";
            //    else if (score <= 50)
            //        class_ = "us-lvl-box-inner bg-red";
            //}
            //if (colid == 3)
            //{
            //    if (tag_id == 8)
            //    {
            //        if (score == 5)
            //            class_ = "us-lvl-box-inner bg-red";
            //        else if (3 <= score && score <= 4)
            //            class_ = "us-lvl-box-inner bg-orange";
            //        else if (score == 2)
            //            class_ = "us-lvl-box-inner bg-yellow";
            //        else if (score == 1)
            //            class_ = "us-lvl-box-inner bg-green-l";
            //        else if (score == 0)
            //            class_ = "us-lvl-box-inner bg-green";
            //    }
            //    else
            //    {
            //        if (score >= 10)
            //            class_ = "us-lvl-box-inner bg-red";
            //        else if (9 <= score && score < 10)
            //            class_ = "us-lvl-box-inner bg-orange";
            //        else if (6 <= score && score <= 8)
            //            class_ = "us-lvl-box-inner bg-yellow";
            //        else if (2 <= score && score <= 5)
            //            class_ = "us-lvl-box-inner bg-green-l";
            //        else if (0 <= score && score <= 1)
            //            class_ = "us-lvl-box-inner bg-green";
            //    }
            //}
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return class_;
    }
    private string setScore_text(int score, int colid, int tag_id)
    {
        string scoretext = string.Empty;
        try
        {
            if (colid == 1)
            {
                if (score >= 40)
                    scoretext = "VERY HIGH";
                else if (30 <= score && score < 40)
                    scoretext = "HIGH";
                else if (20 <= score && score < 30)
                    scoretext = "MODERATE";
                else if (10 <= score && score < 20)
                    scoretext = "LOW";
                else if (score < 10)
                    scoretext = "VERY LOW";
            }
            if (colid == 2)
            {
                if (score > 90)
                    scoretext = "VERY HIGH";
                else if (80 < score && score <= 90)
                    scoretext = "HIGH";
                else if (70 < score && score <= 80)
                    scoretext = "MODERATE";
                else if (50 < score && score <= 70)
                    scoretext = "LOW";
                else if (score <= 50)
                    scoretext = "VERY LOW";
            }
            if (colid == 3)
            {

                if (tag_id == 8)
                {
                    if (score == 5)
                        scoretext = "VERY HIGH";
                    else if (3 <= score && score <= 4)
                        scoretext = "HIGH";
                    else if (score == 2)
                        scoretext = "MODERATE";
                    else if (score == 1)
                        scoretext = "LOW";
                    else if (score == 0)
                        scoretext = "VERY LOW";
                }
                else if (tag_id == 100)
                {
                    if (score > 70)
                        scoretext = "VERY HIGH";
                    else if (51 <= score && score <= 70)
                        scoretext = "HIGH";
                    else if (31 <= score && score <= 50)
                        scoretext = "MODERATE";
                    else if (16 <= score && score <= 30)
                        scoretext = "LOW";
                    else if (0 <= score && score <= 15)
                        scoretext = "VERY LOW";
                }
                else
                {
                    if (score >= 10)
                        scoretext = "VERY HIGH";
                    else if (9 <= score && score < 10)
                        scoretext = "HIGH";
                    else if (6 <= score && score <= 8)
                        scoretext = "MODERATE";
                    else if (2 <= score && score <= 5)
                        scoretext = "LOW";
                    else if (0 <= score && score <= 1)
                        scoretext = "VERY LOW";
                }
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return scoretext;
    }
    private string setScore_class(int score, int colid, int tag_id)
    {
        string class_ = string.Empty;
        try
        {
            if (colid == 1)
            {
                if (score >= 40)
                    class_ = "criteria-tbl-box bg-red";
                else if (30 <= score && score < 40)
                    class_ = "criteria-tbl-box bg-orange";
                else if (20 <= score && score < 30)
                    class_ = "criteria-tbl-box bg-yellow";
                else if (10 <= score && score < 20)
                    class_ = "criteria-tbl-box bg-green-l";
                else if (score < 10)
                    class_ = "criteria-tbl-box bg-green";
            }
            if (colid == 2)
            {
                if (score > 90)
                    class_ = "criteria-tbl-box bg-green";
                else if (80 < score && score <= 90)
                    class_ = "criteria-tbl-box bg-green-l";
                else if (70 < score && score <= 80)
                    class_ = "criteria-tbl-box bg-yellow";
                else if (50 < score && score <= 70)
                    class_ = "criteria-tbl-box bg-orange";
                else if (score <= 50)
                    class_ = "criteria-tbl-box bg-red";
            }
            if (colid == 3)
            {
                if (tag_id == 8)
                {
                    if (score == 5)
                        class_ = "criteria-tbl-box bg-red";
                    else if (3 <= score && score <= 4)
                        class_ = "criteria-tbl-box bg-orange";
                    else if (score == 2)
                        class_ = "criteria-tbl-box bg-yellow";
                    else if (score == 1)
                        class_ = "criteria-tbl-box bg-green-l";
                    else if (score == 0)
                        class_ = "criteria-tbl-box bg-green";
                }
                else
                {
                    if (score >= 10)
                        class_ = "criteria-tbl-box bg-red";
                    else if (9 <= score && score < 10)
                        class_ = "criteria-tbl-box bg-orange";
                    else if (6 <= score && score <= 8)
                        class_ = "criteria-tbl-box bg-yellow";
                    else if (2 <= score && score <= 5)
                        class_ = "criteria-tbl-box bg-green-l";
                    else if (0 <= score && score <= 1)
                        class_ = "criteria-tbl-box bg-green";
                }
            }

            //for grand total class is different 
            if (colid == 4)
            {
                if (score >= 40)
                    class_ = "box-info bg-red";
                else if (30 <= score && score < 40)
                    class_ = "box-info bg-orange";
                else if (20 <= score && score < 30)
                    class_ = "box-info bg-yellow";
                else if (10 <= score && score < 20)
                    class_ = "box-info bg-green-l";
                else if (score < 10)
                    class_ = "box-info bg-green";
                //if (score > 40)
                //    class_ = "box-info bg-red";
                //else if (20 < score && score <= 40)
                //    class_ = "box-info bg-orange";
                //else if (10 < score && score <= 20)
                //    class_ = "box-info bg-yellow";
                //else if (5 < score && score <= 10)
                //    class_ = "box-info bg-green-l";
                //else if (score <= 5)
                //    class_ = "box-info bg-green";
            }
            if (colid == 5)
            {
                if (score > 90)
                    class_ = "box-info bg-green";
                else if (80 < score && score <= 90)
                    class_ = "box-info bg-green-l";
                else if (70 < score && score <= 80)
                    class_ = "box-info bg-yellow";
                else if (50 < score && score <= 70)
                    class_ = "box-info bg-orange";
                else if (score <= 50)
                    class_ = "box-info bg-red";
            }
            if (colid == 6)
            {
                if (tag_id == 100)
                {
                    if (score > 70)
                        class_ = "box-info bg-red";
                    else if (51 <= score && score <= 70)
                        class_ = "box-info bg-orange";
                    else if (31 <= score && score <= 50)
                        class_ = "box-info bg-yellow";
                    else if (16 <= score && score <= 30)
                        class_ = "box-info bg-green-l";
                    else if (0 <= score && score <= 15)
                        class_ = "box-info bg-green";
                }
                else
                {
                    if (score >= 10)
                        class_ = "box-info bg-red";
                    else if (9 <= score && score < 10)
                        class_ = "box-info bg-orange";
                    else if (6 <= score && score <= 8)
                        class_ = "box-info bg-yellow";
                    else if (2 <= score && score <= 5)
                        class_ = "box-info bg-green-l";
                    else if (0 <= score && score <= 1)
                        class_ = "box-info bg-green";
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return class_;
    }
    private int Calculate_section2_GTE_Score(string tag_id, int applicantID, int universityID)
    {
        int tagwiseScore_section2_gtescore = 0;
        try
        {
            //tag wise question list from sec 2
            var tagwise_questionList = db.gte_questions_master.Where(x => x.tag == tag_id).ToList();


            if (tagwise_questionList.Count > 0)
            {
                foreach (var tagedquestion in tagwise_questionList)
                {
                    int questionID = tagedquestion.id;
                    //for every question fetch applicant ansID
                    var answered_of_questionID = db.gte_questions_applicant_response.Where(x => x.university_id == universityID && x.applicant_id == applicantID && x.gte_question_id == questionID).FirstOrDefault();
                    //for every ansID fetch GTE score
                    var get_gteScore_forAnswerID = db.gte_answer_master.Where(x => x.id == answered_of_questionID.gte_answer_id).Select(x => x.gte_score).FirstOrDefault();
                    if (get_gteScore_forAnswerID != null)
                        tagwiseScore_section2_gtescore = tagwiseScore_section2_gtescore + get_gteScore_forAnswerID;
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section2_gtescore;
    }
    private int Calculate_section3_GTE_Score(string tag_id, int applicantID, int universityID)
    {
        int tagwiseScore_section3_gtescore = 0;
        try
        {
            //tag wise question list from sec 3
            var tagwise_questionList = db.gte_question_master_part2.Where(x => x.tag == tag_id).ToList();


            if (tagwise_questionList.Count > 0)
            {
                foreach (var tagedquestion in tagwise_questionList)
                {
                    int questionID = tagedquestion.id;
                    //for every question fetch applicant ansID
                    var answered_of_questionID = db.gte_question_part2_applicant_response.Where(x => x.question_id == questionID && x.applicant_id == applicantID && x.university_id == universityID).FirstOrDefault();
                    //for every ansID fetch GTE score of true OR False                    
                    if (answered_of_questionID != null)
                    {
                        if (answered_of_questionID.applicant_response == true)
                            tagwiseScore_section3_gtescore = tagwiseScore_section3_gtescore + tagedquestion.true_gte_score;
                        else
                            tagwiseScore_section3_gtescore = tagwiseScore_section3_gtescore + tagedquestion.false_gte_score;
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section3_gtescore;
    }
    private int? Calculate_section1_Auto_GTESCore(string tag_id, int applicantID, int universityID)
    {
        int? tagwiseScore_section1_Auto__GTEScore = 0;
        try
        {
            //tag wise question list from sec 1
            var tagwise_questionList = db.gte_section1_autogenrated_master.Where(x => x.question_tag == tag_id).ToList();
            var applicantdetails = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();
            if (tagwise_questionList.Count > 0)
            {
                var data = db.gte_section1_autogenrated_master.Where(x => x.question_tag == tag_id).FirstOrDefault();
                if (tag_id == "4")
                {
                    if (applicantdetails != null)
                    {
                        int age = CalculateAge(Convert.ToDateTime(applicantdetails.dateofbirth));
                        //auto 1
                        if (age < 18)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(1, true);
                        else
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(1, false);
                        //auto2 ?
                        if (age < 18)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(2, true);
                        else
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(2, false);
                        int MaritalStatus = Convert.ToInt32(applicantdetails.maritalstatus);

                        //auto 3 
                        if (MaritalStatus == 3)
                        {
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(3, true);
                            //auto 4
                            DateTime dt1 = Convert.ToDateTime(objCom.GetClarification_applicantResponse(applicantID, 39));//CalculateAge(Convert.ToDateTime(objCom.GetClarification_applicantResponse(ApplicantID,39)))
                            DateTime dt = Convert.ToDateTime(DateTime.UtcNow);
                            TimeSpan span = dt - dt1;
                            //int months = (span.Days % 365) / 31;
                            int year = dt.Year - dt1.Year;
                            int month = dt.Month - dt1.Month;
                            marriedyears = year + "Yeasrs" + "<br/>" + month + "Months";

                            if (year == 0 && month <= 6)
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(4, true);
                            else
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(4, false);

                            //auto5
                            var nationalityofspouse = objCom.GetClarification_applicantResponse(applicantID, 40);
                            if (nationalityofspouse == "13")
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(5, true);
                            else
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(5, false);

                            //auto 6
                            if (year == 0 && month <= 6 && nationalityofspouse == "13")
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(6, true);
                            else
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(6, false);

                            //auto9
                            if (applicantdetails.residentialcountry == applicantdetails.countryofeducationInstitution)
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(9, true);
                            else
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(9, false);
                        }
                        else
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(3, false);
                    }
                }
                if (tag_id == "5")
                {
                    //auto 18-22
                    if (applicantdetails.workexperience == 1)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(18, true);
                    else if (applicantdetails.workexperience == 2)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(19, true);
                    else if (applicantdetails.workexperience == 3)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(20, true);
                    else if (applicantdetails.workexperience == 4)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(21, true);
                    else if (applicantdetails.workexperience == 5)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(22, true);

                    //auto 23
                    if (applicantdetails.Iscurrentlyworking == 1)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(23, true);
                    //auto 24
                    if (applicantdetails.Isjoboffered == 1)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(24, true);
                }
                if (tag_id == "2")
                {

                    int levelofcourse = Convert.ToInt32(applicantdetails.levelofcourse);
                    string highestqualifiactionachieved = applicantdetails.highestqualifiactionachieved;
                    var levelodstudy_systemlevel = objCom.GetStudy_systemlevel(Convert.ToInt32(levelofcourse)) - objCom.GetStudy_systemlevel(Convert.ToInt32(highestqualifiactionachieved));
                    //auto10
                    if (levelodstudy_systemlevel <= -2)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(10, true);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(10, false);

                    //auto11
                    if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel <= 1)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(11, true);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(11, false);

                    //auto12
                    if (levelodstudy_systemlevel == 0)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(12, true);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(12, false);

                    //auto13
                    if (0 < levelodstudy_systemlevel && levelodstudy_systemlevel < 2)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(13, true);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(13, false);

                    //auto14
                    if (2 <= levelodstudy_systemlevel && levelodstudy_systemlevel < 3)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(14, true);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(14, false);

                    //auto15
                    if (levelodstudy_systemlevel >= 3)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(15, true);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(15, false);

                    //auto 16
                    if (applicantdetails.broadFieldID != 12)
                    {
                        if (applicantdetails.narrowFieldID != 68)
                        {
                            if (applicantdetails.broadFieldID != applicantdetails.broadFieldIDyouwillComplete)
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(16, true);
                            else
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(16, false);
                        }
                        else
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(16, false);
                    }
                    else
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(16, false);
                    //auto 17
                    if (applicantdetails.broadFieldID != 12)
                    {
                        if (applicantdetails.narrowFieldID != 68)
                        {
                            if (applicantdetails.narrowFieldID != applicantdetails.narrowFieldIDyouwillComplete)
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, true);
                            else
                                tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, false);
                        }
                        else
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, false);
                    }
                    else
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, false);

                    //if (applicantdetails.broadFieldID == 12 && applicantdetails.narrowFieldID == 68 && applicantdetails.broadFieldID.Value == applicantdetails.broadFieldIDyouwillComplete.Value)
                    //{
                    //   tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(16, false);
                    //}
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(16, true);
                    ////auto17
                    //if (applicantdetails.broadFieldID == 12 && applicantdetails.narrowFieldID == 68 && applicantdetails.narrowFieldID.Value == applicantdetails.narrowFieldIDyouwillComplete.Value)
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, false);
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, true);
                    //if (applicantdetails.broadFieldID != 12 && applicantdetails.narrowFieldID != 68)
                    //{
                    //    if(applicantdetails.narrowFieldID == applicantdetails.narrowFieldIDyouwillComplete)
                    //        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, false);
                    //    else
                    //        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, true);
                    //}
                    //else
                    //    tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(17, false);
                }
                if (tag_id == "10")
                {
                    var gteprogress = db.gte_progressbar.Where(x => x.applicantid == applicantID && x.universityId == universityID).FirstOrDefault();
                    if (gteprogress != null)
                    {
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(25, true);
                        var output = gteprogress.gte_perdentage_score.Substring(0, gteprogress.gte_perdentage_score.Length - 1);

                        int gtepercentage = (int)Math.Round((decimal)Convert.ToDecimal(output));

                        if (90 <= gtepercentage && gtepercentage <= 100)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(26, true);
                        if (80 <= gtepercentage && gtepercentage <= 89)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(27, true);
                        if (70 <= gtepercentage && gtepercentage <= 79)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(28, true);
                        if (60 <= gtepercentage && gtepercentage <= 69)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(29, true);
                        if (50 <= gtepercentage && gtepercentage <= 59)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(30, true);
                        if (40 <= gtepercentage && gtepercentage <= 49)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(31, true);
                        if (0 <= gtepercentage && gtepercentage <= 39)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(32, true);
                    }
                    else
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(25, false);
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section1_Auto__GTEScore;
    }


    private int Calculate_section2_RISK_Score(string tag_id, int applicantID, int universityID)
    {
        int tagwiseScore_section2_RISKscore = 0;
        try
        {
            //tag wise question list from sec 2
            var tagwise_questionList = db.gte_questions_master.Where(x => x.tag == tag_id).ToList();


            if (tagwise_questionList.Count > 0)
            {
                foreach (var tagedquestion in tagwise_questionList)
                {
                    int questionID = tagedquestion.id;
                    //for every question fetch applicant ansID
                    var answered_of_questionID = db.gte_questions_applicant_response.Where(x => x.gte_question_id == questionID && x.applicant_id == applicantID && x.university_id == universityID).FirstOrDefault();
                    //for every ansID fetch GTE score
                    var get_risk_Score_forAnswerID = db.gte_answer_master.Where(x => x.id == answered_of_questionID.gte_answer_id).Select(x => x.gte_risk_score).FirstOrDefault();
                    if (get_risk_Score_forAnswerID != null)
                        tagwiseScore_section2_RISKscore = tagwiseScore_section2_RISKscore + get_risk_Score_forAnswerID;
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section2_RISKscore;
    }
    private int Calculate_section3_RISK_Score(string tag_id, int applicantID, int universityID)
    {
        int tagwiseScore_section3_RISKscore = 0;
        try
        {
            //tag wise question list from sec 3
            var tagwise_questionList = db.gte_question_master_part2.Where(x => x.tag == tag_id).ToList();


            if (tagwise_questionList.Count > 0)
            {
                foreach (var tagedquestion in tagwise_questionList)
                {
                    int questionID = tagedquestion.id;
                    //for every question fetch applicant ansID
                    var answered_of_questionID = db.gte_question_part2_applicant_response.Where(x => x.question_id == questionID && x.applicant_id == applicantID && x.university_id == universityID).FirstOrDefault();
                    //for every ansID fetch GTE score of true OR False                    
                    if (answered_of_questionID != null)
                    {
                        if (answered_of_questionID.applicant_response == true)
                            tagwiseScore_section3_RISKscore = tagwiseScore_section3_RISKscore + tagedquestion.true_risk_score;
                        else
                            tagwiseScore_section3_RISKscore = tagwiseScore_section3_RISKscore + tagedquestion.false_risk_score;
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section3_RISKscore;
    }
    private int? Calculate_section1_Auto_RISKCore(string tag_id, int applicantID, int universityID)
    {
        int? tagwiseScore_section1_Auto__RISKScore = 0;
        try
        {
            //tag wise question list from sec 1
            var tagwise_questionList = db.gte_section1_autogenrated_master.Where(x => x.question_tag == tag_id).ToList();
            var applicantdetails = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();
            if (tagwise_questionList.Count > 0)
            {
                var data = db.gte_section1_autogenrated_master.Where(x => x.question_tag == tag_id).FirstOrDefault();
                if (tag_id == "4")
                {
                    if (applicantdetails != null)
                    {
                        int age = CalculateAge(Convert.ToDateTime(applicantdetails.dateofbirth));
                        //auto 1
                        if (age < 18)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(1, true);
                        else
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(1, false);
                        //auto2 ?
                        if (age < 18)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(2, true);
                        else
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(2, false);
                        int MaritalStatus = Convert.ToInt32(applicantdetails.maritalstatus);

                        //auto 3 
                        if (MaritalStatus == 3)
                        {
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(3, true);
                            //auto 4
                            DateTime dt1 = Convert.ToDateTime(objCom.GetClarification_applicantResponse(applicantID, 39));
                            DateTime dt = Convert.ToDateTime(DateTime.UtcNow);
                            TimeSpan span = dt - dt1;
                            int year = dt.Year - dt1.Year;
                            int month = dt.Month - dt1.Month;

                            if (year == 0 && month <= 6)
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(4, true);
                            else
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(4, false);

                            //auto5
                            var nationalityofspouse = objCom.GetClarification_applicantResponse(applicantID, 40);
                            if (nationalityofspouse == "13")
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(5, true);
                            else
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(5, false);

                            //auto 6
                            if (year == 0 && month <= 6 && nationalityofspouse == "13")
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(6, true);
                            else
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(6, false);
                            //auto9
                            if (applicantdetails.residentialcountry == applicantdetails.countryofeducationInstitution)
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(9, true);
                            else
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(9, false);
                        }
                        else
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(3, false);
                    }
                }
                if (tag_id == "5")
                {
                    //auto 18-22
                    if (applicantdetails.workexperience == 1)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(18, true);
                    else if (applicantdetails.workexperience == 2)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(19, true);
                    else if (applicantdetails.workexperience == 3)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(20, true);
                    else if (applicantdetails.workexperience == 4)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(21, true);
                    else if (applicantdetails.workexperience == 5)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(22, true);

                    //auto 23
                    if (applicantdetails.Iscurrentlyworking == 1)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(23, true);
                    //auto 24
                    if (applicantdetails.Isjoboffered == 1)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(24, true);
                }
                if (tag_id == "2")
                {
                    int levelofcourse = Convert.ToInt32(applicantdetails.levelofcourse);
                    string highestqualifiactionachieved = applicantdetails.highestqualifiactionachieved;
                    var levelodstudy_systemlevel = objCom.GetStudy_systemlevel(Convert.ToInt32(levelofcourse)) - objCom.GetStudy_systemlevel(Convert.ToInt32(highestqualifiactionachieved));
                    //auto10
                    if (levelodstudy_systemlevel <= -2)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(10, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(10, false);

                    //auto11
                    if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel <= -1)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(11, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(11, false);

                    //auto12
                    if (levelodstudy_systemlevel == 0)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(12, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(12, false);

                    //auto13
                    if (0 < levelodstudy_systemlevel && levelodstudy_systemlevel < 2)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(13, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(13, false);

                    //auto14
                    if (2 <= levelodstudy_systemlevel && levelodstudy_systemlevel < 3)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(14, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(14, false);

                    //auto15
                    if (levelodstudy_systemlevel >= 3)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(15, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(15, false);

                    //auto 16
                    if (applicantdetails.broadFieldID != 12)
                    {
                        if (applicantdetails.narrowFieldID != 68)
                        {
                            if (applicantdetails.broadFieldID != applicantdetails.broadFieldIDyouwillComplete)
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(16, true);
                            else
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(16, false);
                        }
                        else
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(16, false);
                    }
                    else
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(16, false);
                    //auto 17
                    if (applicantdetails.broadFieldID != 12)
                    {
                        if (applicantdetails.narrowFieldID != 68)
                        {
                            if (applicantdetails.narrowFieldID != applicantdetails.narrowFieldIDyouwillComplete)
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(17, true);
                            else
                                tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(17, false);
                        }
                        else
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(17, false);
                    }
                    else
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(17, false);


                    ////auto 16
                    //if (applicantdetails.broadFieldID != null && applicantdetails.broadFieldID != 12 && applicantdetails.narrowFieldID != null && applicantdetails.narrowFieldID != 68 && (applicantdetails.broadFieldID != applicantdetails.broadFieldIDyouwillComplete))
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(16, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(16, false);
                    ////auto17
                    //if (applicantdetails.broadFieldID != null && applicantdetails.broadFieldID != 12 && applicantdetails.narrowFieldID != null && applicantdetails.narrowFieldID != 68 && (applicantdetails.narrowFieldID != applicantdetails.narrowFieldIDyouwillComplete))
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(17, true);
                    //else
                    //    tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(17, false);
                }
                if (tag_id == "10")
                {
                    var gteprogress = db.gte_progressbar.Where(x => x.applicantid == applicantID && x.universityId == universityID).FirstOrDefault();
                    if (gteprogress != null)
                    {
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_GTEscore(25, true);
                        var output = gteprogress.gte_perdentage_score.Substring(0, gteprogress.gte_perdentage_score.Length - 1);

                        int gtepercentage = (int)Math.Round((decimal)Convert.ToDecimal(output));

                        if (90 <= gtepercentage && gtepercentage <= 100)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(26, true);
                        if (80 <= gtepercentage && gtepercentage <= 89)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(27, true);
                        if (70 <= gtepercentage && gtepercentage <= 79)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(28, true);
                        if (60 <= gtepercentage && gtepercentage <= 69)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(29, true);
                        if (50 <= gtepercentage && gtepercentage <= 59)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(30, true);
                        if (40 <= gtepercentage && gtepercentage <= 49)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(31, true);
                        if (0 <= gtepercentage && gtepercentage <= 39)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(32, true);
                    }
                    else
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_GTEscore(25, false);
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section1_Auto__RISKScore;
    }


    private void downloadGTEReport(int applicantID)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A3;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(applicantID);
        int uid = Utility.GetUniversityId();
        var CID = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == uid).FirstOrDefault();

        if (Is_new_applicant == true)
            if (!string.IsNullOrEmpty(CID.gtereportNO))
                htmlToPdf.GeneratePdfFromFile(webURL + "/gte_ReportN.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&CID=" + CID.gtereportNO + "&downloadPdf=1", null, filePath);
        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + "GTE_Report_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }

   
    protected void backNavLink_Click(object sender, EventArgs e)
    {
        var Personal = db.applicantdetails.Where(x => x.gtereportNO == CID).FirstOrDefault();
        int aid = Convert.ToInt32(Personal.applicantid);
        Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + aid, true);
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try {
            var Personal = db.applicantdetails.Where(x => x.gtereportNO == CID).FirstOrDefault();
            int aid = Convert.ToInt32(Personal.applicantid);
            
            int uid = Utility.GetUniversityId();

            gte_report_admin_comment objmapping = new gte_report_admin_comment();
            var data = db.gte_report_admin_comment.Where(x => x.applicant_id == aid && x.university_id == uid).FirstOrDefault();
            var mode = "new";
            if (data != null) {

                mode = "update";
                objmapping = data;
            }
            if (ddlrecommended.SelectedValue != "0")
                objmapping.recommendedwithcaution = Convert.ToInt32(ddlrecommended.SelectedValue);
            if (chk4_1.Checked == true)
                objmapping.verificationreport_4_1 = 1;
            else
                objmapping.verificationreport_4_1 = 0;

            if (chk4_2.Checked == true)
                objmapping.verificationreport_4_2 = 1;
            else
                objmapping.verificationreport_4_2 = 0;

            if (chk4_3.Checked == true)
                objmapping.verificationreport_4_3 = 1;
            else
                objmapping.verificationreport_4_3 = 0;

            objmapping.verificationreport_proctorremark = txtproctorremarks_verified.Value.Trim();
            if (chk5_1.Checked == true)
                objmapping.proctoringreport_5_1 = 1;
            else
                objmapping.proctoringreport_5_1 = 0;

            if (chk5_2.Checked == true)
                objmapping.proctoringreport_5_2 = 1;
            else
                objmapping.proctoringreport_5_2 = 0;

            if (chk5_3.Checked == true)
                objmapping.proctoringreport_5_3 = 1;
            else
                objmapping.proctoringreport_5_3 = 0;

            if (chk5_4.Checked == true)
                objmapping.proctoringreport_5_4 = 1;
            else
                objmapping.proctoringreport_5_4 = 0;

            if (chk5_5.Checked == true)
                objmapping.proctoringreport_5_5 = 1;
            else
                objmapping.proctoringreport_5_5 = 0;

            if (chk5_6.Checked == true)
                objmapping.proctoringreport_5_6 = 1;
            else
                objmapping.proctoringreport_5_6 = 0;

            objmapping.proctoringreport_proctorremark = txtproctorremarks_disqualify.Value.Trim();
            objmapping.reported_date = DateTime.UtcNow;
            objmapping.student_sop_id = 180;
            objmapping.applicant_id = aid;
            objmapping.university_id = uid;
            if (mode == "new")
                db.gte_report_admin_comment.Add(objmapping);
            db.SaveChanges();
            Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + aid, true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}