using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;
using NReco.PdfGenerator;

public partial class admin_manageapplicant : System.Web.UI.Page
{
    GTEEntities db = new GTEEntities();
    public int ApplicantID = 0, universityID = 0;
    Logger objLog = new Logger();
    string webURL = String.Empty;
    Common objCom = new Common();
    int previous_applicantid = 0, next_applicantid = 0;
    public string sopReportLink, gtereportLink, applicantdeclarationLink, feedbackURL, certificateLink, applicantdocLink, personaldetailLink, recommendedwithcaution, verificationLink , institutionapplied , manageapplicabtionLink, recommendtionText, familyname, profileURL, firstname, nationality, middlename, dateofbirth, gtereportNo, courseapplied, gender, countryofresidence, facilitingagent, passportno, packagapplied,
        RegisteredDate, assessment_date, report_date, counsellorLink,
        servity_final, satisfaction_final, risk_final, blck_cls_risk_final, blck_cls_satisfaction_final, blck_cls_servity_final, block_satisfaction_final, block_servity_final, block_risk_final;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["ID"] != null) || (Request.QueryString["ID"].ToString() != ""))
            ApplicantID = Convert.ToInt32(Request.QueryString["ID"]);
        else
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        bool? is_newApplicant = objCom.GetIS_oldOrNew_applicant(ApplicantID);
        if (is_newApplicant == false)
        {
            div2.Attributes.Add("style", "display:none;");
            div3.Attributes.Add("style", "display:none;");
        }
        ClaucluateNext_previousID();
        showContent(ApplicantID);
        if (!IsPostBack)
            setDropdown();
    }
    private void setDropdown() {
        try
        {
            List<int> applicant = new List<int>();
            var applicantdata = (from gtead in db.applicantdetails
                                 where gtead.universityid == universityID && gtead.isdeletedbyAdmin == false
                                 select new
                                 {
                                     applicantid = gtead.applicantid,
                                 }).Distinct().OrderByDescending(x => x.applicantid).ToList();

            
            ListItem lst = new ListItem("Search By AID", "0");
            ddlapplicant.DataSource = applicantdata;
            ddlapplicant.DataTextField = "applicantid";
            ddlapplicant.DataValueField = "applicantid";
            ddlapplicant.DataBind();
            ddlapplicant.Items.Insert(0, lst);

           
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void ClaucluateNext_previousID() {
        List<int> applicant = new List<int>();
        var applicantdata = (from gtead in db.applicantdetails
                             where gtead.universityid == universityID && gtead.isdeletedbyAdmin == false
                             select new
                             {
                                 applicantid = gtead.applicantid,
                             }).Distinct().OrderByDescending(x => x.applicantid).ToList();

        foreach (var item in applicantdata)
        {
            applicant.Add(Convert.ToInt32(item.applicantid));
        }
        previous_applicantid = GetPrevious<int>(applicant, ApplicantID);
        next_applicantid = GetNext<int>(applicant, ApplicantID);

        if (previous_applicantid == 0)
            divPrev.Attributes.Add("style", "display:none;");
        if (next_applicantid == 0)
            divnext.Attributes.Add("style", "display:none;");
    }
    private static T GetNext<T>(IEnumerable<T> list, T current)
    {
        try
        {
            return list.SkipWhile(x => !x.Equals(current)).Skip(1).First();
        }
        catch
        {
            return default(T);
        }
    }

    private static T GetPrevious<T>(IEnumerable<T> list, T current)
    {
        try
        {
            return list.TakeWhile(x => !x.Equals(current)).Last();
        }
        catch
        {
            return default(T);
        }
    }

    private void showContent(int aid) {
        try {
            //manageapplicabtionLink = webURL + "registered_applicantlist.aspx";
            
            var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(ApplicantID);
            var CID = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            var gteProgressData = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
           
            if (Is_new_applicant == true)
            {
                if (!string.IsNullOrEmpty(CID.gtereportNO))
                    feedbackURL = webURL + "/gte_ReportN.aspx?downloadPdf=0&feedback=1&CID=" + CID.gtereportNO + "&id="+aid;
                else
                    feedbackURL = webURL + "/gte_ReportN.aspx?downloadPdf=0&feedback=1&CID=NO" + "&id=" + aid;
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                //    "alert('Report not yet genrated.');window.location='" + webURL + "admin/manageapplicant.aspx?ID=" + aid + "';", true);
                //}

                personaldetailLink = webURL + "admin/gte_studentdetailsN.aspx?userid=" + ApplicantID + "&formid=" + 21;
                if (gteProgressData != null)
                {
                    if (!string.IsNullOrEmpty(gteProgressData.certificate_name))
                        certificateLink = webURL + "admin/gte_certificateN.aspx?CID=" + gteProgressData.certificate_name;
                    else
                        certificateLinkDiv.Attributes.Add("style", "display:none;");

                    if (gteProgressData.is_gte_declaration_completed == true)
                        applicantdeclarationLink = webURL + "/gte_declaration_download.aspx?id=" + aid + "&UniversityID=" + universityID + "&download=1";
                    else
                        decalarationDiv.Attributes.Add("style", "display:none;");

                    if (!string.IsNullOrEmpty(CID.gtereportNO))
                    {
                        gtereportLink = webURL + "gte_ReportN.aspx?id=" + ApplicantID + "&CID=" + CID.gtereportNO;
                        counsellorLink = webURL + "counsellor_report.aspx?aid=" + ApplicantID + "&downloadPdf=0&uid=" + universityID;
                    }
                    else
                    {
                        sopDiv.Attributes.Add("style", "display:none;");
                        certificateDiv.Attributes.Add("style", "display:none;");
                        DivCounsellor.Attributes.Add("style", "display:none;");
                    }
                }
                else
                {
                    sopDiv.Attributes.Add("style", "display:none;");
                    certificateDiv.Attributes.Add("style", "display:none;");                    
                    DivCounsellor.Attributes.Add("style", "display:none;");
                    decalarationDiv.Attributes.Add("style", "display:none;");
                }
                

                sopReportLink = webURL + "admin/gte_sopReport.aspx?applicantId=" + ApplicantID + "&universityId=" + universityID;   //webURL + "admin/gte_sopreport_View.aspx?applicantId=" + ApplicantID;
            }
            else
            {
                feedbackURL = webURL + "admin/gtereport.aspx?downloadPdf=0&type=Final&id=" + ApplicantID;
                personaldetailLink = webURL + "admin/gte_studentdetailsaspx.aspx?userid=" + ApplicantID + "&formid=" + 21;
                certificateLink = webURL + "gte_certificate1.aspx?downloadPdf=0&applicantId=" + ApplicantID + "&universityId=" + universityID;
                gtereportLink = webURL + "admin/gtereport.aspx?token=XS7MKjHLunMAvqzCGr&id=" + ApplicantID + "&type=Final" + "&downloadPdf=0";
                sopReportLink = webURL + "admin/sopreport.aspx?token=YKUcfdhNWwp17azByk&id=" + ApplicantID + "&type=Final&downloadPdf=1";
            }

            var ispassword = db.students.Where(x => x.studentid == ApplicantID).Select(x=>x.password).FirstOrDefault();
            if (!string.IsNullOrEmpty(ispassword))            
            {
                Label7.Visible = true;
                btnresendotpDiv.Attributes.Add("style", "display:none;");
            }

            verificationLink = webURL + "admin/verification_video.aspx?applicantId=" + ApplicantID;
            applicantdocLink =webURL + "admin/view_gteapplicantdocuments.aspx?applicantid=" + ApplicantID;
           
            var admin_response = db.gte_report_admin_comment.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID).FirstOrDefault();
            if (admin_response != null)
            {
                recommDiv.Attributes.Add("style", "display:block;");
                if (admin_response.recommendedwithcaution != null)
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
                }
            }
            else
                recommDiv.Attributes.Add("style", "display:none;");

            var Personal = db.applicantdetails.Where(x => x.applicantid == aid && x.universityid == universityID).FirstOrDefault();
            if (Personal != null)
            {
                institutionapplied = objCom.GetUniversityName(universityID);
                familyname = Personal.lastname;
                firstname = Personal.firstname;
                middlename = Personal.middlename;
                dateofbirth = Convert.ToDateTime(Personal.dateofbirth).ToString("dd-MM-yyyy");

                gtereportNo = Personal.gtereportNO;
                if (Personal.profilephoto != null)
                    profileURL = webURL + "/Docs/GTEProfileDetail/" + Personal.profilephoto;
                else
                    divProfile.Attributes.Add("style", "display:none;");
                courseapplied = objCom.GetDetailedFieldDescription(Convert.ToInt32(Personal.detailedFieldIDyouwillComplete));
                int? genderid = Personal.gender;
                if (Personal.gender != null)
                    gender = " " + db.gender_master.Where(x => x.id == genderid).Select(x => x.description).FirstOrDefault();

                if (Personal.residentialcountry != null)
                    countryofresidence = objCom.GetCountryDiscription(Convert.ToInt32(Personal.residentialcountry));

                passportno = Personal.passportno;
                if (Personal.nationality != null)
                    nationality = objCom.GetCountryDiscription(Convert.ToInt32(Personal.nationality));
                if (Personal.isstudentreferbyagent == 1)
                {
                    if (Personal.agentid != null)
                        facilitingagent = db.agentmaster.Where(x => x.agentid == Personal.agentid).Select(x => x.agentname).FirstOrDefault();
                }
                else if (Personal.isstudentreferbyagent == 0)
                    facilitingagent = "NOT SET";
                if (!string.IsNullOrEmpty(Personal.what_package))
                    packagapplied = Personal.what_package;
                else
                    packagapplied = "None";

                var date1 = db.students.Where(x => x.studentid == aid).Select(x => x.creationdate).FirstOrDefault();
                if (date1 != null)
                    RegisteredDate = Convert.ToDateTime(date1).ToString("dd/MM/yyy");

                if (Personal.Is_clarification_submitted_date != null)
                    assessment_date = Convert.ToDateTime(Personal.Is_clarification_submitted_date).ToString("dd/MM/yyyy");

                var date3 = db.gte_report_admin_comment.Where(x => x.applicant_id == aid && x.university_id == universityID).Select(x => x.reported_date).FirstOrDefault();
                if (date3 != null)
                    report_date = Convert.ToDateTime(date3).ToString("dd/MM/yyyy");

                //var MatrixFinalValue = db.gte_report_matrixValue.Where(x => x.applicantid == aid && x.universityid == universityID && x.tag_id == 0).FirstOrDefault();
                //if (MatrixFinalValue != null)
                //{
                //    risk_final = objCom.GetMatrixValue("1", 0, 1, ApplicantID); block_risk_final = objCom.GetMatrixValue("1", 0, 2, ApplicantID); blck_cls_risk_final = objCom.GetMatrixValue("1", 0, 3, ApplicantID);
                //    satisfaction_final = objCom.GetMatrixValue("2", 0, 1, ApplicantID); block_satisfaction_final = objCom.GetMatrixValue("2", 0, 2, ApplicantID); blck_cls_satisfaction_final = objCom.GetMatrixValue("2", 0, 3, ApplicantID);
                //    servity_final = objCom.GetMatrixValue("3", 0, 1, ApplicantID); block_servity_final = objCom.GetMatrixValue("3", 0, 2, ApplicantID); blck_cls_servity_final = objCom.GetMatrixValue("3", 0, 3, ApplicantID);
                //}
                //else
                //{
                //    if (Personal.Is_clarification_submitted == true)
                //        calculateMatrix(aid, universityID);
                //    else
                //    {
                //        risk_final = "-"; block_risk_final = ""; blck_cls_risk_final = "box-info bg-red";
                //        satisfaction_final = "-"; block_satisfaction_final = ""; blck_cls_satisfaction_final = "box-info bg-red";
                //        servity_final = "-"; block_servity_final = ""; blck_cls_servity_final = "box-info bg-red";
                //    }
                //}
                if (Personal.Is_clarification_submitted == true)
                    calculateMatrix(aid, universityID);
                else
                {
                    risk_final = "-"; block_risk_final = ""; blck_cls_risk_final = "box-info bg-red";
                    satisfaction_final = "-"; block_satisfaction_final = ""; blck_cls_satisfaction_final = "box-info bg-red";
                    servity_final = "-"; block_servity_final = ""; blck_cls_servity_final = "box-info bg-red";
                }
            }
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
                    //grandtotal_A = grandtotal_A + A;
                    //grandtotal_B = grandtotal_B + B;
                    grandtotal_C = grandtotal_C + Convert.ToInt32(C);
                    grandtotal_D = grandtotal_D + Convert.ToInt32(D);

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

            risk_final = grandtotal_F; block_risk_final = setScore_text(userPercentageScore1_grand, 1); blck_cls_risk_final = setScore_class(userPercentageScore1_grand, 4);
            satisfaction_final = grandtotal_E; block_satisfaction_final = setScore_text(userPercentageScore_grand, 2); blck_cls_satisfaction_final = setScore_class(userPercentageScore_grand, 5);
            servity_final = grandtotal_D.ToString(); block_servity_final = setScore_text(Convert.ToInt32(grandtotal_D), 3); blck_cls_servity_final = setScore_class(Convert.ToInt32(grandtotal_D), 6);

            
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
   
    private string setScore_text(int score, int colid)
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
            //if (colid == 1)
            //{
            //    if (score > 40)
            //        scoretext = "VERY HIGH";
            //    else if (20 < score && score <= 40)
            //        scoretext = "HIGH";
            //    else if (10 < score && score <= 20)
            //        scoretext = "MODERATE";
            //    else if (5 < score && score <= 10)
            //        scoretext = "LOW";
            //    else if (score <= 5)
            //        scoretext = "VERY LOW";
            //}
            //if (colid == 2)
            //{
            //    if (score > 90)
            //        scoretext = "VERY HIGH";
            //    else if (80 < score && score <= 90)
            //        scoretext = "HIGH";
            //    else if (70 < score && score <= 80)
            //        scoretext = "MODERATE";
            //    else if (50 < score && score <= 70)
            //        scoretext = "LOW";
            //    else if (score <= 50)
            //        scoretext = "VERY LOW";
            //}
            //if (colid == 3)
            //{
            //    if (score >= 10)
            //        scoretext = "VERY HIGH";
            //    else if (9 < score && score < 10)
            //        scoretext = "HIGH";
            //    else if (6 < score && score <= 9)
            //        scoretext = "MODERATE";
            //    else if (2 < score && score <= 6)
            //        scoretext = "LOW";
            //    else if (0 <= score && score <= 2)
            //        scoretext = "VERY LOW";
            //}

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        return scoretext;
    }
    private string setScore_class(int score, int colid)
    {
        string class_ = string.Empty;
        try
        {
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
            ////for grand total class is different 
            //if (colid == 4)
            //{
            //    if (score >= 40)
            //        class_ = "box-info bg-red";
            //    else if (30 <= score && score < 40)
            //        class_ = "box-info bg-orange";
            //    else if (20 <= score && score < 30)
            //        class_ = "box-info bg-yellow";
            //    else if (10 <= score && score < 20)
            //        class_ = "box-info bg-green-l";
            //    else if (score < 10)
            //        class_ = "box-info bg-green";


            //}
            //if (colid == 5)
            //{
            //    if (score > 90)
            //        class_ = "box-info bg-green";
            //    else if (80 < score && score <= 90)
            //        class_ = "box-info bg-green-l";
            //    else if (70 < score && score <= 80)
            //        class_ = "box-info bg-yellow";
            //    else if (50 < score && score <= 70)
            //        class_ = "box-info bg-orange";
            //    else if (score <= 50)
            //        class_ = "box-info bg-red";
            //}
            //if (colid == 6)
            //{
            //    if (score >= 10)
            //        class_ = "box-info bg-red";
            //    else if (9 < score && score < 10)
            //        class_ = "box-info bg-orange";
            //    else if (6 < score && score <= 9)
            //        class_ = "box-info bg-yellow";
            //    else if (2 < score && score <= 6)
            //        class_ = "box-info bg-green-l";
            //    else if (0 <= score && score <= 2)
            //        class_ = "box-info bg-green";
            //}
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
                            //marriedyears = year + "Yeasrs" + "<br/>" + month + "Months";

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

    private int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
            age = age - 1;

        return age;
    }
      
    private void downloadGTECertificate(int ApplicantID)
    {

        int universityID = Utility.GetUniversityId();

        if (ApplicantID == 0 || universityID == 0)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Invalid Details');window.location='" + webURL + "admin/default.aspx';", true);

        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.Default;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(ApplicantID);
        if (Is_new_applicant == true)
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_certificateN.aspx?token=XS7MKjHLunMAvqzCGr&downloadPdf=1&applicantId=" + ApplicantID + "&universityId=" + universityID, null, filePath);
        else
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_certificate1.aspx?token=XS7MKjHLunMAvqzCGr&downloadPdf=1&applicantId=" + ApplicantID + "&universityId=" + universityID, null, filePath);

        var mode = "new";
        gte_progressbar objmapping = new gte_progressbar();
        var data = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();

        if (data != null)
        {
            mode = "update";
            objmapping = data;
        }
        objmapping.certificatepath = fileName;
        if (mode == "new")
            db.gte_progressbar.Add(objmapping);
        db.SaveChanges();

        HttpContext.Current.Response.ContentType = "application/pdf";
        HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=GTE_Certificate.pdf");
        HttpContext.Current.Response.TransmitFile(filePath);

        HttpContext.Current.Response.Flush();

    }

    protected void btncertificate_Click(object sender, EventArgs e)
    {
        downloadGTECertificate(ApplicantID);
    }
    private void downloadSOPReport(int applicantID, string type)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A4;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);

        var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(applicantID);
        if (Is_new_applicant == true)
            htmlToPdf.GeneratePdfFromFile(webURL + "sop_reportN.aspx?token=YKUcfdhNWwp17azByk&applicantId=" + applicantID + "&type=" + type + "&downloadPdf=1", null, filePath);
        else
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/sopreport.aspx?token=YKUcfdhNWwp17azByk&id=" + applicantID + "&type=" + type + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + type + "_SOP_Report_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }

    protected void btnsop_Click(object sender, EventArgs e)
    {
        downloadSOPReport(ApplicantID, "Final");
    }
        
    private void downloadGTEReport(int applicantID, string type)
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
        if (Is_new_applicant == true)
        {
            var CID = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();

            if (Is_new_applicant == true)
                if (!string.IsNullOrEmpty(CID.gtereportNO))
                    htmlToPdf.GeneratePdfFromFile(webURL + "gte_ReportN.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&CID=" + CID.gtereportNO + "&downloadPdf=1", null, filePath);
        }
        else
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/gtereport.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&type=" + type + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + type + "_GTE_Report_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }

    protected void btngte_Click(object sender, EventArgs e)
    {
        downloadGTEReport(ApplicantID, "Final");
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        if (previous_applicantid != 0)
            Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + previous_applicantid, true);
        else
            divPrev.Attributes.Add("style","display:none;");
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        if (next_applicantid != 0)
            Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + next_applicantid, true);
        else
            divnext.Attributes.Add("style", "display:none;");
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/registered_applicantlist.aspx", true); 
    }

    protected void ddlapplicant_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlapplicant.SelectedValue != null)
        {
            int aid = Convert.ToInt32(ddlapplicant.SelectedValue);
            if(aid != 0)
                Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + aid, true);
        }
    }

    protected void btnresendotp_Click(object sender, EventArgs e)
    {
        try
        {
            var password = objCom.EncodePasswordToMD5(Hidpassword.Value);
            
            int adminID = Convert.ToInt32(Session["UserID"]);
            var adminData = db.adminusers.Where(x => x.adminid == adminID).FirstOrDefault();
            //var studentInfo = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            var studentInfo = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();

            if (adminData.password == password)
            {
                var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();

                //resnd otp to applicant as well as loggedin admin

                StringBuilder sb1 = new StringBuilder();
                sb1.Append("Dear " + studentInfo.name + "<br/>");
                sb1.Append("Based on your resend request, please find below the Online Time Password (OTP) details:" + "<br/>");
                sb1.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                sb1.Append("<li>" + "Applicant Name: " + studentInfo.name + "</li>");
                sb1.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                sb1.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                sb1.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                sb1.Append("Thank you" + "<br/>");
                sb1.Append("Support Team." + "<br/>");

                objCom.SendMail(studentInfo.email, sb1.ToString(), "Your OTP resend request was successful.");

                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + adminData.name + "<br/>");
                sb.Append("Based on your resend request, please find below the Online Time Password (OTP) details:" + "<br/>");
                sb.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                sb.Append("<li>" + "Applicant Name: " + studentInfo.name + "</li>");
                sb.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                sb.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                sb.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                sb.Append("Thank you" + "<br/>");
                sb.Append("Support Team." + "<br/>");
                objCom.SendMail(adminData.email, sb.ToString(), "Your OTP resend request was successful for applicant ID " + ApplicantID);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnfinalreport_Click(object sender, EventArgs e)
    {
        try {
            var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            var students = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();
            var gtereportsubmitteddate = db.gte_report_admin_comment.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID).FirstOrDefault();
            var gteProgressData = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
            var sheduleData = db.applicant_meeting_schedule.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.is_otpverified == true).FirstOrDefault();
            var proctorname = string.Empty;
            if (sheduleData != null)
                 proctorname = db.proctor_master.Where(x => x.proctorID == sheduleData.proctor_id).Select(x => x.name).FirstOrDefault();

            if (gtereportsubmitteddate != null)
            {
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_reportNotification.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

                html = html.Replace("@familyname", details.lastname);
                html = html.Replace("@studentname", details.firstname);
                html = html.Replace("@firstname", details.firstname);
                html = html.Replace("@middlename", details.middlename);
                html = html.Replace("@dob", Convert.ToDateTime(details.dateofbirth).ToString("dd/MM/yyyy"));
                html = html.Replace("@countryofresidence", objCom.GetCountryDiscription(Convert.ToInt32(details.residentialcountry)));
                html = html.Replace("@passportno", details.passportno);
                html = html.Replace("@nationality", objCom.GetCountryDiscription(Convert.ToInt32(details.nationality)));
                html = html.Replace("@institutionapplied", objCom.GetUniversityName(universityID));
                html = html.Replace("@courseapplied", "None");
                html = html.Replace("@package", details.what_package);
                html = html.Replace("@proctorname", proctorname);
                dynamic facilitingagenttxt = "None";
                if (details.isstudentreferbyagent == 1)
                {
                    if (details.agentid != null)
                        facilitingagenttxt = db.agentmaster.Where(x => x.agentid == details.agentid).Select(x => x.agentname).FirstOrDefault();
                }
                else if (details.isstudentreferbyagent == 0)
                    facilitingagenttxt = "None";

                html = html.Replace("@facilitingagent", facilitingagenttxt);
                html = html.Replace("@registrationdate", Convert.ToDateTime(students.creationdate).ToString("dd/MM/yyyy"));
                html = html.Replace("@assessmentdate", Convert.ToDateTime(details.Is_clarification_submitted_date).ToString("dd/MM/yyyy"));
                html = html.Replace("@reportdate", Convert.ToDateTime(gtereportsubmitteddate.reported_date).ToString("dd/MM/yyyy"));
                if (gtereportsubmitteddate.recommendedwithcaution == 1)
                    html = html.Replace("@finalrecommendation", "Recommended");
                else if (gtereportsubmitteddate.recommendedwithcaution == 2)
                    html = html.Replace("@finalrecommendation", "Recommended with caution");
                else if (gtereportsubmitteddate.recommendedwithcaution == 3)
                    html = html.Replace("@finalrecommendation", "Not Recommended");

                var final_maxix_value_col1 = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == 0 && x.colname == "1").FirstOrDefault();
                if (final_maxix_value_col1 != null)                {
                    var col1 = final_maxix_value_col1.score + " / " + final_maxix_value_col1.percentage + "%";
                    html = html.Replace("@levelofrisk", col1);                    
                }
                else
                    html = html.Replace("@levelofrisk", "High / score -89 ");

                var final_maxix_value_col2 = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == 0 && x.colname == "2").FirstOrDefault();
                if (final_maxix_value_col2 != null)
                {
                    var col2 = final_maxix_value_col2.score + " / " + final_maxix_value_col2.percentage + "%";
                    html = html.Replace("@levelofsatisfaction", col2);
                }
                else
                    html = html.Replace("@levelofsatisfaction", "High / score -89 ");

                var final_maxix_value_col3 = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == 0 && x.colname == "3").FirstOrDefault();
                if (final_maxix_value_col3 != null)
                {
                    var col2 = final_maxix_value_col3.score + " / " + final_maxix_value_col3.percentage + "%";
                    html = html.Replace("@severityrisk", col2);
                }
                else
                    html = html.Replace("@severityrisk", "High / score -89 ");

                var certificatURL = webURL + "admin/gte_certificateN.aspx?CID=" + gteProgressData.certificate_name;
                html = html.Replace("@certificateURL", certificatURL);

                var evalutionURL = webURL + "gte_ReportN.aspx?id=" + ApplicantID + "&CID=" + details.gtereportNO;
                html = html.Replace("@evalutionURL", evalutionURL);

                var sopURL = webURL + "admin/gte_sopReport.aspx?applicantId="+ApplicantID+"&universityId="+universityID;
                html = html.Replace("@sopURL", sopURL);

                var GTEDeclaration = webURL + "gte_declaration_download.aspx?id=" + ApplicantID + "&UniversityID=" + universityID;
                html = html.Replace("@GTEDeclaration", GTEDeclaration);

                var docUploadURL = webURL + "admin/view_gteapplicatdocuments_.aspx?applicantId=" + ApplicantID + "&UniversityID=" + universityID;
                html = html.Replace("@docUploadURL", docUploadURL);
                

                var LoginURL = webURL + "admin/login.aspx";
                html = html.Replace("@Loginurl", LoginURL);
                html = html.Replace("@supportemail", "support@gte.direct.com");
                html = html.Replace("@contactno", "+61-417-952-875"/*university.mobile*/);
                html = html.Replace("@proctorname", proctorname);
                int performance_category = Convert.ToInt32(gteProgressData.performance_category);
                html = html.Replace("@certificategrade", db.gte_certificatelevel_description.Where(x=>x.id == performance_category).Select(x=>x.grade).FirstOrDefault());
                html = html.Replace("@certificatepercentage", gteProgressData.gte_perdentage_score);
                html = html.Replace("@AID", Convert.ToString(details.applicantid));
                objCom.SendMail(university.emai_notification1, html, "GTE Direct: " + details.applicantid + " Final Report Ready for " + details.firstname + " " + details.lastname);

                objCom.SendMail(university.emai_notification2, html, "GTE Direct: " + details.applicantid + " Final Report Ready for " + details.firstname + " " + details.lastname);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The Final GTE Evalution report has been sent.')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Admin feedback not yet submitted.')", true);

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btndocreminder_Click(object sender, EventArgs e)
    {
        try {
            List<string> DocRequirement = new List<string>();

            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 183) == false)
                DocRequirement.Add(objCom.Get_gte_docName(183));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 184) == false)
                DocRequirement.Add(objCom.Get_gte_docName(184));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 185) == false)
                DocRequirement.Add(objCom.Get_gte_docName(185));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 186) == false)
                DocRequirement.Add(objCom.Get_gte_docName(186));

            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 188) == false)
                DocRequirement.Add(objCom.Get_gte_docName(188));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 189) == false)
                DocRequirement.Add(objCom.Get_gte_docName(189));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 190) == false)
                DocRequirement.Add(objCom.Get_gte_docName(190));

            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 196) == false)
                DocRequirement.Add(objCom.Get_gte_docName(196));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 197) == false)
                DocRequirement.Add(objCom.Get_gte_docName(197));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 198) == false)
                DocRequirement.Add(objCom.Get_gte_docName(198));

            var details = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            if (details != null)
            {
                if (details.Iscurrentlyworking != null && details.Isjoboffered != null)
                {
                    if (details.Iscurrentlyworking == 1)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 193) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(193));
                    }
                    if (details.Isjoboffered == 1)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 194) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(194));
                    }
                }

                if (details.maritalstatus != null && (details.maritalstatus == 3 || details.maritalstatus == 2))
                {
                    if (details.maritalstatus == 3)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 200) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(200));
                    }

                    if (details.maritalstatus == 2) {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 201) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(201));
                    }
                }
                var clarification_response = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.clarification_question_id == 41).Select(x => x.applicant_response).FirstOrDefault();
                if (clarification_response != null && clarification_response != "0")
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 202) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(202));
                }

                var section3_question16 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 16 && x.applicant_response == false).FirstOrDefault();
                if (section3_question16 != null)
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 203) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(203));
                }


                var section3_question14 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 14 && x.applicant_response == true).FirstOrDefault();
                var section3_question28 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 28 && x.applicant_response == false).FirstOrDefault();

                if (section3_question28 != null && section3_question14 != null)
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 205) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(205));
                }
                if (section3_question28 != null)
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 206) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(206));
                }
            }
            var IsGteCertificate = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).Select(x => x.is_gte_certificate_generated).FirstOrDefault();
            if (IsGteCertificate != null && IsGteCertificate == true)
            {
                if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 208) == false)
                    DocRequirement.Add(objCom.Get_gte_docName(208));
            }
            if (DocRequirement.Count > 0) {

                var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
                var sheduleData = db.applicant_meeting_schedule.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.is_otpverified == true).FirstOrDefault();
                var proctorname = string.Empty;
                if (sheduleData != null)
                    proctorname = db.proctor_master.Where(x => x.proctorID == sheduleData.proctor_id).Select(x => x.name).FirstOrDefault();

                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_supportDocReminder.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

                html = html.Replace("@studentname", objCom.GetApplicantFirstName(ApplicantID));
                html = html.Replace("@startlist", "<ol>");
                dynamic data = string.Empty;
                foreach (var item in DocRequirement)
                {
                    //listcontent
                    data += "<li>" + item + "</li><br/>";
                }
                html = html.Replace("@listcontent", data);
                html = html.Replace("@endlist", "<ol>");

                var adminurl = webURL + "admin/login.aspx";

                html = html.Replace("@Loginurl", adminurl);
                html = html.Replace("@proctorname", proctorname);
                if (university.full_service == 0)
                    html = html.Replace("team", "GTE Direct Team");
                else if (university.full_service == 2)
                    html = html.Replace("team", "The Assessment Centre Team");
                else
                    html = html.Replace("team", "The Application Centre Team");
                objCom.SendMail(details.email, html, "GTE Direct: Reminder to upload your documents");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Documents upload reminder sent.')", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btncounsellor_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "counsellor_report.aspx?aid=" + ApplicantID + "&downloadPdf=0&uid=" + universityID, true);
    }
}