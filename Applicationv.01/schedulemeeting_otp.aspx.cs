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
    DateTime meetingTime, fiveminbeforemeeetingtimeis, currenttime,meetingtime_30min;

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

        var scheduledata = db.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).FirstOrDefault();

        withotp.Attributes.Add("style", "display:block;");
        lblwithotp.InnerText = "Enter your Passkey";

        //meetingTime = Convert.ToDateTime(scheduledata.applicant_time_zone);
        //string mainmeetingtime = meetingTime.ToString("HH:mm");
        //string mainmeetingDate = meetingTime.ToString("dd/MM/yyyy");

        //fiveminbeforemeeetingtimeis = meetingTime.AddMinutes(-5);
        //string meeting_date = fiveminbeforemeeetingtimeis.ToString("dd/MM/yyyy");
        //string meeting_time = fiveminbeforemeeetingtimeis.ToString("HH:mm");

        //currenttime = DateTime.Now;
        //string cur_time = currenttime.ToString("HH:mm");
        //string cur_date = currenttime.ToString("dd/MM/yyyy");

        //meetingtime_30min = meetingTime.AddMinutes(30);
        //string plus30_time = meetingtime_30min.ToString("HH:mm");



        //int result = DateTime.Compare(meetingTime, currenttime); // to compare dates

        //if (mainmeetingDate == cur_date)
        //{
        //    if (Convert.ToDateTime(meeting_time) <= Convert.ToDateTime(cur_time))
        //    {
        //        if (Convert.ToDateTime(cur_time) <= Convert.ToDateTime(plus30_time))
        //        {
        //            withotp.Attributes.Add("style", "display:block;");
        //            lblwithotp.InnerText = "Enter your Passkey";
        //        }
        //    }
        //    else
        //    {
        //        toshowmeetingtime();
        //    }

        //    // if meeting time is expires after 30 min
        //    if (Convert.ToDateTime(plus30_time) < Convert.ToDateTime(cur_time))
        //    {
        //        meetingschedulrexpires();
        //    }
        //}
        //else if (result < 0)
        //{
        //    meetingschedulrexpires();
        //}
        //else
        //{
        //    toshowmeetingtime();
        //}

    }

    private void toshowmeetingtime() {
        btnsubmit.Visible = false;
        withoutotp.Attributes.Add("style", "display:block;");
        lblwithoutotp.InnerText = "Your test scheduled at time " + meetingtime;
    }
    private void meetingschedulrexpires()
    {
        try
        {
            btnsubmit.Visible = false;
            withoutotp.Attributes.Add("style", "display:block;");
            withotp.Attributes.Add("style", "display:none;");
            lblwithoutotp.InnerText = "No Show.Meeting time is expired please reshedule counselling.";
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
        catch (Exception ex) {
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
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enteres otp does not match')", true);
        else
        {
            if (objapplicant_meeting_schedule.otp != null)
                objapplicant_meeting_schedule.is_otp_generated = true;
            objapplicant_meeting_schedule.is_otpverified = true;
            objapplicant_meeting_schedule.is_meetingtime_expires = null ;
            if (mode == "new")
                db.applicant_meeting_schedule.Add(objapplicant_meeting_schedule);
            db.SaveChanges();
            Response.Redirect(webURL + "gte_preliminary_section.aspx?formid=18", true);
        }
        
    }
}