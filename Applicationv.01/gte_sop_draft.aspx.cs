using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;
using NReco.PdfGenerator;
using System.IO;

public partial class gte_sop_draft : System.Web.UI.Page
{
    int UserID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCommon = new Common();
    string webURL = String.Empty;
    gte_applicantdetails applicantdetails;
    protected static List<faq> allQuestions = new List<faq>();
    int formId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        UserID = objUser.studentid;        

        if (!IsPostBack)
        {
            allQuestions = objCommon.FaqQuestionList(Request.QueryString["formid"], universityID);

            var sop_details = db.gte_student_sop.Where(x => x.applicant_id == UserID && x.universityid == universityID).FirstOrDefault();

            if (sop_details != null)
            {
                if (sop_details.is_sop_submitted_by_applicant)
                {
                    txtPara1.Text = sop_details.gte_sop_para1;
                    txtPara2.Text = sop_details.gte_sop_para2;
                    txtPara3.Text = sop_details.gte_sop_para3;
                    txtPara4.Text = sop_details.gte_sop_para4;
                    txtPara5.Text = sop_details.gte_sop_para5;

                    //btnEdit.Style.Add("display", "none");
                    //btnSave.Style.Add("display", "none");
                    //btnsubmit.Style.Add("display", "none");
                }
                else
                {
                    txtPara1.Text = sop_details.gte_sop_para1;
                    txtPara2.Text = sop_details.gte_sop_para2;
                    txtPara3.Text = sop_details.gte_sop_para3;
                    txtPara4.Text = sop_details.gte_sop_para4;
                    txtPara5.Text = sop_details.gte_sop_para5;

                    //btnSave.Style.Add("display", "none");
                    //btnsubmit.Style.Remove("display");
                    //btnEdit.Style.Remove("display");
                }
            }
            else
            {
                var answeredGteQuestion1 = db.gte_questions_applicant_response.AsNoTracking().Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();
                var allGteQuestions1 = db.gte_questions_master.AsNoTracking().ToList();

                var answeredGteQuestion2 = db.gte_question_part2_applicant_response.AsNoTracking().Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();
                var allGteQuestions2 = db.gte_question_master_part2.AsNoTracking().ToList();

                var clarification_questionsList = db.gte_clarification_questionmaster.AsNoTracking().ToList();
                var answeredClarificationQuestion = db.gte_clarification_applicantresponse.AsNoTracking().Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();

                foreach (var item in answeredGteQuestion2)
                    clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

                clarification_questionsList.RemoveAll(x => x.gte_master1_id == null);

                if (answeredGteQuestion1.Count != allGteQuestions1.Count) // Check for gte assesment 1 check
                {
                    completedDiv.Visible = true;
                    completedDiv.Style.Remove("display");
                    sop_section.Visible = false;
                    lblCompleted.Text = "Please complete GTE Stage-2 Assessment before proceeding";
                }
                else if (answeredGteQuestion2.Count != allGteQuestions2.Count)  // Check for gte assesment 2 check
                {
                    completedDiv.Visible = true;
                    completedDiv.Style.Remove("display");
                    sop_section.Visible = false;
                    lblCompleted.Text = "Please complete GTE Stage-3 Assessment before proceeding";
                }
                else if (answeredClarificationQuestion.Count < clarification_questionsList.Count) // Check for gte clarification question check
                {
                    completedDiv.Visible = true;
                    completedDiv.Style.Remove("display");
                    sop_section.Visible = false;
                    lblCompleted.Text = "Please complete GTE Clarification questions before proceeding";
                }
                else
                {
                    var isFullService = (int)Session["FullService"];
                    if (isFullService == 1)
                    {
                        applicantdetails = new gte_applicantdetails();
                        var details = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
                        var educationDetails = db.applicanteducationdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
                        var applicationDetails = db.applicationmaster.Where(x => x.applicantid == UserID && x.universityid == universityID && x.preferenceid.Value == 1).FirstOrDefault();
                        if (details != null && educationDetails != null && applicationDetails != null)
                        {
                            applicantdetails.nationality = details.nationality.Value;
                            applicantdetails.residencecountry = details.issameaspostal.Value == 1 ? details.postalcountry : details.residentialcountry;
                            applicantdetails.countryofbirth = details.countryofbirth;
                            applicantdetails.dateofbirth = details.dateofbirth;
                            applicantdetails.universityid = universityID;
                            applicantdetails.workexperience = !String.IsNullOrEmpty(details.totalyearofexperience) ? Convert.ToInt32(details.totalyearofexperience) : 0;
                            applicantdetails.highestqualifiactionachieved = details.higheststudycompleted.HasValue ? details.higheststudycompleted.Value.ToString() : "1";

                            applicantdetails.highestqualificationfield = details.fieldofhigheststudy.HasValue ? details.fieldofhigheststudy.Value : 1;
                            applicantdetails.highestqualificationdate = details.studycompletedate;
                            applicantdetails.highestqualificationcountry = Convert.ToInt32(details.countryofhigheststudy.HasValue);

                            applicantdetails.levelofcourse = applicationDetails.coursetype.HasValue ? applicationDetails.coursetype.Value : 1;
                            applicantdetails.cityofeducationInstitution = applicationDetails.city.HasValue ? applicationDetails.city.Value : 1;
                            applicantdetails.fieldofstudyapplied = applicationDetails.majorofdiscipline.HasValue ? applicationDetails.majorofdiscipline.Value : 1;
                            applicantdetails.coursename = db.coursemaster.Where(x => x.courseid == applicationDetails.course.Value).Select(x => x.coursename).FirstOrDefault();

                            applicantdetails.highestqualificationname = string.Empty;  // Initial Value for highest qualification
                            if (educationDetails.ishighereducation.HasValue && educationDetails.ishighereducation.Value == 1) // Applicant has entered most recent higher education
                            {
                                var higherEducationDetail = db.applicanthighereducation.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
                                applicantdetails.highestqualificationname = higherEducationDetail.coursename;
                            }
                            else if (educationDetails.isdiplomadone.HasValue && educationDetails.isdiplomadone.Value == 1) // Diploma is highest completed qualification
                                applicantdetails.highestqualificationname = "Diploma";
                            else if (educationDetails.issecondarydone.HasValue && educationDetails.issecondarydone.Value == 1) // Secondary is highest completed qualification
                                applicantdetails.highestqualificationname = "Secondary Education";
                            else if (educationDetails.ishighschooldone.HasValue && educationDetails.ishighschooldone.Value == 1) // High School is highest completed qualification
                                applicantdetails.highestqualificationname = "High School Education";
                        }
                        else if (details == null)
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Student Personal details missing. Please complete Student Information before proceeding.');window.location='" + webURL + "default.aspx';", true);
                        else if (educationDetails == null)
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applicant education details missing. Please complete education details before proceeding.');window.location='" + webURL + "default.aspx';", true);
                        else if (applicationDetails == null)
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Student Application missing. Please complete Student Application section before proceeding.');window.location='" + webURL + "default.aspx';", true);
                    }
                    else if (isFullService == 0)
                    {
                        applicantdetails = db.gte_applicantdetails.AsNoTracking().Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
                        //int courseId = Convert.ToInt32(applicantdetails.coursename);
                        //applicantdetails.coursename = db.coursemaster.Where(x => x.courseid == courseId).Select(x => x.coursename).FirstOrDefault();
                    }

                    if (applicantdetails == null)
                        Response.Redirect(webURL + "default.aspx", true);

                    try
                    {
                        //btnSave.Style.Add("display", "none");
                        //btnsubmit.Style.Remove("display");
                        //btnEdit.Style.Remove("display");

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
                        sop.applicant_generated_sop_para1 = txtPara1.Text;
                        sop.applicant_generated_sop_para2 = txtPara2.Text;
                        sop.applicant_generated_sop_para3 = txtPara3.Text;
                        sop.applicant_generated_sop_para4 = txtPara4.Text;
                        sop.applicant_generated_sop_para5 = txtPara5.Text;
                        sop.is_sop_submitted_draft = true;
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
            if (paragraphNo == 2 || paragraphNo == 1 || paragraphNo == 3)
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
                                                   .Where(x => x.question_id == group.Key && x.applicant_id == UserID && x.university_id == universityID)
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
                    if (item.value.Contains("field of study")) // For cheking field of study section 1 condition
                    {
                        if (applicantdetails.highestqualificationfield.Value == applicantdetails.fieldofstudyapplied.Value)
                            statementList.Remove(condition_statements.Where(x => x.id == item.id).FirstOrDefault());
                    }
                    else if (item.value.Contains("level of study")) // For cheking level of study section 1 condition
                    {
                        var selectedHighestQualification = Convert.ToInt32(applicantdetails.highestqualifiactionachieved);
                        var selectedAppliedQualification = Convert.ToInt32(applicantdetails.levelofcourse);
                        var highestQualificationAchievedLevel = db.studylevelmaster
                                                                  .Where(x => x.studylevelid == selectedHighestQualification).ToList()
                                                                  .Select(x => Convert.ToInt32(Regex.Replace(x.levelofcode, "[^0-9]+", string.Empty))).FirstOrDefault();
                        var appliedQualificationLevel = db.studylevelmaster
                                                          .Where(x => x.studylevelid == selectedAppliedQualification).ToList()
                                                          .Select(x => Convert.ToInt32(Regex.Replace(x.levelofcode, "[^0-9]+", string.Empty))).FirstOrDefault();
                        if (!(highestQualificationAchievedLevel > 17 || appliedQualificationLevel > 17)) // Hard coded for last three study level master values
                        {
                            if (highestQualificationAchievedLevel < appliedQualificationLevel)
                                statementList.Remove(condition_statements.Where(x => x.id == item.id).FirstOrDefault());
                        }
                        else
                            statementList.Remove(condition_statements.Where(x => x.id == item.id).FirstOrDefault());
                    }
                    else
                    {
                        bool? applicant_response = null;
                        int[] item_questions_array = Array.ConvertAll(item.question_id.Split(','), int.Parse);
                        foreach (int question in item_questions_array)
                        {
                            if (applicant_response == null)
                                applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.question_id == question && x.university_id == universityID)
                                                       .Select(x => x.applicant_response.Value).FirstOrDefault();
                            else
                                applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.question_id == question && x.university_id == universityID)
                                                       .Select(x => x.applicant_response.Value).FirstOrDefault() && applicant_response.Value;
                        }

                        statementList.Remove(condition_statements.Where(x => x.id == item.id && applicant_response.Value != Convert.ToBoolean(x.value)).FirstOrDefault());
                    }
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
                                               .Where(x => x.gte_question_id == question_id && x.applicant_id == UserID && x.university_id == universityID)
                                               .Select(x => x.gte_answer_id).FirstOrDefault();

                    var answer = db.gte_answer_master.Where(x => x.id == applicant_response).Select(x => x.answer).FirstOrDefault();

                    item.statement = item.statement.Replace("#Answer#", answer);
                }
                if (item.statement.Contains("#Answer_CQ#"))
                {
                    int clarification_question_id;
                    var question_id = Convert.ToInt32(item.question_id); // Code will give error when multiple question ids are passed from DB.
                    if (item.question_section == "section 1")
                        clarification_question_id = Convert.ToInt32(item.question_id);
                    else
                        clarification_question_id = db.gte_clarification_questionmaster.Where(x => x.gte_master1_id == question_id).Select(x => x.id).FirstOrDefault();

                    var response = db.gte_clarification_applicantresponse
                                     .Where(x => x.clarification_question_id == clarification_question_id && x.applicant_id == UserID && x.university_id == universityID)
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
                if (item.statement.Contains("#Answer_14#"))
                    item.statement = item.statement.Replace("#Answer_14#", applicantdetails.coursename);
                if (item.statement.Contains("#Name_of_Highest_education#"))
                    item.statement = item.statement.Replace("#Name_of_Highest_education#", applicantdetails.highestqualificationname); // Need to check and confirm
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
                if (item.statement.Contains("#Answer_12#"))
                {
                    int level = Convert.ToInt32(applicantdetails.levelofcourse);
                    var levelOfCourse = db.studylevelmaster.Where(x => x.studylevelid == level).Select(x => x.studylevel).FirstOrDefault();
                    item.statement = item.statement.Replace("#Answer_12#", levelOfCourse);
                }
                if (item.statement.Contains("#Answer_13#"))
                {
                    var study_field = db.majordiscipline_master.Where(x => x.id == applicantdetails.fieldofstudyapplied).Select(x => x.description).FirstOrDefault();
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
                if (item.statement.Contains("#Highest_Level_Achieved#"))
                {
                    int levelAchieved = Convert.ToInt32(applicantdetails.highestqualifiactionachieved);
                    var studyLevelName = db.studylevelmaster.Where(x => x.studylevelid == levelAchieved).Select(x => x.studylevel).FirstOrDefault();
                    item.statement = item.statement.Replace("#Highest_Level_Achieved#", studyLevelName);
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
        if (text.Contains("#ClickToKnowMore#"))
            text = text.Replace("#ClickToKnowMore#", string.Empty);

        return text;
    }


    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{
    //    gte_student_sop sop = db.gte_student_sop.Where(x => x.applicant_id == UserID && x.universityid == universityID).FirstOrDefault();

    //    sop.applicant_generated_sop_para1 = txtPara1.Text;
    //    sop.applicant_generated_sop_para2 = txtPara2.Text;
    //    sop.applicant_generated_sop_para3 = txtPara3.Text;
    //    sop.applicant_generated_sop_para4 = txtPara4.Text;
    //    sop.applicant_generated_sop_para5 = txtPara5.Text;
    //    sop.is_sop_submitted_by_applicant = true;

    //    db.SaveChanges();

    //    //btnEdit.Style.Add("display", "none");
    //    //btnSave.Style.Add("display", "none");
    //    //btnsubmit.Style.Add("display", "none");
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
    //        "alert('SOP saved successfully. Thank You for completing GTE SOP.');window.location='" + Request.ApplicationPath + "download_reports.aspx?formid=27';", true);
    //}

    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    //btnsubmit.Style.Remove("display");
    //    //btnEdit.Style.Remove("display");
    //    //btnSave.Style.Add("display", "none");

    //    gte_student_sop sop = db.gte_student_sop.Where(x => x.applicant_id == UserID && x.universityid == universityID).FirstOrDefault();
    //    sop.applicant_generated_sop_para1 = txtPara1.Text;
    //    sop.applicant_generated_sop_para2 = txtPara2.Text;
    //    sop.applicant_generated_sop_para3 = txtPara3.Text;
    //    sop.applicant_generated_sop_para4 = txtPara4.Text;
    //    sop.applicant_generated_sop_para5 = txtPara5.Text;
    //    sop.edited_at = DateTime.Now;

    //    db.SaveChanges();
    //}

    protected void downloaddraftsop_Click(object sender, EventArgs e)
    {
        try
        {
            var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
            htmlToPdf.Orientation = PageOrientation.Portrait;
            htmlToPdf.Size = PageSize.A4;
            htmlToPdf.Grayscale = false;
            htmlToPdf.PageWidth = 200f;
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string fileName = Guid.NewGuid() + ".pdf";
            string filePath = string.Concat(dirPath, "\\", fileName);
            htmlToPdf.GeneratePdfFromFile(webURL + "sop_report.aspx?token=YKUcfdhNWwp17azByk&id=" + UserID + "&downloadPdf=1&type=draft", null, filePath);

            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=SOP_Report_" + fileName);
            Response.TransmitFile(filePath);
            Response.Flush();
            if (File.Exists(filePath))
                File.Delete(filePath);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }
}