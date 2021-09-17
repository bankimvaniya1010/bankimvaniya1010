using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_edit_study_material : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    public static int selectedmaterialid, universityID, adminId;
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
        string name = db.adminusers.Where(x => x.adminid == adminId).Select(x => x.name).FirstOrDefault();
        txt_created_by.Text = name;
        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectedmaterialid = Convert.ToInt32(Request.QueryString["id"]);

        if (!IsPostBack)
        {
            BindDropdowns();
            populateData(selectedmaterialid);
        }
    }

    private void populateData(int material_stud_id)
    {
        try
        {

            var objec_study_material = db.ec_study_material.Where(x => x.material_id == material_stud_id).FirstOrDefault();

            txt_name.Text = objec_study_material.material_name.ToString();
            txt_remark.Text = objec_study_material.remarks;
            txt_created_by.Text = objec_study_material.created_by;

            if (objec_study_material.material_type != null)
            {
                ddl_type.ClearSelection();
                ddl_type.Items.FindByValue(objec_study_material.material_type.ToString()).Selected = true;
            }
            BindDropdowns();
            if (objec_study_material.material_grade != null)
            {
                list_grade.ClearSelection();
                string[] grd_ids = objec_study_material.material_grade.Split(',');
                for (int i = 0; i < grd_ids.Length; i++)
                {
                    list_grade.Items.FindByValue(grd_ids[i]).Selected = true;
                }
            }

            if (objec_study_material.material_subject != null)
            {
                list_suject.ClearSelection();
                string[] subject_ids = objec_study_material.material_subject.Split(',');
                for (int i = 0; i < subject_ids.Length; i++)
                {
                    list_suject.Items.FindByValue(subject_ids[i]).Selected = true;
                }
            }
            if(objec_study_material.material_type ==1 || objec_study_material.material_type == 2 || objec_study_material.material_type == 3)
            {
                if (objec_study_material.material_document != null)
                {
                    classuloadfile.Visible = true;
                    Hidmaterial.Value = objec_study_material.material_document;
                    materiallink.NavigateUrl = webURL + "/Docs/Eclass_Service/class/" + objec_study_material.material_document;
                    materiallink.Text = "View File";
                }
            }
            else
            {
                if (objec_study_material.material_link != null)
                {
                    classwebpageURL.Visible = true;
                    txt_link.Text = objec_study_material.material_link;
                } 
            }
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

            var grade = db.ec_grademaster.ToList();
            list_grade.DataSource = grade;
            list_grade.DataTextField = "description";
            list_grade.DataValueField = "id";
            list_grade.DataBind();

            var subject = db.subjectmaster.ToList();
            list_suject.DataSource = subject;
            list_suject.DataTextField = "description";
            list_suject.DataValueField = "id";
            list_suject.DataBind();

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            ec_study_material objec_study_material_master = new ec_study_material();

            var data = db.ec_study_material.Where(x => x.material_id == selectedmaterialid).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objec_study_material_master = data;
            }
            objec_study_material_master.material_name = txt_name.Text;
            if (ddl_type.SelectedValue != "0")
                objec_study_material_master.material_type = Convert.ToInt32(ddl_type.SelectedValue);
            if (ddl_type.SelectedValue == "1" || ddl_type.SelectedValue == "2" || ddl_type.SelectedValue == "3")
            {
                if (materialfile.HasFile)
                {
                    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                    docPath = docPath + "/Eclass_Service/studymaterial/";
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(materialfile.PostedFile.FileName);
                    string filename = Guid.NewGuid() + extension;

                    if (File.Exists(docPath + filename))
                    {
                        File.Delete(docPath + filename);
                    }

                    materialfile.PostedFile.SaveAs(docPath + filename);
                    objec_study_material_master.material_document = filename;

                }
            }
            else if (ddl_type.SelectedValue == "4" || ddl_type.SelectedValue == "5")
            {
                objec_study_material_master.material_link = txt_link.Text;
            }
            string grade_comma = "";
            for (int i = 0; i < list_grade.Items.Count; i++)
            {
                if (list_grade.Items[i].Selected == true)
                {
                    grade_comma += Convert.ToString(list_grade.Items[i].Value) + ',';
                }
            }
            objec_study_material_master.material_grade = grade_comma.Substring(0, grade_comma.Length - 1);

            string subject_comma = "";
            for (int i = 0; i < list_suject.Items.Count; i++)
            {
                if (list_suject.Items[i].Selected == true)
                {
                    subject_comma += Convert.ToString(list_suject.Items[i].Value) + ',';
                }
            }
            objec_study_material_master.material_subject = subject_comma.Substring(0, subject_comma.Length - 1);
            objec_study_material_master.remarks = txt_remark.Text;
            objec_study_material_master.created_by = txt_created_by.Text;
            objec_study_material_master.universityid = universityID;
            if (mode == "new")
                db.ec_study_material.Add(objec_study_material_master);
            db.SaveChanges();

            int study_mat_id = objec_study_material_master.material_id;
            db.SaveChanges();
            //dates
            //string[] facilitiesList = hidFacilities.Value.Split(';');
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + "admin/ec_manage_study_material.aspx';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}