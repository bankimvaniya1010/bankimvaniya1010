using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
public partial class _Default : System.Web.UI.Page
{
    Logger log = new Logger();
    List<int> QuestionList = new List<int>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, applicantID = 0;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string progressStatus = "";
    protected static List<faq> allQuestions = new List<faq>();
    Common objCom = new Common();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        //Applicant_master am = db.Applicant_master.Where(b => b.userid == UserID).First();
        //applicantID = (int)am.applicantID;
        Session["Applicant"] = UserID;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            /*SetprogressStatus();*/
            //if (Session["SecondaryLang"] == null)
            //    Session["SecondaryLang"] = "ar";
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SetSecondaryLanguage(String tempP)
    {
        HttpContext.Current.Session["SecondaryLang"] = tempP;
        return "";
    }

    //private void SetprogressStatus()
    //{
    //    try
    //    {
    //        var ap = db.applicantprogressbar.Where(b => b.applicantid == applicantID).First();
    //        if (ap != null)
    //        {
    //            if (ap.documents == 1)
    //                document.Attributes["class"] = "progress-bar bg-success";
    //            if (ap.profile == 1)
    //                profile.Attributes["class"] = "progress-bar bg-success";
    //            if (ap.video == 1)
    //                Video.Attributes["class"] = "progress-bar bg-success";
    //            if (ap.question == 1)
    //                question.Attributes["class"] = "progress-bar bg-success";
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        log.WriteLog(ex.ToString());

    //    }
    //}
}