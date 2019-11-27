using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class predeparturetutorial : System.Web.UI.Page
{
    public static int videoCount = 0;
    public static int otherDocCount = 0;
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected List<predeparturetutorialmaster> allDocuments = new List<predeparturetutorialmaster>();
    private GTEEntities db = new GTEEntities();
    int ApplicantID = 0;
    string webURL = String.Empty;
    int UniversityID = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        ApplicantID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            allDocuments = db.predeparturetutorialmaster.Where(x =>x.universityid == UniversityID).ToList();

            videoCount = allDocuments.Where(c => c.type == "video").ToList().Count;
            otherDocCount = allDocuments.Where(c => c.type != "video").ToList().Count;
        }
    }
}