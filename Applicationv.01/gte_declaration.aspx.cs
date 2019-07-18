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
        if (GlobalVariables.isGteDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (gteProgressBar != null)
                questionsCompleted = gteProgressBar.is_gte_question_completed;
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

            GlobalVariables.isGteDeclarationDoneByApplicant = true;
            Response.Redirect(webURL + "default.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}