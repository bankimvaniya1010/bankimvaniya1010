using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addgrade : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, CountryID = 0;
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
        if ((Request.QueryString["country"] != null) && (Request.QueryString["country"].ToString() != ""))
            CountryID = Convert.ToInt32(Request.QueryString["country"]);
        if (Request.QueryString["c"] != null)
            classname = Request.QueryString["c"];
        if (!IsPostBack)
        {
            BindSubjects(CountryID);
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
    private void BindSubjects(int CountryID)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Subjects = (from sm in db.subjectmaster
                            join scm in db.subjectwisecountrymapping on sm.id equals scm.subjectid
                            where scm.countryid == CountryID
                            select new
                            {
                                id = sm.id,
                                description = sm.description,
                            }).ToList();

            ddlsubjects.DataSource = Subjects;
            ddlsubjects.DataTextField = "description";
            ddlsubjects.DataValueField = "id";
            ddlsubjects.DataBind();
            ddlsubjects.Items.Insert(0, lst);
            ddlsubjects.Items.Insert(Subjects.Count + 1, "Others");
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
            objGrade.othersubject = txtOther.Value;
            objGrade.grade = txtGrade.Value;
            objGrade.applicantid = userID;
            objGrade.coursename = ddlCourse.SelectedValue;
            if (ddlGradeType.SelectedValue != "")
                objGrade.gradeid = Convert.ToInt32(ddlGradeType.SelectedValue);
            if ((ddlsubjects.SelectedValue != "") && (ddlsubjects.SelectedValue != "Others"))
                objGrade.subjectid = Convert.ToInt32(ddlsubjects.SelectedValue);
            db.applicantsubjectwisegrade.Add(objGrade);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}