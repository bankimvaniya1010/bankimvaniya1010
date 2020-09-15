using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_draft : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    protected Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    int applicantID = 0, universityID = 0;
    int formId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Utility.GetUniversityId();
        applicantID = Convert.ToInt32(Session["UserID"]);
        
        var gte_student_sop = db.gte_student_sop
                            .Where(x => x.applicant_id == applicantID && x.universityid == universityID)
                            .FirstOrDefault();

        if (gte_student_sop != null && gte_student_sop.is_sop_submitted_draft == true)
            sopdraftdoc.Attributes.Add("style", "display:block;");
        else
        {
            var answeredGteQuestion1 = db.gte_questions_applicant_response.AsNoTracking().Where(x => x.applicant_id == applicantID && x.university_id == universityID).ToList();
            var allGteQuestions1 = db.gte_questions_master.AsNoTracking().ToList();

            var answeredGteQuestion2 = db.gte_question_part2_applicant_response.AsNoTracking().Where(x => x.applicant_id == applicantID && x.university_id == universityID).ToList();
            var allGteQuestions2 = db.gte_question_master_part2.AsNoTracking().ToList();

            var clarification_questionsList = db.gte_clarification_questionmaster.AsNoTracking().ToList();
            var answeredClarificationQuestion = db.gte_clarification_applicantresponse.AsNoTracking().Where(x => x.applicant_id == applicantID && x.university_id == universityID).ToList();

            foreach (var item in answeredGteQuestion2)
                clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

            clarification_questionsList.RemoveAll(x => x.gte_master1_id == null);

            if (answeredGteQuestion1.Count != allGteQuestions1.Count) // Check for gte assesment 1 check
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Please complete GTE Stage-2 Assessment before proceeding";
            }
            else if (answeredGteQuestion2.Count != allGteQuestions2.Count)  // Check for gte assesment 2 check
            {                
                lblmsg.Visible = true;
                lblmsg.Text = "Please complete GTE Stage-3 Assessment before proceeding";
            }
            else if (answeredClarificationQuestion.Count < clarification_questionsList.Count) // Check for gte clarification question check
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Please complete GTE Clarification questions before proceeding";
            }
        }

        if (!IsPostBack)
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
    }  

    protected void downloaddraftsop_Click(object sender, EventArgs e)
    {
        try
        {
            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.A4;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_report.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&downloadPdf=1&type=draft", null, filePath);

            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=GTE_Report_" + fileName);
            Response.TransmitFile(filePath);
            Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}