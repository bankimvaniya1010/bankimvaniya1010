using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_declaration : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    public bool? questionsCompleted = false;
    int UserID = 0;
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    gte_progressbar gteProgressBar = new gte_progressbar();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
        if (isGteDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (gteProgressBar != null)
                questionsCompleted = gteProgressBar.is_gte_question_completed.Value;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "update";
            gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (gteProgressBar == null)
            {
                mode = "new";
                gteProgressBar = new gte_progressbar();
                gteProgressBar.applicantid = UserID;
            }

            gteProgressBar.is_gte_declaration_completed = true;
            if (mode == "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();

            var isFullService = (bool)Session["FullService"];
            if (isFullService)
            {
                var declarationCompleted = (bool)Session["DeclarationDoneByApplicant"];
                Session["DeclarationCompleted"] = true && declarationCompleted;
            }
            else
                Session["DeclarationCompleted"] = true;

            Session["GteDeclarationDoneByApplicant"] = true;
            Response.Redirect(webURL + "gte_studentdetails.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}