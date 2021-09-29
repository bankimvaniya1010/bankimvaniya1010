using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_listcoursetypefieldmapping : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string roleName = string.Empty;
    int universityID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
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
                courseList = (from cm in db.admincoursetypefieldmapping
                              join ct in db.admincoursetype on cm.CourseType equals ct.id into data
                              from x in data.DefaultIfEmpty()
                              join i in db.university_master on cm.ProvidedByInstitutionName equals i.universityid into data2
                              from z in data2.DefaultIfEmpty()
                              join s in db.studymodemaster on cm.Source equals s.id into data3
                              from a in data3.DefaultIfEmpty()
                              join tm in db.type_master on cm.InstitutionType equals tm.id into data4
                              from aa in data4.DefaultIfEmpty()
                              join sm in db.Setting_master on cm.InstitutionSetting equals sm.id into data5
                              from ab in data5.DefaultIfEmpty()
                              join sim in db.size_master on cm.InstitutionSize equals sim.id into data6
                              from abc in data6.DefaultIfEmpty()
                              join asd in db.admincoursesource on cm.Source equals asd.id into data7
                              from dsa in data7.DefaultIfEmpty()
                              select new
                              {
                                  CourseID = cm.CourseID,
                                  x.coursetype,
                                  z.university_name,
                                  Source = dsa.coursesource,
                                  cm.PartnerCourseID,
                                  cm.CourseImage,
                                  cm.CourseAudioVideo,
                                  cm.CourseBrochure,
                                  cm.LinktoWebPageURL,
                                  cm.CourseName,
                                  cm.ShortDescription,
                                  type = aa.description,
                                  cm.LearningObjectives,
                                  mode=a.description,
                                  cm.NumberofStudentsTakenCourse,
                                  cm.LanguageCourseAvailableIn,
                                  cm.CourseSuitablefor,
                                  cm.MainFeatures,
                                  cm.CourseContent,
                                  cm.LongDescription,
                                  Duration=cm.DurationYear.ToString() + " "+cm.DurationMonth.ToString() + " " + cm.DurationDays.ToString() + " " + cm.DurationDays.ToString(),
                                  cm.Fee,
                                  cm.ApplicationEnrollmentFee,
                                  cm.FeePaymentMode,
                                  cm.LocationsCampusBranch,
                                  cm.AverageNumberParticipantsClassSize,
                                  cm.DomesticInternationalBoth,
                                  cm.FundingAvailable,
                                  cm.HousingAvailable,
                                  cm.InstitutionType,
                                  cm.InstitutionSetting,
                                  cm.InstitutionSize,
                                  cm.AcceptanceRate,
                                  cm.DisabilityServicesAvailable,
                                  cm.SelfPaced,
                                  link_assignInstructor= webURL + "admin/admineditcoursemapping.aspx?editid=" + cm.CourseID
                              }).SortBy("CourseID").ToList();

                if (courseList != null)
                {
                    CourseGridView.DataSource = courseList;
                    CourseGridView.DataBind();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    

    protected void CourseGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        CourseGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void CourseGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edititem")
        {
            Response.Redirect(webURL + "admin/admineditcoursemapping.aspx?editid=" + e.CommandArgument);
        }
    }
}