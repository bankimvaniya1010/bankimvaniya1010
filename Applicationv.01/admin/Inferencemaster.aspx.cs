using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class admin_Inferencemaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindInference();
    }
    private void BindInference()
    {
        try
        {
            var QuestionList = (from q in db.inferencemaster

                                select new
                                {
                                    inferenceid = q.inferenceid,
                                    description = q.description,

                                }).ToList();
            if (QuestionList != null)
            {
                InferenceGridView.DataSource = QuestionList;
                InferenceGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void InferenceGridView_DataBound(object sender, EventArgs e)
    {

    }

    protected void InferenceGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        InferenceGridView.EditIndex = -1;
        BindInference();
    }

    protected void InferenceGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                inferencemaster objInference = new inferencemaster();

                TextBox txtDescription = (TextBox)InferenceGridView.FooterRow.FindControl("txtDescription1");

                objInference.description = txtDescription.Text.Trim();

                db.inferencemaster.Add(objInference);
                db.SaveChanges();
                BindInference();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void InferenceGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[3].Controls[0];
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

    protected void InferenceGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void InferenceGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int Inferenceid = Convert.ToInt32(InferenceGridView.DataKeys[e.RowIndex].Values[0]);
            inferencemaster InferenceID = db.inferencemaster.Where(b => b.inferenceid == Inferenceid).First();
            db.inferencemaster.Remove(InferenceID);
            db.SaveChanges();
            BindInference();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void InferenceGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        InferenceGridView.EditIndex = e.NewEditIndex;
        BindInference();
    }

    protected void InferenceGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void InferenceGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int InfID = Convert.ToInt32(InferenceGridView.DataKeys[e.RowIndex].Values[0]);
            inferencemaster qm = db.inferencemaster.Where(b => b.inferenceid == InfID).First();
            TextBox txtDescription = (TextBox)InferenceGridView.Rows[e.RowIndex].FindControl("txtDescription");

            qm.description = txtDescription.Text.Trim();

            InferenceGridView.EditIndex = -1;
            db.SaveChanges();
            BindInference();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}