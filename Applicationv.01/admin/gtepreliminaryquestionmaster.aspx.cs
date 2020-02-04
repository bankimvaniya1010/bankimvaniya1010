using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gtepreliminaryquestionmaster : System.Web.UI.Page
{

    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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
                                    answer1_description = string.IsNullOrEmpty(q.answer1_description) ? string.Empty : q.answer1_description,
                                    answer2_description = string.IsNullOrEmpty(q.answer2_description) ? string.Empty : q.answer2_description,
                                    answer3_description = string.IsNullOrEmpty(q.answer3_description) ? string.Empty : q.answer3_description,
                                    answer4_description = string.IsNullOrEmpty(q.answer4_description) ? string.Empty : q.answer4_description,
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
                TextBox txtAnswer1_description = (TextBox)QuestiontGridView.FooterRow.FindControl("txtDescrip_answer1Footer");
                TextBox txtAnswer2_description = (TextBox)QuestiontGridView.FooterRow.FindControl("txtDescrip_answer2Footer");
                TextBox txtAnswer3_description = (TextBox)QuestiontGridView.FooterRow.FindControl("txtDescrip_answer3Footer");
                TextBox txtAnswer4_description = (TextBox)QuestiontGridView.FooterRow.FindControl("txtDescrip_answer4Footer");                                
                DropDownList ddlCorrectAnswer = (DropDownList)QuestiontGridView.FooterRow.FindControl("ddlCorrectAnswer");

                objQuestion.question = txtQuestion.Text.Trim();
                objQuestion.answer1 = txtAnswer1.Text.Trim();
                objQuestion.answer2 = txtAnswer2.Text.Trim();
                objQuestion.answer3 = txtAnswer3.Text.Trim();
                objQuestion.answer4 = txtAnswer4.Text.Trim();
                objQuestion.answer1_description = txtAnswer1_description.Text.Trim();
                objQuestion.answer2_description = txtAnswer2_description.Text.Trim();
                objQuestion.answer3_description = txtAnswer3_description.Text.Trim();
                objQuestion.answer4_description = txtAnswer4_description.Text.Trim();
                objQuestion.correctanswer = ddlCorrectAnswer.SelectedItem.Value.Trim();
                db.gte_preliminary_questionmaster.Add(objQuestion);
                db.SaveChanges();
                BindGrid();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
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
            TextBox txtAnswer1_description = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer1");
            TextBox txtAnswer2_description = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer2");
            TextBox txtAnswer3_description = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer3");
            TextBox txtAnswer4_description = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer4");
            DropDownList ddlCorrectAnswer = (DropDownList)QuestiontGridView.Rows[e.RowIndex].FindControl("ddlCorrectAnswer");

            qm.question = txtQuestion.Text.Trim();
            qm.answer1 = txtAnswer1.Text.Trim();
            qm.answer2 = txtAnswer2.Text.Trim();
            qm.answer3 = txtAnswer3.Text.Trim();
            qm.answer4 = txtAnswer4.Text.Trim();
            qm.answer1_description = txtAnswer1_description.Text.Trim();
            qm.answer2_description = txtAnswer2_description.Text.Trim();
            qm.answer3_description = txtAnswer3_description.Text.Trim();
            qm.answer4_description = txtAnswer4_description.Text.Trim();
            qm.correctanswer = ddlCorrectAnswer.SelectedItem.Value.Trim();
            QuestiontGridView.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
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
                        LinkButton lb = (LinkButton)row.Cells[12].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            gte_preliminary_questionmaster qm = db.gte_preliminary_questionmaster.Where(b => b.gte_preliminaryid == QuestionID).First();
            var anstoquestionexists = db.gte_preliminaryapplicantanswers.Where(a => a.gte_preliminary_question_id == QuestionID).ToList();
            if (anstoquestionexists.Count == 0){
                db.gte_preliminary_questionmaster.Remove(qm);
                db.SaveChanges();
                BindGrid();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Question as it already used in another records')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        object row = e.Row.DataItem;
        
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState != (DataControlRowState.Edit | DataControlRowState.Alternate)))
        {
            if(e.Row.RowState != DataControlRowState.Edit)
            {
                PropertyInfo pCorrectAnswer = row.GetType().GetProperty("correctanswer");
                string correctAnswer = pCorrectAnswer.GetValue(row, null) == null ? string.Empty : pCorrectAnswer.GetValue(row, null).ToString();

                Label lblCorrectAnswer = e.Row.FindControl("lblCorrectAnswer") as Label;
                if (correctAnswer.ToLower().Contains("answer1"))
                    lblCorrectAnswer.Text = "Answer 1";
                else if (correctAnswer.ToLower().Contains("answer2"))
                    lblCorrectAnswer.Text = "Answer 2";
                else if (correctAnswer.ToLower().Contains("answer3"))
                    lblCorrectAnswer.Text = "Answer 3";
                else if (correctAnswer.ToLower().Contains("answer4"))
                    lblCorrectAnswer.Text = "Answer 4";
            }
        }

        if (e.Row.RowType == DataControlRowType.Footer || e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate) || e.Row.RowState == DataControlRowState.Edit)
        {
            DropDownList ddlCorrectAnswer = e.Row.FindControl("ddlCorrectAnswer") as DropDownList;
            ddlCorrectAnswer.ClearSelection();
            ListItem lst0 = new ListItem("Please select", "");
            ListItem lst1 = new ListItem("Answer 1", "answer1");
            ListItem lst2 = new ListItem("Answer 2", "answer2");
            ListItem lst3 = new ListItem("Answer 3", "answer3");
            ListItem lst4 = new ListItem("Answer 4", "answer4");

            if (ddlCorrectAnswer.Items.Count == 0)
            {
                ddlCorrectAnswer.Items.Insert(0, lst0);
                ddlCorrectAnswer.Items.Insert(1, lst1);
                ddlCorrectAnswer.Items.Insert(2, lst2);
                ddlCorrectAnswer.Items.Insert(3, lst3);
                ddlCorrectAnswer.Items.Insert(4, lst4);
            }
            if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))
            {
                PropertyInfo pCorrectAnswer = row.GetType().GetProperty("correctanswer");
                string correctAnswer = pCorrectAnswer.GetValue(row, null) == null ? string.Empty : pCorrectAnswer.GetValue(row, null).ToString();

                if (!String.IsNullOrEmpty(correctAnswer))
                {
                    ddlCorrectAnswer.ClearSelection();
                    ddlCorrectAnswer.Items.FindByValue(correctAnswer.ToString()).Selected = true;
                }
            }
        }
    }
}
