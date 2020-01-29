using System;
using System.Collections.Generic;
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
        bookingdata data = Newtonsoft.Json.JsonConvert.DeserializeObject<bookingdata>(uData);//to DeserializeObject
        
        applicant_meeting_schedule objSchedule = new applicant_meeting_schedule();
        objSchedule.applicant_id = data.applicantid;
        objSchedule.university_id = data.universityid;
        objSchedule.applicant_email_id = data.email;
        objSchedule.utc_meeting_time = data.meetingtime.Date;
        objSchedule.applicant_time_zone = data.CustomerTime;
        db1.applicant_meeting_schedule.Add(objSchedule);
        db1.SaveChanges();
    }

    public class bookingdata
    {
        public int universityid;
        public int applicantid;
        public string name;
        public string email;
        public string eventype;
        public string message;
        public DateTime meetingtime;
        public DateTime CustomerTime;
    }

}