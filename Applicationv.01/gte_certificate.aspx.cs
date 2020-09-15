using NReco.PdfGenerator;
using System;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        
        if (Request.QueryString["downloadPdf"] != null)
            downloadPdf = Convert.ToInt32(Request.QueryString["downloadPdf"]);
        universityID = Utility.GetUniversityId();        
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
                            else
                                showErrorMessage();
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