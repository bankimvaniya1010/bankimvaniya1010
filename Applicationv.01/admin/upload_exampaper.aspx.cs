using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_upload_exampaper : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID, exampapersid;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected List<exampapers_master> exampapers_master = new List<exampapers_master>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["exampapersid"] == null) || (Request.QueryString["exampapersid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            exampapersid = Convert.ToInt32(Request.QueryString["exampapersid"]);
        universityID = db.exam_master.Where(x => x.exampapersid == exampapersid).Select(x => x.universityID).FirstOrDefault();
        exampapers_master = db.exampapers_master.Where(x => x.exampapersid == exampapersid).ToList();

        docPath = docPath + "/Exammodule/" + universityID + "/" + exampapersid;
        //if (!IsPostBack)
        //    BindDocuments();
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        try {
            
            exampapers_master objmapping = new exampapers_master();

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

            objmapping.universityID = universityID;
            objmapping.exampapersid = exampapersid;
            objmapping.fileinstruction = txtfileinstruction.Text;

            db.exampapers_master.Add(objmapping);
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Papers Uploaded Successfully');window.location='" + Request.ApplicationPath + "admin/list_exampaper.aspx';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void BindDocuments()
    {

        var videoList = db.exampapers_master
            .Where(x => x.exampapersid == exampapersid && x.universityID == universityID)
            .Select(x => new
            {
                paperID = x.exampapersid,
                papersheetID = x.id,
                exampaper_path = webURL + "Docs/Exammodule/" + universityID + "/" + exampapersid + "/" + x.exampaper_path,
                extrasheetpath = webURL + "Docs/Exammodule/" + universityID + "/" + exampapersid + "/ExtraSheet/" + x.extrasheetpath,
                audiovideofilepath = webURL + "Docs/Exammodule/" + universityID + "/" + exampapersid + "/AnyFile/" + x.audiovideofilepath

            }).ToList();
        rptVideo.DataSource = videoList;
        rptVideo.DataBind();

    }
}