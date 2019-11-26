﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admin_getaddtutorial : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID;
    int tutorialId;
    gte_tutorialmaster objgtetutorialmaster = new gte_tutorialmaster();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);        

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            tutorialId = -1;
            if (int.TryParse(Request.QueryString["id"], out tutorialId))
            {
                objgtetutorialmaster = db.gte_tutorialmaster.Where(obj => obj.id == tutorialId).FirstOrDefault();
                if (objgtetutorialmaster == null)
                    tutorialId = -1;
            }
        }

        if (!IsPostBack)
        {
            BindUniversity();
            if (objgtetutorialmaster != null)
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
        try
        {
            var gtetutorailData = (from tInfo in db.gte_tutorialmaster
                                where tInfo.id == tutorialId
                                select tInfo).FirstOrDefault();
            if (gtetutorailData != null)
            {
                if (gtetutorailData.universityid != null)
                {
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(gtetutorailData.universityid.ToString()).Selected = true;
                }
                txtDescription.Value = gtetutorailData.title;
                if (gtetutorailData.type == "video")
                {
                    txtVideourl.Value = gtetutorailData.videourl;
                }
                else if (gtetutorailData.type == "pdf" || gtetutorailData.type == "ppt")
                {

                    hidDocumentPath.Value = gtetutorailData.documentpath;
                    uploadedFile.NavigateUrl = webURL + "/Docs/" + gtetutorailData.documentpath;
                    uploadedFile.Text = "View File";
                }
                if (gtetutorailData.type != null)
                {
                    ddlType.ClearSelection();
                    ddlType.Items.FindByValue(gtetutorailData.type.ToString()).Selected = true;
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
                var tutorailData = (from tInfo in db.gte_tutorialmaster
                                    where tInfo.universityid == universityID && tInfo.id == tutorialId
                                    select tInfo).FirstOrDefault();

                if (tutorailData != null)
                {
                    mode = "update";
                    objgtetutorialmaster = tutorailData;
                }
            }

            objgtetutorialmaster.type = ddlType.SelectedValue;
            objgtetutorialmaster.title = txtDescription.Value;
            objgtetutorialmaster.status = 1;
            if (!ddlType.SelectedValue.ToString().Equals("video", StringComparison.OrdinalIgnoreCase) && (FileUpload.HasFile || !string.IsNullOrEmpty(hidDocumentPath.Value)))
            {
                if (FileUpload.HasFile)
                {
                    string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/GteTutorial";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
                    string filePath = string.Concat(dirPath, "/", fileName);
                    DirectoryInfo di = new DirectoryInfo(dirPath);
                    if (!di.Exists)
                        di.Create();
                    FileUpload.PostedFile.SaveAs(filePath);
                    objgtetutorialmaster.documentpath = fileName;
                    objgtetutorialmaster.videourl = "";
                }
            }
            else
            {
                var value = txtVideourl.Value;
                var videoURL = value.Substring(value.LastIndexOf("=") + 1);
                objgtetutorialmaster.videourl = videoURL;
                objgtetutorialmaster.documentpath = "";
            }
            objgtetutorialmaster.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            if (mode == "new")
                db.gte_tutorialmaster.Add(objgtetutorialmaster);
            db.SaveChanges();
            lblMessage.Text = "Saved Successfully";
            lblMessage.Visible = true;
            Response.Redirect(webURL + "gtetutorialmaster.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }

    }

}