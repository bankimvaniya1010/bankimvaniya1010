using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class gte_sop : System.Web.UI.Page
{
    int UserID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCommon = new Common();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    gte_applicantdetails applicantdetails;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        UserID = objUser.studentid;
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        applicantdetails = db.gte_applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
        if (!IsPostBack)
        {
            var sop_details = db.gte_student_sop.Where(x => x.applicant_id == UserID && x.universityid == universityID).FirstOrDefault();

            if (sop_details != null)
            {
                if (sop_details.is_sop_submitted_by_applicant)
                {
                    txtPara1.Text = sop_details.applicant_generated_sop_para1;
                    txtPara2.Text = sop_details.applicant_generated_sop_para2;
                    txtPara3.Text = sop_details.applicant_generated_sop_para3;
                    txtPara4.Text = sop_details.applicant_generated_sop_para4;
                    txtPara5.Text = sop_details.applicant_generated_sop_para5;

                    btnEdit.Style.Add("display", "none");
                    btnSave.Style.Add("display", "none");
                    btnsubmit.Style.Add("display", "none");
                }
                else
                {
                    txtPara1.Text = sop_details.gte_sop_para1;
                    txtPara2.Text = sop_details.gte_sop_para2;
                    txtPara3.Text = sop_details.gte_sop_para3;
                    txtPara4.Text = sop_details.gte_sop_para4;
                    txtPara5.Text = sop_details.gte_sop_para5;

                    btnSave.Style.Add("display", "none");
                    btnsubmit.Style.Remove("display");
                    btnEdit.Style.Remove("display");
                }
            }
            else
            {
                try
                {
                    if (applicantdetails == null)
                        Response.Redirect("default.aspx", true);

                    btnSave.Style.Add("display", "none");
                    btnsubmit.Style.Remove("display");
                    btnEdit.Style.Remove("display");

                    txtPara1.Text = construct_para(1, applicantdetails);
                    txtPara2.Text = construct_para(2, applicantdetails);
                    txtPara3.Text = construct_para(3, applicantdetails);
                    txtPara4.Text = construct_para(4, applicantdetails);
                    txtPara5.Text = construct_para(5, applicantdetails);

                    gte_student_sop sop = new gte_student_sop();
                    sop.gte_sop_para1 = txtPara1.Text;
                    sop.gte_sop_para2 = txtPara2.Text;
                    sop.gte_sop_para3 = txtPara3.Text;
                    sop.gte_sop_para4 = txtPara4.Text;
                    sop.gte_sop_para5 = txtPara5.Text;
                    sop.applicant_generated_sop_para1 = string.Empty;
                    sop.applicant_generated_sop_para2 = string.Empty;
                    sop.applicant_generated_sop_para3 = string.Empty;
                    sop.applicant_generated_sop_para4 = string.Empty;
                    sop.applicant_generated_sop_para5 = string.Empty;
                    sop.is_sop_submitted_by_applicant = false;
                    sop.applicant_id = UserID;
                    sop.universityid = universityID;
                    sop.created_at = DateTime.Now;

                    db.gte_student_sop.Add(sop);
                    db.SaveChanges();
                }
                catch (Exception ex)
                { objLog.WriteLog(ex.ToString()); }
                
            }
        }
    }

    private string construct_para(int paragraphNo, gte_applicantdetails applicantdetails)
    {
        StringBuilder sb = new StringBuilder();
        string nationality = string.Empty;
        string residentialCountry = string.Empty;
        string birthCountry = string.Empty;
        Age currentAge = null;
        string highestQualificationCountry = string.Empty;

        try
        {
            if (paragraphNo == 2 || paragraphNo == 1)
            {
                nationality = objCommon.GetCountryDiscription(applicantdetails.nationality.Value);
                residentialCountry = objCommon.GetCountryDiscription(applicantdetails.residencecountry.Value);
            }
            if (paragraphNo == 1)
            {
                birthCountry = objCommon.GetCountryDiscription(applicantdetails.countryofbirth.Value);
                currentAge = new Age(applicantdetails.dateofbirth.Value);
                highestQualificationCountry = objCommon.GetCountryDiscription(applicantdetails.highestqualificationcountry.Value);
            }

            var statementList = db.gte_statementofpurpose.AsNoTracking().Where(x => x.paragraph == paragraphNo).ToList();

            // filter conditional statements
            if (paragraphNo == 1)
            {
                var condition_statements = statementList.Where(x => x.condition_applicable == true)
                                                        .GroupBy(x => Convert.ToInt32(x.question_id));
                foreach (var group in condition_statements)
                {
                    var test = group.ToList();
                    if (test[0].question_section == "part 2")
                    {
                        var applicant_response = db.gte_question_part2_applicant_response
                                                   .Where(x => x.question_id == group.Key && x.applicant_id == UserID)
                                                   .Select(x => x.applicant_response).FirstOrDefault();
                        statementList.Remove(test.Where(x => applicant_response != Convert.ToBoolean(x.value)).FirstOrDefault());
                    }
                    else if (test[0].question_section == "section 1")
                    {
                        if (applicantdetails.workexperience == 0)
                            statementList.Remove(test.Where(x => x.statement.Contains("#Work_Experience#")).FirstOrDefault());
                        else
                            statementList.Remove(test.Where(x => !x.statement.Contains("#Work_Experience#")).FirstOrDefault());
                    }
                }
            }
            else
            {
                var condition_statements = statementList.Where(x => x.condition_applicable == true).ToList();
                foreach (var item in condition_statements)
                {
                    bool? applicant_response = null;
                    int[] item_questions_array = Array.ConvertAll(item.question_id.Split(','), int.Parse);
                    foreach (int question in item_questions_array)
                    {
                        if (applicant_response == null)
                            applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.question_id == question)
                                                   .Select(x => x.applicant_response.Value).FirstOrDefault();
                        else
                            applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.question_id == question)
                                                   .Select(x => x.applicant_response.Value).FirstOrDefault() && applicant_response.Value;
                    }

                    statementList.Remove(condition_statements.Where(x => applicant_response.Value != Convert.ToBoolean(x.value) && x.id == item.id).FirstOrDefault());
                }
            }

            if (paragraphNo == 5)
                sb.AppendLine("Declaration:");

            foreach (var item in statementList)
            {
                if (item.statement.Contains("#Answer#"))
                {
                    var question_id = Convert.ToInt32(item.question_id); // Code will give error when multiple question ids are passed from DB.
                    var applicant_response = db.gte_questions_applicant_response
                                               .Where(x => x.gte_question_id == question_id && x.applicant_id == UserID)
                                               .Select(x => x.gte_answer_id).FirstOrDefault();

                    var answer = db.gte_answer_master.Where(x => x.id == applicant_response).Select(x => x.answer).FirstOrDefault();

                    item.statement = item.statement.Replace("#Answer#", answer);
                }
                if (item.statement.Contains("#Answer_CQ#"))
                {
                    var question_id = Convert.ToInt32(item.question_id); // Code will give error when multiple question ids are passed from DB.
                    var clarification_question_id = db.gte_clarification_questionmaster.Where(x => x.gte_master1_id == question_id).Select(x => x.id).FirstOrDefault();
                    var response = db.gte_clarification_applicantresponse
                                     .Where(x => x.clarification_question_id == clarification_question_id && x.applicant_id == UserID)
                                     .Select(x => x.applicant_response).FirstOrDefault();
                    item.statement = item.statement.Replace("#Answer_CQ#", response);
                }
                if (item.statement.Contains("#Nationality#"))
                    item.statement = item.statement.Replace("#Nationality#", nationality);
                if (item.statement.Contains("#HomeCountry#"))
                    item.statement = item.statement.Replace("#HomeCountry#", residentialCountry);
                if (item.statement.Contains("#Country_of_Birth#"))
                    item.statement = item.statement.Replace("#Country_of_Birth#", birthCountry);
                if (item.statement.Contains("#Residential_Country#"))
                    item.statement = item.statement.Replace("#Residential_Country#", residentialCountry);
                if (item.statement.Contains("#age#"))
                    item.statement = item.statement.Replace("#age#", Convert.ToString(currentAge.Years) + " years");
                if (item.statement.Contains("#Country_of_highest_educational_qualification#"))
                    item.statement = item.statement.Replace("#Country_of_highest_educational_qualification#", highestQualificationCountry);
                if (item.statement.Contains("#Answer_12#"))
                    item.statement = item.statement.Replace("#Answer_12#", applicantdetails.levelofcourse);
                if (item.statement.Contains("#Answer_14#"))
                    item.statement = item.statement.Replace("#Answer_14#", applicantdetails.coursename);
                if (item.statement.Contains("#Name_of_Highest_education#"))
                    item.statement = item.statement.Replace("#Name_of_Highest_education#", applicantdetails.highestqualificationname);
                if (item.statement.Contains("#years, months#"))
                {
                    var highest_eduDate = applicantdetails.highestqualificationdate.Split('-');

                    DateTime zeroTime = new DateTime(1, 1, 1);
                    DateTime olddate = new DateTime(Convert.ToInt32(highest_eduDate[1]), Convert.ToInt32(highest_eduDate[0]), 1);
                    DateTime curdate = DateTime.Now.ToLocalTime();

                    TimeSpan span = curdate - olddate;

                    // because we start at year 1 for the Gregorian calendar, we must subtract a year here.

                    int years = (zeroTime + span).Year - 1;
                    int months = (zeroTime + span).Month - 1;
                    item.statement = item.statement.Replace("#years, months#", Convert.ToString(years) + " years, " + Convert.ToString(months) + " months");
                }
                if (item.statement.Contains("#Work_Experience#"))
                {
                    var experience = db.workexperienceyearsmaster.Where(x => x.workexperienceyearsid == applicantdetails.workexperience).Select(x => x.description).FirstOrDefault();
                    item.statement = item.statement.Replace("#Work_Experience#", experience);
                }
                if (item.statement.Contains("#Answer_13#"))
                {
                    var study_field = db.registrationcourses.Where(x => x.courseid == applicantdetails.fieldofstudyapplied).Select(x => x.coursename).FirstOrDefault();
                    item.statement = item.statement.Replace("#Answer_13#", study_field);
                }
                if (item.statement.Contains("#Answer_19#"))
                {
                    var uniName = db.university_master.Where(x => x.universityid == applicantdetails.universityid).Select(x => x.university_name).FirstOrDefault();
                    item.statement = item.statement.Replace("#Answer_19#", uniName);
                }
                if (item.statement.Contains("#Answer_20#"))
                {
                    var cityName = db.citymaster.Where(x => x.city_id == applicantdetails.cityofeducationInstitution).Select(x => x.name).FirstOrDefault();
                    item.statement = item.statement.Replace("#Answer_20#", cityName);
                }

                item.statement = AddContentInText(item.statement);
                sb.Append(item.statement);
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }

        return sb.ToString();
    }

    private string AddContentInText(string text)
    {
        if (text.Contains("#City#") || text.Contains("#EducationalInstitution#"))
        {
            var institutionDetails = db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.university_name, cityName = x.citymaster.name }).FirstOrDefault();
            if (institutionDetails != null)
            {
                text = text.Replace("#City#", institutionDetails.cityName);
                text = text.Replace("#EducationalInstitution#", institutionDetails.university_name);
            }
        }

        return text;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        gte_student_sop sop = db.gte_student_sop.Where(x => x.applicant_id == UserID && x.universityid == universityID).FirstOrDefault();

        sop.applicant_generated_sop_para1 = txtPara1.Text;
        sop.applicant_generated_sop_para2 = txtPara2.Text;
        sop.applicant_generated_sop_para3 = txtPara3.Text;
        sop.applicant_generated_sop_para4 = txtPara4.Text;
        sop.applicant_generated_sop_para5 = txtPara5.Text;
        sop.is_sop_submitted_by_applicant = true;

        db.SaveChanges();

        btnEdit.Style.Add("display", "none");
        btnSave.Style.Add("display", "none");
        btnsubmit.Style.Add("display", "none");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        btnsubmit.Style.Remove("display");
        btnEdit.Style.Remove("display");
        btnSave.Style.Add("display", "none");

        txtPara1.ReadOnly = true;
        txtPara2.ReadOnly = true;
        txtPara3.ReadOnly = true;
        txtPara4.ReadOnly = true;
        txtPara5.ReadOnly = true;

        gte_student_sop sop = db.gte_student_sop.Where(x => x.applicant_id == UserID && x.universityid == universityID).FirstOrDefault();
        sop.applicant_generated_sop_para1 = txtPara1.Text;
        sop.applicant_generated_sop_para2 = txtPara2.Text;
        sop.applicant_generated_sop_para3 = txtPara3.Text;
        sop.applicant_generated_sop_para4 = txtPara4.Text;
        sop.applicant_generated_sop_para5 = txtPara5.Text;
        sop.edited_at = DateTime.Now;

        db.SaveChanges();
    }
}