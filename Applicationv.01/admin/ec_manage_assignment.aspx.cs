using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_manage_assignment : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;

    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public List<details> applicant = new List<details>();
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
            applicant = (from om in db.ec_assignment_master
                        join um in db.university_master on om.universityid equals um.universityid
                        select new details()
                        {
                            id = om.id,
                            assignment_name = om.assignment_name,
                            university_name = um.university_name,
                            assignment_type = om.assignment_type== 1? "Build Assignment": "Upload File",
                            checkingguide_url= webURL+ "Docs/Eclass_Service/Assignments/"+om.checkingguide,
                            userdownload_url = webURL + "Docs/Eclass_Service/Assignments/" + om.userfile,
                            grade = om.gradeid,
                            subject = om.subjectid,
                            Is_inUSe="No",
                        }).ToList();
            foreach (var item in applicant)
            {

                var inused = db.ec_assignments_assign.Where(x => x.assignmentId == item.id).FirstOrDefault();
                if (inused != null)
                    item.Is_inUSe = "In Use";
            }

            QuestiontGridView.DataSource = applicant;
            QuestiontGridView.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_create_assignment.aspx", true);
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("Edit"))
            {
                Response.Redirect(webURL + "admin/ec_create_assignment.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("Upload"))
            {
                var data = db.ec_assignment_master.Where(b => b.id == ID).FirstOrDefault();
                if (data.assignment_type == 1)
                    Response.Redirect(webURL + "admin/ec_build_assignment.aspx?id=" + ID, true);
                else
                    Response.Redirect(webURL + "admin/ec_upload_exampaper.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("Delete"))
            {
                var is_assignment_schedule = db.ec_assignments_assign.Where(x => x.assignmentId == ID).ToList();

                if (is_assignment_schedule.Count == 0)
                {
                    ec_assignment_master em = db.ec_assignment_master.Where(b => b.id == ID).First();
                    db.ec_assignment_master.Remove(em);
                    db.SaveChanges();
                    BindGrid();
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('You can not delete this record ');window.location='" + Request.ApplicationPath + "ec_manage_assignment.aspx;", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected DataTable BindDatatable()
    {
        BindGrid();
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Institution Name", typeof(string)).ToString();
        dt.Columns.Add("Assignment Name", typeof(string));
        dt.Columns.Add("Assignment Type", typeof(string));
        dt.Columns.Add("Grade", typeof(string));
        dt.Columns.Add("Subject", typeof(string));
        dt.Columns.Add("Created By", typeof(string));
        dt.Columns.Add("Remark", typeof(string));

        //to print rows
        if (applicant != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var study_material = applicant[i];
                string grade = study_material.grade;
                string sujbect = study_material.subject;
                string[] grade_list = grade.Split(',');
                string[] subject_list = grade.Split(',');
                string grade_name_comma_sep = "";
                string subject_name_comma_sep = "";
                for (int j = 0; j < grade_list.Length; j++)
                {
                    int list_id = Convert.ToInt32(grade_list[j]);
                    string grade_name = db.ec_grademaster.Where(x => x.id == list_id).Select(x => x.description).FirstOrDefault();
                    grade_name_comma_sep += grade_name + ",";
                }
                string grade_excel_name = grade_name_comma_sep.Substring(0, grade_name_comma_sep.Length - 1);

                for (int n = 0; n < subject_list.Length; n++)
                {
                    int list_id_for_subject = Convert.ToInt32(grade_list[n]);
                    string subject_name = db.subjectmaster.Where(x => x.id == list_id_for_subject).Select(x => x.description).FirstOrDefault();
                    subject_name_comma_sep += subject_name + ",";
                }
                string subject_excel_name = subject_name_comma_sep.Substring(0, subject_name_comma_sep.Length - 1);

                dt.Rows.Add(study_material.university_name, study_material.assignment_name, study_material.assignment_type, grade_excel_name, subject_excel_name, study_material.created_by, study_material.remarks);
                rowNumber++;
            }
        }
        return dt;
    }

    protected void btn_dmload_Click(object sender, EventArgs e)
    {
        try
        {
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.Buffer = true;
            //HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "StudymaterialList.xls"));
            //HttpContext.Current.Response.ContentType = "application/ms-excel";

            HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");

            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Assignment_Reports.xls");

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
                //HttpContext.Current.Response.Write(str +  dtcol.ColumnName);
                //DataRow row = dt.NewRow();
                //str = "\t";
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
    public class details : admin_ec_manage_assignment
    {
        public int id { get; set; }
        public string assignment_name { get; set; }
        public string assignment_type { get; set; }
        public string grade { get; set; }
        public string subject { get; set; }
        public string university_name { get; set; }
        public string remarks { get; set; }
        public string created_by { get; set; }
        public string checkingguide_url { get; set; }
        public string userdownload_url { get; set; }
        public string Is_inUSe { get; set; }
    }

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lblIsClassInUse = (Label)e.Row.FindControl("lblIsClassInUse");
                LinkButton lnkDelete = ((LinkButton)e.Row.FindControl("lnkDelete"));

                if (lblIsClassInUse.Text == "In Use")
                {
                    lnkDelete.Attributes.Add("style", "display:none");
                    lblIsClassInUse.Attributes.Add("style", "display:block");
                }
                else
                {
                    lnkDelete.Attributes.Add("style", "display:block");
                    lblIsClassInUse.Attributes.Add("style", "display:none");
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}
