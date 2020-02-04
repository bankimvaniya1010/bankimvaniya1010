using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class gte_preliminaryquestion : System.Web.UI.Page
{
    public static int QuestionsCount = 0;
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();

    string webURL = string.Empty;
    int userScore = 0;
    int UniversityID = -1;
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
            GetQuestion();
            allQuestions = objCom.FaqQuestionList();
            btnGoToDeclaration.Enabled = false;
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
            var QuestionsList = db.gte_preliminary_questionmaster.ToList();
            QuestionsCount = QuestionsList.Count;
            QuestionsList = Randomize(QuestionsList);
            Session["Questions"] = QuestionsList;
            questionList.DataSource = QuestionsList;
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
            var preliminaryQuestionList = db.gte_preliminary_questionmaster.AsNoTracking().ToList();
            foreach (DataListItem item in questionList.Items)
            {
                string SelectedValue = "";
                Label questionID = (Label)item.FindControl("lblno");
                //  Label lblquestion = (Label)item.FindControl("lblquestion");
                Label lblQuestion = (Label)item.FindControl("lblQuestion");
                //Label Label1 = e.Item.FindControl("lblPrimary") as Label;
                RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");
                RadioButton rdAnswer3 = (RadioButton)item.FindControl("rdoans3");
                RadioButton rdAnswer4 = (RadioButton)item.FindControl("rdoans4");
                RadioButton rdStrongDisAgree = (RadioButton)item.FindControl("rdoans5");

                int questionId = Convert.ToInt32(questionID.Text);
                string correctAnswer = preliminaryQuestionList.FirstOrDefault(x => x.gte_preliminaryid == questionId).correctanswer;

                if (rdAnswer1.Checked)
                {
                    SelectedValue = "answer1";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick1")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick1")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip1 = (HtmlGenericControl)item.FindControl("icincorrectTick1");
                        setIncorrectTooltip(questionId,SelectedValue, lbincorrectTooltip1);
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
                if (rdAnswer3.Checked)
                {
                    SelectedValue = "answer3";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick3")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick3")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip3 = (HtmlGenericControl)item.FindControl("icincorrectTick3");
                        setIncorrectTooltip(questionId, SelectedValue, lbincorrectTooltip3);
                    }
                }
                if (rdAnswer4.Checked)
                {
                    SelectedValue = "answer4";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick4")).Style.Remove("display");
                    else
                    {
                        ((HtmlGenericControl)item.FindControl("incorrectTick4")).Style.Remove("display");
                        HtmlGenericControl lbincorrectTooltip4 = (HtmlGenericControl)item.FindControl("icincorrectTick4");
                        setIncorrectTooltip(questionId, SelectedValue, lbincorrectTooltip4);
                    }
                }

                responseInsertedForQuestion = db.gte_preliminaryapplicantanswers.Any(x => x.applicantid == UserID && x.gte_preliminary_question_id == questionId);
                if (!responseInsertedForQuestion)
                    answer.Add(questionID.Text, SelectedValue);

                if (SelectedValue != correctAnswer)
                {
                    int correctOption = Convert.ToInt32(Regex.Replace(correctAnswer, "[^0-9]+", string.Empty));
                    ((HtmlGenericControl)item.FindControl("correctTick" + correctOption)).Style.Remove("display");
                }
            }

            var mode = "update";
            var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (gteProgressBar == null)
            {
                mode = "new";
                gteProgressBar = new gte_progressbar();
                gteProgressBar.applicantid = UserID;
            }

            gteProgressBar.is_gte_question_completed = true;
            if (mode == "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();

            if(answer.Count > 0)
                Save(answer);
            calculateStudentScore(preliminaryQuestionList);
            divUserScore.Style.Remove("display");

            if (!responseInsertedForQuestion && !gteProgressBar.is_gte_certificate_generated.HasValue)
            {
                int userPercentageScore = (int)Math.Ceiling((decimal)userScore / questionList.Items.Count * 100);
                if (userPercentageScore > 40 && userPercentageScore <= 65)
                    generateParticipationCertificate("Satisfactory");
                else if (userPercentageScore > 65 && userPercentageScore <= 85)
                    generateParticipationCertificate("Good");
                else if (userPercentageScore > 85)
                    generateParticipationCertificate("Excellent");
                else
                    linkCertificate.Style.Add("display", "none");
            }

            lblUserScore.InnerText = Math.Round((decimal)userScore / questionList.Items.Count * 100, 2).ToString() + "%";
            btnsubmit.Enabled = false;
            btnGoToDeclaration.Enabled = true; // Depending upon flag for Only GTE Certificate or complete GTE Module will be visible
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "navigateToTop", "window.scrollTo(0, 0);", true);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private void setIncorrectTooltip(int questionID, string SelectedValue, HtmlGenericControl lbincorrectTooltip)
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
                if(preliminaryQuestionData.answer2_description == null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer2_description);
            }
            else if (SelectedValue == "answer3")
            {
                lbincorrectTooltip.Attributes.Add("style", "display:block;");
                if(preliminaryQuestionData.answer3_description == null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer3_description);
            }
            else if (SelectedValue == "answer4")
            {
                lbincorrectTooltip.Attributes.Add("style", "display:block;");
                if(preliminaryQuestionData.answer4_description== null)
                    lbincorrectTooltip.Attributes.Add("data-tipso", "Not Set");
                else
                    lbincorrectTooltip.Attributes.Add("data-tipso", preliminaryQuestionData.answer4_description);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void generateParticipationCertificate(string performanceCategory)
    {
        try
        {
            var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (gteProgressBar != null)
            {
                string certificateNumber = generateCertificateNumber();
                objLog.WriteLog("Certificate Number: " + certificateNumber + " generated for applicant ID: " + UserID);
                gteProgressBar.is_gte_certificate_generated = true;
                gteProgressBar.certificate_creation_date = DateTime.Today;
                gteProgressBar.performance_category = performanceCategory;
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

    public static string RandomAplhaNumericString() // Generated Format "ABCD9999"
    {
        const string chars = "ABCD";
        Random random = new Random();
        int randomNumber = random.Next(0, 9999);
        string aplhaNumericNumber = "";
        string randomString = new string(Enumerable.Repeat(chars, 4).Select(s => s[random.Next(s.Length)]).ToArray());
        if (randomNumber < 1000)
            aplhaNumericNumber = randomString + "0" + randomNumber.ToString();
        else
            aplhaNumericNumber = randomString + randomNumber.ToString();

        return aplhaNumericNumber;
    }

    private void calculateStudentScore(List<gte_preliminary_questionmaster> preliminaryQuestionList)
    {
        var preliminaryAnswerList = db.gte_preliminaryapplicantanswers
                                      .Where(x => x.applicantid == UserID)
                                      .Select(x => new { x.gte_preliminary_question_id, x.answer}).ToList();

        foreach (var answer in preliminaryAnswerList)
        {
            gte_preliminary_questionmaster test = preliminaryQuestionList.Where(x => x.gte_preliminaryid == answer.gte_preliminary_question_id).FirstOrDefault();
            if (answer.answer == test.correctanswer)
                userScore++;
        }
    }

    private void Save(Hashtable UserValues)
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
        Response.Redirect(webURL + "gte_declaration.aspx", true);
    }
}