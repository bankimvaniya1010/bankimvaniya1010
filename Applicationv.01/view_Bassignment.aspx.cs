using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class view_Bassignment : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    public static int QuestionsCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    string webURL = String.Empty;
    int UniversityID = -1;
    public int? assignmentid = 0, assignschedule_id,assignId;
    DateTime assignDate;
    public int allpapersCount, allpapersheetscount;
    public string exammarks;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public DateTime examdate_time;
    public int exampaper_id;
    protected string MCQ = "", TrueFalse = "", openanswer = "", uploadanswer = "", openanswertype = "";
    protected static List<faq> allQuestions = new List<faq>();
    public int is_onetimeshow = 0, examsheetid, examid;
    public DateTime examdatetime;
    public string isaudio_orvideo;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if ((Request.QueryString["assignId"] == null) || (Request.QueryString["assignId"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignId = Convert.ToInt32(Request.QueryString["assignId"].ToString());

        var info = db.ec_assignments_assign.Where(x => x.assignId == assignId).FirstOrDefault();

        assignmentid = info.assignmentId;
        assignschedule_id = info.assignschedule_Id;
        //if ((Request.QueryString["assignDate"] == null) || (Request.QueryString["assignDate"].ToString() == ""))
        //{
        //    Response.Redirect(webURL + "default.aspx", true);
        //}
        //else
        //    assignDate = Convert.ToDateTime(Request.QueryString["assignDate"].ToString());

        var assignmentdata = db.ec_assignment_master.Where(x => x.universityid == UniversityID && x.id == assignmentid).FirstOrDefault();
        
        //exam_buildpaper_answersheetmasterd
        var answeredpapersheets = db.ec_assignment_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.assignmentid== assignmentid && x.assignID== assignId).ToList();
        var allpapersheets = db.ec_assignment_papers_master.Where(y => y.assignmentid == assignmentid).ToList();// acc setting fixed or random

        if (assignmentdata.question_order_settings == 2)// basic setting to random
            allpapersheets = Randomize(allpapersheets);

        allpapersheetscount = allpapersheets.Count;

        if (!IsPostBack)
        {
            ViewState["answeredpapersheetscount"] = answeredpapersheets.Count;
            Session["allpapersheets"] = allpapersheets;

            //if (answeredpapersheets.Count > 0)
            //    Session["totalResponseTime"] = answeredpapersheets.Min(x => x.response_time);

            if (answeredpapersheets.Count == allpapersheets.Count)
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "You have answered all question.";
            }
            else
            {
                SetQuestionList(answeredpapersheets);
                //if (string.IsNullOrEmpty(data.status) || data.status == "Verified" || data.status == "Assessment Started")
                //    SetQuestionList(answeredpapersheets);
                //else
                //{
                //    completedDiv.Visible = true;
                //    completedDiv.Style.Remove("display");
                //    questions.Visible = false;
                //    if (data.status == "Completed")
                //        lblCompleted.Text = "YOUR ANSWER SHEETS HAVE BEEN SUBMITTED SUCCESSFULLY. ";
                //    else if (data.status == "Expired")
                //        lblCompleted.Text = "ASSESSMENT TIME EXHAUSTED.";
                //    else if (data.status == "Disqualified")
                //        lblCompleted.Text = "YOUR ASSESSMENT HAS BEEN DISQUALIFY BY INVIGILATOR.";
                //    else if (data.status == "Not Appered")
                //        lblCompleted.Text = "YOU HAVE LEFT THE ASSESSMENT.";
                //    if (data.status == "Disqualified")
                //        lblCompleted.Text = "Your assessment has been disqualify by invigilator.";
                //}

            }
        }
    }

    public List<T> Randomize<T>(List<T> list)
    {
        List<T> randomizedList = new List<T>();
        Random rnd = new Random();
        while (list.Count > 0)
        {
            int index = rnd.Next(0, list.Count); //pick a random item from the master list
            randomizedList.Add(list[index]); //place it at the end of the randomized list
            list.RemoveAt(index);
        }
        return randomizedList;
    }

    private void SetQuestionList(List<ec_assignment_answersheet> allResponseList)
    {
        try
        {
            var papersheet = (List<ec_assignment_papers_master>)Session["allpapersheets"];
            if (allResponseList.Count > 0)
            {
                foreach (var response in allResponseList)
                {
                    papersheet.RemoveAll(x => x.id == response.assignment_papersheetID);
                }
            }
            Session["papersheet"] = papersheet;
            bindDataList();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    public class details
    {
        public int id { get; set; }
        public int? questionpaperID { get; set; }
        public int? questiontype { get; set; }
        public int? questionId { get; set; }
        public int? universityid { get; set; }
        public int? examinerid { get; set; }
        public string question { get; set; }
        public string answer1 { get; set; }
        public string answer2 { get; set; }
        public string answer3 { get; set; }
        public string answer4 { get; set; }
        public string openanswer_type { get; set; }
        public string marks { get; set; }
        public string duration { get; set; }
        public string upload_questionpath { get; set; }
        public string upload_extrasheetpath { get; set; }
        public string upload_filepath { get; set; }
        public string upload_fileinstruction { get; set; }
        public string openanswertype { get; set; }
        public int onetimeshow { get; set; }
        public string audiovideofilename { get; set; }
        public string iffile_isaudio_orvideo { get; set; }
    }
    private void bindDataList()
    {
        try
        {
            Session["totalResponseTime"] = null;
            var papersheet = (List<ec_assignment_papers_master>)Session["papersheet"];
            int papersheetId = papersheet.ElementAt(0).id;

            var allpapers = (from em in db.ec_assignment_papers_master
                             where em.universityID == UniversityID && em.assignmentid == assignmentid && em.id == papersheetId
                             select new details()
                             {
                                 id = em.id,
                                 questionpaperID = em.assignmentid,
                                 questiontype = em.question_typeid,
                                 questionId = em.selected_questionId,
                                 universityid = em.universityID,
                                 //examinerid = em.examinerid,
                                 question = null,
                                 answer1 = null,
                                 answer2 = null,
                                 answer3 = null,
                                 answer4 = null,
                                 openanswer_type = null,
                                 marks = null,
                                 duration = null,
                                 upload_extrasheetpath = null,
                                 upload_filepath = null,
                                 upload_fileinstruction = null,
                                 upload_questionpath = null,
                                 onetimeshow = em.is_audiovideofile_onetimeview == null ? 0 : 1,
                                 audiovideofilename = em.audiovideofilepath == null ? null : em.audiovideofilepath,
                                 iffile_isaudio_orvideo = null,

                             }).ToList();

            var take1question = allpapers.Take(1);
            foreach (var item in take1question)
            {
                if (item.questiontype == 1)
                {
                    var mcq_questionbank = db.ec_mcq_question_master.Where(x => x.id == item.questionId).FirstOrDefault();
                    item.question = mcq_questionbank.question;
                    item.answer1 = mcq_questionbank.answer1;
                    item.answer2 = mcq_questionbank.answer2;
                    item.answer3 = mcq_questionbank.answer3;
                    item.answer4 = mcq_questionbank.answer4;
                    item.marks = mcq_questionbank.marks;
                    exammarks = mcq_questionbank.marks;
                    item.duration = mcq_questionbank.time;
                    MCQ = "MCQ";
                    if (string.IsNullOrEmpty(mcq_questionbank.time))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = mcq_questionbank.time;
                }
                if (item.questiontype == 2)
                {
                    var truefalse_questionbank = db.ec_truefalse_question_master.Where(x => x.id == item.questionId).FirstOrDefault();
                    item.question = truefalse_questionbank.question;
                    item.answer1 = truefalse_questionbank.answer1;
                    item.answer2 = truefalse_questionbank.answer2;
                    item.marks = truefalse_questionbank.marks;
                    item.duration = truefalse_questionbank.time;
                    TrueFalse = "TrueFalse";
                    exammarks = truefalse_questionbank.marks;
                    if (string.IsNullOrEmpty(truefalse_questionbank.time))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = truefalse_questionbank.time;
                }
                if (item.questiontype == 3)
                {
                    var openanswer_questionbank = db.ec_openquestion_master.Where(x => x.id == item.questionId).FirstOrDefault();
                    item.question = openanswer_questionbank.questionname;

                    item.openanswer_type = openanswer_questionbank.questiontype == 1 ? "Text" : openanswer_questionbank.questiontype == 2 ? "Image" : openanswer_questionbank.questiontype == 3 ? "Audio" : openanswer_questionbank.questiontype == 4 ? "Video" : null;
                    item.marks = openanswer_questionbank.marks;
                    item.duration = openanswer_questionbank.time;

                    //item.answer1 = openanswer_questionbank.correctanswer;
                    exammarks = openanswer_questionbank.marks;
                    item.openanswertype = item.openanswer_type == "Text" ? null : item.openanswer_type;


                    if (openanswer_questionbank.questiontype == 1)
                        item.answer1 = openanswer_questionbank.question;
                    else
                        item.answer1 = webURL + "Docs/Eclass_Service/QuestionBank/" + openanswer_questionbank.uploadedfile_url;


                    openanswer = "openanswer";
                    if (string.IsNullOrEmpty(openanswer_questionbank.time))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = openanswer_questionbank.time;
                }
                if (item.questiontype == 4)
                {
                    var downloadsheet_questionbank = db.ec_uploadanswer_master.Where(x => x.questionid == item.questionId).FirstOrDefault();
                    item.upload_fileinstruction = downloadsheet_questionbank.fileinstruction == null ? null : downloadsheet_questionbank.fileinstruction;
                    item.upload_questionpath = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid+ "/" + downloadsheet_questionbank.questionpath;
                    item.upload_extrasheetpath = downloadsheet_questionbank.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank .adminid+ "/ExtraSheet/" + downloadsheet_questionbank.extrasheetpath;
                    item.upload_filepath = downloadsheet_questionbank.extrafilepath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank .adminid+ "/AnyFile/" + downloadsheet_questionbank.extrafilepath;
                    item.marks = downloadsheet_questionbank.marks;
                    item.duration = downloadsheet_questionbank.duration;
                    exammarks = downloadsheet_questionbank.marks;
                    uploadanswer = "uploadanswer";
                    if (string.IsNullOrEmpty(downloadsheet_questionbank.duration))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = downloadsheet_questionbank.duration;

                    if (item.audiovideofilename != null)
                    {
                        string s = item.audiovideofilename;
                        string[] after_split = s.Split('.');
                        string extension = after_split[after_split.Length - 1].ToLower();

                        if (extension == "mp3" || extension == "3gp" || extension == "webm")
                        {
                            item.iffile_isaudio_orvideo = "audio";
                            isaudio_orvideo = "audio";
                        }
                        else
                        {
                            item.iffile_isaudio_orvideo = null;
                            isaudio_orvideo = "video";
                        }

                    }

                    var data_ifviewed = db.exam_applicantfileviewed_record.Where(x => x.examID == item.questionpaperID && x.examdatetime == examdatetime && x.exampapersheetID == item.id && x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                    if (data_ifviewed == null)
                        is_onetimeshow = item.onetimeshow;
                    else
                    {
                        is_onetimeshow = 0;
                        item.upload_filepath = null;
                    }
                    examid = Convert.ToInt32(item.questionpaperID);
                    examsheetid = item.id;
                }
            }

            allpapersCount = allpapers.Count;
            questionList.DataSource = take1question;
            questionList.DataBind();

            ViewState["answeredpapersheetscount"] = Convert.ToInt32(ViewState["answeredpapersheetscount"]) + 1;
            Session["papersheet"] = papersheet;

        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private void SaveAnswer(int studentid, int universityid, int examid, int exampapersheetid, DateTime examdate_time, string answer, string extrasheetpath)
    {
        try
        {
            ec_assignment_answersheet objmapping = new ec_assignment_answersheet();
            var mode = "new";
            var data = db.ec_assignment_answersheet.Where(x => x.applicantid == studentid && x.universityID == universityid && x.assignmentid == examid && x.assignment_papersheetID == exampapersheetid && x.assignment_start_date== examdate_time).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = studentid;
            objmapping.universityID = universityid;
            objmapping.assignID = assignId;
            objmapping.assignmentid= assignmentid;
            objmapping.assignment_papersheetID = exampapersheetid;
            objmapping.assignschedule_Id = assignschedule_id;
            //objmapping.exam_datetime = examdate_time;
            objmapping.anshwesheetpath = answer;
            objmapping.uploded_at = DateTime.UtcNow;
            if (!string.IsNullOrEmpty(extrasheetpath))
                objmapping.extra_anshwesheetpath = extrasheetpath;
            //if (mode == "new")
            //    db.ec_assignment_answersheet.Add(objmapping);
            //db.SaveChanges();
            ////save to assign
            //var mode1 = "new";
            //ec_assignments_assign objexam_assign = new ec_assignments_assign();
            //var examassign = db.ec_assignments_assign.Where(x => x.applicantId == UserID && x.universityid == UniversityID && x.assignId == assignId).FirstOrDefault();

            //if (examassign != null)
            //{
            //    mode1 = "update";
            //    objexam_assign = examassign;
            //}
            //objexam_assign.status = 5;
            //objexam_assign.Is_assignemtCompleted = 1;
            //if (mode1 == "new")
            //    db.ec_assignments_assign.Add(objexam_assign);
            //db.SaveChanges();


        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var papersheet = (List<ec_assignment_papers_master>)Session["papersheet"];

            ec_assignment_answersheet objexam_answersheet = new ec_assignment_answersheet();

            int exampaperid = 0;
            int exampapersheetID = 0;
            string question_type = null;
            foreach (DataListItem item in questionList.Items)
            {

                Label lblexampapersheetID = (Label)item.FindControl("lblexampapersheetID");
                exampapersheetID = Convert.ToInt32(lblexampapersheetID.Text);

                Label lblexampaperid = (Label)item.FindControl("lblquestionpaperID");
                exampaperid = Convert.ToInt32(lblexampaperid.Text);

                Label lblquestiontype = (Label)item.FindControl("lblquestiontype");
                question_type = lblquestiontype.Text;

                string response_time = hidTime.Value;
                if (question_type == "1")
                {
                    string Selectedanswer = "";
                    RadioButton rdAnswer1 = (RadioButton)item.FindControl("rdoans1");
                    RadioButton rdAnswer2 = (RadioButton)item.FindControl("rdoans2");
                    RadioButton rdAnswer3 = (RadioButton)item.FindControl("rdoans3");
                    RadioButton rdAnswer4 = (RadioButton)item.FindControl("rdoans4");

                    if (rdAnswer1.Checked)
                        Selectedanswer = "answer1";
                    else if (rdAnswer2.Checked)
                        Selectedanswer = "answer2";
                    else if (rdAnswer3.Checked)
                        Selectedanswer = "answer3";
                    else if (rdAnswer4.Checked)
                        Selectedanswer = "answer4";

                    SaveAnswer(UserID, UniversityID, exampaperid, exampapersheetID, assignDate, Selectedanswer, string.Empty);
                }
                else if (question_type == "2")
                {
                    string Selectedanswer = "";
                    RadioButton rdAnswer1 = (RadioButton)item.FindControl("RadioButton1");
                    RadioButton rdAnswer2 = (RadioButton)item.FindControl("RadioButton2");

                    if (rdAnswer1.Checked)
                        Selectedanswer = "answer1";
                    else if (rdAnswer2.Checked)
                        Selectedanswer = "answer2";

                    SaveAnswer(UserID, UniversityID, exampaperid, exampapersheetID, assignDate, Selectedanswer, string.Empty);
                }
                else if (question_type == "3")
                {
                    TextBox txtopenanswer = (TextBox)item.FindControl("txtopenanswer");
                    string answer = txtopenanswer.Text;
                    SaveAnswer(UserID, UniversityID, exampaperid, exampapersheetID, assignDate, answer, string.Empty);
                }
                else if (question_type == "4")
                {
                    docPath = docPath + "/Eclass_Service/Assignments_AnswerSheet/" + UniversityID + "/" + UserID + "/" + assignId + "/";
                    FileUpload answersheetfile = (FileUpload)item.FindControl("ansersheet");
                    FileUpload extraasnwersheet = (FileUpload)item.FindControl("extraasnwersheet");
                    if (answersheetfile.HasFile)
                    {
                        string path = docPath + "/";
                        string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(answersheetfile.PostedFile.FileName));
                        string filePath = string.Concat(path, fileName);
                        if (!Directory.Exists(path))
                            Directory.CreateDirectory(path);
                        answersheetfile.PostedFile.SaveAs(filePath);

                        if (extraasnwersheet.HasFile)
                        {
                            string path2 = docPath + "/extrasheet/";
                            string extrafilename = string.Concat(Guid.NewGuid(), Path.GetExtension(extraasnwersheet.PostedFile.FileName));
                            string filePath2 = string.Concat(path2, extrafilename);
                            if (!Directory.Exists(path2))
                                Directory.CreateDirectory(path2);
                            extraasnwersheet.PostedFile.SaveAs(filePath2);
                            SaveAnswer(UserID, UniversityID, exampaperid, exampapersheetID, assignDate, fileName, extrafilename);
                        }
                        else
                            SaveAnswer(UserID, UniversityID, exampaperid, exampapersheetID, assignDate, fileName, string.Empty);
                    }
                }
                papersheet.RemoveAll(x => x.id == exampapersheetID);
            }
            if (papersheet.Count > 0)
            {
                Session["papersheet"] = papersheet;
                bindDataList();
            }
            else
            {
                //if all queshtionsheets are answerd
                var mode1 = "new";
                ec_assignments_assign objexam_assign = new ec_assignments_assign();
                var examassign = db.ec_assignments_assign.Where(x => x.applicantId == UserID && x.universityid == UniversityID && x.assignId == assignId).FirstOrDefault();

                if (examassign != null)
                {
                    mode1 = "update";
                    objexam_assign = examassign;
                }
                objexam_assign.status = 2;//Submitted To Be Checked
                objexam_assign.Is_assignemtCompleted = 1;
                if (mode1 == "new")
                    db.ec_assignments_assign.Add(objexam_assign);
                db.SaveChanges();

                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "Thank you for answering all Assignment.";
                Session["totalResponseTime"] = null;
                //Session.Remove("totalResponseTime");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering .');window.location='" + Request.ApplicationPath + "ec_create_my_assignments.aspx';", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    //protected void disqualifiedbtn_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        var mode = "new";
    //        exam_assign objexam_assign = new exam_assign();
    //        var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

    //        if (examassign != null)
    //        {
    //            mode = "update";
    //            objexam_assign = examassign;
    //        }
    //        objexam_assign.status = "Disqualified";
    //        if (mode == "new")
    //            db.exam_assign.Add(objexam_assign);
    //        db.SaveChanges();
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
    //                    "alert('Your Assessmnent have been disqualified');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Saveaudiovideoresponse(int examid, int examsheetid, int is_onetimeshow, int assignID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        int userID1 = Convert.ToInt32(HttpContext.Current.Session["UserID"]);

        var mode = "new";
        exam_applicantfileviewed_record objmapping = new exam_applicantfileviewed_record();
        var examdata = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        DateTime examdatetime = Convert.ToDateTime(examdata.exam_datetime);

        var data = db1.exam_applicantfileviewed_record.Where(x => x.examID == examid && x.exampapersheetID == examsheetid && x.applicantid == userID1 && x.universityid == universityID1 && x.examdatetime == examdatetime).FirstOrDefault();

        if (data != null)
        {
            mode = "update";
            objmapping = data;
        }
        objmapping.isviewedonce = 1;
        objmapping.exampapersheetID = examsheetid;
        objmapping.examID = examid;
        objmapping.applicantid = userID1;
        objmapping.universityid = universityID1;
        objmapping.examdatetime = examdatetime;
        if (mode == "new")
            db1.exam_applicantfileviewed_record.Add(objmapping);
        db1.SaveChanges();
        return JsonConvert.SerializeObject(is_onetimeshow);
    }

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string isanswersubmitted(int assignID)
    //{
    //    string response = string.Empty;
    //    GTEEntities db1 = new GTEEntities();
    //    int universityID1 = Utility.GetUniversityId();

    //    var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
    //    if (string.IsNullOrEmpty(data.status) || data.status == "Verified" || data.status == "Assessment Started")
    //        response = "NOresponsesubmitted";
    //    else if (data.status == "Disqualified")
    //        response = "Disqualified";
    //    else
    //        response = "responsesubmitted";

    //    return JsonConvert.SerializeObject(response);
    //}
}