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
    protected static string universityName = string.Empty;
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

            if (Session["isDomesticStudent"] == null)
                domesticDiv.Style.Remove("display");
            else
                domesticDiv.Visible = false;
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SetSecondaryLanguage(String tempP)
    {
        HttpContext.Current.Session["SecondaryLang"] = tempP;
        return "";
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        Label lbluniversityName = (Label)this.Master.FindControl("lbluniversityName");
        universityName = lbluniversityName.Text;
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var studentDetails = db.students.Where(x => x.studentid == UserID).FirstOrDefault();
        if (rblYes.Checked)
            studentDetails.isDomesticStudent = rblYes.Checked;
        else if(rblNo.Checked)
            studentDetails.isDomesticStudent = rblYes.Checked;

        db.SaveChanges();
        Session["isDomesticStudent"] = studentDetails.isDomesticStudent.Value;

        Response.Redirect(Request.Url.ToString(), true);
    }
}