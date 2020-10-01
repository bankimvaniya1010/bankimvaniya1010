using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_exam_marking : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    public string evalutionfile, buildevalutionfile, questiontype;
    public int  marksobtain, lsttotalmarks;
    public string totalmarksvalidation;    
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int allanswer_papersCount, allChecked_papersheetscount;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindUniversity();
    }
    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddluniversity.DataSource = Universities;
            ddluniversity.DataTextField = "university_name";
            ddluniversity.DataValueField = "universityid";
            ddluniversity.DataBind();
            ddluniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddluniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddluniversity.SelectedValue);
        BindExaminer(selecteduniversityid);

        Bind_Class(selecteduniversityid);
        Bind_Group(selecteduniversityid);
        Bind_Subject(selecteduniversityid);
    }

    private void BindExaminer(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studentID = db.examiner_master.Where(x => x.universityId == universityid && x.roleid == 11).ToList();
            ddlexaminer.DataSource = studentID;
            ddlexaminer.DataTextField = "name";
            ddlexaminer.DataValueField = "examinerID";
            ddlexaminer.DataBind();
            ddlexaminer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        int examinerID = Convert.ToInt32(ddlexaminer.SelectedValue);
        int selectedclassid = Convert.ToInt32(ddlclass.SelectedValue);
        int selectedgroupid = Convert.ToInt32(ddlgroup.SelectedValue);
        string selectedsubjectid = ddlsubject.SelectedValue;

        Session["examinerID"] = examinerID;
        BindExam(examinerID, selectedclassid, selectedgroupid, selectedsubjectid);
    }

    private void BindExam(int examinerID, int classid, int groupid, string subjectid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studentID = (from ac in db.examchecking_assignment
                             join am in db.exam_master on ac.ExamId equals am.exampapersid
                             where ac.examinerId == examinerID && am.classid == classid && am.groupid == groupid && am.exam_subject == subjectid
                             select new
                             {
                                 exampapersid = ac.ExamId,
                                 exam_name = am.exam_name,
                             }).Distinct().ToList();
            ddlexam.DataSource = studentID;
            ddlexam.DataTextField = "exam_name";
            ddlexam.DataValueField = "exampapersid";
            ddlexam.DataBind();
            ddlexam.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }   

    protected void ddlexam_SelectedIndexChanged(object sender, EventArgs e)
    {
        int exampaperId = Convert.ToInt32(ddlexam.SelectedValue);
        Session["exampaperId"] = exampaperId;
        int examinerID = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindExamDate(examinerID, exampaperId);       
    }

    private void BindExamDate(int examinerid, int examid) {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studentID = (from ac in db.examchecking_assignment
                             join am in db.exam_schedule on ac.scheduledate_time equals am.exam_datetime
                             where ac.examinerId == examinerid && am.exampapersid == examid
                             select new
                             {                               
                                 exam_datetime = am.exam_datetime,
                             }).ToList();
            ddlexamdate.DataSource = studentID;
            ddlexamdate.DataTextField = "exam_datetime";
            ddlexamdate.DataValueField = "exam_datetime";
            ddlexamdate.DataBind();
            ddlexamdate.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexamdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddluniversity.SelectedValue);
        int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
        DateTime selecteddate = Convert.ToDateTime(ddlexamdate.SelectedValue);

        var data = db.exam_assign.Where(x => x.universityID == selecteduniversityid && x.exampapersid == selectedexamid && x.exam_datetime == selecteddate).FirstOrDefault();
        if (data != null)
            BIndStudent(selecteduniversityid, selectedexamid, selecteddate);
        else
        {
            ddlstudent.ClearSelection();
            ddlstudent.Items.Clear();
            ddlstudent.Items.Insert(0, "No Applicant");
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddluniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            int selectedexamId = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selectedexamdattime = Convert.ToDateTime(ddlexamdate.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examchecking_assignment.Where(x => x.ExamId == selectedexamId && x.scheduledate_time == selectedexamdattime && x.institutionId == selecteduniversityid && x.examinerId == selectedexaminerId).Select(x => x.examiner_passkey).FirstOrDefault();
            var examtype = db.exam_master.Where(x => x.universityID == selecteduniversityid && x.exampapersid == selectedexamId).Select(x => x.uploadtype).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                //// check for type of exam paper 
                //if (examtype != null && examtype == 1)
                //{
                //    showuploadexamDiv.Attributes.Add("style", "display:block");
                    
                //}
                //else if (examtype != null && examtype == 2)
                //{
                //    showbuildexamDiv.Attributes.Add("style", "display:block");
                //    showfinalmarks_dateDiv.Attributes.Add("style", "display:none");
                //}
                savedatemarks.Attributes.Add("style", "display:block");
                studentddl_evalutionDiv.Attributes.Add("style", "display:block");
                evalutionguid.Attributes.Add("style", "display:none");
                validDiv.Attributes.Add("style", "display:none");
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BIndStudent(int universityID, int exampaperId, DateTime examiner_selectedDate)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studentID = (from ac in db.exam_assign
                             where ac.exampapersid == exampaperId && ac.universityID == universityID && ac.exam_datetime == examiner_selectedDate
                             select new
                             {
                                 applicantid = ac.applicantid,
                                 status = ac.status == null ? ac.applicantid + " (Pending)" : ac.applicantid + " (" + ac.status + ")",
                             }).ToList();
            ddlstudent.DataSource = studentID;
            ddlstudent.DataTextField = "status";
            ddlstudent.DataValueField = "applicantid";
            ddlstudent.DataBind();
            ddlstudent.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlstudent_SelectedIndexChanged(object sender, EventArgs e)
    {
        int studentid = Convert.ToInt32(ddlstudent.SelectedValue);
        string studentstatus = ddlstudent.SelectedItem.ToString(); ;
        int examinerID = Convert.ToInt32(ddlexaminer.SelectedValue);
        int exampaperId = Convert.ToInt32(ddlexam.SelectedValue);
        int universityId = Convert.ToInt32(ddluniversity.SelectedValue);
        DateTime datetime = Convert.ToDateTime(ddlexamdate.SelectedValue);

        var examdata = db.exam_master.Where(x => x.exampapersid == exampaperId).FirstOrDefault();
        var data = db.examchecking_assignment.Where(x => x.examinerId == examinerID && x.ExamId == exampaperId).FirstOrDefault();

        if (studentid != 0)
        {
           // evalutionguid            
            evalutionfile = webURL + "Docs/Exammodule/" + examdata.universityID + "/" + exampaperId + "/CheckingGuide/" + examdata.checkingguidfilepath;
            evalutionguid.Attributes.Add("style", "display:block");

            if (examdata.uploadtype == 1 || examdata.uploadtype == 3)
            {
                if (studentstatus.Contains("Completed") || studentstatus.Contains("Disqualified"))
                {
                    showuploadexamDiv.Attributes.Add("style", "display:block");
                    BindGrid(universityId, exampaperId, studentid, datetime);
                    coeCard.Attributes.Add("style", "display:block");
                    lbltotalmarks.Text = examdata.maximummarks;
                    marksobtain = Convert.ToInt32(examdata.maximummarks);
                }
                else {
                    lblMess.Visible = false;
                    showuploadexamDiv.Attributes.Add("style", "display:none");
                    coeCard.Attributes.Add("style", "display:none");
                    BindGrid(universityId, exampaperId, studentid, datetime);
                }

            }
            else if (examdata.uploadtype == 2)
            {
                if (studentstatus.Contains("Completed") || studentstatus.Contains("Disqualified"))
                {
                    toshowanswersheet(universityId, studentid, exampaperId, datetime, examinerID);
                    lblMess.Visible = false;
                }
                else
                {
                    showbuildexamDiv.Attributes.Add("style", "display:none");
                    evalutionguid.Attributes.Add("style", "display:none");
                    showfinalmarks_dateDiv.Attributes.Add("style", "display:none");
                    savedatemarks.Attributes.Add("style", "display:none");
                    lblMess.Visible = true;
                    lblMess.InnerText = "Student not yet appered for exam";
                }
            }            
        }
        else
        {
            coeCard.Attributes.Add("style", "display:none");
            evalutionguid.Attributes.Add("style", "display:none");
            showfinalmarks_dateDiv.Attributes.Add("style", "display:none");
            showbuildexamDiv.Attributes.Add("style", "display:none");
        }        
    }

    private void populatedate_marks(int examinerid, int examid, int applicantid, int universityid, DateTime examdatetime)
    {
        try {
            var data = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == applicantid && x.universityid == universityid && x.examid == examid && x.examinerid == examinerid && x.examdate_time == examdatetime).FirstOrDefault();

            if (data != null)
            {
                txtmarksobtain.Attributes.Add("disabled", "disabled");
                txtmarksobtain.Value = data.finalmarks;
               
                lblmarkssaveat.InnerText = "Record saved at : " + data.exammarks_saved_at.ToString();
                if (data.releasedate != null)
                {
                    date_edit.Attributes.Add("style", "display:none");
                    lbldates_saved.Attributes.Add("style", "display:block");
                    lblreleasedatetime.InnerText = data.releasedate.ToString() + " < " + data.releasedate_timezone.ToString() + " >";
                    lblreleasedatetimeutc.InnerText = "UTC : "+data.releasedateutc.ToString();
                    lbldatesaved_at.InnerText = "Record saved at : " + data.examdate_saved_at.ToString();
                    btnsavedatemarks.Attributes.Add("style", "display:none");
                }
            }
            else if(data == null)
            {
                btnsavedatemarks.Attributes.Add("style", "display:block");
                date_edit.Attributes.Add("style", "display:block");
                lbldates_saved.Attributes.Add("style", "display:none");
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    } 

    private void BindGrid(int universityid, int exampaperid , int studentid, DateTime examdate_time)
    {        
        try
        {
            dynamic exam_answersheetdata = null;
            int examinerID = Convert.ToInt32(ddlexaminer.SelectedValue);
            int exampaperId = Convert.ToInt32(ddlexam.SelectedValue);
            var examdata = db.exam_master.Where(x => x.exampapersid == exampaperId).FirstOrDefault();
            if (examdata.uploadtype == 1)
            {
                exam_answersheetdata = (from exam in db.exam_answersheet
                                        join em in db.exam_marking_master on exam.answesheetid equals em.answersheetid into data
                                        from x in data.DefaultIfEmpty()
                                        where exam.universityID == universityid && exam.exampaperid == exampaperid && exam.applicantid == studentid && exam.exam_datetime == examdate_time
                                        select new
                                        {
                                            answesheetid = exam.answesheetid,
                                            anshwesheetpath = exam.anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid+"/"+exam.exampapersheetID + "/" + exam.anshwesheetpath,
                                            extra_anshwesheetpath = exam.extra_anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.exampapersheetID + "/" + "/extrasheet/" + exam.extra_anshwesheetpath,
                                            checkedsheet = x.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid+ "/" + exam.answesheetid + "/" + x.checked_answersheetPath,
                                        }).OrderBy(x => x.answesheetid).ToList();
            }
            else if (examdata.uploadtype == 3)
            {

                exam_answersheetdata = (from exam in db.exam_answersheet
                                        join em in db.exam_marking_master on exam.answesheetid equals em.answersheetid into data
                                        from x in data.DefaultIfEmpty()
                                        where exam.universityID == universityid && exam.exampaperid == exampaperid && exam.applicantid == studentid && exam.exam_datetime == examdate_time && exam.ispdfgenrated == 1
                                        select new
                                        {
                                            answesheetid = exam.answesheetid,
                                            anshwesheetpath = exam.anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/"+exam.exampaperid+"answersheets.pdf",
                                            extra_anshwesheetpath = exam.extra_anshwesheetpath == null ? null : webURL + "Docs/Exammodule/AnswerSheet/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.exampapersheetID + "/extrasheet/" + exam.extra_anshwesheetpath,
                                            checkedsheet = x.checked_answersheetPath == null ? null : webURL + "Docs/Exammodule/Admin_checkedsheets/" + exam.universityID + "/" + exam.applicantid + "/" + exam.exampaperid + "/" + exam.answesheetid + "/" + x.checked_answersheetPath,
                                        }).OrderBy(x => x.answesheetid).ToList();
            }

            if (exam_answersheetdata.Count > 0)
            {               
                GridView.DataSource = exam_answersheetdata;
                GridView.DataBind();
                evalutionguid.Attributes.Add("style", "display:block");
                showfinalmarks_dateDiv.Attributes.Add("style", "display:block");
                btnsavedatemarks.Attributes.Add("style", "display:block");
                coeCard.Attributes.Add("style", "display:block");
                lblMess.Visible = false;
                populatedate_marks(examinerID, exampaperid, studentid, universityid, examdate_time);
            }
            else
            {
                lblMess.Visible = true;
                lblMess.InnerText = "Student not yet appered for exam";
                coeCard.Attributes.Add("style", "display:none");
                showfinalmarks_dateDiv.Attributes.Add("style", "display:none");
                evalutionguid.Attributes.Add("style", "display:none");
                
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }   
   
    protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        int studentid = Convert.ToInt32(ddlstudent.SelectedValue);
        int exampaperId = Convert.ToInt32(ddlexam.SelectedValue);
        int universityId = Convert.ToInt32(ddluniversity.SelectedValue);
        DateTime datetime = Convert.ToDateTime(ddlexamdate.SelectedValue);
        BindGrid(universityId, exampaperId, studentid, datetime);

    }

    protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Upload")
        {
            try {
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
                    int studentid = Convert.ToInt32(ddlstudent.SelectedValue);
                    int exampaperId = Convert.ToInt32(ddlexam.SelectedValue);
                    int universityId = Convert.ToInt32(ddluniversity.SelectedValue);
                    DateTime datetime = Convert.ToDateTime(ddlexamdate.SelectedValue);
                    BindGrid(Convert.ToInt32(objmarkedpaper.universityid), Convert.ToInt32(objmarkedpaper.examid), Convert.ToInt32(objmarkedpaper.applicantid), datetime);

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

    protected void btnsavedatemarks_Click(object sender, EventArgs e)
    {
        try {
            int examid = Convert.ToInt32(ddlexam.SelectedValue);
            int applicantid = Convert.ToInt32(ddlstudent.SelectedValue);
            int examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
            DateTime examdatetime = Convert.ToDateTime(ddlexamdate.SelectedValue);
            int universityid = Convert.ToInt32(ddluniversity.SelectedValue);
            string finalmrksentered = txtmarksobtain.Value;
            DateTime dateofrelease = Convert.ToDateTime(selectedexamdate_time.Value);
            DateTime dateofreleaseutc = Convert.ToDateTime(hidexamutcdatetime.Value);
            string TimeZone = hidTimeZone.Value;


            // to check whether admin has chedked all answershhet or not
            var checkedsheetcount = db.exam_marking_master.Where(x => x.universityid == universityid && x.applicantid == applicantid && x.examid == examid && x.examdatetime == examdatetime).ToList().Count();
            if (checkedsheetcount > 0)
            {
                var mode = "new";
                exam_applicantmarks_releasedatemaster objmappping = new exam_applicantmarks_releasedatemaster();

                var data = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == applicantid && x.universityid == universityid && x.examinerid == examinerid && x.examdate_time == examdatetime).FirstOrDefault();
                if (data != null)
                {
                    mode = "update";
                    objmappping = data;
                }
                objmappping.applicantid = Convert.ToInt32(ddlstudent.SelectedValue);
                objmappping.examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
                objmappping.examid = Convert.ToInt32(ddlexam.SelectedValue);
                objmappping.universityid = Convert.ToInt32(universityid);
                objmappping.examdate_time = Convert.ToDateTime(ddlexamdate.SelectedValue);
                objmappping.finalmarks = txtmarksobtain.Value;
                objmappping.releasedate = Convert.ToDateTime(selectedexamdate_time.Value);
                objmappping.releasedate_timezone = TimeZone;
                objmappping.totalmarks = lbltotalmarks.Text;
                objmappping.releasedateutc = dateofreleaseutc;
                objmappping.exammarks_saved_at = Convert.ToDateTime(DateTime.Now);
                objmappping.examdate_saved_at = Convert.ToDateTime(DateTime.Now);
                //if (objmappping.examdate_saved_at == null)
                //    objmappping.exammarks_saved_at = Convert.ToDateTime(DateTime.Now);
                //else if(objmappping.finalmarks != null && objmappping.finalmarks != finalmrksentered)
                //    objmappping.exammarks_saved_at = Convert.ToDateTime(DateTime.Now);
                //if (objmappping.examdate_saved_at == null)                
                //     objmappping.examdate_saved_at = Convert.ToDateTime(DateTime.Now);
                //else if (objmappping.releasedate != null && objmappping.releasedate != dateofrelease)
                //    objmappping.examdate_saved_at = Convert.ToDateTime(DateTime.Now);

                if (mode == "new")
                    db.exam_applicantmarks_releasedatemaster.Add(objmappping);
                db.SaveChanges();

                // send mail to student the date of release
                var examname = db.exam_master.Where(x => x.exampapersid == objmappping.examid).FirstOrDefault();
                var studentDetails = db.students.Where(x => x.studentid == objmappping.applicantid).FirstOrDefault();
                var university = db.university_master.Where(x => x.universityid == objmappping.universityid).FirstOrDefault();

                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ResultDeclaration_Notification.html"));
                string emailsubject = "Your " + examname.exam_name + " result declaration date.";
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + objmappping.universityid + "/" + university.logo);
                html = html.Replace("@Name", studentDetails.name);
                html = html.Replace("@examname", examname.exam_name);
                html = html.Replace("@releasedate", Convert.ToDateTime(objmappping.releasedate).ToString("dd/MMM/yyyy hh:mm tt"));
                html = html.Replace("@Loginurl", webURL + "Login.aspx");
                html = html.Replace("@tiemzone", objmappping.releasedate_timezone);
                objCom.SendMail(studentDetails.email, html, emailsubject);
                populatedate_marks(examinerid, examid, applicantid, universityid, examdatetime);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please mark the exam sheet first.')", true);
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }
    
    private void toshowanswersheet(int universityid, int applicantid, int examid, DateTime examdatetime, int examinerid) {
        var answeredQuestion = db.exam_marking_master.Where(x => x.applicantid == applicantid && x.universityid == universityid && x.examid == examid && x.examdatetime == examdatetime).ToList();
        var allQuestions = db.exam_answersheet.Where(y => y.exampaperid == examid && y.universityID == universityid & y.applicantid == applicantid && y.exam_datetime == examdatetime).ToList();

        ViewState["QuestionsCount"] = allQuestions.Count;
        ViewState["AnsweredQuestionCount"] = answeredQuestion.Count;
        Session["allQuestions"] = allQuestions;

        if (answeredQuestion.Count == allQuestions.Count)
        {
            showfinalmarks_dateDiv.Attributes.Add("style", "display:block");
            savedatemarks.Attributes.Add("style", "display:block");
            //var totalmarks = db.exam_marking_master.Where(x => x.universityid == universityid && x.applicantid == applicantid && x.examid == examid && x.examdatetime == examdatetime)
            //                               .Select(x => x.perquestion_marks).DefaultIfEmpty(0).Sum();
            var finalmarks = db.exam_master.Where(x => x.universityID == universityid && x.exampapersid == examid).Select(x => x.maximummarks).FirstOrDefault();

            txtmarksobtain.Value = lsttotalmarks.ToString();
            marksobtain =Convert.ToInt32(finalmarks);
            BindTotalMarks_buildtype(examid);
            //lbltotalmarks.Text = totalmarks;
            populatedate_marks(examinerid, examid, applicantid, universityid, examdatetime);
            answer_records.Attributes.Add("style", "display:none");
            evalutionguid.Attributes.Add("style", "display:none");
            button.Attributes.Add("style", "display:none");
            
        }
        else
        {
            showfinalmarks_dateDiv.Attributes.Add("style", "display:none");
            savedatemarks.Attributes.Add("style", "display:none");
            button.Attributes.Add("style", "display:block");
            showbuildexamDiv.Attributes.Add("style", "display:block");
            answer_records.Attributes.Add("style", "display:block");
            SetQuestionList(answeredQuestion, universityid, applicantid, examid, examdatetime);
        }
    }

    private void SetQuestionList(List<exam_marking_master> allResponseList, int universityid, int studenid, int examid, DateTime examdatetime)
    {
        try
        {
            var examdata = db.exam_master.Where(x => x.exampapersid == examid).FirstOrDefault();
            buildevalutionfile = webURL + "Docs/Exammodule/" + universityid + "/" + examid + "/CheckingGuide/" + examdata.checkingguidfilepath;
            var questions = (List<exam_answersheet>)Session["allQuestions"];
            if (allResponseList.Count > 0)
            {
                foreach (var response in allResponseList)
                {
                    questions.RemoveAll(x => x.answesheetid == response.answersheetid);
                }
            }

            Session["allQuestions"] = questions;
            bindDataList(universityid,studenid,examid,examdatetime);
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    public class details {
        public int? answesheetid { get; set; }    
        public int? universityid { get; set; }
        public int? exampaperid { get; set; }
        public DateTime examdatetime{ get; set; }
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
    }

    private void bindDataList(int universityid, int studentid, int exampaperid, DateTime examdatetime)
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
                                       ifopenasnwer =null,
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
                    totalmarksvalidation = mcq_questionbank.maximummarks;
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
                    totalmarksvalidation = truefalse_questionbank.maximum_marks;
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
                    item.correctanswer = webURL+"Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + openanswer_questionbank.examinerid+ "/evaluationfile/" + openanswer_questionbank.checking_file;
                    item.questionfinalmarks = openanswer_questionbank.marks;
                    item.openasnwernotetype = openanswer_questionbank.type == 1 ? null : "file"; 
                    item.openasnwernote = openanswer_questionbank.type == 1 ? openanswer_questionbank.answer: webURL + "Docs/Exammodule/OpenAnswerFiles/" + item.universityid + "/" + openanswer_questionbank.examinerid+"/"+openanswer_questionbank.answer; ;
                    totalmarksvalidation = openanswer_questionbank.marks;
                    item.applicantanswer_description = item.anshwesheetpath;
                    item.correctansfileFlag = "file";
                    item.ifopenasnwer = "yes";
                    lst.Add(Convert.ToInt32(openanswer_questionbank.marks));
                }
                if (item.questiontype == "Upload Answer")
                {
                    var downloadsheet_questionbank = db.exam_uploadanswer_master.Where(x => x.questionid == item.questiontype_id).FirstOrDefault();
                    item.question = webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" +downloadsheet_questionbank.examinerid +"/"+downloadsheet_questionbank.questionpath;
                    item.question_extrasheet = downloadsheet_questionbank.extrasheetpath == null ?  null : webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/ExtraSheet/" + downloadsheet_questionbank.extrasheetpath;
                    item.question_extrafile = downloadsheet_questionbank.extrafilepath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/AnyFile/" + downloadsheet_questionbank.extrafilepath;
                    item.correctanswer = webURL + "Docs/Exammodule/questionBankType4/" + item.universityid + "/" + downloadsheet_questionbank.examinerid + "/evalutionfile/" + downloadsheet_questionbank.checking_file;
                    item.questionfinalmarks = downloadsheet_questionbank.marks;
                    totalmarksvalidation = downloadsheet_questionbank.marks;
                    item.correctansfileFlag = "file";
                    item.applicantanswer = webURL + "Docs/Exammodule/AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + item.exampaperid + "/" + item.exampapersheetID+"/"+item.anshwesheetpath;
                    item.applicantanswer_extrafile = item.applicantanswer_exttrasheets == null ? null :webURL + "Docs/Exammodule/AnswerSheet/" + item.universityid + "/" + item.studentid + "/" + item.exampaperid + "/" + item.exampapersheetID + "/extrasheet/" + item.applicantanswer_exttrasheets;
                    item.ifdownloadquestiontype = "yes";
                    lst.Add(Convert.ToInt32(downloadsheet_questionbank.marks));
                }
            }
            lsttotalmarks = lst.Sum();
            allanswer_papersCount = allanswerpapers.Count;
            questionList.DataSource = take1question;
            questionList.DataBind();

            ViewState["answeredpapersheetscount"] = Convert.ToInt32(ViewState["answeredpapersheetscount"]) + 1;
            Session["allQuestions"] = papersheet;

        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var papersheet = (List<exam_answersheet>)Session["allQuestions"];

            int examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
            foreach (DataListItem item in questionList.Items)
            {
                Label lblstudentid = (Label)item.FindControl("lblstudentid");
                int studentid = Convert.ToInt32(lblstudentid.Text);
                
                Label lblanswesheetid = (Label)item.FindControl("lblanswesheetid");
                int answesheetid = Convert.ToInt32(lblanswesheetid.Text);

                Label lbluniversityid = (Label)item.FindControl("lbluniversityid");
                int universityid = Convert.ToInt32(lbluniversityid.Text);

                Label lblexampaperid = (Label)item.FindControl("lblexampaperid");
                int exampaperid = Convert.ToInt32(lblexampaperid.Text);

                Label lblexamdatetime = (Label)item.FindControl("lblexamdatetime");
                DateTime examdatetime = Convert.ToDateTime(lblexamdatetime.Text);
                
                TextBox txtcomments = (TextBox)item.FindControl("txtcomments");
                string comments = txtcomments.Text;

                TextBox txtmarks = (TextBox)item.FindControl("txtmarks");
                string marks = txtmarks.Text;

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
                    objmapping.checked_answersheetPath =fileName;
                }
                objmapping.perquestion_marks = Convert.ToInt32(marks);
                objmapping.checker_comments = comments;
                objmapping.examdatetime = examdatetime;
                db.exam_marking_master.Add(objmapping);
                db.SaveChanges();
                papersheet.RemoveAll(x => x.answesheetid == answesheetid);

                if (papersheet.Count > 0)
                {
                    Session["allQuestions"] = papersheet;
                    bindDataList(universityid, studentid, exampaperid, examdatetime);
                }
                else
                {
                    //if all queshtionsheets are answerd then save final marks and rrelease date
                    showfinalmarks_dateDiv.Attributes.Add("style", "display:block");
                    savedatemarks.Attributes.Add("style", "display:block");
                    var totalmarks = db.exam_marking_master.Where(x => x.universityid == universityid && x.applicantid == studentid && x.examid == exampaperid && x.examdatetime == examdatetime)
                                                   .Select(x => x.perquestion_marks).DefaultIfEmpty(0).Sum();
                    var finalmarks = db.exam_master.Where(x => x.universityID == universityid && x.exampapersid == exampaperid).Select(x => x.maximummarks).FirstOrDefault();

                    txtmarksobtain.Value = totalmarks.ToString();
                    marksobtain = Convert.ToInt32(finalmarks);
                    BindTotalMarks_buildtype(exampaperid);//lbltotalmarks.Text = ;
                    //populatedate_marks(examinerid, exampaperid, studentid, universityid, examdatetime);
                    answer_records.Attributes.Add("style", "display:none");
                    evalutionguid.Attributes.Add("style", "display:none");
                }
            }
               
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public class Record
    {
        public string questiontype { get; set; }
        public int? questionid { get; set; }
        public int marks { get; set; }
        public int exampapers_masterID { get; set; }
    }

    public void BindTotalMarks_buildtype(int examid) {
        try {
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
            lbltotalmarks.Text = lst.Sum().ToString();
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }

    public void Bind_Subject(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.exam_subjectmaster
                         join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                         where cwm.universityID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlsubject.DataSource = group;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void Bind_Group(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.group_master
                         join cwm in db.institutionwisegroupmaster on ap.id equals cwm.groupId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlgroup.DataSource = group;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void Bind_Class(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlclass.DataSource = Class;
            ddlclass.DataTextField = "description";
            ddlclass.DataValueField = "id";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlexaminer.ClearSelection();
        ddlexam.ClearSelection();
        ddlexamdate.ClearSelection();
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubject.ClearSelection();
        ddlexaminer.ClearSelection();
        ddlexam.ClearSelection();
        ddlexamdate.ClearSelection();
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubject.ClearSelection();
        ddlexaminer.ClearSelection();
        ddlexam.ClearSelection();
        ddlexamdate.ClearSelection();
    }
}