using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_class_create_assign_instructor : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int adminId, universityID, RecordID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    ec_class_master objec_class_master = new ec_class_master();

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

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            RecordID = -1;
            if (int.TryParse(Request.QueryString["id"], out RecordID))
            {
                objec_class_master = db.ec_class_master.Where(obj => obj.id == RecordID).FirstOrDefault();
                if (objec_class_master == null)
                    RecordID = -1;
            }
        }

        if (!IsPostBack)
        {
            BindDropdowns();
            if (objec_class_master != null)
                populate(RecordID);

        }
    }
    private void populate(int classID)
    {
        try
        {
            var data = db.ec_class_master.Where(x => x.id == classID).FirstOrDefault();
            if (data.gradeid != null)
            {
                ddlgrade.ClearSelection();
                ddlgrade.Items.FindByValue(data.gradeid.ToString()).Selected = true;
            }
            if (data.subjectid != null)
            {
                ddlsubject.ClearSelection();
                ddlsubject.Items.FindByValue(data.subjectid.ToString()).Selected = true;
            }
            if (data.type != null)
            {
                ddltype.ClearSelection();
                ddltype.Items.FindByValue(data.type.ToString()).Selected = true;
            }
            if (data.modeid != null)
            {
                ddlmode.ClearSelection();
                ddlmode.Items.FindByValue(data.modeid.ToString()).Selected = true;
            }

            if (data.modeid != null)
            {
                GetClass(Convert.ToInt32(data.gradeid), Convert.ToInt32(data.subjectid), Convert.ToInt32(data.type), Convert.ToInt32(data.modeid));

                ddlclass.ClearSelection();
                ddlclass.Items.FindByValue(classID.ToString()).Selected = true;
            }
            BindGrid(classID);
            
           
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void BindDropdowns()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");

            var grade = db.ec_grademaster.ToList();
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

            var clas = db.ec_class_master.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

            var intrcutor = db.examiner_master.Where(x=>x.roleid == 10 && x.universityId == universityID).Select(x=>new { username = x.username ,id= x.examinerID}).ToList();
            ddlintructor.DataSource = intrcutor;
            ddlintructor.DataTextField = "username";
            ddlintructor.DataValueField = "id";
            ddlintructor.DataBind();
            ddlintructor.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void GetClass(int gradeID, int subjectID, int typeID, int modeID)
    {

        var temp = (from x in db.ec_class_master
                    where x.universityid == universityID && x.gradeid == gradeID && x.subjectid == subjectID && x.type == typeID && x.modeid == modeID
                    select new
                    {
                        fieldname = x.classname,
                        id = x.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        ListItem lst = new ListItem("Please select", "0");
        ddlclass.DataSource = temp;
        ddlclass.DataTextField = "fieldname";
        ddlclass.DataValueField = "id";
        ddlclass.DataBind();
        ddlclass.Items.Insert(0, lst);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
       
        try
        {
            int instructorID = Convert.ToInt32(ddlintructor.SelectedValue);
            foreach (GridViewRow row in grid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    
                    Label lblassignid = (Label)row.FindControl("lblassignid");
                    int assignid = Convert.ToInt32(lblassignid.Text);


                    ec_class_date_schedule_master objassign = new ec_class_date_schedule_master();

                    CheckBox c = (CheckBox)row.FindControl("chkassign");
                    if (c.Checked)
                    {
                        var examdata = db.ec_class_date_schedule_master.Where(x => x.id == assignid).FirstOrDefault();
                        if (examdata != null)
                        {
                            var mode = "new";

                            if (examdata != null)
                            {
                                mode = "update";
                                objassign = examdata;
                            }
                            
                            objassign.instructorID = instructorID;
                            if (mode == "new")
                                db.ec_class_date_schedule_master.Add(objassign);

                            db.SaveChanges();
                        }
                    }
                }
            }
            int classID = Convert.ToInt32(ddlclass.SelectedValue);
            BindGrid(classID);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID = Convert.ToInt32(ddlmode.SelectedValue);
        int classID = Convert.ToInt32(ddlclass.SelectedValue);
        BindGrid(classID);
        //setClass_Calender(classID);
    }

   
    protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID = Convert.ToInt32(ddlmode.SelectedValue);

        GetClass(gradeID, subjectID, typeID, modeID);
    }
    public class data {
        public int assignid { get; set; }
        public int id { get; set; }
        public string classstarttime { get; set; }
        public string classendtime { get; set; }
        public int? showcheckbox { get; set; }
        public string date { get; set; }
        public string fieldname { get; set; }
        public string instructor { get; set; }
        public DateTime? classdate { get; set; }
        public int? instructorID { get; set; }
        public string conductLink { get; set; }
    }

    private void BindGrid(int classID) {
        try {
            var temp = (from x in db.ec_class_date_schedule_master
                        
                        join cm in db.ec_class_master on x.classID equals cm.id
                        where x.classID == classID
                        select new data()
                        {
                            assignid = x.id,
                            classdate = x.class_datetime_start,
                            date = string.Empty,
                            classstarttime = cm.class_starttime,
                            classendtime = cm.class_endtime,
                            //username = im.username,
                            showcheckbox = x.instructorID == null ? null: x.instructorID,
                            instructor = string.Empty,
                            instructorID= x.instructorID,
                            fieldname = cm.classname + " # " + x.class_datetime_start,
                            id = cm.id,
                            conductLink = webURL+ "admin/ec_conduct_class.aspx?DID="+x.id,
                        }).ToList();

            foreach (var item in temp) {

                if (item.classdate != null)
                {
                    item.date = Convert.ToDateTime(item.classdate).ToString("dd/MMM/yyyy");
                    item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
                    item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
                }
                if (item.instructorID != null)
                    item.instructor = db.examiner_master.Where(x => x.examinerID == item.instructorID).Select(x => x.username).FirstOrDefault();
            }

            grid.DataSource =temp;
            grid.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
   
}