using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class schedule_conselling : System.Web.UI.Page
{
    int UserID = 0;
    Common objCom = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;    

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
            allfaqQuestion = objCom.FaqQuestionList();
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = false)]
    public static void AddBookingData (string uData)
    {        
        GTEEntities db1 = new GTEEntities();
        Common objCom = new Common();
        bookingdata data = Newtonsoft.Json.JsonConvert.DeserializeObject<bookingdata>(uData);//to DeserializeObject

        int UniversityID = Utility.GetUniversityId();
        int UserID = data.applicantid;
        int? proctor_id = 0;
        string virtualmeetinginfo = string.Empty;
        //to expire meeting
        var schedule_data_list = db1.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).ToList();
        if (schedule_data_list.Count >= 1)
        {
            foreach (var item in schedule_data_list)
            {
                item.is_meetingtime_expires = false;
                if (item.proctor_id != null)
                {
                    proctor_id = item.proctor_id;
                    if (item.virtualmeetinginfo != null)
                        virtualmeetinginfo = item.virtualmeetinginfo;
                }
            }
            db1.SaveChanges();
            //also check if proctor is assign thenm assign same else nothing
            

            schedule_data_list = db1.applicant_meeting_schedule.Where(x => x.applicant_id == UserID && x.university_id == UniversityID && x.is_meetingtime_expires == null).ToList();
            if (schedule_data_list.Count == 0) {
                applicant_meeting_schedule objSchedule = new applicant_meeting_schedule();
                objSchedule.applicant_id = data.applicantid;
                objSchedule.university_id = data.universityid;
                objSchedule.applicant_email_id = data.email;
                objSchedule.utc_meeting_time = data.meetingtime;
                objSchedule.applicant_time_zone = data.CustomerTime;
                objSchedule.event_type_name = data.eventtype;
                objSchedule.is_meetingtime_expires = null;
                // also generate otp
                Random random = new Random();
                int otp = random.Next(100000, 999999);
                objSchedule.otp = Convert.ToString(otp);
                objSchedule.is_otp_generated = true;
                if (proctor_id != 0)
                    objSchedule.proctor_id = proctor_id;
                if (virtualmeetinginfo != null)
                    objSchedule.virtualmeetinginfo = virtualmeetinginfo;
                db1.applicant_meeting_schedule.Add(objSchedule);
                db1.SaveChanges();

                //send email to proctor
                var university = db1.university_master.Where(x => x.universityid == UniversityID).FirstOrDefault();
                var studentname = db1.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.firstname + " " + x.lastname).FirstOrDefault();
                var proctordata = db1.proctor_master.Where(x => x.proctorID == proctor_id).FirstOrDefault();

                string html = File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("/assets/Emailtemplate/proctorNotificationwithotp.html"));

                html = html.Replace("@proctorName", proctordata.name);
                html = html.Replace("@studentname", studentname);
                html = html.Replace("@eventtype", objSchedule.event_type_name);
                html = html.Replace("@passkey", objSchedule.otp);
                html = html.Replace("@virtuallink", objSchedule.virtualmeetinginfo);
                html = html.Replace("@utcmeetingtime", objSchedule.utc_meeting_time.ToString("dd/MM/yyyy hh:mm tt"));
                html = html.Replace("@meetingtime", objSchedule.applicant_time_zone.ToString("dd/MM/yyyy hh:mm tt"));
                objCom.SendMail(proctordata.email, html, "Assessment ReSchedule for " + studentname + " at " + objSchedule.applicant_time_zone.ToString("dd/MM/yyyy hh:mm tt"));
                }
        }
        else if (schedule_data_list.Count == 0)
        {
            applicant_meeting_schedule objSchedule = new applicant_meeting_schedule();
            objSchedule.applicant_id = data.applicantid;
            objSchedule.university_id = data.universityid;
            objSchedule.applicant_email_id = data.email;
            objSchedule.utc_meeting_time = data.meetingtime;
            objSchedule.applicant_time_zone = data.CustomerTime;
            objSchedule.event_type_name = data.eventtype;
            objSchedule.is_meetingtime_expires = null;
            // also generate otp
            Random random = new Random();
            int otp = random.Next(100000, 999999);
            objSchedule.otp = Convert.ToString(otp);
            objSchedule.is_otp_generated = true;
            db1.applicant_meeting_schedule.Add(objSchedule);
            db1.SaveChanges();
        }
    }

    public class bookingdata
    {
        public int universityid;
        public int applicantid;
        public string name;
        public string email;
        public string eventtype;
        public string message;
        public DateTime meetingtime;
        public DateTime CustomerTime;
        public bool is_meetingtime_expires;
    }

}