using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantdeclaration : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    public int? questionGiven = 0;
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    int UniversityID = -1;
    applicantprogressbar applicantprogressbar = new applicantprogressbar();
    protected List<declaration_master> allStatements = new List<declaration_master>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isDeclarationDoneByApplicant = (bool)Session["DeclarationDoneByApplicant"];
        if (isDeclarationDoneByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Declaration is completed. Please complete Student Information section to proceed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            applicantprogressbar = db.applicantprogressbar.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicantprogressbar != null)
                questionGiven = applicantprogressbar.question;

            allStatements = db.declaration_master.Where(x => x.universityId == UniversityID).ToList();
            foreach(var item in allStatements)
                item.statement_description = AddLinkInText(item.statement_description);
        }
    }

    public string AddLinkInText(string text)
    {
        Regex r = new Regex(@"(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})");
        text = r.Replace(text, "<a href=\"$1\" target=\"_blank\">$1</a>");
        return text;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "update";
            applicantprogressbar = db.applicantprogressbar.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicantprogressbar == null)
            {
                mode = "new";
                applicantprogressbar = new applicantprogressbar();
                applicantprogressbar.universityid = UniversityID;
                applicantprogressbar.applicantid = UserID;
            }

            applicantprogressbar.declarationdone = true;
            if (mode == "new")
                db.applicantprogressbar.Add(applicantprogressbar);
            db.SaveChanges();

            Session["DeclarationCompleted"] = true;
            Session["DeclarationDoneByApplicant"] = true;

            Response.Redirect(webURL + "default.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}