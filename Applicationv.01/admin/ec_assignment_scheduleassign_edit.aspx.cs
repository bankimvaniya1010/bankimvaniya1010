using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_assignment_scheduleassign_edit : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    public static int selectedasm_id, universityID, adminId;
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

        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == "") || (Request.QueryString["id"].ToString() == "0"))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
        {
            selectedasm_id = Convert.ToInt32(Request.QueryString["id"]);
        }
        if (!IsPostBack)
        {
            BindDropdowns();
            populateData(selectedasm_id);
        }
        else
        {
            //ScriptManager.RegisterClientScriptBlock(this, typeof(string), "uniqueKey", "createFacilityBlock();", true);
        }
    }

    private void populateData(int asm_id_edit)
    {
        try
        {

            var objec_assign_study_material = db.ec_assignments_assignschedule_master.Where(x => x.asm_id == asm_id_edit).FirstOrDefault();
            BindDropdowns();
            ddlgrade.SelectedValue = objec_assign_study_material.asm_grade_id.ToString();
            ddlsubject.SelectedValue = objec_assign_study_material.asm_subject_id.ToString();
            GetClasses(Convert.ToInt32(objec_assign_study_material.asm_subject_id), Convert.ToInt32(objec_assign_study_material.asm_grade_id), Convert.ToInt32(objec_assign_study_material.asm_type_id), Convert.ToInt32(objec_assign_study_material.asm_mode_id));
            ddlclass.SelectedValue = objec_assign_study_material.asm_class_id.ToString();
            bind_study_material(Convert.ToString(ddlsubject.SelectedValue), Convert.ToString(ddlgrade.SelectedValue));
            //GetClassesDate(Convert.ToInt32(ddlclass.SelectedValue));
            //ddlstartdate.SelectedValue = objec_assign_study_material.asm_start_date.ToString();
            ddltype.SelectedValue = objec_assign_study_material.asm_type_id.ToString();
            
            ddlmode.SelectedValue = objec_assign_study_material.asm_mode_id.ToString();
            //Request.Form.Add("timezone").SetValue = objec_assign_study_material.asm_time_zone.ToString();
            if (objec_assign_study_material.asm_assignment_id != null)
            {
                list_materials.ClearSelection();
                string[] materials_ids = objec_assign_study_material.asm_assignment_id.Split(',');
                for (int i = 0; i < materials_ids.Length; i++)
                {
                    //int value_check =Convert.ToInt32(materials_ids[i]);
                    //list_materials.Items[value_check].Selected = true;
                    list_materials.Items.FindByValue(materials_ids[i]).Selected = true;
                    list_materials.Items.FindByValue(materials_ids[i]).Attributes.Add("disabled", "disabled");
                }
            }

            var data = (from p in db.ec_assignments_assignschedule_date_master
                        join q in db.ec_assignments_assignschedule_master on p.assignschedule_id equals q.asm_id
                        join m in db.ec_assignment_master on p.assignment_id equals m.id
                        where p.assignschedule_id == asm_id_edit
                        select new
                        {
                            p.asmd_id,
                            p.assignschedule_id,
                            p.assignment_id,
                            p.asmd_start_date,
                            p.asmd_stop_time,
                            p.asmd_start_utc_date,
                            p.asm_stop_utc_date,
                            q.asm_time_zone,
                            m.assignment_name
                        }).ToList();

            //var student_select = (from asm in db.ec_assignments_assignschedule_master
            //                      join q in db.ec_assignments_assignschedule_student_mapping on asm.asm_id equals q.assignschedule_id
            //                      where asm.asm_id == asm_id_edit
            //                      select new
            //                      {
            //                          q.applicantid
            //                      }).ToList();
            //BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
            //if (student_select.Count != 0)
            //{
            //    for (int k = 0; k < student_select.Count; k++)
            //    {
            //        ddlstudentid.Items.FindByValue(student_select[k].applicantid.ToString()).Selected = true;
            //        ddlstudentid.Items.FindByValue(student_select[k].applicantid.ToString()).Enabled = false;
            //    }
            //}
            Session["edit_material_data"] = JsonConvert.SerializeObject(data);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindUniversitywiseStudent(int gradeid, int subjectid)
    {
        try
        {
            //var studentID = (from ad in db.applicantdetails

            //                 join sd in db.students on ad.applicantid equals sd.studentid into sdata
            //                 from s in sdata.DefaultIfEmpty()
            //                 where ad.isdeletedbyAdmin != true && ad.isverifiedbyAdmin == true /*&& ad.gradeid == gradeid && ad.subjectId == subjectid*/
            //                 select new
            //                 {
            //                     applicantid = ad.applicantid,
            //                     applicantname = ad.studentid == null ? "(" + ad.applicantid + ")" + ad.firstname : "(" + ad.applicantid + ")" + ad.firstname + "(" + ad.studentid + ")",

            //                 }).ToList();

            //ddlstudentid.DataSource = studentID;
            //ddlstudentid.DataTextField = "applicantname";
            //ddlstudentid.DataValueField = "applicantid";
            //ddlstudentid.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
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

    private void bind_study_material(string subject_id, string grade_id)
    {
        var material = db.ec_assignment_master.Where(x => x.universityid == universityID && x.gradeid.Contains(grade_id) && x.subjectid.Contains(subject_id)).ToList();
        list_materials.DataSource = material;
        list_materials.DataTextField = "assignment_name";
        list_materials.DataValueField = "id";
        list_materials.DataBind();
    }

    private void GetClasses(int subjectid, int gradeid, int typeid, int modeid)
    {
        var classData = (from x in db.ec_class_master
                         where x.subjectid == subjectid && x.gradeid == gradeid && x.type == typeid && x.modeid == modeid
                         select new
                         {
                             classname = x.id + " " + x.classname,
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
    //                     select new Data_start_date()
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

    protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlclass.ClearSelection();
        // ddlstartdate.ClearSelection();
    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlgrade.SelectedValue != "0" && ddlsubject.SelectedValue != "0")
        {
            bind_study_material(Convert.ToString(ddlsubject.SelectedValue), Convert.ToString(ddlgrade.SelectedValue));
            BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
        }
    }

    //protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //if (ddlclass.SelectedValue != "0")
    //    //    GetClassesDate(Convert.ToInt32(ddlclass.SelectedValue));
    //}

    protected void ddlstartdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindUniversitywiseStudent(Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
    }

    protected void list_materials_SelectedIndexChanged(object sender, EventArgs e)
    {
        //div_material_time.Controls.Clear();

        // var newList = list_materials.Items.Cast<ListItem>().Where(p => p.Selected).Select(x => new IdNameModel() { Id = x.Value, Name = x.Text });
        // Any Remove

        //for (int i = 0; i < list_materials.Items.Count; i++)
        //{
        //    if (list_materials.Items[i].Selected == true)
        //    {
        //        x = x + 1;
        //    }
        //}
        //for (int j = 0; j < x; j++)
        //{
        //    div_material_time.Controls.Add(new LiteralControl("<div class='form - group row'>"));
        //    div_material_time.Controls.Add(new LiteralControl("<label for= 'name' class='col-sm-3 col-form-label form-label'>Starts Showing At"));
        //    div_material_time.Controls.Add(new LiteralControl("</label>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='col-sm-8'>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='row'>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='col-md-8'>"));
        //    TextBox txt_startname = new TextBox();
        //    txt_startname.ID = "txt_start_at_" + list_materials.SelectedValue;
        //    txt_startname.TextMode = TextBoxMode.DateTime;
        //    txt_startname.CssClass = "form-control";
        //    div_material_time.Controls.Add(txt_startname);
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("<br>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='form - group row'>"));
        //    div_material_time.Controls.Add(new LiteralControl("<label for= 'name' class='col-sm-3 col-form-label form-label'>Stop Showing At"));
        //    div_material_time.Controls.Add(new LiteralControl("</label>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='col-sm-8'>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='row'>"));
        //    div_material_time.Controls.Add(new LiteralControl("<div class='col-md-8'>"));
        //    TextBox txt_stopname = new TextBox();
        //    txt_stopname.ID = "txt_stop_at_" + list_materials.SelectedValue;
        //    txt_startname.TextMode = TextBoxMode.DateTime;
        //    txt_stopname.CssClass = "form-control";
        //    div_material_time.Controls.Add(txt_stopname);
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("</div>"));
        //    div_material_time.Controls.Add(new LiteralControl("<br>"));
        //}
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            ec_assignments_assignschedule_master objec_stud_merial_assign = new ec_assignments_assignschedule_master();

            var data = db.ec_assignments_assignschedule_master.Where(x => x.asm_id == selectedasm_id).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objec_stud_merial_assign = data;    
            }

            if (ddlgrade.SelectedValue != "0")
                objec_stud_merial_assign.asm_grade_id = Convert.ToInt32(ddlgrade.SelectedValue);
            if (ddlsubject.SelectedValue != "0")
                objec_stud_merial_assign.asm_subject_id = Convert.ToInt32(ddlsubject.SelectedValue);
            if (ddlclass.SelectedValue != "0")
                objec_stud_merial_assign.asm_class_id = Convert.ToInt32(ddlclass.SelectedValue);
            //if (ddlstartdate.SelectedValue != "0")
            //    objec_stud_merial_assign.asm_start_date = Convert.ToInt32(ddlstartdate.SelectedValue);
            if (ddltype.SelectedValue != "0")
                objec_stud_merial_assign.asm_type_id = Convert.ToInt32(ddltype.SelectedValue);
            if (ddlmode.SelectedValue != "0")
                objec_stud_merial_assign.asm_mode_id = Convert.ToInt32(ddlmode.SelectedValue);
            objec_stud_merial_assign.asm_time_zone = Request.Form["timezone"];
            string grade_comma = objec_stud_merial_assign.asm_assignment_id;

            for (int i = 0; i < list_materials.Items.Count; i++)
            {
                if (list_materials.Items[i].Selected == true)
                {
                    if(!grade_comma.Contains(list_materials.Items[i].Value))
                        grade_comma += Convert.ToString(list_materials.Items[i].Value) + ',';
                }
            }
            objec_stud_merial_assign.asm_assignment_id = grade_comma.Substring(0, grade_comma.Length - 1);
            objec_stud_merial_assign.asm_universityid = universityID;

            if (mode == "new")
            {
                db.ec_assignments_assignschedule_master.Add(objec_stud_merial_assign);
            }
            db.SaveChanges();
            
            foreach (ListItem li in list_materials.Items)
            {
                if (li.Selected)
                {
                    int assignmetID = Convert.ToInt32(li.Value);
                    var date_data = db.ec_assignments_assignschedule_date_master.Where(x => x.assignschedule_id == selectedasm_id && x.assignment_id == assignmetID).FirstOrDefault();
                    if (date_data == null)
                    {
                        ec_assignments_assignschedule_date_master objmapping = new ec_assignments_assignschedule_date_master();
                        string str_fdate = Request.Form.GetValues("startdate_" + li.Value).FirstOrDefault();
                        string str_pdate = Request.Form.GetValues("pickerDateTime_" + li.Value).FirstOrDefault();
                        string str_sdate_utc = Request.Form.GetValues("hidstartutcdatetime_" + li.Value).FirstOrDefault();
                        string str_fdate_utc = Request.Form.GetValues("hidstoputcdatetime_" + li.Value).FirstOrDefault();
                        DateTime fdate = Convert.ToDateTime(str_fdate);
                        DateTime pdate = Convert.ToDateTime(str_pdate);
                        objmapping.assignschedule_id = selectedasm_id;
                        objmapping.assignment_id = assignmetID;
                        objmapping.asmd_start_date = fdate;
                        objmapping.asmd_stop_time = pdate;
                        objmapping.asmd_start_utc_date = Convert.ToDateTime(str_sdate_utc);
                        objmapping.asm_stop_utc_date = Convert.ToDateTime(str_fdate_utc);
                        db.ec_assignments_assignschedule_date_master.Add(objmapping);
                    }
                }
            }
            db.SaveChanges();
            //foreach (ListItem li in ddlstudentid.Items)
            //{
            //    if (li.Selected)
            //    {
            //        ec_assignments_assignschedule_student_mapping student_assign_study_material = new ec_assignments_assignschedule_student_mapping();
            //        student_assign_study_material.assignschedule_id = assignID;
            //        student_assign_study_material.universityid = universityID;
            //        student_assign_study_material.applicantid = Convert.ToInt32(li.Value);
            //        db.ec_assignments_assignschedule_student_mapping.Add(student_assign_study_material);
            //        db.SaveChanges();
            //    }
            //}
            //save to assign
            ec_assignments_assign objec_assignments_assign = new ec_assignments_assign();

            if (objec_stud_merial_assign.asm_assignment_id != null)
            {
                var dataList = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == objec_stud_merial_assign.asm_class_id).ToList();
                list_materials.ClearSelection();
                string[] materials_ids = objec_stud_merial_assign.asm_assignment_id.Split(',');
                for (int i = 0; i < materials_ids.Length; i++)
                {
                    int assignmetID = Convert.ToInt32(materials_ids[i]);
                    foreach (var item in dataList)
                    {
                        int assignment_dateId = db.ec_assignments_assignschedule_date_master.Where(x => x.assignschedule_id == objec_stud_merial_assign.asm_id && x.assignment_id == assignmetID).Select(x => x.asmd_id).FirstOrDefault();

                        var data_ = db.ec_assignments_assign.Where(x =>x.assignschedule_Id == selectedasm_id && x.universityid == universityID && x.applicantId == item.applicantid && x.assignmentId == assignmetID && x.assignment_date_id == assignment_dateId).FirstOrDefault();
                        if (data_ == null)
                        {
                            objec_assignments_assign.universityid = universityID;
                            objec_assignments_assign.applicantId = item.applicantid;
                            objec_assignments_assign.assignschedule_Id = objec_stud_merial_assign.asm_id;
                            objec_assignments_assign.assignmentId = assignmetID;
                            objec_assignments_assign.adminId = adminId;

                            objec_assignments_assign.assignment_date_id = assignment_dateId;
                            objec_assignments_assign.status = 1;
                            db.ec_assignments_assign.Add(objec_assignments_assign);
                            db.SaveChanges();
                        }
                    }
                }
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + "admin/ec_assignment_scheduleassign_master.aspx';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlgrade.SelectedValue != "0" && ddlsubject.SelectedValue != "0" && ddltype.SelectedValue != "0" && ddlmode.SelectedValue != "0")
            GetClasses(Convert.ToInt32(ddlsubject.SelectedValue), Convert.ToInt32(ddlgrade.SelectedValue), Convert.ToInt32(ddltype.SelectedValue), Convert.ToInt32(ddlmode.SelectedValue));
    }
}
