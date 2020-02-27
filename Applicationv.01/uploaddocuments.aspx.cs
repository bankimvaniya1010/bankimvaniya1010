using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class uploaddocuments : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<applicantdetails> appDetails = new List<applicantdetails>();
    protected List<applicanteducationdetails> appEduDetails = new List<applicanteducationdetails>();
    protected List<applicantlanguagecompetency> appLangDetails = new List<applicantlanguagecompetency>();
    protected List<applicantemployerdetails> appEmpDetails = new List<applicantemployerdetails>();
    protected List<applicanthighereducation> appHigherDetails = new List<applicanthighereducation>();
    List<string> documentList = new List<string>();
    protected static List<faq> allQuestions = new List<faq>();
    protected Common objCom = new Common();
    int UniversityID = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if (!isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);

        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            appDetails = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).ToList();
            appEduDetails = db.applicanteducationdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).ToList();
            appLangDetails = db.applicantlanguagecompetency.Where(x => x.applicantid == UserID && x.universityid == UniversityID).ToList();
            appEmpDetails = db.applicantemployerdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).ToList();
            appHigherDetails = db.applicanthighereducation.Where(x => x.applicantid == UserID && x.universityid == UniversityID).ToList();
            documentList.Add("Profile Photo for Application Centre");
            documentList.Add("Recent Passport-size Photograph");
            documentList.Add("National ID Card");
            if ((appDetails.Count > 0) && (appDetails[0].alternativeIdentityproofId != null && appDetails[0].alternativeIdentityproofId != 0))
                documentList.Add("Alternate Proof of Identity");
            if ((appDetails.Count > 0) && (appDetails[0].alternativeproofdobId != null && appDetails[0].alternativeproofdobId != 0))
                documentList.Add("Alternate Proof of Date of Birth");
            if ((appDetails.Count > 0) && (appDetails[0].alternativeresidenceproofId != null  && appDetails[0].alternativeresidenceproofId != 0))
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
            if ((appEduDetails.Count > 0) && appEduDetails[0].ishighereducation == 1)
                documentList.Add("Higher Degree Transcripts");
            if ((appEduDetails.Count > 0) && appEduDetails[0].isdiplomadone == 1)
                documentList.Add("Diploma / Certificate Transcripts");//Proof of Certificate / Diploma
            if ((appLangDetails.Count > 0) && (appLangDetails[0].isenglishintesive == 1))
                documentList.Add("English Language Test Report");
            if ((appLangDetails.Count > 0) && appLangDetails[0].giveenglishtest != null)
                documentList.Add("Standardised Test(s) Report");
            int empCount = 0;
            for (int employ = 0; employ < appEmpDetails.Count; employ++)
            {
                empCount = empCount + 1;
                if (appEmpDetails[employ].wishtoaddemployer == 1)
                    documentList.Add("Proof of Work Experience (" + empCount + ")");
            }
            ListItem lst = new ListItem("Please select", "0");
            ddlDocuments.DataSource = documentList;
            ddlDocuments.DataBind();
            ddlDocuments.Items.Insert(0, lst);
            BindDocuments();
            HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;            
            if (httpPostedFile.Count > 0)
                uploadDoc(httpPostedFile[0], HttpContext.Current.Request["doc_name"]);
        }
    }
    protected void uploadDoc(HttpPostedFile httpPostedFile, string docName)
    {        
        try
        {
            var mode = "new";
            var document = (from dInfo in db.applicantdocumentmaster
                            where dInfo.universityid == UniversityID && dInfo.applicantid == UserID && dInfo.documentname == docName
                            select dInfo).FirstOrDefault();
            applicantdocumentmaster objDocument = new applicantdocumentmaster();
            if (document != null)
            {
                mode = "update";
                objDocument = document;
            }
            
            docPath = docPath + "/" + UserID + "/Documents/";
            if (!Directory.Exists(docPath))
                Directory.CreateDirectory(docPath);
            string extension = Path.GetExtension(httpPostedFile.FileName);
            string filename = Guid.NewGuid() + extension;            
            httpPostedFile.SaveAs(docPath + filename);          // file path where you want to upload  
                              
            objDocument.applicantid = UserID;
            objDocument.universityid = UniversityID;
            objDocument.filename = filename;           
            objDocument.documentname = docName;           
            objDocument.uploadedtime = DateTime.Now;
            if (mode == "new")
                db.applicantdocumentmaster.Add(objDocument);
            db.SaveChanges();
            BindDocuments();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }       
    }

    private void BindDocuments()
    {       

        var videoList = db.applicantdocumentmaster   
            .Where(x => x.applicantid == UserID && x.universityid==UniversityID)
            .Select(x=> new{ documentname = x.documentname , filename = webURL + "/Docs/" + UserID + "/Documents/"+x.filename }).ToList();
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