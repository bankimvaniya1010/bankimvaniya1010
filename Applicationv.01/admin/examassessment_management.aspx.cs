using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_examassessment_management : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    public string isactive;
    public List<Data> applicantlist = new List<Data>();
    public static int isalertshown = 0;
    public int isexamautostart;
    public static DateTime? loggedindatetime;
    public static string publictimezone;
    public static string sessionreadingTime, sessionwritingTime, sessionUploadTime;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (rejectionlist.SelectedValue != null)
            btnsave.Text ="Mark " +rejectionlist.SelectedItem.Text ;
        if (!IsPostBack)
        {
            BindUniversity();
        }
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

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniversityid);
    }

    private void BindExaminer(int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x => x.universityId == universityId && x.roleid == 10).ToList();
            ddlexaminer.DataSource = examinerId;
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
        creatediv.Attributes.Add("style", "display:none");
        txtpasskey.Value = "";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedexaminerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                validateDiv.Attributes.Add("style", "display:none");
                creatediv.Attributes.Add("style", "display:block");
                Bind_Class(selecteduniversityid);
                Bind_Group(selecteduniversityid);
                Bind_Subject(selecteduniversityid);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubjcet.ClearSelection();
        ddlgroup.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        tblcontent.Attributes.Add("style", "display:none");
        refreshtbl.Attributes.Add("style", "display:none");
        tiemzone.Value = "";

    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubjcet.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        tblcontent.Attributes.Add("style", "display:none");
        refreshtbl.Attributes.Add("style", "display:none");
        tiemzone.Value = "";
    }
    protected void ddlsubjcet_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        tblcontent.Attributes.Add("style", "display:none");
        refreshtbl.Attributes.Add("style", "display:none");
        tiemzone.Value = "";
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminer = Convert.ToInt32(ddlexaminer.SelectedValue);
        int classid = Convert.ToInt32(ddlclass.SelectedValue);
        int groupid = Convert.ToInt32(ddlgroup.SelectedValue);
        string subjectID = ddlsubjcet.SelectedValue;

        BindSheduledExamPaper(selecteduniversityid, classid, groupid, subjectID, selectedexaminer);
    }
    private void BindSheduledExamPaper(int universityid, int classid, int groupid, string subjectid, int proctorID)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = (from a in db.exam_master
                         join q in db.exam_assign on a.exampapersid equals q.exampapersid into cmdata
                         from x in cmdata.DefaultIfEmpty()
                         where x.proctorid == proctorID && a.universityID == universityid && x.universityID == universityid && a.classid == classid && a.groupid == groupid && a.exam_subject == subjectid
                         select new
                         {
                             exam_name = a.exam_name,
                             exampapersid = a.exampapersid
                         }).Distinct().ToList();
            ddlexam.DataSource = paper;
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
        ddlExamDateTime.ClearSelection();
        btnstart.Visible = false;
        tblcontent.Attributes.Add("style", "display:none");
        refreshtbl.Attributes.Add("style", "display:none");
        tiemzone.Value = "";
        tblcontent.Attributes.Add("style", "display:none");
        int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
        int selectedproctorId = Convert.ToInt32(ddlexaminer.SelectedValue);
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExamDateTime(selectedexampapersid, selectedproctorId, selecteduniversityid);
    }
    private void BindExamDateTime(int examid, int proctorid, int universityid)
    {
        try
        {
            List<datetimeclass> list_final = new List<datetimeclass>();

            ListItem lst = new ListItem("Please select", "0");
            var examdate = (from es in db.exam_schedule
                            join em in db.exam_assign on es.exam_datetime equals em.exam_datetime
                            where em.proctorid == proctorid && em.exampapersid == examid && em.universityID == universityid
                            select new datetimeclass
                            {
                                exam_datetime = es.exam_datetime,
                                assignid = em.assignid,
                            }).Distinct().ToList();
            foreach (var data in examdate)
            {
                if (!list_final.Exists(x => x.exam_datetime == data.exam_datetime))
                {
                    list_final.Add(data);
                }
            }
           
            ddlExamDateTime.DataSource = list_final;
            ddlExamDateTime.DataTextField = "exam_datetime";
            ddlExamDateTime.DataValueField = "assignid";
            ddlExamDateTime.DataBind();
            ddlExamDateTime.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public class datetimeclass
    {
        public DateTime? exam_datetime { get; set; }
        public int assignid { get; set; }

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
    public void Bind_Subject(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var subject = (from ap in db.exam_subjectmaster
                           join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                           where cwm.universityID == institutionId
                           select new
                           {
                               description = ap.description,
                               id = ap.id
                           }).ToList();

            ddlsubjcet.DataSource = subject;
            ddlsubjcet.DataTextField = "description";
            ddlsubjcet.DataValueField = "id";
            ddlsubjcet.DataBind();
            ddlsubjcet.Items.Insert(0, lst);

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
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Getstudentstatus(int examId, int proctorid, int assignid, int universityid)
    {
        GTEEntities db1 = new GTEEntities();
        DateTime? examdatetime = db1.exam_assign.Where(x => x.assignid == assignid).Select(x => x.exam_datetime).FirstOrDefault();
        var applicantlist = (from ea in db1.exam_assign
                         join ap in db1.applicantdetails on ea.applicantid equals ap.applicantid
                         where ea.exampapersid == examId && ea.proctorid == proctorid && ea.exam_datetime == examdatetime && ap.universityid == universityid && ea.universityID == universityid && !string.IsNullOrEmpty(ea.status)
                         select new Data
                         {
                             applicantid = ea.applicantid,
                             universityid = ea.universityID,
                             examid = ea.exampapersid,
                             assignid = ea.assignid,
                             applicantname = ap.firstname + " " + ap.lastname,
                             is_studentactiveforexam = ea.is_studentactiveforexam.ToString() == "1" ? "Logged In" : "Logged Out",
                             is_active = ea.is_studentactiveforexam.ToString() == "1" ? ea.is_studentactiveforexam.ToString() : null,
                             toshow = ea.is_studentactiveforexam.ToString() == "1" ? ea.is_studentactiveforexam.ToString() : null,
                             rejectionreason = string.IsNullOrEmpty(ea.disqualify_reason) ? string.Empty : ea.disqualify_reason,
                             examstatus = string.IsNullOrEmpty(ea.status) ? string.Empty : ea.status,
                             answercount = 0,
                             showcheckbox = null,
                             showTextbox = null,
                             lblansweruploded = "NO",
                             loggedintime = ea.studentactiveforexam_at == null ? (DateTime?)null : ea.studentactiveforexam_at,
                             showtime = null,


                         }).ToList();
        foreach (var data in applicantlist)
        {
            loggedindatetime = data.loggedintime;
            data.showtime = Convert.ToDateTime(data.loggedintime).ToString("hh:mm tt");
            var examuploadtype = db1.exam_master.Where(x => x.exampapersid == data.examid).Select(x=>x.uploadtype).FirstOrDefault();
            var answeruploded = db1.exam_answersheet.Where(x => x.applicantid == data.applicantid && x.universityID == data.universityid & x.exampaperid == data.examid && x.exam_datetime == examdatetime).ToList();
            if (answeruploded.Count > 0)
            {
                data.lblansweruploded = "Yes";
                DateTime iKnowThisIsUtc1 = Convert.ToDateTime(answeruploded[0].uploded_at);
                DateTime runtimeKnowsThisIsUtc1 = DateTime.SpecifyKind(
                    iKnowThisIsUtc1,
                    DateTimeKind.Utc);
                DateTime localVersion1 = runtimeKnowsThisIsUtc1.ToLocalTime();

                data.lblansweruplodedtime_inLocal = localVersion1.ToString("hh:mm:ss tt"); // answeruploded[0].uploded_at;
                if (examuploadtype != null && examuploadtype == 3)
                    data.answercount = answeruploded.Count - 1;
                else
                    data.answercount = answeruploded.Count;
            }
            else
                data.lblansweruplodedtime = (DateTime?)null;
            //to show utc time in local time zone
            if (data.loggedintime != null)
            {
                DateTime iKnowThisIsUtc = Convert.ToDateTime(data.loggedintime);
                DateTime runtimeKnowsThisIsUtc = DateTime.SpecifyKind(iKnowThisIsUtc,DateTimeKind.Utc);
                DateTime localVersion = runtimeKnowsThisIsUtc.ToLocalTime();
                data.loggedintime_inLocal = localVersion.ToString("hh:mm:ss tt");
            }
            else
                data.loggedintime_inLocal = string.Empty;
        }
        return JsonConvert.SerializeObject(applicantlist);
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
        public string loggedintime_inLocal { get; set; }
        public DateTime? lblansweruplodedtime { get; set; }
        public string lblansweruplodedtime_inLocal { get; set; }
        public string lblansweruploded { get; set; }
        public string showtime { get; set; }
        public string status { get; set; }

    }

    private void BindTable(int examId, int proctorid, int assignid, int universityid, DateTime exam_datetime)
    {
        try
        {
            int rejectionreasonID = Convert.ToInt32(rejectionlist.SelectedValue);
            applicantlist = (from ea in db.exam_assign
                             join ap in db.applicantdetails on ea.applicantid equals ap.applicantid
                             where ea.exampapersid == examId && ea.proctorid == proctorid && ea.exam_datetime == exam_datetime && ap.universityid == universityid && ea.universityID == universityid && (string.IsNullOrEmpty(ea.status) || ea.status.ToLower()=="Verified")
                             select new Data
                             {
                                 applicantid = ea.applicantid,
                                 universityid = ea.universityID,
                                 examid= ea.exampapersid,
                                 assignid = ea.assignid,
                                 applicantname = ap.firstname + " " + ap.lastname,
                                 is_studentactiveforexam = ea.is_studentactiveforexam.ToString() == "1"? "Logged In": "Logged Out",
                                 is_active= ea.is_studentactiveforexam.ToString() == "1" ? ea.is_studentactiveforexam.ToString() : null,
                                 toshow = ea.is_studentactiveforexam.ToString() == "1" ? ea.is_studentactiveforexam.ToString() : null,
                                 rejectionreason = string.IsNullOrEmpty(ea.disqualify_reason)? null: ea.disqualify_reason,
                                 examstatus = string.IsNullOrEmpty(ea.status) ? string.Empty : ea.status,
                                 answercount = 0,
                                 showcheckbox = null,
                                 showTextbox = null,
                                 lblansweruploded ="NO",
                                 status = ea.status,
                                 loggedintime = ea.studentactiveforexam_at == null ? (DateTime?)null : ea.studentactiveforexam_at,


                             }).ToList();
            foreach (var data in applicantlist)
            {
                loggedindatetime = data.loggedintime;
                var examschedule = db.exam_schedule.Where(x => x.universityid == universityid && x.exampapersid == examId && x.exam_datetime == exam_datetime).FirstOrDefault();
                
                if (string.IsNullOrEmpty(data.examstatus))
                {                    
                    if (rejectionreasonID != 0)
                    {
                        if (rejectionreasonID == 2 || rejectionreasonID == 3)
                        {
                            data.showTextbox = "show";
                            data.showcheckbox = "show";
                        } else if (rejectionreasonID == 1) {

                            if (data.is_studentactiveforexam == "Logged In")
                                data.showcheckbox = "show";
                                     }
                    }
                    else
                        data.showcheckbox = "show";
                }
                else
                    data.toshow = null;

                var examuploadtype = db.exam_master.Where(x => x.exampapersid == data.examid).Select(x => x.uploadtype).FirstOrDefault();
                var answeruploded = db.exam_answersheet.Where(x => x.applicantid == data.applicantid && x.universityID == data.universityid & x.exampaperid == data.examid && x.exam_datetime == exam_datetime).ToList();
                if (answeruploded.Count > 0)
                {
                    data.lblansweruploded = "Yes";

                    DateTime iKnowThisIsUtc1 = Convert.ToDateTime(answeruploded[0].uploded_at);
                    DateTime runtimeKnowsThisIsUtc1 = DateTime.SpecifyKind(
                        iKnowThisIsUtc1,
                        DateTimeKind.Utc);
                    DateTime localVersion1 = runtimeKnowsThisIsUtc1.ToLocalTime();
                    
                    data.lblansweruplodedtime_inLocal = localVersion1.ToString("hh:mm:ss tt"); // answeruploded[0].uploded_at;
                    if (examuploadtype != null && examuploadtype == 2)
                        data.answercount = answeruploded.Count;
                    else
                    {
                        bool pdfgenrated = false;
                        foreach (var item in answeruploded)
                        {
                            if (item.ispdfgenrated == 1)
                                pdfgenrated = true;
                        }
                        if (pdfgenrated == true)
                            data.answercount = answeruploded.Count - 1;
                        else
                            data.answercount = answeruploded.Count;
                    }
                }
                else
                    data.lblansweruplodedtime = (DateTime?)null;

                if (data.loggedintime != null)
                {
                    DateTime iKnowThisIsUtc = Convert.ToDateTime(data.loggedintime);
                    DateTime runtimeKnowsThisIsUtc = DateTime.SpecifyKind(
                        iKnowThisIsUtc,
                        DateTimeKind.Utc);
                    DateTime localVersion = runtimeKnowsThisIsUtc.ToLocalTime();
                    data.loggedintime_inLocal = localVersion.ToString("hh:mm:ss tt");
                }
                else
                    data.loggedintime_inLocal = string.Empty;
            }
            grid.DataSource = applicantlist.OrderBy(x => x.toshow == null).ThenBy(x=>x.is_active == null).ToList();
            grid.DataBind();

            
            //GridRemainingApplicant.DataSource = applicantlist.Where(x => x.status == null || x.status == string.Empty).ToList();
            //GridRemainingApplicant.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
  
    //public static string Between(string value, string a, string b)
    //{
    //    int posA = value.IndexOf(a);
    //    int posB = value.LastIndexOf(b);
    //    if (posA == -1)
    //    {
    //        return "";
    //    }
    //    if (posB == -1)
    //    {
    //        return "";
    //    }
    //    int adjustedPosA = posA + a.Length;
    //    if (adjustedPosA >= posB)
    //    {
    //        return "";
    //    }
    //    return value.Substring(adjustedPosA, posB - adjustedPosA);
    //}

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            int actionid = Convert.ToInt32(rejectionlist.SelectedValue);
            int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int assignId = Convert.ToInt32(ddlExamDateTime.SelectedValue);
            int examId = Convert.ToInt32(ddlexam.SelectedValue);
            int proctorid = Convert.ToInt32(ddlexaminer.SelectedValue);

            DateTime? examdatetime = db.exam_assign.Where(x => x.assignid == assignId).Select(x => x.exam_datetime).FirstOrDefault();
            var listofapplicant = db.exam_assign.Where(ea => ea.exampapersid == examId && ea.proctorid == proctorid && ea.exam_datetime == examdatetime && ea.universityID == universityid && ea.status != null && ea.is_studentactiveforexam == 1).ToList();

            foreach (GridViewRow row in grid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    Label lblapplicantid = (Label)row.FindControl("lblapplicantid");
                    int applicantid = Convert.ToInt32(lblapplicantid.Text);

                    Label lblassignid = (Label)row.FindControl("lblassignid");
                    int assignid = Convert.ToInt32(lblassignid.Text);

                    TextBox txtreason = (TextBox)row.FindControl("txtreason");

                    exam_assign objassign = new exam_assign();

                    CheckBox c = (CheckBox)row.FindControl("chkassign");
                    if (c.Checked)
                    {
                        var examdata = db.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
                        if (examdata != null && examdata.is_studentactiveforexam == 1)
                        {
                            var mode = "new";

                            if (examdata != null)
                            {
                                mode = "update";
                                objassign = examdata;
                            }
                            if (Convert.ToInt32(rejectionlist.SelectedValue) == 1)
                                objassign.status = "Verified";
                            else if (Convert.ToInt32(rejectionlist.SelectedValue) == 2)
                                objassign.status = "Not Present";
                            else if (Convert.ToInt32(rejectionlist.SelectedValue) == 3)
                                objassign.status = "Not Verified";

                            if (Convert.ToInt32(rejectionlist.SelectedValue) == 2 || Convert.ToInt32(rejectionlist.SelectedValue) == 3)
                            {
                                objassign.is_proctor_access_given = false;
                                objassign.disqualify_reason = txtreason.Text;
                            }
                            else
                            {
                                objassign.is_proctor_access_given = true;
                                objassign.is_verified = true;
                            }

                            objassign.is_expired = null;
                            if (mode == "new")
                                db.exam_assign.Add(objassign);

                            db.SaveChanges();
                        }
                    }
                }
            }
            DateTime exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedItem.Text);
            BindTable(examId, proctorid, assignId, universityid, exam_datetime);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlExamDateTime_SelectedIndexChanged1(object sender, EventArgs e)
    {
        int assignid = Convert.ToInt32(ddlExamDateTime.SelectedValue);

        Session["Final_Readingtime_Start"] = null;
        Session["Final_Readingtime_End"] = null;
        Session["Session_Final_Readingtime_End"] = null;

        Session["Final_writingtime_End"] = null;
        Session["Final_writingtime_Start"] = null; 
         Session["Session_Final_writingtime_End"] = null;

        Session["Final_Uploadtime_End"] = null;
        Session["Session_Final_Uploadtime_End"] = null;

        sessionreadingTime = string.Empty;
        sessionwritingTime = string.Empty;
        sessionUploadTime = string.Empty;

        if (assignid != 0)
        {
            int examId = Convert.ToInt32(ddlexam.SelectedValue);
            int proctorid = Convert.ToInt32(ddlexaminer.SelectedValue);
            int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            var examverificationtype = db.exam_master.Where(x => x.exampapersid == examId).FirstOrDefault();
            DateTime exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedItem.Text);
            var examschedule = db.exam_schedule.Where(x => x.universityid == universityid && x.exampapersid == examId && x.exam_datetime == exam_datetime).FirstOrDefault();

            tiemzone.Value = "(" + examschedule.utctimezone + ") " + examschedule.exam_datetime_utc.ToString();
            publictimezone = examschedule.utctimezone;
           if (examverificationtype.isautomaticstart == 1)
            {
                isexamautostart = 1;
                // check exam time
                if (examschedule.exam_datetime_utc == DateTime.UtcNow || examschedule.exam_datetime_utc < DateTime.UtcNow)
                {
                    tblcontent.Attributes.Add("style", "display:none");
                    refreshtbl.Attributes.Add("style", "display:block");
                }
                else
                {
                    tblcontent.Attributes.Add("style", "display:block");
                    refreshtbl.Attributes.Add("style", "display:none");
                }

                btnstart.Visible = false;
                
                BindTable(examId, proctorid, assignid, universityid, exam_datetime);
            }
            else
            {
                isexamautostart = 0;
                // check if exam started manually or not
                var examstarted = db.exam_assign.Where(x => x.universityID == universityid && x.exampapersid == examId && x.exam_datetime == exam_datetime && x.is_examstarted == true).ToList();
                string current_UTC_Time = DateTime.UtcNow.ToString("hh:mm:ss");

                var examtime = db.exam_schedule.Where(x => x.universityid == universityid && x.exampapersid == examId && x.exam_datetime == exam_datetime).FirstOrDefault();
                if (examstarted.Count > 0)
                {
                    DateTime current_UTCDatetime = DateTime.UtcNow;

                    DateTime examdatetime = Convert.ToDateTime(examtime.exam_datetime_utc);

                    DateTime timetostop = examdatetime.AddMinutes(30);

                    if (current_UTCDatetime > timetostop)
                    {
                        tblcontent.Attributes.Add("style", "display:none");
                        refreshtbl.Attributes.Add("style", "display:block");
                    }
                    else
                    {
                        btnstart.Visible = true;
                        tblcontent.Attributes.Add("style", "display:block");
                        BindTable(examId, proctorid, assignid, universityid, exam_datetime);
                        refreshtbl.Attributes.Add("style", "display:block");
                    }

                }
                else
                {
                    btnstart.Visible = true;
                    tblcontent.Attributes.Add("style", "display:block");
                    BindTable(examId, proctorid, assignid, universityid, exam_datetime);
                    refreshtbl.Attributes.Add("style", "display:none");
                }

                //if (examstarted.Count > 0)
                //{
                //    tblcontent.Attributes.Add("style", "display:none");
                //    refreshtbl.Attributes.Add("style", "display:block");
                //}
                //else
                //{
                //    btnstart.Visible = true;
                //    tblcontent.Attributes.Add("style", "display:block");
                //    BindTable(examId, proctorid, assignid, universityid, exam_datetime);
                //    refreshtbl.Attributes.Add("style", "display:none");
                //}

            }
        }
        else
        {
            tiemzone.Value = "";
            tblcontent.Attributes.Add("style", "display:none");
            refreshtbl.Attributes.Add("style", "display:none");
        }
    }

    private void checkmanual()
    {
        int assignid = Convert.ToInt32(ddlExamDateTime.SelectedValue);
        int examId = Convert.ToInt32(ddlexam.SelectedValue);
        int proctorid = Convert.ToInt32(ddlexaminer.SelectedValue);
        int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        var examverificationtype = db.exam_master.Where(x => x.exampapersid == examId).FirstOrDefault();
        DateTime exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedItem.Text);
        var examstarted = db.exam_assign.Where(x => x.universityID == universityid && x.exampapersid == examId && x.exam_datetime == exam_datetime && x.is_examstarted == true).ToList();
        var examtime = db.exam_schedule.Where(x => x.universityid == universityid && x.exampapersid == examId && x.exam_datetime == exam_datetime).FirstOrDefault();

        if (examstarted.Count > 0)
        {
            DateTime current_UTCDatetime = DateTime.UtcNow;

            DateTime examdatetime = Convert.ToDateTime(examtime.exam_datetime_utc);

            DateTime timetostop = examdatetime.AddMinutes(30);

            if (current_UTCDatetime > timetostop)
            {
                tblcontent.Attributes.Add("style", "display:none");
                refreshtbl.Attributes.Add("style", "display:block");
            }
            else
            {
                btnstart.Visible = true;
                tblcontent.Attributes.Add("style", "display:block");
                BindTable(examId, proctorid, assignid, universityid, exam_datetime);
                refreshtbl.Attributes.Add("style", "display:block");
            }

        }
        else
        {
            btnstart.Visible = true;
            tblcontent.Attributes.Add("style", "display:block");
            BindTable(examId, proctorid, assignid, universityid, exam_datetime);
            refreshtbl.Attributes.Add("style", "display:none");
        }

        //if (examstarted.Count > 0)
        //{
        //    btnstart.Visible = false;
        //    tblcontent.Attributes.Add("style", "display:none");
        //    refreshtbl.Attributes.Add("style", "display:block");
        //}
        //else
        //{
        //    btnstart.Visible = true;
        //    tblcontent.Attributes.Add("style", "display:block");
        //    BindTable(examId, proctorid, assignid, universityid, exam_datetime);
        //    refreshtbl.Attributes.Add("style", "display:none");
        //}

    }
    protected void rejectionlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        int actionID = Convert.ToInt32(rejectionlist.SelectedValue);
        int assignid = Convert.ToInt32(ddlExamDateTime.SelectedValue);
        int examId = Convert.ToInt32(ddlexam.SelectedValue);
        int proctorid = Convert.ToInt32(ddlexaminer.SelectedValue);
        int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        DateTime exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedItem.Text);
        BindTable(examId, proctorid, assignid, universityid, exam_datetime);
    }

    protected void btnstart_Click(object sender, EventArgs e)
    {
        try
        {
            int assignid = Convert.ToInt32(ddlExamDateTime.SelectedValue);
            int examId = Convert.ToInt32(ddlexam.SelectedValue);
            int proctorid = Convert.ToInt32(ddlexaminer.SelectedValue);
            int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            
            DateTime? examdatetime = db.exam_assign.Where(x => x.assignid == assignid).Select(x => x.exam_datetime).FirstOrDefault();

            var examschedule = db.exam_schedule.Where(x => x.universityid == universityid && x.exampapersid == examId && x.exam_datetime == examdatetime).FirstOrDefault();
            DateTime cur_utc_datetime = DateTime.UtcNow;
            if (examschedule.exam_datetime_utc == cur_utc_datetime || cur_utc_datetime > examschedule.exam_datetime_utc)
            {
                var list = (from ea in db.exam_assign
                            where ea.exampapersid == examId && ea.proctorid == proctorid && ea.exam_datetime == examdatetime && ea.universityID == universityid
                            select new
                            {
                                assignid = ea.assignid,
                                status = ea.status,
                                is_proctor_access_given = ea.is_proctor_access_given,

                            }).ToList();
                exam_assign objmapping = new exam_assign();
                foreach (var item in list)
                {
                    var mode = "new";
                    int assignID = item.assignid;
                    
                    var data = db.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
                    if (data != null)
                    {
                        mode = "update";
                        objmapping = data;
                    }
                    if (!string.IsNullOrEmpty(objmapping.status))
                    {
                        objmapping.is_examstarted = true;
                        objmapping.examstarted_utctime = DateTime.UtcNow;
                        //if (string.IsNullOrEmpty(objmapping.status))
                        //    objmapping.status = "Not Present";
                    }
                    if (mode == "new")
                        db.exam_assign.Add(objmapping);
                    db.SaveChanges();
                }
                //startClock(examId, Convert.ToDateTime(objmapping.examstarted_utctime));
                DateTime exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedItem.Text);
                BindTable(examId, proctorid, assignid, universityid, exam_datetime);
                checkmanual();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Assessment can not be start before assessment time. ')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string checkifexamstarted(int examid, int assignid, int universityid)
    {
        string response = "0";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        DateTime? exam_datetime = null;
        var exam_assign = db1.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
        if (exam_assign != null)
        {
            exam_datetime = exam_assign.exam_datetime;

            var isexamstarted = db1.exam_assign.Where(x => x.universityID == universityid && x.exampapersid == examid && x.exam_datetime == exam_datetime && x.is_examstarted == true).ToList();
            
            var isanystudentisVerified = db1.exam_assign.Where(x => x.universityID == universityid && x.exampapersid == examid && x.exam_datetime == exam_datetime && (x.status.ToLower() == "verified" || x.status.ToLower() == "assessment started")).ToList();

            if (isexamstarted.Count > 0)
            {
                if (isanystudentisVerified.Count > 0)
                {
                    response = "startclock";
                    //startClock(examid, Convert.ToDateTime(exam_assign.examstarted_utctime));
                   
                }
            }
        }
        return JsonConvert.SerializeObject(response);
    }

    private static void startClock(int examID , DateTime UTCexamstart)
    {
        GTEEntities db1 = new GTEEntities();
        Logger objlog = new Logger();
        try {
            sessionreadingTime = string.Empty;
            sessionwritingTime = string.Empty;
            sessionUploadTime = string.Empty;

            var exammaster = db1.exam_master.Where(x =>x.exampapersid == examID).FirstOrDefault();
            if (exammaster != null)
            {
                string current_UTC_Time = DateTime.UtcNow.ToString("hh:mm:ss");
                string UTC_examstart = Convert.ToDateTime(UTCexamstart).ToString("hh:mm:ss");
                DateTime current_UTCDatetime = Convert.ToDateTime(current_UTC_Time);

                int exam_ReadingTime = Convert.ToInt32(exammaster.exam_readingduration);
                int exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                int exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);

                string ReadingTime_start = string.Empty;
                string str_ReadingTime_end = string.Empty;
                string WritingTime_start = string.Empty;
                string str_WritingTime_end = string.Empty;
                DateTime? WritingTimeEnd = (DateTime?)null;
                string uploadTime_start = str_WritingTime_end;
                string str_UploadTime_end = string.Empty;
                DateTime? UploadTimeEnd = (DateTime?)null;   
                
                if (exammaster.uploadtype == 3)
                {                    
                    if (HttpContext.Current.Session["Final_Readingtime_Start"] == null)
                    {
                        HttpContext.Current.Session["Final_Readingtime_Start"] = UTC_examstart;
                        ReadingTime_start = UTC_examstart;
                    }
                    else
                        ReadingTime_start = current_UTC_Time;
                    
                    DateTime? ReadingTimeEnd = (DateTime?)null;
                    if (HttpContext.Current.Session["Final_Readingtime_End"] == null)
                    {
                        ReadingTimeEnd = Convert.ToDateTime(UTC_examstart).AddMinutes(exam_ReadingTime);
                        HttpContext.Current.Session["Final_Readingtime_End"] = ReadingTimeEnd;
                        HttpContext.Current.Session["Session_Final_Readingtime_End"] = ReadingTimeEnd;
                        str_ReadingTime_end = ReadingTimeEnd.ToString();
                    }
                    else
                    {
                        ReadingTimeEnd = Convert.ToDateTime(HttpContext.Current.Session["Session_Final_Readingtime_End"]);
                        str_ReadingTime_end = ReadingTimeEnd.ToString();
                    }
                    WritingTime_start = str_ReadingTime_end;
                    if (HttpContext.Current.Session["Final_writingtime_End"] == null)
                    {
                        WritingTimeEnd = Convert.ToDateTime(str_ReadingTime_end).AddMinutes(exam_WritingTime);
                        HttpContext.Current.Session["Final_writingtime_End"] = WritingTimeEnd;
                        HttpContext.Current.Session["Session_Final_writingtime_End"] = WritingTimeEnd;
                        str_WritingTime_end = WritingTimeEnd.ToString();
                    }
                    else
                    {
                        WritingTimeEnd = Convert.ToDateTime(HttpContext.Current.Session["Session_Final_writingtime_End"]);
                        str_WritingTime_end = WritingTimeEnd.ToString();
                    }
                    uploadTime_start = str_WritingTime_end;
                    if (HttpContext.Current.Session["Final_Uploadtime_End"] == null)
                    {
                        UploadTimeEnd = Convert.ToDateTime(str_WritingTime_end).AddMinutes(exam_UploadTime);
                        HttpContext.Current.Session["Final_Uploadtime_End"] = UploadTimeEnd;
                        HttpContext.Current.Session["Session_Final_Uploadtime_End"] = UploadTimeEnd;
                        str_UploadTime_end = UploadTimeEnd.ToString();
                    }
                    else
                    {
                        UploadTimeEnd = Convert.ToDateTime(HttpContext.Current.Session["Session_Final_Uploadtime_End"]);
                        str_UploadTime_end = UploadTimeEnd.ToString();
                    }
                    if (current_UTCDatetime == ReadingTimeEnd || current_UTCDatetime > ReadingTimeEnd)
                    {

                        WritingTime_start = current_UTC_Time;
                        HttpContext.Current.Session["Final_Readingtime_End"] = null;
                        str_ReadingTime_end = null;

                        if (current_UTCDatetime == WritingTimeEnd || current_UTCDatetime > WritingTimeEnd)
                        {
                            uploadTime_start = current_UTC_Time;
                            HttpContext.Current.Session["Final_writingtime_End"] = null;
                            str_WritingTime_end = null;
                        }

                    }
                }
                else if(exammaster.uploadtype == 1)
                {
                    //string ReadingTime_start;
                    if (HttpContext.Current.Session["Final_writingtime_Start"] == null)
                    {
                        HttpContext.Current.Session["Final_writingtime_Start"] = UTC_examstart;
                        WritingTime_start = UTC_examstart;
                    }
                    else
                        WritingTime_start = current_UTC_Time;
                    if (HttpContext.Current.Session["Final_writingtime_End"] == null)
                    {
                        WritingTimeEnd = Convert.ToDateTime(UTC_examstart).AddMinutes(exam_WritingTime);
                        HttpContext.Current.Session["Final_writingtime_End"] = WritingTimeEnd;
                        HttpContext.Current.Session["Session_Final_writingtime_End"] = WritingTimeEnd;
                        str_WritingTime_end = WritingTimeEnd.ToString();
                    }
                    else
                    {
                        WritingTimeEnd = Convert.ToDateTime(HttpContext.Current.Session["Session_Final_writingtime_End"]);
                        str_WritingTime_end = WritingTimeEnd.ToString();
                    }
                    str_ReadingTime_end = string.Empty;
                    str_UploadTime_end = string.Empty;
                }

                TimeSpan? set_Readingtime = null;
                TimeSpan? set_Writingtime = null;
                TimeSpan? set_Uploadtime = null;

                if (!string.IsNullOrEmpty(str_ReadingTime_end))
                    set_Readingtime = DateTime.Parse(str_ReadingTime_end).Subtract(DateTime.Parse(ReadingTime_start));
                if (!string.IsNullOrEmpty(str_WritingTime_end))
                    set_Writingtime = DateTime.Parse(str_WritingTime_end).Subtract(DateTime.Parse(WritingTime_start));
                if (!string.IsNullOrEmpty(str_UploadTime_end))
                    set_Uploadtime = DateTime.Parse(str_UploadTime_end).Subtract(DateTime.Parse(uploadTime_start));

                if (exammaster.uploadtype == 3)
                {

                    sessionreadingTime = set_Readingtime.ToString();
                    sessionwritingTime = set_Writingtime.ToString();
                    sessionUploadTime = set_Uploadtime.ToString();
                }
                else if (exammaster.uploadtype == 1)
                {
                    sessionreadingTime = string.Empty;
                    sessionwritingTime = set_Writingtime.ToString();
                    sessionUploadTime = string.Empty;
                }
                else
                {
                    sessionreadingTime = string.Empty;
                    sessionwritingTime = string.Empty;
                    sessionUploadTime = string.Empty;
                }

                HttpContext.Current.Session["SessionReadingTime"] = sessionreadingTime;
                HttpContext.Current.Session["SessionWrittingTime"] = sessionwritingTime;
                HttpContext.Current.Session["SessionUpploadTime"] = sessionUploadTime;
            }
        }
        catch (Exception ex) { objlog.WriteLog(ex.ToString()); }
    }

    protected void refreshbtn_Click(object sender, EventArgs e)
    {
        int assignid = Convert.ToInt32(ddlExamDateTime.SelectedValue);
        if (assignid != 0 || assignid != null)
        {
            int examId = Convert.ToInt32(ddlexam.SelectedValue);
            int proctorid = Convert.ToInt32(ddlexaminer.SelectedValue);
            int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            DateTime exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedItem.Text);
            BindTable(examId, proctorid, assignid, universityid, exam_datetime);
        }

    }

    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblloggedstatus = (Label)e.Row.FindControl("lblloggedstatus");
                
                if (lblloggedstatus.Text == "Logged In")
                    lblloggedstatus.Attributes.Add("style", "color:green");
                else
                    lblloggedstatus.Attributes.Add("style", "color:red");
            }
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Hidestartexamandtable(int examid, int assignid, int universityid, int proctorid)
    {
        GTEEntities db1 = new GTEEntities();
        string response = "UnHide";
        var examdate = db1.exam_assign.Where(x => x.assignid == assignid).Select(x => x.exam_datetime).FirstOrDefault();
        DateTime date = Convert.ToDateTime(examdate);
        var examschedule = db1.exam_schedule.Where(x => x.exam_datetime == date && x.exampapersid == examid && x.universityid == universityid).FirstOrDefault();

        DateTime current_UTCDatetime = DateTime.UtcNow;
        if (examschedule != null)
        {
            DateTime examdatetime = Convert.ToDateTime(examschedule.exam_datetime_utc);

            DateTime timetostop = examdatetime.AddMinutes(30);

            if (current_UTCDatetime > timetostop)
            {
                response = "hide";
                // after 30 min mark NOt present to all students 

                var list = (from ea in db1.exam_assign
                            where ea.exampapersid == examid && ea.proctorid == proctorid && ea.exam_datetime == examdate && ea.universityID == universityid
                            select new
                            {
                                assignid = ea.assignid,
                                status = ea.status,
                                is_proctor_access_given = ea.is_proctor_access_given,

                            }).ToList();
                foreach (var item in list)
                {
                    var mode = "new";
                    int assignID = item.assignid;
                    exam_assign objmapping = new exam_assign();
                    var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
                    if (data != null)
                    {
                        mode = "update";
                        objmapping = data;
                    }
                    if (string.IsNullOrEmpty(objmapping.status) || objmapping.status.ToLower() == "verified")
                    {
                        objmapping.is_examstarted = false;
                        objmapping.status = "Not Present";
                    }
                    if (mode == "new")
                        db1.exam_assign.Add(objmapping);
                    db1.SaveChanges();
                }
            }
            else
                response = "UnHide";
        }
        return response;
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string checkutcexamtime(int universityid, int examid, int assignid)
    {
        string response = "0";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        DateTime? exam_datetime = null;
        var exam_assign = db1.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
        if(exam_assign != null)
            exam_datetime = exam_assign.exam_datetime;
       
        var examschedule = db1.exam_schedule.Where(x => x.universityid == universityid && x.exampapersid == examid && x.exam_datetime == exam_datetime).FirstOrDefault();
        var exammaster = db1.exam_master.Where(x => x.exampapersid == examid).FirstOrDefault();
        if (exammaster != null && exammaster.isautomaticstart == 1 && examschedule != null)
        {
            DateTime record_utcdattime_minus3min = Convert.ToDateTime(examschedule.exam_datetime_utc).AddMinutes(-3);

            if (examschedule != null)
            {
                if (record_utcdattime_minus3min == DateTime.UtcNow || record_utcdattime_minus3min < DateTime.UtcNow)
                {
                    if (examschedule.exam_datetime_utc == DateTime.UtcNow || examschedule.exam_datetime_utc < DateTime.UtcNow)
                    {
                        
                        response = "examstarted";
                    }
                    else
                    {
                        if (isalertshown == 0)
                        {
                            response = "showalert";
                            isalertshown = 1;
                        }
                        else
                            response = "alreadyalertshown";
                    }
                }
                else
                    response = "0";
            }
        }
        else
            response = "0";

        return JsonConvert.SerializeObject(response);
    }
    
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string MarkAbsentBydefaut(int examid, int assignid, int universityid, int proctorid) //excluded
    {
        string response = "0";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        DateTime? examdatetime = db1.exam_assign.Where(x => x.assignid == assignid).Select(x => x.exam_datetime).FirstOrDefault();
        var list = (from ea in db1.exam_assign
                    where ea.exampapersid == examid && ea.proctorid == proctorid && ea.exam_datetime == examdatetime && ea.universityID == universityid
                    select new
                    {
                        assignid = ea.assignid,
                        status = ea.status,
                        is_proctor_access_given = ea.is_proctor_access_given,

                    }).ToList();
        foreach (var item in list)
        {
            var mode = "new";
            int assignID = item.assignid;
            exam_assign objmapping = new exam_assign();
            var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            if (string.IsNullOrEmpty(objmapping.status))
            {
                objmapping.is_examstarted = false;
                objmapping.status = "Not Present";
            }
            if (mode == "new")
                db1.exam_assign.Add(objmapping);
            db1.SaveChanges();
        }
        DateTime? examdatetime2 = null;
        var examassign = db1.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
        if (examassign != null)
        {
            examdatetime = examassign.exam_datetime;

            //var allList = db1.exam_assign.Where(x => x.universityID == universityid && x.exampapersid == examid && x.exam_datetime == examdatetime2 && x.is_examstarted == true).ToList();
            //if (allList.Count > 0)
            //    startClock(examid, Convert.ToDateTime(examassign.examstarted_utctime));
        }

        return JsonConvert.SerializeObject(response);
    }

   
}