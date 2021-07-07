using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gtemanagedeclaration_master : System.Web.UI.Page
{
    Logger objLog = new Logger();
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
            var declarationList = (from d in db.gte_declaration_master
                                   join um in db.university_master
                                   on d.universityId equals um.universityid
                                   where um.IsDeleted != 1
                                   select new
                                   {
                                       id = d.Id,
                                       description = d.statementdescription.Replace(Environment.NewLine, "<br />"),
                                       header = d.header_description.Replace(Environment.NewLine, "<br />"),
                                       UniversityName = um.university_name,
                                   }).ToList();
            if (declarationList != null)
            {
                gvgtedeclartionGrid.DataSource = declarationList;
                gvgtedeclartionGrid.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvgtedeclartionGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvgtedeclartionGrid.EditIndex = -1;
        BindGrid();
    }

    protected void gvgtedeclartionGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvgtedeclartionGrid.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvgtedeclartionGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void gvgtedeclartionGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvgtedeclartionGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvgtedeclartionGrid.PageIndex = e.NewPageIndex;
        BindGrid();

    }

    protected void gvgtedeclartionGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                gte_declaration_master dm = db.gte_declaration_master.Where(b => b.Id == ID).First();
                db.gte_declaration_master.Remove(dm);
                db.SaveChanges();
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}