using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_ec_assignment_scheduleassign_master : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;
    public string documentlink, wrb_nink;
    public List<assign_manage_study_material_details> applicant = new List<assign_manage_study_material_details>();
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
            BindGrid();
        }
    }

    private void BindGrid()
    {
        try
        {
            applicant = (from asm in db.ec_assignments_assignschedule_master
                         join cm in db.ec_class_master on asm.asm_class_id equals cm.id
                         join gm in db.ec_grademaster on asm.asm_grade_id equals gm.id
                         join sm in db.subjectmaster on asm.asm_subject_id equals sm.id
                         where asm.asm_universityid == universityID
                         select new assign_manage_study_material_details
                         {
                             asm_id = asm.asm_id,
                             class_name = cm.classname,
                             class_code = cm.id,
                             //class_start_date = start_date.class_startdate,
                             asm_grade_name = gm.description,
                             asm_subject_name = sm.description,
                         }).OrderByDescending(x=>x.asm_id).ToList();
            //applicant.ForEach(p => p.startdate_str = Convert.ToDateTime(p.class_start_date).ToString("dd/MM/yyyy"));
            if (applicant != null)
            {
                grd_assign_manage_studymaterial.DataSource = applicant;
                grd_assign_manage_studymaterial.DataBind();

            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public class assign_manage_study_material_details : admin_ec_assignment_scheduleassign_master
    {
        public int asm_id { get; set; }
        public int asm_universityid { get; set; }
        public string asm_material_name { get; set; }
        public string asm_grade_name { get; set; }
        public string asm_subject_name { get; set; }
        public string asm_study_material { get; set; }
        public string asm_time_zone { get; set; }
        public Nullable<int> class_code { get; set; }
        public Nullable<DateTime> class_start_date { get; set; }
        public string startdate_str { get; set; }
        public string class_name { get; set; }
    }
    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_assignment_scheduleassign_create.aspx", true);
    }

    protected void btn_downloadexcel_Click(object sender, EventArgs e)
    {
        try
        {
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            //HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "StudymaterialList.xls"));
            //HttpContext.Current.Response.ContentType = "application/ms-excel";

            HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");

            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=List_All_Assignment_Schedules_Assignees.xls");

            HttpContext.Current.Response.Charset = "utf-8";

            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("windows-1250");

            //sets font

            HttpContext.Current.Response.Write("<font style='font-size:10.0pt; font-family:Calibri;'>");

            HttpContext.Current.Response.Write("<BR><BR><BR>");

            HttpContext.Current.Response.Write("<Table border='1' bgColor='#ffffff' borderColor='#000000' cellSpacing='0' cellPadding='0' style='font-size:10.0pt; font-family:Calibri; background:white;'> <TR>");

            DataTable dt = BindDatatable();
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

    protected DataTable BindDatatable()
    {
        BindGrid();
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Class Code", typeof(string)).ToString();
        dt.Columns.Add("Class Name", typeof(string));
        dt.Columns.Add("Grade", typeof(string));
        dt.Columns.Add("Subject", typeof(string));
        dt.Columns.Add("Start Date", typeof(string));

        //to print rows
        if (applicant != null && applicant.Count != 0)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var assign_study_material = applicant[i];
                dt.Rows.Add(assign_study_material.class_code, assign_study_material.class_name, assign_study_material.asm_grade_name, assign_study_material.asm_subject_name, assign_study_material.startdate_str);
                rowNumber++;
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Not Found');", false);
        }
        return dt;
    }

    protected void grd_assign_manage_studymaterial_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_assign_manage_studymaterial.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void grd_assign_manage_studymaterial_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void grd_assign_manage_studymaterial_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("Delete"))
            {
                var is_assignment_answered_by_applicant = db.ec_assignments_assign.Where(x => x.assignschedule_Id == ID && x.Is_assignemtCompleted == 1).ToList();
                if (is_assignment_answered_by_applicant.Count == 0)
                {
                    var temp = db.ec_assignments_assign.Where(x => x.assignschedule_Id == ID).ToList();
                    foreach (var item in temp)
                    {
                        db.ec_assignments_assign.Remove(item);
                        db.SaveChanges();
                    }

                    ec_assignments_assignschedule_master asm = db.ec_assignments_assignschedule_master.Where(b => b.asm_id == ID).First();
                    db.ec_assignments_assignschedule_master.Remove(asm);
                    db.SaveChanges();

                    BindGrid();
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You can not delete this record')", true);
            }
            if (e.CommandName.Equals("Edit"))
            {
                Response.Redirect(webURL + "admin/ec_assignment_scheduleassign_edit.aspx?id=" + ID, true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grd_assign_manage_studymaterial_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
}