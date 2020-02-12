using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_paymentdescriptionmaster : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var IDProof = (from q in db.payment_description_master
                           select new
                           {
                               id = q.id,
                               payment_description = q.payment_description,

                           }).ToList();
            if (IDProof != null)
            {
                gvPaymentDescription.DataSource = IDProof;
                gvPaymentDescription.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }


    protected void gvPaymentDescription_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvPaymentDescription_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvPaymentDescription.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPaymentDescription_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))
            {
                payment_description_master objID = new payment_description_master();
                TextBox txtDescription = (TextBox)gvPaymentDescription.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.payment_description_master
                                    where data.payment_description == txtDescription.Text.Trim()
                                    select data.payment_description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objID.payment_description = txtDescription.Text.Trim();

                    db.payment_description_master.Add(objID);
                    db.SaveChanges();
                    BindGrid();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description ')", true);
                }
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPaymentDescription_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvPaymentDescription_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvPaymentDescription_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvPaymentDescription.DataKeys[e.RowIndex].Values[0]);
            payment_description_master objID = db.payment_description_master.Where(b => b.id == ID).First();
            var existsIndetails = db.payment_details.Where(d => d.payment_for == ID).ToList();
            
            if (existsIndetails.Count == 0)
            {
                db.payment_description_master.Remove(objID);
                db.SaveChanges();
                BindGrid();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this payemnt type as it already used in another records')", true);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPaymentDescription_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPaymentDescription.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvPaymentDescription_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvPaymentDescription_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        try
        {
            int ID = Convert.ToInt32(gvPaymentDescription.DataKeys[e.RowIndex].Values[0]);
            payment_description_master objID = db.payment_description_master.Where(b => b.id == ID).First();

            TextBox txtDescription = (TextBox)gvPaymentDescription.Rows[e.RowIndex].FindControl("txtDescription");
            objID.payment_description = txtDescription.Text.Trim();
            gvPaymentDescription.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPaymentDescription_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPaymentDescription.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvPaymentDescription.FooterRow != null)
            control = gvPaymentDescription.FooterRow;
        else
            control = gvPaymentDescription.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        payment_description_master objID = new payment_description_master();
        objID.payment_description = idDescriptonText;
        db.payment_description_master.Add(objID);
        db.SaveChanges();
        BindGrid();
    }
}