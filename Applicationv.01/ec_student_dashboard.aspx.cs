using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_student_dashboard : System.Web.UI.Page
{
    int universityID, formId = 0, UserID = 0, UniversityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected int isFullService;
    public List<class_details> applicant = new List<class_details>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        isFullService = (int)Session["isfullservice"];
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        //var isDeclarationDoneByApplicant = (bool)Session["DeclarationDoneByApplicant"];
        //if (isDeclarationDoneByApplicant)
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
        //        "alert('Declaration is completed. Please complete Student Information section to proceed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    public class class_details
    {
        public int classid { get; set; }
        public string univeristyname { get; set; }
        public string classname { get; set; }
        public int? startdateID { get; set; }
        public DateTime? startdate { get; set; }
        public string startdate_str { get; set; }
        public string recurrence { get; set; }
        public string classstarttime { get; set; }
        public string classendtime { get; set; }
        public string subject { get; set; }
        public string grade { get; set; }
        public string location { get; set; }
        public string timezone { get; set; }
        public string mode { get; set; }
        public int Noofstudents { get; set; }
        public int assignID { get; set; }
    }

    private void BindGrid(int classid = 0, int gradeID = 0, int subjectID = 0, int modeID = 0, int typeID = 0)
    {
        //try
        //{
        //    applicant = (from cm in db.ec_class_assign
        //                 join um in db.university_master on cm.universityid equals um.universityid
        //                 join currm in db.ec_class_master on cm.classid equals currm.id
        //                 join sac in db.ec_class_assign_student_mapping on cm.id equals sac.assign_id 
        //                 join cl in db.ec_class_location_mapping_master on currm.id equals cl.classid
        //                 join location in db.universitycampus on cl.locationid equals location.campusid
        //                 join sm in db.subjectmaster on cm.subjectid equals sm.id
        //                 join gm in db.grademaster on cm.gradeid equals gm.id
        //                 join date in db.ec_class_date_master on cm.classstartdateid equals date.id into Ddata
        //                 from x in Ddata.DefaultIfEmpty()
        //                 where cm.universityid == universityID && cm.IsDeleted != 1 /*&& sac.studentid== UserID */
        //                 select new class_details
        //                 {
        //                     assignID = cm.id,
        //                     classid = cm.id,
        //                     univeristyname = um.university_name,
        //                     classname = currm.classname,
        //                     startdateID = cm.classstartdateid,
        //                     startdate = x.class_startdate,
        //                     mode = currm.modeid == 1 ? "Online" : "F2F",
        //                     recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
        //                     classstarttime = cm.class_starttime,
        //                     classendtime = cm.class_endtime,
        //                     subject = sm.description,
        //                     grade = gm.description,
        //                     location = location.campusname,
        //                     timezone= currm.timezone

        //                 }).ToList();
        //    foreach (var item in applicant)
        //    {
        //        item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
        //        item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
        //        item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
        //    }

        //    if (applicant != null)
        //    {
        //        grd_class.DataSource = applicant;
        //        grd_class.DataBind();

        //    }

        //}
        //catch (Exception ex)
        //{
        //    objLog.WriteLog(ex.ToString());
        //}
    }
    protected void btn_today_class_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    applicant = (from cm in db.ec_class_assign
        //                 join um in db.university_master on cm.universityid equals um.universityid
        //                 join currm in db.ec_class_master on cm.classid equals currm.id
        //                 join sac in db.ec_class_assign_student_mapping on cm.id equals sac.assign_id
        //                 join cl in db.ec_class_location_mapping_master on currm.id equals cl.classid
        //                 join location in db.universitycampus on cl.locationid equals location.campusid
        //                 join sm in db.subjectmaster on cm.subjectid equals sm.id
        //                 join gm in db.grademaster on cm.gradeid equals gm.id
        //                 join date in db.ec_class_date_master on cm.classstartdateid equals date.id into Ddata
        //                 from x in Ddata.DefaultIfEmpty()
        //                 where cm.universityid == universityID && cm.IsDeleted != 1  && cm.recurrenceid == 1
        //                 select new class_details
        //                 {
        //                     assignID = cm.id,
        //                     classid = cm.id,
        //                     univeristyname = um.university_name,
        //                     classname = currm.classname,
        //                     startdateID = cm.classstartdateid,
        //                     startdate = x.class_startdate,
        //                     mode = currm.modeid == 1 ? "Online" : "F2F",
        //                     recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
        //                     classstarttime = cm.class_starttime,
        //                     classendtime = cm.class_endtime,
        //                     subject = sm.description,
        //                     grade = gm.description,
        //                     location = location.campusname,
        //                     timezone = currm.timezone

        //                 }).ToList();
        //    foreach (var item in applicant)
        //    {
        //        item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
        //        item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
        //        item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
        //    }

        //    if (applicant != null)
        //    {
        //        grd_class.DataSource = applicant;
        //        grd_class.DataBind();

        //    }

        //}
        //catch (Exception ex)
        //{
        //    objLog.WriteLog(ex.ToString());
        //}
    }

    protected void btn_week_class_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    applicant = (from cm in db.ec_class_assign
        //                 join um in db.university_master on cm.universityid equals um.universityid
        //                 join currm in db.ec_class_master on cm.classid equals currm.id
        //                 join sac in db.ec_class_assign_student_mapping on cm.id equals sac.assign_id
        //                 join cl in db.ec_class_location_mapping_master on currm.id equals cl.classid
        //                 join location in db.universitycampus on cl.locationid equals location.campusid
        //                 join sm in db.subjectmaster on cm.subjectid equals sm.id
        //                 join gm in db.grademaster on cm.gradeid equals gm.id
        //                 join date in db.ec_class_date_master on cm.classstartdateid equals date.id into Ddata
        //                 from x in Ddata.DefaultIfEmpty()
        //                 where cm.universityid == universityID && cm.IsDeleted != 1  && cm.recurrenceid == 2
        //                 select new class_details
        //                 {
        //                     assignID = cm.id,
        //                     classid = cm.id,
        //                     univeristyname = um.university_name,
        //                     classname = currm.classname,
        //                     startdateID = cm.classstartdateid,
        //                     startdate = x.class_startdate,
        //                     mode = currm.modeid == 1 ? "Online" : "F2F",
        //                     recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
        //                     classstarttime = cm.class_starttime,
        //                     classendtime = cm.class_endtime,
        //                     subject = sm.description,
        //                     grade = gm.description,
        //                     location = location.campusname,
        //                     timezone = currm.timezone

        //                 }).ToList();
        //    foreach (var item in applicant)
        //    {
        //        item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
        //        item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
        //        item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
        //    }

        //    if (applicant != null)
        //    {
        //        grd_class.DataSource = applicant;
        //        grd_class.DataBind();

        //    }

        //}
        //catch (Exception ex)
        //{
        //    objLog.WriteLog(ex.ToString());
        //}
    }

    protected void grd_class_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_class.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void grd_class_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void grd_class_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void grd_class_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}