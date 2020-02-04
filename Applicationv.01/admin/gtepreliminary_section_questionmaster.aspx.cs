using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gtepreliminary_section_questionmaster : System.Web.UI.Page
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
            var QuestionList = (from q in db.gte_preliminary_section_questionmaster
                                select new
                                {
                                    questionid = q.gte_questionID,
                                    question = q.question,
                                    answer1 = q.answer1,
                                    answer2 = q.answer2,
                                    correctanswer = q.correctanswer,
                                    answer1_description = string.IsNullOrEmpty(q.answer1_description) ? string.Empty : q.answer1_description,
                                    answer2_description = string.IsNullOrEmpty(q.answer2_description) ? string.Empty : q.answer2_description,
                                }).ToList();
            if (QuestionList != null)
            {
                section2queGridView.DataSource = QuestionList;
                section2queGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void section2queGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        section2queGridView.EditIndex = -1;
        BindGrid();
    }

    protected void section2queGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))
            {
                gte_preliminary_section_questionmaster objQuestion = new gte_preliminary_section_questionmaster();
                TextBox txtQuestion = (TextBox)section2queGridView.FooterRow.FindControl("txtQuestionFooter");
                Label txtAnswer1 = (Label)section2queGridView.FooterRow.FindControl("txtAnswer1Footer");
                Label txtAnswer2 = (Label)section2queGridView.FooterRow.FindControl("txtAnswer2Footer");
                TextBox txtDescrip_answer1Footer = (TextBox)section2queGridView.FooterRow.FindControl("txtDescrip_answer1Footer");
                TextBox txtDescrip_answer2Footer = (TextBox)section2queGridView.FooterRow.FindControl("txtDescrip_answer2Footer");
                DropDownList ddlCorrectAnswer = (DropDownList)section2queGridView.FooterRow.FindControl("ddlCorrectAnswer");

                objQuestion.question = txtQuestion.Text.Trim();
                objQuestion.answer1 = txtAnswer1.Text;
                objQuestion.answer2 = txtAnswer2.Text;
                objQuestion.answer1_description = txtDescrip_answer1Footer.Text.Trim();
                objQuestion.answer2_description = txtDescrip_answer2Footer.Text.Trim();
                objQuestion.correctanswer = ddlCorrectAnswer.SelectedItem.Value.Trim();
                db.gte_preliminary_section_questionmaster.Add(objQuestion);
                db.SaveChanges();
                BindGrid();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void section2queGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        section2queGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void section2queGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(section2queGridView.DataKeys[e.RowIndex].Values[0]);

            gte_preliminary_section_questionmaster qm = db.gte_preliminary_section_questionmaster.Where(b => b.gte_questionID == QuestionID).First();

            TextBox txtQuestion = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtQuestion");
            Label txtAnswer1 = (Label)section2queGridView.Rows[e.RowIndex].FindControl("txtAnswer1");
            Label txtAnswer2 = (Label)section2queGridView.Rows[e.RowIndex].FindControl("txtAnswer2");
            TextBox txtDescrip_answer1 = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer1");
            TextBox txtDescrip_answer2 = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer2");
            DropDownList ddlCorrectAnswer = (DropDownList)section2queGridView.Rows[e.RowIndex].FindControl("ddlCorrectAnswer");

            qm.question = txtQuestion.Text.Trim();
            qm.answer1 = txtAnswer1.Text;
            qm.answer2 = txtAnswer2.Text;
            qm.answer1_description = txtDescrip_answer1.Text.Trim();
            qm.answer2_description = txtDescrip_answer2.Text.Trim();
            qm.correctanswer = ddlCorrectAnswer.SelectedItem.Value.Trim();
            section2queGridView.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void section2queGridView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in section2queGridView.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[8].Controls[0];
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

    protected void section2queGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(section2queGridView.DataKeys[e.RowIndex].Values[0]);
            gte_preliminary_section_questionmaster qm = db.gte_preliminary_section_questionmaster.Where(b => b.gte_questionID == QuestionID).First();            
            var anstoquestionexists = db.gtepreliminarysection_applicantanswers.Where(a => a.gte_preliminary_section_question_id == QuestionID).ToList();
            if (anstoquestionexists.Count == 0)
            {
                db.gte_preliminary_section_questionmaster.Remove(qm);
                db.SaveChanges();
                BindGrid();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Question as it already used in another records')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void section2queGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        section2queGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void section2queGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        object row = e.Row.DataItem;

        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState != (DataControlRowState.Edit | DataControlRowState.Alternate))
        {
            if (e.Row.RowState != DataControlRowState.Edit)
            {
                PropertyInfo pCorrectAnswer = row.GetType().GetProperty("correctanswer");
                string correctAnswer = pCorrectAnswer.GetValue(row, null) == null ? string.Empty : pCorrectAnswer.GetValue(row, null).ToString();

                Label lblCorrectAnswer = e.Row.FindControl("lblCorrectAnswer") as Label;
                if (correctAnswer.ToLower().Contains("answer1"))
                    lblCorrectAnswer.Text = "Answer 1";
                else if (correctAnswer.ToLower().Contains("answer2"))
                    lblCorrectAnswer.Text = "Answer 2";
            }
        }

        if (e.Row.RowType == DataControlRowType.Footer || e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate) || e.Row.RowState == DataControlRowState.Edit)
        {
            DropDownList ddlCorrectAnswer = e.Row.FindControl("ddlCorrectAnswer") as DropDownList;
            ddlCorrectAnswer.ClearSelection();
            ListItem lst0 = new ListItem("Please select", "");
            ListItem lst1 = new ListItem("Answer 1", "answer1");
            ListItem lst2 = new ListItem("Answer 2", "answer2");

            if (ddlCorrectAnswer.Items.Count == 0)
            {
                ddlCorrectAnswer.Items.Insert(0, lst0);
                ddlCorrectAnswer.Items.Insert(1, lst1);
                ddlCorrectAnswer.Items.Insert(2, lst2);
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

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (section2queGridView.FooterRow != null)
            control = section2queGridView.FooterRow;
        else
            control = section2queGridView.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        Label answer1 = (control.FindControl("lblEmptyTrue") as Label);
        Label answer2 = (control.FindControl("lblEmptyFalse") as Label);
        string txtEmptyDescription_answer1 = (control.FindControl("txtEmptyDescription_answer1") as TextBox).Text;
        string txtEmptyDescription_answer2 = (control.FindControl("txtEmptyDescription_answer2") as TextBox).Text;
        DropDownList ddlcorrectans = (control.FindControl("ddlEmptyCorrectans") as DropDownList);

        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        gte_preliminary_section_questionmaster objID = new gte_preliminary_section_questionmaster();
        objID.question = idDescriptonText;
        objID.answer1 = answer1.Text;
        objID.answer2 = answer2.Text;
        objID.answer1_description = txtEmptyDescription_answer1;
        objID.answer2_description = txtEmptyDescription_answer2;
        objID.correctanswer = ddlcorrectans.SelectedValue;
        db.gte_preliminary_section_questionmaster.Add(objID);
        db.SaveChanges();
        BindGrid();
    }
}