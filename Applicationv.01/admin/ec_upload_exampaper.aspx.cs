using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class admin_ec_upload_exampaper : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    public int selectuniversity, UserID, assignmentid;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected List<ec_assignment_master> assignment_master = new List<ec_assignment_master>();
    public int? assignment_type;
    public dynamic data = null;


    protected void Page_Load(object sender, EventArgs e)
    {

        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
        {
            assignmentid = Convert.ToInt32(Request.QueryString["id"]);
            Session["id"] = assignmentid;
        }

        var data = db.ec_assignment_master.Where(x => x.id == assignmentid).FirstOrDefault();        
        selectuniversity = data.universityid;
        assignment_type = data.assignment_type;
        docPath = docPath + "/Eclass_Service/Assignments/" + selectuniversity + "/" + assignmentid;
        BindDocuments();
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_assignment_scheduleassign_master.aspx", true);
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        SaveData();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record Saved successfully.');window.location='" + Request.ApplicationPath + "admin/ec_upload_exampaper.aspx?id='" + assignmentid + "';", true);
    }
    private void SaveData()
    {
        try
        {
            ec_assignment_papers_master objmapping = new ec_assignment_papers_master();
            if (assignment_type == 2)
            {
                if (FileUpload.HasFiles)
                {
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(FileUpload.PostedFile.FileName);
                    string filename = Guid.NewGuid() + extension;
                    FileUpload.PostedFile.SaveAs(System.IO.Path.Combine(docPath, filename));

                    objmapping.exampaper_path = filename;
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
                    objmapping.audiovideofilepath = fileName;
                }

                if (chkview.Checked == true)
                    objmapping.is_audiovideofile_onetimeview = 1;
                else
                    objmapping.is_audiovideofile_onetimeview = null;

                objmapping.universityID = selectuniversity;
                objmapping.fileinstruction = txtfileinstruction.Text;
                objmapping.marks = Convert.ToInt32(txtmarks.Value);
                objmapping.assignmentid = assignmentid;
                db.ec_assignment_papers_master.Add(objmapping);
                db.SaveChanges();
                BindDocuments();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindDocuments()
    {

        var videoList = (from x in db.ec_assignment_papers_master
                         where x.assignmentid == assignmentid && x.universityID == selectuniversity
                         select new
                         {

                             paperID = x.assignmentid,
                             papersheetID = x.id,
                             exampaper_path = webURL + "Docs/Eclass_Service/Assignments/" + selectuniversity + "/" + assignmentid + "/" + x.exampaper_path,
                             extrasheetpath = x.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/Assignments/" + selectuniversity + "/" + assignmentid + "/ExtraSheet/" + x.extrasheetpath,
                             audiovideofilepath = x.audiovideofilepath == null ? null : webURL + "Docs/Eclass_Service/Assignments/" + selectuniversity + "/" + assignmentid + "/AnyFile/" + x.audiovideofilepath,
                             audiovideofile_tobeviewed = x.is_audiovideofile_onetimeview == null ? "No" : "Yes",
                             check = x.is_audiovideofile_onetimeview == null ? 0 : 1,
                         }).ToList();

        if (videoList != null)
        {
            grid.DataSource = videoList;
            grid.DataBind();
            if (videoList.Count > 0)
            {
                uploadpaperDiv.Attributes.Add("style", "display:none;");
                btnupload.Visible = false;
            }
            else
            {
                uploadpaperDiv.Attributes.Add("style", "display:block;");
                btnupload.Visible = true;
            }
        }
    }

    protected void grid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            grid.EditIndex = -1;
            BindDocuments();
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
                    LinkButton lb = (LinkButton)e.Row.Cells[5].Controls[0];
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
            ec_assignment_papers_master objID = db.ec_assignment_papers_master.Where(b => b.id == ID).First();
            int? exampaperid = objID.assignmentid;
            var isexamassign = db.ec_assignments_assignschedule_master.Where(d => d.asm_id == exampaperid).ToList();
            if (isexamassign.Count == 0)
            {
                db.ec_assignment_papers_master.Remove(objID);
                db.SaveChanges();
                
                BindDocuments();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                  "alert('Record Deleted successfully.');window.location='" + Request.ApplicationPath + "admin/ec_upload_exampaper.aspx?id='" + assignmentid+ "'';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this assignment  as the selected assignment is already scheduled.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid.EditIndex = e.NewEditIndex;
        BindDocuments();
    }

    protected void grid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            FileUpload fileupload = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload");
            FileUpload fileupload_extra = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload_extra");
            FileUpload fileupload_file = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload_file");
            CheckBox checkBox = (CheckBox)grid.Rows[e.RowIndex].FindControl("chkactive") as CheckBox;

            var mode = "new";
            int papersheetID = Convert.ToInt32(grid.DataKeys[e.RowIndex].Values[0]);

            ec_assignment_papers_master objmapping = new ec_assignment_papers_master();
            var data = db.ec_assignment_papers_master.Where(b => b.id == papersheetID).First();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }

            if (fileupload.HasFiles)
            {
                string dirPath = docPath;
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload.PostedFile.FileName));
                string filePath = string.Concat(dirPath, "/", fileName);
                DirectoryInfo di = new DirectoryInfo(dirPath);
                if (!di.Exists)
                    di.Create();
                fileupload.PostedFile.SaveAs(filePath);
                objmapping.exampaper_path = fileName;
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
                objmapping.audiovideofilepath = fileName;
            }
            if (checkBox.Checked == true)
                objmapping.is_audiovideofile_onetimeview = 1;
            else
                objmapping.is_audiovideofile_onetimeview = null;

            grid.EditIndex = -1;
            if (mode == "new")
                db.ec_assignment_papers_master.Add(objmapping);
            db.SaveChanges();
            BindDocuments();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindDocuments();
    }

    protected void grid_DataBound(object sender, EventArgs e)
    {

    }
}