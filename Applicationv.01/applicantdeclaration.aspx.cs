using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantdeclaration : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    public int? questionGiven = 0;
    int UserID = 0;
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    applicantprogressbar applicantprogressbar = new applicantprogressbar();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (GlobalVariables.isDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            applicantprogressbar = db.applicantprogressbar.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicantprogressbar != null)
                questionGiven = applicantprogressbar.question;
        }
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

            GlobalVariables.isDeclarationDoneByApplicant = true;
            Response.Redirect(webURL + "default.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}