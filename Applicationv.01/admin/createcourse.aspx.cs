using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createcourse : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            bindMajorDisciplineDropdown();
            bindStudyLevelDropdown();
            bindStudyModeDropdown();
            BindUniversity();
        }
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
            ListItem lst = new ListItem("Please select", "0");
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
            ListItem lst = new ListItem("Please select", "0");
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
            ListItem lst = new ListItem("Please select", "0");
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
                courseObj.modeofstudyId = Convert.ToInt32(ddlstudymode.SelectedItem.Value);
                courseObj.coursefee = Convert.ToDecimal(txtCoursefee.Value.Trim());
                courseObj.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);

                db.coursemaster.Add(courseObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Course already exists')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}