using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_outcome_master : System.Web.UI.Page
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
            var data = (from q in db.careeroutcomes_master

                        select new
                        {
                            id = q.careerID,
                            description = q.description,

                        }).ToList();
            if (data != null)
            {
                gvoutcomes.DataSource = data;
                gvoutcomes.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvoutcomes_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvoutcomes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvoutcomes.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvoutcomes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                careeroutcomes_master objID = new careeroutcomes_master();

                TextBox txtDescription = (TextBox)gvoutcomes.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.careeroutcomes_master
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objID.description = txtDescription.Text.Trim();

                    db.careeroutcomes_master.Add(objID);
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

    protected void gvoutcomes_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvoutcomes_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvoutcomes_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvoutcomes.DataKeys[e.RowIndex].Values[0]);
            careeroutcomes_master objID = db.careeroutcomes_master.Where(b => b.careerID == ID).First();
            var existspositionmapping = db.careeroutcomes_position_master.Where(d => d.careerID == ID).ToList();
            
            if (existspositionmapping.Count == 0)
            {
                db.careeroutcomes_master.Remove(objID);
                db.SaveChanges();
                BindGrid();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this career outcome as it already used in another records')", true);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvoutcomes_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvoutcomes.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvoutcomes_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvoutcomes_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvoutcomes.DataKeys[e.RowIndex].Values[0]);
            careeroutcomes_master objID = db.careeroutcomes_master.Where(b => b.careerID == ID).First();


            TextBox txtDescription = (TextBox)gvoutcomes.Rows[e.RowIndex].FindControl("txtDescription");

            objID.description = txtDescription.Text.Trim();

            gvoutcomes.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvoutcomes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvoutcomes.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvoutcomes.FooterRow != null)
            control = gvoutcomes.FooterRow;
        else
            control = gvoutcomes.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        careeroutcomes_master objID = new careeroutcomes_master();

        objID.description = idDescriptonText;

        db.careeroutcomes_master.Add(objID);
        db.SaveChanges();
        BindGrid();
    }
}