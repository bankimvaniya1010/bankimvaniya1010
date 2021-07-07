using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_downloadsheetSet : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

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
           //BindDocuments(selecteduniversityid, selectedexaminerId);
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniversityid);
    }

    private void BindExaminer(int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x => x.universityId == universityId && x.roleid == 9).ToList();
            ddlexaminer.DataSource = examinerId;
            ddlexaminer.DataTextField = "name";
            ddlexaminer.DataValueField = "examinerID";
            ddlexaminer.DataBind();
            ddlexaminer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        uploadpaperDiv.Attributes.Add("style", "display:none");
        txtpasskey.Value = "";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedexaminerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                uploadpaperDiv.Attributes.Add("style", "display:block");
                validate.Attributes.Add("style", "display:none");
                //BindGrid(selecteduniversityid, selectedexaminerId);
                BindDocuments(selecteduniversityid, selectedexaminerId);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);

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
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

            exam_uploadanswer_master objmapping = new exam_uploadanswer_master();
            docPath = docPath + "/Exammodule/questionBankType4/" + selecteduniversityid + "/" + selectedexaminerId;
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
            objmapping.univesityid = selecteduniversityid;
            objmapping.fileinstruction = txtfileinstruction.Text;
            objmapping.examinerid = selectedexaminerId;
            objmapping.marks = txtmarks.Value;
            objmapping.duration = txttime.Value;

            db.exam_uploadanswer_master.Add(objmapping);
            db.SaveChanges();
            BindDocuments(selecteduniversityid, selectedexaminerId);
            txtfileinstruction.Text = "";
            txtmarks.Value = "";
            txttime.Value = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindDocuments(int selectuniversity, int examinerid)
    {

        var List = db.exam_uploadanswer_master
            .Where(x => x.examinerid == examinerid && x.univesityid == selectuniversity)
            .Select(x => new
            {
                questionid = x.questionid,
                questiondescription = x.questiondescription,
                questionpath = webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/" + x.questionpath,
                extrasheetpath = x.extrasheetpath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/ExtraSheet/" + x.extrasheetpath,
                extrafilepath = x.extrafilepath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/AnyFile/" + x.extrafilepath,
                audiovideofile_tobeviewed = x.ischeckonce == null ? "No" : "Yes",
                check = x.ischeckonce == null ? 0 : 1,
                marks = x.marks,
                time = x.duration,
            }).ToList();
        if (List != null)
        {
            grid.DataSource = List;
            grid.DataBind();
        }
        rptVideo.DataSource = List;
        rptVideo.DataBind();

    }


    protected void grid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            grid.EditIndex = -1;
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            BindDocuments(selecteduniversityid, selectedexaminerId);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[7].Controls[0];
                    if (lb != null)
                    {
                        //attach the JavaScript function with the ID as the paramter
                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(grid.DataKeys[e.RowIndex].Values[0]);
            exam_uploadanswer_master objID = db.exam_uploadanswer_master.Where(b => b.questionid == ID).First();

            var isassign = db.exampapers_master.Where(d => d.questionId == ID && d.questiontype== "Upload Answer").ToList();

            if (isassign.Count == 0)
            {
                db.exam_uploadanswer_master.Remove(objID);
                db.SaveChanges();
                int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
                BindDocuments(selecteduniversityid, selectedexaminerId);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this question as the selected question is already assign to to assessment.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid.EditIndex = e.NewEditIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindDocuments(selecteduniversityid, selectedexaminerId);
    }

    protected void grid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            TextBox txtquestiondescription = (TextBox)grid.Rows[e.RowIndex].FindControl("txtquestiondescription");
            FileUpload fileupload = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload");
            FileUpload fileupload_extra = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload_extra");
            FileUpload fileupload_file = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload_file");
            CheckBox checkBox = (CheckBox)grid.Rows[e.RowIndex].FindControl("chkactive") as CheckBox;

            var mode = "new";
            int papersheetID = Convert.ToInt32(grid.DataKeys[e.RowIndex].Values[0]);

            exam_uploadanswer_master objmapping = new exam_uploadanswer_master();
            var data = db.exam_uploadanswer_master.Where(b => b.questionid == papersheetID).First();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }

            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

            docPath = docPath + "/Exammodule/questionBankType4/" + selecteduniversityid + "/" + selectedexaminerId;
            if (fileupload.HasFiles)
            {
                string dirPath = docPath;
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload.PostedFile.FileName));
                string filePath = string.Concat(dirPath, "/", fileName);
                DirectoryInfo di = new DirectoryInfo(dirPath);
                if (!di.Exists)
                    di.Create();
                fileupload.PostedFile.SaveAs(filePath);
                objmapping.questionpath = fileName;
            }
            if (fileupload_extra.HasFile)
            {
                string path = docPath + "/ExtraSheet/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload_extra.PostedFile.FileName));
                string filePath = string.Concat(path, fileName);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                fileupload_extra.PostedFile.SaveAs(filePath);
                objmapping.extrasheetpath = fileName;
            }
            if (fileupload_file.HasFile)
            {
                string path1 = docPath + "/AnyFile/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload_file.PostedFile.FileName));
                string filePath = string.Concat(path1, fileName);
                if (!Directory.Exists(path1))
                    Directory.CreateDirectory(path1);
                fileupload_file.PostedFile.SaveAs(filePath);
                objmapping.extrafilepath = fileName;
            }
            if (checkBox.Checked == true)
                objmapping.ischeckonce = 1;
            else
                objmapping.ischeckonce = null;

            objmapping.questiondescription = txtquestiondescription.Text;

            grid.EditIndex = -1;
            if (mode == "new")
                db.exam_uploadanswer_master.Add(objmapping);
            db.SaveChanges();
            BindDocuments(selecteduniversityid, selectedexaminerId);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindDocuments(selecteduniversityid, selectedexaminerId);
    }

    protected void grid_DataBound(object sender, EventArgs e)
    {

    }
}