using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_download_reportLink : System.Web.UI.Page
{
    public int rpt, Applicant_id = 0;
    public string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    int universityID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        //universityID = Utility.GetUniversityId();

        if (Request.QueryString["rpt"] != null)
            rpt = Convert.ToInt32(Request.QueryString["rpt"]);

        if (Request.QueryString["aid"] != null)
            Applicant_id = Convert.ToInt32(Request.QueryString["aid"]);

        if (Request.QueryString["uid"] != null)
            universityID = Convert.ToInt32(Request.QueryString["uid"]);

        if (rpt == 1)//certificate
            Download_Certificate(Applicant_id);
        else if (rpt == 2)
            downloadGTEReport(Applicant_id);
        else if (rpt == 3)
            Download_SOPReport(Applicant_id);
    }

    private void Download_SOPReport(int UserID)
    {
        try
        {
            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.Default;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/sop_reportN.aspx?token=YKUcfdhNWwp17azByk&downloadPdf=1&applicantId=" + UserID + "&universityId=" + universityID, null, filePath);


            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=SOP_Report.pdf");
            HttpContext.Current.Response.TransmitFile(filePath);

            HttpContext.Current.Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void downloadGTEReport(int applicantID)
    {
        try
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
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void Download_Certificate(int aid)
    {
        try
        {
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
}