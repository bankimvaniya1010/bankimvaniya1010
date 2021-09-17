using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_create_resource_material_master : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string roleName = string.Empty;
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID;
    int tutorialId;

    ec_tutorialmaster objtutorialmaster = new ec_tutorialmaster();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            tutorialId = -1;
            if (int.TryParse(Request.QueryString["id"], out tutorialId))
            {
                objtutorialmaster = db.ec_tutorialmaster.Where(obj => obj.id == tutorialId).FirstOrDefault();
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
                Universities = db.university_master.Where(x => x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
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
            var tutorailData = (from tInfo in db.ec_tutorialmaster
                                where tInfo.id == tutorialId
                                select tInfo).FirstOrDefault();
            if (tutorailData != null)
            {
                rbl_service_institute.SelectedValue = tutorailData.institute_service_wise.ToString();
                if (Convert.ToInt32(tutorailData.institute_service_wise) == 1)
                {
                    //div_institute.Visible = true;
                    //div_service.Visible = false;
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(tutorailData.universityid.ToString()).Selected = true;
                }
                else
                {
                    ddlservice.ClearSelection();
                    ddlservice.Items.FindByValue(tutorailData.serviceId.ToString()).Selected = true;
                  //  div_service.Visible = true;
                   // div_institute.Visible = false;
                }
                txtDescription.Value = tutorailData.title;
                if (tutorailData.type == "web_link")
                {
                    txtVideourl.Value = tutorailData.videourl;
                }
                else if (tutorailData.type == "pdf" || tutorailData.type == "ppt" || tutorailData.type == "audio" || tutorailData.type == "video")
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
                if (tutorailData.status != null)
                {
                    if (tutorailData.status == 1)
                        chkactive.Checked = true;
                    else
                        chkactive.Checked = false;
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
            int university_id=0, service_id=0;
            if (Convert.ToInt32(rbl_service_institute.SelectedValue) == 1)
            {
                university_id = Convert.ToInt32(ddlUniversity.SelectedValue);
            }
            else
            {
                service_id = Convert.ToInt32(ddlservice.SelectedValue);
            }                        
            if (tutorialId != -1)
            {
                var tutorailData = (from tInfo in db.ec_tutorialmaster
                                    where (tInfo.universityid == university_id || tInfo.serviceId == service_id) && tInfo.id == tutorialId
                                    select tInfo).FirstOrDefault();

                if (tutorailData != null)
                {
                    mode = "update";
                    objtutorialmaster = tutorailData;
                }
            }

            objtutorialmaster.type = ddlType.SelectedValue;
            objtutorialmaster.title = txtDescription.Value;
            if (chkactive.Checked == true)
                objtutorialmaster.status = 1;
            else
                objtutorialmaster.status = 0;
            if (!ddlType.SelectedValue.ToString().Equals("web_link", StringComparison.OrdinalIgnoreCase) && (FileUpload.HasFile || !string.IsNullOrEmpty(hidDocumentPath.Value)))
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
            objtutorialmaster.institute_service_wise = Convert.ToInt32(rbl_service_institute.SelectedValue);
            if (Convert.ToInt32(rbl_service_institute.SelectedValue) == 2)
            {
                objtutorialmaster.serviceId = Convert.ToInt32(ddlservice.SelectedValue);
                objtutorialmaster.universityid = null;
            }
            else
            {
                objtutorialmaster.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                objtutorialmaster.serviceId = null;
            }
            if (mode == "new")
                db.ec_tutorialmaster.Add(objtutorialmaster);
            db.SaveChanges();
            lblMessage.Text = "Saved Successfully";
            lblMessage.Visible = true;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Record Saved Successfully');window.location='" + Request.ApplicationPath + "admin/ec_manage_resource_material_master.aspx';", true);
           // Response.Redirect(webURL + "admin/ec_manage_resource_material_master.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void rbl_service_institute_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (Convert.ToInt32(rbl_service_institute.SelectedValue) == 1)
        //{
        //    div_institute.Visible = true;
        //    div_service.Visible = false;
        //}
        //else
        //{
        //    div_service.Visible = true;
        //    div_institute.Visible = false;
        //}
    }
}