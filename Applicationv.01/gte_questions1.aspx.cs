using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_questions1 : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected List<faq> allfaqQuestion = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            var answeredQuestion = db.gte_questions_applicant_response.Where(x => x.applicant_id == UserID).ToList();
            var allQuestions = db.gte_questions_master.ToList();
            ViewState["QuestionsCount"] = allQuestions.Count;
            ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
            Session["allQuestions"] = allQuestions;

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
                    applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();
                else
                    applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();

                if(applicantdetails != null)
                {
                    if (applicantdetails.nationality > 0)
                        ViewState["nationality"] = objCommon.GetCountryDiscription(applicantdetails.nationality);
                    var institutionDetails = db.university_master.Where(x => x.universityid == UniversityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();

                    if (institutionDetails != null)
                    {
                        ViewState["eduInstitution"] = institutionDetails.university_name;
                        ViewState["eduCity"] = institutionDetails.cityName;
                    }

                    if (isFullService)
                    {
                        if (applicantdetails.issameaspostal == 1)
                        {
                            if (applicantdetails.postalcountry > 0)
                                ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.postalcountry);
                        }
                        else if (applicantdetails.issameaspostal == 2)
                        {
                            if (applicantdetails.residentialcountry > 0)
                                ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                        }
                        else
                            ViewState["homeCountry"] = string.Empty;
                    }
                    else
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residencecountry);

                    SetQuestionList(answeredQuestion);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete profile information. Please complete profile before proceeding.')", true);
                    Response.Redirect("default.aspx", true);
                }
            }
        }
    }

    private void SetQuestionList(List<gte_questions_applicant_response> allResponseList)
    {
        try
        {
            var questions = (List<gte_questions_master>)Session["allQuestions"];
            var answers = db.gte_answer_master.ToList();

            if (answers != null)
            {
                var answersGroup = answers.GroupBy(x => x.gte_question_id);
                int questionsCount = questions.Count;
                int answersGroupCount = answersGroup.Count();
                if (answersGroup != null && questionsCount != answersGroupCount)
                    questions.RemoveRange(answersGroupCount, questions.Count - answersGroupCount);
            }

            if (allResponseList != null)
            {
                foreach (var response in allResponseList)
                {
                    questions.RemoveAll(x => x.id == response.gte_question_id);
                    answers.RemoveAll(x => x.gte_question_id == response.gte_question_id);
                }
            }

            Session["allQuestions"] = questions;
            Session["allAnswers"] = answers;
            bindDataList();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private string AddContentInText(string text)
    {
        if (text.Contains("#HomeCountry#"))
            text = text.Replace("#HomeCountry#", Convert.ToString(ViewState["homeCountry"]));
        if (text.Contains("#City#"))
            text = text.Replace("#City#", Convert.ToString(ViewState["eduCity"]));
        if (text.Contains("#Nationality#"))
            text = text.Replace("#Nationality#", Convert.ToString(ViewState["nationality"]));
        if (text.Contains("#EducationalInstitution#"))
            text = text.Replace("#EducationalInstitution#", Convert.ToString(ViewState["eduInstitution"]));
        
        return text;
    }

    public int Randomize(int limit)
    {
        return new Random().Next(0, limit);
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

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int questionId = 0;
        var allQuestions = (List<gte_questions_master>)Session["allQuestions"];
        var allAnswers = (List<gte_answer_master>)Session["allAnswers"];
        try
        {
            foreach (DataListItem item in questionList.Items)
            {
                Label question = (Label)item.FindControl("lblno");
                questionId = Convert.ToInt32(question.Text);
                int response_time = Convert.ToInt32(hidTime.Value);

                bool responseInsertedForQuestion = db.gte_questions_applicant_response.Any(x => x.applicant_id == UserID && x.university_id == UniversityID && x.gte_question_id == questionId);
                if (!responseInsertedForQuestion)
                {
                    RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                    RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");
                    RadioButton rdAnswer3 = (RadioButton)item.FindControl("rdoans3");
                    RadioButton rdAnswer4 = (RadioButton)item.FindControl("rdoans4");
                    RadioButton rdAnswer5 = (RadioButton)item.FindControl("rdoans5");
                    RadioButton rdAnswer6 = (RadioButton)item.FindControl("rdoans6");
                    gte_questions_applicant_response answer = new gte_questions_applicant_response();

                    if (rdAnswer1.Checked)
                    {
                        Label lblAnswer = (Label)item.FindControl("lblAnswerID_0");
                        answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    }
                    else if (rdAnswer2.Checked)
                    {
                        Label lblAnswer = (Label)item.FindControl("lblAnswerID_1");
                        answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    }
                    else if (rdAnswer3.Checked)
                    {
                        Label lblAnswer = (Label)item.FindControl("lblAnswerID_2");
                        answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    }
                    else if (rdAnswer4.Checked)
                    {
                        Label lblAnswer = (Label)item.FindControl("lblAnswerID_3");
                        answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    }
                    else if (rdAnswer5.Checked)
                    {
                        Label lblAnswer = (Label)item.FindControl("lblAnswerID_4");
                        answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    }
                    else if (rdAnswer6.Checked)
                    {
                        Label lblAnswer = (Label)item.FindControl("lblAnswerID_5");
                        answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    }

                    answer.applicant_id = UserID;
                    answer.gte_question_id = questionId;
                    answer.applicant_response_time = response_time;
                    answer.university_id = UniversityID;

                    db.gte_questions_applicant_response.Add(answer);
                    db.SaveChanges();
                }
                    
                allAnswers.RemoveAll(x => x.gte_question_id == questionId);
                allQuestions.RemoveAll(x => x.id == questionId);
                
            }

            if (allQuestions.Count > 0)
            {
                Session["allQuestions"] = allQuestions;
                Session["allAnswers"] = allAnswers;
                bindDataList();
            }
            else
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "Thank you for answering all GTE questions in this part.";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindDataList()
    {
        try
        {
            var allQuestions = (List<gte_questions_master>)Session["allQuestions"];
            var allAnswers = (List<gte_answer_master>)Session["allAnswers"];

            allQuestions = Randomize(allQuestions);
            int questionId = allQuestions.ElementAt(0).id;

            string question = AddContentInText(allQuestions.Where(x => x.id == questionId).FirstOrDefault().question);

            var answerList = allAnswers.Where(x => x.gte_question_id == questionId).ToList();
            answerList = Randomize(answerList);

            var sourceObj = new
            {
                id = questionId,
                question = AddContentInText(question),
                option0 = AddContentInText(answerList[0].answer),
                answerId0 = answerList[0].id,
                option1 = AddContentInText(answerList[1].answer),
                answerId1 = answerList[1].id,
                option2 = AddContentInText(answerList[2].answer),
                answerId2 = answerList[2].id,
                option3 = AddContentInText(answerList[3].answer),
                answerId3 = answerList[3].id,
                option4 = AddContentInText(answerList[4].answer),
                answerId4 = answerList[4].id,
                option5 = AddContentInText(answerList[5].answer),
                answerId5 = answerList[5].id,
            };

            questionList.DataSource = new[] { sourceObj };
            questionList.DataBind();

            ViewState["AnsweredQuestionCount"] = Convert.ToInt32(ViewState["AnsweredQuestionCount"]) + 1;
            Session["allQuestions"] = allQuestions;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}