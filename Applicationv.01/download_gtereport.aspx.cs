using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class download_gtereport : System.Web.UI.Page
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
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());

        var gte_student_sop = db.gte_student_sop
                            .Where(x => x.applicant_id == applicantID && x.universityid == universityID)
                            .FirstOrDefault();

        var issupervisorcommented = db.gte_report_admin_comment.Where(x => x.applicant_id == applicantID && x.university_id == universityID).FirstOrDefault();

        if (gte_student_sop != null && issupervisorcommented != null)
           gtedoc.Attributes.Add("style", "display:block;");
        else if (gte_student_sop != null && issupervisorcommented == null)
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Please wait for supervior comment to downlload your final GTE Report.";
        }
        if (gte_student_sop == null)
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Please complete statement of purpose to download.";
        }
               
        if (!IsPostBack)
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
    }

    protected void btngte_Click(object sender, EventArgs e)
    {
        try
        {
            saveRecord("final");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
       
    private void saveRecord(string type)
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
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_report.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&downloadPdf=1&type=" + type + "", null, filePath);

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