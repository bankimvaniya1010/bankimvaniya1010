using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class gte_declaration : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    public bool? questionsCompleted = false;
    public bool applicantdetailsCompleted = false;
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    int UniversityID = -1;
    public string declarationsubmitteddate;
    gte_progressbar gteProgressBar = new gte_progressbar();
    protected static string universityName = string.Empty, Student_name, Country_of_Citizenship, dob, passport_number, current_address, reportsubmitteddate, ipaddress;
    protected List<gte_declaration_master> allStatements = new List<gte_declaration_master>();
    protected int isFullService;
    int formId = 0;
    protected string UniLogURL = "#";
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        isFullService = (int)Session["FullService"];
        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        var Isdetailscompleted = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.Isdetailscompleted).FirstOrDefault();
        if (Isdetailscompleted != true)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Please complete your details section.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
            return;
        }
        var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
        var university = db.university_master.Where(x => x.universityid == UniversityID).FirstOrDefault();
        UniLogURL = webURL + "/Docs/" + university.universityid + "/" + university.logo;

        if (!IsPostBack)
        {
            
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], UniversityID);
            gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
            if (gteProgressBar != null)
                if (gteProgressBar.is_gte_preliminarysection1_completed != null && gteProgressBar.is_gte_preliminarysection2_completed != null)
                    questionsCompleted = gteProgressBar.is_gte_preliminarysection1_completed.Value && gteProgressBar.is_gte_preliminarysection2_completed.Value;
            if (isFullService == 0) {
                gtedecDiv.Attributes.Remove("style");
                gtedecDiv.Attributes.Add("style", "display:block");
                btnDownload.Visible = false;
                Div2.Attributes.Add("style", "display:none");

                var data = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                if (data != null)
                {
                    Student_name = data.firstname + " " + data.lastname;
                    passport_number = data.passportno;
                    dob = Convert.ToDateTime(data.dateofbirth).ToString("dd/MM/yyyy");
                    current_address = data.postaladdrees1 + " " + data.postaladdrees2 + " " + data.postaladdrees3 + "," + data.postalstate + ", " + data.postalpostcode;
                    Country_of_Citizenship = objCom.GetCountryDiscription(Convert.ToInt32(data.countryof_citizenship));
                    if(data.nameofuniversityappliedfor != null)
                        universityName = objCom.GetUniversityName(Convert.ToInt32(data.nameofuniversityappliedfor));
                }
            }
            else {

                allStatements = db.gte_declaration_master.Where(x => x.universityId == UniversityID).ToList();
                if (allStatements.Count == 0)
                    Div2.Attributes.Add("style", "display:block");
            }

            
            var applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.Isdetailscompleted).FirstOrDefault();
            if (applicantdetails != null)
                applicantdetailsCompleted = true;
            else
                applicantdetailsCompleted = false;
            foreach (var item in allStatements)
                item.statementdescription = AddLinkInText(item.statementdescription);
            if (isGteDeclarationDoneByApplicant)
            {
                CompleteDiv.Attributes.Add("style", "display:block");
                declarationDiv.Attributes.Add("style", "display:none");
                //gtedec.Attributes.Add("style", "display:none");
                
                Div2.Attributes.Add("style", "display:none");
                headlbl.Visible = false;
                if (isFullService == 0)
                {
                    gtedecDiv.Attributes.Remove("style");
                    gtedecDiv.Attributes.Add("style", "display:block");
                    btnDownload.Visible = true;
                    //gtedecDiv.Attributes.Add("style", "dispay:block;");
                    declbl.Visible = false;
                }
                var gteprogressbar = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
                if (gteprogressbar != null)
                {
                    declarationsubmitteddate = Convert.ToDateTime(gteprogressbar.gte_declaration_completed_date).ToString("dd-MM-yyyy");
                    string activityDate = Convert.ToDateTime(gteprogressbar.gte_declaration_completed_date).ToString("dd/MM/yyyy hh:mm tt");
                    var datearr = activityDate.Split(' ');
                    reportsubmitteddate = datearr[1] + " " + datearr[2] + " (GMT) on " + datearr[0];
                    ipaddress = gteprogressbar.activity_ip;
                }
            }
        }
    }

    public string AddLinkInText(string text)
    {
        Regex r = new Regex(@"(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})");
        text = r.Replace(text, "<a href=\"$1\" target=\"_blank\">$1</a>");
        return text;
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        Label lbluniversityName = (Label)this.Master.FindControl("lbluniversityName");
        //universityName = lbluniversityName.Text;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "update";
            gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
            if (gteProgressBar == null)
            {
                mode = "new";
                gteProgressBar = new gte_progressbar();
                gteProgressBar.applicantid = UserID;
                gteProgressBar.universityId = UniversityID;
            }

            gteProgressBar.is_gte_declaration_completed = true;
            gteProgressBar.gte_declaration_completed_date = DateTime.UtcNow;
            gteProgressBar.activity_ip = Request.UserHostAddress; // IP adderess value


            if (mode == "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();

            Session["GteDeclarationDoneByApplicant"] = true;
            int isFullService = (int)Session["FullService"];
            if (isFullService == 1)
            {
                var declarationCompleted = (bool)Session["DeclarationDoneByApplicant"];
                Session["DeclarationCompleted"] = true && declarationCompleted;
                var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
                if (isProfileDetailsCompletedByApplicant)
                    Response.Redirect(webURL + "gte_tutorial.aspx?formid=17", true);//Response.Redirect(webURL + "gte_questions1.aspx?formid=22", true);
                else
                    Response.Redirect(webURL + "default.aspx", true);
            }
            else
            {
                Session["DeclarationCompleted"] = true;
                Response.Redirect(webURL + "gte_tutorial.aspx?formid=17", true);//Response.Redirect(webURL + "gte_studentdetails.aspx?formid=21", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try {
            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.A3;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);

            htmlToPdf.GeneratePdfFromFile(webURL + "/gte_declaration_download.aspx?id=" + UserID + "&UniversityID=" + UniversityID, null, filePath);
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