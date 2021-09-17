using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_uploadanswer_create : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID,adminID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    int recordID;
    ec_uploadanswer_master objmapping = new ec_uploadanswer_master();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();

        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        adminID= Convert.ToInt32(Session["UserID"].ToString());
        universityID = Utility.GetUniversityId();

        docPath = docPath + "/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminID;

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            recordID = -1;
            if (int.TryParse(Request.QueryString["id"], out recordID))
            {
                objmapping = db.ec_uploadanswer_master.Where(obj => obj.questionid == recordID).FirstOrDefault();
                if (objmapping == null)
                    recordID = -1;
            }
        }

        if (!IsPostBack)
        {
            BindDropdown();
            if (objmapping != null)
                populate();
        }
    }
    private void populate() {
        try
        {
            var data = db.ec_uploadanswer_master.Where(x => x.questionid == recordID).FirstOrDefault();
            if (data != null)
            {
                if (data.gradeid != null)
                {
                    ddlgrade.ClearSelection();
                    ddlgrade.Items.FindByValue(data.gradeid.ToString()).Selected = true;
                }

                if (data.subjectid != null)
                {
                    ddlsubject.ClearSelection();
                    ddlsubject.Items.FindByValue(data.subjectid.ToString()).Selected = true;
                }
                txtquestiondescription.Text= data.questiondescription;

                if (data.checking_file != null)
                {
                    uploadcheckingfile_Link.NavigateUrl = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + data.univesityid + "/" + data.adminid + "/evalutionfile/" + data.checking_file;
                    uploadcheckingfile_Link.Text = "view File";
                    Hid_uploadcheckingfile.Value = data.checking_file;
                }
                if (data.questionpath != null)
                {
                    FileUpload_Link.NavigateUrl = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + data.univesityid + "/" + data.adminid + "/" + data.questionpath;
                    FileUpload_Link.Text = "view File";
                    Hid_FileUpload.Value = data.questionpath;
                }
                if (data.extrasheetpath != null)
                {
                    extrasheet_FileUpload_link.NavigateUrl = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + data.univesityid + "/" + data.adminid + "/ExtraSheet/" + data.extrasheetpath;
                    extrasheet_FileUpload_link.Text = "view File";
                    Hid_extrasheet_FileUpload.Value = data.extrasheetpath;
                }

                if (data.extrafilepath != null) {
                    audiofile_FileUpload_Link.NavigateUrl =webURL+ "Docs/Eclass_Service/QuestionBank/upload_answer_master/"+data.univesityid+"/"+data.adminid+ "/AnyFile/" + data.extrafilepath;
                    audiofile_FileUpload_Link.Text = "view File";
                    Hid_audiofile_FileUpload.Value = data.extrafilepath;
                }
                if (data.extrafilepath != null)
                {
                    audiofile_FileUpload_Link.NavigateUrl = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + data.univesityid + "/" + data.adminid + "/AnyFile/" + data.extrafilepath;
                    audiofile_FileUpload_Link.Text = "view File";
                    Hid_audiofile_FileUpload.Value = data.extrafilepath;
                }
                if (data.ischeckonce == 1)
                    chkview.Checked = true;

                txtfileinstruction.Text = data.fileinstruction;
                txtmarks.Value = data.marks;
                txttime.Value = data.duration;
                if (data.question_for == 1)
                    rbl1.Checked = true;
                else if (data.question_for == 2)
                    rbl2.Checked = true;
                else if (data.question_for == 3)
                    rbl3.Checked = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
   
    protected void btnupload_Click1(object sender, EventArgs e)
    {
        try
        {
            
            var mode = "new";
            if (recordID != -1)
            {
                var data = db.ec_uploadanswer_master.Where(x => x.questionid == recordID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objmapping = data;
                }
            }
            if (ddlgrade.SelectedValue != null)
                objmapping.gradeid = Convert.ToInt32(ddlgrade.SelectedValue);
            if (ddlsubject.SelectedValue != null)
                objmapping.subjectid = Convert.ToInt32(ddlsubject.SelectedValue);

            if (FileUpload.HasFiles)
            {
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(FileUpload.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                FileUpload.PostedFile.SaveAs(System.IO.Path.Combine(docPath, filename));

                objmapping.questionpath = filename;
            }
            if (extrasheet_FileUpload.HasFile)
            {
                string path = docPath + "/ExtraSheet/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(extrasheet_FileUpload.PostedFile.FileName));
                string filePath = string.Concat(path, fileName);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                extrasheet_FileUpload.PostedFile.SaveAs(filePath);
                objmapping.extrasheetpath = fileName;
            }
            if (audiofile_FileUpload.HasFile)
            {
                string path1 = docPath + "/AnyFile/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(audiofile_FileUpload.PostedFile.FileName));
                string filePath = string.Concat(path1, fileName);
                if (!Directory.Exists(path1))
                    Directory.CreateDirectory(path1);
                audiofile_FileUpload.PostedFile.SaveAs(filePath);
                objmapping.extrafilepath = fileName;
            }
            if (uploadcheckingfile.HasFiles)
            {
                string path2 = docPath + "/evalutionfile/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(uploadcheckingfile.PostedFile.FileName));
                string filePath = string.Concat(path2, fileName);
                if (!Directory.Exists(path2))
                    Directory.CreateDirectory(path2);
                uploadcheckingfile.PostedFile.SaveAs(filePath);
                objmapping.checking_file = fileName;
            }
            if (chkview.Checked == true)
                objmapping.ischeckonce = 1;
            else
                objmapping.ischeckonce = null;
            objmapping.questiondescription = txtquestiondescription.Text;
            objmapping.univesityid = universityID;
            objmapping.fileinstruction = txtfileinstruction.Text;
            objmapping.adminid= adminID;
            objmapping.marks = txtmarks.Value;
            objmapping.duration = txttime.Value;
            
            if (rbl1.Checked == true)
                objmapping.question_for = 1;
            else if (rbl2.Checked == true)
                objmapping.question_for = 2;
            else if (rbl3.Checked == true)
                objmapping.question_for = 3;
            if (mode == "new")
                db.ec_uploadanswer_master.Add(objmapping);
            db.SaveChanges();

            if (mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Inserted Successfully');window.location='" + Request.ApplicationPath + "admin/ec_uploadanswer_master.aspx';", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + "admin/ec_uploadanswer_master.aspx';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    //private void BindDocuments()
    //{

    //    var List = db.ec_uploadanswer_master
    //        .Where(x => x.adminid == adminID && x.univesityid == universityID)
    //        .Select(x => new
    //        {
    //            questionid = x.questionid,
    //            questiondescription = x.questiondescription,
    //            questionpath = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminID + "/" + x.questionpath,
    //            extrasheetpath = x.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminID + "/ExtraSheet/" + x.extrasheetpath,
    //            extrafilepath = x.extrafilepath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminID + "/AnyFile/" + x.extrafilepath,
    //            audiovideofile_tobeviewed = x.ischeckonce == null ? "No" : "Yes",
    //            check = x.ischeckonce == null ? 0 : 1,
    //            marks = x.marks,
    //            time = x.duration,
    //        }).ToList();
    //    if (List != null)
    //    {
    //        grid.DataSource = List;
    //        grid.DataBind();
    //    }
    //    rptVideo.DataSource = List;
    //    rptVideo.DataBind();

    //}


  
    private void BindDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please Select", "0");
            var data = db.subjectmaster.ToList();
            ddlsubject.DataSource = data;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

            var grade = db.ec_grademaster.ToList();
            ddlgrade.DataSource = grade;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}