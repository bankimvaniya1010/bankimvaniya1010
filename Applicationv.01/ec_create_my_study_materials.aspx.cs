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

public partial class ec_create_my_study_materials : System.Web.UI.Page
{
    int formId = 0, UserID = 0, UniversityID;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected int isFullService;
    public static List<details_study_material> study_material_list = new List<details_study_material>();

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

        var isDeclarationDoneByApplicant = (bool)Session["service5_DeclarationDoneByApplicant"];
        if (!isDeclarationDoneByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Please complete service agreement before proceeding.');window.location='" + Request.ApplicationPath + "ec_declareaion.aspx';", true);
        
        if (!IsPostBack)
        {
            Bindropdown();
            bind_grid();
        }
    }
    private void Bindropdown(int classid = 0, int gradeID = 0, int subjectID = 0, int material_id = 0)
    {
        List<details_study_material> temp = new List<details_study_material>();
        var data1 = db.ec_class_applicationmaster.Where(x => x.universityid == UniversityID && x.applicantid == UserID && x.status == 7).ToList();
        if (data1.Count != 0)
        {
            var data = (from mapping in db.ec_class_applicationmaster

                        join cm in db.ec_class_master on mapping.classid equals cm.id into classData
                        from cls in classData.DefaultIfEmpty()

                        join y in db.subjectmaster on cls.subjectid equals y.id into subjData
                        from sub in subjData.DefaultIfEmpty()

                        join gm in db.ec_grademaster on cls.gradeid equals gm.id into gradeData
                        from grd in gradeData.DefaultIfEmpty()

                        join a in db.ec_assign_study_material on mapping.classid equals a.asm_class_id into assign_schedule_data
                        from asm_sch in assign_schedule_data.DefaultIfEmpty()

                        join d in db.ec_assign_study_material_date_wise on asm_sch.asm_id equals d.asmd_asm_id into assign_schedule_date
                        from date in assign_schedule_date.DefaultIfEmpty()

                        join assign_stud in db.ec_study_material on date.asmd_material_id equals assign_stud.material_id into assign_data
                        from x in assign_data.DefaultIfEmpty()

                        where mapping.universityid == UniversityID && mapping.applicantid == UserID && mapping.status == 7 && date.asmd_material_id == x.material_id
                        select new details_study_material
                        {
                            application_masterID = mapping.id,
                            material_id = x.material_id,
                            study_material_name = x.material_name,
                            document = x.material_document,
                            document_link = x.material_link,
                            classid = mapping.classid,
                            classname = cls.classname,
                            Studymaterialstarttime = date.asmd_start_date,
                            Studymaterialendtime = date.asmd_stop_time,
                            subject_id = sub.id,
                            subject = sub.description,
                            grade_id = grd.id,
                            grade = grd.description,
                            timezone = cls.timezone,
                            remark = x.remarks,
                            material_type = x.material_type,
                            startdateutc = date.asmd_start_utc_date,
                            stopdateutc = date.asm_stop_utc_date,
                            toshow_material = "1",
                        }).OrderByDescending(x => x.material_id).ToList();

            foreach (var item in data)
            {
                DateTime? currentutc = DateTime.UtcNow;
                if (item.startdateutc <= currentutc && currentutc <= item.stopdateutc)
                    temp.Add(item);
                //item.toshow_material = "1";
            }
            data = temp;
            if (data.Any())
            {
                if (subjectID == 0)
                {
                    var subject = (from s in data select new { subject_id = s.subject_id, subject = s.subject }).OrderBy(s => s.subject_id).Distinct().ToList();
                    ddlsubject.DataSource = subject;
                    ddlsubject.DataTextField = "subject";
                    ddlsubject.DataValueField = "subject_id";
                    ddlsubject.DataBind();
                }
                if (material_id == 0)
                {
                    var study_material_name = (from s in data select new { material_id = s.material_id, study_material_name = s.study_material_name }).OrderBy(s => s.study_material_name).Distinct().ToList();
                    ddl_study.DataSource = study_material_name;
                    ddl_study.DataTextField = "study_material_name";
                    ddl_study.DataValueField = "material_id";
                    ddl_study.DataBind();
                }
                if (classid == 0)
                {
                    var classname = (from s in data select new { classid = s.classid, classname = s.classname }).OrderBy(s => s.classid).Distinct().ToList();
                    ddlclassname.DataSource = classname;
                    ddlclassname.DataTextField = "classname";
                    ddlclassname.DataValueField = "classid";
                    ddlclassname.DataBind();
                }
                if (gradeID == 0)
                {
                    var data_gr = (from s in data select new { grade_id = s.grade_id, grade = s.grade }).OrderBy(s => s.grade).Distinct().ToList();
                    ddlgrade.DataSource = data_gr;
                    ddlgrade.DataTextField = "grade";
                    ddlgrade.DataValueField = "grade_id";
                    ddlgrade.DataBind();
                }
            }
        }
    }
    private /*static*/ void bind_grid(int classid = 0, int gradeID = 0, int subjectID = 0, int material_id = 0)
    {
        GTEEntities db = new GTEEntities();
        Logger objLog = new Logger();
        int UniversityID = Utility.GetUniversityId();
        string webURL = Utility.GetWebUrl();

        int UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"].ToString());

        var data = db.ec_class_applicationmaster.Where(x => x.universityid == UniversityID && x.applicantid == UserID && x.status == 7).ToList();
        if (data.Count != 0)
        {
            List<details_study_material> temp = new List<details_study_material>();
            study_material_list = (from mapping in db.ec_class_applicationmaster

                                   join cm in db.ec_class_master on mapping.classid equals cm.id into classData
                                   from cls in classData.DefaultIfEmpty()

                                   join y in db.subjectmaster on cls.subjectid equals y.id into subjData
                                   from sub in subjData.DefaultIfEmpty()

                                   join gm in db.ec_grademaster on cls.gradeid equals gm.id into gradeData
                                   from grd in gradeData.DefaultIfEmpty()

                                   join a in db.ec_assign_study_material on mapping.classid equals a.asm_class_id into assign_schedule_data
                                   from asm_sch in assign_schedule_data.DefaultIfEmpty()

                                   join d in db.ec_assign_study_material_date_wise on asm_sch.asm_id equals d.asmd_asm_id into assign_schedule_date
                                   from date in assign_schedule_date.DefaultIfEmpty()

                                   join assign_stud in db.ec_study_material on date.asmd_material_id equals assign_stud.material_id into assign_data
                                   from x in assign_data.DefaultIfEmpty()

                                   where mapping.universityid == UniversityID && mapping.applicantid == UserID && mapping.status == 7 && date.asmd_material_id == x.material_id
                                   select new details_study_material
                                   {
                                       application_masterID = mapping.id,
                                       material_id = x.material_id,
                                       study_material_name = x.material_name,
                                       document = x.material_document,
                                       document_link = x.material_link,
                                       classid = mapping.classid,
                                       classname = cls.classname,
                                       Studymaterialstarttime = date.asmd_start_date,
                                       Studymaterialendtime = date.asmd_stop_time,
                                       subject_id = sub.id,
                                       subject = sub.description,
                                       grade_id = grd.id,
                                       grade = grd.description,
                                       timezone = cls.timezone,
                                       remark = x.remarks,
                                       material_type = x.material_type,
                                       startdateutc = date.asmd_start_utc_date,
                                       stopdateutc = date.asm_stop_utc_date,
                                       toshow_material = "1",
                                   }).OrderByDescending(x => x.material_id).ToList();

            foreach (var item in study_material_list)
            {

                DateTime? currentutc = DateTime.UtcNow;
                if (item.startdateutc <= currentutc && currentutc <= item.stopdateutc)
                    temp.Add(item);
                //item.toshow_material = "1";
            }
            study_material_list = temp;
            if (study_material_list.Any())
            {
                if (study_material_list != null)
                {
                    if (classid != 0 || gradeID != 0 || subjectID != 0 || material_id != 0)
                    {
                        // var filterlist = universitiesList;
                        if (classid != 0)
                        {
                            study_material_list = study_material_list.Where(x => x.classid == classid).ToList();
                            //ddlclassname.Items.FindByValue(classid.ToString()).Selected = true;
                        }
                        if (gradeID != 0)
                        {
                            study_material_list = study_material_list.Where(x => x.grade_id == gradeID).ToList();
                            //ddlgrade.Items.FindByValue(gradeID.ToString()).Selected = true;
                        }
                        if (subjectID != 0)
                        {
                            study_material_list = study_material_list.Where(x => x.subject_id == subjectID).ToList();
                            //ddlsubject.Items.FindByValue(subjectID.ToString()).Selected = true;
                        }
                        if (material_id != 0)
                        {
                            study_material_list = study_material_list.Where(x => x.material_id == material_id).ToList();
                            //ddl_study.Items.FindByValue(material_id.ToString()).Selected = true;
                        }

                    }

                }
            }
            else
            {
                div1_main.Attributes.Add("style", "display:none;");
                div_nodata.Attributes.Add("style", "display:block;");
            }
        }
        else
        {
            div1_main.Attributes.Add("style", "display:none;");
            div_nodata.Attributes.Add("style", "display:block;");

        }
    }

