using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_create_assignstudymaterial : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID,x=0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    //List<IdNameModel> study_materials = new List<IdNameModel>();

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
        else
        {
            //ScriptManager.RegisterClientScriptBlock(this, typeof(string), "uniqueKey", "createFacilityBlock();", true);
            //ScriptManager.RegisterClientScriptBlock(this, typeof(string), "uniqueKey", "loadTimeZoneList();", true); 
        }
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
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bind_mode(int type_id)
    {
        ListItem lst = new ListItem("Please select", "0");
        var mode = db.ec_mode_master.ToList();
        ddlmode.DataSource = mode;
        ddlmode.DataTextField = "mode_description";
        ddlmode.DataValueField = "mode_id";
        ddlmode.DataBind();
        ddlmode.Items.Insert(0, lst);
    }

    private void bind_study_material(string subject_id, string grade_id)
    {
        var material = db.ec_study_material.Where(x => x.universityid == universityID && x.material_grade.Contains(grade_id) && x.material_subject.Contains(subject_id)).ToList();
        list_materials.DataSource = material;
        list_materials.DataTextField = "material_name";
        list_materials.DataValueField = "material_id";
        list_materials.DataBind();
    }

    private void GetClasses(int subjectid, int gradeid, int typeid, int modeid)
    {
        GTEEntities db1 = new GTEEntities();
        var classData = (from x in db.ec_class_master
                         where x.subjectid == subjectid && x.gradeid == gradeid && x.type == typeid && x.modeid == modeid
                         select new
                         {
                             classname = "["+x.id + "]" + x.classname,
                             id = x.id,
                         }).ToList();
        ListItem lst = new ListItem("Please select", "0");

        ddlclass.DataSource = classData;
        ddlclass.DataTextField = "classname";
        ddlclass.DataValueField = "id";
        ddlclass.DataBind();
        ddlclass.Items.Insert(0, lst);
    }

    //private void GetClassesDate(int classID)
    //{
    //    var classData = (from cm in db.ec_class_date_master

    //                     where cm.classid == classID
    //                     select new Material_Data()
    //                     {
    //                         id = cm.id,
    //                         class_startdate = cm.class_startdate,
    //                         strclass_startdate = string.Empty
    //                     }).Distinct().ToList();
    //    foreach (var item in classData)
    //    {
    //        item.strclass_startdate = Convert.ToDateTime(item.class_startdate).ToString("dd/MM/yyyy");
    //    }

    //    ListItem lst = new ListItem("Please select", "0");

    //    ddlstartdate.DataSource = classData;
    //    ddlstartdate.DataTextField = "strclass_startdate";
    //    ddlstartdate.DataValueField = "id";
    //    ddlstartdate.DataBind();
    //    ddlstartdate.Items.Insert(0, lst);
    //}

    private void BindUniversitywiseStudent(int gradeid, int subjectid)
    {
        //try
        //{
        //    var studentID = (from ad in db.applicantdetails

        //                     join sd in db.students on ad.applicantid equals sd.studentid into sdata
        //                     from s in sdata.DefaultIfEmpty()
        //                     where ad.isdeletedbyAdmin != true && ad.isverifiedbyAdmin == true /*&& ad.gradeid == gradeid && ad.subjectId == subjectid*/
        //                     select new
        //                     {
        //                         applicantid = ad.applicantid,
        //                         applicantname = ad.studentid == null ? "(" + ad.applicantid + ")" + ad.firstname : "(" + ad.applicantid + ")" + ad.firstname + "(" + ad.studentid + ")",

        //                     }).ToList();

        //    ddlstudentid.DataSource = studentID;
        //    ddlstudentid.DataTextField = "applicantname";
        //    ddlstudentid.DataValueField = "applicantid";
        //    ddlstudentid.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    objLog.WriteLog(ex.ToString());
        //}
    }

    protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlclass.ClearSelection();
      //  ddlstartdate.ClearSelection();
    }

    //protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlgrade.SelectedValue != "0" && ddlsubject.SelectedValue != "0")
    //    {            
    //        bind_study_material(Convert.ToString(ddlsubject.SelectedValue), Convert.ToString(ddlgrade.SelectedValue));
    //        BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
    //    }
    //}

    //protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //if (ddlclass.SelectedValue != "0")
    //     //   GetClassesDate(Convert.ToInt32(ddlclass.SelectedValue));
    //}

    //protected void ddlstartdate_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
    //}
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            ec_assign_study_material objec_stud_merial_assign = new ec_assign_study_material();
            if (ddlgrade.SelectedValue != "0")
                objec_stud_merial_assign.asm_grade_id = Convert.ToInt32(ddlgrade.SelectedValue);
            if (ddlsubject.SelectedValue != "0")
                objec_stud_merial_assign.asm_subject_id = Convert.ToInt32(ddlsubject.SelectedValue);
            if (ddlclass.SelectedValue != "0")
                objec_stud_merial_assign.asm_class_id = Convert.ToInt32(ddlclass.SelectedValue);
            //if (ddlstartdate.SelectedValue != "0")
            //    objec_stud_merial_assign.asm_start_date = Convert.ToInt32(ddlstartdate.SelectedValue);
            if (ddltype.SelectedValue != "0")
                objec_stud_merial_assign.asm_type = Convert.ToInt32(ddltype.SelectedValue);
            if (ddlmode.SelectedValue != "0")
                objec_stud_merial_assign.asm_mode = Convert.ToInt32(ddlmode.SelectedValue);
            objec_stud_merial_assign.asm_time_zone= Request.Form["timezone"];
            string grade_comma = "";
            for (int i = 0; i < list_materials.Items.Count; i++)
            {
                if (list_materials.Items[i].Selected == true)
                {
                    grade_comma += Convert.ToString(list_materials.Items[i].Value) + ',';
                }
            }
            objec_stud_merial_assign.asm_study_material = grade_comma.Substring(0, grade_comma.Length - 1);
            objec_stud_merial_assign.asm_universityid = universityID;
            db.ec_assign_study_material.Add(objec_stud_merial_assign);
            db.SaveChanges();

            int assignID = objec_stud_merial_assign.asm_id;
            // save student rec
            
            foreach (ListItem li in list_materials.Items)
            {
                if (li.Selected)
                {
                    ec_assign_study_material_date_wise objmapping = new ec_assign_study_material_date_wise();
                    string str_pdate = Request.Form.GetValues("pickerDateTime_" + li.Value).FirstOrDefault();
                    string str_fdate = Request.Form.GetValues("startdate_" + li.Value).FirstOrDefault();
                    string str_sdate_utc= Request.Form.GetValues("hidstartutcdatetime_" + li.Value).FirstOrDefault();
                    string str_fdate_utc = Request.Form.GetValues("hidstoputcdatetime_" + li.Value).FirstOrDefault();
                    DateTime fdate = Convert.ToDateTime(str_fdate);
                    DateTime pdate = Convert.ToDateTime(str_pdate);
                    objmapping.asmd_asm_id = assignID;
                    objmapping.asmd_material_id = Convert.ToInt32(li.Value);
                    objmapping.asmd_start_date = fdate;
                    objmapping.asmd_stop_time = pdate;
                    objmapping.asmd_start_utc_date = Convert.ToDateTime(str_sdate_utc);
                    objmapping.asm_stop_utc_date= Convert.ToDateTime(str_fdate_utc);
                    db.ec_assign_study_material_date_wise.Add(objmapping);
                    
                }
            }
            db.SaveChanges();
            //foreach (ListItem li in ddlstudentid.Items)
            //{
            //    if (li.Selected)
            //    {
            //        ec_student_assign_in_study_material student_assign_study_material = new ec_student_assign_in_study_material();
            //        student_assign_study_material.sasm_asm_id = assignID;
            //        student_assign_study_material.sasm_universityid = universityID;
            //        student_assign_study_material.sasm_stud_id = Convert.ToInt32(li.Value);
            //        db.ec_student_assign_in_study_material.Add(student_assign_study_material);
            //        db.SaveChanges();
            //    }
            //}
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Assigned Successfully');window.location='" + Request.ApplicationPath + "admin/ec_assign_mange_study_material.aspx';", true);
            //Response.Redirect("ec_assign_mange_study_material.aspx");

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    //protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    bind_mode(Convert.ToInt32(ddltype.SelectedValue));
        
    //    BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
    //}

    protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_study_material(Convert.ToString(ddlsubject.SelectedValue), Convert.ToString(ddlgrade.SelectedValue));
        //BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
        if (ddlgrade.SelectedValue != "0" && ddlsubject.SelectedValue != "0" && ddltype.SelectedValue != "0" && ddlmode.SelectedValue != "0")
            GetClasses(Convert.ToInt32(ddlsubject.SelectedValue), Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddltype.SelectedValue), Convert.ToInt32(ddlmode.SelectedValue));
    }
}

//public class IdNameModel
//{
//    public string Id { get; set; }
//    public string Name { get; set; }
//}

//public class Material_Data
//{
//    public int id { get; set; }
//    public DateTime? class_startdate { get; set; }
//    public string strclass_startdate { get; set; }
//}