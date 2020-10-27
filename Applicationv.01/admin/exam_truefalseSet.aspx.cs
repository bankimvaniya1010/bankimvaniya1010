using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_truefalseSet : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindUniversity();
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindExaminer(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x=>x.universityId == universityid && x.roleid == 9).ToList();
            ddlexaminer.DataSource = examinerId;
            ddlexaminer.DataTextField = "name";
            ddlexaminer.DataValueField = "examinerID";
            ddlexaminer.DataBind();
            ddlexaminer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
   private void BindGrid( int selecteduniversityId, int examinerid)
    {
        try
        {
            var QuestionList = (from q in db.exam_truefalse_questionmaster
                                where q.universityID == selecteduniversityId && q.examinerId == examinerid
                                select new
                                {
                                    questionid = q.questionId,
                                    question = q.question,
                                    answer1 = q.answer1,
                                    answer2 = q.answer2,
                                    correctanswer = q.correct_answer,
                                    answer1_description = string.IsNullOrEmpty(q.answer1_description) ? string.Empty : q.answer1_description,
                                    answer2_description = string.IsNullOrEmpty(q.answer2_description) ? string.Empty : q.answer2_description,
                                    marks = q.maximum_marks,
                                    time = q.duration,
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
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

        BindGrid(selecteduniversityid, selectedexaminerId);
    }

    protected void section2queGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))
            {
                exam_truefalse_questionmaster objQuestion = new exam_truefalse_questionmaster();
                TextBox txtQuestion = (TextBox)section2queGridView.FooterRow.FindControl("txtQuestionFooter");
                Label txtAnswer1 = (Label)section2queGridView.FooterRow.FindControl("txtAnswer1Footer");
                Label txtAnswer2 = (Label)section2queGridView.FooterRow.FindControl("txtAnswer2Footer");
                TextBox txtDescrip_answer1Footer = (TextBox)section2queGridView.FooterRow.FindControl("txtDescrip_answer1Footer");
                TextBox txtDescrip_answer2Footer = (TextBox)section2queGridView.FooterRow.FindControl("txtDescrip_answer2Footer");
                DropDownList ddlCorrectAnswer = (DropDownList)section2queGridView.FooterRow.FindControl("ddlCorrectAnswer");
                TextBox txttimeFooter = (TextBox)section2queGridView.FooterRow.FindControl("txttimeFooter");
                TextBox txtmarksFooter = (TextBox)section2queGridView.FooterRow.FindControl("txtmarksFooter");

                int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

                objQuestion.question = txtQuestion.Text.Trim();
                objQuestion.answer1 = txtAnswer1.Text;
                objQuestion.answer2 = txtAnswer2.Text;
                objQuestion.answer1_description = txtDescrip_answer1Footer.Text.Trim();
                objQuestion.answer2_description = txtDescrip_answer2Footer.Text.Trim();
                objQuestion.correct_answer = ddlCorrectAnswer.SelectedItem.Value.Trim();
                objQuestion.duration = txttimeFooter.Text.Trim();
                objQuestion.maximum_marks = txtmarksFooter.Text.Trim();
                objQuestion.examinerId = selectedexaminerId;
                objQuestion.universityID = selecteduniversityid;
                db.exam_truefalse_questionmaster.Add(objQuestion);
                db.SaveChanges();
                
                BindGrid(selecteduniversityid, selectedexaminerId);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void section2queGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        section2queGridView.EditIndex = e.NewEditIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

        BindGrid(selecteduniversityid, selectedexaminerId);
    }

    protected void section2queGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(section2queGridView.DataKeys[e.RowIndex].Values[0]);

            exam_truefalse_questionmaster qm = db.exam_truefalse_questionmaster.Where(b => b.questionId == QuestionID).First();

            TextBox txtQuestion = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtQuestion");
            Label txtAnswer1 = (Label)section2queGridView.Rows[e.RowIndex].FindControl("txtAnswer1");
            Label txtAnswer2 = (Label)section2queGridView.Rows[e.RowIndex].FindControl("txtAnswer2");
            TextBox txtDescrip_answer1 = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer1");
            TextBox txtDescrip_answer2 = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtDescrip_answer2");
            DropDownList ddlCorrectAnswer = (DropDownList)section2queGridView.Rows[e.RowIndex].FindControl("ddlCorrectAnswer");
            TextBox txtmarks = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txtmarks");
            TextBox txttime = (TextBox)section2queGridView.Rows[e.RowIndex].FindControl("txttime");

            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

            qm.question = txtQuestion.Text.Trim();
            qm.answer1 = txtAnswer1.Text;
            qm.answer2 = txtAnswer2.Text;
            qm.answer1_description = txtDescrip_answer1.Text.Trim();
            qm.answer2_description = txtDescrip_answer2.Text.Trim();
            qm.correct_answer = ddlCorrectAnswer.SelectedItem.Value.Trim();
            qm.maximum_marks = txtmarks.Text.Trim();
            qm.duration = txttime.Text.Trim();
            qm.examinerId = selectedexaminerId;
            qm.universityID = selecteduniversityid;
            section2queGridView.EditIndex = -1;
            db.SaveChanges();
            
            BindGrid(selecteduniversityid, selectedexaminerId);
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
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void section2queGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(section2queGridView.DataKeys[e.RowIndex].Values[0]);
            exam_truefalse_questionmaster qm = db.exam_truefalse_questionmaster.Where(b => b.questionId == QuestionID).First();            
            var mappedquestionexists = db.exam_buildquestionbankmaster.Where(a => a.questionid == QuestionID && a.question_type == "True/False").ToList();
            if (mappedquestionexists.Count == 0)
            {
                db.exam_truefalse_questionmaster.Remove(qm);
                db.SaveChanges();
                int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

                BindGrid(selecteduniversityid, selectedexaminerId);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Question as it already used in another records')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void section2queGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        section2queGridView.PageIndex = e.NewPageIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindGrid(selecteduniversityid, selectedexaminerId);
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
        string txtmarks = (control.FindControl("empytytxtmarks") as TextBox).Text;
        string txttime = (control.FindControl("emptytxttime") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

        exam_truefalse_questionmaster objID = new exam_truefalse_questionmaster();
        objID.question = idDescriptonText;
        objID.answer1 = answer1.Text;
        objID.answer2 = answer2.Text;
        objID.answer1_description = txtEmptyDescription_answer1;
        objID.answer2_description = txtEmptyDescription_answer2;
        objID.correct_answer = ddlcorrectans.SelectedValue;
        objID.universityID = selecteduniversityid;
        objID.examinerId = selectedexaminerId;
        objID.maximum_marks = txtmarks;
        objID.duration = txttime;
        db.exam_truefalse_questionmaster.Add(objID);
        db.SaveChanges();        
        BindGrid(selecteduniversityid, selectedexaminerId);
    }

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridDiv.Attributes.Add("style", "display:none");
        txtpasskey.Value = "";
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridDiv.Attributes.Add("style", "display:none");
        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniID);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
            int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniID && x.examinerID == examinerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                gridDiv.Attributes.Add("style", "display:block");
                validdiv.Attributes.Add("style", "display:none");
                BindGrid(selecteduniID, examinerId);
            }
            else
            {
                validdiv.Attributes.Add("style", "display:block");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}