using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class preliminary : System.Web.UI.Page
{
    public static int videoCount = 0;
    public static int otherDocCount = 0;
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected List<tutorialmaster> allDocuments = new List<tutorialmaster>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    protected string Score, Results = "";
    string webURL = String.Empty;
    int UniversityID = -1;
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

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            allDocuments = db.tutorialmaster.Where(x => x.status == 1 && x.universityid == UniversityID).ToList();

            videoCount = allDocuments.Where(c => c.type == "video").ToList().Count;
            otherDocCount = allDocuments.Where(c => c.type != "video").ToList().Count;

            
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        int isFullService = (int)Session["isfullservice"];
        if (isFullService == 0)
            Response.Redirect(webURL + "gte_studentdetails.aspx?formid=21", true);
        else
            Response.Redirect(webURL + "preliminaryquestion.aspx", true);

    }
}