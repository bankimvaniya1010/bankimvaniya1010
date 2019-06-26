using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.IO;
public partial class uploadvideo : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        if (!GlobalVariables.isDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);

        if (!IsPostBack)
        {
            BindVideo();
        }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        if (avatar.HasFile)  //fileupload control contains a file  
            try
            {
                docPath = docPath + "/" + UserID + "/video/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(avatar.PostedFile.FileName);
                string filename = name.Value + extension;
                avatar.SaveAs(docPath + filename);          // file path where you want to upload  
                applicantvideomaster objVideo = new applicantvideomaster();
                objVideo.applicantid = ApplicantID;
                objVideo.videofilename = filename;
                objVideo.uploadedtime = DateTime.Now;
                db.applicantvideomaster.Add(objVideo);
                db.SaveChanges();
                BindVideo();
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.ToString());
            }
        else
        {
            //  lblMessgae.Text = "Please Select File and Upload Again";

        }
    }

    private void BindVideo()
    {
        var videoList = db.applicantvideomaster.Where(x => x.applicantid == ApplicantID).ToList();
        rptVideo.DataSource = videoList;
        rptVideo.DataBind();

    }
    protected void Download(object sender, EventArgs e)
    {
        try
        {
            string filePath = (sender as LinkButton).CommandArgument;
            if ((Session["Role"] == null) && (Session["UserID"] == null))
                Response.Redirect(webURL + "Login.aspx");
            UserID = Convert.ToInt32(Session["UserID"].ToString());
            ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
            docPath = docPath + "/" + UserID + "/video/";
            Response.ContentType = ContentType;

            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(docPath + filePath));
            Response.WriteFile(docPath + filePath);
            Response.End();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
}