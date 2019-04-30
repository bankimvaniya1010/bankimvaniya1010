using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_preliminaryquestion : System.Web.UI.Page
{

    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var QuestionList = (from q in db.preliminary_questionmaster
                                join um in db.university_master
on q.universityid equals um.universityid

                                select new
                                {
                                    preliminaryid = q.preliminaryid,
                                    question = q.question,
                                    answer1 = q.answer1,
                                    answer2 = q.answer2,
                                    answer3 = q.answer3,
                                    answer4 = q.answer4,
                                    correctanswer = q.correctanswer,
                                    UniversityName = um.university_name
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
                preliminary_questionmaster objQuestion = new preliminary_questionmaster();
                TextBox txtQuestion = (TextBox)QuestiontGridView.FooterRow.FindControl("txtQuestionFooter");
                TextBox txtAnswer1 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer1Footer");
                TextBox txtAnswer2 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer2Footer");
                TextBox txtAnswer3 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer3Footer");
                TextBox txtAnswer4 = (TextBox)QuestiontGridView.FooterRow.FindControl("txtAnswer4Footer");
                TextBox txtCorrectAnswer = (TextBox)QuestiontGridView.FooterRow.FindControl("txtCorrectAnswerFooter");
                DropDownList ddlUniversity = (DropDownList)QuestiontGridView.FooterRow.FindControl("ddlUniversityFooter");
                objQuestion.question = txtQuestion.Text.Trim();
                objQuestion.answer1 = txtAnswer1.Text.Trim();
                objQuestion.answer2 = txtAnswer2.Text.Trim();
                objQuestion.answer3 = txtAnswer3.Text.Trim();
                objQuestion.answer4 = txtAnswer4.Text.Trim();
                objQuestion.correctanswer = txtCorrectAnswer.Text.Trim();
                if(ddlUniversity.SelectedValue!="")
                    objQuestion.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                db.preliminary_questionmaster.Add(objQuestion);
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
            preliminary_questionmaster qm = db.preliminary_questionmaster.Where(b => b.preliminaryid == QuestionID).First();
            TextBox txtQuestion = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtQuestion");
            TextBox txtAnswer1 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer1");
            TextBox txtAnswer2 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer2");
            TextBox txtAnswer3 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer3");
            TextBox txtAnswer4 = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtAnswer4");
            TextBox txtCorrectAnswer = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtCorrectAnswer");
            DropDownList ddlUniversity = (DropDownList)QuestiontGridView.Rows[e.RowIndex].FindControl("ddlUniversity");
            qm.question = txtQuestion.Text.Trim();
            qm.answer1 = txtAnswer1.Text.Trim();
            qm.answer2 = txtAnswer2.Text.Trim();
            qm.answer3 = txtAnswer3.Text.Trim();
            qm.answer4 = txtAnswer4.Text.Trim();
            qm.correctanswer = txtCorrectAnswer.Text.Trim();
            if (ddlUniversity.SelectedValue != "")
                qm.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
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
            preliminary_questionmaster qm = db.preliminary_questionmaster.Where(b => b.preliminaryid == QuestionID).First();
            db.preliminary_questionmaster.Remove(qm);
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ListItem lst = new ListItem("Please select", "0");
        var University = db.university_master.ToList();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.DataItem != null)
            {
                //check if is in edit mode
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {

                    DropDownList ddlUniversityEdit = (e.Row.FindControl("ddlUniversity") as DropDownList);
                    string selectedName = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();

                    Label lblUniversity = (e.Row.FindControl("lblUniversityEdit") as Label);
                    if (lblUniversity != null)
                        selectedName = lblUniversity.Text;
                    if (ddlUniversityEdit != null)
                    {

                        ddlUniversityEdit.DataSource = University;
                        ddlUniversityEdit.DataTextField = "university_name";
                        ddlUniversityEdit.DataValueField = "universityID";
                        ddlUniversityEdit.DataBind();
                        ddlUniversityEdit.Items.Insert(0, lst);
                        ddlUniversityEdit.Items.FindByText(selectedName).Selected = true;
                    }
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            DropDownList ddlUniversityFooter = (e.Row.FindControl("ddlUniversityFooter") as DropDownList);
            if (ddlUniversityFooter != null)
            {

                ddlUniversityFooter.DataSource = University;
                ddlUniversityFooter.DataTextField = "university_name";
                ddlUniversityFooter.DataValueField = "universityID";
                ddlUniversityFooter.DataBind();
                ddlUniversityFooter.Items.Insert(0, lst);
            }
        }

    }
}
