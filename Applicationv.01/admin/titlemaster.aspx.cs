using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_titlemaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindTitle();
    }
    private void BindTitle()
    {
        try
        {
            var title = (from q in db.titlemaster

                         select new
                         {
                             titleid = q.titleid,
                             titlename = q.titlename,

                         }).ToList();
            if (title != null)
            {
                gvTitle.DataSource = title;
                gvTitle.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvTitle_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvTitle_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvTitle.EditIndex = -1;
        BindTitle();
    }

    protected void gvTitle_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                titlemaster objTitle = new titlemaster();

                TextBox txtDescription = (TextBox)gvTitle.FooterRow.FindControl("txtDescription1");

                objTitle.titlename = txtDescription.Text.Trim();

                db.titlemaster.Add(objTitle);
                db.SaveChanges();
                BindTitle();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvTitle_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvTitle_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvTitle_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvTitle.DataKeys[e.RowIndex].Values[0]);
            titlemaster objTitle = db.titlemaster.Where(b => b.titleid == ID).First();
            db.titlemaster.Remove(objTitle);
            db.SaveChanges();
            BindTitle();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvTitle_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTitle.EditIndex = e.NewEditIndex;
        BindTitle();
    }

    protected void gvTitle_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvTitle_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvTitle.DataKeys[e.RowIndex].Values[0]);
            titlemaster objTitle = db.titlemaster.Where(b => b.titleid == ID).First();


            TextBox txtDescription = (TextBox)gvTitle.Rows[e.RowIndex].FindControl("txtDescription");

            objTitle.titlename = txtDescription.Text.Trim();

            gvTitle.EditIndex = -1;
            db.SaveChanges();
            BindTitle();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}