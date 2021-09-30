using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_class_create_assign_students : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int adminId, universityID, RecordID = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    ec_class_master objec_class_master = new ec_class_master();
    int ispageedit = 0;

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
  
    private void populate(int classID){
        try {
            ispageedit = 1;
            var data = db.ec_class_master.Where(x => x.id == classID).FirstOrDefault();
            if (data.gradeid != null)
            {
                ddlgrade.ClearSelection();
                ddlgrade.Items.FindByValue(data.gradeid.ToString()).Selected = true;
            }
            if (data.groupid != null)
            {
                ddlgroup.ClearSelection();
                ddlgroup.Items.FindByValue(data.groupid.ToString()).Selected = true;
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
            setApplicant(Convert.ToInt32(data.gradeid), Convert.ToInt32(data.subjectid), Convert.ToInt32(data.type), Convert.ToInt32(data.modeid),classID, Convert.ToInt32(data.groupid));
            chkstudent.ClearSelection();
            var universityWise = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == classID && x.status == 7).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chkstudent.Items.FindByValue(universityWise[k].applicantid.ToString()).Selected = true;
                chkstudent.Items.FindByValue(universityWise[k].applicantid.ToString()).Enabled = false;
            }
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

            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == universityID
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlgroup.DataSource = Class;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);


            var subject = db.subjectmaster.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);
            
            var type = db.ec_type_master.ToList();
            ddltype.DataSource = type;
            ddltype.DataTextField = "type_description";
            ddltype.DataValueField = "type_id";
            ddltype.DataBind();
            ddltype.Items.Insert(0, lst);

            var mode = db.ec_mode_master.ToList();
            ddlmode.DataSource = mode;
            ddlmode.DataTextField = "mode_description";
            ddlmode.DataValueField = "mode_id";
            ddlmode.DataBind();
            ddlmode.Items.Insert(0, lst);

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
            int classID = Convert.ToInt32(ddlclass.SelectedValue);
            //check classavailability
            var applied_class_data = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == classID && x.status == 7).ToList();
            var classavailability = db.ec_class_master.Where(x => x.id == classID).Select(x => x.availability).FirstOrDefault();

            if (classavailability >= applied_class_data.Count + 1)//+ 1 for condition for current count of applicnat
            {
                ec_class_applicationmaster objmapping = new ec_class_applicationmaster();
                foreach (ListItem li in chkstudent.Items)
                {
                    if (li.Selected)
                    {
                        if (classavailability >= applied_class_data.Count)
                        {
                            int applicantid = Convert.ToInt32(li.Value);
                            var data = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == classID && x.applicantid == applicantid && x.Is_suspened != 1).FirstOrDefault();
                            if (data == null)
                            {
                                objmapping.universityid = universityID;
                                objmapping.classid = classID;
                                objmapping.applicantid = applicantid;
                                objmapping.Is_class_assignedby_admin = 1;
                                objmapping.adminID = adminId;
                                objmapping.booking_datetime = DateTime.UtcNow;
                                objmapping.status = 7;//enrolled
                                db.ec_class_applicationmaster.Add(objmapping);
                                db.SaveChanges();
                                create_Record_In_Assign_Assignment(applicantid, classID);
                            }
                            //also add in attendance tbl
                            
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class availability is full.')", true);
                            break;
                        }
                    }
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
             "alert('Mapping saved successfully');window.location='" + Request.ApplicationPath + "admin/ec_class_create_assign_students_master.aspx';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class availability is full.')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void create_Record_In_Assign_Assignment(int applicantid, int classid)
    {
        try
        {

            /// assignment assign tbl madhe reord 
            var assignment_schedule_Record = db.ec_assignments_assignschedule_master.Where(x =>x.asm_universityid == universityID &&  x.asm_class_id == classid).FirstOrDefault();
            if (assignment_schedule_Record != null)
            {
                int assignscheduleID = assignment_schedule_Record.asm_id;

                var assignment_schedule_date_Record = db.ec_assignments_assignschedule_date_master.Where(x => x.assignschedule_id == assignscheduleID).ToList();
                foreach (var date in assignment_schedule_date_Record)
                {
                    ec_assignments_assign objmapping = new ec_assignments_assign();

                    var data = db.ec_assignments_assign.Where(x => x.universityid == universityID && x.applicantId == applicantid && x.assignmentId == date.assignment_id  && x.assignment_date_id == date.asmd_id).FirstOrDefault();
                    if (data == null)
                    {
                        objmapping.universityid = universityID;
                        objmapping.assignschedule_Id = date.assignschedule_id;
                        objmapping.assignmentId = date.assignment_id;
                        objmapping.applicantId = applicantid;
                        objmapping.status = 1;
                        objmapping.adminId = adminId;
                        objmapping.assignment_date_id = date.asmd_id;
                        db.ec_assignments_assign.Add(objmapping);
                        db.SaveChanges();
                    }
                }
            }
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
        int GroupID = Convert.ToInt32(ddlgroup.SelectedValue);
        setApplicant(gradeID, subjectID, typeID, modeID, classID , GroupID);
    }

    private void setApplicant(int gradeID, int subjectID, int typeID, int modeID, int classID , int GroupID)
    {
        try
        {
            var applied_class_data = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == classID && x.status == 7).ToList();
            var classavailability = db.ec_class_master.Where(x => x.id == classID).Select(x => x.availability).FirstOrDefault();

            lblavilable.Text = applied_class_data.Count + "/" + classavailability;
            var temp = (from x in db.applicantdetails
                        join subjcet in db.exam_applicant_subjectmapping on x.applicantid equals subjcet.applicantid
                        where x.universityid == universityID && x.isdeletedbyAdmin != true && x.groupId == GroupID && x.gradeid == gradeID && subjcet.universityid == universityID 
                        select new
                        {
                            fieldname = "["+ x.applicantid+"] "+x.firstname + " " + x.middlename + " " + x.lastname,
                            id = x.applicantid,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            
            chkstudent.DataSource = temp;
            chkstudent.DataTextField = "fieldname";
            chkstudent.DataValueField = "id";
            chkstudent.DataBind();
            
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID = Convert.ToInt32(ddlmode.SelectedValue);
        
        GetClass(gradeID, subjectID, typeID, modeID);
    }
}