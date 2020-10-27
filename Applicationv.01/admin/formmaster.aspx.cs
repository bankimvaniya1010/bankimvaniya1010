using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_formmaster : System.Web.UI.Page
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
            BindInference();
    }
    private void BindInference()
    {
        try
        {
            var FormList = (from q in db.formmaster

                            select new
                            {
                                formid = q.formid,
                                formname = q.formname,
                                Service = q.service == 1?"Full Service": q.service == 2? "Assessment": q.service == null ?"Common": "GTE",
                            }).ToList();
            if (FormList != null)
            {
                FormGridView.DataSource = FormList;
                FormGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormGridView_DataBound(object sender, EventArgs e)
    {

    }

    protected void FormGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        FormGridView.EditIndex = -1;
        BindInference();
    }

    protected void FormGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                formmaster objForm = new formmaster();

                TextBox txtDescription = (TextBox)FormGridView.FooterRow.FindControl("txtDescription1");
                DropDownList ddlServiceFooter = (DropDownList)FormGridView.FooterRow.FindControl("ddlServiceFooter");

                objForm.formname = txtDescription.Text.Trim();
                if (ddlServiceFooter.SelectedValue != "")
                {
                    if (ddlServiceFooter.SelectedValue == "GTE")
                        objForm.service = 0;
                    else if (ddlServiceFooter.SelectedValue == "Full Service")
                        objForm.service = 1;
                    else if (ddlServiceFooter.SelectedValue == "Assessment")
                        objForm.service = 2;
                }
                db.formmaster.Add(objForm);
                db.SaveChanges();
                BindInference();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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
            ListItem lst = new ListItem("Please select", "0");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    //check if is in edit mode
                    if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                    {

                        DropDownList ddlService = (e.Row.FindControl("ddlService") as DropDownList);
                        string selectedFormName = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();

                        Label lblService = (e.Row.FindControl("lblService") as Label);
                        if (lblService != null)
                            selectedFormName = lblService.Text;
                        if (ddlService != null)
                        {
                            ddlService.Items.Insert(0, "GTE");
                            ddlService.Items.Insert(1, "Full Service");
                            ddlService.Items.Insert(2, "Assessment");
                            ddlService.Items.FindByText(selectedFormName).Selected = true;
                        }
                    }
                }
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlServiceFooter = (e.Row.FindControl("ddlServiceFooter") as DropDownList);
                if (ddlServiceFooter != null)
                {
                    ddlServiceFooter.Items.Insert(0, "GTE");
                    ddlServiceFooter.Items.Insert(1, "Full Service");                    
                    ddlServiceFooter.Items.Insert(2, "Assessment");
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void FormGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormGridView.DataKeys[e.RowIndex].Values[0]);
            formmaster FormID = db.formmaster.Where(b => b.formid == formID).First();
            db.formmaster.Remove(FormID);
            db.SaveChanges();
            BindInference();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        FormGridView.EditIndex = e.NewEditIndex;
        BindInference();
    }

    protected void FormGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void FormGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormGridView.DataKeys[e.RowIndex].Values[0]);
            formmaster fn = db.formmaster.Where(b => b.formid == formID).First();

            DropDownList ddlService = (DropDownList)FormGridView.Rows[e.RowIndex].FindControl("ddlService");
            TextBox txtDescription = (TextBox)FormGridView.Rows[e.RowIndex].FindControl("txtDescription");

            fn.formname = txtDescription.Text.Trim();
            fn.Active = 1;
            if (ddlService.SelectedValue != "")
            {
                if (ddlService.SelectedValue == "GTE")
                    fn.service = 0;
                else if (ddlService.SelectedValue == "Full Service")
                    fn.service = 1;
                else if (ddlService.SelectedValue == "Assessment")
                    fn.service = 2;
            }

            FormGridView.EditIndex = -1;
            db.SaveChanges();
            BindInference();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FormGridView.PageIndex = e.NewPageIndex;
        BindInference();
    }
}