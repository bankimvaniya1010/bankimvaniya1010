using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_manage_study_material : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;
    public string documentlink, wrb_nink;
    public List<details> applicant = new List<details>();
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

    public class details : admin_ec_manage_study_material
    {
        public int material_id { get; set; }
        public string material_In_Use{ get; set; }
        public string universityid { get; set; }
        public string material_name { get; set; }
        public Nullable<int> material_type { get; set; }
        public string Get_Material_Name
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

        public string Get_Material_link
        {
            get
            {
                switch (material_type)
                {
                    case 1:
                        return webURL + "/Docs/Eclass_Service/studymaterial/" + material_document;
                    case 2:
                        return webURL + "/Docs/Eclass_Service/studymaterial/" + material_document;
                    case 3:
                        return webURL + "/Docs/Eclass_Service/studymaterial/" + material_document;
                    case 4:
                        return material_link;
                    case 5:
                        return material_link;
                    default:
                        return "";
                }
            }
        }

        public string material_document { get; set; }
        public string material_link { get; set; }
        public string material_grade { get; set; }
        public string material_subject { get; set; }
        public string remarks { get; set; }
        public string created_by { get; set; }
    }

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_create_study_material.aspx", true);
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

            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=Reports.xls");

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

    private void BindGrid(int material_id = 0)
    {
        try
        {
            applicant = (from stm in db.ec_study_material
                         join um in db.university_master on stm.universityid equals um.universityid
                         // join gm in db.grademaster on stm.material_grade equals gm.description
                         where stm.universityid == universityID
                         select new details
                         {
                             material_id = stm.material_id,
                             material_name = stm.material_name,
                             universityid = um.university_name,
                             material_type = stm.material_type,
                             material_link = stm.material_link,
                             material_grade = stm.material_grade,
                             material_subject = stm.material_subject,
                             material_document = stm.material_document,
                             remarks = stm.remarks,
                             created_by = stm.created_by,
                             material_In_Use="NO",
                         }).ToList();
            foreach (var item in applicant)
            {
                string id = item.material_id.ToString();
                var ec_assign_study_material = db.ec_assign_study_material.Where(x => x.asm_study_material.Contains(id)).FirstOrDefault();
                if (ec_assign_study_material != null)
                    item.material_In_Use = "In Use";
            }

            if (applicant != null)
            {
                //if (material_id != 0)
                //{
                //    applicant = applicant.Where(x => x.material_id == material_id).ToList();
                //}

                grd_study_material.DataSource = applicant;
                grd_study_material.DataBind();

            }

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
        dt.Columns.Add("Institution Name", typeof(string)).ToString();
        dt.Columns.Add("Study Material Name", typeof(string));
        dt.Columns.Add("Study Material Type", typeof(string));
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
                string grade = study_material.material_grade;
                string sujbect = study_material.material_subject;
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
                dt.Rows.Add(study_material.universityid, study_material.material_name, study_material.Get_Material_Name, grade_excel_name, subject_excel_name, study_material.created_by, study_material.remarks);
                rowNumber++;
            }
        }
        return dt;
    }

    protected void grd_study_material_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_study_material.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void grd_study_material_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void grd_study_material_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("Delete"))
            {
                ec_study_material sm = db.ec_study_material.Where(b => b.material_id == ID).First();
                db.ec_study_material.Remove(sm);
                db.SaveChanges();
                BindGrid();
            }
            if (e.CommandName.Equals("Edit"))
            {
                Response.Redirect(webURL + "admin/ec_edit_study_material.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("View"))
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = grd_study_material.Rows[rowIndex];

                //Fetch value of Name.
                string name = (row.FindControl("lnk_view") as LinkButton).Text;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grd_study_material_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void grd_study_material_RowDataBound(object sender, GridViewRowEventArgs e)
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