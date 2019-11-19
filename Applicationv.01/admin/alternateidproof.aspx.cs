using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_alternateidproof : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindIDProof();
    }
    private void BindIDProof()
    {
        try
        {
            var IDProof = (from q in db.alternateidproofmaster

                           select new
                           {
                               id = q.id,
                               description = q.description,

                           }).ToList();
            if (IDProof != null)
            {
                gvIDProof.DataSource = IDProof;
                gvIDProof.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvIDProof_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvIDProof_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvIDProof.EditIndex = -1;
            BindIDProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvIDProof_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                alternateidproofmaster objID = new alternateidproofmaster();

                TextBox txtDescription = (TextBox)gvIDProof.FooterRow.FindControl("txtDescription1");

                objID.description = txtDescription.Text.Trim();

                db.alternateidproofmaster.Add(objID);
                db.SaveChanges();
                BindIDProof();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvIDProof_RowDataBound(object sender, GridViewRowEventArgs e)
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
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvIDProof_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvIDProof_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvIDProof.DataKeys[e.RowIndex].Values[0]);
            alternateidproofmaster objID = db.alternateidproofmaster.Where(b => b.id == ID).First();
            var existsIndetails = db.applicantdetails.Where(d => d.alternativeIdentityproofId == ID).ToList();
            var existsIncountrywisemapping = db.countrywisealternateidproofmaster.Where(c => c.alternateidproofID == ID).ToList();
            if (existsIndetails.Count == 0 && existsIncountrywisemapping.Count == 0)
            {
                db.alternateidproofmaster.Remove(objID);
                db.SaveChanges();
                BindIDProof();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Alternate ID Proof as it already used in another records')", true);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvIDProof_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvIDProof.EditIndex = e.NewEditIndex;
        BindIDProof();
    }

    protected void gvIDProof_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvIDProof_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvIDProof.DataKeys[e.RowIndex].Values[0]);
            alternateidproofmaster objID = db.alternateidproofmaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvIDProof.Rows[e.RowIndex].FindControl("txtDescription");

            objID.description = txtDescription.Text.Trim();

            gvIDProof.EditIndex = -1;
            db.SaveChanges();
            BindIDProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvIDProof_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvIDProof.PageIndex = e.NewPageIndex;
        BindIDProof();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvIDProof.FooterRow != null)
            control = gvIDProof.FooterRow;
        else
            control = gvIDProof.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        alternateidproofmaster objID = new alternateidproofmaster();

        objID.description = idDescriptonText;

        db.alternateidproofmaster.Add(objID);
        db.SaveChanges();
        BindIDProof();
    }
}