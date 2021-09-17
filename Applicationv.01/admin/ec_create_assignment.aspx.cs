using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_create_assignment : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, mcqID = 0, adminId;
    ec_assignment_master objmapping = new ec_assignment_master();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();

        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminId = Convert.ToInt32(Session["UserID"]);


        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            mcqID = -1;
            if (int.TryParse(Request.QueryString["id"], out mcqID))
            {
                objmapping = db.ec_assignment_master.Where(obj => obj.id == mcqID).FirstOrDefault();
                if (objmapping == null)
                    mcqID = -1;
            }
        }

        if (!IsPostBack)
        {
            BindDropdown();
            if (objmapping != null)
                popuate(mcqID);
        }
    }
    private void BindDropdown() {
        try {
            
            var data = db.subjectmaster.ToList();
            lstsubject.DataSource = data;
            lstsubject.DataTextField = "description";
            lstsubject.DataValueField = "id";
            lstsubject.DataBind();
            

            var grade = db.ec_grademaster.ToList();
            lstgrade.DataSource = grade;
            lstgrade.DataTextField = "description";
            lstgrade.DataValueField = "id";
            lstgrade.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void popuate(int mcqID)
    {
        try
        {
            var data = db.ec_assignment_master.Where(x => x.id == mcqID).FirstOrDefault();
            if (data != null)
            {
                txtassignmentname.Value = data.assignment_name;
                if (data.assignment_type == 1)
                {
                    rblbuild.Checked = true;
                    if (data.question_order_settings == 1)
                        rblfixed.Checked = true;
                    else if (data.question_order_settings == 2)
                        rblrandom.Checked = true;

                    if (data.allowusertodownload == 1)
                        rblyes.Checked = true;
                    else if (data.allowusertodownload == 2)
                        rblNo.Checked = true;
                }
                else if (data.assignment_type == 2)
                    rbluploadfile.Checked = true;

                if (data.gradeid != null)
                {
                    lstgrade.ClearSelection();
                    string[] grd_ids = data.gradeid.Split(',');
                    for (int i = 0; i < grd_ids.Length; i++)
                    {
                        lstgrade.Items.FindByValue(grd_ids[i]).Selected = true;
                    }
                }

                if (data.subjectid!= null)
                {
                    lstsubject.ClearSelection();
                    string[] grd_ids = data.subjectid.Split(',');
                    for (int i = 0; i < grd_ids.Length; i++)
                    {
                        lstsubject.Items.FindByValue(grd_ids[i]).Selected = true;
                    }
                }
                                
                string docPath = webURL + "Docs/Eclass_Service/Assignments/";

                if (data.checkingguide != null)
                {
                    hidfile_upload.Value = data.checkingguide;
                    file_uploadLink.NavigateUrl = docPath + data.checkingguide;
                    file_uploadLink.Text = "View File";
                }
                
                if (data.userfile != null)
                {
                    hidfile_userfile.Value = data.userfile;
                    file_userfilelink.NavigateUrl = docPath + data.userfile;
                    file_userfilelink.Text = "View File";
                }

                txtremarks.Value = objmapping.remarks;

                if (data.self_check == 1)
                    rblselfcheck_yes.Checked = true;
                else if (data.self_check == 2)
                    rblselfcheck_no.Checked = true;
            }
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
            if (mcqID != -1)
            {
                var data = db.ec_assignment_master.Where(x => x.id == mcqID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objmapping = data;
                }
            }
            
            objmapping.assignment_name = txtassignmentname.Value;

            if (rblbuild.Checked == true)
            {
                objmapping.assignment_type = 1;

                if (rblfixed.Checked == true)
                    objmapping.question_order_settings = 1;
                else if (rblrandom.Checked == true)
                    objmapping.question_order_settings = 2;

                if (rblyes.Checked == true)
                    objmapping.allowusertodownload = 1;
                else if (rblNo.Checked == true)
                    objmapping.allowusertodownload = 2;
            }
            else if (rbluploadfile.Checked == true)
                objmapping.assignment_type = 2;

            string grade_comma = "";
            for (int i = 0; i < lstgrade.Items.Count; i++)
            {
                if (lstgrade.Items[i].Selected == true)
                {
                    grade_comma += Convert.ToString(lstgrade.Items[i].Value) + ',';
                }
            }
            objmapping.gradeid = grade_comma.Substring(0, grade_comma.Length - 1);


            string subject_comma = "";
            for (int i = 0; i < lstsubject.Items.Count; i++)
            {
                if (lstsubject.Items[i].Selected == true)
                {
                    subject_comma += Convert.ToString(lstsubject.Items[i].Value) + ',';
                }
            }
            objmapping.subjectid = subject_comma.Substring(0, subject_comma.Length - 1);
            
            string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            docPath = docPath + "/Eclass_Service/Assignments/";
            if (file_guide.HasFile)
            {
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(file_guide.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;

                if (File.Exists(docPath + filename))
                {
                    File.Delete(docPath + filename);
                }

                file_guide.PostedFile.SaveAs(docPath + filename);
                objmapping.checkingguide = filename;

            }
            if (file_userfile.HasFile)
            {
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(file_userfile.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;

                if (File.Exists(docPath + filename))
                {
                    File.Delete(docPath + filename);
                }

                file_userfile.PostedFile.SaveAs(docPath + filename);
                objmapping.userfile = filename;

            }
            objmapping.remarks = txtremarks.Value;

            if (rblselfcheck_yes.Checked)
                objmapping.self_check = 1;
            else if (rblselfcheck_no.Checked)
                objmapping.self_check = 2;

            objmapping.created_by = adminId;
            objmapping.universityid = universityID;
            if (mode == "new")
                db.ec_assignment_master.Add(objmapping);
            db.SaveChanges();
            if (mode == "new")
                mcqID = objmapping.id;

            var pageURl = "admin/default.aspx";
            if (objmapping.assignment_type == 1)
                pageURl = "admin/ec_build_assignment.aspx?id=" + mcqID;
            else
                pageURl="admin/ec_upload_exampaper.aspx?id=" + mcqID;
            if (mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record added successfully. Now upload assignment');window.location='" + Request.ApplicationPath + ""+pageURl+"';", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + ""+pageURl+"';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}