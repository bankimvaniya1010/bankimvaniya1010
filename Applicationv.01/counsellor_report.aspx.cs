using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

public partial class counsellor_report : System.Web.UI.Page
{
    public string candidateno = string.Empty,
        reportdate = "Not Set", country_intent_tostudy = "Not Set", universityname = "Not Set", Date_of_evaluation = "Not Set", profileURL, Nationality,
        QRURL, tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag1_score, tag2_score, tag3_score, tag4_score, tag5_score, tag6_score, tag7_score, proctorno = "NOT SET",
      certificationdate, overallscore, GTECertificateNO, ratingimplies, StudentName, grade, profileimage, City, homcountry,
      institutionNo, facilitingagent, sponsoringclient, passportno, fullname, countryofresidence, nationality, gender, dateofbirth, middlename, firstname, familyname, Country_of_Study_Personal_Statement_Name;
    protected int ApplicantID = 0, universityID = 0;
    public string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    int downloadPdf = 0;
    int userScore = 0;
    int section1Question;
    int section2Question;
    public string CID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();

        if (Request.QueryString["aid"] != null)
            ApplicantID = Convert.ToInt32(Request.QueryString["aid"]);
        if (Request.QueryString["uid"] != null)
            universityID = Convert.ToInt32(Request.QueryString["uid"]);
        if (Request.QueryString["downloadPdf"] != null)
            downloadPdf = Convert.ToInt32(Request.QueryString["downloadPdf"]);

        if (Request.QueryString["aid"] == null || Request.QueryString["aid"].ToString() == "" || Request.QueryString["downloadPdf"] == null || Request.QueryString["downloadPdf"].ToString() == "0")
        {
            ShowContent(ApplicantID, universityID);
            btnDiv.Visible = true;
        }
        else
        {
            int.TryParse(Request.QueryString["downloadPdf"].ToString(), out downloadPdf);

            if (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr")
            {
                ShowContent(ApplicantID, universityID);
            }
        }

        
    }

