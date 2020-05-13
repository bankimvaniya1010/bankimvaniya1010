using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editusers : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    int universityID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        if (!IsPostBack)
            BindGrid();

    }
    private void BindGrid()
    {
        try
        {
            var list = (from q in db.adminusers
                        join um in db.rolemaster
                        on q.roleid equals um.roleid
                        where q.universityId == universityID
                        select new
                        {
                            id = q.adminid,
                            name = q.name,
                            username = q.username,
                            mobile = q.mobile,
                            email = q.email,
                            rolename = um.rolename
                        }).SortBy("id").ToList();
            if (list != null)
            {
                UserGridView.DataSource = list;
                UserGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        UserGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                adminusers qm = db.adminusers.Where(b => b.adminid == ID).First();
                db.adminusers.Remove(qm);
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