using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_grademaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrade();
    }
    private void BindGrade()
    {
        try
        {
            var gradeList = (from q in db.grademaster

                             select new
                             {
                                 id = q.id,
                                 description = q.description,

                             }).ToList();
            if (gradeList != null)
            {
                gvGrade.DataSource = gradeList;
                gvGrade.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvGrade_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvGrade.EditIndex = -1;
        BindGrade();
    }

    protected void gvGrade_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                grademaster objGrade = new grademaster();

                TextBox txtDescription = (TextBox)gvGrade.FooterRow.FindControl("txtDescription1");

                objGrade.description = txtDescription.Text.Trim();

                db.grademaster.Add(objGrade);
                db.SaveChanges();
                BindGrade();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvGrade_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvGrade_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvGrade.DataKeys[e.RowIndex].Values[0]);
            grademaster objGrade = db.grademaster.Where(b => b.id == ID).First();
            db.grademaster.Remove(objGrade);
            db.SaveChanges();
            BindGrade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvGrade.EditIndex = e.NewEditIndex;
        BindGrade();
    }

    protected void gvGrade_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvGrade_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvGrade.DataKeys[e.RowIndex].Values[0]);
            grademaster objGrade = db.grademaster.Where(b => b.id == ID).First();
            TextBox txtDescription = (TextBox)gvGrade.Rows[e.RowIndex].FindControl("txtDescription");
            objGrade.description = txtDescription.Text.Trim();
            gvGrade.EditIndex = -1;
            db.SaveChanges();
            BindGrade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGrade.PageIndex = e.NewPageIndex;
        BindGrade();
    }
}