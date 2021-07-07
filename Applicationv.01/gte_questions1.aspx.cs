using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_questions1 : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
    int UniversityID = -1;
    //public static int totalResponseTime = 0;
    int formId = 0;
    public static int QuestionsCount = 0;
    public static int Clarification_QuestionsCount = 0;
    public int pagecount = 0;
    string username = string.Empty;
    string useremail = string.Empty;
    public string headingtxt = "GTE Evaluation";

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

        if (Session["totalResponseTime"] == null)
            Session["totalResponseTime"] = db.gte_questions_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID)
                                             .Select(x => x.applicant_response_time).DefaultIfEmpty(0).Sum();
        var data = Session["totalResponseTime"];
        if (Session["totalResponseTimeQue2"] == null)
            Session["totalResponseTimeQue2"] = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID)
                                             .Select(x => x.response_time).DefaultIfEmpty(0).Max();

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);


        var Isdetailscompleted = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.Isdetailscompleted).FirstOrDefault();
        if (Isdetailscompleted == false)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Incomplete profile information. Please complete profile before proceeding.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        }
        var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
        if (!isGteDeclarationDoneByApplicant)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Incomplete GTE declaration.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
            return;
        }
        //if set to certification

        var IsgteCertificatGenrated = db.gte_progressbar.Where(x => x.applicantid == UserID && x.universityId == UniversityID).Select(x => x.is_gte_certificate_generated).FirstOrDefault();
        if (IsgteCertificatGenrated == false || IsgteCertificatGenrated == null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Incomplete Certification. Please complete GTE Certification .');window.location='" + Request.ApplicationPath + "default.aspx';", true);
            return;
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



        //schedule meeting otp verified check code
        var scheduledate = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && (x.is_meetingtime_expires == null || x.is_meetingtime_expires == false)).FirstOrDefault();

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
        allfaqQuestion = objCommon.FaqQuestionList(Request.QueryString["formid"], UniversityID);

        if (!IsPostBack)
        {
            objCommon.BindCountries(ddlcountry, false);
            BindAge();
            var answeredQuestion = db.gte_questions_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
            var allQuestions = db.gte_questions_master.ToList();
            ViewState["QuestionsCount"] = allQuestions.Count;
            ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
            if (answeredQuestion.Count > 0)
                Session["totalResponseTime"] = answeredQuestion.Sum(x => x.applicant_response_time);
            Session["allQuestions"] = allQuestions;

            if (answeredQuestion.Count == allQuestions.Count)
            {
                pagecount = 2;
                questions2.Attributes.Add("style", "display:block;");
                questions.Attributes.Add("style", "display:none;");
                callQuestion2();
            }
            else
            {
                dynamic applicantdetails;
                int isFullService = (int)Session["FullService"];
                bool? Isold_or_new_applicant = objCommon.GetIS_oldOrNew_applicant(UserID);

                if (Isold_or_new_applicant == true)
                    applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                else
                {
                    if (isFullService == 1)
                        applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                    else
                        applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                }
                if (applicantdetails != null)
                {
                    //var Countryapplyingtostudy = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.countryofeducationInstitution).FirstOrDefault();
                    if (applicantdetails.countryofeducationInstitution != null)
                        ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));

                    if (applicantdetails.nationality > 0)
                        ViewState["nationality"] = objCommon.GetCountryDiscription(applicantdetails.nationality);

                    if (applicantdetails.cityofeducationInstitution != null)
                        ViewState["eduCity"] = objCommon.GetCityName(applicantdetails.cityofeducationInstitution);

                    //var institutionDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();

                    //if (institutionDetails != null)
                    //{
                    //    ViewState["eduInstitution"] = institutionDetails.university_name;
                    //    //ViewState["eduCity"] = institutionDetails.cityName;
                    //}
                    if (applicantdetails.nameofuniversityappliedfor != null)
                        ViewState["eduInstitution"] = objCommon.GetUniversityName(applicantdetails.nameofuniversityappliedfor);
                    if (isFullService == 1)
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
                    {
                        if (Isold_or_new_applicant == true)
                            ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                        else
                            ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residencecountry);
                    }

                    SetQuestionList(answeredQuestion);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Incomplete profile information. Please complete profile before proceeding.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                pagecount = 1;
                questions.Attributes.Add("style", "display:block;");
                questions2.Attributes.Add("style", "display:none;");
                Session["totalResponseTimeQue2"] = 0;
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
        if (text.Contains("#ClickToKnowMore#"))
            text = text.Replace("#ClickToKnowMore#", "<lable id=lblClick style=\"color: DodgerBlue;\"> Click to know more </label>");
        if (text.Contains("#FirstName#"))
            text = text.Replace("#FirstName#", objCommon.GetApplicantFirstName(UserID));
        if (text.Contains("#Countryapplyingtostudy#"))
            text = text.Replace("#Countryapplyingtostudy#", Convert.ToString(ViewState["Countryapplyingtostudy"]));

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
                    Label lblAnswer = null;

                    if (rdAnswer1.Checked)
                        lblAnswer = (Label)item.FindControl("lblAnswerID_0");
                    else if (rdAnswer2.Checked)
                        lblAnswer = (Label)item.FindControl("lblAnswerID_1");
                    else if (rdAnswer3.Checked)
                        lblAnswer = (Label)item.FindControl("lblAnswerID_2");
                    else if (rdAnswer4.Checked)
                        lblAnswer = (Label)item.FindControl("lblAnswerID_3");
                    else if (rdAnswer5.Checked)
                        lblAnswer = (Label)item.FindControl("lblAnswerID_4");
                    else if (rdAnswer6.Checked)
                        lblAnswer = (Label)item.FindControl("lblAnswerID_5");

                    answer.gte_answer_id = Convert.ToInt32(lblAnswer.Text);
                    answer.applicant_id = UserID;
                    answer.gte_question_id = questionId;
                    answer.applicant_response_time = response_time;
                    answer.university_id = UniversityID;

                    db.gte_questions_applicant_response.Add(answer);
                    db.SaveChanges();

                    Session["totalResponseTime"] = (int)Session["totalResponseTime"] + response_time;
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
                callQuestion2();
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


    private void callQuestion2()
    {
        questions2.Attributes.Add("style", "display:block;");
        if (Session["totalResponseTimeQue2"] == null)
            Session["totalResponseTimeQue2"] = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID)
                                             .Select(x => x.response_time).DefaultIfEmpty(0).Max();
        allfaqQuestion = objCommon.FaqQuestionList(Request.QueryString["formid"], UniversityID);
        var answeredQuestion = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
        var allQuestions2 = db.gte_question_master_part2.ToList();
        ViewState["QuestionsCount"] = allQuestions2.Count;
        ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
        if (answeredQuestion.Count > 0)
            Session["totalResponseTimeQue2"] = answeredQuestion.Max(x => x.response_time);
        if (answeredQuestion.Count == allQuestions2.Count)
        {
            //completedDiv.Visible = true;
            //completedDiv.Style.Remove("display");
            questions2.Visible = false;
            //lblCompleted.Text = "All questions have been answered in this part.";
            callClarificationQuestion();
        }
        else
        {
            dynamic applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault(); ;
            int isFullService = (int)Session["FullService"];
            //var institutionDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();
            //if (institutionDetails != null)
            //{
            //    //ViewState["eduInstitution"] = institutionDetails.university_name;
            //    //ViewState["eduCity"] = institutionDetails.cityName;
            //}
            if (applicantdetails.cityofeducationInstitution != null)
                ViewState["eduCity"] = objCommon.GetCityName(applicantdetails.cityofeducationInstitution);
            if (applicantdetails.nameofuniversityappliedfor != null)
                ViewState["eduInstitution"] = objCommon.GetUniversityName(applicantdetails.nameofuniversityappliedfor);
            bool? Isold_or_new_applicant = objCommon.GetIS_oldOrNew_applicant(UserID);
            if (applicantdetails != null)
            {
                if (applicantdetails.issameaspostal == 1)
                {
                    if (applicantdetails.postalcountry > 0)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.postalcountry);
                }
                else if (applicantdetails.issameaspostal == 2)
                {
                    if (applicantdetails.residentialcountry != null)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                }
                else
                    ViewState["homeCountry"] = string.Empty;

                ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
            }
            //if (Isold_or_new_applicant == true)
            //    applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            //else
            //{
            //    if (isFullService == 1)
            //        applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            //    else
            //        applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            //}

            //if (isFullService == 1)
            //{
            //    // applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();

            //    if (applicantdetails != null)
            //    {

            //        if (applicantdetails.issameaspostal == 1)
            //        {
            //            if (applicantdetails.postalcountry > 0)
            //                ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.postalcountry);
            //        }
            //        else if (applicantdetails.issameaspostal == 2)
            //        {
            //            if (applicantdetails.residentialcountry != null)
            //                ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
            //        }
            //        else
            //            ViewState["homeCountry"] = string.Empty;
            //    }
            //}
            //else
            //{
            //    //applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();
            //    if (applicantdetails != null)
            //    {
            //        if (Isold_or_new_applicant == true)
            //        {
            //            ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
            //            ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
            //        }
            //        else
            //        {
            //            ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residencecountry);
            //            ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
            //        }
            //    }
            //}

            if (applicantdetails == null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete profile information. Please complete profile before proceeding.')", true);
                Response.Redirect(webURL + "default.aspx", true);
            }

            foreach (var response in answeredQuestion)
                allQuestions2.RemoveAll(x => x.id == response.question_id);

            foreach (var item in allQuestions2)
                item.question = AddContentInText2(item.question);

            Session["allQuestions2"] = allQuestions2;
            bindDataList2();
        }
    }
    private void setSession()
    {
        dynamic applicantdetails;
        int isFullService = (int)Session["FullService"];
        //var institutionDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();
        //if (institutionDetails != null)
        //{
        //    ViewState["eduInstitution"] = institutionDetails.university_name;
        //    //ViewState["eduCity"] = institutionDetails.cityName;
        //}
        bool? Isold_or_new_applicant = objCommon.GetIS_oldOrNew_applicant(UserID);

        if (Isold_or_new_applicant == true)
            applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
        else
        {
            if (isFullService == 1)
                applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            else
                applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
        }
        if (applicantdetails.cityofeducationInstitution != null)
            ViewState["eduCity"] = objCommon.GetCityName(applicantdetails.cityofeducationInstitution);

        if (applicantdetails.nameofuniversityappliedfor != null)
            ViewState["eduInstitution"] = objCommon.GetUniversityName(applicantdetails.nameofuniversityappliedfor);
        if (isFullService == 1)
        {
            //applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();

            if (applicantdetails != null)
            {

                if (applicantdetails.issameaspostal == 1)
                {
                    if (applicantdetails.postalcountry > 0)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.postalcountry);
                }
                else if (applicantdetails.issameaspostal == 2)
                {
                    if (applicantdetails.residentialcountry != null)
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                }
                else
                    ViewState["homeCountry"] = string.Empty;
            }
        }
        else
        {
            //applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (applicantdetails != null)
            {
                if (Isold_or_new_applicant == true)
                {
                    ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                    ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
                }
                else
                {
                    ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residencecountry);
                    ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
                }

            }
        }

        if (applicantdetails == null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete profile information. Please complete profile before proceeding.')", true);
            Response.Redirect(webURL + "default.aspx", true);
        }
    }
    private string AddContentInText2(string text)
    {
        if (text.Contains("#HomeCountry#"))
            text = text.Replace("#HomeCountry#", Convert.ToString(ViewState["homeCountry"]));
        if (text.Contains("#City#"))
            text = text.Replace("#City#", Convert.ToString(ViewState["eduCity"]));
        if (text.Contains("#Country_where_I_intend_to_study#"))
            text = text.Replace("#Country_where_I_intend_to_study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Country_I_am_applying_to_Study#"))
            text = text.Replace("#Country_I_am_applying_to_Study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Country_where_I intend_to_study#"))
            text = text.Replace("#Country_where_I intend_to_study#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        if (text.Contains("#Education_Institution#"))
            text = text.Replace("#Education_Institution#", Convert.ToString(ViewState["eduInstitution"]));
        if (text.Contains("#Countryapplyingtostudy#"))
            text = text.Replace("#Countryapplyingtostudy#", Convert.ToString(ViewState["Countryapplyingtostudy"]));
        return text;
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

    private void bindDataList2()
    {
        try
        {
            var allQuestions2 = (List<gte_question_master_part2>)Session["allQuestions2"];

            allQuestions2 = Randomize2(allQuestions2);
            QuestionsCount = 5;
            if (allQuestions2.Count < 5)
                QuestionsCount = allQuestions2.Count;

            questionList2.DataSource = allQuestions2.Take(QuestionsCount);
            questionList2.DataBind();

            int answeredQuestionCount = Convert.ToInt32(ViewState["AnsweredQuestionCount"]) + 1;
            if (QuestionsCount % 5 == 0)
                ViewState["Display"] = answeredQuestionCount.ToString() + " - " + (answeredQuestionCount + 4).ToString();
            else
                ViewState["Display"] = answeredQuestionCount.ToString() + " - " + (answeredQuestionCount + QuestionsCount - 1).ToString();

            ViewState["AnsweredQuestionCount"] = Convert.ToInt32(ViewState["AnsweredQuestionCount"]) + QuestionsCount;
            Session["allQuestions2"] = allQuestions2;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
        int questionId = 0;
        var allQuestions2 = (List<gte_question_master_part2>)Session["allQuestions2"];
        try
        {
            List<int> IDList = new List<int>();
            foreach (DataListItem item in questionList2.Items)
            {
                Label question = (Label)item.FindControl("lblno2");
                questionId = Convert.ToInt32(question.Text);
                int responsetime = Convert.ToInt32(hidTime2.Value);

                bool responseInsertedForQuestion = db.gte_question_part2_applicant_response.Any(x => x.applicant_id == UserID && x.university_id == UniversityID && x.question_id == questionId);
                if (!responseInsertedForQuestion)
                {
                    RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans12");
                    RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans22");

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
                                recordID.response_time = (int)Session["totalResponseTimeQue2"] + responsetime;
                                db.SaveChanges();
                            }
                            Session["totalResponseTimeQue2"] = (int)Session["totalResponseTimeQue2"] + responsetime;
                        }
                    }
                }

                allQuestions2.RemoveAll(x => x.id == questionId);
            }

            if (allQuestions2.Count > 0)
            {
                Session["allQuestions2"] = allQuestions2;
                bindDataList2();
            }
            else
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions2.Visible = false;

                var clarification_questionsList = db.gte_clarification_questionmaster.ToList();
                var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
                foreach (var item in applicant_response)
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

                if (clarification_questionsList.Count == 0)
                    lblCompleted.Text = "Thank you for answering all GTE questions in this part.";
                else
                    callClarificationQuestion();
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                //    "alert('Thank you for answering all GTE questions in this part.');window.location='" + Request.ApplicationPath + "gte_clarificationquestions.aspx?formid=24';", true);

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void callClarificationQuestion()
    {
        try
        {
            headingtxt = "Clarification Questions";
            clarity.Attributes.Add("style", "display:block;");
            lblmsg.Visible = false;
            //dynamic applicantdetails;
            int isFullService = (int)Session["FullService"];
            //var institutionDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();
            //if (institutionDetails != null)
            //{
            //    ViewState["eduInstitution"] = institutionDetails.university_name;
            //    //ViewState["eduCity"] = institutionDetails.cityName;
            //}
            dynamic applicantdetails;
            bool? Isold_or_new_applicant = objCommon.GetIS_oldOrNew_applicant(UserID);

            if (Isold_or_new_applicant == true)
                applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            else
            {
                if (isFullService == 1)
                    applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                else
                    applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            }
            if (applicantdetails.cityofeducationInstitution != null)
                ViewState["eduCity"] = objCommon.GetCityName(applicantdetails.cityofeducationInstitution);
            if (applicantdetails.nameofuniversityappliedfor != null)
                ViewState["eduInstitution"] = objCommon.GetUniversityName(applicantdetails.nameofuniversityappliedfor);
            if (isFullService == 1)
            {
                //var applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();

                if (applicantdetails != null)
                {

                    if (applicantdetails.issameaspostal == 1)
                    {
                        if (applicantdetails.postalcountry > 0)
                            ViewState["homeCountry"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.postalcountry));
                    }
                    else if (applicantdetails.issameaspostal == 2)
                    {
                        if (applicantdetails.residentialcountry != null)
                            ViewState["homeCountry"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.residentialcountry));
                    }
                    else
                        ViewState["homeCountry"] = string.Empty;
                }
            }
            else
            {
                // gte_applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();
                if (applicantdetails != null)
                {
                    if (Isold_or_new_applicant == true)
                    {
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residentialcountry);
                        ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
                    }
                    else
                    {
                        ViewState["homeCountry"] = objCommon.GetCountryDiscription(applicantdetails.residencecountry);
                        ViewState["Countryapplyingtostudy"] = objCommon.GetCountryDiscription(Convert.ToInt32(applicantdetails.countryofeducationInstitution));
                    }
                }
            }

            //if (applicantdetails == null)
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete profile information. Please complete profile before proceeding.')", true);
            //    Response.Redirect(webURL + "default.aspx", true);
            //}
            var gteQuestionPart2Count = db.gte_question_master_part2.Count();
            var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();

            if (applicant_response == null)
                Response.Redirect(webURL + "default.aspx", true);
            var details = new gte_applicantdetails();
            if (applicant_response.Count != gteQuestionPart2Count) // Condition for checking gte Questions Part 2 completed
                displayLabel("GTE Question Part 2 not completed. Please answer all GTE Questions part 2 before attempting this section.");
            else
            {
                int isFullService1 = (int)Session["FullService"];
                if (isFullService1 == 1)
                {
                    var applicant_details = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                    var application_details = db.applicationmaster.Where(x => x.applicantid == UserID && x.universityid == UniversityID && x.preferenceid.Value == 1).FirstOrDefault();

                    if (applicant_details == null || application_details == null)
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incomplete student or application details. Please complete both before proceeding'); window.location='" + webURL + "default.aspx';", true);
                    else
                    {
                        details.highestqualificationfield = applicant_details.fieldofhigheststudy.HasValue ? applicant_details.fieldofhigheststudy.Value : 1;
                        details.fieldofstudyapplied = application_details.majorofdiscipline.HasValue ? application_details.majorofdiscipline.Value : 1;
                        details.highestqualifiactionachieved = applicant_details.higheststudycompleted.HasValue ? applicant_details.higheststudycompleted.Value.ToString() : "1";
                        details.levelofcourse = application_details.coursetype.HasValue ? application_details.coursetype.Value : 1;
                    }
                }
                else if (isFullService1 == 0)
                {
                    //bool Isold_or_new_applicant = objCommon.GetIS_oldOrNew_applicant(UserID);
                    if (Isold_or_new_applicant == true)
                    {
                        var data = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                    }
                    else
                        details = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                }
                if (details != null)
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
                    //if (details.highestqualificationfield.Value != details.fieldofstudyapplied.Value)
                    //    clarification_questionsList.Add(section1_clarification_questionList.Where(x => x.action == "Display Field of study clarification").FirstOrDefault());

                    // For adding level of study clarification question
                    var applicantData = new applicantdetails();

                    int selectedHighestQualification, maritalstatus;
                    int selectedAppliedQualification, levelofcourse;
                    string highestqualifiactionachieved;

                    if (Isold_or_new_applicant == true)
                    {

                        applicantData = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();

                        if (applicantData.Iscurrentlyworking != null && applicantData.Iscurrentlyworking == 1)
                        {
                            var data = section1_clarification_questionList.Where(x => x.action == "Ifcurrently_working").FirstOrDefault();
                            if (data != null)
                                clarification_questionsList.Add(data);
                        }
                        if (applicantData.Isjoboffered != null && applicantData.Isjoboffered == 1)
                        {
                            var data = section1_clarification_questionList.Where(x => x.action == "Ifjob_offer").FirstOrDefault();
                            if (data != null)
                                clarification_questionsList.Add(data);
                        }

                        levelofcourse = Convert.ToInt32(applicantData.levelofcourse);
                        highestqualifiactionachieved = applicantData.highestqualifiactionachieved;
                        selectedHighestQualification = Convert.ToInt32(applicantData.highestqualifiactionachieved);
                        selectedAppliedQualification = Convert.ToInt32(applicantData.levelofcourse);
                        maritalstatus = Convert.ToInt32(applicantData.maritalstatus);
                    }
                    else
                    {
                        if (details.Iscurrentlyworking != null && details.Iscurrentlyworking == 1)
                        {
                            var data = section1_clarification_questionList.Where(x => x.action == "Ifcurrently_working").FirstOrDefault();
                            if (data != null)
                                clarification_questionsList.Add(data);
                        }
                        if (details.Isjoboffered != null && details.Isjoboffered == 1)
                        {
                            var data = section1_clarification_questionList.Where(x => x.action == "Ifjob_offer").FirstOrDefault();
                            if (data != null)
                                clarification_questionsList.Add(data);
                        }

                        levelofcourse = Convert.ToInt32(applicantData.levelofcourse);
                        highestqualifiactionachieved = applicantData.highestqualifiactionachieved;
                        selectedHighestQualification = Convert.ToInt32(details.highestqualifiactionachieved);
                        selectedAppliedQualification = Convert.ToInt32(details.levelofcourse);
                        maritalstatus = Convert.ToInt32(details.maritalstatus);

                    }

                    if (maritalstatus == 3)
                    {
                        question39.Attributes.Add("style", "display:block;");
                        question40.Attributes.Add("style", "display:block;");
                    }
                    if (maritalstatus == 1 || maritalstatus == 5)
                        question41.Attributes.Add("style", "display:none;");
                    else
                        question41.Attributes.Add("style", "display:block;");

                    var levelodstudy_systemlevel = objCommon.GetStudy_systemlevel(Convert.ToInt32(levelofcourse)) - objCommon.GetStudy_systemlevel(Convert.ToInt32(highestqualifiactionachieved));
                    if (levelodstudy_systemlevel <= -2)
                    {
                        var data = section1_clarification_questionList.Where(x => x.action == "auto10").FirstOrDefault();
                        if (data != null)
                            clarification_questionsList.Add(data);
                    }
                    else if (-2 < levelodstudy_systemlevel && levelodstudy_systemlevel < 1)
                    {
                        var data = section1_clarification_questionList.Where(x => x.action == "auto11").FirstOrDefault();
                        if (data != null)
                            clarification_questionsList.Add(data);
                    }
                    else if (levelodstudy_systemlevel == 0)
                    {
                        var data = section1_clarification_questionList.Where(x => x.action == "auto12").FirstOrDefault();
                        if (data != null)
                            clarification_questionsList.Add(data);
                    }


                    var levelofocde_selectedHighestQualification = db.studylevelmaster.Where(x => x.studylevelid == selectedHighestQualification).Select(x => x.levelofcode).FirstOrDefault();
                    if (levelofocde_selectedHighestQualification != null)
                    {
                        var highestQualificationAchievedLevel = db.studylevelmaster
                                                             .Where(x => x.studylevelid == selectedHighestQualification).ToList()
                                                             .Select(x => Convert.ToInt32(Regex.Replace(x.levelofcode, "[^0-9]+", string.Empty))).FirstOrDefault();

                        var levelofocde = db.studylevelmaster.Where(x => x.studylevelid == selectedAppliedQualification).Select(x => x.levelofcode).FirstOrDefault();

                        if (levelofocde != null)
                        {
                            var appliedQualificationLevel = db.studylevelmaster
                                                          .Where(x => x.studylevelid == selectedAppliedQualification).ToList()
                                                          .Select(x => Convert.ToInt32(Regex.Replace(x.levelofcode, "[^0-9]+", string.Empty))).FirstOrDefault();

                            if (!(highestQualificationAchievedLevel > 17 || appliedQualificationLevel > 17)) // Hard coded for removing values not to be considered in study level master table
                            {
                                if (highestQualificationAchievedLevel > appliedQualificationLevel)
                                {// For adding level of study clarification question
                                    var data = section1_clarification_questionList.Where(x => x.action == "Display level of study clarification").FirstOrDefault();
                                    if (data != null)
                                        clarification_questionsList.Add(data);
                                }
                            }
                        }
                    }

                    var applicantdetails1 = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                    //if (applicantdetails1.broadFieldID != null && applicantdetails1.broadFieldID == 12 && applicantdetails1.narrowFieldID != null && applicantdetails1.narrowFieldID == 68 && (applicantdetails1.broadFieldID != applicantdetails1.broadFieldIDyouwillComplete))
                    //{
                    //    var data = section1_clarification_questionList.Where(x => x.action == "auto16").FirstOrDefault();
                    //    if (data != null)
                    //        clarification_questionsList.Add(data);
                    //}
                    //auto 16
                    if (applicantdetails.broadFieldID != 12)
                    {
                        if (applicantdetails.narrowFieldID != 68)
                        {
                            if (applicantdetails.broadFieldID != applicantdetails.broadFieldIDyouwillComplete)
                            {
                                var data = section1_clarification_questionList.Where(x => x.action == "auto16").FirstOrDefault();
                                if (data != null)
                                    clarification_questionsList.Add(data);
                            }
                        }
                    }

                    //auto 17
                    if (applicantdetails.broadFieldID != 12)
                    {
                        if (applicantdetails.narrowFieldID != 68)
                        {
                            if (applicantdetails.narrowFieldID != applicantdetails.narrowFieldIDyouwillComplete)
                            {
                                var data = section1_clarification_questionList.Where(x => x.action == "auto17").FirstOrDefault();
                                if (data != null)
                                    clarification_questionsList.Add(data);
                            }
                        }                        
                    }

                    //if (applicantdetails1.broadFieldID != null && applicantdetails1.broadFieldID == 12 && applicantdetails1.narrowFieldID != null && applicantdetails1.narrowFieldID == 68 && (applicantdetails1.narrowFieldID != applicantdetails1.narrowFieldIDyouwillComplete))
                    //{
                    //    var data = section1_clarification_questionList.Where(x => x.action == "auto17").FirstOrDefault();
                    //    if (data != null)
                    //        clarification_questionsList.Add(data);
                    //}



                    if (clarificationansweredQuestion.Count >= clarification_questionsList.Count)
                        displayLabel("Assessment Completed at "+ Convert.ToDateTime(applicantdetails1.Is_clarification_submitted_date).ToString("dd-MM-yyyy"));
                    else
                        foreach (var item in clarificationansweredQuestion)
                            clarification_questionsList.RemoveAll(x => x.id == item.clarification_question_id);

                    //Auto 



                    if (clarification_questionsList.Count == 0)
                        displayLabel("Completed");
                    else
                    {
                        //AddContentInText2
                        foreach (var item in clarification_questionsList)
                        {
                            if (item != null)
                                item.clarification_question = AddContentInText2(item.clarification_question);
                        }


                        Clarification_QuestionsCount = clarification_questionsList.Count;
                        clarificationList.DataSource = clarification_questionsList;
                        clarificationList.DataBind();
                    }
                }
                else
                    displayLabel("GTE Personal Details not completed. Please provide Personal Details before attempting this section.");
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void sendEmailsClarificationNotification(List<gte_clarification_questionmaster> sendEmailQuestionList)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == UserID).Select(x => x.email).FirstOrDefault();
            var name = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.firstname).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, x.logo }).FirstOrDefault();

            foreach (var question in sendEmailQuestionList)
            {
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_clarificationquestionNotification.html"));
                html = html.Replace("@UniversityName", universitydetails.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + UniversityID + "/" + universitydetails.logo);
                html = html.Replace("@applicantFirstname", name);
                objCommon.SendMail(studentEmailAddress, html, "GTE Clarification Question Notification");

                saveClarificationResponse(question.id, "Email Sent");
            }
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    protected void btnsubmit_Click1(object sender, EventArgs e)
    {
        int questionId = 0;
        try
        {
            foreach (DataListItem item in clarificationList.Items)
            {
                Label labelId = (Label)item.FindControl("lblno");
                questionId = Convert.ToInt32(labelId.Text);
                System.Web.UI.HtmlControls.HtmlTextArea response = (System.Web.UI.HtmlControls.HtmlTextArea)item.FindControl("txtResponse");
                saveClarificationResponse(questionId, response.Value.Trim());
            }
            if (txtdob.Value != null && txtdob.Value != "")
                saveClarificationResponse(39, Convert.ToDateTime(txtdob.Value).ToString("dd-MM-yyyy"));
            if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0")
                saveClarificationResponse(40, ddlcountry.SelectedValue);
            if (ddldependents.SelectedValue != null && ddldependents.SelectedValue != "0")
                saveClarificationResponse(41, ddldependents.SelectedValue);
            if (txtquestion42.Value != null && txtquestion42.Value != string.Empty)
                saveClarificationResponse(42, txtquestion42.Value.Trim());

            var mode = "new";
            applicantdetails objdetails = new applicantdetails();
            var applicantdetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicantdetails != null)
            {
                mode = "update";
                objdetails = applicantdetails;
            }
            objdetails.Is_clarification_submitted = true;
            objdetails.Is_clarification_submitted_date = DateTime.UtcNow;
            objdetails.gtereportNO = RandomAplhaNumericString();
            if (mode == "new")
                db.applicantdetails.Add(objdetails);
            db.SaveChanges();

            bool? Isold_or_new_applicant = objCommon.GetIS_oldOrNew_applicant(UserID);
            if (Isold_or_new_applicant == true)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering all clarification questions.');window.location='" + Request.ApplicationPath + "gte_sop_builder.aspx?formid=26';", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering all clarification questions.');window.location='" + Request.ApplicationPath + "gte_sop.aspx?formid=26';", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public static string RandomAplhaNumericString() // Generated Format  GTE-AR-ABC12345
    {
        const string chars = "ABC";
        Random random = new Random();
        int randomNumber = random.Next(0, 99999);
        string aplhaNumericNumber = "";
        string randomString = new string(Enumerable.Repeat(chars, 3).Select(s => s[random.Next(s.Length)]).ToArray());
        if (randomNumber < 10000)
            aplhaNumericNumber ="GTE-AR-"+ randomString + "0" + randomNumber.ToString();
        else
            aplhaNumericNumber = "GTE-AR-" + randomString + randomNumber.ToString();

        return aplhaNumericNumber;
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
            if (questionID == 39 || questionID == 40 || questionID == 41)
            {
                var mode = "new";
                applicantdetails objapplicant = new applicantdetails();
                var data = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                if (data != null)
                {
                    mode = "update";
                    data = objapplicant;
                }

                if (questionID == 39)
                    objapplicant.marriagedate = Convert.ToDateTime(response);
                else if (questionID == 40)
                    objapplicant.spousenationality = Convert.ToInt32(response);
                else if (questionID == 41)
                    objapplicant.noofdependence = response;

                if (mode == "new")
                    db.applicantdetails.Add(objapplicant);
                db.SaveChanges();
            }
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    private void BindAge()
    {
        try
        {
            var age = db.Number_of_dependents.ToList();
            ListItem lst = new ListItem("Please select", "0");
            ddldependents.DataSource = age;
            ddldependents.DataTextField = "description";
            ddldependents.DataValueField = "id";
            ddldependents.DataBind();
            ddldependents.Items.Insert(0, lst);
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }
}