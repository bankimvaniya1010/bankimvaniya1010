using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gtepreliminaryquestionmaster : System.Web.UI.Page
{

    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var QuestionList = (from q in db.gte_preliminary_questionmaster                                
                                select new
                                {
                                    preliminaryid = q.gte_preliminaryid,
                                    question = q.question,
                                    answer1 = q.answer1,
                                    answer2 = q.answer2,
                                    answer3 = q.answer3,
                                    answer4 = q.answer4,
                                    correctanswer = q.correctanswer                                    
                                }).ToList();
            if (QuestionList != null)
            {
                QuestiontGridView.DataSource = QuestionList;
                QuestiontGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                gte_preliminary_questionmaster objQuestion = new gte_preliminary_questionmaster();
                TextBox txtQuestion = (TextBox)QuestiontGridView.FooterRow.FindControl("txtQuestionFooter");
                TextBox txtAnswer1 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer1Footer");
                TextBox txtAnswer2 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer2Footer");
                TextBox txtAnswer3 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer3Footer");
                TextBox txtAnswer4 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer4Footer");
                TextBox txtCorrectAnswer = (TextBox)QuestiontGridView.FooterRow.FindControl("txtCorrectAnswerFooter");                
                objQuestion.question = txtQuestion.Text.Trim();
                objQuestion.answer1 = txtAnswer1.Text.Trim();
                objQuestion.answer2 = txtAnswer2.Text.Trim();
                objQuestion.answer3 = txtAnswer3.Text.Trim();
                objQuestion.answer4 = txtAnswer4.Text.Trim();
                objQuestion.correctanswer = txtCorrectAnswer.Text.Trim();
                db.gte_preliminary_questionmaster.Add(objQuestion);
                db.SaveChanges();
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QuestiontGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            gte_preliminary_questionmaster qm = db.gte_preliminary_questionmaster.Where(b => b.gte_preliminaryid == QuestionID).First();
            TextBox txtQuestion = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtQuestion");
            TextBox txtAnswer1 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer1");
            TextBox txtAnswer2 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer2");
            TextBox txtAnswer3 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer3");
            TextBox txtAnswer4 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer4");
            TextBox txtCorrectAnswer = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtCorrectAnswer");
            qm.question = txtQuestion.Text.Trim();
            qm.answer1 = txtAnswer1.Text.Trim();
            qm.answer2 = txtAnswer2.Text.Trim();
            qm.answer3 = txtAnswer3.Text.Trim();
            qm.answer4 = txtAnswer4.Text.Trim();
            qm.correctanswer = txtCorrectAnswer.Text.Trim();
            QuestiontGridView.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QuestiontGridView.EditIndex = -1;
        BindGrid();
    }

    protected void QuestiontGridView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in QuestiontGridView.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[9].Controls[0];
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
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            gte_preliminary_questionmaster qm = db.gte_preliminary_questionmaster.Where(b => b.gte_preliminaryid == QuestionID).First();
            db.gte_preliminary_questionmaster.Remove(qm);
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }



    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}
