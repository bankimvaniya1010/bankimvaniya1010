using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_predeparturetutorialAddedit : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = String.Empty;
    int adminId = 0;
    int tutorialId;
    int universityID = 0;
    string roleName = string.Empty;
    predeparturetutorialmaster objtutorialmaster = new predeparturetutorialmaster();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        adminId = Convert.ToInt32(Session["UserID"]);
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            tutorialId = -1;
            if (int.TryParse(Request.QueryString["id"], out tutorialId))
            {
                objtutorialmaster = db.predeparturetutorialmaster.Where(obj => obj.predeparturetutorialid == tutorialId).FirstOrDefault();
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
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
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
        try
        {
            var tutorailData = (from tInfo in db.predeparturetutorialmaster
                                where tInfo.predeparturetutorialid == tutorialId
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
            var universityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            if (tutorialId != -1)
            {
                var tutorailData = (from tInfo in db.predeparturetutorialmaster
                                    where tInfo.universityid == universityID && tInfo.predeparturetutorialid == tutorialId
                                    select tInfo).FirstOrDefault();

                if (tutorailData != null)
                {
                    mode = "update";
                    objtutorialmaster = tutorailData;
                }
            }

            objtutorialmaster.type = ddlType.SelectedValue;
            objtutorialmaster.title = txtDescription.Value;
            
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
                var videoURL = value.Substring(value.LastIndexOf("=") + 1);
                objtutorialmaster.videourl = videoURL;
                objtutorialmaster.documentpath = "";
            }
            objtutorialmaster.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            objtutorialmaster.created_by = adminId;
            if (mode == "new")
                db.predeparturetutorialmaster.Add(objtutorialmaster);
            db.SaveChanges();            
            Response.Redirect(webURL + "admin/predeparturetutoriallisting.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }

    }

}