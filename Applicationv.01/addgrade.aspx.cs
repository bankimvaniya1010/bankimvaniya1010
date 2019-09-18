using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addgrade : System.Web.UI.Page
{
    int formId = 0, universityID = 0;
    int userID = 0, ApplicantID = 0, CountryID = 0;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string gradeValue = "";
    string classname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
            Response.Redirect(webURL + "applicanteducation.aspx", true);
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if ((Request.QueryString["g"] == null) || (Request.QueryString["g"].ToString() == ""))
            Response.Redirect(webURL + "applicanteducation.aspx", true);
        else
            gradeValue = Request.QueryString["g"];
        if ((Request.QueryString["country"] == null) || (Request.QueryString["country"].ToString() == ""))
            Response.Redirect(webURL + "applicanteducation.aspx", true);
        else
            CountryID = Convert.ToInt32(Request.QueryString["country"]);
        if ((Request.QueryString["c"] == null) || (Request.QueryString["c"].ToString() == ""))
            Response.Redirect(webURL + "applicanteducation.aspx", true);
        else
            classname = Request.QueryString["c"];
        if (!IsPostBack)
        {
            SetToolTips();
            SetControlsUniversitywise();
            BindSubjects(CountryID);
            BindGrade();
            ddlCourse.ClearSelection();
            if (classname != "")
                ddlCourse.Items.FindByValue(classname).Selected = true;
            ddlCourse.Enabled = false;
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
            objGrade.grade = txtGrade.Value;
            objGrade.applicantid = userID;
            objGrade.coursename = ddlCourse.SelectedValue;
            if (ddlGradeType.SelectedValue != "")
                objGrade.gradeid = Convert.ToInt32(ddlGradeType.SelectedValue);
            if ((ddlsubjects.SelectedValue != "") && (ddlsubjects.SelectedValue != "Others"))
                objGrade.subjectid = Convert.ToInt32(ddlsubjects.SelectedValue);
            else if(ddlsubjects.SelectedValue != "" && ddlsubjects.SelectedValue == "Others")
            {
                objGrade.subjectid = 0;
                objGrade.othersubject = txtOther.Value;
            }
            db.applicantsubjectwisegrade.Add(objGrade);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.universitywisetooltipmaster
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
                          from x in tmp.Where(c => c.formid == formId).DefaultIfEmpty()
                          where x.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              universitywiseToolTips = (z == null ? String.Empty : z.tooltips),
                              tooltips = (x == null ? String.Empty : x.tooltips)
                          }).ToList();


            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "Qualification":
                        icQualification.Attributes.Add("style", "display:block;");
                        icQualification.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Subject":
                        icSubject.Attributes.Add("style", "display:block;");
                        icSubject.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Other Subject":
                        icOtherSubject.Attributes.Add("style", "display:block;");
                        icOtherSubject.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Grade Type":
                        icGradeType.Attributes.Add("style", "display:block;");
                        icGradeType.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "Grade":
                        icGrade.Attributes.Add("style", "display:block;");
                        icGrade.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                   
                    default:
                        break;

                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());

        }
    }
    private String setTooltips(dynamic obj)
    {
        return obj.universitywiseToolTips == "" ? obj.tooltips : obj.universitywiseToolTips;
    }
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname + " * " : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ") * ";
    }
    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();
            }
            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "Qualification":
                        Qualification.Attributes.Add("style", "display:block;");
                        labelQualification.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Subject":
                        Subject.Attributes.Add("style", "display:block;");
                        labelSubject.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Other Subject":
                        OtherSubject.Attributes.Add("style", "display:block;");
                        labelothers.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Grade Type":
                        gradeType.Attributes.Add("style", "display:block;");
                        labelgradeType.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Grade":
                        grade.Attributes.Add("style", "display:block;");
                        labelGrade.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}