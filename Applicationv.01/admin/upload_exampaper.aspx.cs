using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_upload_exampaper : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    public int selectuniversity, UserID, exampapersid, selectedexaminerId;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected List<exampapers_master> exampapers_master = new List<exampapers_master>();
    dynamic exammasterdata;
    public int uploadtype;
    public dynamic data = null;
    public List<details> videoList = new List<details>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (Session["exampapersid"] != null)
            exampapersid = Convert.ToInt32(Session["exampapersid"]);
        else {
            if ((Request.QueryString["exampapersid"] == null) || (Request.QueryString["exampapersid"].ToString() == ""))
            {            
                Response.Redirect(webURL + "admin/default.aspx", true);
            }
            else
            {
                exampapersid = Convert.ToInt32(Request.QueryString["exampapersid"]);
                Session["exampapersid"] = exampapersid;
            }
        }

        exampapers_master = db.exampapers_master.Where(x => x.exampapersid == exampapersid).ToList();
        exammasterdata = db.exam_master.Where(x => x.exampapersid == exampapersid).FirstOrDefault();
        selectuniversity = exammasterdata.universityID;
        selectedexaminerId = exammasterdata.examinerId;
        
        docPath = docPath + "/Exammodule/" + selectuniversity + "/" + exampapersid;
        if (exammasterdata.uploadtype == 1)
        {
            uploadtype = 1;
            uploadpaperDiv.Attributes.Add("style", "display:block;");
            lbl1.InnerText = "*The file formats you can upload are - .jpg, .png, .jpeg";
            BindDocuments();
        }
        else if (exammasterdata.uploadtype == 2)
        {
            uploadtype = 2;
            buildinpaperDiv.Attributes.Add("style", "display:block;");
            btnupload.Attributes.Add("style", "display:none;");
        }
        else if (exammasterdata.uploadtype == 3)
        {
            BindDocuments();
            uploadtype = 3;
            uploadpaperDiv.Attributes.Add("style", "display:block;");
            lbl1.InnerText = "*The file formats you can upload is .pdf";
            if (exampapers_master.Count > 0)
            {
                div1.Attributes.Add("style", "display:none");
                showdivfield.Attributes.Add("style", "display:none");
                btnupload.Visible = false;
            }
            else
            {
                div1.Attributes.Add("style", "display:block");
                showdivfield.Attributes.Add("style", "display:block");
                btnupload.Visible = true;
            }
        }
        if (exampapers_master.Count > 0)
            btnupload.Text = "Upload More";
        else
            btnupload.Text = "Upload";

        //HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;
        //if (httpPostedFile.Count > 0)
        //{
        //    for (int i = 0; i < httpPostedFile.Count; i++)
        //    {
        //        uploadVideo(httpPostedFile[i]);
        //    }
        //}
           
    }

    //protected void uploadVideo(HttpPostedFile httpPostedFile)
    //{
    //    try
    //    {
    //        var mode = "new";
    //        var data = (from vInfo in db.exampapers_master
    //                    where vInfo.universityID == selectuniversity
    //                    select vInfo).FirstOrDefault();

            
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.StackTrace.ToString());
    //    }
    //}

    public class details1 {
        public int questionid { get; set; }
        public string question { get; set; }
        public string questionpath { get; set; }
        public string questiontype { get; set; }
    }  

    private void BindField(string typeid , int universityid, int examinerid)
    {        
        try
        {
            if (typeid == "MCQ")
                data = (from um in db.exam_mcq_questionmaster
                        where um.universityID == selectuniversity && um.examinerId == examinerid
                        select new details1()
                        {
                            questionid = um.questionID,
                            question = um.question,
                            questiontype=null,
                        }).ToList();            
            else if (typeid == "True/False")
                data = (from um in db.exam_truefalse_questionmaster
                        where um.universityID == selectuniversity && um.examinerId == examinerid
                        select new details1()
                        {
                            questionid = um.questionId,
                            question = um.question,
                            questiontype = null,
                        }).ToList();          
            else if (typeid == "Open Answer")
                data = (from um in db.exam_openanswer_master
                        where um.universityid == selectuniversity && um.examinerid == examinerid
                        select new details1()
                        {
                            questionid = um.questionid,
                            question = um.question,
                            questiontype = null,
                        }).ToList();
           
            else if (typeid == "Upload Answer")
            {
                data = (from um in db.exam_uploadanswer_master
                        where um.univesityid == selectuniversity && um.examinerid == examinerid
                        select new details1()
                        {
                            questionid = um.questionid,
                            question = um.questiondescription,
                            questionpath = webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/" + um.questionpath,
                            questiontype = "uploadasnwer",
                        }).ToList();
               
            }
            else if (typeid == "")
                chkquestion.Items.Clear();
            chkquestion.DataSource = data;
            chkquestion.DataTextField = "question";
            chkquestion.DataValueField = "questionid";
            chkquestion.DataBind();
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    private void BindPresected(string typeid, int universityId, int examinerid )
    {
        try
        {
            string typeID = ddlquestiontype.SelectedValue;
            int examinerID = selectedexaminerId;
            chkquestion.Items.Clear();            
            BindField(typeID, universityId, examinerID);
            dynamic universityWise= null;
            if (typeID == "MCQ")
                universityWise = (from eb in db.exampapers_master
                              join mcq in db.exam_mcq_questionmaster on eb.questionId equals mcq.questionID
                             where eb.universityID == universityId && eb.examinerid == examinerID && eb.exampapersid == exampapersid && eb.questiontype == "MCQ"
                                  select new
                                  {
                                      questionId = eb.questionId,
                                      questiontype = "mcq",
                                      question = mcq.question,
                                  }).ToList();
            else if (typeID == "True/False")
                universityWise = (from eb in db.exampapers_master
                                  join mcq in db.exam_truefalse_questionmaster on eb.questionId equals mcq.questionId
                                  where eb.universityID == universityId && eb.examinerid == examinerID && eb.exampapersid == exampapersid && eb.questiontype == "True/False"
                                  select new
                                  {
                                      questionId = eb.questionId,
                                      questiontype = "mcq",
                                      question = mcq.question,
                                  }).ToList();
            else if (typeID == "Open Answer")
                universityWise = (from eb in db.exampapers_master
                                  join mcq in db.exam_openanswer_master on eb.questionId equals mcq.questionid
                                  where eb.universityID == universityId  && eb.exampapersid == exampapersid && mcq.examinerid == examinerID && eb.questiontype == "Open Answer"
                                  select new
                                  {
                                      questionId = eb.questionId,
                                      questiontype = "mcq",
                                      question = mcq.question,
                                  }).ToList();
            else if (typeID == "Upload Answer")
                universityWise = (from eb in db.exampapers_master
                                  join mcq in db.exam_uploadanswer_master on eb.questionId equals mcq.questionid
                                  where eb.universityID == universityId && eb.examinerid == examinerID && eb.exampapersid == exampapersid && eb.questiontype == "Upload Answer"
                                  select new {
                                      questionId= eb.questionId,
                                      questiontype = "mcq",
                                      question= mcq.questiondescription,
                                  }).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                
                chkquestion.Items.FindByText(universityWise[k].question).Selected = true;
                chkquestion.Items.FindByText(universityWise[k].question).Enabled = false;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        try
        {
            exampapers_master objmapping = new exampapers_master();
            if (exammasterdata.uploadtype == 1 || exammasterdata.uploadtype == 3)
            {

                if (FileUpload.HasFiles)
                {
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(FileUpload.PostedFile.FileName);
                    string filename = Guid.NewGuid() + extension;
                    FileUpload.PostedFile.SaveAs(System.IO.Path.Combine(docPath, filename));

                    objmapping.exampaper_path = filename;
                }
                if (extrasheet_FileUpload.HasFile)
                {
                    string path = docPath + "/ExtraSheet/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(extrasheet_FileUpload.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    extrasheet_FileUpload.PostedFile.SaveAs(filePath);
                    objmapping.extrasheetpath = fileName;
                }
                if (audiofile_FileUpload.HasFile)
                {
                    string path1 = docPath + "/AnyFile/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(audiofile_FileUpload.PostedFile.FileName));
                    string filePath = string.Concat(path1, fileName);
                    if (!Directory.Exists(path1))
                        Directory.CreateDirectory(path1);
                    audiofile_FileUpload.PostedFile.SaveAs(filePath);
                    objmapping.audiovideofilepath = fileName;
                }

                if (chkview.Checked == true)
                    objmapping.is_audiovideofile_onetimeview = 1;
                else
                    objmapping.is_audiovideofile_onetimeview = null;

                objmapping.universityID = selectuniversity;
                objmapping.exampapersid = exampapersid;
                objmapping.fileinstruction = txtfileinstruction.Text;
                objmapping.examinerid = selectedexaminerId;
                db.exampapers_master.Add(objmapping);
                db.SaveChanges();
                BindDocuments();
                if (exammasterdata.uploadtype == 3)
                {
                    div1.Attributes.Add("style", "display:none");
                    showdivfield.Attributes.Add("style", "display:none");
                    btnupload.Visible = false;
                }
                txtfileinstruction.Text = "";
                chkview.Checked = false;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record Saved successfully.');window.location='" + Request.ApplicationPath + "admin/upload_exampaper.aspx?exampapersid='" + exampapersid + "';", true);

            }
            else if (exammasterdata.uploadtype == 2)
            {

                foreach (ListItem li in chkquestion.Items)
                {
                    if (li.Selected)
                    {
                        string questiontype = ddlquestiontype.SelectedValue;
                        int questionId = Convert.ToInt32(li.Value);
                        var datadownloadsheet_viewonce = db.exam_uploadanswer_master.Where(x => x.questionid == questionId).Select(x => x.ischeckonce).FirstOrDefault();
                        var mode = "new";
                        var exsisting = db.exampapers_master.Where(x => x.universityID == selectuniversity && x.questionId == questionId && x.questiontype == questiontype && x.exampapersid == exampapersid).FirstOrDefault();
                        if (exsisting != null)
                        {
                            mode = "update";
                            exsisting = objmapping;
                        }

                        objmapping.examinerid = selectedexaminerId;
                        objmapping.questiontype = ddlquestiontype.SelectedValue;
                        objmapping.questionId = questionId;
                        objmapping.exampapersid = exampapersid;
                        objmapping.universityID = selectuniversity;
                        objmapping.is_audiovideofile_onetimeview = datadownloadsheet_viewonce;
                        if (mode == "new")
                        {
                            db.exampapers_master.Add(objmapping);
                            db.SaveChanges();
                        }
                    }
                }
                ddlquestiontype.ClearSelection();
                chkquestion.Items.Clear();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved')", true);
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void BindDocuments()
    {

        var videoList = (from x in db.exampapers_master
                         where x.exampapersid == exampapersid && x.universityID == selectuniversity
                         select new {

                             paperID = x.exampapersid,
                             papersheetID = x.id,
                             exampaper_path = webURL + "Docs/Exammodule/" + selectuniversity + "/" + exampapersid + "/" + x.exampaper_path,
                             extrasheetpath = x.extrasheetpath == null ? null : webURL + "Docs/Exammodule/" + selectuniversity + "/" + exampapersid + "/ExtraSheet/" + x.extrasheetpath,
                             audiovideofilepath = x.audiovideofilepath == null ? null : webURL + "Docs/Exammodule/" + selectuniversity + "/" + exampapersid + "/AnyFile/" + x.audiovideofilepath,
                             audiovideofile_tobeviewed = x.is_audiovideofile_onetimeview == null ? "No" : "Yes",
                             check = x.is_audiovideofile_onetimeview == null ? 0 : 1,
                     }).ToList();

        if (videoList != null)
        {
            grid.DataSource = videoList;
            grid.DataBind();
        }
    }

    public class details {
        public int? paperID;
        public int papersheetID;
        public string exampaper_path;
        public string extrasheetpath;
        public string audiovideofilepath;
    }

    protected void ddlquestiontype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string typeid = ddlquestiontype.SelectedValue;
        BindField(typeid, selectuniversity, selectedexaminerId);
        BindPresected(typeid, selectuniversity, selectedexaminerId);
        btnupload.Attributes.Add("style", "display:block;");
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/exam_scheduleList.aspx", true);
    }

    protected void grid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            grid.EditIndex = -1;
            BindDocuments();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
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
                    LinkButton lb = (LinkButton)e.Row.Cells[5].Controls[0];
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
            int ID = Convert.ToInt32(grid.DataKeys[e.RowIndex].Values[0]);
            exampapers_master objID = db.exampapers_master.Where(b => b.id == ID).First();
            int? exampaperid = objID.exampapersid;
            var isexamassign = db.exam_assign.Where(d => d.exampapersid == exampaperid).ToList();
            var isexamschedule = db.exam_schedule.Where(c => c.exampapersid == exampaperid).ToList();
            if (isexamassign.Count == 0)
            {
                if (isexamschedule.Count == 0) {
                    db.exampapers_master.Remove(objID);
                    db.SaveChanges();

                    if (exammasterdata.uploadtype == 3)
                    {
                        div1.Attributes.Add("style", "display:block");
                        showdivfield.Attributes.Add("style", "display:block");
                        btnupload.Visible = true;
                    }
                    BindDocuments();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record Deleted successfully.');window.location='" + Request.ApplicationPath + "admin/upload_exampaper.aspx?exampapersid='" + exampapersid + "'';", true);
                   
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this assessment as the selected exam is already assign to applicant.')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this assessment as the selected exam is already scheduled.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid.EditIndex = e.NewEditIndex;
        BindDocuments();
    }

    protected void grid_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            FileUpload fileupload = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload");
            FileUpload fileupload_extra = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload_extra");
            FileUpload fileupload_file = (FileUpload)grid.Rows[e.RowIndex].FindControl("fileupload_file");
            CheckBox checkBox = (CheckBox)grid.Rows[e.RowIndex].FindControl("chkactive") as CheckBox;

            var mode = "new";
            int papersheetID = Convert.ToInt32(grid.DataKeys[e.RowIndex].Values[0]);

            exampapers_master objmapping = new exampapers_master();
            var data = db.exampapers_master.Where(b => b.id == papersheetID).First();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }

            if (fileupload.HasFiles)
            {
                string dirPath = docPath;
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload.PostedFile.FileName));
                string filePath = string.Concat(dirPath, "/", fileName);
                DirectoryInfo di = new DirectoryInfo(dirPath);
                if (!di.Exists)
                    di.Create();
                fileupload.PostedFile.SaveAs(filePath);
                objmapping.exampaper_path = fileName;
            }
            if (fileupload_extra.HasFile)
            {
                string path = docPath + "/ExtraSheet/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload_extra.PostedFile.FileName));
                string filePath = string.Concat(path, fileName);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                fileupload_extra.PostedFile.SaveAs(filePath);
                objmapping.extrasheetpath = fileName;
            }
            if (fileupload_file.HasFile)
            {
                string path1 = docPath + "/AnyFile/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload_file.PostedFile.FileName));
                string filePath = string.Concat(path1, fileName);
                if (!Directory.Exists(path1))
                    Directory.CreateDirectory(path1);
                fileupload_file.PostedFile.SaveAs(filePath);
                objmapping.audiovideofilepath = fileName;
            }
            if (checkBox.Checked == true)
                objmapping.is_audiovideofile_onetimeview = 1;
            else
                objmapping.is_audiovideofile_onetimeview = null;

            grid.EditIndex = -1;
            if (mode == "new")
                db.exampapers_master.Add(objmapping);
            db.SaveChanges();
            BindDocuments();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindDocuments();
    }

    protected void grid_DataBound(object sender, EventArgs e)
    {

    }
}