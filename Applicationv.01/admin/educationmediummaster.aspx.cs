using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_educationmediummaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindEducationMedium();
    }
    private void BindEducationMedium()
    {
        try
        {
            var MediumList = db.educationmediummaster.Select(c => new { c.id, c.description }).OrderByDescending(c => c.description.Equals("english", StringComparison.OrdinalIgnoreCase)).ThenBy(c => c.description).ToList();
            if (MediumList != null)
            {
                gvEducationMedium.DataSource = MediumList;
                gvEducationMedium.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationMedium_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvEducationMedium_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvEducationMedium.EditIndex = -1;
        BindEducationMedium();
    }

    protected void gvEducationMedium_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                educationmediummaster ObjMedium = new educationmediummaster();

                TextBox txtDescription = (TextBox)gvEducationMedium.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.educationmediummaster
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    ObjMedium.description = txtDescription.Text.Trim();

                    db.educationmediummaster.Add(ObjMedium);
                    db.SaveChanges();
                    BindEducationMedium();
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

    protected void gvEducationMedium_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvEducationMedium_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvEducationMedium_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvEducationMedium.DataKeys[e.RowIndex].Values[0]);
            educationmediummaster ObjMedium = db.educationmediummaster.Where(b => b.id == ID).First();
            var existsIneducationDetails = db.applicanteducationdetails.Where(d => d.highschoolmediumid == 0 && d.secondarymediumstudy == 0 && d.diplomamediumid == 0).ToList();
            var existsInhighereduDetail = db.applicanthighereducation.Where(h => h.studymediumid == 0).ToList();
            if(existsIneducationDetails.Count == 0 && existsInhighereduDetail.Count == 0)
            {
                db.educationmediummaster.Remove(ObjMedium);
                db.SaveChanges();
                BindEducationMedium();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This Education Medium data as it already Used in another records')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationMedium_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvEducationMedium.EditIndex = e.NewEditIndex;
        BindEducationMedium();
    }

    protected void gvEducationMedium_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvEducationMedium_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvEducationMedium.DataKeys[e.RowIndex].Values[0]);
            educationmediummaster ObjMedium = db.educationmediummaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvEducationMedium.Rows[e.RowIndex].FindControl("txtDescription");

            ObjMedium.description = txtDescription.Text.Trim();

            gvEducationMedium.EditIndex = -1;
            db.SaveChanges();
            BindEducationMedium();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationMedium_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEducationMedium.PageIndex = e.NewPageIndex;
        BindEducationMedium();
    }
    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvEducationMedium.FooterRow != null)
            control = gvEducationMedium.FooterRow;
        else
            control = gvEducationMedium.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        educationmediummaster objID = new educationmediummaster();

        objID.description = idDescriptonText;

        db.educationmediummaster.Add(objID);
        db.SaveChanges();
        BindEducationMedium();
    }
}