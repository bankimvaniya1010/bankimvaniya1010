using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_subjectmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "admin/login.aspx", true);
        if (!IsPostBack)
            BindSubject();
    }
    private void BindSubject()
    {
        try
        {
            var SubjectList = (from q in db.subjectmaster

                                     select new
                                     {
                                         id = q.id,
                                         description = q.description,

                                     }).ToList();
            if (SubjectList != null)
            {
                SubjectGridView.DataSource = SubjectList;
                SubjectGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void SubjectGridView_DataBound(object sender, EventArgs e)
    {

    }

    protected void SubjectGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        SubjectGridView.EditIndex = -1;
        BindSubject();
    }

    protected void SubjectGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                subjectmaster objSubject = new subjectmaster();

                TextBox txtDescription = (TextBox)SubjectGridView.FooterRow.FindControl("txtDescriptionFooter");

                objSubject.description = txtDescription.Text.Trim();

                db.subjectmaster.Add(objSubject);
                db.SaveChanges();
                BindSubject();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void SubjectGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void SubjectGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void SubjectGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(SubjectGridView.DataKeys[e.RowIndex].Values[0]);
            subjectmaster QID = db.subjectmaster.Where(b => b.id == ID).First();
            db.subjectmaster.Remove(QID);
            db.SaveChanges();
            BindSubject();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void SubjectGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        SubjectGridView.EditIndex = e.NewEditIndex;
        BindSubject();
    }

    protected void SubjectGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void SubjectGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(SubjectGridView.DataKeys[e.RowIndex].Values[0]);
            subjectmaster objSubject = db.subjectmaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)SubjectGridView.Rows[e.RowIndex].FindControl("txtDescription");

            objSubject.description = txtDescription.Text.Trim();

            SubjectGridView.EditIndex = -1;
            db.SaveChanges();
            BindSubject();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}