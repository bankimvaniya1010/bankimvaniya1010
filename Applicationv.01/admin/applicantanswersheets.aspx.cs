using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_applicantanswersheets : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int? universityID, assignId, selecteduniversityID,selectedexamid, selectedapplicantid, examinerid;
    DateTime? selectedexamtime;
    public string evalutionfile;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public string  applicantname, lblquestionfinalmarks, questiontype;
    public int lblExamfinalmarks;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["ID"] == null) || (Request.QueryString["ID"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            assignId = Convert.ToInt32(Request.QueryString["ID"]);

        if ((Request.QueryString["examinerid"] == null) || (Request.QueryString["examinerid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            examinerid = Convert.ToInt32(Request.QueryString["examinerid"]);

        
        var exam_assign = db.exam_assign.Where(x => x.assignid == assignId).FirstOrDefault();
        showEvalutionFile(Convert.ToInt32(exam_assign.exampapersid));
        selecteduniversityID = exam_assign.universityID;
        selectedexamid = exam_assign.exampapersid;
        selectedapplicantid = exam_assign.applicantid;
        selectedexamtime = exam_assign.exam_datetime;

        applicantname = objCom.GetApplicantFirstName(Convert.ToInt32(selectedapplicantid)) + " " + objCom.GetApplicantLastName(Convert.ToInt32(selectedapplicantid));
        
        Divtoshow(selecteduniversityID,selectedexamid, selectedapplicantid, selectedexamtime);
        populatedate_marks(examinerid, selectedexamid, selectedapplicantid, selecteduniversityID, selectedexamtime);
    }
    private void Divtoshow(int? universityid, int? exampaperid, int? studentid, DateTime? examdate_time)
    {
        var examdata = db.exam_master.Where(x => x.exampapersid == exampaperid).FirstOrDefault();
        if (examdata.uploadtype == 1 || examdata.uploadtype == 3)
        {
            BindGrid(universityid, exampaperid, studentid, examdate_time);
            showbuildexamDiv.Attributes.Add("style", "display:none");
            coeCard.Attributes.Add("style", "display:block");
        }
        else if (examdata.uploadtype == 2)
        {
            toshowanswersheet(universityid, studentid, exampaperid, examdate_time, examinerid);
            showbuildexamDiv.Attributes.Add("style", "display:block");
            coeCard.Attributes.Add("style", "display:none");
            marksDiv.Attributes.Add("style", "display:none");
        }
    }

    private void BindGrid(int? universityid, int? exampaperid, int? studentid, DateTime? examdate_time)
    {
        try
        {
            List<data> exam_answersheetdata = null; 
            var examdata = db.exam_master.Where(x => x.exampapersid == exampaperid).FirstOrDefault();
            if (examdata.uploadtype == 1)
            {
                exam_answersheetdata = (from exam in db.exam_answersheet
                                        join em in db.exam_marking_master on exam.answesheetid equals em.answersheetid into data
                                        from x in data.DefaultIfEmpty()
                                        where exam.universityID == universityid && exam.exampaperid == exampaperid && exam.applicantid == studentid && exam.exam_datetime == examdate_time
                                        select new data()
                                        {
                                            answesheetid = exam.answesheetid,
                                            anshwesheetpath = exam.anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.exampapersheetID + "/" + exam.anshwesheetpath,
                                            extra_anshwesheetpath = exam.extra_anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.exampapersheetID + "/" + "/extrasheet/" + exam.extra_anshwesheetpath,
                                            checkedsheet = x.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.answesheetid + "/" + x.checked_answersheetPath,
                                        }).OrderBy(x => x.answesheetid).ToList();
            }
            else if (examdata.uploadtype == 3)
            {
                bool abc = false;
                exam_answersheetdata = (from exam in db.exam_answersheet
                                        join em in db.exam_marking_master on exam.answesheetid equals em.answersheetid into data
                                        from x in data.DefaultIfEmpty()
                                        where exam.universityID == universityid && exam.exampaperid == exampaperid && exam.applicantid == studentid && exam.exam_datetime == examdate_time
                                        select new data()
                                        {
                                            answesheetid = exam.answesheetid,
                                            anshwesheetpath = webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.anshwesheetpath,
                                            extra_anshwesheetpath = exam.extra_anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.exampapersheetID + "/extrasheet/" + exam.extra_anshwesheetpath,
                                            checkedsheet = x.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.answesheetid + "/" + x.checked_answersheetPath,
                                            ispdfgenrated = exam.ispdfgenrated == null ? null : exam.ispdfgenrated,
                                            genratedanswerpdfPath = exam.genratedanswerpdfPath,
                                        }).OrderBy(x => x.answesheetid).ToList();

                foreach (var item in exam_answersheetdata)
                {
                    if (item.ispdfgenrated == 1)
                    {
                        abc = true;
                        break;
                    }
                }

                if (abc == true)
                    exam_answersheetdata.RemoveAll(x => x.ispdfgenrated != 1);
                else
                    exam_answersheetdata.RemoveAll(x => x.ispdfgenrated == 1);



            }

            if (exam_answersheetdata != null && exam_answersheetdata.Count > 0)
            {

                GridView.DataSource = exam_answersheetdata;
                GridView.DataBind();
                if (examdata.uploadtype == 1 || examdata.uploadtype == 3)
                {
                    lblExamfinalmarks = Convert.ToInt32(examdata.maximummarks);
                    showbuildexamDiv.Attributes.Add("style", "display:none;");
                }
                else
                {
                    
                    showbuildexamDiv.Attributes.Add("style", "display:block;");
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public class data
    {
        public int answesheetid { get; set; }
        public string anshwesheetpath { get; set; }
        public string extra_anshwesheetpath { get; set; }
        public string checkedsheet { get; set; }
        public int? ispdfgenrated { get; set; }
        public string genratedanswerpdfPath { get; set; }
    }
    protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
       BindGrid(selecteduniversityID, selectedexamid, selectedapplicantid, selectedexamtime);

    }

    protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Upload")
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int answesheetid = Convert.ToInt32(GridView.DataKeys[index].Value);
                GridViewRow row = GridView.Rows[index];
                FileUpload fileupload_checkedsheet = (FileUpload)row.FindControl("fileupload_checkedsheet") as FileUpload;

                var data = db.exam_answersheet.Where(x => x.answesheetid == answesheetid).FirstOrDefault();
                if (fileupload_checkedsheet.HasFile)
                {
                    exam_marking_master objmarkedpaper = new exam_marking_master();
                    var mode = "new";
                    var marekeddata = db.exam_marking_master.Where(x => x.answersheetid == answesheetid).FirstOrDefault();
                    if (marekeddata != null)
                    {
                        mode = "update";
                        marekeddata = objmarkedpaper;
                    }

                    docPath = docPath + "/Exammodule/Admin_checkedsheets/" + data.universityID + "/" + data.applicantid + "/" + data.exampaperid + "/" + answesheetid;
                    string path = docPath + "/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload_checkedsheet.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    fileupload_checkedsheet.PostedFile.SaveAs(filePath);
                    objmarkedpaper.checked_answersheetPath = fileName;

                    objmarkedpaper.examinerid = Convert.ToInt32(Session["examinerID"]);
                    objmarkedpaper.examid = data.exampaperid;
                    objmarkedpaper.applicantid = data.applicantid;
                    objmarkedpaper.universityid = data.universityID;
                    objmarkedpaper.answersheetid = answesheetid;
                    objmarkedpaper.examdatetime = data.exam_datetime;
                    if (mode == "new")
                        db.exam_marking_master.Add(objmarkedpaper);
                    db.SaveChanges();
                    
                    BindGrid(selecteduniversityID, selectedexamid, selectedapplicantid, selectedexamtime);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Select file to upload.')", true);
                }
            }
            catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        }
    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    private void showEvalutionFile(int examid)
    {
        var exam_master = db.exam_master.Where(x => x.exampapersid == examid).FirstOrDefault();
        if (exam_master != null)
        {
            if (exam_master.checkingguidfilepath != null)
            {
                evalutionguid.Attributes.Add("style", "display:block;");
                evalutionfile  = webURL + "Docs/Exammodule/" + exam_master.universityID + "/" + examid + "/CheckingGuide/" + exam_master.checkingguidfilepath;
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var papersheet = (List<exam_answersheet>)Session["allQuestions"];

            int studentid=0, answesheetid=0, universityid=0, exampaperid=0;
            DateTime? examdatetime = null; 
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

                Label lblexamdatetime = (Label)item.FindControl("lblexamdatetime");
                examdatetime = Convert.ToDateTime(lblexamdatetime.Text);

                //TextBox txtcomments = (TextBox)item.FindControl("txtcomments");
                string comments = txtcomments.Text;

//                TextBox txtmarks = (TextBox)item.FindControl("txtmarks2");
                string marks = txtmarks2.Text;

                FileUpload checksheet = (FileUpload)item.FindControl("checksheet");
                
                exam_marking_master objmapping = new exam_marking_master();

                objmapping.examinerid = examinerid;
                objmapping.examid = exampaperid;
                objmapping.applicantid = studentid;
                objmapping.universityid = universityid;
                objmapping.answersheetid = answesheetid;
                if (checksheet.HasFile)
                {
                    docPath = docPath + "/Exammodule/Admin_checkedsheets/" + universityid + "/" + studentid + "/" + exampaperid + "/" + answesheetid;
                    string path = docPath + "/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(checksheet.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    checksheet.PostedFile.SaveAs(filePath);
                    objmapping.checked_answersheetPath = fileName;
                }
                objmapping.perquestion_marks = Convert.ToInt32(marks);
                objmapping.checker_comments = comments;
                objmapping.examdatetime = examdatetime;
                db.exam_marking_master.Add(objmapping);
                db.SaveChanges();
                papersheet.RemoveAll(x => x.answesheetid == answesheetid);
                                
            }
            if (papersheet.Count > 0)
            {
                txtcomments.Text = "";
                txtmarks2.Text = "";
                Session["allQuestions"] = papersheet;
                //toshowanswersheet(universityid, studentid, exampaperid, examdatetime, examinerid);
                bindDataList(universityid, studentid, exampaperid, examdatetime);
            }
            else
            {
                //if all queshtionsheets are answerd then save final marks and rrelease date
                
                var mark_givenByAdmin = db.exam_marking_master.Where(x => x.universityid == universityid && x.applicantid == studentid && x.examid == exampaperid && x.examdatetime == examdatetime)
                                               .Select(x => x.perquestion_marks).DefaultIfEmpty(0).Sum();
                var examuploadtype = db.exam_master.Where(x => x.exampapersid == exampaperid).Select(x=>x.uploadtype).FirstOrDefault();
                if (examuploadtype == 2)
                {
                    int Buildtotalmarks= BindTotalMarks_buildtype(exampaperid);
                    SaveBuildTotalMarks(mark_givenByAdmin, Buildtotalmarks);
                }

                populatedate_marks(examinerid, exampaperid, studentid, universityid, examdatetime);
                answer_records.Attributes.Add("style", "display:none");
                //evalutionguid.Attributes.Add("style", "display:none");
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SaveBuildTotalMarks(int? mark_givenByAdmin, int? totalmarks) {
        try {
            var mode = "new";
            exam_applicantmarks_releasedatemaster objmappping = new exam_applicantmarks_releasedatemaster();

            var data = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == selectedapplicantid && x.universityid == selecteduniversityID && x.examinerid == examinerid && x.examdate_time == selectedexamtime).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmappping = data;
            }
            objmappping.applicantid = selectedapplicantid;
            objmappping.examinerid = examinerid;
            objmappping.examid = selectedexamid;
            objmappping.universityid = selecteduniversityID;
            objmappping.examdate_time = selectedexamtime;
            objmappping.finalmarks = mark_givenByAdmin.ToString();
            objmappping.totalmarks = totalmarks.ToString();

            if (mode == "new")
                db.exam_applicantmarks_releasedatemaster.Add(objmappping);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void populatedate_marks(int? examinerid, int? examid, int? applicantid, int? universityid, DateTime? examdatetime)
    {
        try
        {
            var data = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == applicantid && x.universityid == universityid && x.examid == examid && x.examinerid == examinerid && x.examdate_time == examdatetime).FirstOrDefault();

            if (data != null)
            {
                txtmarks.Attributes.Add("disabled", "disabled");
                txtmarks.Value = data.finalmarks;
               btnsavedatemarks.Attributes.Add("style", "display:none");
            
            }
            else if (data == null)
            {
                var uploadtype = db.exam_master.Where(x => x.exampapersid == examid).Select(x => x.uploadtype).FirstOrDefault();
                if (uploadtype == 2)
                {
                    btnsavedatemarks.Attributes.Add("style", "display:none");
                    marksDiv.Attributes.Add("style", "display:none");
                }
                else {
                    btnsavedatemarks.Attributes.Add("style", "display:block");
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
        public string questiontype { get; set; }
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
      

    protected void btnsavedatemarks_Click1(object sender, EventArgs e)
    {
        try {
            
            var examdata = db.exam_master.Where(x => x.exampapersid == selectedexamid).FirstOrDefault();

            dynamic checkedsheetcount;
            if (examdata.uploadtype != 1)
                checkedsheetcount = db.exam_marking_master.Where(x => x.universityid == selecteduniversityID && x.applicantid == selectedapplicantid && x.examid == selectedexamid && x.examdatetime == selectedexamtime).ToList().Count();
            else
            {
                var answercount = db.exam_answersheet.Where(x => x.universityID == selecteduniversityID && x.applicantid == selectedapplicantid && x.exampaperid == selectedexamid && x.exam_datetime == selectedexamtime).ToList().Count();
                var checkedcount = db.exam_marking_master.Where(x => x.universityid == selecteduniversityID && x.applicantid == selectedapplicantid && x.examid == selectedexamid && x.examdatetime == selectedexamtime).ToList().Count();
                if (answercount == checkedcount)
                    checkedsheetcount = 1;
                else
                    checkedsheetcount = 0;
            }
            if (checkedsheetcount > 0)
            {
                var mode = "new";
                exam_applicantmarks_releasedatemaster objmappping = new exam_applicantmarks_releasedatemaster();

                var data = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == selectedapplicantid && x.universityid == selecteduniversityID && x.examinerid == examinerid && x.examdate_time == selectedexamtime).FirstOrDefault();
                if (data != null)
                {
                    mode = "update";
                    objmappping = data;
                }
                objmappping.applicantid = selectedapplicantid;
                objmappping.examinerid = examinerid;
                objmappping.examid = selectedexamid;
                objmappping.universityid = selecteduniversityID;
                objmappping.examdate_time =selectedexamtime;
                objmappping.finalmarks = txtmarks.Value;
                objmappping.totalmarks = lblExamfinalmarks.ToString();
                
                if (mode == "new")
                    db.exam_applicantmarks_releasedatemaster.Add(objmappping);
                db.SaveChanges();
                populatedate_marks(examinerid, selectedexamid, selectedapplicantid, selecteduniversityID, selectedexamtime);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please check the assessment sheet first.')", true);
        
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    
    private void toshowanswersheet(int? universityid, int? applicantid, int? examid, DateTime? examdatetime, int? examinerid)
    {
        var answeredQuestion = db.exam_marking_master.Where(x => x.applicantid == applicantid && x.universityid == universityid && x.examid == examid && x.examdatetime == examdatetime).ToList();
        var allQuestions = db.exam_answersheet.Where(y => y.exampaperid == examid && y.universityID == universityid & y.applicantid == applicantid && y.exam_datetime == examdatetime).ToList();

        ViewState["QuestionsCount"] = allQuestions.Count;
        ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
        Session["allQuestions"] = allQuestions;

        if (answeredQuestion.Count == allQuestions.Count)
        {
            //marksDiv.Attributes.Add("style", "display:block");
            if (allQuestions.Count > 0)
            {
                
                //var totalmarks = db.exam_marking_master.Where(x => x.universityid == universityid && x.applicantid == applicantid && x.examid == examid && x.examdatetime == examdatetime)
                //                               .Select(x => x.perquestion_marks).DefaultIfEmpty(0).Sum();
                var finalmarks = db.exam_master.Where(x => x.universityID == universityid && x.exampapersid == examid).Select(x => x.maximummarks).FirstOrDefault();
                         //lbltotalmarks.Text = totalmarks;
                
                populatedate_marks(examinerid, examid, applicantid, universityid, examdatetime);
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
            SetQuestionList(answeredQuestion, universityid, applicantid, examid, examdatetime);
        }
    }

    private void SetQuestionList(List<exam_marking_master> allResponseList, int? universityid, int? studenid, int? examid, DateTime? examdatetime)
    {
        try
        {
            var examdata = db.exam_master.Where(x => x.exampapersid == examid).FirstOrDefault();
            //buildevalutionfile = webURL + "Docs/Exammodule/" + universityid + "/" + examid + "/CheckingGuide/" + examdata.checkingguidfilepath;
            var questions = (List<exam_answersheet>)Session["allQuestions"];
            if (allResponseList.Count > 0)
            {
                foreach (var response in allResponseList)
                {
                    questions.RemoveAll(x => x.answesheetid == response.answersheetid);
                }
            }

            Session["allQuestions"] = questions;
            bindDataList(universityid, studenid, examid, examdatetime);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    
    private void bindDataList(int? universityid, int? studentid, int? exampaperid, DateTime? examdatetime)
    {
        try
        {
            List<int> lst = new List<int>();
            var papersheet = (List<exam_answersheet>)Session["allQuestions"];
            int? papersheetId = papersheet.ElementAt(0).answesheetid;

            var allanswerpapers = (from ea in db.exam_answersheet
                                   join em in db.exampapers_master on ea.exampapersheetID equals em.id
                                   where ea.answesheetid == papersheetId && ea.universityID == universityid && ea.exampaperid == exampaperid && ea.applicantid == studentid && ea.exam_datetime == examdatetime
                                   select new details()
                                   {
                                       answesheetid = papersheetId,
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
                                   }).ToList();

            var take1question = allanswerpapers.Take(1);
            foreach (var item in take1question)
            {
                questiontype = item.questiontype;
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
                    lst.Add(Convert.ToInt32(mcq_questionbank.maximummarks));
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
                    lst.Add(Convert.ToInt32(truefalse_questionbank.maximum_marks));
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
                    lst.Add(Convert.ToInt32(openanswer_questionbank.marks));
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
        public string questiontype { get; set; }
        public int? questionid { get; set; }
        public int marks { get; set; }
        public int exampapers_masterID { get; set; }

    }
    public int BindTotalMarks_buildtype(int? examid)
    {
        int total_marks =0 ;
        try
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
            lblExamfinalmarks= lst.Sum();
            total_marks = lst.Sum();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        return total_marks;
    }
}