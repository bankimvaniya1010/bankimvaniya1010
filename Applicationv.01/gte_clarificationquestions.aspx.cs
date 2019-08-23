using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_clarificationquestions : System.Web.UI.Page
{
    int UserID = 0;
    public static int QuestionsCount = 0;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        UserID = objUser.studentid;
      
        if (!IsPostBack)
        {
            var gteQuestionPart2Count = db.gte_question_master_part2.Count();
            var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID).ToList();

            if (applicant_response == null)
                Response.Redirect("default.aspx", true);

            if (applicant_response.Count != gteQuestionPart2Count) // Condition for checking gte Questions Part 2 completed
                displayLabel("GTE Question Part 2 not completed. Please answer all GTE Questions part 2 before attempting this section.");
            else
            {
                var clarification_questionsList = db.gte_clarification_questionmaster.ToList();
                var clarificationansweredQuestion = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == UserID).ToList();
               
                foreach (var item in applicant_response)
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

                if (clarificationansweredQuestion.Count >= clarification_questionsList.Count)
                    displayLabel("All questions have been answered in this part");

                if (clarification_questionsList.Count == 0)
                    displayLabel("Completed");
                else
                {
                    QuestionsCount = clarification_questionsList.Count;
                    clarificationList.DataSource = clarification_questionsList;
                    clarificationList.DataBind();
                }
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int questionId = 0;
        try
        {
            foreach (DataListItem item in clarificationList.Items)
            {
                Label labelId = (Label)item.FindControl("lblno");
                questionId = Convert.ToInt32(labelId.Text);

                TextBox response = (TextBox)item.FindControl("txtResponse");
                gte_clarification_applicantresponse answer = new gte_clarification_applicantresponse()
                {
                    applicant_id = UserID,
                    clarification_question_id = questionId,
                    applicant_response = response.Text
                };

                db.gte_clarification_applicantresponse.Add(answer);
                db.SaveChanges();
            }

            displayLabel("Thank you for answering all clarification questions.");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void displayLabel(string labelMsg)
    {
        completedDiv.Visible = true;
        completedDiv.Style.Remove("display");
        clarity.Visible = false;
        lblCompleted.Text = labelMsg;
    }
}