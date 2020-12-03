using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edit_exampaper : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, selectedexamID, selectedexaminerId;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        //adminId = Convert.ToInt32(Session["UserID"]);
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectedexamID = Convert.ToInt32(Request.QueryString["id"]);

        var data = db.exam_master.Where(x => x.exampapersid == selectedexamID).Select(x=> new { x.universityID, x.examinerId}).FirstOrDefault();
        selectedexaminerId = data.examinerId;
        universityID = data.universityID;
        if (!IsPostBack)
        {
            Bind_Class(universityID);
            Bind_Group(universityID);
            Bind_Subject(universityID);
            populateInfo();
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

    private void populateInfo() {
        try {
            var existingDetails = db.exam_master.Where(x => x.exampapersid == selectedexamID).FirstOrDefault();
            if (existingDetails != null) {

                txtexamname.Value = existingDetails.exam_name;
                //txtcourse.Value = existingDetails.exam_course;
                if (existingDetails.classid != null)
                {
                    ddlclass.ClearSelection();
                    ddlclass.Items.FindByValue(existingDetails.classid.ToString()).Selected = true;
                }
                if (existingDetails.groupid != null)
                {
                    ddlgroup.ClearSelection();
                    ddlgroup.Items.FindByValue(existingDetails.groupid.ToString()).Selected = true;
                }
                if (existingDetails.exam_subject != null)
                {
                    ddlsubject.ClearSelection();
                    ddlsubject.Items.FindByValue(existingDetails.exam_subject.ToString()).Selected = true;
                }
                //txtsubject.Value = existingDetails.exam_subject;
                txtexamcreatedby.Value = existingDetails.created_by;
                txtExamtime.Value = existingDetails.exam_duration;
                txtreadingtime.Value = existingDetails.exam_readingduration;
                txtuploadtime.Value = existingDetails.exam_uploadduration;

                 txtmaximummarks.Value = existingDetails.maximummarks;
                txtinstrcution.Text = existingDetails.exam_instruction;
                txtshotremarks.Text = existingDetails.shortremarks;
                if (existingDetails.studentfilepath != null)
                {
                    hidpath.Value = existingDetails.studentfilepath;
                    studentFileUploadLink.NavigateUrl = webURL + "/Docs/Exammodule/" + universityID + "/" + "/" + selectedexamID+ "/studentfile/" +existingDetails.studentfilepath;
                    studentFileUploadLink.Text = "View File";
                }
                if (existingDetails.checkingguidfilepath != null)
                {
                    hidcheckingguidfilepathpath.Value = existingDetails.checkingguidfilepath;
                    checkingguidfilepathLink.NavigateUrl = webURL + "/Docs/Exammodule/" + universityID + "/" + "/" + selectedexamID + "/CheckingGuide/" + existingDetails.checkingguidfilepath;
                    checkingguidfilepathLink.Text = "View File";
                }
                if (existingDetails.isautomaticstart == 1)
                    Radio1.Checked = true;
                else if (existingDetails.isautomaticstart == 0)
                    Radio2.Checked = true;
                if (existingDetails.uploadtype == 1)
                    rbupload.Checked = true;
                else if (existingDetails.uploadtype == 2)
                    rbbuild.Checked = true;
                else if (existingDetails.uploadtype == 3)
                {
                    rbnew.Checked = true;
                    if (existingDetails.download_permission == 1)
                        rbYes.Checked = true;
                    else if (existingDetails.download_permission == 2)
                        rbNo.Checked = true;
                }

                if (existingDetails.basic_setting == 1)
                    rblfixed.Checked = true;
                else if (existingDetails.basic_setting == 2)
                    rblrandom.Checked = true;

            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Assessment does not exists')", true);

        } catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        
        try
        {
            exam_master objexam_master = new exam_master();
            var mode = "new";
            var exam_master = db.exam_master.Where(x => x.exampapersid == selectedexamID).First();
            if (exam_master != null)
            {
                mode = "update";
                objexam_master = exam_master;
            }
            objexam_master.universityID = universityID;
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
            if (mode == "new")
                db.exam_master.Add(objexam_master);
            db.SaveChanges();

            docPath = docPath + "/Exammodule/" + universityID + "/" + selectedexamID;
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
            else if (Radio2.Checked == true)
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
                "alert('Record updated successfully');window.location='" + Request.ApplicationPath + "admin/upload_exampaper.aspx?exampapersid=" + selectedexamID + "';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}