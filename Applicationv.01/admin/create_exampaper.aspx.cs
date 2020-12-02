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
    int UserID, selectedexaminerId, selectuniversity, adminId;
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

        if ((Request.QueryString["universityid"] == null) || (Request.QueryString["universityid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectuniversity = Convert.ToInt32(Request.QueryString["universityid"]);

        if ((Request.QueryString["examinerid"] == null) || (Request.QueryString["examinerid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectedexaminerId = Convert.ToInt32(Request.QueryString["examinerid"]);

        if (!IsPostBack)
        {
            var loggedin_username = db.adminusers.Where(x => x.adminid == adminId).Select(x => x.username).FirstOrDefault();
            txtexamcreatedby.Value = loggedin_username;

            Bind_Class(selectuniversity);
            Bind_Group(selectuniversity);
            Bind_Subject(selectuniversity);
        }
    }
    public void Bind_Subject(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.exam_subjectmaster
                         join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                         where cwm.universityID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlsubject.DataSource = group;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void Bind_Group(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.group_master
                         join cwm in db.institutionwisegroupmaster on ap.id equals cwm.groupId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlgroup.DataSource = group;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void Bind_Class(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlclass.DataSource = Class;
            ddlclass.DataTextField = "description";
            ddlclass.DataValueField = "id";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {           
            string selectexamname = txtexamname.Value;           
            exam_master objexam_master = new exam_master();
            var data = db.exam_master.Where(x => x.universityID == selectuniversity && x.exam_name == selectexamname && x.examinerId == selectedexaminerId).FirstOrDefault();
            if (data == null)
            {
                objexam_master.universityID = selectuniversity;
                objexam_master.examinerId = selectedexaminerId;
                objexam_master.exam_name = txtexamname.Value;
                objexam_master.exam_subject = ddlsubject.SelectedValue;
               // objexam_master.exam_grade = txtgrade.Value;
                //objexam_master.exam_course = txtcourse.Value;
                objexam_master.exam_createddate = DateTime.Today.Date;
                objexam_master.exam_duration = txtExamtime.Value;
                objexam_master.exam_readingduration = txtreadingtime.Value;
                objexam_master.exam_uploadduration = txtuploadtime.Value;
                objexam_master.created_by = txtexamcreatedby.Value;
                objexam_master.maximummarks = txtmaximummarks.Value;
                objexam_master.exam_instruction = txtinstrcution.Text.Trim();
                objexam_master.shortremarks = txtshotremarks.Text;
                objexam_master.classid = Convert.ToInt32(ddlclass.SelectedValue);
                objexam_master.groupid = Convert.ToInt32(ddlgroup.SelectedValue);
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
                if (Radio1.Checked == true)
                    objexam_master.isautomaticstart = 1;
                else if(Radio2.Checked == true)
                    objexam_master.isautomaticstart = 0;

                if (rbupload.Checked == true)
                    objexam_master.uploadtype = 1;
                else if (rbbuild.Checked == true)
                {
                    objexam_master.uploadtype = 2;
                    if (rblfixed.Checked == true)
                        objexam_master.basic_setting = 1;
                    else if (rblrandom.Checked == true)
                        objexam_master.basic_setting = 2;
                }
                else if (rbnew.Checked == true)
                {
                    objexam_master.uploadtype = 3;
                    if (rbYes.Checked == true)
                        objexam_master.download_permission = 1;
                    else if (rbNo.Checked == true)
                        objexam_master.download_permission = 2;
                }
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record added successfully');window.location='" + Request.ApplicationPath + "admin/upload_exampaper.aspx?exampapersid=" + exampapersid+"';", true); 
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered assessment paper already registered with selected institution.')", true);
        } catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}