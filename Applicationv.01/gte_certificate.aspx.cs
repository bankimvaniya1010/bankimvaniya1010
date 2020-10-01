using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

public partial class gte_certificate : System.Web.UI.Page
{
    protected string _studentName = "";
    protected string _performanceCategory = "";
    protected string _certificateNumber = "";
    protected string _certificateCreationDate = "";

    protected int ApplicantID = 0, universityID = 0;
    string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    int downloadPdf = 0;
    int userScore = 0;
    int section1Question;
    int section2Question;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        
        if (Request.QueryString["downloadPdf"] != null)
            downloadPdf = Convert.ToInt32(Request.QueryString["downloadPdf"]);
        universityID = Utility.GetUniversityId();
        section1Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection1Question"]);
        section2Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection2Question"]);
        showContent();
        
    }

    private void showContent()
    {
        try
        {
            if (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr")
            {
                backNavLink.Visible = false;
                btnDownload.Visible = false;
                btnDiv.Style.Add("display", "none");
                int applicantId = 0;
                if (Request.QueryString["applicantId"] != null)
                    applicantId = Convert.ToInt32(Request.QueryString["applicantId"]);

                int universityId = 0;
                if (Request.QueryString["universityId"] != null)
                    universityId = Convert.ToInt32(Request.QueryString["universityId"]);
                setStudentPersonalDetails(applicantId, universityId);
            }
            else if (downloadPdf == 0)
            {
                btnDiv.Style.Remove("display");
                if (Utility.CheckStudentLogin())
                {
                    universityID = Utility.GetUniversityId();
                    ApplicantID = Convert.ToInt32(Session["UserID"].ToString());

                    if (!IsPostBack)
                    {
                        var studentGteProgress = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
                        if (studentGteProgress != null)
                        {
                            if (studentGteProgress.is_gte_certificate_generated.HasValue && studentGteProgress.is_gte_certificate_generated.Value)
                            {
                                setStudentPersonalDetails(ApplicantID, universityID);
                            }
                            else {
                                var preliminaryQuestionList = db.gte_preliminary_questionmaster.AsNoTracking().ToList();
                                calculateStudentScore(preliminaryQuestionList);

                                int totalQuestion = section1Question + section2Question;
                                int userPercentageScore = (int)Math.Ceiling((decimal)userScore / totalQuestion * 100);
                                if (userPercentageScore > 40 && userPercentageScore <= 65)
                                    generateParticipationCertificate("Satisfactory");
                                else if (userPercentageScore > 65 && userPercentageScore <= 85)
                                    generateParticipationCertificate("Good");
                                else if (userPercentageScore > 85)
                                    generateParticipationCertificate("Excellent");
                                else
                                    generateParticipationCertificate("Poor");

                                setStudentPersonalDetails(ApplicantID, universityID);
                            }
                        }
                        else
                            showErrorMessage();
                    }
                }
                else
                    Response.Redirect(webURL + "/default.aspx", true);
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
    public static string RandomAplhaNumericString() // Generated Format "ABCD9999"
    {
        const string chars = "ABCD";
        Random random = new Random();
        int randomNumber = random.Next(0, 9999);
        string aplhaNumericNumber = "";
        string randomString = new string(Enumerable.Repeat(chars, 4).Select(s => s[random.Next(s.Length)]).ToArray());
        if (randomNumber < 1000)
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
                                "alert('GTE Certificate not generated.');window.location='" + webURL + "default.aspx';", true);
    }

    private void setStudentPersonalDetails(int applicantId, int universityID)
        {
        try
        {
            objLog.WriteLog("Applicant ID: " + applicantId + " University Id: " + universityID);

            var Personal = db.applicantdetails.Where(x => x.applicantid == applicantId && x.universityid == universityID).FirstOrDefault();
            _studentName = Personal.firstname + " " + Personal.lastname;

            var applicant_gte_progress = db.gte_progressbar.Where(x => x.applicantid == applicantId && x.universityId == universityID).FirstOrDefault();
            _performanceCategory = applicant_gte_progress.performance_category;
            _certificateNumber = applicant_gte_progress.certificate_name;
            if (applicant_gte_progress.certificate_creation_date.HasValue)
                _certificateCreationDate = applicant_gte_progress.certificate_creation_date.Value.ToString("dd-MM-yyyy");

            
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }   

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try
        {
            int applicantID = Convert.ToInt32(Session["UserID"].ToString());
            int universityID = Utility.GetUniversityId();

            if (!(applicantID == 0 || universityID == 0))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                         "alert('Invalid Student Details');window.location='" + webURL + "/gte_declaration.aspx?formid=20';", true);

            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.Default;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_certificate.aspx?token=XS7MKjHLunMAvqzCGr&downloadPdf=1&applicantId=" + applicantID + "&universityId=" + universityID, null, filePath);
            
      
            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=GTE_Certificate.pdf");
            HttpContext.Current.Response.TransmitFile(filePath);

            HttpContext.Current.Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}