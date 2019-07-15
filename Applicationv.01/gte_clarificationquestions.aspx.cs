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
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        UserID = objUser.studentid;

        // TODO: Uncomment else if block after adding gteQuestionAnswered Flag in gte_question part 2.

        if (!IsPostBack)
        {
            var gteQuestionsAnswered = db.gte_progressbar.Where(x => x.applicant_id == UserID).Select(x => x.is_gte_question_completed).FirstOrDefault();
            if (!gteQuestionsAnswered.Value) // Condition for checking gte Questions flag
                displayLabel("GTE Question Part 2 not completed. Please answer all GTE Questions before completing this section.");
            else
            {
                var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID).ToList();
                var clarification_questionsList = db.gte_clarification_questionmaster.ToList();

                foreach (var item in applicant_response)
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

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