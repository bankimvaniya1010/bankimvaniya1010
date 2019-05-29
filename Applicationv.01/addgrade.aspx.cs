using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addgrade : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string gradeValue = "";
    string classname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (Request.QueryString["g"] != null)
            gradeValue = Request.QueryString["g"];
        if (Request.QueryString["c"] != null)
            classname = Request.QueryString["c"];
        if (!IsPostBack)
        {
            BindGrade();
            ddlCourse.ClearSelection();
            if (classname != "")
                ddlCourse.Items.FindByValue(classname).Selected = true;
          // ddlCourse.SelectedItem.Attributes.Add("ReadOnly", "true");
        }

    }


    private void BindGrade()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var grade = db.grademaster.ToList();
            ddlGradeType.DataSource = grade;
            ddlGradeType.DataTextField = "description";
            ddlGradeType.DataValueField = "id";
            ddlGradeType.DataBind();
            ddlGradeType.Items.Insert(0, lst);
            if (gradeValue != "")
                ddlGradeType.Items.FindByValue(gradeValue).Selected = true; ;
           // ddlGradeType.SelectedItem.Enabled = false;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            applicantsubjectwisegrade objGrade = new applicantsubjectwisegrade();
            objGrade.subject = txtSubject.Value;
            objGrade.grade = txtGrade.Value;
            objGrade.applicantid = userID;
            objGrade.courseid = ddlCourse.SelectedValue;
            objGrade.gradeid = Convert.ToInt32(ddlGradeType.SelectedValue);
            db.applicantsubjectwisegrade.Add(objGrade);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}