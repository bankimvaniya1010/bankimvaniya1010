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


public partial class ec_create_my_assignments : System.Web.UI.Page
{
    int formId = 0, UserID = 0, UniversityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected int isFullService;
    public static List<assignment_details> assignmentList = new List<assignment_details>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        isFullService = (int)Session["isfullservice"];
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        var isDeclarationDoneByApplicant = (bool)Session["service5_DeclarationDoneByApplicant"];
        if (!isDeclarationDoneByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Please complete service agreement  before proceeding.');window.location='" + Request.ApplicationPath + "ec_declareaion.aspx';", true);

        
        if (!IsPostBack)
        {   
            bind_grid();
            bind_Dropdown();
        }
    }
    private void bind_Dropdown(string assignmentname = "", int classid = 0, int gradeID = 0, int subjectID = 0, int statusid = 0)
    {
        try
        {

            var data = (from sm in db.ec_assignments_assign

                                         join a in db.ec_assignments_assignschedule_master on sm.assignschedule_Id equals a.asm_id into assign_schedule_data
                                         from asm_sch in assign_schedule_data.DefaultIfEmpty()

                                         join d in db.ec_assignments_assignschedule_date_master on sm.assignment_date_id equals d.asmd_id into assign_schedule_date
                                         from date in assign_schedule_date.DefaultIfEmpty()

                                         join assign_stud in db.ec_assignment_master on sm.assignmentId equals assign_stud.id into assign_data
                                         from x in assign_data.DefaultIfEmpty()

                                         join y in db.subjectmaster on asm_sch.asm_subject_id equals y.id into subjData
                                         from sub in subjData.DefaultIfEmpty()

                                         join gm in db.ec_grademaster on asm_sch.asm_grade_id equals gm.id into gradeData
                                         from grd in gradeData.DefaultIfEmpty()

                                         join cm in db.ec_class_master on asm_sch.asm_class_id equals cm.id into classData
                                         from cls in classData.DefaultIfEmpty()

                                         join statusm in db.ec_status_master on sm.status equals statusm.id into statusData
                                         from status in statusData.DefaultIfEmpty()

                                         where sm.universityid == UniversityID && sm.applicantId == UserID

                                         select new assignment_details()
                                         {
                                             assignId = sm.assignId,
                                             assignmentid = x.id,
                                             assignment_name = x.assignment_name,
                                             assignschedule_Id = asm_sch.asm_id,
                                             subject = sub.description,
                                             grade = grd.description,
                                             classname = cls.classname,
                                             assignmentstarttime = date.asmd_start_date,
                                             assignmentendtime = date.asmd_stop_time,
                                             statusID = sm.status,
                                             status = status.description,
                                             assignment_type = x.assignment_type,
                                             assignment_Link = x.assignment_type == 1 ? webURL + "view_Bassignment.aspx?assignId=" + sm.assignId : webURL + "view_assignment.aspx?assignId=" + sm.assignId,
                                             is_self_check = x.self_check,
                                             checkingguid_link = webURL + "Docs/Eclass_Service/Assignments/" + x.checkingguide,
                                             userdownloadfile = webURL + "Docs/Eclass_Service/Assignments/" + x.userfile,
                                             remark = x.remarks,
                                             assignment_startdate_utc = date.asmd_start_utc_date,
                                             assignment_stopdate_utc = date.asm_stop_utc_date,
                                             Is_toshow_checkingguid_link = 0,
                                             Is_assignemtCompleted = sm.Is_assignemtCompleted,
                                             toshow_assignment = 0,
                                         }).ToList();
            foreach (var item in assignmentList)
            {
                //expir time 
                DateTime? currutc = DateTime.UtcNow;

                if (item.statusID != 1)
                    item.assignment_Link = null;

                if (item.Is_assignemtCompleted == 1 && item.status == "2" && item.is_self_check == 1)
                {
                    //timeto show checking guid if selfcheck [due date is passed & assignment should be submitted]
                    if (item.assignment_stopdate_utc < currutc)
                        item.Is_toshow_checkingguid_link = 1;
                }

                if (currutc <= item.assignment_startdate_utc)
                    item.toshow_assignment = 1;
            }
            if (assignmentList.Any())
            {
                if (subjectID == 0)
                {
                    var subject = (from s in assignmentList select new { subject_id = s.subject_id, subject = s.subject }).OrderBy(s => s.subject_id).Distinct().ToList();
                    ddlsubject.DataSource = subject;
                    ddlsubject.DataTextField = "subject";
                    ddlsubject.DataValueField = "subject_id";
                    ddlsubject.DataBind();
                }
                if (assignmentname == "")
                {
                    var name = (from s in assignmentList select new { assignmentid = s.assignmentid, assignment_name = s.assignment_name }).OrderBy(s => s.assignment_name).Distinct().ToList();
                    ddlAssignmentName.DataSource = name;
                    ddlAssignmentName.DataTextField = "assignment_name";
                    ddlAssignmentName.DataValueField = "assignment_name";
                    ddlAssignmentName.DataBind();
                }
                if (classid == 0)
                {
                    var classname = (from s in assignmentList select new { classid = s.classid, classname = s.classname }).OrderBy(s => s.classid).Distinct().ToList();
                    ddlclassname.DataSource = classname;
                    ddlclassname.DataTextField = "classname";
                    ddlclassname.DataValueField = "classid";
                    ddlclassname.DataBind();
                }
                if (gradeID == 0)
                {
                    var datagrade = (from s in assignmentList select new { grade_id = s.grade_id, grade = s.grade }).OrderBy(s => s.grade).Distinct().ToList();
                    ddlgrade.DataSource = datagrade;
                    ddlgrade.DataTextField = "grade";
                    ddlgrade.DataValueField = "grade_id";
                    ddlgrade.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private static void bind_grid(string assignmentname = "", int classid = 0, int gradeID = 0, int subjectID = 0, int statusid = 0,int today =0,int week=0, int month=0)
    {
        GTEEntities db = new GTEEntities();
        Logger objLog = new Logger();
        int UniversityID = Utility.GetUniversityId();
        string webURL = Utility.GetWebUrl();
            
        int UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());
        try
        {
            List<assignment_details> temp = new List<assignment_details>();
            assignmentList = (from sm in db.ec_assignments_assign

                              join a in db.ec_assignments_assignschedule_master on sm.assignschedule_Id equals a.asm_id into assign_schedule_data
                              from asm_sch in assign_schedule_data.DefaultIfEmpty()

                              join d in db.ec_assignments_assignschedule_date_master on sm.assignment_date_id equals d.asmd_id into assign_schedule_date
                              from date in assign_schedule_date.DefaultIfEmpty()

                              join assign_stud in db.ec_assignment_master on sm.assignmentId equals assign_stud.id into assign_data
                              from x in assign_data.DefaultIfEmpty()

                              join y in db.subjectmaster on asm_sch.asm_subject_id equals y.id into subjData
                              from sub in subjData.DefaultIfEmpty()

                              join gm in db.ec_grademaster on asm_sch.asm_grade_id equals gm.id into gradeData
                              from grd in gradeData.DefaultIfEmpty()

                              join cm in db.ec_class_master on asm_sch.asm_class_id equals cm.id into classData
                              from cls in classData.DefaultIfEmpty()

                              join a in db.ec_class_applicationmaster on sm.applicantId equals a.applicantid into mapping
                              from am in mapping.DefaultIfEmpty()

                              join statusm in db.ec_status_master on sm.status equals statusm.id into statusData
                              from status in statusData.DefaultIfEmpty()

                              where sm.universityid == UniversityID && sm.applicantId == UserID && am.status == 7 && am.applicantid == UserID && am.Is_suspened !=1


                              select new assignment_details()
                              {
                                  assignId = sm.assignId,
                                  assignmentid = x.id,
                                  assignment_name = x.assignment_name,
                                  assignschedule_Id = asm_sch.asm_id,
                                  subject = sub.description,
                                  grade = grd.description,
                                  classname = cls.classname,
                                  assignmentstarttime = date.asmd_start_date,
                                  assignmentendtime = date.asmd_stop_time,
                                  statusID = sm.status,
                                  status = status.description,
                                  assignment_type = x.assignment_type,
                                  assignment_Link = x.assignment_type == 1 ? webURL + "view_Bassignment.aspx?assignId=" + sm.assignId : webURL + "view_assignment.aspx?assignId=" + sm.assignId,
                                  is_self_check = x.self_check,
                                  checkingguid_link = webURL + "Docs/Eclass_Service/Assignments/" + x.checkingguide,
                                  userdownloadfile = webURL + "Docs/Eclass_Service/Assignments/" + x.userfile,
                                  remark = x.remarks,
                                  assignment_startdate_utc = date.asmd_start_utc_date,
                                  assignment_stopdate_utc = date.asm_stop_utc_date,
                                  Is_toshow_checkingguid_link = 0,
                                  Is_assignemtCompleted = sm.Is_assignemtCompleted,
                                  toshow_assignment = 0,
                                  marks_obtained = sm.marks,
                                  marks_total = 0,
                                  Is_resultdeclared = sm.Is_result_declared == null?0: sm.Is_result_declared,
                                  result_release_date = sm.result_release_datetime,
                                  result_release_date_utc = sm.result_release_datetime_utc,
                                  resultLink = webURL + "ec_view_result.aspx?assignID="+sm.assignId ,
        }).Distinct().ToList();
            foreach (var item in assignmentList)
            {
                //marks
                item.marks_total = db.ec_assignment_papers_master.Where(x => x.assignmentid == item.assignmentid).Select(x => x.marks).FirstOrDefault();

                //expir time 
                DateTime? currutc = DateTime.UtcNow;

                if (item.is_self_check == 1 && item.Is_assignemtCompleted == 1)
                {
                    if (item.assignment_stopdate_utc <= currutc)//timeto show checking guid if selfcheck [due date is passed & assignment should be submitted]
                        item.Is_toshow_checkingguid_link = 1;
                }

                if (item.Is_assignemtCompleted == 1) //if assignment completed then hide go to link btn
                    item.assignment_Link = null;

                if (item.assignment_stopdate_utc <= currutc)// hide go to link btn if assignment expires
                    item.assignment_Link = null;

                if (item.assignment_startdate_utc <= currutc)// show assignment after start date time
                    temp.Add(item);//item.toshow_assignment = 1;

                if (item.Is_resultdeclared != 1)
                {
                    //check result date then show result 
                    if(item.result_release_date_utc <= currutc)
                        item.Is_resultdeclared = 0;
                }

            }
            assignmentList = temp;
            if (assignmentList != null)
            {
                if (assignmentname != "" || classid != 0 || gradeID != 0 || subjectID != 0 || statusid != 0 || today != 0 || week != 0 || month != 0)
                {
                    // var filterlist = universitiesList;
                    if (classid != 0)
                    {
                        assignmentList = assignmentList.Where(x => x.classid == classid).ToList();
                        //ddlclassname.Items.FindByValue(classid.ToString()).Selected = true;
                    }
                    if (gradeID != 0)
                    {
                        assignmentList = assignmentList.Where(x => x.grade_id == gradeID).ToList();
                        //ddlgrade.Items.FindByValue(gradeID.ToString()).Selected = true;
                    }
                    if (subjectID != 0)
                    {
                        assignmentList = assignmentList.Where(x => x.subject_id == subjectID).ToList();
                        //ddlsubject.Items.FindByValue(subjectID.ToString()).Selected = true;
                    }
                    if (assignmentname != "")
                    {
                        assignmentList = assignmentList.Where(x => x.assignment_name == assignmentname).ToList();
                        //ddlAssignmentName.Items.FindByValue(assignmentname.ToString()).Selected = true;
                    }
                    if (today != 0)
                    {


                    }
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public class assignment_details : ec_create_my_assignments
    {
        public int assignId { get; set; }
        public int? Is_resultdeclared { get; set; }
        public DateTime? result_release_date { get; set; }
        public DateTime? result_release_date_utc { get; set; }

        public int? statusID { get; set; }
        public int? marks_obtained { get; set; }
        public int? marks_total{ get; set; }
        public int marks { get; set; }
        public string assignment_name { get; set; }
        public int? is_self_check { get; set; }
        public int assignmentid { get; set; }
        public int assignschedule_Id { get; set; }
        public DateTime? assignment_startdate_utc { get; set; }
        public DateTime? assignment_stopdate_utc { get; set; }
        public string classname { get; set; }
        public string userdownloadfile { get; set; }
        public int grade_id { get; set; }
        public string grade { get; set; }
        public string document { get; set; }
        public string document_link { get; set; }
        public string subject { get; set; }
        public int subject_id { get; set; }
        public int classid{ get; set; }
        public DateTime? assignmentstarttime { get; set; }
        public DateTime? assignmentendtime { get; set; }
        public Nullable<int> assignment_type { get; set; }
        public string remark { get; set; }
        public string timezone { get; set; }
        public string status { get; set; }
        public string assignment_Link { get; set; }
        public string checkingguid_link { get; set; }
        public int Is_toshow_checkingguid_link { get; set; }
        public int toshow_assignment { get; set; }
        public string resultLink { get; set; }
        public int? Is_assignemtCompleted { get; set; }
        public string Get_Material_type_wise_icons
        {
            get
            {
                switch (assignment_type)
                {
                    case 1:
                        return "fas fa-file - pdf";
                    default:
                        return "";
                }
            }
        }
      
    }

    protected void ddl_study_SelectedIndexChanged(object sender, EventArgs e)
    {
        int statusid = Convert.ToInt32(ddl_study.SelectedValue);
        bind_grid("",0, 0, 0, statusid);
    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        bind_grid("",0, 0, subjectID);
    }

    protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        bind_grid("",0, gradeID);
    }

    protected void ddlclassname_SelectedIndexChanged(object sender, EventArgs e)
    {
        int classID = Convert.ToInt32(ddlclassname.SelectedValue);
        bind_grid("",classID);
    }

    protected void ddlAssignmentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string assignmentname = ddlAssignmentName.SelectedValue;
        bind_grid(assignmentname);
    }

    protected void btn_today_Click(object sender, EventArgs e)
    {
        bind_grid("",0,0,0,0,1);
    }

    protected void btn_week_Click(object sender, EventArgs e)
    {
        //t month = DateTime.Now.w;
        bind_grid("", 0, 0, 0, 0, 0,1);
    }

    protected void btn_month_Click(object sender, EventArgs e)
    {
        int month = DateTime.Now.Month;
        bind_grid("", 0, 0, 0, 0, 0,0,month);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Refresh_table()
    {
        string assignID = "test";
        //bind_grid();
        return JsonConvert.SerializeObject(assignID);
    }
}