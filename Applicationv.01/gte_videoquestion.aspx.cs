using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class gte_videoquestion : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID;
    string InstituteName;
    string city;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    gte_videouploadmaster objgte_videouploadmaster = new gte_videouploadmaster();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            populateVideo();
            var applicantdetails = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
            if (applicantdetails != null)
            {
                allQuestions = objCom.FaqQuestionList();
                if (applicantdetails.postalcity != null)
                    city = applicantdetails.postalcity;
                if (applicantdetails.universityid.HasValue)
                    InstituteName = db.university_master.Where(x => x.universityid == applicantdetails.universityid).Select(x => x.university_name).FirstOrDefault();

            }
        }
        lblinstitutename.Text = InstituteName;
        lblcity.Text = city;
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";           
            var data = (from vInfo in db.gte_videouploadmaster
                        where vInfo.universityid == universityID && vInfo.applicantid == userID
                        select vInfo).FirstOrDefault();

            if (data != null)
            {
                mode = "update";
                objgte_videouploadmaster = data;
            }
            if (FileUpload.Value != "")
            {
                string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/GteUploadedVideo";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
                string filePath = string.Concat(dirPath, "/", fileName);
                DirectoryInfo di = new DirectoryInfo(dirPath);
                if (!di.Exists)
                    di.Create();
                FileUpload.PostedFile.SaveAs(filePath);
                objgte_videouploadmaster.videourl= fileName;

            }
            objgte_videouploadmaster.applicantid = userID;
            objgte_videouploadmaster.universityid = universityID;
            if (mode == "new")
                db.gte_videouploadmaster.Add(objgte_videouploadmaster);
            db.SaveChanges();

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void populateVideo()
    {
        var data = (from vInfo in db.gte_videouploadmaster
                    where vInfo.universityid == universityID && vInfo.applicantid == userID
                    select vInfo).FirstOrDefault();
        if (data != null)
        {

            hidDocumentPath.Value = data.videourl;
            uploadedFile.NavigateUrl = webURL + "/Docs/GteUploadedVideo/" + data.videourl;
            uploadedFile.Text = "View File";
        }
    }
}