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

public partial class admin_examchecking : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            BindUniversity();

        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Genrateotp()
    {
        Random random = new Random();
        int otp = random.Next(100000, 999999);
        return JsonConvert.SerializeObject(otp);
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
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

    private void BindExamDateTime(int exampapersid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = db.exam_schedule.Where(x => x.exampapersid == exampapersid).ToList();
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

    private void BindExaminer(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studentID = db.examiner_master.Where(x => x.universityId == universityid && x.roleid == 11).ToList();
            ddlexaminer.DataSource = studentID;
            ddlexaminer.DataTextField = "name";
            ddlexaminer.DataValueField = "examinerID";
            ddlexaminer.DataBind();
            ddlexaminer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexam_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
        BindExamDateTime(selectedexampapersid);
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {

        ddlExamDateTime.ClearSelection();
        ddlexaminer.ClearSelection();
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniversityid);

        Bind_Class(selecteduniversityid);
        Bind_Group(selecteduniversityid);
        Bind_Subject(selecteduniversityid);       
    }
    public void Bind_Subject(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.exam_subjectmaster
                         join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                         where cwm.universityID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlsubject.DataSource = group;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);
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
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            examchecking_assignment objassign = new examchecking_assignment();

            int selecteduniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminertid = Convert.ToInt32(ddlexaminer.SelectedValue);
            int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selectedexamtime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);

            var dataexsisting = db.examchecking_assignment.Where(x => x.institutionId == selecteduniversityID && x.ExamId == selectedexampapersid && x.scheduledate_time == selectedexamtime && x.examinerId == selectedexaminertid).FirstOrDefault();

            if (dataexsisting == null)
            {
                objassign.institutionId = Convert.ToInt32(ddlUniversity.SelectedValue);
                objassign.ExamId = Convert.ToInt32(ddlexam.SelectedValue);
                objassign.scheduledate_time = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
                objassign.examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
                objassign.examiner_passkey = hidtxtexaminerpasskey.Value;
                db.examchecking_assignment.Add(objassign);
                db.SaveChanges();

                //send passkey to examiner
                var Examiner = db.examiner_master.Where(x => x.examinerID == objassign.examinerId).Select(x => new { x.name, x.email, x.examinerkey }).FirstOrDefault();
                var examname = db.exam_master.Where(x => x.universityID == objassign.institutionId && x.exampapersid == objassign.ExamId).Select(x => x.exam_name).FirstOrDefault();
                var university = db.university_master.Where(x => x.universityid == objassign.institutionId).FirstOrDefault();
                var timezone = db.exam_schedule.Where(x => x.exampapersid == objassign.ExamId && x.universityid == objassign.institutionId && x.exam_datetime == objassign.scheduledate_time).Select(x => x.utctimezone).FirstOrDefault();

                if (objassign.examinerId != null)
                {
                    string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/CheckerPasskey_Notification.html"));
                    string emailsubject = "Your Checker Passkey for "+examname;
                    html = html.Replace("@UniversityName", university.university_name);
                    html = html.Replace("@universityLogo", webURL + "Docs/" + objassign.institutionId + "/" + university.logo);
                    html = html.Replace("@Name", Examiner.name);
                    html = html.Replace("@examname", examname);
                    html = html.Replace("@examdatetime", Convert.ToDateTime(objassign.scheduledate_time).ToString("dd/MMM/yyyy h:mm:ss tt"));
                    html = html.Replace("@TimeZone", timezone);
                    html = html.Replace("@passkey", objassign.examiner_passkey);
                    objCom.SendMail(Examiner.email, html, emailsubject);                  
                  
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record Added successfully.');window.location='" + Request.ApplicationPath + "admin/examchecking.aspx';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Selected assessmnent paper already registered with selected applicant at same time.')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedclassid = Convert.ToInt32(ddlclass.SelectedValue);
        int selectedgroupid = Convert.ToInt32(ddlgroup.SelectedValue);
        string selectedsubjectid = ddlsubject.SelectedValue;

        BindSheduledExamPaper(selecteduniversityid, selectedclassid, selectedgroupid, selectedsubjectid);
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubject.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubject.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
    }
}