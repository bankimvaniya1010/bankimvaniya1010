using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Reflection;

public class SchduleOnceAPIHandler : IHttpHandler
{
    Logger objLog = new Logger();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest request = context.Request;
        try
        {
            string hostname = request.Url.Host.ToLower().ToString();
            string applicant_email = request.QueryString["applicantemail"];
            string utcMeetingTime = request.QueryString["utcMeetingTime"];
            string timezone = request.QueryString["timezone"];
            string meetingId = request.QueryString["meetingId"];

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
                }
            }

            SaveMeetingDetails();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
        context.Response.End();
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