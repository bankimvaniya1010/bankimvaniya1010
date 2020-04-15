using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class gte_preliminary_section : System.Web.UI.Page
{
    public static int QuestionsCount = 0;
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    string webURL = string.Empty;
    int UniversityID = -1;
    int section1Question;
    string username = string.Empty;
    string useremail = string.Empty;
    int formId = 0;
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
        var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
        if (isGteDeclarationDoneByApplicant)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('GTE Declaration is completed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
            return;
        }

        //schedule meeting otp verified check code
        var scheduledate = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).FirstOrDefault();

        if (scheduledate != null)
        {
            if (scheduledate.is_otpverified == null)
                Response.Redirect(webURL + "schedulemeeting_otp.aspx?meetingtime=" + scheduledate.applicant_time_zone + "", true);
        }
        else
        {
            students loggedInApplicant = (students)Session["LoginInfo"];
            username = loggedInApplicant.name;
            useremail = loggedInApplicant.email;

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Please schedule counselling first.');window.location='" + Request.ApplicationPath + "schedule_conselling.aspx?name=" + username + "&email=" + useremail + "';", true);
            return;
        }

        section1Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection1Question"]);
        if (!IsPostBack)
        {
            var isGtePreliminarySectionDone = db.gte_progressbar.Where(x => x.applicantid == UserID).Select(x => x.is_gte_preliminarysection1_completed.HasValue && x.is_gte_preliminarysection1_completed.Value).FirstOrDefault();
            if (isGtePreliminarySectionDone)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Gte Certificate Test - Stage 1 is completed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                return;
            }

            GetQuestion();
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], UniversityID);
            btnGoToNextPage.Enabled = false;
        }
    }

    public List<T> Randomize<T>(List<T> list)
    {
        List<T> randomizedList = new List<T>();
        Random rnd = new Random();
        while (list.Count > 0)
        {
            int index = rnd.Next(0, list.Count); //pick a random item from the master list
            randomizedList.Add(list[index]); //place it at the end of the randomized list
            list.RemoveAt(index);
        }
        return randomizedList;
    }
    private void GetQuestion()
    {
        try
        {
            var QuestionsList = db.gte_preliminary_section_questionmaster.ToList();
            QuestionsCount = section1Question;
            QuestionsList = Randomize(QuestionsList);
            Session["Questions"] = QuestionsList.Take(section1Question);
            questionList.DataSource = QuestionsList.Take(section1Question);
            questionList.DataBind();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            bool responseInsertedForQuestion = false;
            Hashtable answer = new Hashtable();
            var preliminaryQuestionList = db.gte_preliminary_section_questionmaster.AsNoTracking().ToList();
            foreach (DataListItem item in questionList.Items)
            {
                string SelectedValue = "";
                Label questionID = (Label)item.FindControl("lblno");                
                Label lblQuestion = (Label)item.FindControl("lblQuestion");                 
                RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");

                int questionId = Convert.ToInt32(questionID.Text);
                string correctAnswer = preliminaryQuestionList.FirstOrDefault(x => x.gte_questionID == questionId).correctanswer;

                if (rdAnswer1.Checked)
                {
                    SelectedValue = "answer1";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick1")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick1")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip1 = (HtmlGenericControl)item.FindControl("icincorrectTick1");
                        setIncorrectTooltip(questionId, SelectedValue, lbincorrectTooltip1);
                    }
                }
                if (rdAnswer2.Checked)
                {
                    SelectedValue = "answer2";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick2")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick2")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip2 = (HtmlGenericControl)item.FindControl("icincorrectTick2");
                        setIncorrectTooltip(questionId, SelectedValue, lbincorrectTooltip2);
                    }
                }
                
                responseInsertedForQuestion = db.gtepreliminarysection_applicantanswers.Any(x => x.applicantId == UserID && x.gte_preliminary_section_question_id == questionId);
                if (!responseInsertedForQuestion)
                    answer.Add(questionID.Text, SelectedValue);

                if (SelectedValue != correctAnswer)
                {
                    int correctOption = Convert.ToInt32(Regex.Replace(correctAnswer, "[^0-9]+", string.Empty));
                    ((HtmlGenericControl)item.FindControl("correctTick" + correctOption)).Style.Remove("display");
                }
            }
            if (answer.Count > 0)
            {
                Save(answer);            
                var mode = "update";
                var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
                if (gteProgressBar == null)
                {
                    mode = "new";
                    gteProgressBar = new gte_progressbar();
                    gteProgressBar.applicantid = UserID;
                }

                gteProgressBar.is_gte_preliminarysection1_completed = true;
                if (mode == "new")
                    db.gte_progressbar.Add(gteProgressBar);
                db.SaveChanges();
            }
            btnsubmit.Enabled = false;
            btnGoToNextPage.Enabled = true;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private void setIncorrectTooltip(int questionID, string SelectedValue, HtmlGenericControl lbincorrectTooltip)
    {
        try
        {
            var preliminaryQuestionData = db.gte_preliminary_section_questionmaster.Where(x => x.gte_questionID == questionID).Select(x => new { answer1_description = x.answer1_description, answer2_description = x.answer2_description }).FirstOrDefault();

            if (SelectedValue == "answer1")
            {
                lbincorrectTooltip.Attributes.Add("style", "display:block;");
                if (preliminaryQuestionData.answer1_description == null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer1_description);
            }
            else if (SelectedValue == "answer2")
            {
                lbincorrectTooltip.Attributes.Add("style", "display:block;");
                if (preliminaryQuestionData.answer2_description == null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer2_description);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void Save(Hashtable UserValues)
    {
        try
        {
            ICollection key = UserValues.Keys;
            gtepreliminarysection_applicantanswers objAnswer = new gtepreliminarysection_applicantanswers();
            foreach (var val in key)
            {
                int answerID = Convert.ToInt32(val);
                objAnswer.answer = UserValues[val].ToString();
                objAnswer.applicantId = UserID;
                objAnswer.gte_preliminary_section_question_id = answerID;
                objAnswer.answersubmittedtime = DateTime.Now;
                db.gtepreliminarysection_applicantanswers.Add(objAnswer);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
        
    protected void btnGoToNextPage_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "gte_preliminaryquestion.aspx?formid=19", true);
    }
}