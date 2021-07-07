using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_assignproctor_ : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = String.Empty;
    int universityID;
    int recordid;
    string roleName = string.Empty;

    
    applicant_meeting_schedule objmeeting = new applicant_meeting_schedule();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);


        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            recordid = -1;
            
            if (int.TryParse(Request.QueryString["id"], out recordid))
            {
                objmeeting = db.applicant_meeting_schedule.Where(obj => obj.id == recordid).FirstOrDefault();
                if (objmeeting == null)
                    recordid = -1;
            }
        }

        if (!IsPostBack)
        {
            if (objmeeting != null)
            {
                PopulatetutorialInfo();
//                bindProctorname();
            }
        }
    }
    private void bindProctorname()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var data = db.proctor_master.ToList();

            ddlproctor.DataSource = data;
            ddlproctor.DataTextField = "name";
            ddlproctor.DataValueField = "proctorID";
            ddlproctor.DataBind();
            ddlproctor.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulatetutorialInfo()
    {
        try
        {
            var meetingData = (from tInfo in db.applicant_meeting_schedule
                                   where tInfo.id == recordid
                                   select tInfo).FirstOrDefault();
            if (meetingData != null)
            {
                lbluniversityid.InnerText = meetingData.university_id.ToString();
                ddlUniversity.InnerText = db.university_master.Where(x=>x.universityid == meetingData.university_id && x.IsDeleted != 1).Select(x=>x.university_name).FirstOrDefault();
                lblstudentname.InnerText = db.applicantdetails.Where(x => x.applicantid == meetingData.applicant_id && x.universityid == meetingData.university_id).Select(x => x.firstname + "" + x.lastname).FirstOrDefault();
                lblapplicantid.InnerText = meetingData.applicant_id.ToString();
                lblutcmeetingtime.InnerText = meetingData.utc_meeting_time.ToString();
                lblmeetingtime.InnerText = meetingData.applicant_time_zone.ToString();


                if (meetingData.proctor_id != null)
                {

                    ddlproctor.ClearSelection();
                    bindProctorname();
                    ddlproctor.Items.FindByValue(meetingData.proctor_id.ToString()).Selected = true;

                    var proctordata = db.proctor_master.Where(x => x.proctorID == meetingData.proctor_id).FirstOrDefault();

                    proctorinfo.Attributes.Add("style", "display:block");
                    lblproctorID.Text = meetingData.proctor_id.ToString();
                    lblproctoremail.Text = proctordata.email;
                    lblproctormobile.Text = proctordata.mobile;
                }
                else
                    bindProctorname();

                if (meetingData.virtualmeetinginfo != null)
                    txtmeetinglink.Text = meetingData.virtualmeetinginfo;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Getproctordetail(int proctorid)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from md in db1.proctor_master
                    where md.proctorID == proctorid
                    select new
                    {
                        proctorID = md.proctorID,
                        proctorname = md.name,
                        proctormobile = md.mobile,
                        proctoremail = md.email,
                    }).ToList();

        return JsonConvert.SerializeObject(temp);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {
            int applicantid = Convert.ToInt32(lblapplicantid.InnerText);
            int universityid = Convert.ToInt32(lbluniversityid.InnerText);

            var mode = "new";
            var info = db.applicant_meeting_schedule.Where(x => x.applicant_id == applicantid && x.university_id == universityid && x.is_meetingtime_expires == null).FirstOrDefault();
            applicant_meeting_schedule objmapping = new applicant_meeting_schedule();
            if (info != null)
            {
                mode = "update";
                objmapping = info;
            }

            objmapping.proctor_id = Convert.ToInt32(ddlproctor.SelectedValue);
            //objmapping.proctorname = hidproctorname.Value;
            //objmapping.proctoremail = hidproctoremail.Value;
            //objmapping.proctormobile = Hidproctormobile.Value;
            objmapping.virtualmeetinginfo = txtmeetinglink.Text;
            if (mode == "new")
                db.applicant_meeting_schedule.Add(objmapping);
            db.SaveChanges();
            //send email to proctor
            var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID && x.IsDeleted != 1).FirstOrDefault();
            var studentname = db.applicantdetails.Where(x => x.applicantid == objmapping.applicant_id && x.universityid == objmapping.university_id).Select(x => x.firstname + " " + x.lastname).FirstOrDefault();
            var proctordata = db.proctor_master.Where(x => x.proctorID == objmapping.proctor_id).FirstOrDefault();

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/proctorNotificationwithotp.html"));
            //html = html.Replace("@UniversityName", university.university_name);
            //html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);
            html = html.Replace("@proctorName", proctordata.name);
            html = html.Replace("@studentname", studentname);
            html = html.Replace("@eventtype",objmapping.event_type_name );
            html = html.Replace("@passkey", objmapping.otp);
            html = html.Replace("@virtuallink",objmapping.virtualmeetinginfo );
            html = html.Replace("@utcmeetingtime", objmapping.utc_meeting_time.ToString("dd/MM/yyyy hh:mm tt"));
            html = html.Replace("@meetingtime", objmapping.applicant_time_zone.ToString("dd/MM/yyyy hh:mm tt"));
            objCom.SendMail(proctordata.email, html, "GTE Centre: Assessment for " + studentname+" at " + objmapping.applicant_time_zone.ToString("dd/MM/yyyy hh:mm tt"));

            sendNotification_toapplicant(objmapping.applicant_email_id, objmapping.applicant_id, Convert.ToInt32(objmapping.proctor_id));

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Proctor assign successfully.');window.location='" + Request.ApplicationPath + "admin/scheduledapplicant_list.aspx';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private static void sendNotification_toapplicant(string studentemail, int applicantid, int proctor_id)
    {
        GTEEntities db = new GTEEntities();
        int universityID = Utility.GetUniversityId();
        string webURL = Utility.GetWebUrl();
        Common objCom = new Common();

        var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID && x.IsDeleted != 1).FirstOrDefault();
        var objSchedule = db.applicant_meeting_schedule.Where(x => x.applicant_id == applicantid && x.university_id == universityID && x.is_meetingtime_expires == null).FirstOrDefault();
        var proctordata = db.proctor_master.Where(x => x.proctorID == proctor_id).FirstOrDefault();
        var applicantdata = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityID).FirstOrDefault();

        string html = File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("/assets/Emailtemplate/gte_shedule_student_Notification.html"));

        html = html.Replace("@UniversityName", university.university_name);
        html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

        html = html.Replace("@Email", studentemail);
        html = html.Replace("@studentname", objCom.GetApplicantFirstName(applicantid));
        html = html.Replace("@studentid", Convert.ToString(applicantid));

        html = html.Replace("@proctorName", proctordata.name);
        html = html.Replace("@resetURLd", webURL + "forgetpassword.aspx");
        html = html.Replace("@eventtype", objSchedule.event_type_name);
        html = html.Replace("@passkey", objSchedule.otp);
        html = html.Replace("@virtuallink", objSchedule.virtualmeetinginfo);
        html = html.Replace("@utcmeetingtime", objSchedule.utc_meeting_time.ToString("dd/MM/yyyy hh:mm tt"));
        html = html.Replace("@meetingtime", objSchedule.applicant_time_zone.ToString("dd/MM/yyyy hh:mm tt"));
        html = html.Replace("@countryofapplicant", objCom.GetCountryDiscription(Convert.ToInt32(applicantdata.countryofbirth)));
        var adminurl = webURL + "login.aspx";
        html = html.Replace("@adminLoginurl", adminurl);
        if (university.full_service == 0)
            html = html.Replace("team", "GTE Direct Team");
        else if (university.full_service == 2)
            html = html.Replace("team", "The Assessment Centre Team");
        else
            html = html.Replace("team", "The Application Centre Team");
        //countryofapplicant
        objCom.SendMail(studentemail, html, "GTE Direct: #2 Get ready for your Online Assessment Steps 7 to 11");
    }
}