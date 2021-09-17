using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class admin_ec_chec_assignment_build : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int? universityID, assignId, selecteduniversityID, assignmentId, selectedapplicantid, adminId, assignment_dateID;
    DateTime? selectedexamtime;
    public string evalutionfile;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public string applicantname, lblquestionfinalmarks;
    public int questiontype;
    public int? lblExamfinalmarks;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminId = Convert.ToInt32(Session["UserID"]);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["ID"] == null) || (Request.QueryString["ID"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            assignId = Convert.ToInt32(Request.QueryString["ID"]);

        if ((Request.QueryString["assign_date"] == null) || (Request.QueryString["assign_date"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            assignment_dateID = Convert.ToInt32(Request.QueryString["assign_date"]);

        
        var exam_assign = db.ec_assignments_assign.Where(x => x.assignId == assignId).FirstOrDefault();
        showEvalutionFile(Convert.ToInt32(exam_assign.assignmentId));
        selecteduniversityID = exam_assign.universityid;
        assignmentId = exam_assign.assignmentId;
        selectedapplicantid = exam_assign.applicantId;
        //selectedexamtime = exam_assign.exam_datetime;

        applicantname = objCom.GetApplicantFirstName(Convert.ToInt32(selectedapplicantid)) + " " + objCom.GetApplicantLastName(Convert.ToInt32(selectedapplicantid));

        Divtoshow();
        populatedate_marks();
    }

    private void showEvalutionFile(int assignmentid)
    {
        var assignment_master = db.ec_assignment_master.Where(x => x.id == assignmentid).FirstOrDefault();
        if (assignment_master != null)
        {
            if (assignment_master.checkingguide != null)
            {
                evalutionguid.Attributes.Add("style", "display:block;");
                evalutionfile = webURL + "Docs/Eclass_Service/Assignments/"+ assignment_master.checkingguide;
            }
        }
    }


    private void Divtoshow()
    {
        var examdata = db.ec_assignment_master.Where(x => x.id == assignmentId).FirstOrDefault();
        if (examdata.assignment_type== 1)
        {
            toshowanswersheet();
            showbuildexamDiv.Attributes.Add("style", "display:block");

            marksDiv.Attributes.Add("style", "display:none");
        }
    }

   
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var papersheet = (List<ec_assignment_answersheet>)Session["allQuestions"];

            int studentid = 0, answesheetid = 0, universityid = 0, exampaperid = 0;
            
            foreach (DataListItem item in questionList.Items)
            {
                Label lblstudentid = (Label)item.FindControl("lblstudentid");
                studentid = Convert.ToInt32(lblstudentid.Text);

                Label lblanswesheetid = (Label)item.FindControl("lblanswesheetid");
                answesheetid = Convert.ToInt32(lblanswesheetid.Text);

                Label lbluniversityid = (Label)item.FindControl("lbluniversityid");
                universityid = Convert.ToInt32(lbluniversityid.Text);

                Label lblexampaperid = (Label)item.FindControl("lblexampaperid");
                exampaperid = Convert.ToInt32(lblexampaperid.Text);
                
                //TextBox txtcomments = (TextBox)item.FindControl("txtcomments");
                string comments = txtcomments.Text;

                //                TextBox txtmarks = (TextBox)item.FindControl("txtmarks2");
                string marks = txtmarks2.Text;

                FileUpload checksheet = (FileUpload)item.FindControl("checksheet");

                ec_assignment_checked_master objmapping = new ec_assignment_checked_master();

                objmapping.adminid = adminId;
                objmapping.assignId= assignId;
                objmapping.applicantid = selectedapplicantid;
                objmapping.universityid = selecteduniversityID;
                objmapping.answersheetid = answesheetid;
                if (checksheet.HasFile)
                {
                    docPath = docPath + "/Eclass_Service/Assignment_check/" + universityid + "/" + studentid + "/" + assignId + "/Checked/" + answesheetid;
                    string path = docPath + "/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(checksheet.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    checksheet.PostedFile.SaveAs(filePath);
                    objmapping.checkedfile_path_by_admin = fileName;
                }
                objmapping.marks = Convert.ToInt32(marks);
                objmapping.checker_comments = comments;
                objmapping.assignment_checked_at = DateTime.UtcNow;
                db.ec_assignment_checked_master.Add(objmapping);
                db.SaveChanges();
                papersheet.RemoveAll(x => x.answesheetid == answesheetid);

                ////save to assign

                //var mode1 = "new";
                //ec_assignments_assign objexam_assign = new ec_assignments_assign();
                //var examassign = db.ec_assignments_assign.Where(x => x.assignId == assignId).FirstOrDefault();

                //if (examassign != null)
                //{
                //    mode1 = "update";
                //    objexam_assign = examassign;
                //}
                //objexam_assign.status = 6;
                ////objexam_assign.Is_assignment_checked = 1;
                
                //if (mode1 == "new")
                //    db.ec_assignments_assign.Add(objexam_assign);
                //db.SaveChanges();
            }
            if (papersheet.Count > 0)
            {
                txtcomments.Text = "";
                txtmarks2.Text = "";
                Session["allQuestions"] = papersheet;
                toshowanswersheet();
                bindDataList();
            }
            else
            {
                //save to assign

                var mode1 = "new";
                ec_assignments_assign objexam_assign = new ec_assignments_assign();
                var examassign = db.ec_assignments_assign.Where(x => x.assignId == assignId).FirstOrDefault();

                if (examassign != null)
                {
                    mode1 = "update";
                    objexam_assign = examassign;
                }
                objexam_assign.status = 3;
                objexam_assign.Is_assignment_checked = 1;
                
                if (mode1 == "new")
                    db.ec_assignments_assign.Add(objexam_assign);
                db.SaveChanges();

                //if all queshtionsheets are answerd then save final marks and rrelease date

                var mark_givenByAdmin = db.ec_assignment_checked_master.Where(x => x.universityid == universityid && x.applicantid == studentid && x.assignId == assignId)
                                               .Select(x => x.marks).DefaultIfEmpty(0).Sum();

                int Buildtotalmarks = BindTotalMarks_buildtype(exampaperid);
                SaveBuildTotalMarks(mark_givenByAdmin, Buildtotalmarks);

                //populatedate_marks(examinerid, exampaperid, studentid, universityid, examdatetime);
                answer_records.Attributes.Add("style", "display:none");
                populatedate_marks();
                //marksDiv.Attributes.Add("style", "display:block");
                //evalutionguid.Attributes.Add("style", "display:none");
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SaveBuildTotalMarks(int? mark_givenByAdmin, int? totalmarks)
    {
        try
        {
            var mode = "new";
            ec_assignments_assign objmappping = new ec_assignments_assign();

            var data = db.ec_assignments_assign.Where(x => x.assignId == assignId).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmappping = data;
            }

            objmappping.marks = mark_givenByAdmin;
            objmappping.total_marks = totalmarks;

            if (mode == "new")
                db.ec_assignments_assign.Add(objmappping);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void populatedate_marks()
    {
        try
        {
            var data = db.ec_assignments_assign.Where(x => x.assignId == assignId).FirstOrDefault();

            if (data != null)
            {
                txtmarks.Attributes.Add("disabled", "disabled");
                txtmarks.Value = data.marks.ToString();
                lblExamfinalmarks = data.total_marks;

                //btnsavedatemarks.Attributes.Add("style", "display:none");
                if (data.status == 3 && data.Is_assignment_checked == 1)
                {
                  //  btnsavedatemarks.Attributes.Add("style", "display:block");
                    marksDiv.Attributes.Add("style", "display:block");
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    public class details
    {
        public int? answesheetid { get; set; }
        public int? universityid { get; set; }
        public int? exampaperid { get; set; }
        public DateTime? examdatetime { get; set; }
        public string question { get; set; }
        public string anshwesheetpath { get; set; }
        public string applicantanswer { get; set; }
        public string applicantanswer_description { get; set; }
        public string applicantanswer_exttrasheets { get; set; }
        public string correctanswer { get; set; }
        public string correctanswer_description { get; set; }
        public string questionmarks { get; set; }
        public string questionfinalmarks { get; set; }
        public int? questiontype { get; set; }
        public int? questiontype_id { get; set; }
        public string correct { get; set; }
        public string incorrect { get; set; }
        public string correctansfileFlag { get; set; }
        public string ifdownloadquestiontype { get; set; }
        public string question_extrasheet { get; set; }
        public string question_extrafile { get; set; }
        public int? studentid { get; set; }
        public int? exampapersheetID { get; set; }
        public string applicantanswer_extrafile { get; set; }
        public string openasnwernote { get; set; }
        public string openasnwernotetype { get; set; }
        public string ifopenasnwer { get; set; }
    }


    //protected void btnsavedatemarks_Click1(object sender, EventArgs e)
    //{
    //    try
    //    {

           
    //        var List_data = (from exam in db.ec_assignments_assign
    //                         where exam.universityid == universityID && exam.assignmentId == assignmentId && exam.assignment_date_id == assignment_dateID
    //                         select new data()
    //                         {
    //                             id = exam.assignId,
    //                             statusId = exam.status,
    //                             is_assignment_checked = exam.Is_assignment_checked,
    //                             student_assignment_URL = null,
    //                             is_checked = null,
    //                             toshow = null,
    //                         }).OrderBy(x => x.id).ToList();
    //        foreach (var item in List_data)
    //        {
    //            var mode = "new";
    //            ec_assignments_assign objexam_assign = new ec_assignments_assign();
    //            //save realse date
    //            var data = db.ec_assignments_assign.Where(x => x.assignId == item.id).FirstOrDefault();
    //            if (data != null)
    //            {
    //                mode = "update";
    //                objexam_assign = data;
    //            }
    //            if (item.statusId == 3)
    //            {
    //                objexam_assign.Is_result_declared = 1;
    //                //objexam_assign.result_release_timezone = hidTimeZone.Value;
    //                //objexam_assign.result_release_datetime = Convert.ToDateTime(selectedexamdate_time.Value);
    //                //objexam_assign.result_release_datetime_utc = Convert.ToDateTime(hidexamutcdatetime.Value);


    //            }
    //            else
    //            {
    //                //other marked as expired if assignment is not submitted by applicant
    //                if (item.statusId != 3)
    //                    objexam_assign.status = 4;//expired

    //            }
    //            if (mode == "new")
    //                db.ec_assignments_assign.Add(objexam_assign);
    //            db.SaveChanges();
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    private void toshowanswersheet()
    {
        var answeredQuestion = db.ec_assignment_checked_master.Where(x => x.applicantid == selectedapplicantid && x.universityid == selecteduniversityID && x.assignId == assignId).ToList();
        var allQuestions = db.ec_assignment_answersheet.Where(y => y.assignID == assignId && y.universityID == selecteduniversityID & y.applicantid == selectedapplicantid && y.assignmentid == assignmentId).ToList();

        ViewState["QuestionsCount"] = allQuestions.Count;
        ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
        Session["allQuestions"] = allQuestions;

        if (answeredQuestion.Count == allQuestions.Count)
        {
            //marksDiv.Attributes.Add("style", "display:block");
            if (allQuestions.Count > 0)
            {

                populatedate_marks();
                answer_records.Attributes.Add("style", "display:none");
                button.Attributes.Add("style", "display:none");
            }
            else
            {

                answer_records.Attributes.Add("style", "display:none");
                button.Attributes.Add("style", "display:none");
            }
        }
        else
        {

            button.Attributes.Add("style", "display:block");
            showbuildexamDiv.Attributes.Add("style", "display:block");
            answer_records.Attributes.Add("style", "display:block");
            SetQuestionList(answeredQuestion);
        }
    }

    private void SetQuestionList(List<ec_assignment_checked_master> allResponseList)
    {
        try
        {
            var examdata = db.ec_assignment_papers_master.Where(x => x.assignmentid == assignmentId).FirstOrDefault();
            //buildevalutionfile = webURL + "Docs/Exammodule/" + universityid + "/" + examid + "/CheckingGuide/" + examdata.checkingguidfilepath;
            var questions = (List<ec_assignment_answersheet>)Session["allQuestions"];
            if (allResponseList.Count > 0)
            {
                foreach (var response in allResponseList)
                {
                    questions.RemoveAll(x => x.answesheetid == response.answersheetid);
                }
            }

            Session["allQuestions"] = questions;
            bindDataList();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private void bindDataList()
    {
        try
        {
            List<int> lst = new List<int>();
            var papersheet = (List<ec_assignment_answersheet>)Session["allQuestions"];
            int? papersheetId = papersheet.ElementAt(0).answesheetid;

            var allanswerpapers = (from ea in db.ec_assignment_answersheet
                                   join em in db.ec_assignment_papers_master on ea.assignment_papersheetID equals em.id
                                   where ea.answesheetid == papersheetId && ea.universityID == selecteduniversityID && ea.assignmentid== assignmentId && ea.applicantid == selectedapplicantid 
                                   select new details()
                                   {
                                       answesheetid = papersheetId,
                                       universityid = ea.universityID,
                                       exampaperid = assignmentId,
                                       studentid = selectedapplicantid,
                                       //examdatetime = examdatetime,
                                       exampapersheetID = ea.assignment_papersheetID,
                                       question = null,
                                       anshwesheetpath = ea.anshwesheetpath,
                                       applicantanswer = null,
                                       applicantanswer_exttrasheets = ea.extra_anshwesheetpath,
                                       correctanswer = null,
                                       correctanswer_description = null,
                                       applicantanswer_description = null,
                                       correct = null,
                                       incorrect = null,
                                       questionmarks = null,
                                       questionfinalmarks = null,
                                       questiontype = em.question_typeid,
                                       questiontype_id = em.selected_questionId,
                                       correctansfileFlag = null,
                                       ifdownloadquestiontype = null,
                                       question_extrasheet = null,
                                       question_extrafile = null,
                                       applicantanswer_extrafile = null,
                                       openasnwernote = null,
                                       openasnwernotetype = null,
                                       ifopenasnwer = null,
                                   }).ToList();

            var take1question = allanswerpapers.Take(1);
            foreach (var item in take1question)
            {
                questiontype =Convert.ToInt32(item.questiontype);
                if (item.questiontype == 1)
                {
                    var mcq_questionbank = db.ec_mcq_question_master.Where(x => x.id == item.questiontype_id).FirstOrDefault();
                    item.question = mcq_questionbank.question;
                    item.correctanswer = mcq_questionbank.correctanswer.ToString();
                    item.questionfinalmarks = mcq_questionbank.marks;
                    //totalmarksvalidation = mcq_questionbank.maximummarks;
                    item.applicantanswer = item.anshwesheetpath;
                    if (item.applicantanswer == item.correctanswer)
                    {
                        item.correct = "correct";
                        item.questionmarks = mcq_questionbank.marks;
                    }
                    else
                    {
                        item.incorrect = "incorrect";
                        item.questionmarks = "0";
                    }
                    if (item.applicantanswer == "answer1")
                        item.applicantanswer_description = mcq_questionbank.answer1;
                    else if (item.applicantanswer == "answer2")
                        item.applicantanswer_description = mcq_questionbank.answer2;
                    else if (item.applicantanswer == "answer3")
                        item.applicantanswer_description = mcq_questionbank.answer3;
                    else if (item.applicantanswer == "answer4")
                        item.applicantanswer_description = mcq_questionbank.answer4;

                    if (item.correctanswer == "1")
                        item.correctanswer_description = mcq_questionbank.answer1;
                    else if (item.correctanswer == "2")
                        item.correctanswer_description = mcq_questionbank.answer2;
                    else if (item.correctanswer == "3")
                        item.correctanswer_description = mcq_questionbank.answer3;
                    else if (item.correctanswer == "4")
                        item.correctanswer_description = mcq_questionbank.answer4;
                    lst.Add(Convert.ToInt32(mcq_questionbank.marks));
                }
                if (item.questiontype == 2)
                {
                    var truefalse_questionbank = db.ec_truefalse_question_master.Where(x => x.id== item.questiontype_id).FirstOrDefault();
                    item.question = truefalse_questionbank.question;
                    item.correctanswer = truefalse_questionbank.correctanswer.ToString();
                    item.questionfinalmarks = truefalse_questionbank.marks;
                    //totalmarksvalidation = truefalse_questionbank.maximum_marks;
                    item.applicantanswer = item.anshwesheetpath;
                    if (item.applicantanswer == item.correctanswer)
                    {
                        item.correct = "correct";
                        item.questionmarks = truefalse_questionbank.marks;
                    }
                    else
                    {
                        item.incorrect = "incorrect";
                        item.questionmarks = "0";
                    }
                    if (item.applicantanswer == "answer1")
                        item.applicantanswer_description = truefalse_questionbank.answer1;
                    else if (item.applicantanswer == "answer2")
                        item.applicantanswer_description = truefalse_questionbank.answer2;

                    if (item.correctanswer == "1")
                        item.correctanswer_description = truefalse_questionbank.answer1;
                    else if (item.correctanswer == "2")
                        item.correctanswer_description = truefalse_questionbank.answer2;
                    lst.Add(Convert.ToInt32(truefalse_questionbank.marks));
                }
                if (item.questiontype == 3)
                {
                    var openanswer_questionbank = db.ec_openquestion_master.Where(x => x.id== item.questiontype_id).FirstOrDefault();
                    item.question = openanswer_questionbank.question;
                    item.correctanswer = openanswer_questionbank.correctanswer;
                    item.questionfinalmarks = openanswer_questionbank.marks;
                    item.openasnwernotetype = openanswer_questionbank.questiontype == 1 ? null : "file";
                    //item.openasnwernote = openanswer_questionbank.questiontype == 1 ? openanswer_questionbank.correctanswer : webURL + "Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + openanswer_questionbank.examinerid + "/" + openanswer_questionbank.answer; ;
                    //totalmarksvalidation = openanswer_questionbank.marks;
                    item.applicantanswer_description = item.anshwesheetpath;
                    item.correctansfileFlag = "file";
                    item.ifopenasnwer = "yes";
                    lst.Add(Convert.ToInt32(openanswer_questionbank.marks));
                }
                if (item.questiontype == 4)
                {
                    var downloadsheet_questionbank = db.ec_uploadanswer_master.Where(x => x.questionid == item.questiontype_id).FirstOrDefault();
                    
                    item.question = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid + "/" + downloadsheet_questionbank.questionpath;
                    item.question_extrasheet = downloadsheet_questionbank.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid + "/ExtraSheet/" + downloadsheet_questionbank.extrasheetpath;
                    item.question_extrafile = downloadsheet_questionbank.extrafilepath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid + "/AnyFile/" + downloadsheet_questionbank.extrafilepath;

                    //item.correctanswer = downloadsheet_questionbank.;
                    item.questionfinalmarks = downloadsheet_questionbank.marks;
                    //totalmarksvalidation = downloadsheet_questionbank.marks;
                    item.correctansfileFlag = "file";
                    item.applicantanswer = webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + item.universityid + "/" + item.studentid + "/"+assignId+"/" + item.anshwesheetpath;

                    item.applicantanswer_extrafile = webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + assignId + "/" + item.anshwesheetpath;

                    item.applicantanswer_extrafile = item.applicantanswer_exttrasheets == null ? null : webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + assignId + "/extrasheet/" + item.applicantanswer_exttrasheets;
                    item.ifdownloadquestiontype = "yes";
                    lst.Add(Convert.ToInt32(downloadsheet_questionbank.marks));
                }
                lblquestionfinalmarks = item.questionfinalmarks;
            }

            questionList.DataSource = take1question;
            questionList.DataBind();

            ViewState["answeredpapersheetscount"] = Convert.ToInt32(ViewState["answeredpapersheetscount"]) + 1;
            Session["allQuestions"] = papersheet;

        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    public class Record
    {
        public int? questiontype { get; set; }
        public int? questionid { get; set; }
        public int marks { get; set; }
        public int exampapers_masterID { get; set; }

    }
    public int BindTotalMarks_buildtype(int? examid)
    {
        int total_marks = 0;
        try
        {

            List<int> lst = new List<int>();

            var totalmarks = (from em in db.ec_assignment_papers_master
                              where em.assignmentid == assignmentId
                              select new Record()
                              {
                                  questiontype = em.question_typeid,
                                  questionid = em.selected_questionId,
                                  marks = 0,
                                  exampapers_masterID = em.id,
                              }).ToList();

            foreach (var item in totalmarks)
            {
                if (item.questiontype == 1)
                {
                    var mcqdata = db.ec_mcq_question_master.Where(x => x.id == item.questionid).FirstOrDefault();
                    lst.Add(Convert.ToInt32(mcqdata.marks));
                }
                if (item.questiontype == 2)
                {
                    var truefalsedata = db.ec_truefalse_question_master.Where(x => x.id == item.questionid).FirstOrDefault();
                    lst.Add(Convert.ToInt32(truefalsedata.marks));
                }
                if (item.questiontype == 3)
                {
                    var openanswerdata = db.ec_openquestion_master.Where(x => x.id == item.questionid).FirstOrDefault();
                    lst.Add(Convert.ToInt32(openanswerdata.marks));
                }
                if (item.questiontype == 4)
                {
                    var uploadanswerdata = db.ec_uploadanswer_master.Where(x => x.questionid == item.questionid).FirstOrDefault();
                    lst.Add(Convert.ToInt32(uploadanswerdata.marks));
                }
                item.marks = lst.Sum();

            }
            lblExamfinalmarks = lst.Sum();
            total_marks = lst.Sum();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        return total_marks;
    }

    public class data
    {
        public int id { get; set; }
        public string build_assignment_URL { get; set; }
        public string checkedfile_path_by_admin { get; set; }
        public int? assessment_type { get; set; }
        public int? assignment_id { get; set; }
        public int? marks_total { get; set; }
        public int? marks_obtained { get; set; }
        public string toshow_txtmarks { get; set; }
        public string toshow_lblmarks { get; set; }
        public int? isresultDeclared { get; set; }
        public int applicantid { get; set; }
        public string toshow { get; set; }
        public int answersheetid { get; set; }
        public string studentname { get; set; }
        public string submissionstatus { get; set; }
        public string checkedstatus { get; set; }
        public int? statusId { get; set; }
        public int? is_assignment_checked { get; set; }
        public string student_assignment_URL { get; set; }
        public string checkedsheet { get; set; }
        public string is_checked { get; set; }
        public string timezone { get; set; }
        public DateTime? result_date { get; set; }
        public DateTime? result_date_utc { get; set; }
    }
}