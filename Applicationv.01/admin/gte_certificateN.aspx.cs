using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
public partial class admin_gte_certificateN : System.Web.UI.Page
{
    public string  candidateno = string.Empty, institutionLogo= string.Empty, QRURL, tag1, tag2, tag3, tag4, tag5, tag6, tag7, tag1_score, tag2_score, tag3_score, tag4_score, tag5_score, tag6_score, tag7_score, proctorno = "NOT SET",
         certificationdate, overallscore, GTECertificateNO, ratingimplies, StudentName, grade, profileimage,
         institutionNo, facilitingagent, sponsoringclient, passportno, countryofresidence, nationality, gender, dateofbirth, middlename, firstname, familyname;
    protected int ApplicantID = 0, universityID = 0 ,aid=0;
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

        if (Request.QueryString["downloadPdf"] != null)
            downloadPdf = Convert.ToInt32(Request.QueryString["downloadPdf"]);

        section1Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection1Question"]);
        section2Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection2Question"]);
        if (!string.IsNullOrEmpty(Request.QueryString["CID"]))
            CID = Request.QueryString["CID"];
        else
            CID = "0";
        showContent(CID);
    }

    private void showContent(string CID)
    {
        try
        {
            if (CID == "0")
            {
                if (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr")
                {
                    //backNavLink.Visible = false;
                    btnDownload.Visible = false;
                    btnDiv.Style.Add("display", "none");
                    if (Request.QueryString["applicantId"] != null)
                        aid = Convert.ToInt32(Request.QueryString["applicantId"]);

                    int universityId = 0;
                    universityId = Utility.GetUniversityId();
                    setStudentPersonalDetails(aid, universityId);
                }
                else if (downloadPdf == 0)
                {
                    btnDiv.Style.Remove("display");
                    if (Utility.CheckAdminLogin())
                    {
                        universityID = Utility.GetUniversityId();
                        ApplicantID = Convert.ToInt32(Session["UserID"].ToString());
                        aid = ApplicantID;
                        if (!IsPostBack)
                        {
                            var studentGteProgress = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
                            if (studentGteProgress != null)
                            {
                                if (studentGteProgress.is_gte_preliminarysection2_completed != null)
                                {
                                    if (studentGteProgress.is_gte_certificate_generated.HasValue && studentGteProgress.is_gte_certificate_generated.Value)
                                    {
                                        setStudentPersonalDetails(ApplicantID, universityID);
                                    }
                                    else
                                    {
                                        var preliminaryQuestionList = db.gte_preliminary_questionmaster.AsNoTracking().ToList();
                                        calculateStudentScore(preliminaryQuestionList);

                                        int totalQuestion = section1Question + section2Question;

                                        int userPercentageScore = (int)Math.Ceiling((decimal)userScore / totalQuestion * 100);
                                        if (90 <= userPercentageScore && userPercentageScore <= 100)
                                            generateParticipationCertificate("1");//generateParticipationCertificate(GetGrade(Convert.ToInt32(1)));
                                        else if (80 <= userPercentageScore && userPercentageScore <= 89)
                                            generateParticipationCertificate("2");
                                        else if (70 <= userPercentageScore && userPercentageScore <= 79)
                                            generateParticipationCertificate("3");
                                        else if (60 <= userPercentageScore && userPercentageScore <= 69)
                                            generateParticipationCertificate("4");
                                        else if (50 <= userPercentageScore && userPercentageScore <= 59)
                                            generateParticipationCertificate("5");
                                        else if (40 <= userPercentageScore && userPercentageScore <= 49)
                                            generateParticipationCertificate("6");
                                        else if (0 <= userPercentageScore && userPercentageScore <= 39)
                                            generateParticipationCertificate("7");

                                        setStudentPersonalDetails(ApplicantID, universityID);
                                    }
                                }
                                else
                                    showErrorMessage();
                            }
                            else
                                showErrorMessage();
                        }
                    }
                    else
                        Response.Redirect(webURL + "admin/default.aspx", true);
                }
            }
            else
            {
                btnDiv.Style.Remove("display");
                btnDownload.Visible = true;
                var gteprogress = db.gte_progressbar.Where(x => x.certificate_name == CID).FirstOrDefault();
                if (gteprogress != null)
                {
                    aid = gteprogress.applicantid;
                    setStudentPersonalDetails(gteprogress.applicantid, gteprogress.universityId);
                }
                else
                {
                    lblDiv.Attributes.Add("style", "display:block");
                    DivCertificate.Attributes.Add("style", "display:none");
                }

            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void generateParticipationCertificate(string performanceCategory)
    {
        try
        {
            var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
            if (gteProgressBar != null)
            {
                string certificateNumber = generateCertificateNumber();
                objLog.WriteLog("Certificate Number: " + certificateNumber + " generated for applicant ID: " + ApplicantID);
                gteProgressBar.is_gte_certificate_generated = true;
                gteProgressBar.certificate_creation_date = DateTime.Today;
                gteProgressBar.performance_category = performanceCategory;
                gteProgressBar.certificate_name = certificateNumber;
                db.SaveChanges();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private string generateCertificateNumber()
    {
        string certificateNumber = "";
        while (true)
        {
            certificateNumber = RandomAplhaNumericString();
            if (!db.gte_progressbar.Any(x => x.certificate_name == certificateNumber))
                return certificateNumber;
        }
    }
    public static string RandomAplhaNumericString() // Generated Format "ABCD9999" change format to GTE-COU-ABC12345
    {
        const string chars = "ABC";
        Random random = new Random();
        int randomNumber = random.Next(0, 99999);
        string aplhaNumericNumber = "";
        string randomString = new string(Enumerable.Repeat(chars, 3).Select(s => s[random.Next(s.Length)]).ToArray());
        if (randomNumber < 10000)
            aplhaNumericNumber = randomString + "0" + randomNumber.ToString();
        else
            aplhaNumericNumber = randomString + randomNumber.ToString();

        return aplhaNumericNumber;
    }

    private void calculateStudentScore(List<gte_preliminary_questionmaster> preliminaryQuestionList)
    {
        var preliminaryAnswerList = db.gte_preliminaryapplicantanswers
                                      .Where(x => x.applicantid == ApplicantID && x.universityId == universityID)
                                      .Select(x => new { x.gte_preliminary_question_id, x.answer }).ToList();

        foreach (var answer in preliminaryAnswerList)
        {
            gte_preliminary_questionmaster test = preliminaryQuestionList.Where(x => x.gte_preliminaryid == answer.gte_preliminary_question_id).FirstOrDefault();
            if (answer.answer == test.correctanswer)
                userScore++;
        }

        //Logic to calculate answered section 1 questions
        var preliminaryAnswerListSection1 = db.gtepreliminarysection_applicantanswers
                                              .Where(x => x.applicantId == ApplicantID && x.universityId == universityID)
                                              .Select(x => new { x.gte_preliminary_section_question_id, x.answer }).ToList();

        var preliminaryQuestionListSection1 = db.gte_preliminary_section_questionmaster.AsNoTracking().ToList();

        foreach (var answer in preliminaryAnswerListSection1)
        {
            gte_preliminary_section_questionmaster test = preliminaryQuestionListSection1.Where(x => x.gte_questionID == answer.gte_preliminary_section_question_id).FirstOrDefault();
            if (answer.answer == test.correctanswer)
                userScore++;
        }
    }


    private void showErrorMessage()
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                                "alert('GTE Certificate not generated.Please complete certification.');window.location='" + webURL + "admin/default.aspx';", true);
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try
        {            
            int universityID = Utility.GetUniversityId();

            if (!(aid == 0 || universityID == 0))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                         "alert('Invalid Student Details');window.location='" + webURL + "admin/default.aspx';", true);

            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.Default;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/gte_certificateN.aspx?token=XS7MKjHLunMAvqzCGr&downloadPdf=1&applicantId=" + aid + "&universityId=" + universityID, null, filePath);


            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=GTE_Certificate.pdf");
            HttpContext.Current.Response.TransmitFile(filePath);

            HttpContext.Current.Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void setStudentPersonalDetails(int applicantId, int universityID)
    {
        try
        {
            //objLog.WriteLog("Applicant ID: " + applicantId + " University Id: " + universityID);

            var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
            institutionLogo = webURL + "/Docs/" + university.universityid + "/" + university.logo;

            var Personal = db.applicantdetails.Where(x => x.applicantid == applicantId && x.universityid == universityID).FirstOrDefault();
            if (Personal != null)
            {
                profileimage = webURL + "Docs/GTEProfileDetail/" + Personal.profilephoto;
                candidateno = Personal.applicantid.ToString();
                StudentName = Personal.firstname;
                familyname = Personal.lastname;
                firstname = Personal.firstname;
                middlename = Personal.middlename;
                dateofbirth = Convert.ToDateTime(Personal.dateofbirth).ToString("dd-MMM-yyyy");
                institutionNo = universityID.ToString();
                int? genderid = Personal.gender;
                if (Personal.gender != null)
                    gender = " " + db.gender_master.Where(x => x.id == genderid).Select(x => x.description).FirstOrDefault();

                if (Personal.nationality != null)
                    nationality = objCom.GetCountryDiscription(Convert.ToInt32(Personal.nationality));
                if (Personal.issameaspostal != null && Personal.issameaspostal == 1)
                    countryofresidence = objCom.GetCountryDiscription(Convert.ToInt32(Personal.postalcountry));
                else
                    countryofresidence = objCom.GetCountryDiscription(Convert.ToInt32(Personal.residentialcountry));
                passportno = Personal.passportno;
                sponsoringclient = objCom.GetUniversityName(universityID);
                if (Personal.isstudentreferbyagent == 1)
                {
                    if (Personal.agentid != null)
                        facilitingagent = db.agentmaster.Where(x => x.agentid == Personal.agentid).Select(x => x.agentname).FirstOrDefault();
                }
                else
                    facilitingagent = "None";
            }
            var applicant_gte_progress = db.gte_progressbar.Where(x => x.applicantid == applicantId && x.universityId == universityID).FirstOrDefault();
            if (applicant_gte_progress != null)
            {
                certificationdate = Convert.ToDateTime(applicant_gte_progress.certificate_creation_date).ToString("dd-MMM-yyyy");
                string[] inputs = applicant_gte_progress.gte_perdentage_score.Split('.');
                overallscore = inputs[0];
                //overallscore = applicant_gte_progress.gte_perdentage_score;
                GTECertificateNO = applicant_gte_progress.certificate_name;
                if (applicant_gte_progress.performance_category != null)
                {
                    int gradeid = Convert.ToInt32(applicant_gte_progress.performance_category);
                    ratingimplies = db.gte_certificatelevel_description.Where(x => x.id == gradeid).Select(x => x.description).FirstOrDefault();
                    grade = db.gte_certificatelevel_description.Where(x => x.id == gradeid).Select(x => x.grade).FirstOrDefault();
                }
                CID = applicant_gte_progress.certificate_name;
                QRURL = webURL + "admin/gte_certificateN.aspx?CID=" + applicant_gte_progress.certificate_name;
            }
            proctorno = db.applicant_meeting_schedule.Where(x => x.applicant_id == applicantId && x.university_id == universityID && x.is_otpverified == true).Select(x => x.proctor_id).FirstOrDefault().ToString();

            tag1 = GetTag(1);
            tag2 = GetTag(2);
            tag3 = GetTag(3);
            tag4 = GetTag(4);
            tag5 = GetTag(5);
            tag6 = GetTag(6);
            tag7 = GetTag(7);

            var Tag1_total = GetSection1_tag_scoring("1", applicantId, universityID) + GetSection2_tag_scoring("1", applicantId, universityID);
            tag1_score = GetScoring(Tag1_total);

            var Tag2_total = GetSection1_tag_scoring("2", applicantId, universityID) + GetSection2_tag_scoring("2", applicantId, universityID);
            tag2_score = GetScoring(Tag2_total);

            var Tag3_total = GetSection1_tag_scoring("3", applicantId, universityID) + GetSection2_tag_scoring("3", applicantId, universityID);
            tag3_score = GetScoring(Tag3_total);

            var Tag4_total = GetSection1_tag_scoring("4", applicantId, universityID) + GetSection2_tag_scoring("4", applicantId, universityID);
            tag4_score = GetScoring(Tag4_total);

            var Tag5_total = GetSection1_tag_scoring("5", applicantId, universityID) + GetSection2_tag_scoring("5", applicantId, universityID);
            tag5_score = GetScoring(Tag5_total);

            var Tag6_total = GetSection1_tag_scoring("6", applicantId, universityID) + GetSection2_tag_scoring("6", applicantId, universityID);
            tag6_score = GetScoring(Tag6_total);

            var Tag7_total = GetSection1_tag_scoring("7", applicantId, universityID) + GetSection2_tag_scoring("7", applicantId, universityID);
            tag7_score = GetScoring(Tag7_total);

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
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

    //protected void backNavLink_Click(object sender, EventArgs e)
    //{
    //    if(aid != 0)
    //        Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + aid, true);
    //    else
    //        Response.Redirect(webURL + "admin/default.aspx", true);
    //}
}
