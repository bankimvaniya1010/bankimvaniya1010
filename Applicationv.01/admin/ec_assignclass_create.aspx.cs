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
public partial class admin_ec_assignclass_create : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        adminId = Convert.ToInt32(Session["UserID"]);
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        if (!IsPostBack)
        {
            BindDropdowns();
        }
    }
  
    private void BindDropdowns()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            
            var grade = db.grademaster.ToList();
            ddlgrade.DataSource = grade;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            var subject = db.subjectmaster.ToList();
            ddlsubject.DataSource = subject;
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

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            ec_class_assign objec_class_master = new ec_class_assign();

            
            if (ddlgrade.SelectedValue != "0")
                objec_class_master.gradeid = Convert.ToInt32(ddlgrade.SelectedValue);
            if (ddlsubject.SelectedValue != "0")
                objec_class_master.subjectid = Convert.ToInt32(ddlstudentid.SelectedValue);
            if (ddlclass.SelectedValue != "0")
                objec_class_master.classid = Convert.ToInt32(ddlclass.SelectedValue);
            if (ddlstartdate.SelectedValue != "0")
                objec_class_master.classstartdateid = Convert.ToInt32(ddlstartdate.SelectedValue);
            if (ddlrecurrence.SelectedValue != "0")
                objec_class_master.recurrenceid = Convert.ToInt32(ddlrecurrence.SelectedValue);

            if (objec_class_master.recurrenceid == 1) {
                objec_class_master.repeatsevery_day = txtrepeatsevery_day.Value;
                objec_class_master.enddate_daily = Convert.ToDateTime(txtenddate_daily.Value);
            }
            else if (objec_class_master.recurrenceid == 2) {
                objec_class_master.repeateevery_week = txtrepeateevery_week.Value;
                for (int i = 0; i < lstDayofWeek.Items.Count; i++)
                {  
                    if (lstDayofWeek.Items[i].Selected == true)
                        objec_class_master.daysof_week += Convert.ToInt32(lstDayofWeek.Items[i].Value) + ",";
                }

                objec_class_master.enddate_weekly = Convert.ToDateTime(txtenddate_weekly.Value);
            }
            else if(objec_class_master.recurrenceid == 3) {
                objec_class_master.repeateevery_months = txtrepeateevery_months.Value;
                objec_class_master.day_months = txtday_months.Value;
                if (ddlday.SelectedValue != "0")
                    objec_class_master.ddlday = Convert.ToInt32(ddlday.SelectedValue);
                if (ddlday2.SelectedValue != "0")
                    objec_class_master.ddlday1 = Convert.ToInt32(ddlday2.SelectedValue);
                objec_class_master.enddate_monthly = Convert.ToDateTime(txtenddate_monthly.Value);
            }
            objec_class_master.class_starttime = txtclassstarttime.Value;
            objec_class_master.class_endtime = txtclassendtime.Value;

            objec_class_master.universityid = universityID;
            db.ec_class_assign.Add(objec_class_master);
            db.SaveChanges();
            int assignID = objec_class_master.id;
            // save student rec
            ec_class_assign_student_mapping objmapping = new ec_class_assign_student_mapping();
            
            foreach (ListItem li in ddlstudentid.Items)
            {
                if (li.Selected)
                {
                    objmapping.assign_id = assignID;
                    objmapping.universityid = universityID;
                    objmapping.studentid = Convert.ToInt32(li.Value);
                    db.ec_class_assign_student_mapping.Add(objmapping);
                    db.SaveChanges();
                }
            }
            
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Assigned Successfully');window.location='" + Request.ApplicationPath + "admin/ec_assignclass_mange.aspx';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public class Data {
        public int id { get; set; }
        public DateTime? class_startdate { get; set; }
        public string strclass_startdate { get; set; }
    }

    private void GetClassesDate(int classID)
    {
        var classData = (from cm in db.ec_class_date_master
                         
                         where cm.classid == classID
                         select new Data()
                         {
                             id = cm.id,
                             class_startdate = cm.class_startdate,
                             strclass_startdate= string.Empty
                         }).Distinct().ToList();
        foreach (var item in classData)
        {
            item.strclass_startdate = Convert.ToDateTime(item.class_startdate).ToString("dd/MM/yyyy");
        }

        ListItem lst = new ListItem("Please select", "0");
                
        ddlstartdate.DataSource = classData;
        ddlstartdate.DataTextField = "strclass_startdate";
        ddlstartdate.DataValueField = "id";
        ddlstartdate.DataBind();
        ddlstartdate.Items.Insert(0, lst);
    }

    private void GetClasses(int subjectid, int gradeid)
    {
        GTEEntities db1 = new GTEEntities();
        var classData = db1.ec_class_master.Where(x => x.subjectid == subjectid && x.gradeid == gradeid).ToList();
        ListItem lst = new ListItem("Please select", "0");

        ddlclass.DataSource = classData;
        ddlclass.DataTextField = "classname";
        ddlclass.DataValueField = "id";
        ddlclass.DataBind();
        ddlclass.Items.Insert(0, lst);
    }
  
    private void BindUniversitywiseStudent(int gradeid, int subjectid)
    {
        try
        {
            var studentID = (from ad in db.applicantdetails
                             
                             join sd in db.students on ad.applicantid equals sd.studentid into sdata
                             from s in sdata.DefaultIfEmpty()
                             where ad.isdeletedbyAdmin != true && ad.isverifiedbyAdmin == true && ad.gradeid == gradeid && ad.subjectId == subjectid
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

    protected void ddlstartdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlgrade.SelectedValue != "0" && ddlsubject.SelectedValue != "0")
            GetClasses(Convert.ToInt32(ddlsubject.SelectedValue), Convert.ToInt32(ddlgrade.SelectedValue));
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlclass.SelectedValue != "0")
            GetClassesDate(Convert.ToInt32(ddlclass.SelectedValue));
    }

    protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlclass.ClearSelection();
        ddlstartdate.ClearSelection();
    }
}