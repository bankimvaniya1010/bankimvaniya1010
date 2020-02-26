using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gtetutorialmaster : System.Web.UI.Page
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
            BindGrid();
    }


    private void BindGrid()
    {
        try
        {
            var TutorialList = (from q in db.gte_tutorialmaster
                                join um in db.university_master
                                on q.universityid equals um.universityid

                                select new
                                {
                                    id = q.id,
                                    videourl = q.videourl,
                                    title = q.title,
                                    status = q.status,
                                    type = q.type,
                                    UniversityName = um.university_name
                                }).ToList();
            if (TutorialList != null)
            {
                QuestiontGridView.DataSource = TutorialList;
                QuestiontGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QuestiontGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QuestiontGridView.EditIndex = -1;
        BindGrid();
    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {        
        try
        {            
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                gte_tutorialmaster qm = db.gte_tutorialmaster.Where(b => b.id == ID).First();
                db.gte_tutorialmaster.Remove(qm);
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