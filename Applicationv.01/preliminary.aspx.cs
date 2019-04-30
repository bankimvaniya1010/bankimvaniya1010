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
    List<preliminary_questionmaster> QuestionsList = new List<preliminary_questionmaster>();
    protected List<preliminaryvideomaster> VideoList = new List<preliminaryvideomaster>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    protected string Score, Results = "";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
        {
            VideoList = db.preliminaryvideomaster.Where(x => x.status == 1 && x.universityid== UniversityID).ToList();
            if(VideoList.Count==0)
                VideoList = db.preliminaryvideomaster.Where(x => x.status == 1).ToList();
            video.Visible = true;
            questions.Visible = false;
            results.Visible = false;
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
            QuestionsList = Randomize(QuestionsList);
            QuestionsList = QuestionsList.Skip(0).Take(5).ToList();
            Session["Questions"] = QuestionsList;
            questionList.DataSource = QuestionsList;
            questionList.DataBind();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnAnswer_Click(object sender, EventArgs e)
    {
        GetQuestion();
        video.Visible = false;
       
        questions.Visible = true;
        results.Visible = false;
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


                if (SelectedValue == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please give answer of question " + lblQuestion.Text + "')", true);
                    //Response.Write("alert(Please give answer of question " + lblquestion.Text + "");
                    break;
                }
                else
                {
                    answer.Add(questionID.Text, SelectedValue);

                }
                if (questionList.Items.Count == answer.Count)
                {
                    int count = Result(answer);
                    Score = (count * 100 / 5).ToString() + "%";
                    if (count >= 3)
                        Results = "You response was quite postive, You can proceed for further steps";
                    else
                        Results = "You response was not quite impressive, Sorry We can't proceed for further steps";
                    string messgae = Save(answer);

                 
                    video.Visible = false;
                    questions.Visible = false;
                    results.Visible = true;
                    // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + messgae + "')", true);
                }
            }
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