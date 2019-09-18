using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class admin_scrfileupload : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string scrPath = System.Configuration.ConfigurationManager.AppSettings["ScrFilePath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (avatar.HasFile)  //fileupload control contains a file  
            try
            {
                if (!Directory.Exists(scrPath))
                    Directory.CreateDirectory(scrPath);
                avatar.SaveAs(scrPath + avatar.FileName);          // file path where you want to upload  
                lblMessgae.Text = "File Uploaded Sucessfully !! " + avatar.PostedFile.ContentLength + "mb";     // get the size of the uploaded file  
            }
            catch (Exception ex)
            {
                lblMessgae.Text = "File Not Uploaded!!" + ex.Message.ToString();
                objLog.WriteLog(ex.ToString());
            }
        else
        {
            lblMessgae.Text = "Please Select File and Upload Again";

        }
    }
}