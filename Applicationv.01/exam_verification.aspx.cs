using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exam_verification : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    public int UserID = 0;
    string webURL = String.Empty;
    Common objCom = new Common();
    public int UniversityID = -1;
    public int? assignid, exampaperid;
    public static TimeSpan? examtime = null;
    public static int pagerefreshed = 0;
    public string examname = "Not Set By Assessmnent creator.";
    public string studentname = "Not Set";
    public string InvigilatorName = "Not Set";
    public static TimeSpan? duration2 = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if ((Request.QueryString["assignid"] == null) || (Request.QueryString["assignid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
        {
            assignid = Convert.ToInt32(Request.QueryString["assignid"]);
            Session["assignid"] = assignid;
        }

        //exampaperid = db.exam_assign.Where(x => x.assignid == assignid).Select(x=>x.exampapersid).FirstOrDefault();

        showexamDetails();
        SaveStatus();
    }

    private void showexamDetails()
    {
        try
        {
            var exam_assign = db.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
            exampaperid = exam_assign.exampapersid;
            var examdetails = db.exam_master.Where(x => x.exampapersid == exampaperid).FirstOrDefault();
            var examscheduleDetails = db.exam_schedule.Where(x => x.exampapersid == exampaperid && x.universityid == exam_assign.universityID && x.exam_datetime == exam_assign.exam_datetime).FirstOrDefault();
            if (examdetails != null)
            {
                examname = examdetails.exam_name;

                lblutctime.InnerText = "UTC Date & Time : " + examscheduleDetails.exam_datetime_utc;
                lblcusttime.InnerText = "Your Date & Time : " + examscheduleDetails.exam_datetime + " < " + examscheduleDetails.utctimezone + " > ";

            }
            var applicantname = db.applicantdetails.Where(x => x.applicantid == exam_assign.applicantid && x.universityid == exam_assign.universityID).FirstOrDefault();
            var proctorname = db.examiner_master.Where(x => x.examinerID == exam_assign.proctorid && x.roleid == 10).FirstOrDefault();
            if (applicantname != null)
                studentname = applicantname.firstname + " " + applicantname.lastname;
            if (proctorname != null)
                InvigilatorName = proctorname.name;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    private void SaveStatus()
    {
        try
        {
            var mode = "new";
            exam_assign objapplicant = new exam_assign();

            var data = db.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objapplicant = data;
            }
            if (objapplicant.studentactiveforexam_at == null)
                objapplicant.studentactiveforexam_at = DateTime.UtcNow;
            objapplicant.is_studentactiveforexam = 1;

            if (mode == "new")
                db.exam_assign.Add(objapplicant);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string isaccesstoexamgiven(int assignID)
    {
        string response = "0";
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        var examtype = db1.exam_master.Where(x => x.exampapersid == data.exampapersid).FirstOrDefault();
        var scheduleData = db1.exam_schedule.Where(x => x.universityid == data.universityID && x.exampapersid == data.exampapersid && x.exam_datetime == data.exam_datetime).FirstOrDefault();

        if (examtype != null)
        {
            if (examtype.isautomaticstart == 1)
            {
                if (scheduleData != null)
                {
                    DateTime currentutcdate_time = DateTime.UtcNow;
                    string current_utcTime = currentutcdate_time.ToString("hh:mm:ss");
                    string current_utcDate = currentutcdate_time.ToString("dd MMMM, yyyy");

                    DateTime examdattime_utc = Convert.ToDateTime(scheduleData.exam_datetime_utc);
                    string exam_utctime = examdattime_utc.ToString("hh:mm:ss");
                    string exam_utcDate = examdattime_utc.ToString("dd MMMM, yyyy");

                    duration2 = DateTime.Parse(exam_utctime).Subtract(DateTime.Parse(current_utcTime));
                    examtime = null;
                    examtime = duration2;

                    if (!string.IsNullOrEmpty(data.status) && (data.status.Trim() == "Not Present" || data.status.Trim() == "Not Verified"))
                        response = data.status;
                    else if (!string.IsNullOrEmpty(data.status) && data.status == "Verified")
                    {
                        if (pagerefreshed != 1)
                            pagerefreshed = 1;
                        if (duration2.ToString() != "00:00:00")
                        {                           
                            response = "showclock";
                        }
                        else
                            response = examtype.uploadtype.ToString();
                        //HttpContext.Current.Session["examtime"] = duration2;
                    }
                    else
                        response = "0";
                }
                else
                    response = "0";
            }        
            else
        {
            //manual
            if (data.status != null)
            {
                if (data.status.Trim() == "Not Present" || data.status.Trim() == "Not Verified")
                    response = data.status;
                else if (data.status == "Verified")
                {
                    if (data.is_examstarted == true)
                        response = examtype.uploadtype.ToString();
                    else
                        response = "Notstarted";
                }
            }
            else
                response = "NoAccess";
        }
        }
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
        if(!string.IsNullOrEmpty(data.status) && (data.status.Trim() == "Verified" || data.status.Trim() == "Complete"))
        objmapping.status = "Absent";
        if (mode == "new")
            db1.exam_assign.Add(objmapping);
        db1.SaveChanges();
        return JsonConvert.SerializeObject(response);
    }
}

