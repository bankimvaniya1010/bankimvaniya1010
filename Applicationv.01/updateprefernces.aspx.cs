using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class updateprefernces : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int universityID = 0, userID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            BindCourses();
            BindStudyLevel();
            rblYear1.Text = DateTime.Now.Year.ToString();
            rblYear2.Text = DateTime.Now.AddYears(1).Year.ToString();
            rblYear3.Text = DateTime.Now.AddYears(2).Year.ToString();
            PreFills();
        }
    }
    private void BindCourses()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var courses = db.registrationcourses.ToList();
            lstCourse.DataSource = courses;
            lstCourse.DataTextField = "coursename";
            lstCourse.DataValueField = "courseid";
            lstCourse.DataBind();
            lstCourse.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void BindStudyLevel()
    {
        try
        {
            var studyLevel = db.studylevelmaster.ToList();
            rblstudyLevel.DataSource = studyLevel;
            rblstudyLevel.DataTextField = "studylevel";
            rblstudyLevel.DataValueField = "studylevelid";
            rblstudyLevel.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void SaveCourses(int studentid)
    {
        try
        {
            for (int i = 0; i < lstCourse.Items.Count; i++)
            {
                studentcoursemapping objCourse = new studentcoursemapping();
                if (lstCourse.Items[i].Selected == true)
                {
                    objCourse.studentid = studentid;
                    objCourse.courseid = Convert.ToInt32(lstCourse.Items[i].Value);
                    db.studentcoursemapping.Add(objCourse);
                    db.SaveChanges();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void PreFills()
    {
        try
        {
            var students = db.students.Where(student => student.studentid == userID).FirstOrDefault();
            if (students != null)
            {

                if (students.studylevelid != 0)
                {
                    rblstudyLevel.ClearSelection();
                    rblstudyLevel.Items.FindByValue(students.studylevelid.ToString()).Selected = true;
                }
                if (students.enrollmentyear != 0)
                {
                    if (rblYear1.Text == students.enrollmentyear.ToString())
                        rblYear1.Checked = true;
                    else if (rblYear2.Text == students.enrollmentyear.ToString())
                        rblYear2.Checked = true;
                    else
                        rblYear3.Checked = true;
                }
                var courseMapping = db.studentcoursemapping.Where(x => x.studentid == userID).ToList();
                for(int k=0;k< courseMapping.Count;k++)
                {
                    string courseValue = Convert.ToString(courseMapping[k].courseid);
                    for (int i = 0; i < lstCourse.Items.Count; i++)
                    {

                        if (lstCourse.Items[i].Value == courseValue)
                        {
                            lstCourse.Items[i].Selected = true;
                            break;
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    protected void btnupdatepreferences_Click(object sender, EventArgs e)
    {
        try
        {
            var students = db.students.Where(student => student.studentid == userID).FirstOrDefault();
            if (students != null)
            {
                students.studylevelid = Convert.ToInt32(rblstudyLevel.SelectedValue);
                if (rblYear1.Checked)
                    students.enrollmentyear = Convert.ToInt32(rblYear1.Text);
                else if (rblYear2.Checked)
                    students.enrollmentyear = Convert.ToInt32(rblYear2.Text);
                else if (rblYear3.Checked)
                    students.enrollmentyear = Convert.ToInt32(rblYear3.Text);
                SaveCourses(userID);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}