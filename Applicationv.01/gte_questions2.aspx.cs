using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_questions2 : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    public static int QuestionsCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
    int UniversityID = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());        
        if (Session["totalResponseTimeQue2"] == null)
            Session["totalResponseTimeQue2"] = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID)
                                             .Select(x => x.response_time).DefaultIfEmpty(0).Max();

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            var answeredQuestion = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
            var allQuestions = db.gte_question_master_part2.ToList();
            ViewState["QuestionsCount"] = allQuestions.Count;
            ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
            if (answeredQuestion.Count > 0)
                Session["totalResponseTimeQue2"] = answeredQuestion.Max(x => x.response_time);
            if (answeredQuestion.Count == allQuestions.Count)
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "All questions have been answered in this part.";
            }
            else
            {
                dynamic applicantdetails;
                var isFullService = (bool)Session["FullService"];

                if (isFullService)
                {
                    applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();

                    if (applicantdetails != null)
                    {
                        if (applicantdetails.issameaspostal == 1)
                        {
                            if (applicantdetails.postalcountry > 0)
                                ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.postalcountry);
                        }
                        else if (applicantdetails.issameaspostal == 2)
                        {
                            if (applicantdetails.residentialcountry)
                                ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                        }
                        else
                            ViewState["homeCountry"] = string.Empty;
                    }
                }
                else
                {
                    applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();
                    if (applicantdetails != null)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residencecountry);
                }

                if (applicantdetails == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete profile information. Please complete profile before proceeding.')", true);
                    Response.Redirect(webURL + "default.aspx", true);
                }

                foreach (var response in answeredQuestion)
                    allQuestions.RemoveAll(x => x.id == response.question_id);

                foreach (var item in allQuestions)
                    item.question = AddContentInText(item.question);

                Session["allQuestions"] = allQuestions;
                bindDataList();
            }
        }
    }

    private string AddContentInText(string text)
    {
        if (text.Contains("#HomeCountry#"))
            text = text.Replace("#HomeCountry#", Convert.ToString(ViewState["homeCountry"]));

        return text;
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

    private void bindDataList()
    {
        try
        {
            var allQuestions = (List<gte_question_master_part2>)Session["allQuestions"];

            allQuestions = Randomize(allQuestions);
            QuestionsCount = 5;
            if (allQuestions.Count < 5)
                QuestionsCount = allQuestions.Count;

            questionList.DataSource = allQuestions.Take(QuestionsCount);
            questionList.DataBind();

            int answeredQuestionCount = Convert.ToInt32(ViewState["AnsweredQuestionCount"]) + 1;
            if (QuestionsCount % 5 == 0)
                ViewState["Display"] = answeredQuestionCount.ToString() + " - " + (answeredQuestionCount + 4).ToString();
            else
                ViewState["Display"] = answeredQuestionCount.ToString() + " - " + (answeredQuestionCount + QuestionsCount - 1).ToString();
            
            ViewState["AnsweredQuestionCount"] = Convert.ToInt32(ViewState["AnsweredQuestionCount"]) + QuestionsCount;
            Session["allQuestions"] = allQuestions;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int questionId = 0;
        var allQuestions = (List<gte_question_master_part2>)Session["allQuestions"];
        try
        {
            List<int> IDList = new List<int>();
            foreach (DataListItem item in questionList.Items)
            {
                Label question = (Label)item.FindControl("lblno");
                questionId = Convert.ToInt32(question.Text);
                int responsetime = Convert.ToInt32(hidTime.Value);

                bool responseInsertedForQuestion = db.gte_question_part2_applicant_response.Any(x => x.applicant_id == UserID && x.university_id == UniversityID && x.question_id == questionId);
                if (!responseInsertedForQuestion)
                {
                    RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                    RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");

                    gte_question_part2_applicant_response answer = new gte_question_part2_applicant_response();
                    answer.applicant_id = UserID;
                    answer.question_id = questionId;
                    if (rdAnswer1.Checked)
                        answer.applicant_response = true;
                    else if (rdAnswer2.Checked)
                        answer.applicant_response = false;
                    answer.university_id = UniversityID;
                    answer.response_time = 0;
                    db.gte_question_part2_applicant_response.Add(answer);
                    int saveSuccefull = db.SaveChanges();
                    if (saveSuccefull == 1)
                    {
                        IDList.Add(answer.id);
                        if (IDList.Count == QuestionsCount)
                        {
                            foreach (int itm in IDList)
                            {
                                var recordID = db.gte_question_part2_applicant_response.Where(x => x.id == itm).FirstOrDefault();
                                recordID.response_time= (int)Session["totalResponseTimeQue2"] + responsetime;
                                db.SaveChanges();
                            }                     
                            Session["totalResponseTimeQue2"] = (int)Session["totalResponseTimeQue2"] + responsetime;
                        }
                    }
                }

                allQuestions.RemoveAll(x => x.id == questionId);
            }

            if (allQuestions.Count > 0)
            {
                Session["allQuestions"] = allQuestions;
                bindDataList();
            }
            else
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                //Session.Remove("totalResponseTimeQue2");
                var clarification_questionsList = db.gte_clarification_questionmaster.ToList();
                var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
                foreach (var item in applicant_response)
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

                if (clarification_questionsList.Count == 0)
                    lblCompleted.Text = "Thank you for answering all GTE questions in this part.";
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering all GTE questions in this part.');window.location='" + Request.ApplicationPath + "gte_clarificationquestions.aspx';", true);

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}