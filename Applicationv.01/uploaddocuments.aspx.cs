using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
public partial class uploaddocuments : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<applicantdetails> appDetails = new List<applicantdetails>();
    protected List<applicanteducationdetails> appEduDetails = new List<applicanteducationdetails>();
    protected List<applicantlanguagecompetency> appLangDetails = new List<applicantlanguagecompetency>();
    protected List<applicantemployerdetails> appEmpDetails = new List<applicantemployerdetails>();
    protected List<applicanthighereducation> appHigherDetails = new List<applicanthighereducation>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if (!isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);

        if (!IsPostBack)
        {
            appDetails = db.applicantdetails.Where(x => x.applicantid == UserID).ToList();
            appEduDetails = db.applicanteducationdetails.Where(x => x.applicantid == UserID).ToList();
            appLangDetails = db.applicantlanguagecompetency.Where(x => x.applicantid == UserID).ToList();
            appEmpDetails = db.applicantemployerdetails.Where(x => x.applicantid == UserID).ToList();
            appHigherDetails = db.applicanthighereducation.Where(x => x.applicantid == UserID).ToList();
            BindDocuments();
        }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        if (avatar.HasFile)  //fileupload control contains a file  
            try
            {
                docPath = docPath + "/" + UserID + "/Documents/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(avatar.PostedFile.FileName);
                string filename = name.Value + extension;
                avatar.SaveAs(docPath + filename);          // file path where you want to upload  
                applicantdocumentmaster objDocument = new applicantdocumentmaster();
                objDocument.applicantid = ApplicantID;
                objDocument.filename = filename;
                objDocument.documentname = name.Value;
                objDocument.uploadedtime = DateTime.Now;
                db.applicantdocumentmaster.Add(objDocument);
                db.SaveChanges();
                BindDocuments();
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

    private void BindDocuments()
    {
        var videoList = db.applicantdocumentmaster.Where(x => x.applicantid == ApplicantID).ToList();
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
            docPath = docPath + "/" + UserID + "/Documents/";
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