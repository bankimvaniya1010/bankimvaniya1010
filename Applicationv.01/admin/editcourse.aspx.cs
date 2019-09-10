using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");

        if (!IsPostBack)
        {
            if (Request.QueryString["courseID"] != null)
            {
                int courseID;
                if (!Int32.TryParse(Request.QueryString["courseID"], out courseID))
                    Response.Redirect("~/admin/default.aspx");

                coursemaster existingCourse = db.coursemaster.Where(obj => obj.courseid == courseID).First();
                bindMajorDisciplineDropdown();
                bindStudyLevelDropdown();
                bindStudyModeDropdown();
                if (existingCourse != null)
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
                    

                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Course does not exists')", true);

            }
            else
                Response.Redirect("~/admin/default.aspx");
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
        coursemaster CourseObj = db.coursemaster.Where(x => x.courseid == CourseID).First();
        try
        {
            CourseObj.coursename = txtCourseName.Value.Trim();
            CourseObj.majordisciplineId = Convert.ToInt32(ddldiscipline.SelectedItem.Value);
            CourseObj.levelofstudyId = Convert.ToInt32(ddlstudylevel.SelectedItem.Value);
            CourseObj.modeofstudyId = Convert.ToInt32(ddlstudymode.SelectedItem.Value);
            CourseObj.coursefee = Convert.ToDecimal(txtCoursefee.Value.Trim());
            db.SaveChanges();
            Response.Redirect("~/admin/coursemaster.aspx");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}