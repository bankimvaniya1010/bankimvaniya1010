using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_result : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int applicantID = 0;
    string webURL = String.Empty;
    protected static List<faq> allfaqQuestion = new List<faq>();
    Common objCom = new Common();
    public int UniversityID = -1;
    int examid = 0;
    DateTime assignDate;
    public List<Details> chekedlist = new List<Details>();
    public int? uploadtype;
    List<int?> lstofIDsTobeRemoved = new List<int?>();
    List<int?> lstofQuestionIdToBeShow = new List<int?>();
    List<int?> lsttemp = new List<int?>();
    public string examname;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        applicantID = Convert.ToInt32(Session["UserID"].ToString());

        if ((Request.QueryString["examid"] == null) || (Request.QueryString["examid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            examid = Convert.ToInt32(Request.QueryString["examid"]);

        if ((Request.QueryString["assignDate"] == null) || (Request.QueryString["assignDate"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignDate = Convert.ToDateTime(Request.QueryString["assignDate"]);

        if (!IsPostBack)
        {           
            showdetails(examid, assignDate);
        }

    }
    
    public class Details{
        public int exampapersheetid { get; set; }
        public string checkedsheet { get; set; }
        public string comments { get; set; }
        public int? marks { get; set; }
        public int answesheetid { get; set; }
}

    public class Record
    {
        public string questiontype { get; set; }
        public int? questionid { get; set; }
        public int marks { get; set; }
        public int exampapers_masterID { get; set; }
    }

    private void showdetails(int examid , DateTime assigndate)
    {
        try {
            
            var examobtainmarks = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == applicantID && x.universityid == UniversityID && x.examid == examid && x.examdate_time == assigndate).FirstOrDefault();
            var exammarks = db.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == examid).FirstOrDefault();
            examname = exammarks.exam_name;
            if (exammarks != null)
            {
                lblmarksobtain.InnerText = examobtainmarks.finalmarks;
                //lbltotalmarks.InnerText = exammarks.totalmarks;

                uploadtype = exammarks.uploadtype;
                if (exammarks.uploadtype == 1 || exammarks.uploadtype == 3) {
                    lbltotalmarks.InnerText = exammarks.maximummarks;
                    DivType1.Attributes.Add("style", "display:block;");
                    if (exammarks.uploadtype == 1)
                    {
                        chekedlist = (from exm in db.exampapers_master
                                      where exm.universityID == UniversityID && exm.exampapersid == examid
                                      select new Details()
                                      {
                                          exampapersheetid = exm.id,
                                          checkedsheet = null,//em.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + UniversityID + "/" + applicantID + "/" + examid + "/" + em.answersheetid + "/" + em.checked_answersheetPath,
                                          comments = null,//string.IsNullOrEmpty(em.checker_comments) ? null : em.checker_comments,
                                          marks = null,//em.perquestion_marks == null ? null : em.perquestion_marks,
                                      }).ToList();

                        foreach (var item in chekedlist)
                        {
                            var answerdsheetData = db.exam_answersheet.Where(x => x.exampapersheetID == item.exampapersheetid && x.applicantid == applicantID && x.universityID == UniversityID && x.exampaperid == examid && x.exam_datetime == assigndate).FirstOrDefault();
                            if (answerdsheetData != null)
                            {
                                var checkedsheetsData = db.exam_marking_master.Where(x => x.answersheetid == answerdsheetData.answesheetid && x.applicantid == applicantID && x.universityid == UniversityID && x.examid == examid && x.examdatetime == assigndate).FirstOrDefault();
                                if (checkedsheetsData != null)
                                {
                                    item.checkedsheet = checkedsheetsData.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + UniversityID + "/" + applicantID + "/" + examid + "/" + checkedsheetsData.answersheetid + "/" + checkedsheetsData.checked_answersheetPath;
                                    item.comments = string.IsNullOrEmpty(checkedsheetsData.checker_comments) ? null : checkedsheetsData.checker_comments;
                                    item.marks = checkedsheetsData.perquestion_marks == null ? null : checkedsheetsData.perquestion_marks;
                                }
                            }
                        }
                    }
                    else if (exammarks.uploadtype == 3)
                    {
                        chekedlist = (from ean in db.exam_answersheet
                                      //join an in db.exam_answersheet on exm.exampapersid equals examid into exmData
                                      //from x2 in exmData.Where(x=>x.exam_datetime == assignDate).DefaultIfEmpty()
                                      join em in db.exam_marking_master on ean.answesheetid equals em.answersheetid
                                      where ean.universityID == UniversityID && ean.exampaperid == examid && ean.exampaperid == examid && ean.exam_datetime == assigndate && ean.applicantid == applicantID
                                      select new Details()
                                      {
                                          //exampapersheetid = ean.exampaperid,
                                          checkedsheet = em.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + UniversityID + "/" + applicantID + "/" + examid + "/" + em.answersheetid + "/" + em.checked_answersheetPath,
                                          comments = string.IsNullOrEmpty(em.checker_comments) ? null : em.checker_comments,
                                          marks = em.perquestion_marks == null ? null : em.perquestion_marks,
                                          //answesheetid = x2.answesheetid,
                                      }).ToList();

                        //foreach (var item in chekedlist)
                        //{

                        //    var checkedsheetsData = db.exam_marking_master.Where(x => x.answersheetid == item.answesheetid && x.applicantid == applicantID && x.universityid == UniversityID && x.examid == examid && x.examdatetime == assigndate).FirstOrDefault();
                        //    if (checkedsheetsData != null)
                        //    {
                        //        item.checkedsheet = checkedsheetsData.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + UniversityID + "/" + applicantID + "/" + examid + "/" + checkedsheetsData.answersheetid + "/" + checkedsheetsData.checked_answersheetPath;
                        //        item.comments = string.IsNullOrEmpty(checkedsheetsData.checker_comments) ? null : checkedsheetsData.checker_comments;
                        //        item.marks = checkedsheetsData.perquestion_marks == null ? null : checkedsheetsData.perquestion_marks;
                        //    }
                        //}
                    }
                    else if (exammarks.uploadtype == 2) //build
                    {
                        List<int> lst = new List<int>();

                        var totalmarks = (from em in db.exampapers_master
                                          where em.exampapersid == examid
                                          select new Record()
                                          {
                                              questiontype = em.questiontype,
                                              questionid = em.questionId,
                                              marks = 0,
                                              exampapers_masterID = em.id,
                                          }).ToList();

                        foreach (var item in totalmarks)
                        {
                            lstofQuestionIdToBeShow.Add(item.exampapers_masterID);
                            if (item.questiontype == "MCQ")
                            {
                                var mcqdata = db.exam_mcq_questionmaster.Where(x => x.questionID == item.questionid).FirstOrDefault();
                                lst.Add(Convert.ToInt32(mcqdata.maximummarks));
                            }
                            if (item.questiontype == "True/False")
                            {
                                var truefalsedata = db.exam_truefalse_questionmaster.Where(x => x.questionId == item.questionid).FirstOrDefault();
                                lst.Add(Convert.ToInt32(truefalsedata.maximum_marks));
                            }
                            if (item.questiontype == "Open Answer")
                            {
                                var openanswerdata = db.exam_openanswer_master.Where(x => x.questionid == item.questionid).FirstOrDefault();
                                lst.Add(Convert.ToInt32(openanswerdata.marks));
                            }
                            if (item.questiontype == "Upload Answer")
                            {
                                var uploadanswerdata = db.exam_uploadanswer_master.Where(x => x.questionid == item.questionid).FirstOrDefault();
                                lst.Add(Convert.ToInt32(uploadanswerdata.marks));
                            }
                            item.marks = lst.Sum();

                        }
                        lbltotalmarks.InnerText = lst.Sum().ToString();
                        // to show onebyone 
                        ViewState["MainList"] = lstofQuestionIdToBeShow;

                        DivType2.Attributes.Add("style", "display:block;");

                        int? bindid = 0;
                        if (lstofIDsTobeRemoved.Count == 0)
                        {
                            bindid = lstofQuestionIdToBeShow.First();
                        }
                        else
                        {
                            List<int?> temp_newlist = new List<int?>();
                            temp_newlist = (List<int?>)(ViewState["NewList"]);
                            if (temp_newlist != null)
                            {
                                if (temp_newlist.Count != 0)
                                {

                                    ViewState["MainList"] = ViewState["NewList"];
                                    bindid = temp_newlist.First();
                                    if (temp_newlist.Count == 1)
                                        button.Attributes.Add("style", "display:none");
                                }
                                else
                                    button.Attributes.Add("style", "display:none");
                            }
                        }
                        bindDataList(bindid, UniversityID, applicantID, examid, assigndate);

                    }

                    }         
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindDataList(int? bindId, int universityid, int studentid, int exampaperid, DateTime examdatetime)
    {
        try
        {
            var allanswerpapers = (from ea in db.exam_answersheet
                                   join em in db.exampapers_master on ea.exampapersheetID equals em.id
                                   join exammaster in db.exam_marking_master on ea.answesheetid equals exammaster.answersheetid
                                   where em.id == bindId
                                   select new details()
                                   {
                                       lblbindId = bindId,
                                       universityid = ea.universityID,
                                       exampaperid = exampaperid,
                                       studentid = studentid,
                                       examdatetime = examdatetime,
                                       exampapersheetID = ea.exampapersheetID,
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
                                       questiontype = em.questiontype,
                                       questiontype_id = em.questionId,
                                       correctansfileFlag = null,
                                       ifdownloadquestiontype = null,
                                       question_extrasheet = null,
                                       question_extrafile = null,
                                       applicantanswer_extrafile = null,
                                       openasnwernote = null,
                                       openasnwernotetype = null,
                                       ifopenasnwer = null,
                                       comments = string.IsNullOrEmpty(exammaster.checker_comments)? "-": exammaster.checker_comments,
                                       perquestionmarks = exammaster.perquestion_marks,
                                       checkedsheetpath = exammaster.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + universityid + "/" + studentid + "/" + exampaperid + "/" + ea.answesheetid+"/"+exammaster.checked_answersheetPath,
        }).ToList();

            var take1question = allanswerpapers.Take(1);
            foreach (var item in take1question)
            {
               //questiontype = item.questiontype;
                if (item.questiontype == "MCQ")
                {
                    var mcq_questionbank = db.exam_mcq_questionmaster.Where(x => x.questionID == item.questiontype_id).FirstOrDefault();
                    item.question = mcq_questionbank.question;
                    item.correctanswer = mcq_questionbank.correctanswer;
                    item.questionfinalmarks = mcq_questionbank.maximummarks;
                    //totalmarksvalidation = mcq_questionbank.maximummarks;
                    item.applicantanswer = item.anshwesheetpath;
                    if (item.applicantanswer == item.correctanswer)
                    {
                        item.correct = "correct";
                        item.questionmarks = mcq_questionbank.maximummarks;
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

                    if (item.correctanswer == "answer1")
                        item.correctanswer_description = mcq_questionbank.answer1;
                    else if (item.correctanswer == "answer2")
                        item.correctanswer_description = mcq_questionbank.answer2;
                    else if (item.correctanswer == "answer3")
                        item.correctanswer_description = mcq_questionbank.answer3;
                    else if (item.correctanswer == "answer4")
                        item.correctanswer_description = mcq_questionbank.answer4;

                }
                if (item.questiontype == "True/False")
                {
                    var truefalse_questionbank = db.exam_truefalse_questionmaster.Where(x => x.questionId == item.questiontype_id).FirstOrDefault();
                    item.question = truefalse_questionbank.question;
                    item.correctanswer = truefalse_questionbank.correct_answer;
                    item.questionfinalmarks = truefalse_questionbank.maximum_marks;
                    //totalmarksvalidation = truefalse_questionbank.maximum_marks;
                    item.applicantanswer = item.anshwesheetpath;
                    if (item.applicantanswer == item.correctanswer)
                    {
                        item.correct = "correct";
                        item.questionmarks = truefalse_questionbank.maximum_marks;
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

                    if (item.correctanswer == "answer1")
                        item.correctanswer_description = truefalse_questionbank.answer1;
                    else if (item.correctanswer == "answer2")
                        item.correctanswer_description = truefalse_questionbank.answer2;
                }
                if (item.questiontype == "Open Answer")
                {
                    var openanswer_questionbank = db.exam_openanswer_master.Where(x => x.questionid == item.questiontype_id).FirstOrDefault();
                    item.question = openanswer_questionbank.question;
                    item.correctanswer = webURL + "Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + openanswer_questionbank.examinerid + "/evaluationfile/" + openanswer_questionbank.checking_file;
                    item.questionfinalmarks = openanswer_questionbank.marks;
                    item.openasnwernotetype = openanswer_questionbank.type == 1 ? null : "file";
                    item.openasnwernote = openanswer_questionbank.type == 1 ? openanswer_questionbank.answer : webURL + "Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + openanswer_questionbank.examinerid + "/" + openanswer_questionbank.answer; ;
                    //totalmarksvalidation = openanswer_questionbank.marks;
                    item.applicantanswer_description = item.anshwesheetpath;
                    item.correctansfileFlag = "file";
                    item.ifopenasnwer = "yes";
                }
                if (item.questiontype == "Upload Answer")
                {
                    var downloadsheet_questionbank = db.exam_uploadanswer_master.Where(x => x.questionid == item.questiontype_id).FirstOrDefault();
                    item.question = webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/" + downloadsheet_questionbank.questionpath;
                    item.question_extrasheet = downloadsheet_questionbank.extrasheetpath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/ExtraSheet/" + downloadsheet_questionbank.extrasheetpath;
                    item.question_extrafile = downloadsheet_questionbank.extrafilepath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/AnyFile/" + downloadsheet_questionbank.extrafilepath;
                    item.correctanswer = webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/evalutionfile/" + downloadsheet_questionbank.checking_file;
                    item.questionfinalmarks = downloadsheet_questionbank.marks;
                    //totalmarksvalidation = downloadsheet_questionbank.marks;
                    item.correctansfileFlag = "file";
                    item.applicantanswer = webURL + "Docs/Exammodule/AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + item.exampaperid + "/" + item.exampapersheetID + "/" + item.anshwesheetpath;
                    item.applicantanswer_extrafile = item.applicantanswer_exttrasheets == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + item.exampaperid + "/" + item.exampapersheetID + "/extrasheet/" + item.applicantanswer_exttrasheets;
                    item.ifdownloadquestiontype = "yes";
                }
            }
            
            questionList.DataSource = take1question.Take(1);
            questionList.DataBind();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    public class details
    {
        public int? lblbindId { get; set; }
        public int answesheetid { get; set; }
        public int? universityid { get; set; }
        public int? exampaperid { get; set; }
        public DateTime examdatetime { get; set; }
        public string question { get; set; }
        public string anshwesheetpath { get; set; }
        public string applicantanswer { get; set; }
        public string applicantanswer_description { get; set; }
        public string applicantanswer_exttrasheets { get; set; }
        public string correctanswer { get; set; }
        public string correctanswer_description { get; set; }
        public string questionmarks { get; set; }
        public string questionfinalmarks { get; set; }
        public string questiontype { get; set; }
        public int? questiontype_id { get; set; }
        public string correct { get; set; }
        public string incorrect { get; set; }
        public string correctansfileFlag { get; set; }
        public string ifdownloadquestiontype { get; set; }
        public string question_extrasheet { get; set; }
        public string question_extrafile { get; set; }
        public int studentid { get; set; }
        public int? exampapersheetID { get; set; }
        public string applicantanswer_extrafile { get; set; }
        public string openasnwernote { get; set; }
        public string openasnwernotetype { get; set; }
        public string ifopenasnwer { get; set; }
        public string comments { get; set; }
        public int? perquestionmarks { get; set; }
    public string checkedsheetpath { get; set; }
}

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try {
            int id = 0;
            foreach (DataListItem item in questionList.Items)
            {
                Label lblbindId = (Label)item.FindControl("lblbindId");
                int bindId = Convert.ToInt32(lblbindId.Text);
                id = bindId;
            }

            List<int?> tem_mainlist = new List<int?>();
            tem_mainlist = (List<int?>)(ViewState["MainList"]);

            tem_mainlist.Remove(id);
            lstofIDsTobeRemoved.Add(id);
            ViewState["NewList"] = tem_mainlist;

            showdetails(examid, assignDate);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}
