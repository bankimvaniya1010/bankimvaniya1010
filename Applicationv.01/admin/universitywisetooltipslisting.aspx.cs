using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitywisetooltipslisting : System.Web.UI.Page
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
            bindUniversity();

        }
    }
    private void bindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.university_master

                         select new
                         {
                             universityid = a.universityid,
                             university_name = a.university_name
                         }).ToList();
            ddlUniversity.DataSource = forms;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindFrom(int UniversityID)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.formmaster
                         join q in db.universitywiseformmapping on a.formid equals q.formid
                         where q.universityid == UniversityID
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
    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUniversity.SelectedValue != "")
            bindFrom(Convert.ToInt32(ddlUniversity.SelectedValue));
    }

    private void BindGird()
    {
        try
        {
            int formID = 0; ;
            int universityID = 0;
            if (ddlUniversity.SelectedValue != "")
                universityID = Convert.ToInt32(ddlUniversity.SelectedValue);

            if (ddlForm.SelectedValue != "")
                formID = Convert.ToInt32(ddlForm.SelectedValue);
            var FieldList = (from pfm in db.primaryfieldmaster
                             join utm in db.universitywisetooltipmaster
                             on pfm.primaryfieldid equals utm.fieldid
                             where pfm.formid == formID && utm.universityid == universityID
                             select new
                             {
                                 id = utm.id,
                                 primaryfiledname = pfm.primaryfiledname,
                                 tooltips = utm.tooltips == null ? string.Empty : utm.tooltips
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
            Response.Redirect("universitywisetooltipsaddedit.aspx?id=" + id, true);
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

