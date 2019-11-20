using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_titlemaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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

                var existingData = (from data in db.titlemaster
                                    where data.titlename == txtDescription.Text.Trim()
                                    select data.titlename).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objTitle.titlename = txtDescription.Text.Trim();

                    db.titlemaster.Add(objTitle);
                    db.SaveChanges();
                    BindTitle();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description ')", true);
                }
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
            var existsInpersonaldetails = db.applicantdetails.Where(x => x.title == ID).ToList();
            if (existsInpersonaldetails.Count == 0)
            {
                db.titlemaster.Remove(objTitle);
                db.SaveChanges();
                BindTitle();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This title as it already Used in another records')", true);

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

    protected void gvTitle_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTitle.PageIndex = e.NewPageIndex;
        BindTitle();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvTitle.FooterRow != null)
            control = gvTitle.FooterRow;
        else
            control = gvTitle.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        titlemaster objID = new titlemaster();

        objID.titlename = idDescriptonText;

        db.titlemaster.Add(objID);
        db.SaveChanges();
        BindTitle();
    }
}