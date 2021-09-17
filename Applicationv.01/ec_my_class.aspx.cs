using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

public partial class ec_my_class : System.Web.UI.Page
{
    int formId = 0, UserID = 0, UniversityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
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
                    item.linkname = "Click Here to Conduct Class";
                else
                    item.linkname = "Get Direction to Location";

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

    private void BindGrid(int classid = 0, int gradeID = 0, int subjectID = 0, int modeID = 0, int typeID = 0)
    {
        try
        {
            applicant = (from date in db.ec_class_date_schedule_master
                         
                         join cm in db.ec_class_master on date.classID equals cm.id
                         join um in db.university_master on cm.universityid equals um.universityid

                         join sm in db.subjectmaster on cm.subjectid equals sm.id
                         join gm in db.ec_grademaster on cm.gradeid equals gm.id
                         join mm in db.ec_mode_master on cm.modeid equals mm.mode_id
                         where date.universityid == UniversityID  /*&& cam.applicantid == UserID && cam.status == 7*/
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
                             timezone = cm.timezone

                         }).ToList();
            foreach (var item in applicant)
            {
                if (item.mode == "Online")
                    item.linkname = "Click Here to Conduct Class";
                else
                    item.linkname = "Get Direction to Location";

                if (item.location != null || item.location != 0)
                    item.location_name = db.universitycampus.Where(x => x.campusid == item.location).Select(x => x.campusname).FirstOrDefault();

                item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
                item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
                item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
            }
            
            //if (class_enroll != null)
            //{
            //    grd_class.DataSource = applicant;
            //    grd_class.DataBind();
            //}
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
            applicant = (from cm in db.ec_class_master
                         join date in db.ec_class_date_master on cm.id equals date.classid
                         join um in db.university_master on cm.universityid equals um.universityid
                         join sac in db.ec_class_applicationmaster on cm.id equals sac.classid
                         join sm in db.subjectmaster on cm.subjectid equals sm.id
                         join gm in db.grademaster on cm.gradeid equals gm.id// from x in Ddata.DefaultIfEmpty()
                         where cm.universityid == UniversityID && cm.recurrenceid == 1 && sac.applicantid == 204//UserID 
                         select new class_details
                         {
                             assignID = cm.id,
                             classid = cm.id,
                             univeristyname = um.university_name,
                             classname = cm.classname,
                             startdate = date.class_startdate,
                             mode = cm.modeid == 1 ? "Online" : cm.modeid == 2 ? "F2F" : "At Students Home",
                             recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
                             classstarttime = cm.class_starttime,
                             classendtime = cm.class_endtime,
                             subject = sm.description,
                             grade = gm.description,
                             location = cm.location,
                             timezone = cm.timezone

                         }).ToList();
            foreach (var item in applicant)
            {
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

    protected void btn_week_class_Click(object sender, EventArgs e)
    {
        weekly_record();
    }



    protected void btn_monthly_class_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void btn_dw_weekly_Click(object sender, EventArgs e)
    {
        try
        {
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Reports.xls");
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
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void weekly_record()
    {
        try
        {
            applicant = (from cm in db.ec_class_master
                         join date in db.ec_class_date_master on cm.id equals date.classid
                         join um in db.university_master on cm.universityid equals um.universityid
                         join sac in db.ec_class_applicationmaster on cm.id equals sac.classid
                         join sm in db.subjectmaster on cm.subjectid equals sm.id
                         join gm in db.grademaster on cm.gradeid equals gm.id// from x in Ddata.DefaultIfEmpty()
                         where cm.universityid == UniversityID && (cm.recurrenceid == 2 || cm.recurrenceid == 1) && sac.applicantid == 204//UserID 
                         select new class_details
                         {
                             assignID = cm.id,
                             classid = cm.id,
                             univeristyname = um.university_name,
                             classname = cm.classname,
                             startdate = date.class_startdate,
                             mode = cm.modeid == 1 ? "Online" : cm.modeid == 2 ? "F2F" : "At Students Home",
                             recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
                             classstarttime = cm.class_starttime,
                             classendtime = cm.class_endtime,
                             subject = sm.description,
                             grade = gm.description,
                             location = cm.location,
                             timezone = cm.timezone

                         }).ToList();

            foreach (var item in applicant)
            {
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
    protected DataTable BindDatatable_weekly()
    {
        weekly_record();
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
        BindGrid();
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
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Reports.xls");
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
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    
}