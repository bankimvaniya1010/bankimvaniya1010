using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_predeparturetutoriallisting : System.Web.UI.Page
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
            var tutorialList = (from q in db.predeparturetutorialmaster
                                join um in db.university_master
                                on q.universityid equals um.universityid

                                select new
                                {
                                    id = q.predeparturetutorialid,
                                    videourl = q.videourl,
                                    title = q.title,                                    
                                    type = q.type,
                                    UniversityName = um.university_name
                                }).ToList();
            if (tutorialList != null)
            {
                TutorialGridView.DataSource = tutorialList;
                TutorialGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void TutorialGridView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in TutorialGridView.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[5].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void TutorialGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void TutorialGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        TutorialGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void TutorialGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        TutorialGridView.EditIndex = -1;
        BindGrid();

    }

    protected void TutorialGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(TutorialGridView.DataKeys[e.RowIndex].Values[0]);
            predeparturetutorialmaster qm = db.predeparturetutorialmaster.Where(b => b.predeparturetutorialid == ID).First();
            db.predeparturetutorialmaster.Remove(qm);
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void TutorialGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        TutorialGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}