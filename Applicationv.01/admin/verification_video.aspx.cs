using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_verification_video : System.Web.UI.Page
{
    int universityid = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();    
    gte_videouploadmaster objgte_videouploadmaster = new gte_videouploadmaster();
    string webURL = String.Empty;
    int applicantid = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityid = Utility.GetUniversityId();

        

        if (string.IsNullOrEmpty(Request.QueryString["applicantId"]))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
        {
            applicantid = Convert.ToInt32(Request.QueryString["applicantId"].ToString());
        }
        if (!IsPostBack)
        {
            populateVideo(applicantid, universityid);            
        }

    }
   
    private void populateVideo(int applicantid , int universityid)
    {
        var data = (from vInfo in db.gte_videouploadmaster
                    where vInfo.universityid == universityid && vInfo.applicantid == applicantid
                    select vInfo).FirstOrDefault();
        if (data != null)
        {

            hidDocumentPath.Value = data.videourl;
            uploadedFile.NavigateUrl = webURL + "/Docs/admin_verification_video/" + data.videourl;
            uploadedFile.Text = "View Uploaded File";
        }
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {   
            var mode = "new";
            var data = (from vInfo in db.gte_videouploadmaster
                        where vInfo.universityid == universityid && vInfo.applicantid == applicantid
                        select vInfo).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objgte_videouploadmaster = data;
            }
            btnupload.Attributes.Add("disabled","true");
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/admin_verification_video";
            string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
            string filePath = string.Concat(dirPath, "/", fileName);
            DirectoryInfo di = new DirectoryInfo(dirPath);
            if (!di.Exists)
                di.Create();
            FileUpload.PostedFile.SaveAs(filePath);            
            objgte_videouploadmaster.videourl = fileName;
            objgte_videouploadmaster.applicantid = applicantid;
            objgte_videouploadmaster.universityid = universityid;
            if (mode == "new")
                db.gte_videouploadmaster.Add(objgte_videouploadmaster);
            db.SaveChanges();
            btnupload.Attributes.Remove("disabled");
            populateVideo(applicantid, universityid);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Video uploaded successfully')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}