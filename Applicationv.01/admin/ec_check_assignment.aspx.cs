using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_check_assignment : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int adminId, universityID, RecordID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int applicantCount = 0, checked_assignmentcount, applicantCount_whosubmittedassignment;
    public string is_stopdateexpired="No", timezone_txt, resultdate_txt, resultdate_utc_txt;
    List<data> dataList = new List<data>();
    public int? is_result_declared = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        adminId = Convert.ToInt32(Session["UserID"]);
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        
        if (!IsPostBack)
        {
            BindDropdowns();
            
        }
    }
    //private void populate(int classID)
    //{
    //    try
    //    {
    //        var data = db.ec_class_master.Where(x => x.id == classID).FirstOrDefault();
    //        if (data.gradeid != null)
    //        {
    //            ddlgrade.ClearSelection();
    //            ddlgrade.Items.FindByValue(data.gradeid.ToString()).Selected = true;
    //        }
    //        if (data.subjectid != null)
    //        {
    //            ddlsubject.ClearSelection();
    //            ddlsubject.Items.FindByValue(data.subjectid.ToString()).Selected = true;
    //        }
    //    }
    //    catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    //}

    private void BindDropdowns()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");

            var grade = db.ec_grademaster.ToList();
            ddlgrade.DataSource = grade;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            var subject = db.subjectmaster.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

            var clas = db.ec_class_master.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void GetClass(int gradeID, int subjectID)
    {

        var temp = (from x in db.ec_class_master
                    where x.universityid == universityID && x.gradeid == gradeID && x.subjectid == subjectID
                    select new
                    {
                        fieldname = x.classname,
                        id = x.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        ListItem lst = new ListItem("Please select", "0");
        ddlclass.DataSource = temp;
        ddlclass.DataTextField = "fieldname";
        ddlclass.DataValueField = "id";
        ddlclass.DataBind();
        ddlclass.Items.Insert(0, lst);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
            int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
            int classID = Convert.ToInt32(ddlclass.SelectedValue);
            
            int assignmentID = Convert.ToInt32(ddlassignment.SelectedValue);
            int assignment_dateID = Convert.ToInt32(ddlassignmentdate.SelectedValue);

            //check if assignment is build or upload 
            var assignmenttype = db.ec_assignment_master.Where(x => x.id == assignmentID).FirstOrDefault();
            if (assignmenttype != null && assignmenttype.assignment_type == 1)
            {
                showBuildDiv.Attributes.Add("style", "display:block");
                showuploadexamDiv.Attributes.Add("style", "display:none");
            }
            else
            {
                showBuildDiv.Attributes.Add("style", "display:none");
                showuploadexamDiv.Attributes.Add("style", "display:block");
            }

            showfinalmarks_dateDiv.Attributes.Add("style","display:block");
            savedatemarks.Attributes.Add("style", "display:block");
            stoptimelbl.Attributes.Add("style", "display:block");

            BindGrid(gradeID, subjectID, classID, assignmentID, assignment_dateID);
            //
            //if (is_result_declared == 1)
            //{
            //    showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
            //    lbldates_saved.Attributes.Add("style", "display:block;");
            //    savedatemarks.Attributes.Add("style", "display:none;");
            //    lbltimezone.InnerText = timezone_txt;
            //    lblreleasedatetime.InnerText = resultdate_txt;
            //    lblreleasedatetimeutc.InnerText = "[UTC]"+resultdate_utc_txt;
            //}
            //else
            //    showfinalmarks_dateDiv.Attributes.Add("style", "display:block;");

            //calculate stop date
            var stopdate = db.ec_assignments_assignschedule_date_master.Where(x => x.asmd_id == assignment_dateID).FirstOrDefault();
            if (stopdate != null) {
                if(stopdate.asmd_stop_time != null)
                    lblstopdate.Text = stopdate.asmd_stop_time +" (UTC)" + stopdate.asm_stop_utc_date;
            }
            DateTime? currentdate_time = DateTime.UtcNow;
            if (stopdate.asm_stop_utc_date < currentdate_time)
                is_stopdateexpired = "yes";
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        showBuildDiv.Attributes.Add("style", "display:none");
        showuploadexamDiv.Attributes.Add("style", "display:none");
        lbldates_saved.Attributes.Add("style", "display:none");
        stoptimelbl.Attributes.Add("style", "display:none");

        string gradeID = ddlgrade.SelectedValue;
        string subjectID = ddlsubject.SelectedValue;
        int classID = Convert.ToInt32(ddlclass.SelectedValue);

        GetAssignment(classID, gradeID, subjectID);
    }
    public class assigndetail {
        public int id { get; set; }
        public string assignment_name { get; set; }
        public string assignment_id { get; set; }
    }
       
    private void GetAssignment(int classid, string gradeid, string subjectid)
    {
        try
        {

            var temp = (from am in db.ec_assignments_assign
                        join ms in db.ec_assignment_master on am.assignmentId equals ms.id
                        where ms.subjectid.Contains(subjectid) && ms.gradeid.Contains(gradeid) && ms.self_check !=1
                        select new {
                            assignment_name= ms.assignment_name,
                            id= ms.id,
                        }).ToList().Distinct();  
            
            ListItem lst = new ListItem("Please select", "0");
            ddlassignment.DataSource = temp;
            ddlassignment.DataTextField = "assignment_name";
            ddlassignment.DataValueField = "id";
            ddlassignment.DataBind();
            ddlassignment.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        showBuildDiv.Attributes.Add("style", "display:none");
        showuploadexamDiv.Attributes.Add("style", "display:none");
        lbldates_saved.Attributes.Add("style", "display:none");
        stoptimelbl.Attributes.Add("style", "display:none");

        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);

        GetClass(gradeID, subjectID);
    }
    protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int classID = Convert.ToInt32(ddlclass.SelectedValue);

        int assignmentID = Convert.ToInt32(ddlassignment.SelectedValue);
        int assignment_dateID = Convert.ToInt32(ddlassignmentdate.SelectedValue);

        BindGrid(gradeID, subjectID, classID, assignmentID, assignment_dateID);

    }

    protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Upload")
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int assignID = Convert.ToInt32(GridView.DataKeys[index].Value);
                GridViewRow row = GridView.Rows[index];
                FileUpload fileupload_checkedsheet = (FileUpload)row.FindControl("fileupload_checkedsheet") as FileUpload;
                HiddenField lblanswersheetid = (HiddenField)row.FindControl("lblanswersheetid") as HiddenField;
                Label lblapplicantid = (Label)row.FindControl("lblapplicantid") as Label;
                TextBox txtmarks = (TextBox)row.FindControl("txtmarks") as TextBox;
                Label lblmarks = (Label)row.FindControl("Label1") as Label;

                int totalmarks = 0;

                if (lblmarks != null && !string.IsNullOrEmpty(lblmarks.Text))
                    totalmarks = Convert.ToInt32(lblmarks.Text);
                int marksobtain = -1;

                if (txtmarks != null && !string.IsNullOrEmpty(txtmarks.Text))
                    marksobtain = Convert.ToInt32(txtmarks.Text);

                var data = db.ec_assignment_checked_master.Where(x => x.id == assignID).FirstOrDefault();
                if (marksobtain != -1 && marksobtain <= totalmarks)
                {
                    if (fileupload_checkedsheet.HasFile)
                    {
                        var mode = "new";
                        ec_assignment_checked_master obj = new ec_assignment_checked_master();
                        if (data != null)
                        {
                            mode = "update";
                            obj = data;
                        }
                        docPath = docPath + "/Eclass_Service/Assignment_check/" + universityID + "/" + lblapplicantid.Text + "/" + assignID + "/Checked/";
                        string path = docPath;
                        string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload_checkedsheet.PostedFile.FileName));
                        string filePath = string.Concat(path, fileName);
                        if (!Directory.Exists(path))
                            Directory.CreateDirectory(path);
                        fileupload_checkedsheet.PostedFile.SaveAs(filePath);
                        obj.checkedfile_path_by_admin = fileName;
                        obj.is_assignment_checked = 1;
                        obj.applicantid = Convert.ToInt32(lblapplicantid.Text);
                        obj.assignId = assignID;
                        obj.universityid = universityID;
                        obj.adminid = adminId;
                        obj.answersheetid = Convert.ToInt32(lblanswersheetid.Value);
                        if (mode == "new")
                            db.ec_assignment_checked_master.Add(obj);
                        db.SaveChanges();
                        //also update in asign master 
                        //save to assign

                        var mode1 = "new";
                        ec_assignments_assign objexam_assign = new ec_assignments_assign();
                        var examassign = db.ec_assignments_assign.Where(x => x.assignId == assignID).FirstOrDefault();

                        if (examassign != null)
                        {
                            mode1 = "update";
                            objexam_assign = examassign;
                        }
                        objexam_assign.status = 3;
                        objexam_assign.Is_assignment_checked = 1;
                        objexam_assign.marks = Convert.ToInt32(txtmarks.Text);
                        objexam_assign.total_marks = totalmarks;
                        if (mode1 == "new")
                            db.ec_assignments_assign.Add(objexam_assign);
                        db.SaveChanges();

                        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
                        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
                        int classID = Convert.ToInt32(ddlclass.SelectedValue);

                        int assignmentID = Convert.ToInt32(ddlassignment.SelectedValue);
                        int assignment_dateID = Convert.ToInt32(ddlassignmentdate.SelectedValue);

                        BindGrid(gradeID, subjectID, classID, assignmentID, assignment_dateID);

                    }
                    else
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Select file to upload.')", true);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter valid marks .')", true);
            }
            catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        }
    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void btnsavedatemarks_Click(object sender, EventArgs e)
    {
        try
        {
            //int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
            //int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
            //int classID = Convert.ToInt32(ddlclass.SelectedValue);

            int assignmentID = Convert.ToInt32(ddlassignment.SelectedValue);
            int assignment_dateID = Convert.ToInt32(ddlassignmentdate.SelectedValue);

            var List_data = (from exam in db.ec_assignments_assign
                                  where exam.universityid == universityID && exam.assignmentId == assignmentID && exam.assignment_date_id == assignment_dateID
                             select new data()
                                  {
                                      id = exam.assignId,
                                      //applicantid = x.studentid,
                                      ///studentname = x.name,
                                      statusId = exam.status,
                                      //submissionstatus = status.description,
                                      //checkedstatus = fd.is_assignment_checked == 1 ? "Checked" : "Not Checked",
                                      is_assignment_checked = exam.Is_assignment_checked,
                                      student_assignment_URL = null,
                                      //student_assignment_URL = exam.Is_assignemtCompleted != 1 ? null : webURL + "Docs//Eclass_Service/Assignments_AnswerSheet/" + exam.universityid + "/" + exam.applicantId + "/" + exam.assignId + "/" + amx.anshwesheetpath,
                                      //checkedsheet = string.IsNullOrEmpty(fd.checkedfile_path_by_admin) ? null : webURL + "Docs/Eclass_Service/Assignment_check/" + universityID + "/" + exam.applicantId + "/" + exam.assignId + "/Checked/" + fd.checkedfile_path_by_admin,
                                      is_checked = null,
                                      toshow = null,
                                  }).OrderBy(x => x.id).ToList();
            foreach (var item in List_data) {
                var mode = "new";
                ec_assignments_assign objexam_assign = new ec_assignments_assign();
                //save realse date
                var data = db.ec_assignments_assign.Where(x => x.assignId == item.id).FirstOrDefault();
                if (data != null)
                {
                    mode = "update";
                    objexam_assign = data;
                }
                if (item.statusId == 3 || item.is_assignment_checked == 1)
                {
                    objexam_assign.Is_result_declared = 1;
                    objexam_assign.result_release_timezone = hidTimeZone.Value;
                    objexam_assign.result_release_datetime = Convert.ToDateTime(selectedexamdate_time.Value);
                    objexam_assign.result_release_datetime_utc = Convert.ToDateTime(hidexamutcdatetime.Value);
                   
                    
                }
                else {
                    //other marked as expired if assignment is not submitted by applicant
                    
                    objexam_assign.status = 4;//expired
                    
                }
                if (mode == "new")
                    db.ec_assignments_assign.Add(objexam_assign);
                db.SaveChanges();

                int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
                int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
                int classID = Convert.ToInt32(ddlclass.SelectedValue);
                
                BindGrid(gradeID, subjectID, classID, assignmentID, assignment_dateID);

            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindGrid(int gradeID=0, int subjectID=0, int ClassID=0,int assignmentID=0, int dateid=0)
    {
        try
        {
            checked_assignmentcount = 0;
            
            dataList = (from exam in db.ec_assignments_assign
                            
                            //join file in db.ec_assignment_checked_master on exam.assignId equals file.assignId into filedata
                            //from fd in filedata.DefaultIfEmpty()

                            join status in db.ec_status_master on exam.status equals status.id

                            join em in db.students on exam.applicantId equals em.studentid into data
                            from x in data.DefaultIfEmpty()

                        join asm in db.ec_assignment_master on exam.assignmentId equals asm.id into asm_data
                        from asmm in asm_data.DefaultIfEmpty()

                        where exam.universityid == universityID && exam.assignmentId == assignmentID && exam.assignment_date_id == dateid 
                            select new data()
                            {
                                id = exam.assignId,
                                assignment_id = exam.assignmentId,
                                applicantid = x.studentid,
                                studentname = x.name,
                                statusId =exam.status,
                                submissionstatus = status.description,
                                checkedstatus = exam.Is_assignment_checked == 1 ? "Checked" : "Not Checked",
                                is_assignment_checked = exam.Is_assignment_checked,
                                student_assignment_URL =null,
                                //student_assignment_URL = exam.Is_assignemtCompleted != 1 ? null : webURL + "Docs//Eclass_Service/Assignments_AnswerSheet/" + exam.universityid + "/" + exam.applicantId + "/" + exam.assignId + "/" + amx.anshwesheetpath,
                                //checkedfile_path_by_admin = fd.checkedfile_path_by_admin,
                                is_checked = null,
                                toshow= null,
                                isresultDeclared = exam.Is_result_declared, 
                                marks_obtained= exam.marks,
                                marks_total=0,
                                timezone = exam.result_release_timezone,
                                result_date = exam.result_release_datetime,
                                result_date_utc =exam.result_release_datetime_utc,
                                toshow_txtmarks=null,
                                toshow_lblmarks = null,
                                assessment_type= asmm.assignment_type,
                                build_assignment_URL = null,

                            }).OrderBy(x => x.id).ToList();

            foreach (var item in dataList)
            {   
                int assignid = item.id;
                
                var asnwersheetdata = db.ec_assignment_answersheet.Where(x => x.assignID == item.id && x.ispdfgenrated == 1).FirstOrDefault();

                if (item.is_assignment_checked == 1 && asnwersheetdata != null)
                {
                    var checked_data = db.ec_assignment_checked_master.Where(x => x.assignId == assignid && x.answersheetid == asnwersheetdata.answesheetid).FirstOrDefault();
                    if(checked_data != null)
                        item.checkedsheet = webURL + "Docs/Eclass_Service/Assignment_check/" + universityID + "/" + item.applicantid + "/" + assignid + "/Checked/" + checked_data.checkedfile_path_by_admin;
                }
                if (item.assessment_type == 2)
                {
                    var asnwersheetdata_pdfdata = db.ec_assignment_answersheet.Where(x => x.assignID == item.id && x.ispdfgenrated == 1).FirstOrDefault();

                    if (asnwersheetdata_pdfdata != null)
                    {
                        item.answersheetid = asnwersheetdata_pdfdata.answesheetid;
                        if (asnwersheetdata_pdfdata != null && asnwersheetdata_pdfdata.genratedanswerpdfPath != null)
                            item.student_assignment_URL = webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + universityID + "/" + item.applicantid + "/" + item.id + "/" + asnwersheetdata_pdfdata.genratedanswerpdfPath;
                    }
                    else
                    {
                        if (asnwersheetdata != null)
                        {
                            if (asnwersheetdata.answesheetid != 0)
                                item.answersheetid = asnwersheetdata.answesheetid;
                            item.student_assignment_URL = webURL + "Docs/Eclass_Service/Assignments_AnswerSheet/" + universityID + "/" + item.applicantid + "/" + item.id + "/" + asnwersheetdata.anshwesheetpath;
                        }
                    }
                    
                }
                else if (item.assessment_type == 1) {
                    if(item.statusId == 2 || item.statusId == 3|| item.statusId == 4 )
                        item.build_assignment_URL =webURL+ "admin/ec_chec_assignment_build.aspx?ID="+assignid+ "&assign_date="+ dateid;
                }
                var total_marks = db.ec_assignment_papers_master.Where(x => x.assignmentid == item.assignment_id).FirstOrDefault();
                if (total_marks != null)
                    item.marks_total = total_marks.marks;

                if (item.student_assignment_URL == null)
                    item.toshow = "yes";

                if (item.is_assignment_checked == 1)
                {
                    checked_assignmentcount = checked_assignmentcount + 1;
                    item.is_checked = "yes";
                    item.toshow = "yes";
                    item.toshow_txtmarks = "1";
                }

                if (item.checkedsheet != null)
                    applicantCount_whosubmittedassignment = applicantCount_whosubmittedassignment + 1;

                if (item.isresultDeclared == 1)
                {
                    is_result_declared = 1;
                    timezone_txt = item.timezone;
                    resultdate_txt = item.result_date.ToString();
                    resultdate_utc_txt = item.result_date_utc.ToString();
                }
            }

            applicantCount = dataList.Count;

            GridView.DataSource = dataList;
            GridView.DataBind();

            GridView_build.DataSource = dataList;
            GridView_build.DataBind();


            if (is_result_declared == 1)
            {
                showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
                lbldates_saved.Attributes.Add("style", "display:block;");
                savedatemarks.Attributes.Add("style", "display:none;");
                lbltimezone.InnerText = timezone_txt;
                lblreleasedatetime.InnerText = resultdate_txt;
                lblreleasedatetimeutc.InnerText = " [UTC] " + resultdate_utc_txt;
            }
            else
                showfinalmarks_dateDiv.Attributes.Add("style", "display:block;");

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public class data
    {
        public int id { get; set; }
        public string build_assignment_URL { get; set; }
        public string checkedfile_path_by_admin { get; set; }
        public int? assessment_type { get; set; }
        public int? assignment_id{ get; set; }
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
        public string timezone{ get; set; }
        public DateTime? result_date { get; set; }
        public DateTime? result_date_utc { get; set; }
    }

    protected void ddlassignment_SelectedIndexChanged(object sender, EventArgs e)
    {
        showBuildDiv.Attributes.Add("style", "display:none");
        showuploadexamDiv.Attributes.Add("style", "display:none");
        lbldates_saved.Attributes.Add("style", "display:none");
        stoptimelbl.Attributes.Add("style", "display:none");

        int gradeid = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
        int classid = Convert.ToInt32(ddlclass.SelectedValue);
        string assignmentid = ddlassignment.SelectedValue;
        int assignment_id = Convert.ToInt32(ddlassignment.SelectedValue);

        BindAssignmentDate(gradeid, subjectid, classid, assignmentid, assignment_id);
    }
    private void BindAssignmentDate(int gradeid, int subjectid, int classid, string assignmentid, int assignment_id) {
        try {

            var data = (from sm in db.ec_assignments_assignschedule_master
                        join date in db.ec_assignments_assignschedule_date_master on sm.asm_id equals date.assignschedule_id
                        where sm.asm_universityid == universityID && sm.asm_grade_id == gradeid && sm.asm_subject_id == subjectid && sm.asm_class_id == classid &&
                        sm.asm_assignment_id.Contains(assignmentid) && date.assignment_id == assignment_id
                        select new
                        {
                            dateid = date.asmd_id,
                            date = date.asmd_start_date,
                        }).ToList();
            ListItem lst = new ListItem("Please select", "0");
            ddlassignmentdate.DataSource = data;
            ddlassignmentdate.DataTextField = "date";
            ddlassignmentdate.DataValueField = "dateid";
            ddlassignmentdate.DataBind();
            ddlassignmentdate.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void GridView_build_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridView_build_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GridView_build_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void GridView_build_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}