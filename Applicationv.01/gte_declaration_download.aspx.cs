using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_declaration_download : System.Web.UI.Page
{

    protected static string universityName = string.Empty, Student_name, Country_of_Citizenship, dob, passport_number, current_address, reportsubmitteddate, ipaddress;
    public int ApplicantID = 0, UniversityID = 0;
    public string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    int downloadPdf = 0, feedback = 0;
    int userScore = 0;
    int section1Question;
    int section2Question;
    public string CID;
    protected int isFullService;
    public int IsFeedback = 0, download=0;
    protected string UniLogURL = "#";

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        //UniversityID = Utility.GetUniversityId();
       
        if (Request.QueryString["id"] != null)
            ApplicantID = Convert.ToInt32(Request.QueryString["id"]);
        if (Request.QueryString["UniversityID"] != null)
            UniversityID = Convert.ToInt32(Request.QueryString["UniversityID"]);

        if (Request.QueryString["download"] != null)
            download = Convert.ToInt32(Request.QueryString["download"]);

        if (download == 1)
            btnDiv.Attributes.Add("style", "display:block;margin-left: 810px;width: 50%;padding: 10px;");

        var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).FirstOrDefault();
        UniLogURL = webURL + "/Docs/" + university.universityid + "/" + university.logo;
        //ApplicantID = Convert.ToInt32(Session["UserID"].ToString());        
        //isFullService = (int)Session["FullService"];

        var data = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == UniversityID).FirstOrDefault();
        if (data != null)
        {
            //universityName = objCom.GetUniversityName(UniversityID);
            if(data.nameofuniversityappliedfor != null)
                universityName = objCom.GetUniversityName(Convert.ToInt32(data.nameofuniversityappliedfor));
            Student_name = data.firstname + " " + data.lastname;
            passport_number = data.passportno;
            dob = Convert.ToDateTime(data.dateofbirth).ToString("dd/MM/yyyy");
            current_address = data.postaladdrees1 + " " + data.postaladdrees2 + " " + data.postaladdrees3 + "," + data.postalstate + ", " + data.postalpostcode;
            Country_of_Citizenship = objCom.GetCountryDiscription(Convert.ToInt32(data.countryof_citizenship));

        }
        var gteprogressbar = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == UniversityID).FirstOrDefault();
        if (gteprogressbar != null)
        {
            string activityDate = Convert.ToDateTime(gteprogressbar.gte_declaration_completed_date).ToString("dd/MM/yyyy hh:mm tt");
            var datearr = activityDate.Split(' ');
            reportsubmitteddate = datearr[1] + " " + datearr[2] + " (GMT) on " + datearr[0];
            ipaddress = gteprogressbar.activity_ip;
        }

    }

    protected void btnDownload_Click(object sender, EventArgs e)
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

            htmlToPdf.GeneratePdfFromFile(webURL + "/gte_declaration_download.aspx?id=" + ApplicantID + "&UniversityID=" + UniversityID, null, filePath);
            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + "GTE_Declaration" + fileName);
            Response.TransmitFile(filePath);
            Response.End();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}