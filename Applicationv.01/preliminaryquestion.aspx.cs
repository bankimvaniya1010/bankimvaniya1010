using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class preliminary : System.Web.UI.Page
{
    public static int QuestionsCount = 0; 
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected List<faq> allQuestions = new List<faq>();
    protected string Score, Results = "";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    applicantprogressbar applicantprogressbar = new applicantprogressbar();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isDeclarationDoneByApplicant = (bool)Session["DeclarationDoneByApplicant"];
        if (isDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            GetQuestion();
            allQuestions = objCom.FaqQuestionList();
            applicantprogressbar = db.applicantprogressbar.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicantprogressbar != null) {
                if (applicantprogressbar.question == 1)
                {                   
                    LabelMessage.Text = "All questions have been answered in this part.";
                    questions.Visible = false;
                }
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
    private void GetQuestion()
    {
        try
        {
          var  QuestionsList = (from um in db.university_master
                             join pqm in db.preliminary_questionmaster on um.universityid equals pqm.universityid
                             into combined
                             from x in combined.DefaultIfEmpty()
                             where x.universityid == UniversityID
                             select new
                             {
                                 preliminaryid = x.preliminaryid,
                                 question = x.question,
                                 answer1 = x.answer1,
                                 answer2 = x.answer2,
                                 answer3 = x.answer3,
                                 answer4 = x.answer4,
                             }).ToList();
            if (QuestionsList.Count == 0)
            {
                QuestionsList = (from  pqm in db.preliminary_questionmaster 
                                 select new
                                 {
                                     preliminaryid = pqm.preliminaryid,
                                     question = pqm.question,
                                     answer1 = pqm.answer1,
                                     answer2 = pqm.answer2,
                                     answer3 = pqm.answer3,
                                     answer4 = pqm.answer4,
                                 }).ToList();
            }
            QuestionsCount = QuestionsList.Count;
            QuestionsList = Randomize(QuestionsList);
            QuestionsList = QuestionsList.Skip(0).Take(5).ToList();
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
            Hashtable answer = new Hashtable();
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

                if (rdAnswer1.Checked)
                {
                    SelectedValue = "answer1";
                }
                if (rdAnswer2.Checked)
                {
                    SelectedValue = "answer2";
                }
                if (rdAnswer3.Checked)
                {
                    SelectedValue = "answer3";
                }
                if (rdAnswer4.Checked)
                {
                    SelectedValue = "answer4";
                }


                answer.Add(questionID.Text, SelectedValue);
            }

            var mode = "update";
            var applicantprogressbar = db.applicantprogressbar.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicantprogressbar == null)
            {
                mode = "new";
                applicantprogressbar = new applicantprogressbar();
                applicantprogressbar.universityid = UniversityID;
                applicantprogressbar.applicantid = UserID;
            }  
            
            applicantprogressbar.question = 1;
            if (mode == "new")
                db.applicantprogressbar.Add(applicantprogressbar);
            db.SaveChanges();

            string messgae = Save(answer);
            Response.Redirect(webURL + "applicantdeclaration.aspx", true);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private string Save(Hashtable UserValues)
    {
        string message = string.Empty;
        try
        {

            ICollection key = UserValues.Keys;
            preliminaryapplicantanswers objAnswer = new preliminaryapplicantanswers();
            foreach (var val in key)
            {
                int answerID = Convert.ToInt32(val);
                objAnswer.answer = UserValues[val].ToString();
                objAnswer.applicantid = UserID;
                objAnswer.preliminaryid = answerID;
                objAnswer.answersubmittedtime = DateTime.Now;
                db.preliminaryapplicantanswers.Add(objAnswer);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
        return message;
    }

    private int Result(Hashtable UserValues)
    {
        int correctAns = 0;
        try
        {
            var QuestionsList = (List<preliminary_questionmaster>)Session["Questions"];
            ICollection key = UserValues.Keys;

            foreach (var val in key)
            {
                int answerID = Convert.ToInt32(val);
                string Answer = UserValues[val].ToString();
                for (int k = 0; k < QuestionsList.Count; k++)
                {
                    if (QuestionsList[k].preliminaryid == answerID)
                    {
                        if (QuestionsList[k].correctanswer == Answer)
                        {
                            correctAns = correctAns + 1;
                            break;
                        }
                    }
                }

            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
        return correctAns;
    }
}