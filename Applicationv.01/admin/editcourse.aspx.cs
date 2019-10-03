using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editcourse : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();    

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    
    protected string imagepath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);       

        if (!IsPostBack)
        {           
            if (Request.QueryString["courseID"] != null)
            {
                int courseID;
                if (!Int32.TryParse(Request.QueryString["courseID"], out courseID))
                    Response.Redirect("~/admin/default.aspx");

                coursemaster existingCourse = db.coursemaster.Where(obj => obj.courseid == courseID).First();
                var existingDates = db.course_dates.Where(obj => obj.courseid == courseID).ToList();
                var exsistingderementDate = db.course_defermentdates.Where(obj => obj.courseid == courseID).ToList();
                var mappings = db.course_campus_mapping.Where(obj => obj.courseid == courseID).ToList();                
                bindMajorDisciplineDropdown();
                bindStudyLevelDropdown();
                bindStudyModeDropdown();
                BindUniversity();
                if (existingCourse != null && existingDates != null)
                {
                    ViewState["courseID"] = courseID;

                    txtCourseName.Value = existingCourse.coursename;
                    txtCoursefee.Value = Convert.ToString(existingCourse.coursefee);
                    if (existingCourse.majordisciplineId != null)
                    {
                        ddldiscipline.ClearSelection();
                        ddldiscipline.Items.FindByValue(existingCourse.majordisciplineId.ToString()).Selected = true;
                    }
                    if (existingCourse.levelofstudyId != null)
                    {
                        ddlstudylevel.ClearSelection();
                        ddlstudylevel.Items.FindByValue(existingCourse.levelofstudyId.ToString()).Selected = true;
                    }
                    if (existingCourse.modeofstudyId != null)
                    {
                        ddlstudymode.ClearSelection();
                        ddlstudymode.Items.FindByValue(existingCourse.modeofstudyId.ToString()).Selected = true;
                    }
                    if (existingCourse.universityid != null)
                    {
                        ddlUniversity.ClearSelection();
                        ddlUniversity.Items.FindByValue(existingCourse.universityid.ToString()).Selected = true;
                    }
                    if (existingCourse.courseeligibility != null)
                    {
                        txtcourseeligibility.Value = existingCourse.courseeligibility;
                    }
                    if (existingDates.Count > 0)
                    {
                        for (int i = 0; i < existingDates.Count; i++)
                            hidCommencementDates.Value += existingDates[i].commencementdate.ToString("dd-MM-yyyy") + ",";
                        }

                    if (exsistingderementDate != null && exsistingderementDate.Count > 0)
                    {
                        for (int i = 0; i < exsistingderementDate.Count; i++)
                            Hiddefermentdates.Value += exsistingderementDate[i].defermentdate.ToString("dd-MM-yyyy") + ",";
                    }
                       
                    if (mappings != null)
                    {
                        BindUniversityCampus(Convert.ToInt32(ddlUniversity.SelectedValue));
                        foreach (var maps in mappings)
                        {
                            ddlUniversityCampuses.Items.FindByValue(maps.campusid.ToString()).Selected = true;
                            hidUniversityCampuses.Value = hidUniversityCampuses.Value + maps.campusid + ",";
                        }
                    }
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Course does not exists')", true);
            }
            else
                Response.Redirect("~/admin/default.aspx");
        }
    }

    private void BindUniversityCampus(int universityId)
    {
        try
        {
            var Universiity = db.universitycampus.Where(x => x.universityid == universityId).ToList();
            ddlUniversityCampuses.DataSource = Universiity;
            ddlUniversityCampuses.DataTextField = "campusname";
            ddlUniversityCampuses.DataValueField = "campusid";
            ddlUniversityCampuses.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetUniversityCampuses(int universityId)
    {
        GTEEntities db1 = new GTEEntities();
        var campuses = db1.universitycampus.Where(x => x.universityid == universityId).Select(x => new { x.campusid, x.campusname }).ToList();
        return JsonConvert.SerializeObject(campuses);
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Universiity = db.university_master.ToList();
            ddlUniversity.DataSource = Universiity;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void bindMajorDisciplineDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select Major Discipline", "0");
            List<majordiscipline_master> DisciplineMaster = db.majordiscipline_master.ToList();

            ddldiscipline.DataSource = DisciplineMaster;
            ddldiscipline.DataTextField = "description";
            ddldiscipline.DataValueField = "id";
            ddldiscipline.DataBind();
            ddldiscipline.Items.Insert(0, lst);
            //ddldiscipline.SelectedIndex = universityID;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void bindStudyLevelDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select Study Level", "0");
            List<studylevelmaster> StudylevelMaster = db.studylevelmaster.ToList();

            ddlstudylevel.DataSource = StudylevelMaster;
            ddlstudylevel.DataTextField = "studylevel";
            ddlstudylevel.DataValueField = "studylevelid";
            ddlstudylevel.DataBind();
            ddlstudylevel.Items.Insert(0, lst);
            //ddlstudylevel.SelectedIndex = universityID;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void bindStudyModeDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select Study Mode", "0");
            List<studymodemaster> StudymodeMaster = db.studymodemaster.ToList();

            ddlstudymode.DataSource = StudymodeMaster;
            ddlstudymode.DataTextField = "description";
            ddlstudymode.DataValueField = "id";
            ddlstudymode.DataBind();
            ddlstudymode.Items.Insert(0, lst);
            // ddlstudymode.SelectedIndex = universityID;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int CourseID = Convert.ToInt32(ViewState["courseID"]);

        var existingMappings = db.course_campus_mapping.Where(x => x.courseid == CourseID).ToList();
        if (existingMappings != null)
        {
            db.course_campus_mapping.RemoveRange(existingMappings);
            db.SaveChanges();
        }

        var existingCourseDates = db.course_dates.Where(x => x.courseid == CourseID).ToList();
        if (existingCourseDates != null)
        {
            db.course_dates.RemoveRange(existingCourseDates);
            db.SaveChanges();
        }

        coursemaster CourseObj = db.coursemaster.Where(x => x.courseid == CourseID).First();
        try
        {
            CourseObj.coursename = txtCourseName.Value.Trim();
            CourseObj.majordisciplineId = Convert.ToInt32(ddldiscipline.SelectedItem.Value);
            CourseObj.levelofstudyId = Convert.ToInt32(ddlstudylevel.SelectedItem.Value);
            CourseObj.modeofstudyId = Convert.ToInt32(ddlstudymode.SelectedItem.Value);
            CourseObj.coursefee = Convert.ToDecimal(txtCoursefee.Value.Trim());
            CourseObj.courseeligibility = txtcourseeligibility.Value;
            CourseObj.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            db.SaveChanges();

            var commencementDates = hidCommencementDates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (var item in commencementDates)
            {
                var dateArr = item.Split(Convert.ToChar("-"));
                var date = Convert.ToDateTime(string.Concat(dateArr[2], "-", dateArr[1], "-", dateArr[0]));
                course_dates course_date = new course_dates() { courseid = CourseObj.courseid, commencementdate = date };
                db.course_dates.Add(course_date);
            }

               

            var defermentdates = Hiddefermentdates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (var item in defermentdates)
            {
                var dateArr = item.Split(Convert.ToChar("-"));
                var Defermentdate = Convert.ToDateTime(string.Concat(dateArr[2], "-", dateArr[1], "-", dateArr[0]));
                course_defermentdates course_defermentdates = new course_defermentdates() { courseid = CourseObj.courseid, defermentdate = Defermentdate };
                db.course_defermentdates.Add(course_defermentdates);
            }

            var campusIds = hidUniversityCampuses.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (var campusId in campusIds)
            {
                course_campus_mapping mapping = new course_campus_mapping { courseid = CourseObj.courseid, campusid = Convert.ToInt32(campusId) };
                db.course_campus_mapping.Add(mapping);
            }
            db.SaveChanges();

            Response.Redirect("~/admin/coursemaster.aspx", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
}