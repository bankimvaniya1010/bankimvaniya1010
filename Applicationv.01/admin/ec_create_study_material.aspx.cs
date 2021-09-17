using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_create_study_material : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminId = Convert.ToInt32(Session["UserID"].ToString());
        string name = db.adminusers.Where(x => x.adminid == adminId).Select(x => x.name).FirstOrDefault();
        txt_created_by.Text = name;
        if (!IsPostBack)
        {
            BindDropdowns();
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            ec_study_material objec_study_material_master = new ec_study_material();

            string check_dupli = txt_name.Text;
            var data = db.ec_study_material.Where(x => x.material_name == check_dupli).FirstOrDefault();
            if (data == null)
            {
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
                db.ec_study_material.Add(objec_study_material_master);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Record Inserted Successfully');window.location='" + Request.ApplicationPath + "admin/ec_manage_study_material.aspx';", true);

            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Study Material with entered name already exists')", true);

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
}