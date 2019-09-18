using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class admin_primaryfieldmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindField();
    }
    private void BindField()
    {
        try
        {
            var FormList = (from f in db.formmaster
                            join pm in db.primaryfieldmaster on f.formid equals pm.formid

                            select new
                            {
                                primaryfieldid = pm.primaryfieldid,
                                primaryfiledname = pm.primaryfiledname,
                                formname = f.formname

                            }).ToList();
            if (FormList != null)
            {
                FormFieldGridView.DataSource = FormList;
                FormFieldGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_DataBound(object sender, EventArgs e)
    {

    }

    protected void FormFieldGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        FormFieldGridView.EditIndex = -1;
        BindField();
    }

    protected void FormFieldGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                primaryfieldmaster objForm = new primaryfieldmaster();
                DropDownList ddlFormNameFooter = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlFormnameFooter");
                TextBox txtDescription = (TextBox)FormFieldGridView.FooterRow.FindControl("txtDescription1");

                objForm.primaryfiledname = txtDescription.Text.Trim();
                objForm.formid = Convert.ToInt32(ddlFormNameFooter.SelectedValue);
                db.primaryfieldmaster.Add(objForm);
                db.SaveChanges();
                BindField();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[4].Controls[0];
                    if (lb != null)
                    {
                        //attach the JavaScript function with the ID as the paramter
                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                    }
                }
            }


            var formMaster = db.formmaster.ToList();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    //check if is in edit mode
                    if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                    {

                        DropDownList ddlFormNameEdit = (e.Row.FindControl("ddlFormname") as DropDownList);
                        string selectedFormName = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();

                        Label FormName = (e.Row.FindControl("lblFormEdit") as Label);
                        if (FormName != null)
                            selectedFormName = FormName.Text;
                        if (ddlFormNameEdit != null)
                        {

                            ddlFormNameEdit.DataSource = formMaster;
                            ddlFormNameEdit.DataTextField = "formname";
                            ddlFormNameEdit.DataValueField = "formid";
                            ddlFormNameEdit.DataBind();
                            ddlFormNameEdit.Items.Insert(0, lst);
                            ddlFormNameEdit.Items.FindByText(selectedFormName).Selected = true;
                        }
                    }
                }
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlFormNameFooter = (e.Row.FindControl("ddlFormnameFooter") as DropDownList);
                if (ddlFormNameFooter != null)
                {

                    ddlFormNameFooter.DataSource = formMaster;
                    ddlFormNameFooter.DataTextField = "formname";
                    ddlFormNameFooter.DataValueField = "formid";
                    ddlFormNameFooter.DataBind();
                    ddlFormNameFooter.Items.Insert(0, lst);
                }
            }






        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void FormFieldGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void FormFieldGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormFieldGridView.DataKeys[e.RowIndex].Values[0]);
            primaryfieldmaster FormID = db.primaryfieldmaster.Where(b => b.primaryfieldid == formID).First();
            db.primaryfieldmaster.Remove(FormID);
            db.SaveChanges();
            BindField();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        FormFieldGridView.EditIndex = e.NewEditIndex;
        BindField();
    }

    protected void FormFieldGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void FormFieldGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormFieldGridView.DataKeys[e.RowIndex].Values[0]);
            primaryfieldmaster fn = db.primaryfieldmaster.Where(b => b.primaryfieldid == formID).First();

            DropDownList ddlForm = (DropDownList)FormFieldGridView.Rows[e.RowIndex].FindControl("ddlFormname");
            TextBox txtDescription = (TextBox)FormFieldGridView.Rows[e.RowIndex].FindControl("txtDescription");

            fn.primaryfiledname = txtDescription.Text.Trim();
            if (ddlForm.SelectedValue != "")
                fn.formid = Convert.ToInt32(ddlForm.SelectedValue);
            FormFieldGridView.EditIndex = -1;
            db.SaveChanges();
            BindField();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FormFieldGridView.PageIndex = e.NewPageIndex;
        BindField();
    }
}