using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_assign : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID, selectedexaminerId, selectuniversity;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["universityid"] == null) || (Request.QueryString["universityid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectuniversity = Convert.ToInt32(Request.QueryString["universityid"]);

        if ((Request.QueryString["examinerid"] == null) || (Request.QueryString["examinerid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectedexaminerId = Convert.ToInt32(Request.QueryString["examinerid"]);

        if (!IsPostBack)
        {
            //BindUniversity();
            //BindSheduledExamPaper(selectuniversity);
           
            Bind_Class(selectuniversity);
            Bind_Group(selectuniversity);
            Bind_Subject(selectuniversity);
            bindProctorname(selectuniversity);
        }
    }

    private void BindSheduledExamPaper(int universityid, int classid, int groupid, string subjectid) // Bind universitywise sheduled exam papers
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = (from a in db.exam_master
                         join q in db.exam_schedule on a.exampapersid equals q.exampapersid into cmdata
                         from x in cmdata.DefaultIfEmpty()
                         where a.universityID == universityid && x.universityid == universityid && a.classid == classid && a.groupid == groupid && a.exam_subject == subjectid
                         select new
                         {
                             exam_name = a.exam_name,
                             exampapersid = a.exampapersid
                         }).Distinct().ToList();
            ddlexam.DataSource = paper;
            ddlexam.DataTextField = "exam_name";
            ddlexam.DataValueField = "exampapersid";
            ddlexam.DataBind();
            ddlexam.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindExamDateTime(int exampapersid, int examassignerid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "Please select");
            var paper = db.exam_schedule.Where(x => x.exampapersid == exampapersid && x.examassignerid == examassignerid).ToList();
            ddlExamDateTime.DataSource = paper;
            ddlExamDateTime.DataTextField = "exam_datetime";
            ddlExamDateTime.DataValueField = "exam_datetime";
            ddlExamDateTime.DataBind();
            ddlExamDateTime.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindPresected(int universityId, int examid, DateTime examdatetime, int examassignerid)
    {
        try
        {
            ddlstudentid.Items.Clear();

            int classid = Convert.ToInt32(ddlclass.SelectedValue);
            int groupid = Convert.ToInt32(ddlgroup.SelectedValue);
            int subjectid = Convert.ToInt32(ddlsubjcet.SelectedValue);
            //studentddlDiv.Attributes.Add("style", "display:block");

            BindUniversitywiseStudent(selectuniversity, classid, groupid , subjectid);

           
            var universityWise = db.exam_assign.Where(x => x.universityID == universityId && x.exampapersid == examid && x.exam_datetime == examdatetime && x.examassignerid == examassignerid).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                ddlstudentid.Items.FindByValue(universityWise[k].applicantid.ToString()).Selected = true;
                ddlstudentid.Items.FindByValue(universityWise[k].applicantid.ToString()).Enabled = false;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    private void BindUniversitywiseStudent(int universityId, int classid, int groupid, int subjectid)
    {
        try
        {
            var studentID = (from ad in db.applicantdetails
                             join sm in db.exam_applicant_subjectmapping on ad.universityid equals sm.universityid into data
                             from x in data.DefaultIfEmpty()

                             join sd in db.students on ad.applicantid equals sd.studentid into sdata
                             from s in sdata.DefaultIfEmpty()
                             where ad.isdeletedbyAdmin != true && ad.isverifiedbyAdmin == true && ad.classId == classid && ad.groupId == groupid && ad.universityid == universityId && x.subjectid == subjectid && x.applicantid == ad.applicantid
                             select new 
                             {
                                 applicantid = ad.applicantid,
                                 applicantname = ad.studentid == null ? "(" + ad.applicantid + ")" + ad.firstname : "(" + ad.applicantid + ")" + ad.firstname + "(" + ad.studentid + ")",

                             }).ToList();
          
            ddlstudentid.DataSource = studentID;
            ddlstudentid.DataTextField = "applicantname";
            ddlstudentid.DataValueField = "applicantid";
            ddlstudentid.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public void Bind_Group(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.group_master
                         join cwm in db.institutionwisegroupmaster on ap.id equals cwm.groupId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlgroup.DataSource = group;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    public void Bind_Subject(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var subject = (from ap in db.exam_subjectmaster
                         join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                         where cwm.universityID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlsubjcet.DataSource = subject;
            ddlsubjcet.DataTextField = "description";
            ddlsubjcet.DataValueField = "id";
            ddlsubjcet.DataBind();
            ddlsubjcet.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    public void Bind_Class(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlclass.DataSource = Class;
            ddlclass.DataTextField = "description";
            ddlclass.DataValueField = "id";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    private void bindProctorname(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var data = db.examiner_master.Where(x => x.roleid == 10 && x.universityId == universityid).ToList();

            ddlproctor.DataSource = data;
            ddlproctor.DataTextField = "name";
            ddlproctor.DataValueField = "examinerID";
            ddlproctor.DataBind();
            ddlproctor.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexam_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlExamDateTime.ClearSelection();
        ddlstudentid.Items.Clear();

        int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
        BindExamDateTime(selectedexampapersid, selectedexaminerId);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            exam_assign objassign = new exam_assign();

            int selecteduniversityID = selectuniversity;
            int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selectedexamtime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
            int selectedexamassignerId = selectedexaminerId;
            foreach (ListItem li in ddlstudentid.Items)
            {
                if (li.Selected)
                {
                    int selectedapplicantid = Convert.ToInt32(li.Value);
                    var dataexsisting = db.exam_assign.Where(x => x.universityID == selecteduniversityID && x.applicantid == selectedapplicantid && x.exampapersid == selectedexampapersid && x.exam_datetime == selectedexamtime && x.examassignerid == selectedexaminerId).FirstOrDefault();
                    if (dataexsisting == null)
                    {
                        objassign.universityID = selecteduniversityID;
                        objassign.applicantid = selectedapplicantid;
                        objassign.exampapersid = Convert.ToInt32(ddlexam.SelectedValue);
                        objassign.exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
                        objassign.proctorid = Convert.ToInt32(ddlproctor.SelectedValue);
                        //objassign.proctoremail = txtproctoremail.Value;
                        objassign.virtuallink = txtvirtualLink.Value;
                        Random random = new Random();
                        int otp = random.Next(100000, 999999);
                        objassign.studentpasskey = otp.ToString();

                        //int proctorpasskey = random.Next(100000, 999999);  //change for test demo 
                        //objassign.proctorpasskey = proctorpasskey.ToString();
                        int examinerid = Convert.ToInt32(ddlproctor.SelectedValue);
                        var proctorpasskey = db.examiner_master.Where(x => x.examinerID == examinerid).Select(x => x.examinerkey).FirstOrDefault();
                        objassign.proctorpasskey = proctorpasskey;

                        objassign.examassignerid = selectedexaminerId;
                        db.exam_assign.Add(objassign);
                        db.SaveChanges();

                        int proctorid = Convert.ToInt32(objassign.proctorid);
                        var studentdetail = db.students.Where(x => x.studentid == objassign.applicantid).Select(x => new { x.username, x.email }).FirstOrDefault();
                        var examname = db.exam_master.Where(x => x.universityID == objassign.universityID && x.exampapersid == objassign.exampapersid).Select(x => x.exam_name).FirstOrDefault();
                        var proctordetails = db.examiner_master.Where(x => x.examinerID == proctorid).Select(x => new { x.name, x.email }).FirstOrDefault();
                        var university = db.university_master.Where(x => x.universityid == objassign.universityID).FirstOrDefault();

                        var timezone = db.exam_schedule.Where(x => x.exampapersid == selectedexampapersid && x.universityid == selecteduniversityID && x.exam_datetime == selectedexamtime && x.examassignerid == selectedexamassignerId).Select(x => new { x.utctimezone , x.exam_datetime_utc}).FirstOrDefault();
                        
                        //send passkey proctor
                        
                        //if (objassign.proctorid != null)
                        //{
                        //    string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ProctorPasskey_Notification.html"));
                        //    string emailsubject = "Your Invigilator Passkey for " + examname;
                        //    html = html.Replace("@UniversityName", university.university_name);
                        //    html = html.Replace("@universityLogo", webURL + "Docs/" + objassign.universityID + "/" + university.logo);
                        //    html = html.Replace("@Name", proctordetails.name);
                        //    html = html.Replace("@examname", examname);
                        //    html = html.Replace("@studentname", studentdetail.username);
                        //    html = html.Replace("@applicantID", objassign.applicantid.ToString());
                        //    html = html.Replace("@examdatetime", Convert.ToDateTime(objassign.exam_datetime).ToString("dd/MMM/yyyy hh:mm tt"));
                        //    html = html.Replace("@virtuallink", objassign.virtuallink);
                        //    html = html.Replace("@TimeZone", timezone.utctimezone);
                        //    html = html.Replace("@examutctime", Convert.ToDateTime(timezone.exam_datetime_utc).ToString("dd/MMM/yyyy hh:mm tt")); 
                        //    html = html.Replace("@passkey", objassign.proctorpasskey);
                        //    objCom.SendMail(proctordetails.email, html, emailsubject);
                        //}
                        //send passkey student
                        if (objassign.applicantid != null)
                        {
                            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/Passkey_Notification_Applicant.html"));
                            string emailsubject = "Your passkey for " + examname + " Online Assessment";
                            html = html.Replace("@UniversityName", university.university_name);
                            html = html.Replace("@universityLogo", webURL + "Docs/" + objassign.universityID + "/" + university.logo);
                            html = html.Replace("@Name", studentdetail.username);
                            html = html.Replace("@papername", examname);
                            html = html.Replace("@Loginurl", webURL + "login.aspx");
                            html = html.Replace("@sheduletime", Convert.ToDateTime(objassign.exam_datetime).ToString("dd/MMM/yyyy hh:mm tt")); 
                            html = html.Replace("@virtuallink", objassign.virtuallink);
                            html = html.Replace("@TimeZone", timezone.utctimezone);
                            html = html.Replace("@studentname", studentdetail.username);
                            html = html.Replace("@examutctime", Convert.ToDateTime(timezone.exam_datetime_utc).ToString("dd/MMM/yyyy hh:mm tt"));
                            html = html.Replace("@passkey", objassign.studentpasskey);
                            objCom.SendMail(studentdetail.email, html, emailsubject);
                        }
                    }
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                                  "alert('You have successfully assigned this assessment to students and invigilator.');window.location='" + Request.ApplicationPath + "admin/exam_assignList.aspx';", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }   

    protected void ddlsubjcet_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        ddlstudentid.Items.Clear();
        int classid = Convert.ToInt32(ddlclass.SelectedValue);
        int groupid = Convert.ToInt32(ddlgroup.SelectedValue);
        int subjectid = Convert.ToInt32(ddlsubjcet.SelectedValue);
        string subjectID = ddlsubjcet.SelectedValue;

        BindSheduledExamPaper(selectuniversity, classid, groupid, subjectID);
        
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {        
        ddlsubjcet.ClearSelection();
        ddlgroup.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        ddlstudentid.Items.Clear();
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubjcet.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        ddlstudentid.Items.Clear();
    }

    protected void ddlExamDateTime_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlExamDateTime.SelectedValue != "Please select")
        {

            int selecteduniversityid = selectuniversity;
            int selectedexamId = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selecteddatetime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
            int selectedexamassignerId = selectedexaminerId;
            BindPresected(selecteduniversityid, selectedexamId, selecteddatetime, selectedexamassignerId);
        }
        else
        {
            ddlstudentid.ClearSelection();
            ddlstudentid.Items.Clear();

        }
    }
}