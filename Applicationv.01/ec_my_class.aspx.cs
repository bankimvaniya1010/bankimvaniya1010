using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

public partial class ec_my_class : System.Web.UI.Page
{
    private static int formId = 0, UserID = 0, UniversityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objcom = new Common();
    string webURL = String.Empty;
    protected int isFullService;
    public List<class_details> applicant = new List<class_details>();
    public List<class_details> class_enroll = new List<class_details>();

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

        var isGteDeclarationDoneByApplicant = (bool)Session["service5_DeclarationDoneByApplicant"];
        if (!isGteDeclarationDoneByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Please complete service agreement before proceeding.');window.location='" + Request.ApplicationPath + "ec_declareaion.aspx';", true);
        
        if (!IsPostBack)
        {
            BindEnrollClass();
            BindGrid();
        }
    }
    public class class_details
    {
        public string linkname { get; set; }
        public string link_irl { get; set; }
        public string virtuallink { get; set; }
        public int? classid { get; set; }
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
        public int? location { get; set; }
        public string location_name { get; set; }
        public string timezone { get; set; }
        public string mode { get; set; }
        public int Noofstudents { get; set; }
        public int assignID { get; set; }
        public string duration { get; set; }
    }
  
    private void BindEnrollClass()
    {
        try
        {

            class_enroll = (from cam in db.ec_class_applicationmaster
                            join cmaster in db.ec_class_master on cam.classid equals cmaster.id into classData
                            from cm in classData.DefaultIfEmpty()
                            join sm in db.subjectmaster on cm.subjectid equals sm.id
                            join gm in db.grademaster on cm.gradeid equals gm.id
                            join tm in db.ec_type_master on cm.type equals tm.type_id
                            join mm in db.ec_mode_master on cm.modeid equals mm.mode_id
                            where cam.universityid == UniversityID && cam.applicantid == UserID && cam.status == 7
                            select new class_details
                            {
                                assignID = cam.id,
                                classid = cam.classid,
                                //univeristyname = um.university_name,
                                classname = cm.classname,
                                startdate = cm.startdate,
                                mode = mm.mode_description,
                                recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
                                classstarttime = cm.class_starttime,
                                classendtime = cm.class_endtime,
                                subject = sm.description,
                                grade = gm.description,
                                location = cm.location,
                                location_name = "-",
                                timezone = cm.timezone,
                                duration = cm.duration_year+" Years "+cm.duration_month +" Months "+cm.duration_day +" Days ",
                                
                            }).ToList();


            foreach (var item in class_enroll)
            {
                if (item.mode == "Online")
                {
                    item.linkname = "Click Here to Conduct Class";
                    item.virtuallink = webURL + "ec_class_join.aspx?ID=" + item.assignID;
                }
                else
                {
                    item.linkname = "Get Direction to Location";
                    item.virtuallink = webURL + "ec_class_join_offline.aspx?ID=" + item.assignID;
                }
                if (item.location != null || item.location != 0)
                    item.location_name = db.universitycampus.Where(x => x.campusid == item.location).Select(x => x.campusname).FirstOrDefault();
                item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
                item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
                item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindGrid(int classid = 0, int gradeID = 0, int subjectID = 0, int modeID = 0, int typeID = 0, string filterby="")
    {
        GTEEntities db = new GTEEntities();
        Logger objLog = new Logger();
        try
        {
            applicant = (from date in db.ec_class_date_schedule_master

                             join cam in db.ec_class_applicationmaster on date.classID equals cam.classid
                             join cm in db.ec_class_master on date.classID equals cm.id
                             join um in db.university_master on cm.universityid equals um.universityid

                             join sm in db.subjectmaster on cm.subjectid equals sm.id
                             join gm in db.ec_grademaster on cm.gradeid equals gm.id
                             join mm in db.ec_mode_master on cm.modeid equals mm.mode_id
                             where date.universityid == UniversityID && cam.applicantid == UserID && cam.status == 7
                             select new class_details
                             {
                                 assignID = date.id,
                                 classid = cm.id,
                                 univeristyname = um.university_name,
                                 classname = cm.classname,
                                 startdate = date.class_datetime_start,
                                 mode = mm.mode_description,
                                 recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
                                 classstarttime = cm.class_starttime,
                                 classendtime = cm.class_endtime,
                                 subject = sm.description,
                                 grade = gm.description,
                                 location = cm.location,
                                 timezone = cm.timezone,
                                 location_name = "-",

                             }).OrderBy(x=>x.startdate).ToList();

            foreach (var item in applicant)
            {
                if (item.mode == "Online")
                {
                    item.linkname = "Click Here to Conduct Class";
                    item.virtuallink = webURL + "ec_class_join.aspx?ID=" + item.assignID;
                }
                else
                {
                    item.linkname = "Get Direction to Location";
                    item.virtuallink = webURL + "ec_class_join_offline.aspx?ID=" + item.assignID;
                }

                if (item.location != null || item.location != 0)
                    item.location_name = db.universitycampus.Where(x => x.campusid == item.location).Select(x => x.campusname).FirstOrDefault();

                item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
                item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
                item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
                
                item.startdate =Convert.ToDateTime(item.startdate).Date;
            }
            if (filterby == "today") {

                DateTime date = DateTime.Now.Date;
                applicant.RemoveAll(x => x.startdate != date);
            }
            if (filterby == "week")
            {
                DateTime baseDate = DateTime.Today;
                var thisWeekStart = baseDate.AddDays(-(int)baseDate.DayOfWeek);
                var thisWeekEnd = thisWeekStart.AddDays(7).AddSeconds(-1);
                applicant.RemoveAll(x => !(thisWeekStart.Date <= x.startdate && x.startdate <= thisWeekEnd.Date));

            }
            if (filterby == "month") {

                applicant.RemoveAll(x => !(DateTime.Today.Month == x.startdate.Value.Month));
           }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_today_class_Click(object sender, EventArgs e)
    {
        try
        {
            BindGrid(0, 0, 0, 0, 0, "today");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_week_class_Click(object sender, EventArgs e)
    {
        BindGrid(0, 0, 0, 0, 0, "week");
    }



    protected void btn_monthly_class_Click(object sender, EventArgs e)
    {
        BindGrid(0, 0, 0, 0, 0, "month");
    }

    protected void btn_dw_weekly_Click(object sender, EventArgs e)
    {
        try
        {
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Weekly_Class_List.xls");
            HttpContext.Current.Response.Charset = "utf-8";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
            HttpContext.Current.Response.Write("<BR><BR><BR>");
            HttpContext.Current.Response.Write("<Table border='1' bgColor='#ffffff' borderColor='#000000' cellSpacing='0' cellPadding='0' style='font-size:10.0pt; font-family:Calibri; background:white;'> <TR>");
            DataTable dt = BindDatatable_weekly();
            string str = string.Empty;
            string str_bold = string.Empty;
            string str_bold_end = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                HttpContext.Current.Response.Write("<TD>");
                HttpContext.Current.Response.Write("<B>");
                HttpContext.Current.Response.Write(dtcol.ColumnName);
                HttpContext.Current.Response.Write("</B>");
                HttpContext.Current.Response.Write("</Td>");
            }
            HttpContext.Current.Response.Write("</TR>");
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                HttpContext.Current.Response.Write("<TR>");
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    HttpContext.Current.Response.Write("<TD>");
                    Response.Write(str + Convert.ToString(dr[j]));
                    HttpContext.Current.Response.Write("</TD>");
                }
                HttpContext.Current.Response.Write("</TR>");
                Response.Write("\n");
            }

            HttpContext.Current.Response.Write("</Table>");
            HttpContext.Current.Response.Write("</font>");
            Response.End();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected DataTable BindDatatable_weekly()
    {
        BindGrid(0, 0, 0, 0, 0, "week");
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Class Name", typeof(string)).ToString();
        dt.Columns.Add("Time Zone", typeof(string));
        dt.Columns.Add("Date", typeof(string));
        dt.Columns.Add("Class Start Date", typeof(string));
        dt.Columns.Add("Class End Date", typeof(string));
        dt.Columns.Add("Subject", typeof(string));
        dt.Columns.Add("Grade", typeof(string));
        dt.Columns.Add("Mode", typeof(string));
        dt.Columns.Add("Location", typeof(string));

        //to print rows
        if (applicant != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var my_class = applicant[i];
                dt.Rows.Add(my_class.classname, my_class.timezone, my_class.startdate_str, my_class.startdate, my_class.classendtime, my_class.subject, my_class.grade, my_class.mode, my_class.location);
                rowNumber++;
            }
        }
        return dt;
    }

    protected DataTable BindDatatable_monthly()
    {
        BindGrid(0, 0, 0, 0, 0, "month");
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Class Name", typeof(string)).ToString();
        dt.Columns.Add("Time Zone", typeof(string));
        dt.Columns.Add("Date", typeof(string));
        dt.Columns.Add("Class Start Date", typeof(string));
        dt.Columns.Add("Class End Date", typeof(string));
        dt.Columns.Add("Subject", typeof(string));
        dt.Columns.Add("Grade", typeof(string));
        dt.Columns.Add("Mode", typeof(string));
        dt.Columns.Add("Location", typeof(string));

        //to print rows
        if (applicant != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var my_class = applicant[i];
                dt.Rows.Add(my_class.classname, my_class.timezone, my_class.startdate_str, my_class.startdate, my_class.classendtime, my_class.subject, my_class.grade, my_class.mode, my_class.location);
                rowNumber++;
            }
        }
        return dt;
    }

    protected void btn_dw_monthly_Click(object sender, EventArgs e)
    {
        try
        {
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Monthly_Class_List.xls");
            HttpContext.Current.Response.Charset = "utf-8";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");
            //sets font
            HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");
            HttpContext.Current.Response.Write("<BR><BR><BR>");
            HttpContext.Current.Response.Write("<Table border='1' bgColor='#ffffff' borderColor='#000000' cellSpacing='0' cellPadding='0' style='font-size:10.0pt; font-family:Calibri; background:white;'> <TR>");
            DataTable dt = BindDatatable_monthly();
            string str = string.Empty;
            string str_bold = string.Empty;
            string str_bold_end = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                HttpContext.Current.Response.Write("<TD>");
                HttpContext.Current.Response.Write("<B>");
                HttpContext.Current.Response.Write(dtcol.ColumnName);
                HttpContext.Current.Response.Write("</B>");
                HttpContext.Current.Response.Write("</Td>");
            }
            HttpContext.Current.Response.Write("</TR>");
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                HttpContext.Current.Response.Write("<TR>");
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    HttpContext.Current.Response.Write("<TD>");
                    Response.Write(str + Convert.ToString(dr[j]));
                    HttpContext.Current.Response.Write("</TD>");
                }
                HttpContext.Current.Response.Write("</TR>");
                Response.Write("\n");
            }

            HttpContext.Current.Response.Write("</Table>");
            HttpContext.Current.Response.Write("</font>");
            Response.End();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
      
}