    private void ShowContent(int aID, int UID)
    {
        try
        {
            var Personal = db.applicantdetails.Where(x => x.applicantid == aID && x.universityid == UID).FirstOrDefault();
            if (Personal != null)
            {
                profileimage = webURL + "Docs/GTEProfileDetail/" + Personal.profilephoto;
                candidateno = Personal.applicantid.ToString();
                StudentName = Personal.firstname;
                familyname = Personal.lastname;
                firstname = Personal.firstname;
                middlename = Personal.middlename;
                fullname = Personal.firstname + " ";
                if (!string.IsNullOrEmpty(Personal.middlename))
                    fullname += Personal.middlename + " ";
                fullname += Personal.lastname + " ";

                dateofbirth = Convert.ToDateTime(Personal.dateofbirth).ToString("dd-MMM-yyyy");
                institutionNo = universityID.ToString();
                reportdate = Convert.ToDateTime(Personal.Is_clarification_submitted_date).ToString("dd/MMM/yyyy");
                country_intent_tostudy = objCom.GetCountryDiscription(Convert.ToInt32(Personal.countryofeducationInstitution));
                universityname = objCom.GetUniversityName(Convert.ToInt32(Personal.nameofuniversityappliedfor));
                profileURL = webURL + "/Docs/GTEProfileDetail/" + Personal.profilephoto;
                Nationality = objCom.GetCountryDiscription(Convert.ToInt32(Personal.nationality));
                City = objCom.GetCityName(Convert.ToInt32(Personal.cityofeducationInstitution));
                homcountry = objCom.GetCountryDiscription(Convert.ToInt32(Personal.postalcountry));

                pg4(Personal);
                pg5(Personal);
                pg6(Personal);
                pg7(Personal);
                pg8(Personal);
                pge9(Personal);
                pg10(Personal);
                pg11(Personal);
                pg12(Personal);
                pg13(Personal);
                pg14(Personal);
                page15_16(Personal);
                page17_18(Personal);
                pg19(Personal);
                page20_21(Personal);
                pg22(Personal);
                page23(Personal);
                pg24(Personal);
                page25(Personal);
                page27(Personal);
                riskCondition(ApplicantID, universityID);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void riskCondition(int aid, int uid)
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
                    var E = userPercentageScore;

                    // F=(D/B)*100 %
                    var userScore1 = Convert.ToDouble(D) / Convert.ToDouble(B);
                    int userPercentageScore1 = (int)Math.Round((decimal)userScore1 * 100);
                    var F = userPercentageScore1;

                    //
                    //grandtotal_A = 112;// grandtotal_A + A;
                    //grandtotal_B = 159;// grandtotal_B+ B;
                    grandtotal_C = grandtotal_C + Convert.ToInt32(C);
                    grandtotal_D = grandtotal_D + Convert.ToInt32(D);

                    if (item.id == 2)
                    {
                        if (F == 0)
                            previousrisk_1.Attributes.Add("style", "display:block");
                        else
                        {
                            previousrisk_2.Attributes.Add("style", "display:block");
                            previousrisk_3.Attributes.Add("style", "display:block");
                        }
                    }
                    if (item.id == 5)
                    {
                        if (F == 0)
                            valuerisk_1.Attributes.Add("style", "display:block");
                        else
                        {
                            valuerisk_2.Attributes.Add("style", "display:block");
                            valuerisk_3.Attributes.Add("style", "display:block");
                        }
                    }
                    if (item.id == 3)
                    {
                        if (F == 0)
                            situation_1.Attributes.Add("style", "display:block");
                        else
                        {
                            situation_2.Attributes.Add("style", "display:block");
                            situation_3.Attributes.Add("style", "display:block");
                        }
                    }
                    if (item.id == 4)
                    {
                        if (F == 0)
                            potential_1.Attributes.Add("style", "display:block");
                        else
                        {
                            potential_2.Attributes.Add("style", "display:block");
                            potential_3.Attributes.Add("style", "display:block");
                        }
                    }
                    if (item.id == 6)
                    {
                        if (F == 0)
                            immigration_1.Attributes.Add("style", "display:block");
                        else
                        {
                            immigration_2.Attributes.Add("style", "display:block");
                            immigration_3.Attributes.Add("style", "display:block");
                        }
                    }
                    if (item.id == 9)
                    {
                        if (F == 0)
                            convention_1.Attributes.Add("style", "display:block");
                        else
                        {
                            convention_2.Attributes.Add("style", "display:block");
                            convention_3.Attributes.Add("style", "display:block");
                        }
                    }
                    if (item.id == 8)
                    {
                        if (F == 0)
                            criminal_1.Attributes.Add("style", "display:block");
                        else
                        {
                            criminal_2.Attributes.Add("style", "display:block");
                            criminal_3.Attributes.Add("style", "display:block");
                        }

                    }
                    if (item.id == 10)
                    {
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

            //risk_final = grandtotal_F; block_risk_final = setScore_text(userPercentageScore1_grand, 1, 0); blck_cls_risk_final = setScore_class(userPercentageScore1_grand, 4, 0);
            //satisfaction_final = grandtotal_E; block_satisfaction_final = setScore_text(userPercentageScore_grand, 2, 0); blck_cls_satisfaction_final = setScore_class(userPercentageScore_grand, 5, 0);
            //servity_final = grandtotal_D.ToString(); block_servity_final = setScore_text(Convert.ToInt32(grandtotal_D), 3, 100); blck_cls_servity_final = setScore_class(Convert.ToInt32(grandtotal_D), 6, 100);


        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void page27(applicantdetails Personal)
    {
        try
        {
            var gteprogress = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
            if (gteprogress != null)
            {
                if (gteprogress.is_gte_certificate_generated == true)
                    page27_5_1.Attributes.Add("style", "display:block;");
                else
                    page27_5_2.Attributes.Add("style", "display:block;");
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void page25(applicantdetails Personal)
    {
        try
        {
            if (objCom.GetSection3Answer(ApplicantID, 4) == false)
                page25_tab1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 6) == false)
                page25_tab2.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 9) == false)
                page25_tab2_1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 12) == false)
                page25_tab3.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 15) == false)
                page25_tab4.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 13) == 76)
                page25_tab5.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 13) == 75)
                page25_tab6.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 13) == 78)
                page25_tab7.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 14) == 79)
                page25_tab9.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 14) == 80)
                page25_tab10.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 14) == 81)
                page25_tab11.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 15) == 89)
                page25_tab11.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 15) == 86)
                page25_tab12.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 16) == 95)
                page25_tab13.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 17) == 100)
                page25_tab14.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 18) == 108)
                page25_tab15.Attributes.Add("style", "display:block;");

            if (Personal.workexperience == 2)
                page25_tab16.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 1) == 5)
                page25_tab17.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 1) == 4)
                page25_tab18.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 1) == 6)
                page25_tab19.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 10)
                page25_tab20.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 12)
                page25_tab21.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 9)
                page25_tab22.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 8)
                page25_tab23.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 11)
                page25_tab24.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 3) == 13)
                page25_tab25.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 3) == 14)
                page25_tab26.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 20)
                page25_tab26_1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 23)
                page25_tab27.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 21)
                page25_tab28.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 22)
                page25_tab29.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 5) == 25)
                page25_tab30.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 5) == 26)
                page25_tab31.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 5) == 27)
                page25_tab32.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 6) == 34)
                page25_tab33.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 6) == 35)
                page25_tab34.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 6) == 36)
                page25_tab35.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 37)
                page25_tab36.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 40)
                page25_tab37.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 38)
                page25_tab38.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 41)
                page25_tab39.Attributes.Add("style", "display:block;");
            //if (objCom.GetSection2AnswerID(ApplicantID, 7) == 36)
            //    page25_tab39_1.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 48)
                page25_tab40.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 47)
                page25_tab41.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 44)
                page25_tab42.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 46)
                page25_tab43.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 46) == true)
                page25_tab44.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 52)
                page25_tab45.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 53)
                page25_tab46.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 51)
                page25_tab47.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 50)
                page25_tab48.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 10) == 55)
                page25_tab49.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 10) == 59)
                page25_tab50.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 10) == 60)
                page25_tab51.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 11) == 65)
                page25_tab52.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 11) == 66)
                page25_tab53.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 11) == 63)
                page25_tab54.Attributes.Add("style", "display:block;");


            //54 remain
            if (objCom.GetSection2AnswerID(ApplicantID, 12) == 69)
                page25_tab55.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 12) == 71)
                page25_tab56.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 3) == false)
                page25_tab57.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 8) == false)
                page25_tab58.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 16) == false)
                page25_tab59.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 18) == false)
                page25_tab60.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 19) == false)
                page25_tab61.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 25) == false)
                page25_tab62.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 45) == false)
                page25_tab63.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 47) == false)
                page25_tab64.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 48) == false)
                page25_tab65.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 49) == false)
                page25_tab66.Attributes.Add("style", "display:block;");

            int age = CalculateAge(Convert.ToDateTime(Personal.dateofbirth));
            if (age < 18)
                page25_tab67.Attributes.Add("style", "display:block;");
            if (Personal.maritalstatus == 3)
            {
                //auto 4
                DateTime dt1 = Convert.ToDateTime(objCom.GetClarification_applicantResponse(ApplicantID, 39));
                DateTime dt = Convert.ToDateTime(DateTime.UtcNow);
                TimeSpan span = dt - dt1;
                //int months = (span.Days % 365) / 31;
                int year = dt.Year - dt1.Year;
                int month = dt.Month - dt1.Month;


                if (year == 0 && month <= 6)
                    page25_tab68.Attributes.Add("style", "display:block;");

                //auto5
                var nationalityofspouse = objCom.GetClarification_applicantResponse(ApplicantID, 40);
                if (nationalityofspouse == "13")
                    page25_tab69.Attributes.Add("style", "display:block;");

                //auto 6
                if (year == 0 && month <= 6 && nationalityofspouse == "13")
                    page25_tab70.Attributes.Add("style", "display:block;");
            }
            //auto 8
            if (Personal.maritalstatus == 3 || Personal.maritalstatus == 2 || Personal.maritalstatus == 4 || Personal.maritalstatus == 6)
                if (objCom.GetClarification_applicantResponse(ApplicantID, 41) != "1")
                    page25_tab71.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 13) == true)
                page25_tab72.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 13) == false)
                page25_tab73.Attributes.Add("style", "display:block;");


            if (objCom.GetSection3Answer(ApplicantID, 14) == true)
                page25_tab74.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 20) == true)
                page25_tab75.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 21) == false)
                page25_tab76.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 24) == true)
                page25_tab77.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 26) == false)
                page25_tab78.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 27) == false)
                page25_tab79.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 28) == true)
                page25_tab80.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 43) == false)
                page25_tab81.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 17) == false)
                page25_tab82.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 31) == false)
                page25_tab83.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 32) == false)
                page25_tab84.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 33) == false)
                page25_tab85.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 34) == false)
                page25_tab85_1.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 35) == false)
                page25_tab86.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 36) == false)
                page25_tab87.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 37) == false)
                page25_tab88.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 38) == false)
                page25_tab89.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 39) == false)
                page25_tab90.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 40) == false)
                page25_tab981.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 41) == false)
                page25_tab92.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 42) == false)
                page25_tab93.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 44) == false)
                page25_tab94.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 5) == true)
                page25_tab95.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 10) == true)
                page25_tab96.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 11) == true)
                page25_tab97.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 29) == true)
                page25_tab98.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 30) == true)
                page25_tab99.Attributes.Add("style", "display:block;");

            //auto25
            var gteprogress = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
            if (gteprogress != null)
            {
                if (gteprogress.is_gte_certificate_generated == true)
                {
                    var output = gteprogress.gte_perdentage_score.Substring(0, gteprogress.gte_perdentage_score.Length - 1);

                    int gtepercentage = (int)Math.Round((decimal)Convert.ToDecimal(output));
                    if (60 <= gtepercentage && gtepercentage <= 69)
                        page25_tab101.Attributes.Add("style", "display:block;");
                    if (50 <= gtepercentage && gtepercentage <= 59)
                        page25_tab102.Attributes.Add("style", "display:block;");
                    if (40 <= gtepercentage && gtepercentage <= 49)
                        page25_tab103.Attributes.Add("style", "display:block;");
                    if (0 <= gtepercentage && gtepercentage <= 39)
                        page25_tab104.Attributes.Add("style", "display:block;");
                }
                else
                    page25_tab100.Attributes.Add("style", "display:block;");
            }


        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg24(applicantdetails Personal) {
        try
        {
            if (objCom.GetSection3Answer(ApplicantID, 1) == true)
                page24_tab1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 7) == true)
                page24_tab2.Attributes.Add("style", "display:block;");

            var levelodstudy_systemlevel = objCom.GetStudy_systemlevel(Convert.ToInt32(Personal.levelofcourse)) - objCom.GetStudy_systemlevel(Convert.ToInt32(Personal.highestqualifiactionachieved));
            if (levelodstudy_systemlevel <= -2)
                page24_tab3.Attributes.Add("style", "display:block;");

            if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel <= -1)
                page24_tab4.Attributes.Add("style", "display:block;");

            if (levelodstudy_systemlevel == 0)
                page24_tab5.Attributes.Add("style", "display:block;");

            //auto 16
            if (Personal.broadFieldID != 12)
            {
                if (Personal.narrowFieldID != 68)
                {
                    if (Personal.broadFieldID != Personal.broadFieldIDyouwillComplete)
                        page24_tab6.Attributes.Add("style", "display:block;");
                }
            }
            //auto 17
            if (Personal.broadFieldID != 12)
            {
                if (Personal.narrowFieldID != 68)
                {
                    if (Personal.narrowFieldID != Personal.narrowFieldIDyouwillComplete)
                        page24_tab7.Attributes.Add("style", "display:block;");
                }
            }
            if (objCom.GetSection3Answer(ApplicantID, 2) == false)
                page24_tab8.Attributes.Add("style", "display:block;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void page23(applicantdetails Personal)
    {
        try
        {
            if (objCom.GetSection3Answer(ApplicantID, 11) == true)
                page23_statement_1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 29) == true)
                page23_statement_2.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 30) == true)
                page23_statement_3.Attributes.Add("style", "display:block;");
            //auto25
            var gteprogress = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
            if (gteprogress != null)
            {
                if (gteprogress.is_gte_certificate_generated == true)
                {
                    var output = gteprogress.gte_perdentage_score.Substring(0, gteprogress.gte_perdentage_score.Length - 1);

                    int gtepercentage = (int)Math.Round((decimal)Convert.ToDecimal(output));
                    if (60 <= gtepercentage && gtepercentage <= 69)
                        page23_statement_5.Attributes.Add("style", "display:block;");
                    if (50 <= gtepercentage && gtepercentage <= 59)
                        page23_statement_6.Attributes.Add("style", "display:block;");
                    if (40 <= gtepercentage && gtepercentage <= 49)
                        page23_statement_7.Attributes.Add("style", "display:block;");
                    if (0 <= gtepercentage && gtepercentage <= 39)
                        page23_statement_8.Attributes.Add("style", "display:block;");
                }
                else
                    page23_statement_4.Attributes.Add("style", "display:block;");
            }


        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void pg22(applicantdetails Personal)
    {
        try
        {
            if (objCom.GetSection3Answer(ApplicantID, 42) == false)
                page22_statement_1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 44) == false)
                page22_statement_2.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 5) == true)
                page22_statement_3.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 10) == true)
                page22_statement_4.Attributes.Add("style", "display:block;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void page20_21(applicantdetails Personal)
    {
        try
        {
            if (objCom.GetSection3Answer(ApplicantID, 31) == false)
                page20_statement_1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 32) == false)
                page20_statement_2.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 33) == false)
                page20_statement_3.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 34) == false)
                page20_statement_4.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 35) == false)
                page20_statement_5.Attributes.Add("style", "display:block;");

            //21
            List<int> IsPagetoshow_21 = new List<int>();

            if (objCom.GetSection3Answer(ApplicantID, 36) == false)
            {
                page21_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow_21.Add(1);
            }
            if (objCom.GetSection3Answer(ApplicantID, 37) == false)
            {
                page21_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow_21.Add(2);
            }
            if (objCom.GetSection3Answer(ApplicantID, 38) == false)
            {
                page21_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow_21.Add(3);
            }
            if (objCom.GetSection3Answer(ApplicantID, 39) == false)
            {
                page21_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow_21.Add(4);
            }
            if (objCom.GetSection3Answer(ApplicantID, 40) == false)
            {
                page21_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow_21.Add(5);
            }
            if (objCom.GetSection3Answer(ApplicantID, 41) == false)
            {
                page21_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow_21.Add(6);
            }
            //if(IsPagetoshow_21.Count == 0)
            //    page20.Attributes.Add("style", "display:none;");

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void pg19(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow_19 = new List<int>();

            if (objCom.GetSection3Answer(ApplicantID, 20) == true)
            {
                page19_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(1);
            }
            if (objCom.GetSection3Answer(ApplicantID, 21) == false)
            {
                page19_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(2);
            }
            if (objCom.GetSection3Answer(ApplicantID, 24) == true)
            {
                page19_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(3);
            }
            if (objCom.GetSection3Answer(ApplicantID, 26) == false)
            {
                page19_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(4);
            }
            if (objCom.GetSection3Answer(ApplicantID, 27) == false)
            {
                page19_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(5);
            }
            if (objCom.GetSection3Answer(ApplicantID, 28) == true)
            {
                page19_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(6);
            }
            if (objCom.GetSection3Answer(ApplicantID, 43) == false)
            {
                page19_statement_7.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(7);
            }
            if (objCom.GetSection3Answer(ApplicantID, 17) == false)
            {
                page19_statement_8.Attributes.Add("style", "display:block;");
                IsPagetoshow_19.Add(8);
            }
            //if(IsPagetoshow_19.Count == 0)
            //    page18.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void page17_18(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow17 = new List<int>();

            if (objCom.GetSection3Answer(ApplicantID, 45) == false)
            {
                page17_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow17.Add(1);
            }
            if (objCom.GetSection3Answer(ApplicantID, 47) == false)
            {
                page17_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow17.Add(2);
            }
            if (objCom.GetSection3Answer(ApplicantID, 48) == false)
            {
                page17_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow17.Add(3);
            }
            if (objCom.GetSection3Answer(ApplicantID, 49) == false)
            {
                page17_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow17.Add(4);
            }

            int age = CalculateAge(Convert.ToDateTime(Personal.dateofbirth));
            if (age < 18)
            {
                page17_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow17.Add(5);
            }

            if (Personal.maritalstatus == 3)
            {
                //auto 4
                DateTime dt1 = Convert.ToDateTime(objCom.GetClarification_applicantResponse(ApplicantID, 39));
                DateTime dt = Convert.ToDateTime(DateTime.UtcNow);
                TimeSpan span = dt - dt1;
                //int months = (span.Days % 365) / 31;
                int year = dt.Year - dt1.Year;
                int month = dt.Month - dt1.Month;


                if (year == 0 && month <= 6)
                {
                    page17_statement_6.Attributes.Add("style", "display:block;");
                    IsPagetoshow17.Add(6);
                }

                //auto5
                var nationalityofspouse = objCom.GetClarification_applicantResponse(ApplicantID, 40);
                if (nationalityofspouse == "13")
                {
                    page17_statement_7.Attributes.Add("style", "display:block;");
                    IsPagetoshow17.Add(7);
                }

                //auto 6
                if (year == 0 && month <= 6 && nationalityofspouse == "13")
                    page18_statement_1.Attributes.Add("style", "display:block;");
            }
            //if(IsPagetoshow17.Count ==0)
            //    page16.Attributes.Add("style", "display:none;");

            //auto 8
            if (Personal.maritalstatus == 3 || Personal.maritalstatus == 2 || Personal.maritalstatus == 4 || Personal.maritalstatus == 6)
                if (objCom.GetClarification_applicantResponse(ApplicantID, 41) != "1")
                    page18_statement_2.Attributes.Add("style", "display:block;");

            if (objCom.GetSection3Answer(ApplicantID, 13) == true)
                page18_statement_3.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 13) == false)
                page18_statement_4.Attributes.Add("style", "display:block;");
            if (objCom.GetSection3Answer(ApplicantID, 14) == true)
                page18_statement_5.Attributes.Add("style", "display:block;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void page15_16(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow15 = new List<int>();
            if (objCom.GetSection3Answer(ApplicantID, 3) == false)
            {
                page15_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow15.Add(1);
            }

            if (objCom.GetSection3Answer(ApplicantID, 8) == false)
            {
                page15_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow15.Add(2);
            }

            if (objCom.GetSection3Answer(ApplicantID, 16) == false)
            {
                page15_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow15.Add(3);
            }

            if (objCom.GetSection3Answer(ApplicantID, 18) == false)
            {
                page15_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow15.Add(4);
            }

            if (objCom.GetSection3Answer(ApplicantID, 19) == false)
            {
                page15_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow15.Add(5);
            }
        
            List<int> IsPagetoshow16 = new List<int>();

            if (objCom.GetSection3Answer(ApplicantID, 25) == false)
            {
                page16_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow16.Add(1);
            }
            //if(IsPagetoshow16.Count == 0 && IsPagetoshow15.Count == 0)
            //    page14.Attributes.Add("style", "display:none;");

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void pg14(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow = new List<int>();
            if (objCom.GetSection2AnswerID(ApplicantID, 10) == 59)
            {
                page14_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(1);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 10) == 60)
            {
                page14_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(2);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 11) == 65)
            {
                page14_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(3);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 11) == 66)
            {
                page14_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(4);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 11) == 63)
            {
                page14_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(5);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 12) == 69)
            {
                page14_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(6);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 12) == 71)
            {
                page14_statement_7.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(7);
            }
            //if (IsPagetoshow.Count == 0)
            //    page13.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg13(applicantdetails Personal)
    {
        try
        {
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 52)
                page13_statement_1.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 53)
                page13_statement_2.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 50)
                page13_statement_3.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 9) == 51)
                page13_statement_4.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 10) == 55)
                page13_statement_5.Attributes.Add("style", "display:block;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg12(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow_12 = new List<int>();
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 48)
            {
                page12_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow_12.Add(1);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 47)
            {
                page12_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow_12.Add(2);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 44)
            {
                page12_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow_12.Add(3);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 8) == 46)
            {
                page12_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow_12.Add(4);
            }

            if (objCom.GetSection3Answer(ApplicantID, 46) == true)
            {
                page12_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow_12.Add(5);
            }
            //if (IsPagetoshow_12.Count == 0)
            //    page12.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg11(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow11 = new List<int>();

            if (objCom.GetSection2AnswerID(ApplicantID, 6) == 35)
            {
                page11_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(1);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 6) == 36)
            {
                page11_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(2);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 37)
            {
                page11_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(3);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 40)
            {
                page11_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(4);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 38)
            {
                page11_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(5);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 41)
            {
                page11_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(6);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 7) == 42)
            {
                page11_statement_7.Attributes.Add("style", "display:block;");
                IsPagetoshow11.Add(7);
            }
            
            //if(IsPagetoshow11.Count == 0)
            //    page10.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg10(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow_10 = new List<int>();

            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 23)
            {
                page10_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(1);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 21) { 
                page10_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(2);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 22)
            {
                page10_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(3);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 5) == 25)
            {
                page10_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(4);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 5) == 26)
            {
                page10_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(5);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 5) == 27)
            {
                page10_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(6);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 6) == 34)
            {
                page10_statement_7.Attributes.Add("style", "display:block;");
                IsPagetoshow_10.Add(7);
            }
            //if(IsPagetoshow_10.Count == 0)
            //    page9.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pge9(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow_9 = new List<int>();

            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 10)
            {
                page9_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(1);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 12)
            {
                page9_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(2);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 9)
            {
                page9_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(3);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 8)
            {
                page9_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(4);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 2) == 11)
            {
                page9_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(5);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 3) == 13)
            {
                page9_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(6);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 3) == 14)
            {
                page9_statement_7.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(7);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 4) == 20)
            {
                page9_statement_8.Attributes.Add("style", "display:block;");
                IsPagetoshow_9.Add(8);
            }
            //if (IsPagetoshow_9.Count == 0)
            //    page9.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg8(applicantdetails Personal)
    {
        try
        {
            if (Personal.workexperience == 2)
                page8_statement_1.Attributes.Add("style", "display:block;");

            if (objCom.GetSection2AnswerID(ApplicantID, 1) == 5)
                page8_statement_2.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 1) == 4)
                page8_statement_3.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 1) == 6)
                page8_statement_4.Attributes.Add("style", "display:block;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg7(applicantdetails Personal)
    {
        try
        {
            List<int> IsPagetoshow = new List<int>();

            if (objCom.GetSection2AnswerID(ApplicantID, 14) == 79)
            {
                page7_statement_1.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(1);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 14) == 80)
            {
                page7_statement_2.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(2);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 14) == 81)
            {
                page7_statement_3.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(3);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 15) == 89)
            {
                page7_statement_4.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(4);
            }
            if (objCom.GetSection2AnswerID(ApplicantID, 15) == 86)
            {
                page7_statement_5.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(5);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 16) == 95)
            {
                page7_statement_6.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(6);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 17) == 100)
            {
                page7_statement_7.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(7);
            }

            if (objCom.GetSection2AnswerID(ApplicantID, 18) == 108)
            {
                page7_statement_8.Attributes.Add("style", "display:block;");
                IsPagetoshow.Add(8);
            }
            //if (IsPagetoshow.Count == 0)
            //    page7.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void pg6(applicantdetails Personal)
    {
        try
        {
            if (objCom.GetSection3Answer(ApplicantID, 9) == false)
                page6_statement_1.Attributes.Add("style", "display:block;");
            else
                page6_statement_1.Attributes.Add("style", "display:none;");

            if (objCom.GetSection3Answer(ApplicantID, 12) == false)
                page6_statement_2.Attributes.Add("style", "display:block;");
            else
                page6_statement_2.Attributes.Add("style", "display:none;");

            if (objCom.GetSection3Answer(ApplicantID, 15) == false)
                page6_statement_3.Attributes.Add("style", "display:block;");
            else
                page6_statement_3.Attributes.Add("style", "display:none;");


            if (objCom.GetSection2AnswerID(ApplicantID, 13) == 76)
                page6_statement_4.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 13) == 75)
                pag6_5.Attributes.Add("style", "display:block;");
            if (objCom.GetSection2AnswerID(ApplicantID, 13) == 78)
                page6_statement_6.Attributes.Add("style", "display:block;");

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void pg5(applicantdetails Personal)
    {
        try
        {
            List<int> Islisttoshow = new List<int>();

            if (objCom.GetSection3Answer(ApplicantID, 7) == true)
            {
                page5_statement_1.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(1);
            }
            else
                page5_statement_1.Attributes.Add("style", "display:none;");

            var levelodstudy_systemlevel = objCom.GetStudy_systemlevel(Convert.ToInt32(Personal.levelofcourse)) - objCom.GetStudy_systemlevel(Convert.ToInt32(Personal.highestqualifiactionachieved));
            if (levelodstudy_systemlevel <= -2)
            {
                page5_statement_2.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(2);
            }
            else
                page5_statement_2.Attributes.Add("style", "display:none;");

            if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel <= -1)
            {
                page5_statement_3.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(3);
            }
            else
                page5_statement_3.Attributes.Add("style", "display:none;");

            if (levelodstudy_systemlevel == 0) { 
                page5_statement_4.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(4);
            }
            else
                page5_statement_4.Attributes.Add("style", "display:none;");
            if (Personal.broadFieldID != 12)
            {
                if (Personal.narrowFieldID != 68)
                {
                    if (Personal.broadFieldID != Personal.broadFieldIDyouwillComplete)
                    {
                        page5_statement_5.Attributes.Add("style", "display:block;");
                        Islisttoshow.Add(5);
                    }
                    else
                        page5_statement_5.Attributes.Add("style", "display:none;");
                }
                else
                    page5_statement_5.Attributes.Add("style", "display:none;");
            }
            else
                page5_statement_5.Attributes.Add("style", "display:none;");


            if (Personal.broadFieldID != 12)
            {
                if (Personal.narrowFieldID != 68)
                {
                    if (Personal.narrowFieldID != Personal.narrowFieldIDyouwillComplete)
                    {
                        page5_statement_6.Attributes.Add("style", "display:block;");
                        Islisttoshow.Add(6);
                    }
                    else
                        page5_statement_6.Attributes.Add("style", "display:none;");
                }
                else
                    page5_statement_6.Attributes.Add("style", "display:none;");
            }
            else
                page5_statement_6.Attributes.Add("style", "display:none;");

            if (objCom.GetSection3Answer(ApplicantID, 2) == false)
            {
                page5_statement_7.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(7);
            }
            else
                page5_statement_7.Attributes.Add("style", "display:none;");

            if (objCom.GetSection3Answer(ApplicantID, 4) == false)
            {
                page5_statement_8.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(8);
            }
            else
                page5_statement_8.Attributes.Add("style", "display:none;");

            if (objCom.GetSection3Answer(ApplicantID, 6) == false)
            {
                page5_statement_9.Attributes.Add("style", "display:block;");
                Islisttoshow.Add(9);
            }
            else
                page5_statement_9.Attributes.Add("style", "display:none;");

            //if(Islisttoshow.Count == 0)
            //    page5.Attributes.Add("style", "display:none;");

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }
    private void pg4(applicantdetails Personal)
    {

        try
        {
            //int aid = Convert.ToInt32(Personal.applicantid);
            if (objCom.GetSection3Answer(ApplicantID, 1) == true)
                previous_page4e.Attributes.Add("style", "display:block;");
            else
                previous_page4e.Attributes.Add("style", "display:none;");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }
    private int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
            age = age - 1;

        return age;
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

                        }
                        else
                        {
                            //auto 3 false
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(3, false);
                            //auto 4 false
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(4, false);
                            //auto 5 false
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(5, false);
                            //auto 6 false
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(6, false);
                            //auto 7 false
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(7, false);
                            //auto 8 false
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(8, false);
                        }

                        //auto9
                        if (applicantdetails.residentialcountry == applicantdetails.countryofeducationInstitution)
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(9, true);
                        else
                            tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(9, false);
                    }
                }
                if (tag_id == "5")
                {
                    //auto 18-22
                    if (applicantdetails.workexperience == 1)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(18, true);
                    if (applicantdetails.workexperience == 2)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(19, true);
                    if (applicantdetails.workexperience == 3)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(20, true);
                    if (applicantdetails.workexperience == 4)
                        tagwiseScore_section1_Auto__GTEScore = tagwiseScore_section1_Auto__GTEScore + objCom.gte_sec1_auto_GTEscore(21, true);
                    if (applicantdetails.workexperience == 5)
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
                    if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel <= -1)
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
                        if (gteprogress.is_gte_certificate_generated == true)
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

                        }
                        else
                        {
                            //auto 3 false
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(3, false);
                            //auto 4 false
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(4, false);
                            //auto 5 false
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(5, false);
                            //auto 6 false
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(6, false);
                            //auto 7 false
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(7, false);
                            //auto 8 false
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(8, false);
                        }
                        //auto9
                        if (applicantdetails.residentialcountry == applicantdetails.countryofeducationInstitution)
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(9, true);
                        else
                            tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(9, false);
                    }
                }
                if (tag_id == "5")
                {
                    //auto 18-22
                    if (applicantdetails.workexperience == 1)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(18, true);
                    if (applicantdetails.workexperience == 2)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(19, true);
                    if (applicantdetails.workexperience == 3)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(20, true);
                    if (applicantdetails.workexperience == 4)
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_RISKscore(21, true);
                    if (applicantdetails.workexperience == 5)
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
                        if (gteprogress.is_gte_certificate_generated == true)
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
                    else
                        tagwiseScore_section1_Auto__RISKScore = tagwiseScore_section1_Auto__RISKScore + objCom.gte_sec1_auto_GTEscore(25, false);
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return tagwiseScore_section1_Auto__RISKScore;
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {     
        downloadGTEReport(ApplicantID);
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
       
        htmlToPdf.GeneratePdfFromFile(webURL + "/counsellor_report.aspx?aid=" + applicantID + "&token=XS7MKjHLunMAvqzCGr&downloadPdf=1&uid=" + universityID, null, filePath);
        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + "Counsellor_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }
}