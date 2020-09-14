using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_create_exampaper : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();//string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            BindUniversity();
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }   

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {
            int selectuniversity = Convert.ToInt32(ddlUniversity.SelectedValue);
            string selectexamname = txtexamname.Value;
            exam_master objexam_master = new exam_master();

            var data = db.exam_master.Where(x => x.universityID == selectuniversity && x.exam_name == selectexamname).FirstOrDefault();
            if (data == null)
            {
                objexam_master.universityID = selectuniversity;
                objexam_master.exam_name = txtexamname.Value;
                objexam_master.exam_subject = txtsubject.Value;
                objexam_master.exam_grade = txtgrade.Value;
                objexam_master.exam_course = txtcourse.Value;
                objexam_master.exam_createddate = DateTime.Today.Date;
                objexam_master.exam_duration = txtExamtime.Value;
                objexam_master.created_by = txtexamcreatedby.Value;
                objexam_master.maximummarks = txtmaximummarks.Value;
                objexam_master.exam_instruction = txtinstrcution.Text.Trim();
                objexam_master.shortremarks = txtshotremarks.Value;
                db.exam_master.Add(objexam_master);
                db.SaveChanges();
                
                int exampapersid = objexam_master.exampapersid;
                docPath = docPath + "/Exammodule/" + selectuniversity + "/" + exampapersid;
                if (studentFileUpload.HasFile)
                {
                    string path = docPath + "/studentfile/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(studentFileUpload.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    studentFileUpload.PostedFile.SaveAs(filePath);
                    objexam_master.studentfilepath = fileName;
                }
                if (filecheckingguid.HasFile)
                {
                    string path = docPath + "/CheckingGuide/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(filecheckingguid.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    filecheckingguid.PostedFile.SaveAs(filePath);
                    objexam_master.checkingguidfilepath = fileName;
                }
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record Added Successfully');window.location='" + Request.ApplicationPath + "admin/upload_exampaper.aspx?exampapersid=" + exampapersid +"';", true);
               
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered exam paper already registered with selected institution.')", true);
        } catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

}