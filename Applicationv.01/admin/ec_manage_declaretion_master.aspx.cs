using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_manage_declaretion_master : System.Web.UI.Page
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
            var declarationList = (from d in db.declaration_master
                                   join um in db.university_master
                                   on d.universityId equals um.universityid
                                   where um.IsDeleted != 1 /*&& d.serviceId == 5*/
                                   select new
                                   {
                                       id = d.Id,
                                       description = d.statement_description.Replace(Environment.NewLine, "<br />"),
                                       header = d.header_description.Replace(Environment.NewLine, "<br />"),
                                       UniversityName = um.university_name
                                   }).ToList();
            //Session["description"] = description;
            if (declarationList != null)
            {
                gvdeclartionGrid.DataSource = declarationList;
                gvdeclartionGrid.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvdeclartionGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvdeclartionGrid.EditIndex = -1;
        BindGrid();
    }

    protected void gvdeclartionGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvdeclartionGrid.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvdeclartionGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void gvdeclartionGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvdeclartionGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvdeclartionGrid.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void gvdeclartionGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                declaration_master dm = db.declaration_master.Where(b => b.Id == ID).First();
                db.declaration_master.Remove(dm);
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