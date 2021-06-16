using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_sopreport : System.Web.UI.Page
{
    protected int ApplicantID = 0, universityID = 0;
    protected string _universityName, type;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = String.Empty;

    protected string _genuineStudentAssesment = string.Empty;
    protected string _situationStudentAssesment = string.Empty;
    protected string _potentialStudentAssesment = string.Empty;
    protected string _paragraph4 = string.Empty;
    protected string _paragraph5 = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "" || Request.QueryString["downloadPdf"] == null || Request.QueryString["downloadPdf"].ToString() == "")
        {
        }
        else
        {
            int downloadPdf = 0;
            int.TryParse(Request.QueryString["downloadPdf"].ToString(), out downloadPdf);
            if ((downloadPdf == 0 && Utility.CheckAdminLogin()) || (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "YKUcfdhNWwp17azByk"))
            {
                if (downloadPdf != 1)
                {
                    btnDiv.Visible = true;
                    btnDownload.Visible = true;
                }
                universityID = Utility.GetUniversityId();
                ApplicantID = Convert.ToInt32(Request.QueryString["id"].ToString());
                type = Request.QueryString["type"].ToString();

                if (!IsPostBack)
                {
                    if (type == "Final") {
                        var gte_student_sop = db.gte_student_sop
                                                   .Where(x => x.applicant_id == ApplicantID && x.universityid == universityID && x.is_sop_submitted_by_applicant == true)
                                                   .FirstOrDefault();
                        if (gte_student_sop != null)
                        {
                            _genuineStudentAssesment = gte_student_sop.applicant_generated_sop_para1;
                            _situationStudentAssesment = gte_student_sop.applicant_generated_sop_para2;
                            _potentialStudentAssesment = gte_student_sop.applicant_generated_sop_para3;
                            _paragraph4 = gte_student_sop.applicant_generated_sop_para4;
                            _paragraph5 = gte_student_sop.applicant_generated_sop_para5;
                        }
                    }
                    else if (type == "Draft") {
                        var gte_student_sop = db.gte_student_sop
                                                  .Where(x => x.applicant_id == ApplicantID && x.universityid == universityID && x.is_sop_submitted_draft == true)
                                                  .FirstOrDefault();
                        if (gte_student_sop != null)
                        {
                            _genuineStudentAssesment = gte_student_sop.gte_sop_para1;
                            _situationStudentAssesment = gte_student_sop.gte_sop_para2;
                            _potentialStudentAssesment = gte_student_sop.gte_sop_para3;
                            _paragraph4 = gte_student_sop.gte_sop_para4;
                            _paragraph5 = gte_student_sop.gte_sop_para5;
                        }
                    }
                    
                }
            }
        }
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try
        {
            int applicantID = 0;

            universityID = Utility.GetUniversityId();
            ApplicantID = Convert.ToInt32(Request.QueryString["id"].ToString());

            //if (Request.QueryString["applicantId"] != null)
            //    applicantID = Convert.ToInt32(Request.QueryString["applicantId"]);

            //int universityId = 0;
            //if (Request.QueryString["universityId"] != null)
            //    universityId = Convert.ToInt32(Request.QueryString["universityId"]);

            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.Default;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/sopreport.aspx?token=YKUcfdhNWwp17azByk&id=" + ApplicantID + "&type=" + type + "&downloadPdf=1", null, filePath);
            //htmlToPdf.GeneratePdfFromFile(webURL + "admin/gte_sopReport.aspx?token=YKUcfdhNWwp17azByk&downloadPdf=1&applicantId=" + applicantID + "&universityId=" + universityID, null, filePath);


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