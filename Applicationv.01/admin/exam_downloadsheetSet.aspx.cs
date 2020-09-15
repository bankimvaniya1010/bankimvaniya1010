using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_downloadsheetSet : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

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
            BindUniversity();
           //BindDocuments(selecteduniversityid, selectedexaminerId);
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

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniversityid);
    }

    private void BindExaminer(int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x => x.universityId == universityId && x.roleid == 9).ToList();
            ddlexaminer.DataSource = examinerId;
            ddlexaminer.DataTextField = "name";
            ddlexaminer.DataValueField = "examinerID";
            ddlexaminer.DataBind();
            ddlexaminer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        uploadpaperDiv.Attributes.Add("style", "display:none");
        txtpasskey.Value = "";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedexaminerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                uploadpaperDiv.Attributes.Add("style", "display:block");
                validate.Attributes.Add("style", "display:none");
                //BindGrid(selecteduniversityid, selectedexaminerId);
                BindDocuments(selecteduniversityid, selectedexaminerId);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnupload_Click1(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);

            exam_uploadanswer_master objmapping = new exam_uploadanswer_master();
            docPath = docPath + "/Exammodule/questionBankType4/" + selecteduniversityid + "/" + selectedexaminerId;
            if (FileUpload.HasFiles)
            {
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(FileUpload.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                FileUpload.PostedFile.SaveAs(System.IO.Path.Combine(docPath, filename));

                objmapping.questionpath = filename;
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
                objmapping.extrafilepath = fileName;
            }
            if (uploadcheckingfile.HasFiles)
            {
                string path2 = docPath + "/evalutionfile/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(uploadcheckingfile.PostedFile.FileName));
                string filePath = string.Concat(path2, fileName);
                if (!Directory.Exists(path2))
                    Directory.CreateDirectory(path2);
                uploadcheckingfile.PostedFile.SaveAs(filePath);
                objmapping.checking_file = fileName;
            }
            objmapping.questiondescription = txtquestiondescription.Text;
            objmapping.univesityid = selecteduniversityid;
            objmapping.fileinstruction = txtfileinstruction.Text;
            objmapping.examinerid = selectedexaminerId;
            objmapping.marks = txtmarks.Value;
            objmapping.duration = txttime.Value;

            db.exam_uploadanswer_master.Add(objmapping);
            db.SaveChanges();
            BindDocuments(selecteduniversityid, selectedexaminerId);
            txtfileinstruction.Text = "";
            txtmarks.Value = "";
            txttime.Value = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindDocuments(int selectuniversity, int examinerid)
    {

        var List = db.exam_uploadanswer_master
            .Where(x => x.examinerid == examinerid && x.univesityid == selectuniversity)
            .Select(x => new
            {
                questionid = x.questionid,
                questiondescription = x.questiondescription,
                questionpath = webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/" + x.questionpath,
                extrasheetpath = x.extrasheetpath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/ExtraSheet/" + x.extrasheetpath,
                extrafilepath = x.extrafilepath == null ? null : webURL + "Docs/Exammodule/questionBankType4/" + selectuniversity + "/" + examinerid + "/AnyFile/" + x.extrafilepath,
                marks = x.marks,
                time = x.duration,
            }).ToList();
        rptVideo.DataSource = List;
        rptVideo.DataBind();

    }
}