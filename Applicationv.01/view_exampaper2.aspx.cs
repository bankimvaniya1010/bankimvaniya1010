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
public partial class view_exampaper2 : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    public static int QuestionsCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    string webURL = String.Empty;
    int UniversityID = -1;
    public int exampaperid = 0, assignID;
    DateTime assignDate;
    public int allpapersCount, allpapersheetscount;
    public string exammarks;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public DateTime examdate_time;
    public int exampaper_id;
    protected string MCQ = "", TrueFalse = "", openanswer = "", uploadanswer = "", openanswertype="";
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
        if ((Request.QueryString["assignID"] == null) || (Request.QueryString["assignID"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignID = Convert.ToInt32(Request.QueryString["assignID"].ToString());
       
        var data = db.exam_assign.Where(x => x.assignid == assignID).Select(x => new { x.exampapersid, x.exam_datetime,x.status }).FirstOrDefault();
        if (data != null)
        {
            exampaperid = Convert.ToInt32(data.exampapersid);
            assignDate = Convert.ToDateTime(data.exam_datetime);
            examdatetime = assignDate;
        }

        var exammaster = db.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == exampaperid).FirstOrDefault();

        exammarks = exammaster.maximummarks;
        
        //exam_buildpaper_answersheetmasterd
        var answeredpapersheets = db.exam_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampaperid == exampaperid && x.exam_datetime == assignDate).ToList();
        var allpapersheets = db.exampapers_master.Where(y => y.exampapersid == exampaperid).ToList();// acc setting fixed or random

        if(exammaster.basic_setting == 2)// basic setting to random
            allpapersheets = Randomize(allpapersheets);

        allpapersheetscount = allpapersheets.Count;

        if (!IsPostBack)
        {
            allQuestions = objCommon.FaqQuestionList();
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
                if (string.IsNullOrEmpty(data.status))
                    SetQuestionList(answeredpapersheets);
                else
                {
                    completedDiv.Visible = true;
                    completedDiv.Style.Remove("display");
                    questions.Visible = false;
                    if (data.status == "Completed")
                        lblCompleted.Text = "YOUR ANSWER SHEETS HAVE BEEN SUBMITTED SUCCESSFULLY. ";
                    else if (data.status == "Expired")
                        lblCompleted.Text = "ASSESSMENT TIME EXHAUSTED.";
                    else if (data.status == "Disqualified")
                        lblCompleted.Text = "YOUR ASSESSMENT HAS BEEN DISQUALIFY BY INVIGILATOR.";
                    else if (data.status == "Not Appered")
                        lblCompleted.Text = "YOU HAVE LEFT THE ASSESSMENT.";
                    if (data.status == "Disqualified")
                        lblCompleted.Text = "Your assessment has been disqualify by invigilator.";
                }

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

    private void SetQuestionList(List<exam_answersheet> allResponseList)
    {
        try
        {
            var papersheet = (List<exampapers_master>)Session["allpapersheets"];
            if (allResponseList.Count > 0)
            {
                foreach (var response in allResponseList)
                {
                    papersheet.RemoveAll(x => x.id == response.exampapersheetID);
                }
            }
            Session["papersheet"] = papersheet;
            bindDataList();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    public class details {
        public int id { get; set; }
        public int? questionpaperID { get; set; }
        public string questiontype { get; set; }
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
            var papersheet = (List<exampapers_master>)Session["papersheet"];
            int papersheetId = papersheet.ElementAt(0).id;

            var allpapers = (from em in db.exampapers_master
                             where em.universityID == UniversityID && em.exampapersid == exampaperid && em.id == papersheetId
                             select new details()
                             {
                                 id = em.id,
                                 questionpaperID = em.exampapersid,
                                 questiontype = em.questiontype,
                                 questionId = em.questionId,
                                 universityid = em.universityID,
                                 examinerid = em.examinerid,
                                 question = null,
                                 answer1 = null,
                                 answer2 = null,
                                 answer3 = null,
                                 answer4 = null,
                                 openanswer_type = null,
                                 marks = null,
                                 duration = null,
                                 upload_extrasheetpath=null,
                                 upload_filepath =null,
                                 upload_fileinstruction =null,
                                 upload_questionpath = null,
                                 onetimeshow = em.is_audiovideofile_onetimeview == null ? 0 : 1,
                                 audiovideofilename = em.audiovideofilepath == null ? null : em.audiovideofilepath,
                                 iffile_isaudio_orvideo = null,
                             }).ToList();
          
            var take1question = allpapers.Take(1);
            foreach (var item in take1question)
            {
                if (item.questiontype == "MCQ")
                {
                    var mcq_questionbank = db.exam_mcq_questionmaster.Where(x => x.questionID == item.questionId).FirstOrDefault();
                    item.question = mcq_questionbank.question;
                    item.answer1 = mcq_questionbank.answer1;
                    item.answer2 = mcq_questionbank.answer2;
                    item.answer3 = mcq_questionbank.answer3;
                    item.answer4 = mcq_questionbank.answer4;
                    item.marks = mcq_questionbank.maximummarks;
                    item.duration = mcq_questionbank.duration;
                    MCQ = "MCQ";
                    if(string.IsNullOrEmpty(mcq_questionbank.duration))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = mcq_questionbank.duration;
                }
                if (item.questiontype == "True/False")
                {
                    var truefalse_questionbank = db.exam_truefalse_questionmaster.Where(x => x.questionId == item.questionId).FirstOrDefault();
                    item.question = truefalse_questionbank.question;
                    item.answer1 = truefalse_questionbank.answer1;
                    item.answer2 = truefalse_questionbank.answer2;
                    item.marks = truefalse_questionbank.maximum_marks;
                    item.duration = truefalse_questionbank.duration;
                    TrueFalse = "TrueFalse";
                    if (string.IsNullOrEmpty(truefalse_questionbank.duration))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = truefalse_questionbank.duration;
                }
                if (item.questiontype == "Open Answer") {
                    var openanswer_questionbank = db.exam_openanswer_master.Where(x => x.questionid == item.questionId).FirstOrDefault();
                    item.question = openanswer_questionbank.question;
                    item.openanswer_type = openanswer_questionbank.type == 1 ? "Text": openanswer_questionbank.type == 2? "Image": openanswer_questionbank.type== 3?"Audio": openanswer_questionbank.type==4?"Video":null;
                    item.marks = openanswer_questionbank.marks;
                    item.duration = openanswer_questionbank.duration;
                    if(item.openanswer_type == "Text")
                        item.answer1 = openanswer_questionbank.answer;
                    else
                        item.answer1 = webURL + "Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + item.examinerid+"/"+openanswer_questionbank.answer;
                    item.openanswertype = item.openanswer_type == "Text"? null : item.openanswer_type;
                    openanswer = "openanswer";
                    if (string.IsNullOrEmpty(openanswer_questionbank.duration))
                        Session["totalResponseTime"] = null;
                    else
                        Session["totalResponseTime"] = openanswer_questionbank.duration;
                }
                if (item.questiontype == "Upload Answer") {
                    var downloadsheet_questionbank = db.exam_uploadanswer_master.Where(x => x.questionid == item.questionId).FirstOrDefault();
                    item.upload_fileinstruction = downloadsheet_questionbank.fileinstruction== null ? null : downloadsheet_questionbank.fileinstruction;
                    item.upload_questionpath = webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + item.examinerid+"/"+ downloadsheet_questionbank.questionpath;
                    item.upload_extrasheetpath = downloadsheet_questionbank.extrasheetpath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + item.examinerid + "/ExtraSheet/" + downloadsheet_questionbank.extrasheetpath;
                    item.upload_filepath = downloadsheet_questionbank.extrafilepath == null ? null: webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + item.examinerid + "/AnyFile/" + downloadsheet_questionbank.extrafilepath;
                    item.marks = downloadsheet_questionbank.marks;
                    item.duration = downloadsheet_questionbank.duration;

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

    private void SaveAnswer(int studentid, int universityid, int examid, int exampapersheetid, DateTime examdate_time,string answer, string extrasheetpath) {
        try {
            exam_answersheet objmapping = new exam_answersheet();
            var mode = "new";
            var data = db.exam_answersheet.Where(x => x.applicantid == studentid && x.universityID == universityid && x.exampaperid == examid && x.exampapersheetID == exampapersheetid && x.exam_datetime == examdate_time).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = studentid;
            objmapping.universityID = universityid;
            objmapping.exampaperid = examid;
            objmapping.exampapersheetID = exampapersheetid;
            objmapping.exam_datetime = examdate_time;
            objmapping.anshwesheetpath = answer;
            if (!string.IsNullOrEmpty(extrasheetpath))
                objmapping.extra_anshwesheetpath = extrasheetpath;
            if (mode == "new")
                db.exam_answersheet.Add(objmapping);
            db.SaveChanges();

            //change status in exam_assign table
            var mode1 = "new";
            exam_assign objexam_assign = new exam_assign();
            var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

            if (examassign != null)
            {
                mode1 = "update";
                objexam_assign = examassign;
            }
            objexam_assign.status = "Completed";
            if (mode1 == "new")
                db.exam_assign.Add(objexam_assign);
            db.SaveChanges();

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var papersheet = (List<exampapers_master>)Session["papersheet"];

            exam_answersheet objexam_answersheet = new exam_answersheet();

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
                if (question_type == "MCQ")
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
                else if (question_type == "True/False")
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
                else if (question_type == "Open Answer")
                {
                    TextBox txtopenanswer = (TextBox)item.FindControl("txtopenanswer");
                    string answer = txtopenanswer.Text;
                    SaveAnswer(UserID, UniversityID, exampaperid, exampapersheetID, assignDate, answer, string.Empty);
                }
                else if (question_type == "Upload Answer")
                {
                    docPath = docPath + "/Exammodule/AnswerSheet/" + UniversityID + "/"+UserID+"/" + exampaperid + "/" + exampapersheetID;
                    FileUpload answersheetfile = (FileUpload)item.FindControl("ansersheet");
                    FileUpload extraasnwersheet = (FileUpload)item.FindControl("extraasnwersheet");
                    if (answersheetfile.HasFile)
                    {
                        string path = docPath+"/";
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
                var mode = "new";
                exam_assign objexam_assign = new exam_assign();
                var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

                if (examassign != null)
                {
                    mode = "update";
                    objexam_assign = examassign;
                }
                objexam_assign.status = "Completed";
                if (mode == "new")
                    db.exam_assign.Add(objexam_assign);
                db.SaveChanges();

                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "Thank you for answering all papersheet.";
                Session["totalResponseTime"] = null;
                //Session.Remove("totalResponseTime");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering .');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void disqualifiedbtn_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            exam_assign objexam_assign = new exam_assign();
            var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

            if (examassign != null)
            {
                mode = "update";
                objexam_assign = examassign;
            }
            objexam_assign.status = "Disqualified";
            if (mode == "new")
                db.exam_assign.Add(objexam_assign);
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Your Assessmnent have been disqualified');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Saveresponse(int assignID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var mode = "new";
        exam_assign objexam_assign = new exam_assign();
        var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();

        if (data != null)
        {
            mode = "update";
            objexam_assign = data;
        }
        if (objexam_assign.status == null)
            objexam_assign.status = "Not Appered";
        if (mode == "new")
            db1.exam_assign.Add(objexam_assign);
        db1.SaveChanges();
        return JsonConvert.SerializeObject(assignID);
    }

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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string isanswersubmitted(int assignID)
    {
        string response = string.Empty;
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        if (string.IsNullOrEmpty(data.status))
            response = "NOresponsesubmitted";
        else if (data.status == "Disqualified")
            response = "Disqualified";
        else
            response = "responsesubmitted";

        return JsonConvert.SerializeObject(response);
    }
}