using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Drawing;

public partial class gte_report : System.Web.UI.Page
{
    protected string _institutionID = "";
    protected string _studentName = "Test Report";
    protected string _reportType = "";
    protected string _reportDate = "";
    protected string _reportNo = "";
    protected string _isRecommended = "";
    protected string _genuineStudentAssesment = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _situationStudentAssesment = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _potentialStudentAssesment = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _paragraph4 = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _paragraph5 = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _studentVideoReview = "";
    protected string _studentDocumentsValidations = "";
    protected string _paragraphComment1 = "";
    protected string _paragraphComment2 = "";
    protected string _paragraphComment3 = "";
    protected string _paragraphComment4 = "";
    protected string _paragraphComment5 = "";
    protected string _studentRecommended = "";
    protected string _recommendationRemark = "";
    protected string _notesDisclaimer = "";

    public string logourl = string.Empty;
    public string studentphoto = string.Empty;

    protected int ApplicantID = 0, universityID = 0;
    protected string _universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "" || Request.QueryString["downloadPdf"] == null || Request.QueryString["downloadPdf"].ToString() == "")
        { }
        else
        {
            int downloadPdf = 0;
            int.TryParse(Request.QueryString["downloadPdf"].ToString(), out downloadPdf);

            if ((downloadPdf == 0 && Utility.CheckAdminLogin()) || (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "XS7MKjHLunMAvqzCGr"))
            {
                universityID = Utility.GetUniversityId();
                ApplicantID = Convert.ToInt32(Request.QueryString["id"].ToString());
                ViewState["downloadPdf"] = downloadPdf;

                var universityDetails = db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.universityid, x.logo, x.notes_disclaimer, x.university_name, x.full_service }).FirstOrDefault();
                logourl = webURL + "/Docs/" + universityDetails.universityid + "/" + universityDetails.logo;
                _universityName = universityDetails.university_name;

                lblapplicantid.Text = Convert.ToString(ApplicantID);
                if (universityDetails.full_service == 1)
                {
                    var applicantdoc = db.applicantdocumentmaster.Where(x => x.universityid == universityID && x.applicantid == ApplicantID && x.documentname == "Profile Photo for Application Centre").Select(x => x.filename).FirstOrDefault();
                    if (applicantdoc != null)
                        studentphoto = webURL + "/Docs/" + ApplicantID + "/Documents/" + applicantdoc;
                    //other details
                    var applicantdetail = db.applicantdetails.Where(x => x.universityid == universityID && x.applicantid == ApplicantID).Select(x => new { x.nationality, x.residentialcountry, x.dateofbirth }).FirstOrDefault();
                    var coursedetails = db.applicationmaster.Where(x => x.universityid == universityID && x.applicantid == ApplicantID && x.preferenceid == 1).Select(x => new { x.course }).FirstOrDefault();

                    if (applicantdetail != null)
                    {
                        lblnationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(applicantdetail.nationality));
                        lblcountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(applicantdetail.residentialcountry));
                        DateTime Dob = Convert.ToDateTime(applicantdetail.dateofbirth);
                        Age objAge = new Age(Dob, DateTime.Now);
                        lblage.Text = Convert.ToString(objAge.Years);
                    }
                    if (coursedetails != null && coursedetails.course != null)
                        lblcoursename.Text = objCom.GetCourseName(Convert.ToInt32(coursedetails.course));
                }
                else if (universityDetails.full_service == 0)
                {
                    var gte_applicantdetails = db.gte_applicantdetails.Where(x => x.universityid == universityID && x.applicantid == ApplicantID).FirstOrDefault();
                    if (gte_applicantdetails != null && gte_applicantdetails.profilepicturepath != "")
                        studentphoto = webURL + "/Docs/GTEProfileDetail/" + gte_applicantdetails.profilepicturepath;
                    var gtestudentdetails = db.gte_applicantdetails.Where(x => x.universityid == universityID && x.applicantid == ApplicantID).Select(x => new { x.nationality, x.residencecountry, x.dateofbirth, x.coursename }).FirstOrDefault();
                    if (gtestudentdetails != null)
                    {
                        lblnationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(gtestudentdetails.nationality));
                        lblcountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(gtestudentdetails.residencecountry));
                        DateTime Dob = Convert.ToDateTime(gtestudentdetails.dateofbirth);
                        Age objAge = new Age(Dob, DateTime.Now);
                        lblage.Text = Convert.ToString(objAge.Years);
                        lblcoursename.Text = gtestudentdetails.coursename;
                    }
                }
                var Personal = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
                _studentName = Personal.firstname + " " + Personal.lastname;

                if (!IsPostBack)
                {
                    DateTime currentDate = DateTime.Now;
                    _institutionID = universityID.ToString();
                    _reportType = "AU - GS &amp; GTE (TYPE 1)";
                    _reportDate = currentDate.ToString("dd-MMM-y");
                    _notesDisclaimer = universityDetails.notes_disclaimer;
                    _reportNo = "ECU - " + currentDate.Year + currentDate.ToString("MM") + currentDate.ToString("dd") + currentDate.Hour + currentDate.Minute + ApplicantID;

                    var gte_student_sop = db.gte_student_sop
                                            .Where(x => x.applicant_id == ApplicantID && x.universityid == universityID && x.is_sop_submitted_by_applicant == true)
                                            .FirstOrDefault();

                    string type = Request.QueryString["type"].ToString();

                    if (gte_student_sop != null)
                    {
                        if (type == "final")
                        {
                            if (gte_student_sop.is_sop_submitted_by_applicant == true)
                            {
                                ViewState["student_sop_id"] = gte_student_sop.id;
                                _genuineStudentAssesment = gte_student_sop.applicant_generated_sop_para1;
                                _situationStudentAssesment = gte_student_sop.applicant_generated_sop_para2;
                                _potentialStudentAssesment = gte_student_sop.applicant_generated_sop_para3;
                                _paragraph4 = gte_student_sop.applicant_generated_sop_para4;
                                _paragraph5 = gte_student_sop.applicant_generated_sop_para5;
                            }
                        }
                        else if (type == "draft")
                        {
                            if (gte_student_sop.is_sop_submitted_draft == true)
                            {
                                ViewState["student_sop_id"] = gte_student_sop.id;
                                _genuineStudentAssesment = gte_student_sop.gte_sop_para1;
                                _situationStudentAssesment = gte_student_sop.gte_sop_para2;
                                _potentialStudentAssesment = gte_student_sop.gte_sop_para3;
                                _paragraph4 = gte_student_sop.gte_sop_para4;
                                _paragraph5 = gte_student_sop.gte_sop_para5;
                            }
                        }
                    }

                    var section2_max_score_by_tag = db.gte_answer_master
                                                      .Select(x => new { x.gte_question_id, x.gte_risk_score, x.gte_score, x.gte_questions_master.tag })
                                                      .GroupBy(x => x.gte_question_id)
                                                      .Select(x => new { max_gte_score_per_question = x.Max(z => z.gte_score), max_risk_score_per_question = x.Max(z => z.gte_risk_score), x.FirstOrDefault().tag })
                                                      .GroupBy(x => x.tag)
                                                      .Select(x => new { gte_max_by_tag = x.Sum(y => y.max_gte_score_per_question), risk_max_by_tag = x.Sum(y => y.max_risk_score_per_question), tag = x.Key })
                                                      .OrderBy(x => x.tag).ToList();

                    var applicant_section2_score = db.gte_questions_applicant_response
                                                     .Where(x => x.applicant_id == ApplicantID && x.university_id == universityID)
                                                     .Select(x => new { x.gte_question_id, x.gte_answer_master.gte_risk_score, x.gte_answer_master.gte_score, x.gte_questions_master.tag })
                                                     .Distinct()
                                                     .GroupBy(x => x.tag)
                                                     .Select(x => new { applicant_risk_score = x.Sum(y => y.gte_risk_score), applicant_gte_score = x.Sum(y => y.gte_score), x.FirstOrDefault().tag })
                                                     .OrderBy(x => x.tag).ToList();

                    var reportObj = new List<object>();
                    for (int i = 0; i < applicant_section2_score.Count; i++)
                    {
                        if (applicant_section2_score[i].tag == section2_max_score_by_tag[i].tag)
                        {
                            decimal applicant_gte_score = applicant_section2_score[i].applicant_gte_score;
                            decimal max_gte_score = section2_max_score_by_tag[i].gte_max_by_tag;
                            decimal applicant_risk_score = applicant_section2_score[i].applicant_risk_score;
                            decimal max_risk_score = section2_max_score_by_tag[i].risk_max_by_tag;
                            reportObj.Add(new
                            {
                                gte_percentage = Math.Round((applicant_gte_score / max_gte_score) * 100, 0),
                                risk_percentage = Math.Round((applicant_risk_score / max_risk_score) * 100, 0),
                                section2_max_score_by_tag[i].tag
                            });
                        }
                    }

                    var section3_max_score_by_tag = db.gte_question_master_part2
                                                      .GroupBy(x => x.tag)
                                                      .Select(x => new { gte_score = x.Sum(y => y.true_gte_score + y.false_gte_score), risk_score = x.Sum(y => y.true_risk_score + y.false_risk_score), tag = x.Key })
                                                      .OrderBy(x => x.tag).ToList();

                    var applicant_section3_score = db.gte_question_part2_applicant_response
                                                     .Where(x => x.applicant_id == ApplicantID && x.university_id == universityID)
                                                     .Select(x => new
                                                     {
                                                         x.gte_question_master_part2.tag,
                                                         gte_score_per_question = x.applicant_response.Value ? x.gte_question_master_part2.true_gte_score : x.gte_question_master_part2.false_gte_score,
                                                         risk_score_per_question = x.applicant_response.Value ? x.gte_question_master_part2.true_risk_score : x.gte_question_master_part2.false_risk_score
                                                     })
                                                     .GroupBy(x => x.tag)
                                                     .Select(x => new { applicant_gte_score = x.Sum(y => y.gte_score_per_question), applicant_risk_score = x.Sum(y => y.risk_score_per_question), tag = x.Key })
                                                     .OrderBy(x => x.tag).ToList();

                    for (int i = 0; i < applicant_section3_score.Count; i++)
                    {
                        if (applicant_section3_score[i].tag == section3_max_score_by_tag[i].tag)
                        {
                            decimal applicant_gte_score = applicant_section3_score[i].applicant_gte_score;
                            decimal max_gte_score = section3_max_score_by_tag[i].gte_score;
                            decimal applicant_risk_score = applicant_section3_score[i].applicant_risk_score;
                            decimal max_risk_score = section3_max_score_by_tag[i].risk_score;

                            reportObj.Add(new
                            {
                                gte_percentage = Math.Round((applicant_gte_score / max_gte_score) * 100, 0),
                                risk_percentage = Math.Round((applicant_risk_score / max_risk_score) * 100, 0),
                                section3_max_score_by_tag[i].tag
                            });
                        }
                    }

                    var overall_section2_max_score = db.gte_answer_master
                                                       .Select(x => new { x.gte_question_id, x.gte_risk_score, x.gte_score })
                                                       .GroupBy(x => x.gte_question_id)
                                                       .Select(x => new { max_gte_score_per_question = x.Max(z => z.gte_score), max_risk_score_per_question = x.Max(z => z.gte_risk_score), questionId = x.Key });

                    var overall_applicant_section2_score = db.gte_questions_applicant_response
                                                             .Where(x => x.applicant_id == ApplicantID && x.university_id == universityID)
                                                             .Select(x => new { x.gte_question_id, x.gte_answer_master.gte_risk_score, x.gte_answer_master.gte_score })
                                                             .Distinct();

                    var overall_section3_max_score = db.gte_question_master_part2
                                                       .Select(x => new
                                                       {
                                                           max_gte_score_per_question = x.true_gte_score > x.false_gte_score ? x.true_gte_score : x.false_gte_score,
                                                           max_risk_score_per_question = x.true_risk_score > x.false_risk_score ? x.true_risk_score : x.false_risk_score,
                                                           questionId = x.id
                                                       });

                    var overall_applicant_section3_score = db.gte_question_part2_applicant_response
                                                             .Where(x => x.applicant_id == ApplicantID && x.university_id == universityID)
                                                             .Select(x => new
                                                             {
                                                                 questionId = x.gte_question_master_part2.id,
                                                                 gte_score_per_question = x.applicant_response.Value ? x.gte_question_master_part2.true_gte_score : x.gte_question_master_part2.false_gte_score,
                                                                 risk_score_per_question = x.applicant_response.Value ? x.gte_question_master_part2.true_risk_score : x.gte_question_master_part2.false_risk_score
                                                             });

                    decimal overall_max_gte_score = overall_section2_max_score.Sum(x => x.max_gte_score_per_question) + overall_section3_max_score.Sum(x => x.max_gte_score_per_question);
                    decimal overall_max_risk_score = overall_section2_max_score.Sum(x => x.max_risk_score_per_question) + overall_section3_max_score.Sum(x => x.max_risk_score_per_question);
                    decimal overall_applicant_gte_score = overall_applicant_section2_score.Sum(x => x.gte_score) + overall_applicant_section3_score.Sum(x => x.gte_score_per_question);
                    decimal overall_applicant_risk_score = overall_applicant_section2_score.Sum(x => x.gte_risk_score) + overall_applicant_section3_score.Sum(x => x.risk_score_per_question);

                    reportObj.Add(new
                    {
                        gte_percentage = Math.Round((overall_applicant_gte_score / overall_max_gte_score) * 100),
                        risk_percentage = Math.Round((overall_applicant_risk_score / overall_max_risk_score) * 100),
                        tag = "Overall"
                    });

                    DataTable table = new DataTable();
                    table.Columns.Add("Title");
                    table.Columns.Add("Value");
                    foreach (var item in reportObj)
                    {
                        string tag = Convert.ToString(item.GetType().GetProperty("tag").GetValue(item, null));
                        DataRow _r = table.NewRow();
                        _r["Title"] = "Risk";
                        _r["Value"] = Convert.ToString(item.GetType().GetProperty("risk_percentage").GetValue(item, null));

                        table.Rows.Add(_r);
                        _r = table.NewRow();
                        _r["Title"] = "GTE";
                        _r["Value"] = Convert.ToString(item.GetType().GetProperty("gte_percentage").GetValue(item, null));
                        table.Rows.Add(_r);

                        if (tag == "Character & Criminal Record")
                            populateGraph(Character, table);
                        else if (tag == "Genuine Student")
                            populateGraph(Genuine, table);
                        else if (tag == "Compliance to Visa Conditions")
                            populateGraph(Compliance, table);
                        else if (tag == "Retention Risk")
                            populateGraph(Retention, table);
                        else if (tag == "Immigration History")
                            populateGraph(Immigration, table);
                        else if (tag == "Situation in the Students Home Country")
                            populateGraph(Situation, table);
                        else if (tag == "Potential Situation in Australia")
                            populateGraph(Potential, table);
                        else if (tag == "Value of the course to the students future future")
                            populateGraph(courseValue, table);
                        else if (tag == "Overall")
                            populateGraph(OverAll, table);

                        table.Clear();
                    }
                    string type2 = Request.QueryString["type"].ToString();
                    if (type2 == "final")
                        populateCommentsAndReviews();
                    else if (type2 == "draft")
                    {
                        div1.Attributes.Add("style", "display:none");
                        div2.Attributes.Add("style", "display:none");
                        para1Comments.Attributes.Add("style", "display:none");
                        para2Comments.Attributes.Add("style", "display:none");
                        para3Comments.Attributes.Add("style", "display:none");
                        para4Comments.Attributes.Add("style", "display:none");
                        para5Comments.Attributes.Add("style", "display:none");
                        studentVideoReview.Attributes.Add("style", "display:none");
                        studentRecommended.Attributes.Add("style", "display:none");
                        studentDocumentsValidations.Attributes.Add("style", "display:none");
                        recommendationRemark.Attributes.Add("style", "display:none");
                    }
                }
            }
        }
    }

    private void populateGraph(Chart chart, DataTable values)
    {
        DataTable ChartData = values;
        Font chartFont = new Font(chart.Series[0].Font.FontFamily, 12, FontStyle.Bold);
        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);
        }
        //binding chart control  
        chart.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line
        if (chart.ID == "OverAll")
        {
            chart.Width = 450;
            chart.Series[0].BorderWidth = 4;
            chart.Series[0]["PixelPointWidth"] = "30";
            chart.ChartAreas[chart.ChartAreas[0].Name].AxisY.Interval = 10;
        }
        else
        {
            chart.Series[0].BorderWidth = 3;
            chart.Series[0]["PixelPointWidth"] = "20";
        }
        //setting Chart type   
        chart.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        chart.Series[0].IsValueShownAsLabel = true;
        chart.Series[0].Font = chartFont;

        //Hide or show chart back GridLines  

        chart.ChartAreas[chart.ChartAreas[0].Name].AxisX.LabelStyle.Font = chartFont;
        chart.ChartAreas[chart.ChartAreas[0].Name].AxisY.LabelStyle.Font = chartFont;
        chart.ChartAreas[chart.ChartAreas[0].Name].AxisY.Maximum = 100;
        chart.ChartAreas[chart.ChartAreas[0].Name].AxisY.Minimum = 0;
        chart.ChartAreas[chart.ChartAreas[0].Name].AxisX.MajorGrid.Enabled = false;
        chart.ChartAreas[chart.ChartAreas[0].Name].AxisY.MajorGrid.Enabled = true;
        chart.ChartAreas[chart.ChartAreas[0].Name].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                chart.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                chart.Series[0].Points[i].Color = Color.Green;
        }
    }

    private void populateCommentsAndReviews()
    {
        int downloadPdf = Convert.ToInt32(ViewState["downloadPdf"]);
        try
        {
            int student_sop_id = Convert.ToInt32(ViewState["student_sop_id"]);
            var gteAdminCommentObj = db.gte_report_admin_comment.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.student_sop_id == student_sop_id).FirstOrDefault();
            if (downloadPdf == 0)
            {
                hidePDFFields();
                if (gteAdminCommentObj != null)
                {
                    para1Comments.Value = gteAdminCommentObj.para1_comments;
                    para2Comments.Value = gteAdminCommentObj.para2_comments;
                    para3Comments.Value = gteAdminCommentObj.para3_comments;
                    para4Comments.Value = gteAdminCommentObj.para4_comments;
                    para5Comments.Value = gteAdminCommentObj.para5_comments;
                    studentVideoReview.Value = gteAdminCommentObj.student_video_comments;
                    studentDocumentsValidations.Value = gteAdminCommentObj.student_document_comments;
                    studentRecommended.Value = gteAdminCommentObj.student_recommended;
                    recommendationRemark.Value = gteAdminCommentObj.final_recommendation;
                }
            }
            else if (downloadPdf == 1)
            {
                hideFields();
                if (gteAdminCommentObj != null)
                {
                    _paragraphComment1 = gteAdminCommentObj.para1_comments;
                    _paragraphComment2 = gteAdminCommentObj.para2_comments;
                    _paragraphComment3 = gteAdminCommentObj.para3_comments;
                    _paragraphComment4 = gteAdminCommentObj.para4_comments;
                    _paragraphComment5 = gteAdminCommentObj.para5_comments;
                    _studentVideoReview = gteAdminCommentObj.student_video_comments;
                    _studentDocumentsValidations = gteAdminCommentObj.student_document_comments;
                    _studentRecommended = gteAdminCommentObj.student_recommended;
                    _recommendationRemark = gteAdminCommentObj.final_recommendation;
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
   
    private void hidePDFFields()
    {
        studentRecommendedPDF.Style.Add("display", "none");
        recommendationRemarkPDF.Style.Add("display", "none");
        paragraphComment1PDF.Style.Add("display", "none");
        paragraphComment2PDF.Style.Add("display", "none");
        paragraphComment3PDF.Style.Add("display", "none");
        paragraphComment4PDF.Style.Add("display", "none");
        paragraphComment5PDF.Style.Add("display", "none");
        studentVideoReviewPDF.Style.Add("display", "none");
        studentDocumentsValidationsPDF.Style.Add("display", "none");

    }

    private void hideFields()
    {
        studentRecommended.Style.Add("display", "none");
        recommendationRemark.Style.Add("display", "none");
        para1Comments.Style.Add("display", "none");
        para2Comments.Style.Add("display", "none");
        para3Comments.Style.Add("display", "none");
        para4Comments.Style.Add("display", "none");
        para5Comments.Style.Add("display", "none");
        studentVideoReview.Style.Add("display", "none");
        studentDocumentsValidations.Style.Add("display", "none");        
    }
}