    public class details_study_material : ec_create_my_study_materials
    {
        public int application_masterID { get; set; }
        public string toshow_material { get; set; }
        public string study_material_name { get; set; }
        public int? classid { get; set; }
        public string classname { get; set; }
        public int material_id { get; set; }
        public int grade_id { get; set; }
        public string grade { get; set; }
        public string document { get; set; }
        public string document_link { get; set; }
        public string subject { get; set; }
        public int subject_id { get; set; }
        public DateTime? Studymaterialstarttime { get; set; }
        public DateTime? Studymaterialendtime { get; set; }
        public Nullable<int> material_type { get; set; }
        public string remark { get; set; }
        public string timezone { get; set; }
        public DateTime? startdateutc { get; set; }
        public DateTime? stopdateutc { get; set; }
        public string Get_Material_type
        {
            get
            {
                switch (material_type)
                {
                    case 1:
                        return "PDF";
                    case 2:
                        return "Audio";
                    case 3:
                        return "Presentation";
                    case 4:
                        return "Web Link";
                    case 5:
                        return "Video";
                    default:
                        return "";
                }
            }
        }

        public string Get_Material_type_wise_icons
        {
            get
            {
                switch (material_type)
                {
                    case 1:
                        return "fas fa-file - pdf";
                    case 2:
                        return "far fa-file - audio";
                    case 3:
                        return "fas fa-tv";
                    case 4:
                        return "fas fa-globe";
                    case 5:
                        return "fas fa-video";
                    default:
                        return "";
                }
            }
        }
        public string Get_Material_link
        {
            get
            {
                switch (material_type)
                {
                    case 1:
                        return webURL + "/Docs/Eclass_Service/studymaterial/" + document;
                    case 2:
                        return webURL + "/Docs/Eclass_Service/studymaterial/" + document;
                    case 3:
                        return webURL + "/Docs/Eclass_Service/studymaterial/" + document;
                    case 4:
                        return document_link;
                    case 5:
                        return document_link;
                    default:
                        return "";
                }
            }
        }
    }

    protected void ddl_study_SelectedIndexChanged(object sender, EventArgs e)
    {
        int material_id = Convert.ToInt32(ddl_study.SelectedValue);
        bind_grid(0, 0, 0, material_id);
    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        bind_grid(0, 0, subjectID);
    }

    protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        bind_grid(0, gradeID);
    }

    protected void ddlclassname_SelectedIndexChanged(object sender, EventArgs e)
    {
        int classID = Convert.ToInt32(ddlclassname.SelectedValue);
        bind_grid(classID);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Refresh_table(int assignid)
    {
        var temp = 0;
        //bind_grid();
        return JsonConvert.SerializeObject(temp);
    }
}