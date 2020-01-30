﻿using System;
using System.Collections;
using System.Collections.Generic;
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
            var preliminaryQuestionList = db.gte_preliminary_section_questionmaster.AsNoTracking().ToList();
            foreach (DataListItem item in questionList.Items)
            {
                string SelectedValue = "";
                Label questionID = (Label)item.FindControl("lblno");                
                Label lblQuestion = (Label)item.FindControl("lblQuestion");                 
                RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");
                RadioButton rdStrongDisAgree = (RadioButton)item.FindControl("rdoans5");

                int questionId = Convert.ToInt32(questionID.Text);
                string correctAnswer = preliminaryQuestionList.FirstOrDefault(x => x.gte_questionID == questionId).correctanswer;

                if (rdAnswer1.Checked)
                {
                    SelectedValue = "answer1";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick1")).Style.Remove("display");
                    else
                        ((HtmlGenericControl)item.FindControl("incorrectTick1")).Style.Remove("display");
                }
                if (rdAnswer2.Checked)
                {
                    SelectedValue = "answer2";
                    if (SelectedValue == correctAnswer)
                        ((HtmlGenericControl)item.FindControl("correctTick2")).Style.Remove("display");
                    else
                        ((HtmlGenericControl)item.FindControl("incorrectTick2")).Style.Remove("display");
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
                Save(answer);            
            btnsubmit.Enabled = false;
            btnGoToNextPage.Enabled = true;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
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
        Response.Redirect(webURL + "gte_preliminaryquestion.aspx", true);
    }
}