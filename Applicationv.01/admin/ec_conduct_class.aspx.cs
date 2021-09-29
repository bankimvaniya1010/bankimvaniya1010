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

public partial class admin_ec_conduct_class : System.Web.UI.Page
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
    public static DateTime? loggedindatetime, class_start_datetime, class_end_datetime, class_start_datetime_utc, class_end_datetime_utc, class_start_datetime_15min, class_start_datetime_15min_utc;
    public static string publictimezone;
    public static string sessionreadingTime = string.Empty, sessionwritingTime = string.Empty, sessionUploadTime = string.Empty;
    public int? classID = 0, RecordID=0, adminID;
    DateTime? current_utcdateTime;
    public string lblclassdate;


    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["DID"] == null) || (Request.QueryString["DID"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
        {
            RecordID = Convert.ToInt32(Request.QueryString["DID"]);
            Session["DID"] = RecordID;
        }
        universityID = Utility.GetUniversityId();
        adminID = Convert.ToInt32(Session["UserID"]);
        var data = db.ec_class_date_schedule_master.Where(x => x.id == RecordID).FirstOrDefault();
        class_start_datetime = data.class_datetime_start;
        class_end_datetime = data.class_datetime_end;
        class_start_datetime_utc = data.class_datetime_start_utc;
        class_end_datetime_utc = data.class_datetime_end_utc;

        class_start_datetime_15min = Convert.ToDateTime(data.class_datetime_start).AddMinutes(-15);
        class_start_datetime_15min_utc = Convert.ToDateTime(data.class_datetime_start_utc).AddMinutes(-15);

        var class_details = db.ec_class_master.Where(x => x.id == data.classID).FirstOrDefault();
        classID = data.classID;

        lblclassdate = "You can start class at : " + Convert.ToDateTime(data.class_datetime_start).AddMinutes(-15).ToString("dd/MMM/yyyy hh:mm tt") +
            " UTC [ "+ Convert.ToDateTime(data.class_datetime_start_utc).AddMinutes(-15).ToString("dd/MMM/yyyy hh:mm tt") + "]";
        checkEntry();
        // check expire date
         current_utcdateTime = DateTime.UtcNow;

        if (current_utcdateTime > data.class_datetime_start_utc && current_utcdateTime > data.class_datetime_end_utc)
        {
            btnstart.Attributes.Add("disabled", "disabled");
            btnsave.Attributes.Add("disabled", "disabled");
            lblexpired.InnerText = "We Can not start class as time expired.";
        }
        else if (current_utcdateTime < data.class_datetime_start_utc) {
            btnstart.Attributes.Add("disabled", "disabled");
            btnsave.Attributes.Add("disabled", "disabled");
            lblexpired.InnerText = "We Can start class on "+class_start_datetime_15min;
        }

        if (class_details.modeid == 1)
            btnstart.Attributes.Add("style","display:none");

        if (rejectionlist.SelectedValue != null)
            btnsave.Text = "Mark " + rejectionlist.SelectedItem.Text;

    }

    private void checkEntry() {
        try {
            //checkentry of applicant for perticular class dates 
            var list_of_applicant = db.ec_class_applicationmaster.Where(x => x.classid == classID && x.status == 7).Select(x => x.applicantid).ToList();
            //var list_of_dates = db.ec_class_date_schedule_master.Where(x => x.classID == classID).ToList();
            foreach (var applicant in list_of_applicant) {
                var details = db.ec_class_attendance_master.Where(x => x.universityid==universityID && x.classID == classID && x.applicantid == applicant && x.class_dateID == RecordID).FirstOrDefault();
                if (details == null)
                {
                    ec_class_attendance_master objmapping = new ec_class_attendance_master();

                    objmapping.applicantid = applicant;
                    objmapping.classID = classID;
                    objmapping.class_dateID = RecordID;
                    objmapping.universityid = universityID;
                    db.ec_class_attendance_master.Add(objmapping);
                    db.SaveChanges();
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Getstudentstatus(int classID, int RecordID)
    {
        int universityId = Utility.GetUniversityId();
        GTEEntities db = new GTEEntities();
        var temp = (from am in db.ec_class_applicationmaster
                    join ea in db.ec_class_attendance_master on am.classid equals ea.classID
                    join ap in db.applicantdetails on ea.applicantid equals ap.applicantid
                    where ea.classID == classID && am.status == 7 && ea.class_dateID == RecordID && am.classid == classID && am.universityid == universityId
                    select new Data
                    {
                        assignid = ea.recordID,
                        applicantid = ea.applicantid,
                        universityid = am.universityid,
                        classid = classID,
                        applicantname = ap.firstname + " " + ap.lastname,
                        is_studentactiveforexam = ea.Is_loggedin == 1 ? "Logged In" : ea.Is_loggedin == 0 ? "Logged Out" : "-",
                        is_active = ea.Is_loggedin == 1 ? "Yes" : "No",
                        //toshow = ea.is_studentactiveforexam.ToString() == "1" ? ea.is_studentactiveforexam.ToString() : null,
                        //rejectionreason = string.IsNullOrEmpty(ea.disqualify_reason) ? null : ea.disqualify_reason,
                        //examstatus = string.IsNullOrEmpty(ea.status) ? string.Empty : ea.status,
                        //answercount = 0,
                        showcheckbox = null,
                        //showTextbox = null,
                        //lblansweruploded = "NO",
                        Ischeck = ea.Ischeck,
                        status = ea.verify_status == null? string.Empty: ea.verify_status,
                loggedintime = ea.login_time == null ? (DateTime?)null : ea.login_time,


            }).Distinct().OrderBy(x => x.assignid).ToList();
        
        foreach (var item in temp)
        {

            if (item.is_active != "Yes")
                item.showcheckbox = "No";

        }
    
        return JsonConvert.SerializeObject(temp);
    }
    public class Data
    {
        public int? Ischeck { get; set; }
        public int? applicantid { get; set; }
        public int? universityid { get; set; }
        public int? classid { get; set; }
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
    

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            int actionid = Convert.ToInt32(rejectionlist.SelectedValue);
            string[] str = selected_value_chk.Value.Split(',');

            for (int i = 0; i < str.Length; i++) {
                if (!String.IsNullOrEmpty(str[i])) {
                    ec_class_attendance_master objmapping = new ec_class_attendance_master();
                    var mode = "new";
                    int ID = Convert.ToInt32(str[i]);
                    var data = db.ec_class_attendance_master.Where(x => x.recordID == ID).FirstOrDefault();
                    if (data != null)
                    {
                        mode= "update";
                        objmapping = data;
                    }
                    objmapping.verify_status = rejectionlist.SelectedItem.Text;
                    objmapping.verified_by = adminID;
                    db.SaveChanges();
                }
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
        
    protected void btnstart_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime? current_utcdateTime = DateTime.UtcNow;

            if (current_utcdateTime > class_start_datetime_utc)
            {
             
               var details = db.ec_class_attendance_master.Where(x => x.universityid == universityID && x.classID == classID && x.class_dateID == RecordID).ToList();
                if (details.Count > 0) {
                    foreach (var item in details)
                    {
                        if (item.verify_status == "Verified")
                        {
                            ec_class_attendance_master objmapping = new ec_class_attendance_master();
                            var d = db.ec_class_attendance_master.Where(x => x.universityid == universityID && x.classID == classID && x.class_dateID == RecordID).FirstOrDefault();
                            if (d != null)
                                objmapping = d;

                            objmapping.Is_class_started = 1;

                            db.SaveChanges();
                        }
                    }
                }
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class can not be start before time. ')", true);
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
                startClock(examid, assignid);
                response = "startclock";
            }
        }
        return JsonConvert.SerializeObject(response);
    }

    private static void startClock(int examID, int assignID)
    {
        GTEEntities db1 = new GTEEntities();
        Logger objLog = new Logger();
        int UniversityID = Utility.GetUniversityId();
        try
        {
            sessionreadingTime = "";
            sessionUploadTime = "";
            sessionwritingTime = "";
            HttpContext.Current.Session["readingtime"] = "";
            HttpContext.Current.Session["totalResponseTime"] = "";
            HttpContext.Current.Session["uploadtime"] = "";
            var exammaster = db1.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == examID).FirstOrDefault();

            var exam_assign = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
            if (exam_assign != null)
            {
                var examschedule = db1.exam_schedule.Where(x => x.universityid == UniversityID && x.exampapersid == examID && x.exam_datetime == exam_assign.exam_datetime).FirstOrDefault();
                if (exammaster != null)
                {
                    if (examschedule != null)
                    {
                        string current_UTC_Time = DateTime.UtcNow.ToString("hh:mm:ss");
                        DateTime current_UTCDatetime = Convert.ToDateTime(current_UTC_Time);

                        string UTC_examstart = Convert.ToDateTime(examschedule.exam_datetime_utc).ToString("hh:mm:ss");
                        DateTime UTC_examstartDatetime = Convert.ToDateTime(examschedule.exam_datetime_utc);

                        int exam_ReadingTime = Convert.ToInt32(exammaster.exam_readingduration);
                        int exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                        int exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);

                        string ReadingTime_start = UTC_examstart;
                        string str_ReadingTime_end = UTC_examstartDatetime.AddMinutes(exam_ReadingTime).ToString("hh:mm:ss");
                        DateTime date_read = Convert.ToDateTime(str_ReadingTime_end);

                        string WritingTime_start = str_ReadingTime_end;
                        string str_WritingTime_end = date_read.AddMinutes(exam_WritingTime).ToString("hh:mm:ss");
                        DateTime date_write = Convert.ToDateTime(str_WritingTime_end);

                        string uploadTime_start = str_WritingTime_end;
                        string str_UploadTime_end = date_write.AddMinutes(exam_UploadTime).ToString("hh:mm:ss");

                        TimeSpan? set_Readingtime = null;
                        TimeSpan? set_Writingtime = null;
                        TimeSpan? set_Uploadtime = null;

                        if (exammaster.uploadtype == 3)
                        {
                            if (UTC_examstart == current_UTC_Time)
                            {
                                exam_ReadingTime = Convert.ToInt32(exammaster.exam_readingduration);
                                exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                                exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);
                                HttpContext.Current.Session["readingtime"] = exammaster.exam_readingduration;
                                HttpContext.Current.Session["totalResponseTime"] = exammaster.exam_duration;
                                HttpContext.Current.Session["uploadtime"] = exammaster.exam_uploadduration;
                            }
                            else
                            {
                                set_Readingtime = DateTime.Parse(str_ReadingTime_end).Subtract(DateTime.Parse(current_UTC_Time));
                                if (set_Readingtime.ToString() == "00:00:00" || set_Readingtime.ToString().Contains("-"))
                                {
                                    HttpContext.Current.Session["readingtime"] = string.Empty;
                                    set_Writingtime = DateTime.Parse(str_WritingTime_end).Subtract(DateTime.Parse(current_UTC_Time));
                                    if (set_Writingtime.ToString() == "00:00:00" || set_Writingtime.ToString().Contains("-"))
                                    {
                                        HttpContext.Current.Session["totalResponseTime"] = string.Empty;
                                        set_Uploadtime = DateTime.Parse(str_UploadTime_end).Subtract(DateTime.Parse(current_UTC_Time));
                                        if (set_Uploadtime.ToString() == "00:00:00" || set_Uploadtime.ToString().Contains("-"))
                                        {
                                            HttpContext.Current.Session["uploadtime"] = string.Empty;
                                        }
                                        else
                                        {
                                            HttpContext.Current.Session["readingtime"] = string.Empty;
                                            HttpContext.Current.Session["totalResponseTime"] = string.Empty;
                                            HttpContext.Current.Session["uploadtime"] = set_Uploadtime;
                                        }
                                    }
                                    else
                                    {
                                        HttpContext.Current.Session["readingtime"] = string.Empty;
                                        HttpContext.Current.Session["totalResponseTime"] = set_Writingtime;
                                        HttpContext.Current.Session["uploadtime"] = exammaster.exam_uploadduration;
                                    }
                                }
                                else
                                {
                                    HttpContext.Current.Session["readingtime"] = set_Readingtime;
                                    HttpContext.Current.Session["totalResponseTime"] = exammaster.exam_duration;
                                    HttpContext.Current.Session["uploadtime"] = exammaster.exam_uploadduration;
                                }

                                exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                                exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);

                            }
                        }

                        sessionreadingTime = HttpContext.Current.Session["readingtime"].ToString();
                        sessionwritingTime = HttpContext.Current.Session["totalResponseTime"].ToString();
                        sessionUploadTime = HttpContext.Current.Session["uploadtime"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    
    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblloggedstatus = (Label)e.Row.FindControl("lblloggedstatus");

                if (lblloggedstatus.Text == "Logged In")
                    lblloggedstatus.Attributes.Add("style", "color:green");
                else
                    lblloggedstatus.Attributes.Add("style", "color:red");
            }
        }
        catch (Exception ex)
        {
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
        if (exam_assign != null)
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

    //[WebMethod]
    //[ScriptMethod(UseHttpGet = true)]

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string RefreshTime_admin(int examid, int assignid, string user)
    {

        Logger objLog = new Logger();
        int UniversityID = Utility.GetUniversityId();
        GTEEntities db1 = new GTEEntities();

        var exammaster = db1.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == examid).FirstOrDefault();

        var exam_assign = db1.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
        if (exam_assign != null)
        {
            var examschedule = db1.exam_schedule.Where(x => x.universityid == UniversityID && x.exampapersid == examid && x.exam_datetime == exam_assign.exam_datetime).FirstOrDefault();
            if (exammaster != null)
            {
                if (examschedule != null)
                {
                    string current_UTC_Time = DateTime.UtcNow.ToString("hh:mm:ss");
                    DateTime current_UTCDatetime = Convert.ToDateTime(current_UTC_Time);

                    string UTC_examstart = Convert.ToDateTime(examschedule.exam_datetime_utc).ToString("hh:mm:ss");
                    DateTime UTC_examstartDatetime = Convert.ToDateTime(examschedule.exam_datetime_utc);

                    int exam_ReadingTime = Convert.ToInt32(exammaster.exam_readingduration);
                    int exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                    int exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);

                    string ReadingTime_start = UTC_examstart;
                    string str_ReadingTime_end = UTC_examstartDatetime.AddMinutes(exam_ReadingTime).ToString("hh:mm:ss");
                    DateTime date_read = Convert.ToDateTime(str_ReadingTime_end);

                    string WritingTime_start = str_ReadingTime_end;
                    string str_WritingTime_end = date_read.AddMinutes(exam_WritingTime).ToString("hh:mm:ss");
                    DateTime date_write = Convert.ToDateTime(str_WritingTime_end);

                    string uploadTime_start = str_WritingTime_end;
                    string str_UploadTime_end = date_write.AddMinutes(exam_UploadTime).ToString("hh:mm:ss");

                    TimeSpan? set_Readingtime = null;
                    TimeSpan? set_Writingtime = null;
                    TimeSpan? set_Uploadtime = null;

                    if (exammaster.uploadtype == 3)
                    {
                        if (UTC_examstart == current_UTC_Time)
                        {
                            exam_ReadingTime = Convert.ToInt32(exammaster.exam_readingduration);
                            exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                            exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);
                            HttpContext.Current.Session["readingtime"] = exammaster.exam_readingduration;
                            HttpContext.Current.Session["totalResponseTime"] = exammaster.exam_duration;
                            HttpContext.Current.Session["uploadtime"] = exammaster.exam_uploadduration;
                        }
                        else
                        {
                            set_Readingtime = DateTime.Parse(str_ReadingTime_end).Subtract(DateTime.Parse(current_UTC_Time));
                            if (set_Readingtime.ToString() == "00:00:00" || set_Readingtime.ToString().Contains("-"))
                            {
                                HttpContext.Current.Session["readingtime"] = string.Empty;
                                set_Writingtime = DateTime.Parse(str_WritingTime_end).Subtract(DateTime.Parse(current_UTC_Time));
                                if (set_Writingtime.ToString() == "00:00:00" || set_Writingtime.ToString().Contains("-"))
                                {
                                    HttpContext.Current.Session["totalResponseTime"] = string.Empty;
                                    set_Uploadtime = DateTime.Parse(str_UploadTime_end).Subtract(DateTime.Parse(current_UTC_Time));
                                    if (set_Uploadtime.ToString() == "00:00:00" || set_Uploadtime.ToString().Contains("-"))
                                    {
                                        HttpContext.Current.Session["uploadtime"] = string.Empty;
                                    }
                                    else
                                    {
                                        HttpContext.Current.Session["readingtime"] = string.Empty;
                                        HttpContext.Current.Session["totalResponseTime"] = string.Empty;
                                        HttpContext.Current.Session["uploadtime"] = set_Uploadtime;
                                    }
                                }
                                else
                                {
                                    HttpContext.Current.Session["readingtime"] = string.Empty;
                                    HttpContext.Current.Session["totalResponseTime"] = set_Writingtime;
                                    HttpContext.Current.Session["uploadtime"] = exammaster.exam_uploadduration;
                                }
                            }
                            else
                            {
                                HttpContext.Current.Session["readingtime"] = set_Readingtime;
                                HttpContext.Current.Session["totalResponseTime"] = exammaster.exam_duration;
                                HttpContext.Current.Session["uploadtime"] = exammaster.exam_uploadduration;
                            }

                            exam_WritingTime = Convert.ToInt32(exammaster.exam_duration);
                            exam_UploadTime = Convert.ToInt32(exammaster.exam_uploadduration);

                        }
                    }

                    sessionreadingTime = HttpContext.Current.Session["readingtime"].ToString();
                    sessionwritingTime = HttpContext.Current.Session["totalResponseTime"].ToString();
                    sessionUploadTime = HttpContext.Current.Session["uploadtime"].ToString();


                }
            }
        }
        var choiceObj = new
        {
            rtm = sessionreadingTime,
            etm = sessionwritingTime,
            utm = sessionUploadTime,
        };
        return JsonConvert.SerializeObject(choiceObj);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string QuestionSequence(int QID, string ISadd,string rejectionID)
    {
        string result = string.Empty;
        GTEEntities db = new GTEEntities();
        Common objCom = new Common();
        int universityID = Utility.GetUniversityId();

        ec_class_attendance_master objmapping = new ec_class_attendance_master();

        var mode = "new";
        var data = db.ec_class_attendance_master.Where(x => x.recordID == QID).FirstOrDefault();
        if (data != null)
        {
            mode = "update";
            objmapping = data;
        }
        if (ISadd == "YES")
            objmapping.Ischeck = 1;
        else if (ISadd == "NO")
            objmapping.Ischeck = 0;

        //objmapping.verify_status = rejectionID;
        if (mode == "new")
            db.ec_class_attendance_master.Add(objmapping);
        db.SaveChanges();

        
        result = ISadd;

        return JsonConvert.SerializeObject(result);
    }

}