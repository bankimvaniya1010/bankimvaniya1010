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
    public static int QuestionsCount2 = 0;
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
    int userScore = 0;
    int section2Question;
    public int pagecount;

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

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);


        var Isdetailscompleted = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.Isdetailscompleted).FirstOrDefault();
        if (Isdetailscompleted == false)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Incomplete profile information. Please complete profile before proceeding.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
            return;
        }
        int isFullService = (int)Session["FullService"];
        if (isFullService == 0)
        {
            var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
            if (!isGteDeclarationDoneByApplicant)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Incomplete GTE declaration.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                return;
            }
        }

        ////schedule meeting otp verified check code
        //dynamic scheduledate;
        //var list_scheduledate = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).ToList();
        //if (list_scheduledate.Count > 1)
        //{
        //    list_scheduledate = list_scheduledate.Where(x => x.is_otpverified == null).ToList();
        //    scheduledate = list_scheduledate.Last();

        //}
        //else
        //    scheduledate = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).FirstOrDefault();

        //if (scheduledate != null)
        //{
        //    if (scheduledate.is_otpverified == null)
        //        Response.Redirect(webURL + "schedulemeeting_otp.aspx?meetingtime=" + scheduledate.applicant_time_zone + "", true);
        //}
        //else
        //{
        //    students loggedInApplicant = (students)Session["LoginInfo"];
        //    username = loggedInApplicant.name;
        //    useremail = loggedInApplicant.email;

        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
        //            "alert('Please schedule counselling first.');window.location='" + Request.ApplicationPath + "schedule_conselling.aspx?name=" + username + "&email=" + useremail + "';", true);
        //    return;
        //}

        var scheduledate = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires== null).FirstOrDefault();

        if (scheduledate != null)
        {
            if (scheduledate.is_meetingtime_expires != true)
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
        var isGtePreliminarySectionDone = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();

        if (isGtePreliminarySectionDone != null && isGtePreliminarySectionDone.is_gte_preliminarysection1_completed == true)
        {
            if (isGtePreliminarySectionDone.is_gte_preliminarysection2_completed != true)
            {
                pagecount = 2;
            }
        }
        else
        {
            pagecount = 1;

        }
        section1Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection1Question"]);
        section2Question = Convert.ToInt32(ConfigurationManager.AppSettings["GTEPreliminiarySection2Question"]);
        QuestionsCount = section1Question;
        QuestionsCount2 = section2Question;
        if (!IsPostBack)
        {

            if (isGtePreliminarySectionDone != null && isGtePreliminarySectionDone.is_gte_preliminarysection1_completed == true)
            {
                if (isGtePreliminarySectionDone.is_gte_preliminarysection2_completed == true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('Gte Certificate Test is completed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                    return;
                }
                else
                {
                    pagecount = 2;
                    questions.Attributes.Add("style", "display:none;");
                    questions2.Attributes.Add("style", "display:block;");
                    GetQuestion2();
                    allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], UniversityID);
                    btnGoToDeclaration.Enabled = false;
                }
            }
            else
            {
                pagecount = 1;
                questions.Attributes.Add("style", "display:block;");
                questions2.Attributes.Add("style", "display:none;");
                GetQuestion();
                allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], UniversityID);
                btnGoToNextPage.Enabled = false;
            }
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
    public class data
    {
        public int gte_questionID { get; set; }
        public string question_tag { get; set; }
        public string question { get; set; }
    }

    private void GetQuestion()
    {
        try
        {
            List<int> mainlist = new List<int>();

            List<int> Details = new List<int>();

            var tagmaster = db.question_tag_master.ToList();
            var QuestionsList = db.gte_preliminary_section_questionmaster.ToList();
            var QuestionsListID = db.gte_preliminary_section_questionmaster.Select(x => x.gte_questionID).ToList();
            foreach (var tag in tagmaster)
            {
                string tag_id = tag.id.ToString();
                var QuestionsList_tag = db.gte_preliminary_section_questionmaster.Where(x => x.question_tag == tag_id).Select(x => x.gte_questionID).ToList();
                List<int> temp = db.gte_preliminary_section_questionmaster.Where(x => x.question_tag == tag_id).Select(x => x.gte_questionID).ToList();
                var tag_question = Randomize(QuestionsList_tag).Take(3);
                foreach (int id in tag_question)
                {
                    if (!temp.Contains(id))
                        mainlist.Add(id);
                    else
                        Details.Add(id);
                }

            }
            List<gte_preliminary_section_questionmaster> showlist = new List<gte_preliminary_section_questionmaster>();
            if (Details.Count > 0)
            {
                foreach (var item in Details)
                {
                    showlist.Add(db.gte_preliminary_section_questionmaster.Where(x => x.gte_questionID == item).FirstOrDefault());
                }
            }
            QuestionsCount = section1Question;
            questionList.DataSource = showlist;//QuestionsList.Take(section1Question);
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

                responseInsertedForQuestion = db.gtepreliminarysection_applicantanswers.Any(x => x.applicantId == UserID && x.universityId == UniversityID && x.gte_preliminary_section_question_id == questionId);
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
                var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
                if (gteProgressBar == null)
                {
                    mode = "new";
                    gteProgressBar = new gte_progressbar();
                    gteProgressBar.applicantid = UserID;
                    gteProgressBar.universityId = UniversityID;
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
                objAnswer.universityId = UniversityID;
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
        Response.Redirect(webURL + "gte_preliminary_section.aspx?formid=18", true);
    }




    public List<T> Randomize2<T>(List<T> list)
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

    private void GetQuestion2()
    {
        try
        {
            List<int> mainlist = new List<int>();

            List<int> Details = new List<int>();

            var tagmaster = db.question_tag_master.ToList();
            var QuestionsList = db.gte_preliminary_questionmaster.ToList();
            var QuestionsListID = db.gte_preliminary_questionmaster.Select(x => x.gte_preliminaryid).ToList();
            foreach (var tag in tagmaster)
            {
                string tag_id = tag.id.ToString();
                var QuestionsList_tag = db.gte_preliminary_questionmaster.Where(x => x.question_tag == tag_id).Select(x => x.gte_preliminaryid).ToList();
                List<int> temp = db.gte_preliminary_questionmaster.Where(x => x.question_tag == tag_id).Select(x => x.gte_preliminaryid).ToList();
                var tag_question = Randomize2(QuestionsList_tag).Take(1);
                foreach (int id in tag_question)
                {
                    if (!temp.Contains(id))
                        mainlist.Add(id);
                    else
                        Details.Add(id);
                }

            }
            List<gte_preliminary_questionmaster> showlist = new List<gte_preliminary_questionmaster>();
            if (Details.Count > 0)
            {
                foreach (var item in Details)
                {
                    showlist.Add(db.gte_preliminary_questionmaster.Where(x => x.gte_preliminaryid == item).FirstOrDefault());
                }
            }
            //    var QuestionsList = db.gte_preliminary_questionmaster.ToList();
            QuestionsCount2 = section2Question;
            //    QuestionsList = Randomize2(QuestionsList);
            //    Session["Questions"] = QuestionsList.Take(section2Question);
            questionList2.DataSource = showlist;
            questionList2.DataBind();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
        try
        {
            bool responseInsertedForQuestion = false;
            Hashtable answer = new Hashtable();
            var preliminaryQuestionList = db.gte_preliminary_questionmaster.AsNoTracking().ToList();
            foreach (DataListItem item in questionList2.Items)
            {
                string SelectedValue = "";
                Label questionID = (Label)item.FindControl("lblno2");
                //  Label lblquestion = (Label)item.FindControl("lblquestion");
                Label lblQuestion = (Label)item.FindControl("lblQuestion2");
                //Label Label1 = e.Item.FindControl("lblPrimary") as Label;
                RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans12");
                RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans22");
                RadioButton rdAnswer3 = (RadioButton)item.FindControl("rdoans32");
                RadioButton rdAnswer4 = (RadioButton)item.FindControl("rdoans42");
                RadioButton rdStrongDisAgree = (RadioButton)item.FindControl("rdoans52");

                int questionId = Convert.ToInt32(questionID.Text);
                string correctAnswer = preliminaryQuestionList.FirstOrDefault(x => x.gte_preliminaryid == questionId).correctanswer;

                if (rdAnswer1.Checked)
                {
                    SelectedValue = "answer1";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick12")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick12")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip1 = (HtmlGenericControl)item.FindControl("icincorrectTick12");
                        setIncorrectTooltip2(questionId, SelectedValue, lbincorrectTooltip1);
                    }
                }
                if (rdAnswer2.Checked)
                {
                    SelectedValue = "answer2";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick22")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick22")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip2 = (HtmlGenericControl)item.FindControl("icincorrectTick22");
                        setIncorrectTooltip2(questionId, SelectedValue, lbincorrectTooltip2);
                    }
                }
                if (rdAnswer3.Checked)
                {
                    SelectedValue = "answer3";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick32")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick32")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip3 = (HtmlGenericControl)item.FindControl("icincorrectTick32");
                        setIncorrectTooltip2(questionId, SelectedValue, lbincorrectTooltip3);
                    }
                }
                if (rdAnswer4.Checked)
                {
                    SelectedValue = "answer4";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick42")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick42")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip4 = (HtmlGenericControl)item.FindControl("icincorrectTick42");
                        setIncorrectTooltip2(questionId, SelectedValue, lbincorrectTooltip4);
                    }
                }

                responseInsertedForQuestion = db.gte_preliminaryapplicantanswers.Any(x => x.applicantid == UserID && x.gte_preliminary_question_id == questionId);
                if (!responseInsertedForQuestion)
                    answer.Add(questionID.Text, SelectedValue);

                if (SelectedValue != correctAnswer)
                {
                    int correctOption = Convert.ToInt32(Regex.Replace(correctAnswer, "[^0-9]+", string.Empty));
                    ((HtmlGenericControl)item.FindControl("correctTick" + correctOption + "2")).Style.Remove("display");
                }
            }

            var mode = "update";
            var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
            if (gteProgressBar == null)
            {
                mode = "new";
                gteProgressBar = new gte_progressbar();
                gteProgressBar.applicantid = UserID;
                gteProgressBar.universityId = UniversityID;
            }

            gteProgressBar.is_gte_preliminarysection2_completed = true;
            if (mode == "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();

            if (answer.Count > 0)
                Save2(answer);
            calculateStudentScore(preliminaryQuestionList);
            divUserScore.Style.Remove("display");
            int totalQuestion = 21 + 7;

            if (!responseInsertedForQuestion && !gteProgressBar.is_gte_certificate_generated.HasValue)
            {
                int userPercentageScore = (int)Math.Ceiling((decimal)userScore / totalQuestion * 100);
                if (90 <= userPercentageScore && userPercentageScore <= 100)
                    generateParticipationCertificate("1");//generateParticipationCertificate(GetGrade(Convert.ToInt32(1)));
                else if (80 <= userPercentageScore && userPercentageScore <= 89)
                    generateParticipationCertificate("2");
                else if (70 <= userPercentageScore && userPercentageScore <= 79)
                    generateParticipationCertificate("3");
                else if (60 <= userPercentageScore && userPercentageScore <= 69)
                    generateParticipationCertificate("4");
                else if (50 <= userPercentageScore && userPercentageScore <= 59)
                    generateParticipationCertificate("5");
                else if (40 <= userPercentageScore && userPercentageScore <= 49)
                    generateParticipationCertificate("6");
                else if (0 <= userPercentageScore && userPercentageScore <= 39)
                    generateParticipationCertificate("7");
                //linkCertificate.Style.Add("display", "none");
            }

            lblUserScore.InnerText = Math.Round((decimal)userScore / totalQuestion * 100).ToString() + "%";
            var mode1 = "update";
            var gteProgressBar1 = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
            if (gteProgressBar1 == null)
            {
                mode1 = "new";
                gteProgressBar1 = new gte_progressbar();
                gteProgressBar1.applicantid = UserID;
                gteProgressBar1.universityId = UniversityID;
            }
          
            gteProgressBar1.gte_perdentage_score = Math.Round((decimal)userScore / totalQuestion * 100, 2).ToString() + "%";
            if (mode1 == "new")
                db.gte_progressbar.Add(gteProgressBar1);
            db.SaveChanges();
            btnsubmit2.Enabled = false;
            btnGoToDeclaration.Enabled = true; // Depending upon flag for Only GTE Certificate or complete GTE Module will be visible
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigateToTop", "window.scrollTo(0, 0);", true);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    private string GetGrade(int id)
    {
        string grade = string.Empty;
        try
        {
            var data = db.gte_certificatelevel_description.Where(x => x.id == id).FirstOrDefault();
            if (data != null)
                grade = data.grade.ToUpper();
            else
                grade = string.Empty;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
        return grade;
    }

    private void setIncorrectTooltip2(int questionID, string SelectedValue, HtmlGenericControl lbincorrectTooltip)
    {
        try
        {
            var preliminaryQuestionData = db.gte_preliminary_questionmaster.Where(x => x.gte_preliminaryid == questionID).Select(x => new { answer1_description = x.answer1_description, answer2_description = x.answer2_description, answer3_description = x.answer3_description, answer4_description = x.answer4_description }).FirstOrDefault();

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
            else if (SelectedValue == "answer3")
            {
                lbincorrectTooltip.Attributes.Add("style", "display:block;");
                if (preliminaryQuestionData.answer3_description == null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer3_description);
            }
            else if (SelectedValue == "answer4")
            {
                lbincorrectTooltip.Attributes.Add("style", "display:block;");
                if (preliminaryQuestionData.answer4_description == null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer4_description);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void generateParticipationCertificate(string performanceCategoryID)
    {
        try
        {
            var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).FirstOrDefault();
            if (gteProgressBar != null)
            {
                string certificateNumber = generateCertificateNumber();
                objLog.WriteLog("Certificate Number: " + certificateNumber + " generated for applicant ID: " + UserID);
                gteProgressBar.is_gte_certificate_generated = true;
                gteProgressBar.certificate_creation_date = DateTime.Today;
                //gteProgressBar.certificate_creation_dateTime = DateTime.Now();
                gteProgressBar.performance_category = performanceCategoryID;
                gteProgressBar.certificate_name = certificateNumber;
                db.SaveChanges();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private string generateCertificateNumber()
    {
        string certificateNumber = "";
        while (true)
        {
            certificateNumber = RandomAplhaNumericString();
            if (!db.gte_progressbar.Any(x => x.certificate_name == certificateNumber))
                return certificateNumber;
        }
    }

    public static string RandomAplhaNumericString() // Generated Format "ABCD9999" change format to GTE-COU-ABC12345
    {
        const string chars = "ABC";
        Random random = new Random();
        int randomNumber = random.Next(0, 99999);
        string aplhaNumericNumber = "";
        string randomString = new string(Enumerable.Repeat(chars, 3).Select(s => s[random.Next(s.Length)]).ToArray());
        if (randomNumber < 10000)
            aplhaNumericNumber = randomString + "0" + randomNumber.ToString();
        else
            aplhaNumericNumber = randomString + randomNumber.ToString();

        return aplhaNumericNumber;
    }

    private void calculateStudentScore(List<gte_preliminary_questionmaster> preliminaryQuestionList)
    {
        var preliminaryAnswerList = db.gte_preliminaryapplicantanswers
                                      .Where(x => x.universityId == UniversityID && x.applicantid == UserID)
                                      .Select(x => new { x.gte_preliminary_question_id, x.answer }).ToList();

        foreach (var answer in preliminaryAnswerList)
        {
            gte_preliminary_questionmaster test = preliminaryQuestionList.Where(x => x.gte_preliminaryid == answer.gte_preliminary_question_id).FirstOrDefault();
            if (answer.answer == test.correctanswer)
                userScore++;
        }

        //Logic to calculate answered section 1 questions
        var preliminaryAnswerListSection1 = db.gtepreliminarysection_applicantanswers
                                              .Where(x => x.universityId == UniversityID && x.applicantId == UserID)
                                              .Select(x => new { x.gte_preliminary_section_question_id, x.answer }).ToList();

        var preliminaryQuestionListSection1 = db.gte_preliminary_section_questionmaster.AsNoTracking().ToList();

        foreach (var answer in preliminaryAnswerListSection1)
        {
            gte_preliminary_section_questionmaster test = preliminaryQuestionListSection1.Where(x => x.gte_questionID == answer.gte_preliminary_section_question_id).FirstOrDefault();
            if (answer.answer == test.correctanswer)
                userScore++;
        }
    }

    private void Save2(Hashtable UserValues)
    {
        try
        {
            ICollection key = UserValues.Keys;
            gte_preliminaryapplicantanswers objAnswer = new gte_preliminaryapplicantanswers();
            foreach (var val in key)
            {
                int answerID = Convert.ToInt32(val);
                objAnswer.answer = UserValues[val].ToString();
                objAnswer.applicantid = UserID;
                objAnswer.universityId = UniversityID;
                objAnswer.gte_preliminary_question_id = answerID;
                objAnswer.answersubmittedtime = DateTime.Now;
                db.gte_preliminaryapplicantanswers.Add(objAnswer);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnGoToDeclaration_Click(object sender, EventArgs e)
    {
            Response.Redirect(webURL + "gte_certificateN.aspx", true);
    }
}