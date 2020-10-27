using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_tutorial : System.Web.UI.Page
{
    public static int videoCount = 0;
    public static int otherDocCount = 0, pptDocumentCount= 0;
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected List<gte_tutorialmaster> allDocuments = new List<gte_tutorialmaster>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    protected string Score, Results = "";
    string webURL = String.Empty;
    int UniversityID = -1;
    bool? istutorialcomplete;
    int formId = 0;
    gte_progressbar gteProgressBar = new gte_progressbar();
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

        //istutorialcomplete = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).Select(x => x.is_gte_tutorial_completed).FirstOrDefault();
        //if (istutorialcomplete != null && istutorialcomplete == true)
        //    declaration.Attributes.Add("style", "display:none");

        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], UniversityID);
            allDocuments = db.gte_tutorialmaster.Where(x => x.status == 1 && x.universityid == UniversityID).ToList();

            videoCount = allDocuments.Where(c => c.type == "video").ToList().Count;
            otherDocCount = allDocuments.Where(c => c.type != "video").ToList().Count;
            pptDocumentCount = allDocuments.Where(c => c.type == "ppt").ToList().Count();

            var data = db.gte_tutorialmaster.Where(x => x.status == 1 && x.universityid == UniversityID && x.type == "pdf").Select(x => new {
                title = x.title,
                link = webURL + "Docs/GteTutorial/" + x.documentpath + "#toolbar=0"
            }).ToList().Take(1);

            questionList.DataSource = data;
            questionList.DataBind();

            populate();
        }
    }
    private void populate()
    {
        var gteInfo = (from pInfo in db.gte_progressbar
                       where pInfo.applicantid == UserID && pInfo.universityId == UniversityID
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
                        where pInfo.applicantid == UserID && pInfo.universityId == UniversityID
                           select pInfo).FirstOrDefault();
            if (gteInfo != null)
            {
                mode = "update";
                gteProgressBar = gteInfo;
            }
            gteProgressBar.is_gte_tutorial_completed = true;
            gteProgressBar.applicantid = UserID;
            gteProgressBar.universityId = UniversityID;

            if(mode== "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();
            Response.Redirect(webURL + "gte_preliminary_section.aspx?formid=18", true);
        }
        
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        
    }
}