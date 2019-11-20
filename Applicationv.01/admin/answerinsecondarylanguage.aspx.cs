using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_answerinsecondarylanguage : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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
                                join ams in db.answer_mastersecondarylanguage on
       a.answerid equals ams.answerid

                                select new
                                {
                                    answerid = a.answerid,
                                    answerdescription = a.answerdescription,
                                    secondaryfieldnamelanguage = ams.secondaryfieldnamelanguage,
                                    secondaryfieldnamevalue = ams.secondaryfieldnamevalue,
                                    secondaryanswerid = ams.secondaryanswerid
                                }).ToList();
            if (QuestionList != null)
            {
                SecondaryAnswerView.DataSource = QuestionList;
                SecondaryAnswerView.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void SecondaryAnswerView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            SecondaryAnswerView.EditIndex = -1;
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void SecondaryAnswerView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                answer_mastersecondarylanguage objAnswer = new answer_mastersecondarylanguage();
                DropDownList ddlAnswerFooter = (DropDownList)SecondaryAnswerView.FooterRow.FindControl("ddlAnswerFooter");
                DropDownList ddlSecondaryFooter = (DropDownList)SecondaryAnswerView.FooterRow.FindControl("ddlSecondaryLangFooter");
                TextBox Description = (TextBox)SecondaryAnswerView.FooterRow.FindControl("txtDescriptionFooter");
                objAnswer.secondaryfieldnamevalue = Description.Text.Trim();
                objAnswer.secondaryfieldnamelanguage = ddlSecondaryFooter.SelectedValue;
                objAnswer.answerid = Convert.ToInt32(ddlAnswerFooter.SelectedValue);
                db.answer_mastersecondarylanguage.Add(objAnswer);
                db.SaveChanges();
                BindAnswer();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }


    protected void SecondaryAnswerView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in SecondaryAnswerView.Rows)
            {

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
            log.WriteLog(ex.ToString());
        }


    }

    protected void SecondaryAnswerView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            List<question_master> QuestionMaster = (from ques in db.question_master
                                                    orderby ques.questionid ascending
                                                    select ques).ToList();
            if ((e.Row.RowType == DataControlRowType.DataRow && SecondaryAnswerView.EditIndex == e.Row.RowIndex) || (e.Row.RowType == DataControlRowType.Footer))
            {


                var SecondaryLanguage = db.secondarylanguagemaster.ToList();
                var answermaster = db.answermaster.ToList();
                var primaryfieldmaster = db.primaryfieldmaster.ToList();
                DropDownList ddlAnswerEdit = (e.Row.FindControl("ddlAnswerEdit") as DropDownList);
                DropDownList ddlAnswerFooter = (e.Row.FindControl("ddlAnswerFooter") as DropDownList);

                DropDownList ddlSecondaryLangEdit = (e.Row.FindControl("ddlSecondaryLang") as DropDownList);
                DropDownList ddlSecondaryLangFooter = (e.Row.FindControl("ddlSecondaryLangFooter") as DropDownList);
                ListItem lst = new ListItem("Please select", "0");
                string selectedAnswer = "";
                string selectedLanguage = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();
                Label Answer = (e.Row.FindControl("lblAnswerEdit") as Label);
                Label Language = (e.Row.FindControl("lblfeldnamelanguage") as Label);
                if (Answer != null)
                    selectedAnswer = Answer.Text;
                if (Language != null)
                    selectedLanguage = Language.Text;
                if (ddlAnswerEdit != null)
                {
                    ddlAnswerEdit.DataSource = answermaster;
                    ddlAnswerEdit.DataTextField = "answerdescription";
                    ddlAnswerEdit.DataValueField = "answerid";
                    ddlAnswerEdit.DataBind();
                    ddlAnswerEdit.Items.Insert(0, lst);
                    ddlAnswerEdit.Items.FindByText(selectedAnswer).Selected = true;
                }
                if (ddlAnswerFooter != null)
                {
                    ddlAnswerFooter.DataSource = answermaster;
                    ddlAnswerFooter.DataTextField = "answerdescription";
                    ddlAnswerFooter.DataValueField = "answerid";
                    ddlAnswerFooter.DataBind();
                    ddlAnswerFooter.Items.Insert(0, lst);
                }

                if (ddlSecondaryLangFooter != null)
                {

                    ddlSecondaryLangFooter.DataSource = SecondaryLanguage;
                    ddlSecondaryLangFooter.DataTextField = "secondaryLanguagename";
                    ddlSecondaryLangFooter.DataValueField = "languagecode";
                    ddlSecondaryLangFooter.DataBind();
                    ddlSecondaryLangFooter.Items.Insert(0, lst);
                    // ddlSecondaryLangFooter.Items.FindByText(selectedQuestion).Selected = true;
                }
                if (ddlSecondaryLangEdit != null)
                {

                    ddlSecondaryLangEdit.DataSource = SecondaryLanguage;
                    ddlSecondaryLangEdit.DataTextField = "secondaryLanguagename";
                    ddlSecondaryLangEdit.DataValueField = "languagecode";
                    ddlSecondaryLangEdit.DataBind();
                    ddlSecondaryLangEdit.Items.Insert(0, lst);
                    ddlSecondaryLangEdit.Items.FindByValue(selectedLanguage).Selected = true;
                }
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }
    protected void SecondaryAnswerView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int secondaryanswerID = Convert.ToInt32(SecondaryAnswerView.DataKeys[e.RowIndex].Values[0]);
            answer_mastersecondarylanguage am = db.answer_mastersecondarylanguage.Where(b => b.secondaryanswerid == secondaryanswerID).First();
            db.answer_mastersecondarylanguage.Remove(am);
            db.SaveChanges();
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void SecondaryAnswerView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            SecondaryAnswerView.EditIndex = e.NewEditIndex;
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void SecondaryAnswerView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int AnswerID = Convert.ToInt32(SecondaryAnswerView.DataKeys[e.RowIndex].Values[0]);
            answer_mastersecondarylanguage am = db.answer_mastersecondarylanguage.Where(b => b.secondaryanswerid == AnswerID).First();
            DropDownList ddlAnswer = (DropDownList)SecondaryAnswerView.Rows[e.RowIndex].FindControl("ddlAnswerEdit");
            DropDownList ddlSecondary = (DropDownList)SecondaryAnswerView.Rows[e.RowIndex].FindControl("ddlSecondaryLang");
            TextBox Description = (TextBox)SecondaryAnswerView.Rows[e.RowIndex].FindControl("txtDescription");

            am.answerid = Convert.ToInt32(ddlAnswer.SelectedValue);
            am.secondaryfieldnamelanguage = ddlSecondary.SelectedValue;
            am.secondaryfieldnamevalue = Description.Text.Trim();


            SecondaryAnswerView.EditIndex = -1;
            db.SaveChanges();
            BindAnswer();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
}