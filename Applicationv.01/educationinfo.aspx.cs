using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;
public partial class educationinfo : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string Course = "COURSE NAME";
    protected string Board = "BOARD/UNIVERSITY";
    protected string Institute = "INSTITUTE";
    protected string Percentage = "PERCENTAGE";
    protected string DurationFrom = "DURATION FROM";
    protected string DurationTo = "DURATIONTO";
    protected string BackLog = "REPEATS/BACKLOG";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        if (!IsPostBack)
        {
            GetSecondaryFieldname();
            BindEducationDetails(ApplicantID);

        }
    }
    protected void btnEducation_Click(object sender, EventArgs e)
    {
        string durationFrom, durationTo = "";
        durationFrom = durationfrom.Value;
        durationTo = durationto.Value;
        applicant_education objApplicant = new applicant_education();
        objApplicant.applicantid = ApplicantID;
        objApplicant.board_universityname = txtBoardUniversity.Value;
        objApplicant.courseid = Convert.ToInt32(ddlCourse.SelectedValue);
        objApplicant.course_startdate = Convert.ToDateTime(durationFrom);
        objApplicant.course_enddate = Convert.ToDateTime(durationTo);
        objApplicant.Institute = txtInstitute.Value;
        if (txtOtherCourse != null)
            objApplicant.othercourse_name = txtOtherCourse.Text;
        objApplicant.percentage = txtPercentage.Value;
        objApplicant.repeats_backlog = txtRepeats.Value;
        db.applicant_education.Add(objApplicant);
        db.SaveChanges();
        BindEducationDetails(ApplicantID);
    }
    private void BindEducationDetails(int ApplicantID)
    {
        var CourseDetails = (from pInfo in db.applicant_education
                             where pInfo.applicantid == ApplicantID
                             select pInfo).ToList();
        grdEducation.DataSource = CourseDetails;
        grdEducation.DataBind();
    }
    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCourse.Text == "Others")
            txtOtherCourse.Visible = true;
        else
            txtOtherCourse.Visible = false;
    }
    protected void grdEducation_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow && grdEducation.EditIndex == e.Row.RowIndex))
        {
            Label Course = (e.Row.FindControl("lblCourse") as Label);
            if (Course.Text == "1")
                Course.Text = "10TH";
            else if (Course.Text == "2")
                Course.Text = "12Th";
            else if (Course.Text == "3")
                Course.Text = "Diploma";
            else if (Course.Text == "4")
                Course.Text = "UG";
            else if (Course.Text == "5")
                Course.Text = "PG";
            else
                Course.Text = "Others";
        }
    }

    private void GetSecondaryFieldname()
    {
        string SecondaryLanguage = "";
        if (Session["SecondaryLang"] == null)
        {
           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Secondary Language')", true);
           // Response.Redirect("default.aspx");
        }
        else
        {
            SecondaryLanguage = Session["SecondaryLang"].ToString();
            var SecondaryField = (from am in db.applicantformmaster
                                  join pm in db.primaryfieldmaster on am.primaryfieldid equals pm.primaryfieldid
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 2)

                                  select new
                                  {
                                      id = am.id,
                                      fieldnameinstructions = am.fieldnameinstructions,
                                      secondaryfieldnameinstructions = am.secondaryfieldnameinstructions,
                                      primaryfieldname = pm.primaryfiledname,
                                      secondaryfieldnamelanguage = am.secondaryfieldnamelanguage,
                                      secondaryfielddnamevalue = am.secondaryfielddnamevalue

                                  }).ToList();
            // var    am =  db.applicantformmaster.Where(x => x.secondaryfieldnamelanguage == SecondaryLanguage && x.formname == 1).ToList();
            for (int k = 0; k < SecondaryField.Count; k++)
            {

                switch (SecondaryField[k].primaryfieldname.ToString())
                {

                    case "COURSE NAME":
                        Course = SecondaryField[k].secondaryfielddnamevalue == "" ? Course : Course + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "BOARD/UNIVERSITY":
                        Board = SecondaryField[k].secondaryfielddnamevalue == "" ? Board : Board + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "INSTITUTE":
                        Institute = SecondaryField[k].secondaryfielddnamevalue == "" ? Institute : Institute + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "PERCENTAGE":
                        Percentage = SecondaryField[k].secondaryfielddnamevalue == "" ? Percentage : Percentage + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DURATION FROM":
                        DurationFrom = SecondaryField[k].secondaryfielddnamevalue == "" ? DurationFrom : DurationFrom + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DURATIONTO":
                        DurationTo = SecondaryField[k].secondaryfielddnamevalue == "" ? DurationTo : DurationTo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "REPEATS/BACKLOG":
                        BackLog = SecondaryField[k].secondaryfielddnamevalue == "" ? BackLog : BackLog + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }
}