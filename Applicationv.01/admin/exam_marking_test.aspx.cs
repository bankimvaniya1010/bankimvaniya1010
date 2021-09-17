using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_exam_marking_test : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    public string evalutionfile, buildevalutionfile, questiontype;
    public int lsttotalmarks;
    public string totalmarksvalidation, marksobtain;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int allanswer_papersCount, allChecked_papersheetscount;
    public List<Data> applicantlist = new List<Data>();

    public static DateTime examdatetime;
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
                Universities = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
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
        txtpasskey.Value = "";
        showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
        divGrid.Attributes.Add("style", "display:none;");
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
        txtpasskey.Value = "";
        showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
        divGrid.Attributes.Add("style", "display:none;");
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubject.ClearSelection();
        ddlexaminer.ClearSelection();
        ddlexam.ClearSelection();
        ddlexamdate.ClearSelection();
        txtpasskey.Value = "";
        showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
        divGrid.Attributes.Add("style", "display:none;");
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubject.ClearSelection();
        ddlexaminer.ClearSelection();
        ddlexam.ClearSelection();
        ddlexamdate.ClearSelection();
        txtpasskey.Value = "";
        showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
        divGrid.Attributes.Add("style", "display:none;");
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
        txtpasskey.Value = "";
        showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
        divGrid.Attributes.Add("style", "display:none;");
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
        txtpasskey.Value = "";
        showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
        divGrid.Attributes.Add("style", "display:none;");
    }

    private void BindExamDate(int examinerid, int examid)
    {
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
        if (ddlexamdate.SelectedValue != "0")
        {
            int selecteduniversityid = Convert.ToInt32(ddluniversity.SelectedValue);
            int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selecteddate = Convert.ToDateTime(ddlexamdate.SelectedValue);
            txtpasskey.Value = "";
            showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
            divGrid.Attributes.Add("style", "display:none;");
            examdatetime = Convert.ToDateTime(ddlexamdate.SelectedValue);
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {

            int selecteduniversityid = Convert.ToInt32(ddluniversity.SelectedValue);
            int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selecteddate = Convert.ToDateTime(ddlexamdate.SelectedValue);
            
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examchecking_assignment.Where(x => x.ExamId == selectedexamid && x.scheduledate_time == selecteddate && x.institutionId == selecteduniversityid && x.examinerId == selectedexaminerId).Select(x => x.examiner_passkey).FirstOrDefault();
            var examtype = db.exam_master.Where(x => x.universityID == selecteduniversityid && x.exampapersid == selectedexamid).Select(x => x.uploadtype).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                examdatetime = Convert.ToDateTime(ddlexamdate.SelectedValue);
                showfinalmarks_dateDiv.Attributes.Add("style", "display:block;");
                divGrid.Attributes.Add("style", "display:block;");
                BindTable(selectedexamid, selecteduniversityid, selecteddate);
                populatedate_marks(selectedexaminerId, selectedexamid, selecteduniversityid, selecteddate);
            }
            else
            {
                showfinalmarks_dateDiv.Attributes.Add("style", "display:none;");
                divGrid.Attributes.Add("style", "display:none;");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public class Data
    {
        public int? applicantid { get; set; }
        public int? universityid { get; set; }
        public int? examid { get; set; }
        public int? assignid { get; set; }
        public string applicantname { get; set; }
        public string is_studentactiveforexam { get; set; }
        public string toshow { get; set; }
        public string is_active { get; set; }
        public string rejectionreason { get; set; }
        public string examstatus { get; set; }
        public int answercount { get; set; }
        public string showcheckbox { get; set; }
        public string showTextbox { get; set; }
        public DateTime? loggedintime { get; set; }
        public DateTime? lblansweruplodedtime { get; set; }
        public string lblansweruploded { get; set; }
        public string showtime { get; set; }
        public DateTime? exam_datetime { get; set; }
        public string status { get; set; }
        public string paper_name { get; set; }
        public string universityname { get; set; }
        public string isexamchecked { get; set; }
        public int? examuploadtype { get; set; }
        public string link { get; set; }
        public string toshowshowlink { get; set; }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Getstudentstatus(int examid,int universityid,int examinerID)
    {
        GTEEntities db1 = new GTEEntities();
        //DateTime examdatetime = Convert.ToDateTime(HttpContext.Current.Session["examdate"]);
        string webURL = Utility.GetWebUrl();
        var applicantlist = (from ea in db1.exam_assign
                         join um in db1.university_master on universityid equals um.universityid
                         join em in db1.exam_master on ea.exampapersid equals em.exampapersid
                         join ap in db1.applicantdetails on ea.applicantid equals ap.applicantid
                         where ea.exampapersid == examid && ea.exam_datetime == examdatetime && ap.universityid == universityid && ea.universityID == universityid && um.IsDeleted != 1
                             select new Data
                         {
                             applicantid = ea.applicantid,
                             universityid = ea.universityID,
                             examid = ea.exampapersid,
                             assignid = ea.assignid,
                             applicantname = ap.firstname + " " + ap.lastname,
                             exam_datetime = ea.exam_datetime,
                             status = ea.status,
                             paper_name = em.exam_name,
                             universityname = um.university_name,
                             isexamchecked = "No",
                             toshowshowlink = null,
                             examuploadtype = em.uploadtype,
                             link = webURL + "admin/applicantanswersheets.aspx?ID=" + ea.assignid + "&examinerid=" + examinerID,
                         }).ToList();
        foreach (var item in applicantlist)
        {
            if (item.status != "Completed" || item.status != "Disqualified")
            {
                item.isexamchecked = "No";
            }
            var answersheets = db1.exam_answersheet.Where(x => x.applicantid == item.applicantid && x.universityID == item.universityid && x.exampaperid == item.examid && x.exam_datetime == item.exam_datetime).ToList();

            var examchecked = db1.exam_marking_master.Where(x => x.applicantid == item.applicantid && x.universityid == item.universityid && x.examid == item.examid && x.examdatetime == item.exam_datetime).ToList();

            if (item.examuploadtype == 1 || item.examuploadtype == 2)
            {
                if (answersheets.Count == examchecked.Count)
                {
                    if (item.status == "Completed" || item.status == "Disqualified")
                        item.isexamchecked = "Yes";
                    else
                        item.isexamchecked = "No";
                }
                else
                    item.isexamchecked = "No";
            }
            else if ( item.examuploadtype ==3)
            {
                if (examchecked != null && examchecked.Count > 0)
                    item.isexamchecked = "Yes";
                else
                    item.isexamchecked = "No";
            }
           
            if (item.status == "Completed" || item.status == "Disqualified")
                item.toshowshowlink = "Yes";
            else
                item.toshowshowlink = null;

        }
        return JsonConvert.SerializeObject(applicantlist);
    }

    private void BindTable(int examId,int universityid, DateTime exam_datetime)
    {
        try
        {
            int examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
            applicantlist = (from ea in db.exam_assign
                                 join um in db.university_master on universityid equals um.universityid
                                 join em in db.exam_master on ea.exampapersid equals em.exampapersid
                                 join ap in db.applicantdetails on ea.applicantid equals ap.applicantid
                                 where ea.exampapersid == examId && ea.exam_datetime == exam_datetime && ap.universityid == universityid && ea.universityID == universityid && um.IsDeleted != 1
                             select new Data
                                 {
                                     applicantid = ea.applicantid,
                                     universityid = ea.universityID,
                                     examid = ea.exampapersid,
                                     assignid = ea.assignid,
                                     applicantname = ap.firstname + " " + ap.lastname ,
                                     exam_datetime = ea.exam_datetime,
                                     status = ea.status,
                                     paper_name = em.exam_name,
                                     universityname = um.university_name,
                                     isexamchecked = "No",
                                     toshowshowlink = null,
                                     examuploadtype = em.uploadtype,
                                     link = webURL + "admin/applicantanswersheets.aspx?ID=" + ea.assignid + "&examinerid=" + examinerid,
        }).ToList();
            foreach (var item in applicantlist) {
                if (item.status != "Completed" || item.status != "Disqualified")
                {
                    item.isexamchecked = "No";
                }
                var answersheets = db.exam_answersheet.Where(x => x.applicantid == item.applicantid && x.universityID == item.universityid && x.exampaperid == item.examid && x.exam_datetime == item.exam_datetime).ToList();

                var examchecked = db.exam_marking_master.Where(x => x.applicantid == item.applicantid && x.universityid == item.universityid && x.examid == item.examid && x.examdatetime == item.exam_datetime).ToList();

                if (item.examuploadtype == 1|| item.examuploadtype == 2)
                {
                    if (answersheets.Count == examchecked.Count)
                    {
                        if (item.status == "Completed" || item.status == "Disqualified")
                            item.isexamchecked = "Yes";
                        else
                            item.isexamchecked = "No";
                    }
                    else
                        item.isexamchecked = "No";
                }
                else if(item.examuploadtype == 3)
                {
                    if (examchecked != null && examchecked.Count > 0)
                        item.isexamchecked = "Yes";
                    else
                        item.isexamchecked = "No";
                }
                
                if (item.status == "Completed" || item.status == "Disqualified")
                    item.toshowshowlink = "Yes";
                else
                    item.toshowshowlink = null;
            }

            Grid.DataSource = applicantlist.ToList();
            Grid.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

   
    protected void btnsavedatemarks_Click(object sender, EventArgs e)
    {
        try
        {
            int examid = Convert.ToInt32(ddlexam.SelectedValue);            
            int examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
            DateTime examdatetime = Convert.ToDateTime(ddlexamdate.SelectedValue);
            int universityid = Convert.ToInt32(ddluniversity.SelectedValue);
            //string finalmrksentered = txtmarksobtain.Value;
            DateTime dateofrelease = Convert.ToDateTime(selectedexamdate_time.Value);
            DateTime dateofreleaseutc = Convert.ToDateTime(hidexamutcdatetime.Value);
            string TimeZone = hidTimeZone.Value;

            var examdata = db.exam_master.Where(x => x.exampapersid == examid).FirstOrDefault();

            var applicantlist = (from ea in db.exam_assign
                                 where ea.exampapersid == examid && ea.exam_datetime == examdatetime && ea.universityID == universityid
                                 select new Data
                                 {
                                    applicantid = ea.applicantid,
                                    universityid = ea.universityID,
                                    examid = ea.exampapersid,
                                    assignid = ea.assignid,
                                    exam_datetime = ea.exam_datetime,
                                    status = ea.status,
                                    isexamchecked = "NO",
                                 }).ToList();
            dynamic showalert = false;
            foreach (var item in applicantlist)
            {
                if (item.status == "Completed" || item.status == "Disqualified")
                {
                    var exammarks = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == item.applicantid && x.universityid == item.universityid && x.examid == item.examid && x.examdate_time == item.exam_datetime).FirstOrDefault();
                    if (exammarks == null)
                    {
                        showalert = true;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please check the assessment for all applicants first.')", true);
                        break;
                    }
                    else
                        item.isexamchecked = "Yes";
                }
            }
            if (showalert == false)
            {
                foreach (var data in applicantlist)
                {
                    if(data.status == "Completed" || data.status == "Disqualified")
                    {
                        if (data.isexamchecked == "Yes")
                        {
                            var mode = "new";
                            exam_applicantmarks_releasedatemaster objmappping = new exam_applicantmarks_releasedatemaster();

                            var data1 = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == data.applicantid && x.universityid == data.universityid && x.examinerid == examinerid && x.examdate_time == examdatetime).FirstOrDefault();
                            if (data1 != null)
                            {
                                mode = "update";
                                objmappping = data1;
                            }
                            objmappping.applicantid = data.applicantid;
                            objmappping.examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
                            objmappping.examid = Convert.ToInt32(ddlexam.SelectedValue);
                            objmappping.universityid = Convert.ToInt32(universityid);
                            objmappping.examdate_time = Convert.ToDateTime(ddlexamdate.SelectedValue);
                            //objmappping.finalmarks = txtmarksobtain.Value;
                            objmappping.releasedate = Convert.ToDateTime(selectedexamdate_time.Value);
                            objmappping.releasedate_timezone = TimeZone;
                            //objmappping.totalmarks = lbltotalmarks.Text;
                            objmappping.releasedateutc = dateofreleaseutc;
                            objmappping.exammarks_saved_at = Convert.ToDateTime(DateTime.Now);
                            objmappping.examdate_saved_at = Convert.ToDateTime(DateTime.Now);

                            if (mode == "new")
                                db.exam_applicantmarks_releasedatemaster.Add(objmappping);
                            db.SaveChanges();

                            // send mail to student the date of release
                            var examname = db.exam_master.Where(x => x.exampapersid == objmappping.examid).FirstOrDefault();
                            var studentDetails = db.students.Where(x => x.studentid == objmappping.applicantid).FirstOrDefault();
                            var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == objmappping.universityid).FirstOrDefault();

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
                            populatedate_marks(examinerid, examid, universityid, examdatetime);
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void populatedate_marks(int examinerid, int examid, int universityid, DateTime examdatetime)
    {
        try
        {
            var data = db.exam_applicantmarks_releasedatemaster.Where(x => x.universityid == universityid && x.examid == examid && x.examinerid == examinerid && x.examdate_time == examdatetime).FirstOrDefault();

            if (data != null)
            {
                //txtmarksobtain.Attributes.Add("disabled", "disabled");
                //txtmarksobtain.Value = data.finalmarks;

                //lblmarkssaveat.InnerText = "Record saved at : " + data.exammarks_saved_at.ToString();
                if (data.releasedate != null)
                {
                    date_edit.Attributes.Add("style", "display:none");
                    lbldates_saved.Attributes.Add("style", "display:block");
                    lblreleasedatetime.InnerText = data.releasedate.ToString() + " < " + data.releasedate_timezone.ToString() + " >";
                    lblreleasedatetimeutc.InnerText = "UTC : " + data.releasedateutc.ToString();
                    lbldatesaved_at.InnerText = "Record saved at : " + data.examdate_saved_at.ToString();
                    btnsavedatemarks.Attributes.Add("style", "display:none");
                }
            }
            else if (data == null)
            {
                btnsavedatemarks.Attributes.Add("style", "display:block");
                date_edit.Attributes.Add("style", "display:block");
                lbldates_saved.Attributes.Add("style", "display:none");
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int assignID = Convert.ToInt32(e.CommandArgument);
            int examinerid = Convert.ToInt32(ddlexaminer.SelectedValue);
            if (e.CommandName.Equals("View"))
            {
                
                Response.Redirect(webURL + "admin/applicantanswersheets.aspx?ID=" + assignID + "&examinerid="+ examinerid, true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblstatus = (Label)e.Row.FindControl("lblstatus");
                LinkButton lnkView = ((LinkButton)e.Row.FindControl("lnkView"));

                if (lblstatus.Text == "Completed" || lblstatus.Text == "Disqualified")
                    lnkView.Attributes.Add("style", "display:block");
                else
                    lnkView.Attributes.Add("style", "display:none");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}