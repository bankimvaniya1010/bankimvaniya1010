using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_videoupload : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    public string webURL = String.Empty;
    int universityID;
    string roleName = string.Empty;
    int ifdeleteclick = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            BindUploaded();
            if (ifdeleteclick == 0)
            {
                HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;
                if (httpPostedFile.Count > 0)
                    uploadVideo(httpPostedFile[0], HttpContext.Current.Request["doc_name"]);
            }
        }        
    }

    private void uploadVideo(HttpPostedFile httpPostedFile, string docName) {
        try
        {
            var mode = "new";
            admin_videomaster objmapping = new admin_videomaster();

            string sectioname = txtsectinname.Value;
            var Data = (from tInfo in db.admin_videomaster
                        where tInfo.sectioname == sectioname
                        select tInfo).FirstOrDefault();

            if (Data != null)
            {
                mode = "update";
                objmapping = Data;
            }

            objmapping.sectioname = docName;
            //objmapping.type = Convert.ToInt32(ddltype.SelectedValue);
            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/AdminHelpingVideo";
            string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(httpPostedFile.FileName));
            string filePath = string.Concat(dirPath, "/", fileName);
            DirectoryInfo di = new DirectoryInfo(dirPath);
            if (!di.Exists)
                di.Create();
            httpPostedFile.SaveAs(filePath);
            objmapping.videopath = fileName;

            //if (FileUpload.HasFile)
            //{
            //    string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/AdminHelpingVideo";
            //    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
            //    string filePath = string.Concat(dirPath, "/", fileName);
            //    DirectoryInfo di = new DirectoryInfo(dirPath);
            //    if (!di.Exists)
            //        di.Create();
            //    FileUpload.PostedFile.SaveAs(filePath);
            //    objmapping.videopath = fileName;
            //}

            if (mode == "new")
                db.admin_videomaster.Add(objmapping);
            db.SaveChanges();
            BindUploaded();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    //protected void btn_submit_Click(object sender, EventArgs e)
    //{
    //    try {
    //        var mode = "new";
    //        admin_videomaster objmapping = new admin_videomaster();

    //        string sectioname = txtsectinname.Value;
    //        var Data = (from tInfo in db.admin_videomaster
    //                            where tInfo.sectioname == sectioname
    //                            select tInfo).FirstOrDefault();

    //        if (Data != null)
    //        {
    //            mode = "update";
    //            objmapping = Data;
    //        }

    //        objmapping.sectioname = txtsectinname.Value;
            
            
    //        if (FileUpload.HasFile)
    //        {
    //            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/AdminHelpingVideo";
    //            string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
    //            string filePath = string.Concat(dirPath, "/", fileName);
    //            DirectoryInfo di = new DirectoryInfo(dirPath);
    //            if (!di.Exists)
    //                di.Create();
    //            FileUpload.PostedFile.SaveAs(filePath);
    //            objmapping.videopath= fileName;
    //        }
           
    //        if (mode == "new")
    //            db.admin_videomaster.Add(objmapping);
    //        db.SaveChanges();
    //        BindUploaded();
    //    }
    //    catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    //}

    private void BindUploaded()
    {
        try {
            var List = (from av in db.admin_videomaster
                        select new {
                            videoID = av.videoID,
                            sectioname = av.sectioname,
                            videopath = webURL + "Docs/AdminHelpingVideo/"+av.videopath,
                        }).ToList();
                db.admin_videomaster.ToList();

            if (List != null)
            {
                grid.DataSource = List;
                grid.DataBind();
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void grid_DataBound(object sender, EventArgs e)
    {

    }


    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[4].Controls[0];
                    if (lb != null)
                    {
                        //attach the JavaScript function with the ID as the paramter
                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            ifdeleteclick = 1;
            int ID = Convert.ToInt32(grid.DataKeys[e.RowIndex].Values[0]);
            admin_videomaster objID = db.admin_videomaster.Where(b => b.videoID == ID).First();
            
            var isVideomapped = db.universitywise_admin_video_mapping.Where(d => d.videoID == ID).ToList();
           
            if (isVideomapped.Count == 0)
            {
                db.admin_videomaster.Remove(objID);
                db.SaveChanges();
                BindUploaded();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Video as its already assign to Institution.')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindUploaded();
    }
}