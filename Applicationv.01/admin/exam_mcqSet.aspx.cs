using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_mcqSet : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
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
 
    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
              int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniversityid);        
    }
    
    private void BindExaminer(int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x=>x.universityId == universityId && x.roleid == 9).ToList();
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

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridDiv.Attributes.Add("style", "display:none");
        txtpasskey.Value = "";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {

            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedexaminerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                gridDiv.Attributes.Add("style", "display:block");
                validateDIv.Attributes.Add("style", "display:none");
                BindGrid(selecteduniversityid, selectedexaminerId);
            }
            else
            {
                validateDIv.Attributes.Add("style", "display:block");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindGrid(int selecteduniversityid, int selectedexaminerId)
    {
        try
        {
            var QuestionList = (from q in db.exam_mcq_questionmaster
                                where q.universityID == selecteduniversityid && q.examinerId == selectedexaminerId
                                select new
                                {
                                    preliminaryid = q.questionID,
                                    question = q.question,
                                    answer1 = q.answer1,
                                    answer2 = q.answer2,
                                    answer3 = q.answer3,
                                    answer4 = q.answer4,
                                    answer1_description = string.IsNullOrEmpty(q.answer1_description) ? string.Empty : q.answer1_description,
                                    answer2_description = string.IsNullOrEmpty(q.answer2_description) ? string.Empty : q.answer2_description,
                                    answer3_description = string.IsNullOrEmpty(q.answer3_description) ? string.Empty : q.answer3_description,
                                    answer4_description = string.IsNullOrEmpty(q.answer4_description) ? string.Empty : q.answer4_description,
                                    correctanswer = q.correctanswer,
                                    marks = q.maximummarks,
                                    time =q.duration,
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
                exam_mcq_questionmaster objQuestion = new exam_mcq_questionmaster();
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
                TextBox txtmarksFooter = (TextBox)QuestiontGridView.FooterRow.FindControl("txtmarksFooter");
                TextBox txttimeFooter = (TextBox)QuestiontGridView.FooterRow.FindControl("txttimeFooter");

                int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

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
                objQuestion.maximummarks = txtmarksFooter.Text.Trim();
                objQuestion.duration = txttimeFooter.Text.Trim();
                objQuestion.universityID = selecteduniversityid;
                objQuestion.examinerId = selectedexaminerId;
                db.exam_mcq_questionmaster.Add(objQuestion);
                db.SaveChanges();
                BindGrid(selecteduniversityid, selectedexaminerId);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QuestiontGridView.EditIndex = e.NewEditIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

        BindGrid(selecteduniversityid, selectedexaminerId);
    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            exam_mcq_questionmaster qm = db.exam_mcq_questionmaster.Where(b => b.questionID == QuestionID).First();
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
            TextBox txtmarks = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtmarks");
            TextBox txttime = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txttime");

            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

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
            qm.duration = txttime.Text.Trim();
            qm.maximummarks = txtmarks.Text.Trim();
            qm.universityID = selecteduniversityid;
            qm.examinerId = selectedexaminerId;
            QuestiontGridView.EditIndex = -1;
            db.SaveChanges();           
            BindGrid(selecteduniversityid, selectedexaminerId);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QuestiontGridView.EditIndex = -1;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindGrid(selecteduniversityid, selectedexaminerId);
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
                        LinkButton lb = (LinkButton)row.Cells[13].Controls[0];
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
            exam_mcq_questionmaster qm = db.exam_mcq_questionmaster.Where(b => b.questionID == QuestionID).First();
            var exampmappedexists = db.exam_buildquestionbankmaster.Where(a => a.questionid == QuestionID && a.question_type == "MCQ").ToList();
            if (exampmappedexists.Count == 0)
            {
                db.exam_mcq_questionmaster.Remove(qm);
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

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

        BindGrid(selecteduniversityid, selectedexaminerId);
    }

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        object row = e.Row.DataItem;

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState != (DataControlRowState.Edit | DataControlRowState.Alternate)))
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

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (QuestiontGridView.FooterRow != null)
            control = QuestiontGridView.FooterRow;
        else
            control = QuestiontGridView.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;

        string answer1 = (control.FindControl("txtanswer1") as TextBox).Text;
        string answer2 = (control.FindControl("txtanswer2") as TextBox).Text;
        string answer3 = (control.FindControl("txtanswer3") as TextBox).Text;
        string answer4 = (control.FindControl("txtanswer4") as TextBox).Text;
        string answerdescription1 = (control.FindControl("txtEmptyincorrect_answer1") as TextBox).Text;
        string answerdescription2 = (control.FindControl("txtEmptyincorrect_answer2") as TextBox).Text;
        string answerdescription3 = (control.FindControl("txtEmptyincorrect_answer3") as TextBox).Text;
        string answerdescription4 = (control.FindControl("txtEmptyincorrect_answer4") as TextBox).Text;
        DropDownList ddlcorrectans = (control.FindControl("ddlEmptyCorrectans") as DropDownList);
        string txtemptymarks = (control.FindControl("txtemptymarks") as TextBox).Text;
        string txtemptytime = (control.FindControl("txtemptytime") as TextBox).Text;

        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

        exam_mcq_questionmaster objID = new exam_mcq_questionmaster();
        objID.question = idDescriptonText;
        objID.answer1 = answer1;
        objID.answer2 = answer2;
        objID.answer3 = answer3;
        objID.answer4 = answer4;
        objID.answer1_description = answerdescription1;
        objID.answer2_description = answerdescription2;
        objID.answer3_description = answerdescription3;
        objID.answer4_description = answerdescription4;
        objID.correctanswer = ddlcorrectans.SelectedValue;
        objID.duration = txtemptytime;
        objID.maximummarks =txtemptymarks;
        objID.universityID = selecteduniversityid;
        objID.examinerId = selectedexaminerId;
        db.exam_mcq_questionmaster.Add(objID);
        db.SaveChanges();        
        BindGrid(selecteduniversityid, selectedexaminerId);
    }

    
}
