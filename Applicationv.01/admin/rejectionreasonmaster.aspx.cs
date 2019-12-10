using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_rejectionreasonmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindReasons();
    }

    private void BindReasons()
    {
        try
        {
            var ReasonList = db.rejection_reasonmaster.ToList();
            if (ReasonList != null)
            {
                gvRejectionReason.DataSource = ReasonList;
                gvRejectionReason.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvRejectionReason_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvRejectionReason_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvRejectionReason.EditIndex = -1;
        BindReasons();
    }

    protected void gvRejectionReason_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                rejection_reasonmaster ObjReason= new rejection_reasonmaster();

                TextBox txtDescription = (TextBox)gvRejectionReason.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.rejection_reasonmaster
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    ObjReason.description = txtDescription.Text.Trim();

                    db.rejection_reasonmaster.Add(ObjReason);
                    db.SaveChanges();
                    BindReasons();
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

    protected void gvRejectionReason_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvRejectionReason_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvRejectionReason_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvRejectionReason.DataKeys[e.RowIndex].Values[0]);
            rejection_reasonmaster ObjReason = db.rejection_reasonmaster.Where(b => b.id == ID).First();
            var existsInUniversitymapping = db.universitywise_rejectionreasonmapping.Where(h => h.reasonid == ID).ToList();
            var existsInapplicationmaster = db.applicationmaster.Where(r => r.rejection_reason == ID).ToList();
            if (existsInUniversitymapping.Count == 0 && existsInapplicationmaster.Count == 0)
            {
                db.rejection_reasonmaster.Remove(ObjReason);
                db.SaveChanges();
                BindReasons();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This data as it already Used in another records')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvRejectionReason_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvRejectionReason.EditIndex = e.NewEditIndex;
        BindReasons();
    }

    protected void gvRejectionReason_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvRejectionReason_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvRejectionReason.DataKeys[e.RowIndex].Values[0]);
            rejection_reasonmaster ObjReason = db.rejection_reasonmaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvRejectionReason.Rows[e.RowIndex].FindControl("txtDescription");

            var existingData = (from data in db.rejection_reasonmaster
                                where data.description == txtDescription.Text.Trim()
                                select data.description).FirstOrDefault();

            if (string.IsNullOrEmpty(existingData))
            {
                ObjReason.description = txtDescription.Text.Trim();

                gvRejectionReason.EditIndex = -1;
                db.SaveChanges();
                BindReasons();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description ')", true);
            }            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvRejectionReason_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvRejectionReason.PageIndex = e.NewPageIndex;
        BindReasons();
    }
    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvRejectionReason.FooterRow != null)
            control = gvRejectionReason.FooterRow;
        else
            control = gvRejectionReason.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        rejection_reasonmaster objID = new rejection_reasonmaster();

        objID.description = idDescriptonText;

        db.rejection_reasonmaster.Add(objID);
        db.SaveChanges();
        BindReasons();
    }
}