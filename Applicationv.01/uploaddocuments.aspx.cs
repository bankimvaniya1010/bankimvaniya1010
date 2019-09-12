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
    List<string> documentList = new List<string>();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        ApplicantID = Convert.ToInt32(Session["UserID"].ToString());
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
            documentList.Add("Passport Size Photo Graph");
            documentList.Add("Passport Copy (Bio Pages)");
            if ((appDetails.Count > 0) && (appDetails[0].alternativeIdentityproofId != null))
                documentList.Add("Alternate Proof of Identity");
            if ((appDetails.Count > 0) && (appDetails[0].alternativeproofdobId != null))
                documentList.Add("Alternate Proof of Date of Birth");
            if ((appDetails.Count > 0) && (appDetails[0].alternativeresidenceproofId != null))
                documentList.Add("Alternate Proof of Residence");
            if ((appEduDetails.Count > 0) && appEduDetails[0].ishighschooldone == 1)
                documentList.Add("Proof of High School");
            if ((appEduDetails.Count > 0) && appEduDetails[0].issecondarydone == 1)
                documentList.Add("Proof of Senior Secondary School");
            for (int higher = 0; higher < appHigherDetails.Count; higher++)
            {
                if (appHigherDetails[higher].coursename == "UG")
                    documentList.Add("Proof of Higher Education(UG)");
                if (appHigherDetails[higher].coursename == "PG")
                    documentList.Add("Proof of Higher Education(PG)");
                if (appHigherDetails[higher].coursename == "Phd")
                    documentList.Add("Proof of Higher Education(Phd)");
                if (appHigherDetails[higher].coursename == "Other")
                    documentList.Add("Proof of Higher Education(Other)");
            }
            if ((appEduDetails.Count > 0) && appEduDetails[0].isdiplomadone == 1)
                documentList.Add("Proof of Certificate / Diploma");
            if ((appLangDetails.Count > 0) && (appLangDetails[0].isenglishintesive == 1))
                documentList.Add("Proof of Study - English Language Intensive");
            if ((appLangDetails.Count > 0) && (appLangDetails[0].testname != ""))
                documentList.Add("Proof of English Language Test");
            int empCount = 0;
            for (int employ = 0; employ < appEmpDetails.Count; employ++)
            {
                empCount = empCount + 1;
                if (appEmpDetails[employ].wishtoaddemployer == 1)
                    documentList.Add("Proof of Work Experience (" + empCount + ")");
            }
            ddlDocuments.DataSource = documentList;
            ddlDocuments.DataBind();
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
                string filename = Guid.NewGuid() + extension;
                avatar.SaveAs(docPath + filename);          // file path where you want to upload  
                applicantdocumentmaster objDocument = new applicantdocumentmaster();
                objDocument.applicantid = ApplicantID;
                objDocument.universityid = UniversityID;
                objDocument.filename = filename;
                objDocument.documentname = ddlDocuments.SelectedItem.Value;
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
        var videoList = db.applicantdocumentmaster.Where(x => x.applicantid == ApplicantID && x.universityid==UniversityID).ToList();
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