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
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            var answeredQuestion = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID).ToList();
            var allQuestions = db.gte_question_master_part2.ToList();

            if (answeredQuestion.Count == allQuestions.Count)
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "All questions have been answered in this part.";
            }
            else
            {
                var applicantdetails = db.applicantdetails.Where(x => x.universityid == UniversityID && x.applicantid == UserID).FirstOrDefault();

                if (applicantdetails.issameaspostal.HasValue && applicantdetails.issameaspostal.Value == 1)
                {
                    if (applicantdetails.postalcountry.HasValue)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.postalcountry.Value);
                }
                else if (applicantdetails.issameaspostal.HasValue && applicantdetails.issameaspostal.Value == 2)
                {
                    if (applicantdetails.residentialcountry.HasValue)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry.Value);
                }
                else
                    ViewState["homeCountry"] = string.Empty;

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
            foreach (DataListItem item in questionList.Items)
            {
                Label question = (Label)item.FindControl("lblno");
                questionId = Convert.ToInt32(question.Text);

                RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");

                if (rdAnswer1.Checked)
                {
                    gte_question_part2_applicant_response answer = new gte_question_part2_applicant_response()
                    {
                        applicant_id = UserID,
                        question_id = questionId,
                        applicant_response = true
                    };
                    db.gte_question_part2_applicant_response.Add(answer);
                }
                else if (rdAnswer2.Checked)
                {
                    gte_question_part2_applicant_response answer = new gte_question_part2_applicant_response()
                    {
                        applicant_id = UserID,
                        question_id = questionId,
                        applicant_response = false
                    };
                    db.gte_question_part2_applicant_response.Add(answer);
                }

                db.SaveChanges();
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
                var clarification_questionsList = db.gte_clarification_questionmaster.ToList();
                var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID).ToList();
                foreach (var item in applicant_response)
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

                if (clarification_questionsList.Count == 0)
                    lblCompleted.Text = "Thank you for answering all GTE questions in this part.";
                else
                    Response.Redirect(webURL + "gte_clarificationquestions.aspx");

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}