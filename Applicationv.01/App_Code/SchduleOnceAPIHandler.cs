using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Reflection;
using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;
using System.Collections.Generic;

public class SchduleOnceAPIHandler : IHttpHandler
{
    Logger objLog = new Logger();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest request = context.Request;        
        
        try
        {
            //var data1 = context.Items.Values; //GetDataOrDefault<bookingdata>();
            //string action = request.Actions.First();
            //JObject data = context.GetType<JObject>();
            //var dataAsString = Newtonsoft.Json.JsonConvert.SerializeObject(data);

            var jsonSerializer = new JavaScriptSerializer();

            var jsonString = string.Empty;

            context.Request.InputStream.Position = 0;
            using (var inputStream = new StreamReader(context.Request.InputStream))
            {
                jsonString = inputStream.ReadToEnd();
            }
            //bookingdata data = new List<bookingdata>();
            //data = jsonSerializer.Deserialize<List<bookingdata>>(jsonString);
            
            bookingdata data = Newtonsoft.Json.JsonConvert.DeserializeObject<bookingdata>(jsonString);

            string hostname = request.Url.Host.ToLower().ToString();
            string applicant_email = request.QueryString["applicantemail"];
            string utcMeetingTime = request.QueryString["utcMeetingTime"];
            string timezone = request.QueryString["timezone"];
            string meetingId = request.QueryString["meetingId"];
            //int applicantId = Convert.ToInt32(request.QueryString["applicant_id"]);  // Need to add dynamic field in schedule once to get applicant applicant id

            var universityDetails = GetUniversityDetailsfromHostName(hostname);
            int universityId = (int)universityDetails.GetType().GetProperty("universityId").GetValue(universityDetails);
            string universityName = (string)universityDetails.GetType().GetProperty("universityName").GetValue(universityDetails);
            int applicantId = GetApplicantIdfromEmail(applicant_email);

            string logFilePath = ConfigurationManager.AppSettings["Path"].ToString() + "\\" + universityName + "\\Log-ScheduleOnce-" + DateTime.Today.ToString("MM-dd-yyyy") + "." + "txt";
            FileInfo logFileInfo = new FileInfo(logFilePath);
            DirectoryInfo logDirInfo = new DirectoryInfo(logFileInfo.DirectoryName);
            if (!logDirInfo.Exists) logDirInfo.Create();
            using (FileStream fileStream = new FileStream(logFilePath, FileMode.Append))
            {
                using (StreamWriter log = new StreamWriter(fileStream))
                {
                    log.WriteLine("Received Parameters: ");
                    log.Write("Applicant Email ID: " + applicant_email + ", ");
                    log.Write("UTC Meeting Time Receieved: " + utcMeetingTime + ", ");
                    log.Write("Time Zone: " + timezone + ", ");
                    log.Write("Meeting ID: " + meetingId + ", ");
                    log.Write("Applicant ID: " + applicantId + ", ");
                    log.WriteLine("University ID: " + universityId);
                    log.WriteLine("Test obj :" + data.ToString());
                    log.WriteLine("test email :" + data.email);
                    log.WriteLine("test email :" + data.name);
                    log.WriteLine("test meetingtime :" + data.meetingtime);
                    log.WriteLine("test CustomerTime :" + data.CustomerTime);
                }
            }

            SaveMeetingDetails();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        context.Response.End();
    }
    public class bookingdata
    {
        public int universityid { get; set; }
        public int applicantid { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string eventtype { get; set; }
        public string message { get; set; }
        public DateTime meetingtime { get; set; }
        public DateTime CustomerTime { get; set; }
        public bool is_meetingtime_expires { get; set; }
    }

    private int GetApplicantIdfromEmail(string emailId)
    {
        GTEEntities db = new GTEEntities();
        int studentId = 0;
        var student = db.students.Where(x => x.email == emailId).FirstOrDefault();
        if (student != null)
            studentId = student.studentid;
        return studentId;
    }

    private object GetUniversityDetailsfromHostName(string hostname)
    {
        GTEEntities db = new GTEEntities();
        object universityDetails = null;
        var university = db.university_master.Where(x => x.hosturl == hostname).FirstOrDefault();
        if (university != null)
            universityDetails = new { universityId = university.universityid, universityName = university.university_name };
        return universityDetails;
    }

    private void SaveMeetingDetails()
    {
        // Save all query string parameters in DB Table 
    }

    public bool IsReusable
    {
        get { return false; }
    }
}