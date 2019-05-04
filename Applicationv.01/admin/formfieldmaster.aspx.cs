using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_formfieldmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindFormFieldView();
    }
    private void BindFormFieldView()
    {
        try
        {
            var FieldList = (from ffm in db.formfieldmaster


                             select new
                             {
                                 formfieldid = ffm.formfieldid,
                                 name = ffm.name,
                                 tooltips = ffm.tooltips,
                                 isvalidation = ffm.isvalidation,
                                 type = ffm.type
                                

                             }).ToList();
            if (FieldList != null)
            {
                FormFieldGridView.DataSource = FieldList;
                FormFieldGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void FormFieldGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                formfieldmaster objFormField = new formfieldmaster();
                DropDownList ddlControl = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlControlFooter");
                CheckBox chkValidation = (CheckBox)FormFieldGridView.FooterRow.FindControl("chkValidationFooter");
                TextBox Name = (TextBox)FormFieldGridView.FooterRow.FindControl("txtNameFooter");
                TextBox ToolTips = (TextBox)FormFieldGridView.FooterRow.FindControl("txtTooltipsFooter");


                objFormField.type = ddlControl.SelectedItem.Text;
                objFormField.isvalidation = chkValidation.Checked == true ? 1 : 0;
                objFormField.name = Name.Text;
                objFormField.tooltips = ToolTips.Text;
                db.formfieldmaster.Add(objFormField);
                db.SaveChanges();
                BindFormFieldView();
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
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                //if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                //{
                //    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                //                                     //cast the ShowDeleteButton link to linkbutton
                //    LinkButton lb = (LinkButton)e.Row.Cells[8].Controls[0];
                //    if (lb != null)
                //    {
                //        //attach the JavaScript function with the ID as the paramter
                //        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                //    }
                //}
            }
            if ((e.Row.RowType == DataControlRowType.DataRow && FormFieldGridView.EditIndex == e.Row.RowIndex) || (e.Row.RowType == DataControlRowType.Footer))
            {
                var controlmaster = db.controlmaster.ToList();

                DropDownList ddlControl = (e.Row.FindControl("ddlControl") as DropDownList);
                DropDownList ddlControlFooter = (e.Row.FindControl("ddlControlFooter") as DropDownList);
                CheckBox chkValidation = (e.Row.FindControl("chkValidationEdit") as CheckBox);
                ListItem lst = new ListItem("Please select", "0");
                string selectedFieldName = "";

                Label FieldType = (e.Row.FindControl("lblControl") as Label);
                Label Validation = (e.Row.FindControl("lblValidation") as Label);
                if (FieldType != null)
                    selectedFieldName = FieldType.Text;
                if (Validation != null && Validation.Text == "1")
                    chkValidation.Checked = true;
                if (ddlControl != null)
                {

                    ddlControl.DataSource = controlmaster;
                    ddlControl.DataTextField = "controltype";
                    ddlControl.DataValueField = "id";
                    ddlControl.DataBind();
                    ddlControl.Items.Insert(0, lst);
                    ddlControl.Items.FindByText(selectedFieldName).Selected = true;
                }
                if (ddlControlFooter != null)
                {

                    ddlControlFooter.DataSource = controlmaster;
                    ddlControlFooter.DataTextField = "controltype";
                    ddlControlFooter.DataValueField = "id";
                    ddlControlFooter.DataBind();
                    ddlControlFooter.Items.Insert(0, lst);
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormFieldGridView.DataKeys[e.RowIndex].Values[0]);
            formfieldmaster FormID = db.formfieldmaster.Where(b => b.formfieldid == formID).First();
            db.formfieldmaster.Remove(FormID);
            db.SaveChanges();
            BindFormFieldView();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormFieldGridView.DataKeys[e.RowIndex].Values[0]);
            formfieldmaster fn = db.formfieldmaster.Where(b => b.formfieldid == formID).First();
            DropDownList ddlControl = (DropDownList)FormFieldGridView.Rows[e.RowIndex].FindControl("ddlControl");
            CheckBox chkValidation = (CheckBox)FormFieldGridView.Rows[e.RowIndex].FindControl("chkValidationEdit");
            TextBox txtName = (TextBox)FormFieldGridView.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtToolTips = (TextBox)FormFieldGridView.Rows[e.RowIndex].FindControl("txtTooltips");
            fn.tooltips = txtToolTips.Text;
            fn.name = txtName.Text;
            fn.type = ddlControl.SelectedItem.Text;
            fn.isvalidation = chkValidation.Checked == true ? 1 : 0;
           
            db.SaveChanges();
            FormFieldGridView.EditIndex = -1;
            BindFormFieldView();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        FormFieldGridView.EditIndex = -1;
        BindFormFieldView();
    }

    protected void FormFieldGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        FormFieldGridView.EditIndex = e.NewEditIndex;
        BindFormFieldView();
    }
}