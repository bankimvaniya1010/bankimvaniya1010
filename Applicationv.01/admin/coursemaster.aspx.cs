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
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string roleName = string.Empty;
    int universityID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        roleName = Utility.GetRoleName();
        if (!Utility.CheckAdminLogin() || String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
     {
        try
        {
            dynamic courseList;
            if (roleName.ToLower() == "admin")
            {
                courseList = (from cm in db.coursemaster
                              join displine in db.majordiscipline_master on cm.majordisciplineId equals displine.id into displineData
                              from x in displineData.DefaultIfEmpty()
                              join study in db.studymodemaster on cm.modeofstudyId equals study.id into studyData
                              from x1 in studyData.DefaultIfEmpty()
                              join level in db.studylevelmaster on cm.levelofstudyId equals level.studylevelid into levelData
                              from x2 in levelData.DefaultIfEmpty()
                              join um in db.university_master on cm.universityid equals um.universityid into universityData
                              from x3 in universityData.DefaultIfEmpty()
                              select new
                              {
                                  courseid = cm.courseid,
                                  coursename = cm.coursename,
                                  displineDesc = (x.description == null) ? string.Empty : x.description,
                                  studyDesc = x1.description == null ? string.Empty : x1.description,
                                  studylevel = x2.studylevel == null ? string.Empty : x2.studylevel,
                                  universityname = x3.university_name == null ? string.Empty : x3.university_name,
                                  coursefee = cm.coursefee == null ? 0 : cm.coursefee,
                              }).SortBy("courseid").ToList();
            }
            else {
                universityID = Convert.ToInt32(Session["universityId"]);
                courseList = (from cm in db.coursemaster
                              join displine in db.majordiscipline_master on cm.majordisciplineId equals displine.id into displineData
                              from x in displineData.DefaultIfEmpty()
                              join study in db.studymodemaster on cm.modeofstudyId equals study.id into studyData
                              from x1 in studyData.DefaultIfEmpty()
                              join level in db.studylevelmaster on cm.levelofstudyId equals level.studylevelid into levelData
                              from x2 in levelData.DefaultIfEmpty()
                              join um in db.university_master on cm.universityid equals um.universityid into universityData
                              from x3 in universityData.DefaultIfEmpty()
                              where cm.universityid == universityID
                              select new
                              {
                                  courseid = cm.courseid,
                                  coursename = cm.coursename,
                                  displineDesc = (x.description == null) ? string.Empty : x.description,
                                  studyDesc = x1.description == null ? string.Empty : x1.description,
                                  studylevel = x2.studylevel == null ? string.Empty : x2.studylevel,
                                  universityname = x3.university_name == null ? string.Empty : x3.university_name,
                                  coursefee = cm.coursefee == null ? 0 : cm.coursefee,
                              }).SortBy("courseid").ToList();

            }
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
        Response.Redirect(webURL + "admin/editCourse.aspx?courseId=" + id);
    }

    protected void CourseGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        CourseGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}