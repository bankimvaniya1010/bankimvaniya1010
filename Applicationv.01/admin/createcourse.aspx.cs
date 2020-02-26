using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createcourse : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
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
        {
            bindMajorDisciplineDropdown();
            bindStudyLevelDropdown();
            BindUniversity();
            BindCurrency();
        }
    }

    private void BindCurrency() {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var currency = db.currency_master.ToList();
            ddlcurrency.DataSource = currency;
            ddlcurrency.DataTextField = "currency_symbol";
            ddlcurrency.DataValueField = "id";
            ddlcurrency.DataBind();
            ddlcurrency.Items.Insert(0, lst);

        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universiity;
            if (roleName.ToLower() == "admin")
                Universiity = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universiity = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universiity;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);            

        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void bindMajorDisciplineDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            List<majordiscipline_master> DisciplineMaster = db.majordiscipline_master.ToList();

            ddldiscipline.DataSource = DisciplineMaster;
            ddldiscipline.DataTextField = "description";
            ddldiscipline.DataValueField = "id";
            ddldiscipline.DataBind();
            ddldiscipline.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void bindStudyLevelDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            List<studylevelmaster> StudylevelMaster = db.studylevelmaster.ToList();

            ddlstudylevel.DataSource = StudylevelMaster;
            ddlstudylevel.DataTextField = "studylevel";
            ddlstudylevel.DataValueField = "studylevelid";
            ddlstudylevel.DataBind();
            ddlstudylevel.Items.Insert(0, lst);
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

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetUniversityCampuses(int universityId)
    {
        GTEEntities db1 = new GTEEntities();
        var campuses = db1.universitycampus.Where(x => x.universityid == universityId).Select(x => new { x.campusid, x.campusname }).ToList();
        return JsonConvert.SerializeObject(campuses);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        coursemaster courseObj = new coursemaster();
        try
        {
            var existingCourse = (from course in db.coursemaster
                                  where course.coursename.Equals(txtCourseName.Value.Trim())
                                  select course.coursename).FirstOrDefault();
            if (string.IsNullOrEmpty(existingCourse))
            {
                courseObj.coursename = txtCourseName.Value.Trim();
                courseObj.majordisciplineId = Convert.ToInt32(ddldiscipline.SelectedItem.Value);
                courseObj.levelofstudyId = Convert.ToInt32(ddlstudylevel.SelectedItem.Value);
                courseObj.modeofstudyId = Convert.ToInt32(hidStudyMode.Value);
                courseObj.coursefee = Convert.ToDecimal(txtCoursefee.Value.Trim());
                courseObj.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                courseObj.courseeligibility = txtcourseeligibility.Value;
                courseObj.courseurl = txtCourseURL.Value;
                courseObj.courseduration = txtCourseDuration.Value;
                courseObj.coursedescription = txtCourseDescription.Value;
                courseObj.currencyid = Convert.ToInt32(ddlcurrency.SelectedValue);
                if (ddlactivestatus.SelectedValue == "True")
                    courseObj.isactive = true;
                else if (ddlactivestatus.SelectedValue == "False")
                    courseObj.isactive = false;

                db.coursemaster.Add(courseObj);
                db.SaveChanges();

                var commencementDates = hidCommencementDates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (var item in commencementDates)
                {
                    var dateArr = item.Split(Convert.ToChar("-"));
                    var date = Convert.ToDateTime(string.Concat(dateArr[2], "-", dateArr[1], "-", dateArr[0]));
                    course_dates course_date = new course_dates() { courseid = courseObj.courseid, commencementdate = date };
                    db.course_dates.Add(course_date);
                }

                var Defermentdates = Hiddefermentdates.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (var item in Defermentdates)
                {
                    var dateArr = item.Split(Convert.ToChar("-"));
                    var defermentdate = Convert.ToDateTime(string.Concat(dateArr[2], "-", dateArr[1], "-", dateArr[0]));
                    course_defermentdates course_defermentdate = new course_defermentdates() { courseid = courseObj.courseid, defermentdate = defermentdate };
                    db.course_defermentdates.Add(course_defermentdate);
                }

                var campusIds = hidUniversityCampuses.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (var campusId in campusIds)
                {
                    course_campus_mapping mapping = new course_campus_mapping { courseid = courseObj.courseid, campusid = Convert.ToInt32(campusId) };
                    db.course_campus_mapping.Add(mapping);
                }
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Record Inserted Successfully.');window.location='" + Request.ApplicationPath + "admin/coursemaster.aspx';", true);
                
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Course already exists')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
}