using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class schedulemeeting_otp : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = string.Empty;
    int UniversityID = -1;
    string meetingtime;
    string username;
    public string virtualmeetinglink = "Not Set";
    public string proctorname = "Not Set";
    public string proctoremail = "Not Set";
    public string proctormobile = "Not Set";
    DateTime utcmeeting_datetime, applicantmeeting_datetime , currentutcdate_time , utcmeeting_datetime_plus30;
   
    applicant_meeting_schedule scheduledata = new applicant_meeting_schedule();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if ((Request.QueryString["meetingtime"] == null) || (Request.QueryString["meetingtime"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            meetingtime = Request.QueryString["meetingtime"];

        scheduledata = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).FirstOrDefault();

        if (scheduledata != null)
        {
            currentutcdate_time = DateTime.UtcNow;
            string cur_utc_time = currentutcdate_time.ToString("hh:mm tt");
            string cur_utc_date = currentutcdate_time.ToString("dd MMMM, yyyy");

            utcmeeting_datetime = scheduledata.utc_meeting_time;
            string meeting_utctime = utcmeeting_datetime.ToString("hh:mm tt");
            string meeting_utcDate = utcmeeting_datetime.ToString("dd MMMM, yyyy");

            utcmeeting_datetime_plus30 = utcmeeting_datetime.AddMinutes(30); //scheduletime plus 30 min
            string meeting_utctime_plus30 = utcmeeting_datetime_plus30.ToString("hh:mm tt");

            applicantmeeting_datetime = scheduledata.applicant_time_zone;
            string appmeetingtime = applicantmeeting_datetime.ToString("hh:mm tt");
            string appmeetingDate = applicantmeeting_datetime.ToString("dd MMMM, yyyy");

            int result = DateTime.Compare(utcmeeting_datetime,currentutcdate_time);

            if (cur_utc_date == meeting_utcDate) {
                if (Convert.ToDateTime(meeting_utctime) <= Convert.ToDateTime(cur_utc_time))
                {
                    if (Convert.ToDateTime(cur_utc_time) <= Convert.ToDateTime(meeting_utctime_plus30))
                    {
                        toshowmeetingtime(meeting_utcDate, meeting_utctime, appmeetingDate, appmeetingtime);
                        para2.Attributes.Add("style", "display:block;");
                    }
                }
                else
                {
                    toshowmeetingtime(meeting_utcDate, meeting_utctime, appmeetingDate, appmeetingtime);
                }

                // if meeting time is expires after 30 min
                if (Convert.ToDateTime(meeting_utctime_plus30) < Convert.ToDateTime(cur_utc_time))
                {
                    meetingschedulrexpires();
                }
            }
            else if (result < 0) {
                meetingschedulrexpires();// if meeting date is expires 
            }
            else {
                toshowmeetingtime(meeting_utcDate, meeting_utctime,appmeetingDate,appmeetingtime);
            }
        }
    }

    private void toshowmeetingtime(string meeting_utcDate, string meeting_utctime, string appmeetingDate , string appmeetingtime) {
        para1.Attributes.Add("style", "display:block;");        
        para3.Attributes.Add("style", "display:block;");
        para4.Attributes.Add("style", "display:block;");
        lblutctime.InnerText = "UTC Date & Time : " + meeting_utcDate + " at " + meeting_utctime;
        lblcusttime.InnerText = "Your Date & Time : " + appmeetingDate + " at " + appmeetingtime;
        ifadminproctordetailsupdate();
    }

    private void ifadminproctordetailsupdate() {
        if(scheduledata.proctor_id != null)
        {
            //para4.Attributes.Add("style", "display:block;");
            para5.Attributes.Add("style", "display:block;");
            para6.Attributes.Add("style", "display:block;");

            var proctordata = db.proctor_master.Where(x => x.proctorID == scheduledata.proctor_id).FirstOrDefault();

            virtualmeetinglink = scheduledata.virtualmeetinginfo;
            if (proctordata != null)
            {
                proctorname = proctordata.name;
                proctoremail = proctordata.email;
                proctormobile = proctordata.mobile;
            }
        }
    }

    private void meetingschedulrexpires()
    {
        try
        {
            para1.Attributes.Add("style", "display:none;");
            para2.Attributes.Add("style", "display:none;");
            para3.Attributes.Add("style", "display:none;");
            para4.Attributes.Add("style", "display:none;");
            para5.Attributes.Add("style", "display:none;");
            para6.Attributes.Add("style", "display:none;");
            meetingrexpiresDiv.Attributes.Add("style", "display:block;");
            
            //status 
            var mode = "new";
            var Schedule = (from pInfo in db.applicant_meeting_schedule
                            where pInfo.applicant_id == UserID && pInfo.university_id == UniversityID && pInfo.is_meetingtime_expires == null
                            select pInfo).FirstOrDefault();
            applicant_meeting_schedule objapplicant_meeting_schedule = new applicant_meeting_schedule();
            if (Schedule != null)
            {
                mode = "update";
                objapplicant_meeting_schedule = Schedule;
            }
            objapplicant_meeting_schedule.is_meetingtime_expires = true;
            if (mode == "new")
                db.applicant_meeting_schedule.Add(objapplicant_meeting_schedule);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        var enteredPasskey = txtpassskey.Value;
        var mode = "new";
        var Schedule = (from pInfo in db.applicant_meeting_schedule
                        where pInfo.applicant_id == UserID && pInfo.university_id == UniversityID && pInfo.is_meetingtime_expires == null
                        select pInfo).FirstOrDefault();
        applicant_meeting_schedule objapplicant_meeting_schedule = new applicant_meeting_schedule();

        if (Schedule != null)
        {
            mode = "update";
            objapplicant_meeting_schedule = Schedule;
        }
        if (!string.IsNullOrEmpty(Schedule.otp) && Schedule.otp != enteredPasskey)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Passkey does not match')", true);
        else
        {
            if (objapplicant_meeting_schedule.otp != null)
                objapplicant_meeting_schedule.is_otp_generated = true;
            objapplicant_meeting_schedule.is_otpverified = true;
            objapplicant_meeting_schedule.is_meetingtime_expires = null;
            if (mode == "new")
                db.applicant_meeting_schedule.Add(objapplicant_meeting_schedule);
            db.SaveChanges();
            Response.Redirect(webURL + "gte_preliminary_section.aspx?formid=18", true);
        }
    }
}