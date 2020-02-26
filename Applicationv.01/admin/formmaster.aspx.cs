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

                objForm.formname = txtDescription.Text.Trim();

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


            TextBox txtDescription = (TextBox)FormGridView.Rows[e.RowIndex].FindControl("txtDescription");

            fn.formname = txtDescription.Text.Trim();

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