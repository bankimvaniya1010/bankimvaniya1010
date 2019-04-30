using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class questioncreate : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindQuestions();
    }
    private void BindQuestions()
    {
        try
        {
            var QuestionList = (from q in db.question_master
                                join i in db.inferencemaster on q.infrencecategoryid equals i.inferenceid
                                select new
                                {
                                    questionid = q.questionid,
                                    description = q.description,
                                    isprimary = q.isprimary,
                                    infrencecategoryid = q.infrencecategoryid,
                                    inferenceDescription = i.description
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



    protected void QuestiontGridView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in QuestiontGridView.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    Label lblPrimary = row.FindControl("lblPrimary") as Label;
                    if (lblPrimary != null)
                    {
                        if (lblPrimary.Text == "1")
                            lblPrimary.Text = "Primary";
                        else
                            lblPrimary.Text = "Add-on";
                    }
                }
                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[5].Controls[0];
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

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if ((e.Row.RowType == DataControlRowType.DataRow && QuestiontGridView.EditIndex == e.Row.RowIndex) || (e.Row.RowType == DataControlRowType.Footer))
            {


                List<inferencemaster> InferenceList = db.inferencemaster.ToList();

                DropDownList ddlInferenceEdit = (e.Row.FindControl("ddlInferenceID") as DropDownList);
                DropDownList ddlCategoryEdit = (e.Row.FindControl("ddlPrimary") as DropDownList);
                DropDownList ddlInferenceFooter = (e.Row.FindControl("ddlInferenceID1") as DropDownList);
                //  DropDownList ddlPrimaryEdit = (e.Row.FindControl("ddlPrimaryQuestionID") as DropDownList); //(DropDownList)QuestiontGridView.FindControl("ddlPrimaryQuestionID");
                //  DropDownList ddlPrimaryFooter = (e.Row.FindControl("ddlPrimaryQuestionID1") as DropDownList);
                ListItem lst = new ListItem("Please select", "0");
                string selectedInference = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();
                Label Inference = (e.Row.FindControl("lblInferenceEdit") as Label);
                Label Primary = (e.Row.FindControl("lblPrimaryEdit") as Label);

                string Category = "";
                if (Inference != null)
                    selectedInference = Inference.Text;
                if (Primary != null)
                    Category = Primary.Text;
                if (ddlCategoryEdit != null)
                    ddlCategoryEdit.Items.FindByValue(Category).Selected = true;
                if (ddlInferenceEdit != null)
                {

                    ddlInferenceEdit.DataSource = InferenceList;
                    ddlInferenceEdit.DataTextField = "description";
                    ddlInferenceEdit.DataValueField = "inferenceid";
                    ddlInferenceEdit.DataBind();
                    ddlInferenceEdit.Items.Insert(0, lst);
                    ddlInferenceEdit.Items.FindByText(selectedInference).Selected = true;
                }
                if (ddlInferenceFooter != null)
                {

                    ddlInferenceFooter.DataSource = InferenceList;
                    ddlInferenceFooter.DataTextField = "description";
                    ddlInferenceFooter.DataValueField = "inferenceid";
                    ddlInferenceFooter.DataBind();
                    ddlInferenceFooter.Items.Insert(0, lst);
                }

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
                question_master objQuestion = new question_master();

                // TextBox txtgtqScore = (TextBox)QuestiontGridView.FooterRow.FindControl("txtGTEqscore1");

                // TextBox txtriskqscore = (TextBox)QuestiontGridView.FooterRow.FindControl("txtriskqscore1");

                DropDownList ddlPrimary = (DropDownList)QuestiontGridView.FooterRow.FindControl("ddlPrimary1");

                //  DropDownList ddlPrimaryQuestionID = (DropDownList)QuestiontGridView.FooterRow.FindControl("ddlPrimaryQuestionID1");

                DropDownList ddlInferenceID = (DropDownList)QuestiontGridView.FooterRow.FindControl("ddlInferenceID1");

                TextBox txtDescription = (TextBox)QuestiontGridView.FooterRow.FindControl("txtDescription1");

                objQuestion.description = txtDescription.Text.Trim();
                //if (txtgtqScore.Text == "")
                //    objQuestion.GTEqscore = 0;
                //else
                //    objQuestion.GTEqscore = Convert.ToInt32(txtgtqScore.Text.Trim());
                //if (txtriskqscore.Text == "")
                //    objQuestion.riskqscore = 0;
                //else
                //    objQuestion.riskqscore = Convert.ToInt32(txtriskqscore.Text.Trim());
                objQuestion.isprimary = Convert.ToInt32(ddlPrimary.SelectedValue);
                //if (ddlPrimary.SelectedValue == "1")
                //    objQuestion.primaryquestionid = 0;
                //else
                //    objQuestion.primaryquestionid = Convert.ToInt32(ddlPrimaryQuestionID.SelectedValue);
                objQuestion.infrencecategoryid = Convert.ToInt32(ddlInferenceID.SelectedValue);
                db.question_master.Add(objQuestion);
                db.SaveChanges();
                BindQuestions();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            question_master qm = db.question_master.Where(b => b.questionid == QuestionID).First();
            db.question_master.Remove(qm);
            db.SaveChanges();
            BindQuestions();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QuestiontGridView.EditIndex = e.NewEditIndex;
        BindQuestions();
    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int QuestionID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            question_master qm = db.question_master.Where(b => b.questionid == QuestionID).First();
            // TextBox txtgtqScore = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtGTEqscore");

            //  TextBox txtriskqscore = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtriskqscore");

            DropDownList ddlPrimary = (DropDownList)QuestiontGridView.Rows[e.RowIndex].FindControl("ddlPrimary");

            // DropDownList ddlPrimaryQuestionID = (DropDownList)QuestiontGridView.Rows[e.RowIndex].FindControl("ddlPrimaryQuestionID");

            DropDownList ddlInferenceID = (DropDownList)QuestiontGridView.Rows[e.RowIndex].FindControl("ddlInferenceID");

            TextBox txtDescription = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtDescription");

            qm.description = txtDescription.Text.Trim();

            // qm.GTEqscore = Convert.ToInt32(txtgtqScore.Text.Trim());
            // qm.riskqscore = Convert.ToInt32(txtriskqscore.Text.Trim());
            qm.isprimary = Convert.ToInt32(ddlPrimary.SelectedValue);
            //if (ddlPrimaryQuestionID.SelectedValue == "")
            //    qm.primaryquestionid = QuestionID;
            //else
            //    qm.primaryquestionid = Convert.ToInt32(ddlPrimaryQuestionID.SelectedValue);
            qm.infrencecategoryid = Convert.ToInt32(ddlInferenceID.SelectedValue);
            QuestiontGridView.EditIndex = -1;
            db.SaveChanges();
            BindQuestions();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QuestiontGridView.EditIndex = -1;
        BindQuestions();
    }
}
