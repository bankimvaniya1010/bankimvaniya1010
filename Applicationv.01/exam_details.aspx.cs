using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exam_details : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    string webURL = String.Empty;
    protected static List<faq> allQuestions = new List<faq>();
    Common objCom = new Common();
    public int UniversityID = -1;
    int examid = 0;
    exam_master exam_Data = new exam_master();
    exam_schedule exam_schedulData = new exam_schedule();
    exam_assign exam_assign = new exam_assign();
    DateTime assignDate, currentutcdate_time, examdattime_utc, examdatetime, examdattime_utc_plus30;
    public string virtualmeetinglink = "Not Set";
    public string proctorname = "Not Set";
    public string proctoremail = "Not Set";
    public string examinstruction = "Not Set By Assessmnent creator.";
    public string examname = "Not Set By Assessmnent creator."; 

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if ((Request.QueryString["examid"] == null) || (Request.QueryString["examid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            examid = Convert.ToInt32(Request.QueryString["examid"]);

        if ((Request.QueryString["assignDate"] == null) || (Request.QueryString["assignDate"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignDate = Convert.ToDateTime(Request.QueryString["assignDate"]);

        exam_assign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == examid && x.exam_datetime == assignDate).FirstOrDefault();

        if (exam_assign.status == "Completed")
        {
            Div1.Attributes.Add("style", "display:block;");
            divexamname.Attributes.Add("style", "display:none;");
            divInstruction.Attributes.Add("style", "display:none;");
            para1.Attributes.Add("style", "display:none;");
            lblmsg.InnerText = "You have answered all question ";
        }
        else {
            exam_Data = db.exam_master.Where(x => x.exampapersid == examid && x.universityID == UniversityID).FirstOrDefault();
            exam_schedulData = db.exam_schedule.Where(x => x.exam_datetime == assignDate && x.exampapersid == examid && x.exam_datetime == assignDate).FirstOrDefault();

            examinstruction = exam_Data.exam_instruction;
            examname = exam_Data.exam_name;

            if (exam_Data != null & exam_schedulData != null)
            {

                currentutcdate_time = DateTime.UtcNow;
                string current_utcTime = currentutcdate_time.ToString("hh:mm tt");
                string current_utcDate = currentutcdate_time.ToString("dd MMMM, yyyy");

                examdattime_utc = Convert.ToDateTime(exam_schedulData.exam_datetime_utc);
                string exam_utctime = examdattime_utc.ToString("hh:mm tt");
                string exam_utcDate = examdattime_utc.ToString("dd MMMM, yyyy");

                examdattime_utc_plus30 = examdattime_utc.AddMinutes(30); //scheduletime plus 30 min
                string exam_utctime_plus30 = examdattime_utc_plus30.ToString("hh:mm tt");

                examdatetime = Convert.ToDateTime(exam_schedulData.exam_datetime);
                string exam_time = examdatetime.ToString("hh:mm tt");
                string exam_Date = examdatetime.ToString("dd MMMM, yyyy");

                int result = DateTime.Compare(examdattime_utc, currentutcdate_time);
                if (current_utcDate == exam_utcDate)
                {
                    if (Convert.ToDateTime(exam_utctime) <= Convert.ToDateTime(current_utcTime))
                    {
                        if (Convert.ToDateTime(current_utcTime) <= Convert.ToDateTime(exam_utctime_plus30))
                        {
                            toshowmeetingtime(exam_utcDate, exam_utctime, exam_time, exam_Date);
                            para2.Attributes.Add("style", "display:block;");
                            para21.Attributes.Add("style", "display:block;");
                            // once verified 
                            //var examverifies = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == examid && x.exam_datetime == assignDate).FirstOrDefault();
                            //if (examverifies.is_verified != true && examverifies.status != null)
                            //{
                            //    toshowmeetingtime(exam_utcDate, exam_utctime, exam_time, exam_Date);
                            //    para2.Attributes.Add("style", "display:block;");
                            //    para21.Attributes.Add("style", "display:block;");
                            //}
                            //else
                            //    Response.Redirect(webURL + "exammodule.aspx", true);
                        }
                    }
                    else
                    {
                        toshowmeetingtime(exam_utcDate, exam_utctime, exam_time, exam_Date);
                    }

                    // if meeting time is expires after 30 min
                    if (Convert.ToDateTime(exam_utctime_plus30) < Convert.ToDateTime(current_utcTime))
                    {
                        meetingschedulrexpires();
                    }
                }
                else if (result < 0)
                {
                    meetingschedulrexpires(); // if meeting date is expires 
                }
                else
                {
                    toshowmeetingtime(exam_utcDate, exam_utctime, exam_time, exam_Date);
                }
            }
        }

        if (!IsPostBack)
            allQuestions = objCom.FaqQuestionList();
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
            divexamname.Attributes.Add("style", "display:none;");
            divInstruction.Attributes.Add("style", "display:none;");
            meetingrexpiresDiv.Attributes.Add("style", "display:block;");

            //status 
            var mode = "new";
            var Schedule = (from pInfo in db.exam_assign
                            where pInfo.exam_datetime == assignDate && pInfo.applicantid == UserID && pInfo.universityID == UniversityID && pInfo.is_expired == null
                            select pInfo).FirstOrDefault();
            exam_assign objexam_assign = new exam_assign();
            if (Schedule != null)
            {
                mode = "update";
                objexam_assign = Schedule;
            }
            objexam_assign.is_expired = true;
            objexam_assign.status = "Expired";
            if (mode == "new")
                db.exam_assign.Add(objexam_assign);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    private void toshowmeetingtime(string exam_utcDate, string exam_utctime, string exam_time, string exam_Date)
    {
        para1.Attributes.Add("style", "display:block;");
        //para3.Attributes.Add("style", "display:block;");
        para4.Attributes.Add("style", "display:block;");
        lblutctime.InnerText = "UTC Date & Time : " + exam_utcDate + " at " + exam_utctime;
        lblcusttime.InnerText = "Your Date & Time : " + exam_Date + " at " + exam_time;
        ifadminproctordetailsupdate();
    }

    private void ifadminproctordetailsupdate()
    {
        para5.Attributes.Add("style", "display:block;");
        para6.Attributes.Add("style", "display:block;");

        var assigndata = db.exam_assign.Where(x => x.exam_datetime == assignDate).FirstOrDefault();
        int examienrid = Convert.ToInt32(assigndata.proctorid);
        var proctordata = db.examiner_master.Where(x => x.examinerID == examienrid).FirstOrDefault();

        virtualmeetinglink = assigndata.virtuallink;
        proctorname = proctordata.name;
        proctoremail = proctordata.email;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        var student_Passkey = txtstudepassskey.Value;
        var proctor_Passkey = txtproctorepasskey.Value;

        var mode = "new";
        var Schedule = (from pInfo in db.exam_assign
                        where pInfo.exampapersid == examid && pInfo.exam_datetime == assignDate && pInfo.applicantid == UserID && pInfo.universityID == UniversityID && pInfo.status == null
                        select pInfo).FirstOrDefault();
        exam_assign objexam_assign = new exam_assign();

        if (Schedule != null)
        {
            mode = "update";
            objexam_assign = Schedule;
        }
        if (Schedule.studentpasskey != student_Passkey)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' student Passkey does not match')", true);
        else if (Schedule.proctorpasskey != proctor_Passkey)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Invigilator Passkey does not match')", true);
        else
        {
            objexam_assign.is_verified = true;
            objexam_assign.is_expired = null;
            if (mode == "new")
                db.exam_assign.Add(objexam_assign);
            db.SaveChanges();

            var examtype = db.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == examid).Select(x=>x.uploadtype).FirstOrDefault();
            if(examtype != null && examtype == 1)
                Response.Redirect(webURL + "view_exampaper.aspx?assignID=" + objexam_assign.assignid + "", true);
            else if (examtype != null && examtype == 2)
                Response.Redirect(webURL + "view_exampaper2.aspx?assignID="+objexam_assign.assignid+"", true);
            else if (examtype != null && examtype == 3)
                Response.Redirect(webURL + "view_exampaper3.aspx?assignID=" + objexam_assign.assignid + "", true);
        }
    }
}