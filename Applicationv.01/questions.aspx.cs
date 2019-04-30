using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data.Entity;

public partial class questions : System.Web.UI.Page
{
    List<int> QuestionList = new List<int>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        Session["Question"] = null;
        if (!IsPostBack)
        {
            GetQuestion();
            List<int> list = (List<int>)Session["QList"];
            if (list.Count > 0)
            {
                Binddatalist(0, list[0]);
                button.Visible = true;
                timer.Visible = true;
                message.Visible = false;
            }
            else
            {
                button.Visible = false;
                timer.Visible = false;
                message.Visible = true;
            }
            btnPrev.Enabled = false;
        }
        //ShowQuestions();
        //ShowQuestions();
    }




    //public List<T> Randomize<T>(List<T> list)
    //{
    //    List<T> randomizedList = new List<T>();
    //    Random rnd = new Random();
    //    while (list.Count > 0)
    //    {
    //        int index = rnd.Next(0, list.Count); //pick a random item from the master list
    //        randomizedList.Add(list[index]); //place it at the end of the randomized list
    //        list.RemoveAt(index);
    //    }
    //    return randomizedList;
    //}
    private void GetQuestion()
    {
        try
        {
            var QuestionsList = (from q in db.answermaster
                                 join s in db.applicantscores on q.answerid equals s.answerid
                                 where s.applicantid == UserID
                                 select new
                                 {
                                     answerId = q.answerid,
                                     description = q.answerdescription
                                 }).ToList().Distinct();

            foreach (var item in QuestionsList)
            {
                QuestionList.Add(item.answerId);
            }
            Session["QList"] = QuestionList;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    private void Binddatalist(int page, int QuestionID)
    {
        try
        {
            var PrimaryQuestion = (question_master)Session["QuestionOrder"];

            // int primaryQuestionID = PrimaryQuestion[page].questionid;
            int srNo = 0;
            if (page == 0)
                srNo = page + 1;
            else
                srNo = page;
            Session["srNo"] = srNo;
            var AnswerwithQuestion = (from q in db.answermaster

                                      where q.answerid == QuestionID

                                      select new
                                      {
                                          srNo = srNo,
                                          answerid = q.answerid,
                                          answerdescription = q.answerdescription,
                                          Answer1 = "STROGNLY AGREE",
                                          Answer2 = "AGREE",
                                          Answer3 = "NEITHER AGREE NOR DISAGREE",
                                          Answer4 = "DISAGREE",
                                          Answer5 = "STRONGLY DISAGREE",
                                      }).ToList();
            if (AnswerwithQuestion.Count > 0)
            {
                questionList.DataSource = AnswerwithQuestion;
                questionList.DataBind();
            }
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

                int SelectedValue = 5;
                Label questionID = (Label)item.FindControl("lblno");
                //  Label lblquestion = (Label)item.FindControl("lblquestion");
                Label lblPrimary = (Label)item.FindControl("lblPrimary");
                //Label Label1 = e.Item.FindControl("lblPrimary") as Label;
                RadioButton rdStrongAgrre = (RadioButton)item.FindControl("rdoans1");
                RadioButton rdAgree = (RadioButton)item.FindControl("rdoans2");
                RadioButton rdNiether = (RadioButton)item.FindControl("rdoans3");
                RadioButton rdDisAgree = (RadioButton)item.FindControl("rdoans4");
                RadioButton rdStrongDisAgree = (RadioButton)item.FindControl("rdoans5");

                if (rdStrongAgrre.Checked)
                {
                    SelectedValue = 2;
                }
                if (rdAgree.Checked)
                {
                    SelectedValue = 1;
                }
                if (rdNiether.Checked)
                {
                    SelectedValue = 0;
                }
                if (rdDisAgree.Checked)
                {
                    SelectedValue = -1;
                }

                if (rdStrongDisAgree.Checked)
                {
                    SelectedValue = -2;
                }
                if ((SelectedValue == 5) && (lblPrimary.Text != "1"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please give answer of question " + lblPrimary.Text + "')", true);
                    //Response.Write("alert(Please give answer of question " + lblquestion.Text + "");
                    break;
                }
                else
                {
                    answer.Add(questionID.Text, SelectedValue);

                }
                if (questionList.Items.Count == answer.Count)
                {
                    string messgae = Save(answer);
                    List<int> list = (List<int>)Session["QList"];
                    int PageNo = (int)Session["srNo"];
                    PageNo = PageNo + 1;
                    Session["Question"] = null;
                    if (PageNo - 1 == list.Count)
                        Response.Redirect("thankyou.aspx");
                    else
                        Binddatalist(PageNo, list[PageNo - 1]);
                    Session["srNo"] = PageNo;

                    if (PageNo == 1)
                    {
                        btnsubmit.Enabled = true;
                        btnPrev.Enabled = false;
                    }
                    else
                    {
                        btnsubmit.Enabled = true;
                        btnPrev.Enabled = true;
                    }
                    break;
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

            foreach (var val in key)
            {
                int PreviuosSavedValue = GetUserScore(UserID, Convert.ToInt32(val));
                if (PreviuosSavedValue == 5)
                {
                    int answerID = Convert.ToInt32(val);
                    var result = db.applicantscores.SingleOrDefault(b => b.answerid == answerID && b.applicantid == UserID);
                    result.applicantid = ApplicantID;
                    result.answerid = answerID;
                    result.answervalue = Convert.ToInt32(UserValues[val]);

                    db.SaveChanges();
                    message = "Thank you for particpating";
                }
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
        return message;
    }

    protected void questionList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            Label Label1 = e.Item.FindControl("lblPrimary") as Label;

            Label LabelsrNo = e.Item.FindControl("lblSrNo") as Label;
            Panel pnl = (Panel)e.Item.FindControl("options");
            Label lblQuestionID = e.Item.FindControl("lblno") as Label;
            RadioButton rdStrongAgrre = (RadioButton)e.Item.FindControl("rdoans1");
            RadioButton rdAgree = (RadioButton)e.Item.FindControl("rdoans2");
            RadioButton rdNiether = (RadioButton)e.Item.FindControl("rdoans3");
            RadioButton rdDisAgree = (RadioButton)e.Item.FindControl("rdoans4");
            RadioButton rdStrongDisAgree = (RadioButton)e.Item.FindControl("rdoans5");
            int PreviuosSavedValue = GetUserScore(UserID, Convert.ToInt32(lblQuestionID.Text));
            if (Session["SecondaryLang"] != null)
            {
                string SecondaryLang = Session["SecondaryLang"].ToString();
                string SecondaryLanugage = SecondaryLanugageAnswer(SecondaryLang, Convert.ToInt32(lblQuestionID.Text));
                if (SecondaryLanugage != "")
                    Label1.Text = Label1.Text + "(" + SecondaryLanugage + ")";
                var options = db.answeroptionssecondary.Where(x => x.secondaryfieldnamelanguage == SecondaryLang).ToList();
                for (int k = 0; k < options.Count; k++)
                {
                    switch (options[k].optionid)
                    {
                        case 1:
                            rdStrongAgrre.Text = rdStrongAgrre.Text + "( " + options[k].secondaryfieldnamevalue + ")";
                            break;
                        case 2:
                            rdAgree.Text = rdAgree.Text + "( " + options[k].secondaryfieldnamevalue + ")";
                            break;
                        case 3:
                            rdNiether.Text = rdNiether.Text + "( " + options[k].secondaryfieldnamevalue + ")";
                            break;
                        case 5:
                            rdStrongDisAgree.Text = rdStrongDisAgree.Text + "( " + options[k].secondaryfieldnamevalue + ")";
                            break;
                        case 4:
                            rdDisAgree.Text = rdDisAgree.Text + "( " + options[k].secondaryfieldnamevalue + ")";
                            break;
                        default:
                            break;
                    }


                    switch (PreviuosSavedValue)
                    {
                        case 1:
                            rdAgree.Checked = true;
                            break;
                        case 2:
                            rdStrongAgrre.Checked = true;
                            break;
                        case 0:
                            rdNiether.Checked = true;
                            break;
                        case -2:
                            rdStrongDisAgree.Checked = true;
                            break;
                        case -1:
                            rdDisAgree.Checked = true;
                            break;
                        default:
                            break;
                    }
                    if (Session["Question"] == null)
                    {
                        Session["Question"] = Label1.Text;
                        Label1.Text = Session["Question"].ToString();
                        if (Session["srNo"] != null)
                        {
                            LabelsrNo.Text = Session["srNo"].ToString();
                            // pnl.Visible = false;
                        }
                    }


                    else
                    {
                        //  pnl.Visible = true;
                        LabelsrNo.Text = "";
                        Label1.Text = "";
                        // LabelsrNo.Text = Session["srNo"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        try
        {
            List<int> list = (List<int>)Session["QList"];
            int PageNo = (int)Session["srNo"];
            PageNo = PageNo - 1;
            Session["Question"] = null;
            Binddatalist(PageNo, list[PageNo - 1]);
            Session["srNo"] = PageNo;
            btnPrev.Enabled = false;
            if (PageNo == list.Count)
            {
                btnsubmit.Enabled = false;
                btnPrev.Enabled = true;
            }
            else if (PageNo == 1)
            {
                btnsubmit.Enabled = true;
                btnPrev.Enabled = false;
            }
            else
            {
                btnsubmit.Enabled = true;
                btnPrev.Enabled = true;
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected int GetUserScore(int userID, int answerID)
    {
        int answervalue = 5;
        try
        {

            var answerbyQuestion = (from q in db.applicantscores.Where(q => q.applicantid == userID && q.answerid == answerID)

                                    select new
                                    {
                                        questionID = q.answerid,
                                        answerValue = q.answervalue
                                    }).FirstOrDefault();
            if ((answerbyQuestion != null) && (answerbyQuestion.answerValue != null))
                answervalue = (int)answerbyQuestion.answerValue;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
        return answervalue;

    }
    protected string SecondaryLanugageAnswer(string Lang, int answerID)
    {
        string SecondaryAnswer = "";
        try
        {

            answer_mastersecondarylanguage am = db.answer_mastersecondarylanguage.Where(x => x.secondaryfieldnamelanguage == Lang && x.answerid == answerID).FirstOrDefault();
            if (am != null)
                SecondaryAnswer = am.secondaryfieldnamevalue;
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
        return SecondaryAnswer;

    }
}