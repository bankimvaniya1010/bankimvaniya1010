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
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
        {
            BindUniversity();           
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

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var tutorailData = (from tInfo in db.tutorialmaster
                                where tInfo.universityid == universityID
                                select tInfo).FirstOrDefault();
            tutorialmaster objtutorialmaster = new tutorialmaster();
            objtutorialmaster.videourl = txtVideourl.Value;
            objtutorialmaster.type = ddlType.SelectedValue;
            objtutorialmaster.description = txtDescription.Value;           
            objtutorialmaster.status = 1;
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
            }
            objtutorialmaster.universityid = universityID;
            db.tutorialmaster.Add(objtutorialmaster);
            db.SaveChanges();
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
       
    }
}