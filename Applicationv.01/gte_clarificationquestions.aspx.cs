using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_clarificationquestions : System.Web.UI.Page
{
    int UserID = 0;
    public static int QuestionsCount = 0;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    Common objCom = new Common();
    int UniversityID = -1;
    protected static List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        UserID = objUser.studentid;
      
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            var gteQuestionPart2Count = db.gte_question_master_part2.Count();
            var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();

            if (applicant_response == null)
                Response.Redirect(webURL + "default.aspx", true);

            if (applicant_response.Count != gteQuestionPart2Count) // Condition for checking gte Questions Part 2 completed
                displayLabel("GTE Question Part 2 not completed. Please answer all GTE Questions part 2 before attempting this section.");
            else
            {
                var details = new gte_applicantdetails();
                var isFullService = (bool)Session["FullService"];
                if (isFullService)
                {
                    var applicant_details = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                    var application_details = db.applicationmaster.Where(x => x.applicantid == UserID && x.universityid == UniversityID && x.preferenceid.Value == 1).FirstOrDefault();

                    if(applicant_details == null || application_details == null)
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete student or application details. Please complete both before proceeding'); window.location='" + webURL + "default.aspx';", true);
                    else
                    {
                        details.highestqualificationfield = applicant_details.fieldofhigheststudy.HasValue ? applicant_details.fieldofhigheststudy.Value : 1;
                        details.fieldofstudyapplied = application_details.majorofdiscipline.HasValue ? application_details.majorofdiscipline.Value : 1;
                        details.highestqualifiactionachieved = applicant_details.higheststudycompleted.HasValue ? applicant_details.higheststudycompleted.Value.ToString() : "1";
                        details.levelofcourse = application_details.coursetype.HasValue ? application_details.coursetype.Value.ToString() : "1";
                    }
                }
                else
                    details = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();

                if (details.highestqualificationfield != null)
                {
                    var clarification_questionsList = db.gte_clarification_questionmaster.ToList();
                    var clarificationansweredQuestion = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();

                    // Section 1 clarification questions
                    var section1_clarification_questionList = clarification_questionsList.Where(x => x.gte_master1_id == null && x.display_condition == null).ToList();
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == null && x.display_condition == null);

                    foreach (var item in applicant_response)
                        clarification_questionsList.RemoveAll(x => x.gte_master1_id.Value == item.question_id && x.display_condition.Value != item.applicant_response.Value);

                    if (clarification_questionsList.Any(x => x.action != null))
                    {
                        var sendEmailQuestion = clarification_questionsList.Where(x => x.action != null && x.action == "Send Email").ToList();
                        clarification_questionsList.RemoveAll(x => x.action != null && x.action == "Send Email");
                        foreach (var item in clarificationansweredQuestion)
                        {
                            if (!(sendEmailQuestion.Count > 0))
                                break;

                            sendEmailQuestion.RemoveAll(x => x.id == item.clarification_question_id);
                        }
                        clarificationansweredQuestion.RemoveAll(x => x.gte_clarification_questionmaster.action != null && x.gte_clarification_questionmaster.action == "Send Email");
                        if (sendEmailQuestion.Count > 0)
                            sendEmailsClarificationNotification(sendEmailQuestion);
                    }

                    // For adding field of study clarification question
                    if (details.highestqualificationfield.Value != details.fieldofstudyapplied.Value)
                        clarification_questionsList.Add(section1_clarification_questionList.Where(x => x.action == "Display Field of study clarification").FirstOrDefault());

                    // For adding level of study clarification question
                    var selectedHighestQualification = Convert.ToInt32(details.highestqualifiactionachieved);
                    var selectedAppliedQualification = Convert.ToInt32(details.levelofcourse);
                    var highestQualificationAchievedLevel = db.studylevelmaster
                                                              .Where(x => x.studylevelid == selectedHighestQualification).ToList()
                                                              .Select(x => Convert.ToInt32(Regex.Replace(x.levelofcode, "[^0-9]+", string.Empty))).FirstOrDefault();
                    var appliedQualificationLevel = db.studylevelmaster
                                                      .Where(x => x.studylevelid == selectedAppliedQualification).ToList()
                                                      .Select(x => Convert.ToInt32(Regex.Replace(x.levelofcode, "[^0-9]+", string.Empty))).FirstOrDefault();

                    if (!(highestQualificationAchievedLevel > 17 || appliedQualificationLevel > 17)) // Hard coded for removing values not to be considered in study level master table
                    {
                        if (highestQualificationAchievedLevel > appliedQualificationLevel) // For adding level of study clarification question
                            clarification_questionsList.Add(section1_clarification_questionList.Where(x => x.action == "Display level of study clarification").FirstOrDefault());
                    }

                    if (clarificationansweredQuestion.Count >= clarification_questionsList.Count)
                        displayLabel("All questions have been answered in this part");
                    else
                        foreach (var item in clarificationansweredQuestion)
                            clarification_questionsList.RemoveAll(x => x.id == item.clarification_question_id);

                    if (clarification_questionsList.Count == 0)
                        displayLabel("Completed");
                    else
                    {
                        QuestionsCount = clarification_questionsList.Count;
                        clarificationList.DataSource = clarification_questionsList;
                        clarificationList.DataBind();
                    }
                }
                else
                    displayLabel("GTE Personal Details not completed. Please provide Personal Details before attempting this section.");
            }
        }
    }

    private void sendEmailsClarificationNotification(List<gte_clarification_questionmaster> sendEmailQuestionList)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == UserID).Select(x => x.email).FirstOrDefault();
            var name = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.firstname).FirstOrDefault();
            StringBuilder sb = new StringBuilder();
            foreach (var question in sendEmailQuestionList)
            {
                sb.Clear();
                sb.Append("Dear " + name + ",<br/><br/>");
                sb.Append("Following your attempt to stage 2 assessment, we would like you to be notified regarding laws and regulation.<br/>");
                sb.Append(question.clarification_question + "<br/>");
                sb.Append("<br/> Thank You <br/>");
                sb.Append("The Application Center Admin Team <br/>");
                objCom.SendMail(studentEmailAddress, sb.ToString(), "Test Clarification Notification");

                saveClarificationResponse(question.id, "Email Sent");
            }
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
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
                saveClarificationResponse(questionId, response.Text);
            }

            //displayLabel("Thank you for answering all clarification questions.");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering all clarification questions.');window.location='" + Request.ApplicationPath + "gte_videoquestion.aspx';", true);
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

    private void saveClarificationResponse(int questionID, string response)
    {
        try
        {
            bool responseInsertedForQuestion = db.gte_clarification_applicantresponse.Any(x => x.applicant_id == UserID && x.university_id == UniversityID && x.clarification_question_id == questionID);
            if (!responseInsertedForQuestion)
            {
                gte_clarification_applicantresponse answer = new gte_clarification_applicantresponse()
                {
                    applicant_id = UserID,
                    clarification_question_id = questionID,
                    applicant_response = response,
                    university_id = UniversityID
                };

                db.gte_clarification_applicantresponse.Add(answer);
                db.SaveChanges();
            }
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }
}