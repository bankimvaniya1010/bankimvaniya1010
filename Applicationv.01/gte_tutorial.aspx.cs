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

    protected List<gte_tutorialmaster> allDocuments = new List<gte_tutorialmaster>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    protected string Score, Results = "";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (GlobalVariables.isDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            allDocuments = db.gte_tutorialmaster.Where(x => x.status == 1).ToList();

            videoCount = allDocuments.Where(c => c.type == "video").ToList().Count;
            otherDocCount = allDocuments.Where(c => c.type != "video").ToList().Count;
        }
    }
}