using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_editcourse : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();    

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    
    protected string imagepath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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
                    if (existingCourse.universityid != null)
                    {
                        ddlUniversity.ClearSelection();
                        ddlUniversity.Items.FindByValue(existingCourse.universityid.ToString()).Selected = true;

                        if (existingCourse.modeofstudyId != null)
                        {
                            bindStudyModeDropdown(ddlstudymode, existingCourse.universityid.Value);
                            ddlstudymode.Items.FindByValue(existingCourse.modeofstudyId.ToString()).Selected = true;
                            hidStudyMode.Value = existingCourse.modeofstudyId.ToString();
                        }
                    }
                    if (existingCourse.courseeligibility != null)
                    {
                        txtcourseeligibility.Value = existingCourse.courseeligibility;
                    }
                    if (existingDates.Count > 0)
                    {
                        var existingdateInApplicationMaster = (from am in db.applicationmaster
                                                               join coursedate in db.course_dates on am.course equals coursedate.courseid into data
                                                               from x1 in data.DefaultIfEmpty()
                                                               where x1.id.ToString() == am.commencementdate && am.course == courseID
                                                               select x1).ToList();

                        for (int i = 0; i < existingDates.Count; i++)
                        {
                            hidCommencementDates.Value += existingDates[i].commencementdate.ToString("dd-MM-yyyy") + ",";
                            var date = existingDates[i].commencementdate;

                            int cnt = existingdateInApplicationMaster.Where(c => c.commencementdate == date).ToList().Count;
                            if (cnt > 0)
                            {
                                hidExistingCommencementDates.Value += date.ToString("dd-MM-yyyy") + ",";
                            }
                        }
                        hidExistingCommencementDateIds.Value = "";
                        for (int i = 0; i < existingdateInApplicationMaster.Count; i++)
                        {
                            hidExistingCommencementDateIds.Value += (hidExistingCommencementDateIds.Value == "") ? existingdateInApplicationMaster[i].id.ToString() : "," + existingdateInApplicationMaster[i].id.ToString();
                        }
                    }

                    if (exsistingderementDate != null && exsistingderementDate.Count > 0)
                    {
                        var existingDefermentdate = (from am in db.applicationmaster
                                                     join coursedate in db.course_defermentdates on am.course equals coursedate.courseid into data
                                                     from x1 in data.DefaultIfEmpty()
                                                     where x1.defermentdate == am.deferment_date && am.course == courseID
                                                     select x1).ToList();
                        for (int i = 0; i < exsistingderementDate.Count; i++)
                        {
                            Hiddefermentdates.Value += exsistingderementDate[i].defermentdate.ToString("dd-MM-yyyy") + ",";
                            var derementdate = exsistingderementDate[i].defermentdate;
                            int existingDefermentdateCount = existingDefermentdate.Where(d => d.defermentdate == derementdate).ToList().Count;

                            if (existingDefermentdateCount > 0)
                            {   
                                 hidExixtingDefermentDate.Value += derementdate.ToString("dd-MM-yyyy") + ",";
                            }
                        }
                        hidExistingDefermentDateIds.Value = "";
                        for (int i = 0; i < existingDefermentdate.Count; i++)
                        {
                            hidExistingDefermentDateIds.Value += (hidExistingDefermentDateIds.Value == "") ? existingDefermentdate[i].id.ToString() : "," + existingDefermentdate[i].id.ToString();
                        }

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
    private void bindStudyModeDropdown(HtmlSelect ddlstudymode, int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select Study Mode", "0");
            List<studymodemaster> StudymodeMaster = db.studymodemaster.Where(x => x.universityid == universityId).ToList();

            ddlstudymode.DataSource = StudymodeMaster;
            ddlstudymode.DataTextField = "description";
            ddlstudymode.DataValueField = "id";
            ddlstudymode.DataBind();
            ddlstudymode.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetStudyModeDropdown(int universityId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.studymodemaster.Where(x => x.universityid == universityId).ToList().Select(x => new { description = x.description, x.id });
        return JsonConvert.SerializeObject(temp);
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
        var hidExistingCommencementDateIdArr = hidExistingCommencementDateIds.Value.Split(Convert.ToChar(","));
        var existingCourseDates = db.course_dates.Where(x => x.courseid == CourseID && !hidExistingCommencementDateIdArr.Contains(x.id.ToString())).ToList();
        if (existingCourseDates != null)
        {
            db.course_dates.RemoveRange(existingCourseDates);
            db.SaveChanges();
        }

        var hidExistingdefermentdatesIdArr = hidExistingDefermentDateIds.Value.Split(Convert.ToChar(","));
        var existingDefermentDates = db.course_defermentdates.Where(x => x.courseid == CourseID && !hidExistingdefermentdatesIdArr.Contains(x.id.ToString())).ToList();
        if (existingDefermentDates != null)
        {
            db.course_defermentdates.RemoveRange(existingDefermentDates);
            db.SaveChanges();
        }

        coursemaster CourseObj = db.coursemaster.Where(x => x.courseid == CourseID).First();
        try
        {
            CourseObj.coursename = txtCourseName.Value.Trim();
            CourseObj.majordisciplineId = Convert.ToInt32(ddldiscipline.SelectedItem.Value);
            CourseObj.levelofstudyId = Convert.ToInt32(ddlstudylevel.SelectedItem.Value);
            CourseObj.modeofstudyId = Convert.ToInt32(hidStudyMode.Value);
            CourseObj.coursefee = Convert.ToDecimal(txtCoursefee.Value.Trim());
            CourseObj.courseeligibility = txtcourseeligibility.Value;
            CourseObj.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            db.SaveChanges();

            //commencement date
            var commencementDates = hidCommencementDates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            var existingCommencementDates = hidExistingCommencementDates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            List<string> newDates = new List<string>();
            for (var i = 0; i < commencementDates.Length; i++)
            {
                var commencementDateCount = existingCommencementDates.Where(c => c == commencementDates[i]).ToList().Count;
                if (commencementDateCount == 0)
                    newDates.Add(commencementDates[i]);
            }

            foreach (var item in newDates)
            {
                var dateArr = item.Split(Convert.ToChar("-"));
                var date = Convert.ToDateTime(string.Concat(dateArr[2], "-", dateArr[1], "-", dateArr[0]));

                course_dates course_dates = new course_dates() { courseid = CourseObj.courseid, commencementdate = date };
                db.course_dates.Add(course_dates);
            }
            //deferment Date 
            var defermentdates = Hiddefermentdates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            var existingdefermentdates = hidExixtingDefermentDate.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            List<string> newdefermentsdate = new List<string>();
            for (var i = 0; i < defermentdates.Length; i++)
            {
                var defermentdatesCount = existingdefermentdates.Where(c => c == defermentdates[i]).ToList().Count;
                if (defermentdatesCount == 0)
                    newdefermentsdate.Add(defermentdates[i]);
            }
            foreach (var item in newdefermentsdate)
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