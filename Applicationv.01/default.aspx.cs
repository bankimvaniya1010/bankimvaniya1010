using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    Logger log = new Logger();
    List<int> QuestionList = new List<int>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, applicantID = 0;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string progressStatus = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        //Applicant_master am = db.Applicant_master.Where(b => b.userid == UserID).First();
        //applicantID = (int)am.applicantID;
        Session["Applicant"] = UserID;
        if (!IsPostBack)
        {
            SetprogressStatus(); BindRadiobuttonlist();
            //if (Session["SecondaryLang"] == null)
            //    Session["SecondaryLang"] = "ar";
        }
    }

    protected void SetSecondaryLanguage(object sender, EventArgs e)
    {
        Session["SecondaryLang"] = rblLanguage.SelectedValue;

    }

    private void BindRadiobuttonlist()
    {
        var slm = db.secondaryLanguagemaster.ToList();
        rblLanguage.DataSource = slm;
        rblLanguage.DataTextField = "secondaryLanguagename";
        rblLanguage.DataValueField = "languagecode";
        rblLanguage.DataBind();
    }
    private void SetprogressStatus()
    {
        try
        {
            var ap = db.applicantprogressbar.Where(b => b.applicantid == applicantID).First();
            if (ap != null)
            {
                if (ap.documents == 1)
                    document.Attributes["class"] = "progress-bar bg-success";
                if (ap.profile == 1)
                    profile.Attributes["class"] = "progress-bar bg-success";
                if (ap.video == 1)
                    Video.Attributes["class"] = "progress-bar bg-success";
                if (ap.question == 1)
                    question.Attributes["class"] = "progress-bar bg-success";
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());

        }
    }
}