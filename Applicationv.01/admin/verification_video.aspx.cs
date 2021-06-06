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
            Response.Redirect(webURL + "admin/default.aspx", true);
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
        try {
            var data = (from vInfo in db.gte_videouploadmaster
                        where vInfo.universityid == universityid && vInfo.applicantid == applicantid
                        select vInfo).ToList();
            if (data != null)
            {
                foreach (var item in data)
                {
                    if (item.type != null && item.type.ToLower() == "verification video")
                    {
                        hidDocumentPath.Value = item.documentpath;
                        uploadedFile.NavigateUrl = webURL + "/Docs/admin_verification_video/" + universityid + "/" + applicantid + "/" + item.documentpath;
                        uploadedFile.Text = "View Uploaded File";
                       
                    }
                    if (item.type != null && item.type.ToLower() == "verification image")
                    {
                        Hidden1.Value = item.documentpath;
                        HyperLink1.NavigateUrl = webURL + "/Docs/admin_verification_video/" + universityid + "/" + applicantid + "/" + item.documentpath;
                        HyperLink1.Text = "View Uploaded File";
                    }
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload.HasFile)
            {
                saveRecord(FileUpload, "Verification Video");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnupload1_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                saveRecord(FileUpload1, "Verification Image");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void saveRecord(FileUpload fileUpload, string type)
    {
        try
        {
            var mode = "new";
            var data = (from vInfo in db.gte_videouploadmaster
                        where vInfo.universityid == universityid && vInfo.applicantid == applicantid && vInfo.type == type
                        select vInfo).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objgte_videouploadmaster = data;
            }
            btnupload.Attributes.Add("disabled", "true");
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/admin_verification_video/" + universityid + "/" + applicantid + "/";
            string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileUpload.PostedFile.FileName));
            string filePath = string.Concat(dirPath, "/", fileName);
            DirectoryInfo di = new DirectoryInfo(dirPath);
            if (!di.Exists)
                di.Create();
            fileUpload.PostedFile.SaveAs(filePath);
            objgte_videouploadmaster.documentpath = fileName;
            objgte_videouploadmaster.applicantid = applicantid;
            objgte_videouploadmaster.universityid = universityid;
            objgte_videouploadmaster.type = type;

            if (mode == "new")
                db.gte_videouploadmaster.Add(objgte_videouploadmaster);
            db.SaveChanges();
            btnupload.Attributes.Remove("disabled");
            populateVideo(applicantid, universityid);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('uploaded successfully')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    protected void backNavLink_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + applicantid, true);
    }
    //protected void vvideodownload_Click(object sender, EventArgs e)
    //{
    //    try {
    //        var data = (from vInfo in db.gte_videouploadmaster
    //                    where vInfo.universityid == universityid && vInfo.applicantid == applicantid
    //                    select vInfo).ToList();
    //        if (data != null)
    //        {
    //            foreach (var item in data)
    //            {
    //                if (item.type != null && item.type.ToLower() == "verification video")
    //                {
    //                    string filePath = @""+webURL + "/Docs/admin_verification_video/" + universityid + "/" + applicantid + "/" + item.documentpath;

    //                    string docPath = @"" + webURL + "/Docs/admin_verification_video/" + universityid + "/" + applicantid + "/" + item.documentpath;
    //                    Response.ContentType = "video/x-ms-wmv"; ;

    //                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
    //                    Response.WriteFile(filePath);
    //                    Response.End();

    //                    //string filePath = webURL + "/Docs/admin_verification_video/" + universityid + "/" + applicantid + "/" + item.documentpath;
    //                    //Response.ContentType = ContentType; ;
    //                    //Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
    //                    //Response.TransmitFile(filePath);
    //                    //Response.End();

    //                }
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.StackTrace.ToString());
    //    }
    //}
}