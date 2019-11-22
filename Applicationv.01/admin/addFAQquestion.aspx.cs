using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addFAQquestion : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!IsPostBack)
            BindFAQ();

    }

    private void BindFAQ() {
        try
        {
            var FaqList = (from q in db.faq

                                  select new
                                  {
                                      id = q.id,
                                      question = q.question,
                                      answer = q.answer,

                                  }).ToList();
            if (FaqList != null)
            {
                gvFAQ.DataSource = FaqList;
                gvFAQ.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvFAQ_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvFAQ_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvFAQ.EditIndex = -1;
        BindFAQ();
    }

    protected void gvFAQ_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                faq objFaq = new faq();

                TextBox txtQuestion = (TextBox)gvFAQ.FooterRow.FindControl("txtQuestion1");
                TextBox txtAnswer = (TextBox)gvFAQ.FooterRow.FindControl("txtAnswer1");

                var existingData = (from data in db.faq
                                    where data.question == txtQuestion.Text.Trim()
                                    select data.question).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objFaq.question = txtQuestion.Text.Trim();
                    objFaq.answer = txtAnswer.Text.Trim();

                    db.faq.Add(objFaq);
                    db.SaveChanges();
                    BindFAQ();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered question description')", true);
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvFAQ_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[4].Controls[0];
                    if (lb != null)
                    {
                        //attach the JavaScript function with the ID as the paramter
                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvFAQ_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvFAQ_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvFAQ.DataKeys[e.RowIndex].Values[0]);
            faq objFaq = db.faq.Where(b => b.id == ID).First();
            var existsInUniversitywisemapping = (from umm in db.universitywise_faqmapping
                                                 join q in db.faq on umm.faq_questionID equals ID
                                                 where umm.universityid == universityID
                                                 select q).ToList();
            
            if (existsInUniversitywisemapping.Count == 0)
            {
                db.faq.Remove(objFaq);
                db.SaveChanges();
                BindFAQ();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This Question it already Used to mapped universitywise')", true);



        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void gvFAQ_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvFAQ.EditIndex = e.NewEditIndex;
            BindFAQ();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvFAQ_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvFAQ_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvFAQ.DataKeys[e.RowIndex].Values[0]);
            faq objfaq= db.faq.Where(b => b.id == ID).First();


            TextBox txtQuestion = (TextBox)gvFAQ.Rows[e.RowIndex].FindControl("txtQuestion");
            TextBox txtAnswer = (TextBox)gvFAQ.Rows[e.RowIndex].FindControl("txtAnswer");

            objfaq.question = txtQuestion.Text.Trim();
            objfaq.answer= txtAnswer.Text.Trim();

            gvFAQ.EditIndex = -1;
            db.SaveChanges();
            BindFAQ();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }


    }

    protected void gvFAQ_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvFAQ.PageIndex = e.NewPageIndex;
        BindFAQ();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvFAQ.FooterRow != null)
            control = gvFAQ.FooterRow;
        else
            control = gvFAQ.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordQuestion") as TextBox).Text;
        string idAnswerText = (control.FindControl("txtEmptyRecordAns") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText) || string.IsNullOrEmpty(idAnswerText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data Cannot Be Empty')", true);
            return;
        }

        faq objID = new faq();

        objID.question= idDescriptonText;
        objID.answer= idAnswerText;

        db.faq.Add(objID);
        db.SaveChanges();
        BindFAQ();
    }
}