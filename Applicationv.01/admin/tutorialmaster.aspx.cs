using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_tutorialmaster : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID ;
    int tutorialId;

    tutorialmaster objtutorialmaster = new tutorialmaster();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            tutorialId = -1;
            if (int.TryParse(Request.QueryString["id"], out tutorialId))
            {
                objtutorialmaster = db.tutorialmaster.Where(obj => obj.id == tutorialId).FirstOrDefault();
                if (objtutorialmaster == null)
                    tutorialId = -1;
            }
        }

        if (!IsPostBack)
        {
            BindUniversity();
            if (objtutorialmaster != null)
                PopulatetutorialInfo();
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Universities = db.university_master.ToList();
            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulatetutorialInfo()
    {
        try {
            var tutorailData = (from tInfo in db.tutorialmaster
                                where tInfo.id == tutorialId
                                select tInfo).FirstOrDefault();
            if (tutorailData != null)
            {
                if (tutorailData.universityid != null)
                {
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(tutorailData.universityid.ToString()).Selected = true;
                }
                txtDescription.Value = tutorailData.title;
                if (tutorailData.type == "video")
                {
                    txtVideourl.Value = tutorailData.videourl;
                }
                else if (tutorailData.type == "pdf" || tutorailData.type == "ppt")
                {

                    hidDocumentPath.Value = tutorailData.documentpath;
                    uploadedFile.NavigateUrl = webURL + "/Docs/" + tutorailData.documentpath;
                    uploadedFile.Text = "View File";
                }
                if (tutorailData.type != null)
                {
                    ddlType.ClearSelection();
                    ddlType.Items.FindByValue(tutorailData.type.ToString()).Selected = true;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

        protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            if (tutorialId != -1)
            {
                var tutorailData = (from tInfo in db.tutorialmaster
                                    where tInfo.universityid == universityID && tInfo.id == tutorialId
                                    select tInfo).FirstOrDefault();

                if (tutorailData != null)
                {
                    mode = "update";
                    objtutorialmaster = tutorailData;
                }
            }
            
            objtutorialmaster.type = ddlType.SelectedValue;
            objtutorialmaster.title = txtDescription.Value;           
            objtutorialmaster.status = 1;
            if (!ddlType.SelectedValue.ToString().Equals("video", StringComparison.OrdinalIgnoreCase) && (FileUpload.HasFile || !string.IsNullOrEmpty(hidDocumentPath.Value)))
            {
                if (FileUpload.HasFile)
                {
                    string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
                    string filePath = string.Concat(dirPath, "/", fileName);
                    DirectoryInfo di = new DirectoryInfo(dirPath);
                    if (!di.Exists)
                        di.Create();
                    FileUpload.PostedFile.SaveAs(filePath);
                    objtutorialmaster.documentpath = fileName;
                    objtutorialmaster.videourl = "";
                }
            }
            else
            {
                var value = txtVideourl.Value;
                var videoURL = value.Substring(value.LastIndexOf("=")+1);
                objtutorialmaster.videourl = videoURL;
                objtutorialmaster.documentpath = "";
            }
            objtutorialmaster.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            if (mode == "new")
                db.tutorialmaster.Add(objtutorialmaster);
            db.SaveChanges();
            lblMessage.Text = "Saved Successfully";
            lblMessage.Visible = true;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
       
    }
}