using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class ec_class_join : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    public int UserID = 0;
    string webURL = String.Empty;
    Common objCom = new Common();
    public int UniversityID = -1;
    public int? RecordID, exampaperid;
    public static TimeSpan? examtime = null;
    public static int pagerefreshed = 0;
    public string examname = "Not Set By Assessmnent creator.";
    public string studentname = "Not Set";
    public string InvigilatorName = "Not Set";
    public static TimeSpan? duration2 = null;
    public string joinclass_link, classname, classdate, class_starttime, class_endtime, username, instructorname;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if ((Request.QueryString["ID"] == null) || (Request.QueryString["ID"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
        {
            RecordID = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = RecordID;
        }
        checkEntry_foreachClass();
        showexamDetails();
    }

    private void showexamDetails()
    {
        try
        {
            //verificationStatus = "- WAIT TO BE VERIFIED";
            username = objCom.GetApplicantFirstName(UserID);
            instructorname = "NOT SET";
            var Record_details = db.ec_class_date_schedule_master.Where(x => x.id == RecordID).FirstOrDefault();
            var class_details = db.ec_class_master.Where(x => x.id == Record_details.classID).FirstOrDefault();

            classname = class_details.classname;
            classdate = Convert.ToDateTime(Record_details.class_datetime_start).ToString("dd/MM/yyyy");
            class_starttime = Convert.ToDateTime(class_details.class_starttime).ToString("hh:mm tt");
            class_endtime = Convert.ToDateTime(class_details.class_endtime).ToString("hh:mm tt");
            if(Record_details.instructorID != null)
                instructorname = db.examiner_master.Where(x => x.examinerID == Record_details.instructorID).Select(x => x.username).FirstOrDefault();
            joinclass_link = class_details.virtuallink;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string class_statement(int RecordID)
    {
        string status = "- WAIT TO BE VERIFIED";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        int UserID = 0;
        if (!string.IsNullOrEmpty(HttpContext.Current.Session["UserID"].ToString()))
            UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());
        var data = db1.ec_class_attendance_master.Where(x => x.applicantid == UserID && x.universityid == universityID1 && x.class_dateID == RecordID).FirstOrDefault();
        if (data != null)
        {
            if (!string.IsNullOrEmpty(data.verify_status))
            {
                if (data.verify_status.ToLower() == "verified")
                    status = "you have been verified. Please wait for this class to start.";
                else if (data.verify_status.ToLower() == "not verified")
                    status = "you have been not been verified. Please wait for this class to start.";
                if (data.verify_status.ToLower() == "verified" && data.Is_class_started == 1)
                {
                    var Record_details = db1.ec_class_date_schedule_master.Where(x => x.id == RecordID).FirstOrDefault();
                    string instructorname=string.Empty;
                    if (Record_details.instructorID != null)
                        instructorname = db1.examiner_master.Where(x => x.examinerID == Record_details.instructorID).Select(x => x.username).FirstOrDefault();

                    status = "your class instructor," + instructorname + " has started this class.";
                }
            }
        }
        return JsonConvert.SerializeObject(status);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string class_status(int RecordID)
    {
        string status ="- WAIT TO BE VERIFIED";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        int UserID = 0;
        if (!string.IsNullOrEmpty(HttpContext.Current.Session["UserID"].ToString()))
            UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());
        var data = db1.ec_class_attendance_master.Where(x => x.applicantid == UserID && x.universityid == universityID1 && x.class_dateID == RecordID).FirstOrDefault();
        if (data != null)
        {
            if (!string.IsNullOrEmpty(data.verify_status))
            {
                if (data.verify_status.ToLower() == "verified")
                    status = "- WAIT FOR CLASS TO START";
                else
                    status = "- " + data.verify_status;

                if (data.Is_class_started == 1 && data.verify_status.ToLower() == "verified")
                    status = "- CLASS HAS STARTED";
            }
        }
        return JsonConvert.SerializeObject(status);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string class_start_status(int RecordID)
    {
        string class_start_status = "NO";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        int UserID = 0;
        if (!string.IsNullOrEmpty(HttpContext.Current.Session["UserID"].ToString()))
            UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());
        var data = db1.ec_class_attendance_master.Where(x => x.applicantid == UserID && x.universityid == universityID1 && x.class_dateID == RecordID).FirstOrDefault();
        var class_data = db1.ec_class_master.Where(x => x.id == data.classID).FirstOrDefault();
        if (class_data != null)
        {
            var date_data = db1.ec_class_date_schedule_master.Where(x => x.id == RecordID).FirstOrDefault();
            DateTime currentutcdate_time = DateTime.UtcNow;
            
            DateTime examdattime_utc = Convert.ToDateTime(date_data.class_datetime_start_utc);

            if (examdattime_utc < currentutcdate_time) {
                class_start_status = "Hide";
            }
            else
            {
                if (class_data.classsetting == 2)
                    class_start_status = "Manual";
                else
                {
                    if (data != null)
                    {

                        if (!string.IsNullOrEmpty(data.verify_status))
                        {
                            if (data.Is_class_started == 1 && data.verify_status.ToLower() == "verified")
                                class_start_status = "YES";
                        }
                    }
                }
            }
        }
        return JsonConvert.SerializeObject(class_start_status);
    }
    

   [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string isaccesstoexamgiven(int RecordID)
    {
        string response = "0";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        
        int UserID = 0;
        if (!string.IsNullOrEmpty(HttpContext.Current.Session["UserID"].ToString())) 
            UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());
        ec_class_attendance_master objmapping = new ec_class_attendance_master();

        var data = db1.ec_class_date_schedule_master.Where(x => x.id == RecordID).FirstOrDefault();
        var class_data = db1.ec_class_master.Where(x => x.id == data.classID).FirstOrDefault();
        var attendance = db1.ec_class_attendance_master.Where(x => x.class_dateID == RecordID && x.applicantid == UserID && x.universityid == universityID1).FirstOrDefault();
        if (attendance != null)
        {
            objmapping = attendance;
        }

        if (data != null)
        {
            if (class_data != null)
            {
                DateTime currentutcdate_time = DateTime.UtcNow;
                string current_utcTime = currentutcdate_time.ToString("hh:mm:ss");
                string current_utcDate = currentutcdate_time.ToString("dd MMMM, yyyy");

                DateTime examdattime_utc = Convert.ToDateTime(data.class_datetime_start_utc);
                string exam_utctime = examdattime_utc.ToString("hh:mm:ss");
                string exam_utcDate = examdattime_utc.ToString("dd MMMM, yyyy");

                if (class_data.classsetting == 1)
                {
                   
                    //duration2 = DateTime.Parse(exam_utctime).Subtract(DateTime.Parse(current_utcTime));
                    //examtime = null;
                    //examtime = duration2;

                    if (examdattime_utc < currentutcdate_time)
                    {
                        response = "ClassStop";
                        if (string.IsNullOrEmpty(objmapping.verify_status))
                        {
                            objmapping.verify_status = "Not Present";
                            db1.SaveChanges();
                        }
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(attendance.verify_status) && (attendance.verify_status.Trim() == "Not Present" || attendance.verify_status.Trim() == "Not Verified"))
                            response = attendance.verify_status;
                        else if (!string.IsNullOrEmpty(attendance.verify_status) && attendance.verify_status == "Verified")
                        {

                            System.TimeSpan diffResult = examdattime_utc - currentutcdate_time;

                            int days = (int)diffResult.TotalDays;
                            string time = diffResult.Hours + ":" + diffResult.Minutes;

                            if (time != "0:0" || time != "00:00")
                                response = "Your class will be start in" + diffResult.Days + " Days " + diffResult.Hours + " Hours " + diffResult.Minutes + " Minutes " + diffResult.Seconds + "Seconds";
                            else
                                response = "startClass";

                        }
                        else
                            response = "0";
                    }
                }
                else
                {
                    response = "Manualclassstart";
                    if (examdattime_utc < currentutcdate_time)
                    {
                        if (objmapping.Is_loggedin != 1 && string.IsNullOrEmpty(objmapping.verify_status))
                        {
                            objmapping.verify_status = "Not Present";
                            db1.SaveChanges();

                        }
                    }
                }
            }
            else
                response = "0";
        }
        else
            response = "0";
        return JsonConvert.SerializeObject(response);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string islogout(int assignID)
    {
        string response = string.Empty;
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var mode = "new";
        exam_assign objmapping = new exam_assign();
        var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        if (data != null)
        {
            mode = "update";
            objmapping = data;
        }
        if (!string.IsNullOrEmpty(data.status) && (data.status.Trim() == "Verified" || data.status.Trim() == "Complete"))
            objmapping.status = "Absent";
        if (mode == "new")
            db1.exam_assign.Add(objmapping);
        db1.SaveChanges();
        return JsonConvert.SerializeObject(response);
    }


    protected void btn_active_Click(object sender, EventArgs e)
    {
        try {
            ec_class_attendance_master objmapping = new ec_class_attendance_master();
            
            var attendance = db.ec_class_attendance_master.Where(x => x.applicantid == UserID && x.universityid == UniversityID && x.class_dateID == RecordID).FirstOrDefault();
            objmapping.Is_loggedin = 1;
            objmapping.login_time_utc = DateTime.UtcNow;

            db.SaveChanges();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    private void checkEntry_foreachClass()
    {
        try
        {
            var Record_details = db.ec_class_date_schedule_master.Where(x => x.id == RecordID).FirstOrDefault();

            var details = db.ec_class_attendance_master.Where(x => x.universityid == UniversityID && x.applicantid == UserID && x.class_dateID == RecordID).FirstOrDefault();
            if (details == null)
            {
                ec_class_attendance_master objmapping = new ec_class_attendance_master();

                objmapping.applicantid = UserID;
                objmapping.classID = Record_details.classID;
                objmapping.class_dateID = RecordID;
                objmapping.universityid = UniversityID;
                db.ec_class_attendance_master.Add(objmapping);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
}

