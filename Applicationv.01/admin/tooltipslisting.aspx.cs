using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_tooltipslisting : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            bindFrom();

        }
    }

  
    private void bindFrom()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.formmaster
                        
                         select new
                         {
                             formname = a.formname,
                             formid = a.formid
                         }).ToList();
            ddlForm.DataSource = forms;
            ddlForm.DataTextField = "formname";
            ddlForm.DataValueField = "formid";
            ddlForm.DataBind();
            ddlForm.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
   
    private void BindGird()
    {
        try
        {
            int formID = 0; ;
           

            if (ddlForm.SelectedValue != "")
                formID = Convert.ToInt32(ddlForm.SelectedValue);
            var FieldList = (from pfm in db.primaryfieldmaster
                             join tooltips in db.tooltipmaster
                             on pfm.primaryfieldid equals tooltips.fieldid
                             where pfm.formid == formID
                             select new
                             {
                                 id = tooltips.id,
                                 primaryfiledname = pfm.primaryfiledname,
                                 tooltips = tooltips.tooltips == null ? string.Empty : tooltips.tooltips
                             }).ToList();


            if (FieldList != null)
            {
                gvField.DataSource = FieldList;
                gvField.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlForm_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGird();
    }

    protected void gvField_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            var id = (int)gvField.DataKeys[e.NewEditIndex].Value;
            Response.Redirect("tooltipsaddedit.aspx?id=" + id, true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvField_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

            int ID = Convert.ToInt32(gvField.DataKeys[e.RowIndex].Values[0]);
            tooltipmaster tooltips = db.tooltipmaster.Where(b => b.id == ID).First();
            db.tooltipmaster.Remove(tooltips);
            db.SaveChanges();
            BindGird();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvField_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

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
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvField_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvField.PageIndex = e.NewPageIndex;
        BindGird();
    }
}

