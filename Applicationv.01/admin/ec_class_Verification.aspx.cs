using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_class_Verification : System.Web.UI.Page
{
    
    string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int? exampaperid = 0, assignID, Userid, universityID, classID;
    exam_assign data = new exam_assign();
    public string applicantfirstname, assessmentname, examname;
    public int pagebackDone;
    public string verify_status = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Request.QueryString["ID"] != null)
        {
            assignID = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = assignID;
        }
        else
            assignID = Convert.ToInt32(Session["ID"]);

        Session["ID"] = assignID;

        if (Request.QueryString["SID"] != null)
        {
            Userid = Convert.ToInt32(Request.QueryString["SID"]);
            Session["SID"] = assignID;
        }
        else
            Userid = Convert.ToInt32(Session["SID"]);
        universityID = Utility.GetUniversityId();
        var date_data = db.ec_class_date_schedule_master.Where(x => x.id == assignID).FirstOrDefault();
        classID = date_data.classID;

        DateTime utc_datetime = DateTime.UtcNow;

        if (date_data.class_datetime_start_utc > utc_datetime)
        {
            div6.Attributes.Add("style", "display:block;");
            div2.Attributes.Add("style", "display:none;");
            div1.Attributes.Add("style", "display:none;");
            div4.Attributes.Add("style", "display:none;");
            label3.InnerText = "Class verification link will be active on " + date_data.class_datetime_start;
        }
        else if (utc_datetime > date_data.class_datetime_end_utc)
        {
            div6.Attributes.Add("style", "display:block;");
            div2.Attributes.Add("style", "display:none;");
            div1.Attributes.Add("style", "display:none;");
            div4.Attributes.Add("style", "display:none;");
            label3.InnerText = "This link is no more valid for this class verification.";
        }
        else if (utc_datetime.ToString("dd/MM/yyy") == Convert.ToDateTime(date_data.class_datetime_start_utc).ToString("dd/MM/yyy"))
        {
            //check ifalready action taken 
            verify_status = db.ec_class_attendance_master.Where(x => x.applicantid == Userid && x.universityid == universityID && x.class_dateID == assignID).Select(x => x.verify_status).FirstOrDefault();
            if (string.IsNullOrEmpty(verify_status))
            {
                div1.Attributes.Add("style", "display:block;");
                div4.Attributes.Add("style", "display:none;");
            }
            else
            {
                div2.Attributes.Add("style", "display:none;");
                div1.Attributes.Add("style", "display:none;");
                div4.Attributes.Add("style", "display:block;");
            }
        }

    }

    protected void btn_passkey_Click(object sender, EventArgs e)
    {
        try {
            string passkey = txtpasskey.Value;
            
            var Instructor_ID= db.ec_class_date_schedule_master.Where(x => x.id  == assignID).Select(x=>x.instructorID).FirstOrDefault();
            var Instructor_passkey = db.examiner_master.Where(x => x.examinerID == Instructor_ID).Select(x => x.examinerkey).FirstOrDefault();
            if (passkey == Instructor_passkey)
            {

                div1.Attributes.Add("style", "display:none");
                div2.Attributes.Add("style", "display:block");

            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Passkey Incorrect.');window.location='" + Request.ApplicationPath + "admin/ec_class_Verification.aspx?ID="+assignID+"&SID="+Userid+"';", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int actionid = Convert.ToInt32(ddlaction.SelectedValue);

            ec_class_attendance_master objmapping = new ec_class_attendance_master();
            var mode = "new";

            var data = db.ec_class_attendance_master.Where(x => x.applicantid == Userid && x.universityid == universityID && x.class_dateID == assignID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }

            objmapping.verify_status = ddlaction.SelectedItem.Text;
            objmapping.Is_loggedin = 1;
            objmapping.login_time_utc = DateTime.UtcNow;

            if (mode == "new")
            {

                objmapping.applicantid = Userid;
                objmapping.classID = classID;
                objmapping.class_dateID = assignID;
                objmapping.universityid = universityID;

                db.ec_class_attendance_master.Add(objmapping);
            }
            db.SaveChanges();
            div1.Attributes.Add("style", "display:none;");
            div2.Attributes.Add("style", "display:none;");
            div4.Attributes.Add("style", "display:block;");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}