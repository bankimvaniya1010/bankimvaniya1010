using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_schedule : System.Web.UI.Page
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
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindExamPaper(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = db.exam_master.Where(x=>x.universityID == universityid).ToList();
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

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {

            int selecteduniversity = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime exam_datetime = Convert.ToDateTime(selectedexamdate_time.Value);

            exam_schedule objexam_schedule = new exam_schedule();
            var data = db.exam_schedule.Where(x => x.universityid == selecteduniversity && x.exampapersid == selectedexamid && x.exam_datetime == exam_datetime).FirstOrDefault();
            if (data == null)
            {
                objexam_schedule.universityid = selecteduniversity;
                objexam_schedule.exampapersid = selectedexamid;
                objexam_schedule.utctimezone = hidTimeZone.Value;
                objexam_schedule.exam_datetime = exam_datetime;
                objexam_schedule.exam_datetime_utc = Convert.ToDateTime(hidexamutcdatetime.Value);
                db.exam_schedule.Add(objexam_schedule);
                db.SaveChanges();
                selectedexamdate_time.Value = "";
                hidTimeZone.Value = "";
                hidexamutcdatetime.Value = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record Added successfully.');window.location='" + Request.ApplicationPath + "admin/exam_scheduleList.aspx';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record already present.')", true);

        } catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
        
    protected void ddlUniversity_SelectedIndexChanged1(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExamPaper(selecteduniversityid);
    }
}