using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_view_result : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int applicantID = 0;
    string webURL = String.Empty;
    protected static List<faq> allfaqQuestion = new List<faq>();
    Common objCom = new Common();
    public int UniversityID = -1;
    int assignID = 0;
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

        if ((Request.QueryString["assignID"] == null) || (Request.QueryString["assignID"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignID = Convert.ToInt32(Request.QueryString["assignID"]);

        if (!IsPostBack)
        {
            showdetails(assignID);
        }

    }

    public class Details
    {
        public int exampapersheetid { get; set; }
        public string checkedsheet { get; set; }
        public string comments { get; set; }
        public int? marks { get; set; }
        public int answesheetid { get; set; }
    }

    public class Record
    {
        public int? questiontype { get; set; }
        public int? questionid { get; set; }
        public int marks { get; set; }
        public int exampapers_masterID { get; set; }
    }

    private void showdetails(int assignID)
    {
        try
        {
            int? assignmentID = db.ec_assignments_assign.Where(x => x.assignId == assignID).Select(x=>x.assignmentId).FirstOrDefault();
            var assigndata = db.ec_assignments_assign.Where(x => x.assignId == assignID).FirstOrDefault();
            var exammarks = db.ec_assignment_master.Where(x => x.id == assignmentID).FirstOrDefault();

            examname = exammarks.assignment_name;
            if (exammarks != null)
            {

                lblmarksobtain.InnerText = assigndata.marks.ToString();
                uploadtype = exammarks.assignment_type;
                lbltotalmarks.InnerText = assigndata.total_marks.ToString();
               
                if (exammarks.assignment_type == 2)
                {
                    DivType1.Attributes.Add("style", "display:block;");
                    chekedlist = (from ean in db.ec_assignment_answersheet
                                  join em in db.ec_assignment_checked_master on ean.answesheetid equals em.answersheetid
                                  where ean.universityID == UniversityID && ean.assignID == assignID && ean.applicantid == applicantID
                                  select new Details()
                                  {
                                      checkedsheet = em.checkedfile_path_by_admin == null ? null : webURL + "Docs/Eclass_Service/Assignment_check/" + UniversityID + "/" + applicantID + "/" + assignID + "/Checked/"+ em.checkedfile_path_by_admin,
                                      comments = string.IsNullOrEmpty(em.checker_comments) ? null : em.checker_comments,
                                      marks = em.marks == null ? null : em.marks,
                                  }).ToList();
                }
                else if (exammarks.assignment_type == 1) //build
                {
                    List<int> lst = new List<int>();

                    var totalmarks = (from em in db.ec_assignment_papers_master
                                      where em.assignmentid == assignmentID
                                      select new Record()
                                      {
                                          questiontype = em.question_typeid,
                                          questionid = em.selected_questionId,
                                          marks = 0,
                                          exampapers_masterID = em.id,
                                      }).ToList();
                    foreach (var item in totalmarks)
                    {
                        lstofQuestionIdToBeShow.Add(item.exampapers_masterID);
                    }
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
                    bindDataList(bindid, UniversityID, applicantID, assignID,assignmentID);

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

    private void bindDataList(int? bindId, int universityid, int studentid, int assignID,int? assignmentID)
    {
        try
        {
            var allanswerpapers = (from ea in db.ec_assignment_answersheet
                                   join em in db.ec_assignment_papers_master on ea.assignment_papersheetID equals em.id
                                   join exammaster in db.ec_assignment_checked_master on ea.answesheetid equals exammaster.answersheetid
                                   where em.id == bindId && exammaster.applicantid == studentid && exammaster.universityid == universityid && ea.assignID == assignID
                                   select new details()
                                   {
                                       lblbindId = bindId,
                                       universityid = ea.universityID,
                                       exampaperid = assignmentID,
                                       studentid = studentid,
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
                                       comments = string.IsNullOrEmpty(exammaster.checker_comments) ? "-" : exammaster.checker_comments,
                                       perquestionmarks = exammaster.marks,
                                       checkedsheetpath = exammaster.checkedfile_path_by_admin == null ? null : webURL + "Docs/Eclass_Service/Assignment_check/" + UniversityID + "/" + applicantID + "/" + assignID + "/Checked/" + exammaster.checkedfile_path_by_admin,
                                   }).ToList();

            var take1question = allanswerpapers.Take(1);
            foreach (var item in take1question)
            {
                //questiontype = item.questiontype;
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

                }
                if (item.questiontype == 2)
                {
                    var truefalse_questionbank = db.ec_truefalse_question_master.Where(x => x.id == item.questiontype_id).FirstOrDefault();
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
                }
                if (item.questiontype == 3)
                {
                    var openanswer_questionbank = db.ec_openquestion_master.Where(x => x.id == item.questiontype_id).FirstOrDefault();
                    item.question = openanswer_questionbank.question;
                    item.correctanswer = openanswer_questionbank.correctanswer;
                    item.questionfinalmarks = openanswer_questionbank.marks;
                    item.openasnwernotetype = openanswer_questionbank.questiontype == 1 ? null : "file";
                    //item.openasnwernote = openanswer_questionbank.questiontype == 1 ? openanswer_questionbank.answer : webURL + "Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + openanswer_questionbank.examinerid + "/" + openanswer_questionbank.answer; ;
                    //totalmarksvalidation = openanswer_questionbank.marks;
                    item.applicantanswer_description = item.anshwesheetpath;
                    item.correctansfileFlag = "file";
                    item.ifopenasnwer = "yes";
                }
                if (item.questiontype == 4)
                {
                    var downloadsheet_questionbank = db.ec_uploadanswer_master.Where(x => x.questionid == item.questiontype_id).FirstOrDefault();
                    item.question = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid + "/" + downloadsheet_questionbank.questionpath;

                    item.question_extrasheet = downloadsheet_questionbank.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid + "/ExtraSheet/" + downloadsheet_questionbank.extrasheetpath;
                    item.question_extrafile = downloadsheet_questionbank.extrafilepath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + item.universityid + "/" + downloadsheet_questionbank.adminid + "/AnyFile/" + downloadsheet_questionbank.extrafilepath;

                    
                    //item.correctanswer = ;
                    item.questionfinalmarks = downloadsheet_questionbank.marks;
                    //totalmarksvalidation = downloadsheet_questionbank.marks;
                    item.correctansfileFlag = "file";

                    item.applicantanswer = webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + assignID + "/" + item.anshwesheetpath;
                    item.applicantanswer_extrafile = item.applicantanswer_exttrasheets == null ? null : webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + assignID + "/extrasheet/" + item.applicantanswer_exttrasheets;
                    
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
        public int? questiontype { get; set; }
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
        try
        {
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

            showdetails(assignID);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}
