using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_coursemaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var courseList = (from cm in db.coursemaster
                                    join displine in db.majordiscipline_master on cm.majordisciplineId equals displine.id
                                    join study in db.studymodemaster on cm.modeofstudyId equals study.id
                                    join level in db.studylevelmaster on cm.levelofstudyId equals level.studylevelid
                                    select new
                                    {
                                        courseid = cm.courseid,
                                        coursename = cm.coursename,
                                        displineDesc = displine.description,
                                        studyDesc = study.description,
                                        studylevel = level.studylevel,
                                        coursefee = cm.coursefee==null?0 : cm.coursefee
                                    }).ToList();
            if (courseList != null)
            {
               CourseGridView.DataSource = courseList;
                CourseGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void CourseGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(CourseGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/editCourse.aspx?courseId=" + id);
    }
}