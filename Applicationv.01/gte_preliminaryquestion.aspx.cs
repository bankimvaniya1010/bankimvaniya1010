using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_preliminaryquestion : System.Web.UI.Page
{
    public static int QuestionsCount = 0;
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
        if (GlobalVariables.isGteDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            GetQuestion();
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
            var QuestionsList = (from um in db.university_master
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
                QuestionsList = (from pqm in db.preliminary_questionmaster
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
            var mode = "update";
            var gteProgressBar = db.gte_progressbar.Where(x => x.applicantid == UserID).FirstOrDefault();
            if (gteProgressBar == null)
            {
                mode = "new";
                gteProgressBar = new gte_progressbar();
                gteProgressBar.applicantid = UserID;
            }

            gteProgressBar.is_gte_question_completed = true;
            if (mode == "new")
                db.gte_progressbar.Add(gteProgressBar);
            db.SaveChanges();

            Response.Redirect(webURL + "gte_declaration.aspx", true);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}