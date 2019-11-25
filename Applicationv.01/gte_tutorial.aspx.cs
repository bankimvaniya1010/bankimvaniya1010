using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_tutorial : System.Web.UI.Page
{
    public static int videoCount = 0;
    public static int otherDocCount = 0;
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected List<gte_tutorialmaster> allDocuments = new List<gte_tutorialmaster>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    protected string Score, Results = "";
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = -1;//Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    gte_progressbar gteProgressBar = new gte_progressbar();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
        if (isGteDeclarationDoneByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('GTE Declaration is completed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            allDocuments = db.gte_tutorialmaster.Where(x => x.status == 1).ToList();

            videoCount = allDocuments.Where(c => c.type == "video").ToList().Count;
            otherDocCount = allDocuments.Where(c => c.type != "video").ToList().Count;
            populate();
        }
    }
    private void populate()
    {
        var gteInfo = (from pInfo in db.gte_progressbar
                       where pInfo.applicantid == UserID
                       select pInfo).FirstOrDefault();
        if (gteInfo != null)
        {
            if (gteInfo.is_gte_tutorial_completed == true) 
                checkCondition.Checked = true;
            
        }
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var gteInfo = (from pInfo in db.gte_progressbar
                        where pInfo.applicantid == UserID 
                        select pInfo).FirstOrDefault();
            if (gteInfo != null)
            {
                mode = "update";
                gteProgressBar = gteInfo;
            }
            gteProgressBar.is_gte_tutorial_completed = true;
            gteProgressBar.applicantid = UserID;

            if(mode== "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();            
        }
        
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        
    }
}