﻿using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class download_reports : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    protected Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    int applicantID = 0, universityID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();        
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Utility.GetUniversityId();
        applicantID = Convert.ToInt32(Session["UserID"]);

        var gte_student_sop = db.gte_student_sop
                            .Where(x => x.applicant_id == applicantID && x.universityid == universityID && x.is_sop_submitted_by_applicant == true)
                            .FirstOrDefault();
        if (gte_student_sop != null)
            sopdoc.Attributes.Add("style", "display:block;");
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Please complete statement of purpose to download.";
        }
        if (!IsPostBack)
            allQuestions = objCom.FaqQuestionList();
    }

    protected void downloadsop_Click(object sender, EventArgs e)
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
            htmlToPdf.GeneratePdfFromFile(webURL + "sop_report.aspx?token=YKUcfdhNWwp17azByk&id=" + applicantID + "&downloadPdf=1", null, filePath);

            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=SOP_Report_" + fileName);
            Response.TransmitFile(filePath);
            Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        
    }
}