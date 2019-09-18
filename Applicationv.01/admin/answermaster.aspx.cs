using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class admin_answermaster : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindAnswer();
    }
    private void BindAnswer()
    {
        try
        {
            var QuestionList = (from a in db.answermaster

                                select new
                                {
                                    answerid = a.answerid,
                                    answerdescription = a.answerdescription,
                                    GTEQScore = a.gteqscore,
                                    riskQScore = a.riskqscore
                                }).ToList();
            if (QuestionList != null)
            {
                AnswerView.DataSource = QuestionList;
                AnswerView.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void AnswerView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        AnswerView.EditIndex = -1;
        BindAnswer();
    }

    protected void AnswerView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                answermaster objAnswer = new answermaster();

                TextBox txtgtqScore = (TextBox)AnswerView.FooterRow.FindControl("txtGTQFooter");
                TextBox txtriskqscore = (TextBox)AnswerView.FooterRow.FindControl("txtRiskQFooter");
                TextBox txtDescription = (TextBox)AnswerView.FooterRow.FindControl("txtDescriptionFooter");

                objAnswer.answerdescription = txtDescription.Text.Trim();
                if (txtgtqScore.Text != "")
                    objAnswer.gteqscore = Convert.ToInt32(txtgtqScore.Text.Trim());
                else
                    objAnswer.gteqscore = 0;
                if (txtriskqscore.Text != "")
                    objAnswer.riskqscore = Convert.ToInt32(txtriskqscore.Text.Trim());
                else
                    objAnswer.riskqscore = 0;



                db.answermaster.Add(objAnswer);
                db.SaveChanges();
                BindAnswer();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void AnswerView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in AnswerView.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }

    protected void AnswerView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            List<question_master> QuestionMaster = (from ques in db.question_master
                                                    orderby ques.questionid ascending
                                                    select ques).ToList();
            if ((e.Row.RowType == DataControlRowType.DataRow && AnswerView.EditIndex == e.Row.RowIndex) || (e.Row.RowType == DataControlRowType.Footer))
            {


                string selectedQuestion = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();
                Label Question = (e.Row.FindControl("lblQuestionEdit") as Label);
                if (Question != null)
                    selectedQuestion = Question.Text;

            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    protected void AnswerView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int answerid = Convert.ToInt32(AnswerView.DataKeys[e.RowIndex].Values[0]);
            answermaster am = db.answermaster.Where(b => b.answerid == answerid).First();
            db.answermaster.Remove(am);
            db.SaveChanges();
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void AnswerView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            AnswerView.EditIndex = e.NewEditIndex;
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void AnswerView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int AnswerID = Convert.ToInt32(AnswerView.DataKeys[e.RowIndex].Values[0]);
            answermaster am = db.answermaster.Where(b => b.answerid == AnswerID).First();
            TextBox txtgtqScore = (TextBox)AnswerView.Rows[e.RowIndex].FindControl("txtGTQ");
            TextBox txtriskqscore = (TextBox)AnswerView.Rows[e.RowIndex].FindControl("txtRiskQ");

            TextBox txtDescription = (TextBox)AnswerView.Rows[e.RowIndex].FindControl("txtDescription");

            am.answerdescription = txtDescription.Text.Trim();
            if (txtgtqScore.Text != "")
                am.gteqscore = Convert.ToInt32(txtgtqScore.Text.Trim());
            else
                am.gteqscore = 0;
            if (txtriskqscore.Text != "")
                am.riskqscore = Convert.ToInt32(txtriskqscore.Text.Trim());
            else
                am.riskqscore = 0;

            AnswerView.EditIndex = -1;
            db.SaveChanges();
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
}