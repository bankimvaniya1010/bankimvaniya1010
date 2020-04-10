using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    public int? questioncompleted = 0 , isclarificationquestionset = 0;
    string webURL = String.Empty;
    int universityID;
    int UserID = 0;    
    public string logourl = string.Empty;
    public string fontColor = string.Empty;
    public string headercolor = string.Empty;
    public string verticalnavigationcolor = string.Empty;
    public string username = string.Empty;
    public string useremail = string.Empty;
    DateTime meetingTime, fiveminbeforemeeetingtimeis, currenttime ;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());        

        var gteQuestionPart2Count = db.gte_question_master_part2.Count();
        var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();

        if (applicant_response.Count == gteQuestionPart2Count) // Condition for checking gte Questions Part 2 completed
            questioncompleted = 1;

        var clarification_questionsList = db.gte_clarification_questionmaster.ToList();

        foreach (var item in applicant_response)
            clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

        if (clarification_questionsList.Count == 0)
            isclarificationquestionset = 0;
        else
            isclarificationquestionset = 1;

        ////scheduling time
        //var schedulingData = db.applicant_meeting_schedule.Where(x => x.university_id == universityID && x.applicant_id == UserID && x.is_meetingtime_expires == null).FirstOrDefault();
        //if (schedulingData != null)
        //    Session["meetingTime"] = schedulingData.applicant_time_zone;
        //else
        //    Session["meetingTime"] = null;
        //if (Session["meetingTime"] != null)
        //{
        //    meetingTime = Convert.ToDateTime(Session["meetingTime"]);
        //    string main_meetingTime = Convert.ToDateTime(Session["meetingTime"]).ToString("HH:mm");

        //    fiveminbeforemeeetingtimeis = meetingTime.AddMinutes(-5);
        //    string meeting_date = fiveminbeforemeeetingtimeis.ToString("dd/MM/yyyy");
        //    dynamic meeting_time = Convert.ToDateTime(fiveminbeforemeeetingtimeis).ToString("HH:mm");

        //    currenttime = DateTime.Now;
        //    string cur_time = Convert.ToDateTime(currenttime).ToString("HH:mm");
        //    string cur_date = currenttime.ToString("dd/MM/yyyy");

        //    if (meeting_date == cur_date)
        //    {
        //        if (Convert.ToDateTime(meeting_time) <= Convert.ToDateTime(cur_time))
        //        {
        //            if (Convert.ToDateTime(cur_time) <= Convert.ToDateTime(main_meetingTime))
        //            {
        //                if (string.IsNullOrEmpty(schedulingData.otp))
        //                {
        //                    //genrate otp
        //                    int otp = objCom.RandomNumber(100000, 999999);
        //                    var mode = "new";
        //                    var Schedule = (from pInfo in db.applicant_meeting_schedule
        //                                    where pInfo.applicant_id == UserID && pInfo.university_id == universityID && pInfo.is_meetingtime_expires == null
        //                                    select pInfo).FirstOrDefault();
        //                    applicant_meeting_schedule objapplicant_meeting_schedule = new applicant_meeting_schedule();
        //                    if (Schedule != null)
        //                    {
        //                        mode = "update";
        //                        objapplicant_meeting_schedule = Schedule;
        //                    }
        //                    objapplicant_meeting_schedule.otp = Convert.ToString(otp);
        //                    objapplicant_meeting_schedule.is_otp_generated = true;
        //                    if (mode == "new")
        //                        db.applicant_meeting_schedule.Add(objapplicant_meeting_schedule);
        //                    db.SaveChanges();

        //                    //send email
        //                    students loggedInApplicant1 = (students)Session["LoginInfo"];
        //                    username = loggedInApplicant1.username;

        //                    var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        //                    string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/proctorNotificationwithotp.html"));
        //                    html = html.Replace("@UniversityName", university.university_name);
        //                    html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);
        //                    html = html.Replace("@proctorName", university.proctor1_name);
        //                    html = html.Replace("@studentname", username);
        //                    html = html.Replace("@studentemail", objapplicant_meeting_schedule.applicant_email_id);
        //                    html = html.Replace("@OTP", objapplicant_meeting_schedule.otp);
        //                    objCom.SendMail(university.proctor1_email, html, "SCHEDULED " + objapplicant_meeting_schedule.event_type_name + " MEETING");
        //                }
        //            }
        //        }
        //    }
        //}

        if (!IsPostBack) {
            Bindseclanguagelist();
            populateSelectedLanguage();
        }

        if (Session["universitylogo"] == null || Session["universityverticalnavigationcolor"] == null || Session["universityfontColor"] == null || Session["universityheadercolor"] == null)
        {
            var universityDetails = db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.university_name, x.universityid, x.fontcolor, x.headerstripcolor, x.verticalnavigationcolor, x.logo }).FirstOrDefault();

            Session["universitylogo"] = universityDetails.logo;
            Session["universityverticalnavigationcolor"] = universityDetails.verticalnavigationcolor;
            Session["universityfontColor"] = universityDetails.fontcolor;
            Session["universityheadercolor"] = universityDetails.headerstripcolor;            
        }

        students loggedInApplicant = (students)Session["LoginInfo"];
        lblusername.Text = loggedInApplicant.name;
        username = loggedInApplicant.name;
        useremail = loggedInApplicant.email;
        logourl = webURL + "/Docs/" + universityID + "/" + (string)Session["universitylogo"];
        lbluniversityName.Text = (string)Session["universityName"];
        verticalnavigationcolor = (string)Session["universityverticalnavigationcolor"];
        fontColor = (string)Session["universityfontColor"];
        headercolor = (string)Session["universityheadercolor"];
        bool isfullservice = (bool)Session["isfullservice"];
        if (isfullservice)
            isfullservicethenlbl.Text = "APPLICATION CENTER";
        else
            isfullservicethenlbl.Text = "GTE Online Center (GOC)";
    }

    private void populateSelectedLanguage()
    {
        string SecondaryLanguage = Utility.GetSecondaryLanguage();
        if (SecondaryLanguage != "")
            ddlseclanguage.Items.FindByValue(SecondaryLanguage.ToString()).Selected = true;
    }


    private void Bindseclanguagelist()
    {
        ListItem lst = new ListItem("Select Language", "0");
        var slm = db.secondarylanguagemaster.ToList();
        ddlseclanguage.DataSource = slm;
        ddlseclanguage.DataTextField = "secondarylanguagename";
        ddlseclanguage.DataValueField = "languagecode";
        ddlseclanguage.DataBind();
        ddlseclanguage.Items.Insert(0, lst);
    }


}
