using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supportservicemaster : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    supportservicemaster objsupportservicemaster = new supportservicemaster();
    int universityID;
    int serviceId;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            serviceId = -1;
            if (int.TryParse(Request.QueryString["id"], out serviceId))
            {
                objsupportservicemaster = db.supportservicemaster.Where(obj => obj.supportservicemasterId == serviceId).FirstOrDefault();
                if (objsupportservicemaster == null)
                    serviceId = -1;
            }
        }
        if (!IsPostBack)
        {   
            if (objsupportservicemaster != null)
                PopulateServiceInfo();
        }
    }

    private void PopulateServiceInfo()
    {
        try
        {
            var serviceData = (from sInfo in db.supportservicemaster
                                where sInfo.supportservicemasterId == serviceId
                                select sInfo).FirstOrDefault();
            if (serviceData != null)
            {
                txtservicetype.Value = serviceData.servicetype;
                txtprovidername.Value = serviceData.serviceprovider_name;
                txtprovidercontactnno.Value = serviceData.serviceprovider_phonenumber;
                txtprovideremail.Value = serviceData.serviceprovider_email;
                txtdescription.Value = serviceData.description;
                hidDocumentPath.Value = serviceData.imagepath;
                uploadedFile.NavigateUrl = webURL + "/Docs/" + serviceData.imagepath;
                uploadedFile.Text = "View File";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btn_saveData_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            if (serviceId != -1)
            {
                var serviceData = (from sInfo in db.supportservicemaster
                                    where sInfo.supportservicemasterId == serviceId
                                    select sInfo).FirstOrDefault();

                if (serviceData != null)
                {
                    mode = "update";
                    objsupportservicemaster = serviceData;
                }
            }

            objsupportservicemaster.servicetype = txtservicetype.Value;
            objsupportservicemaster.serviceprovider_name = txtprovidername.Value;
            objsupportservicemaster.serviceprovider_email = txtprovideremail.Value;
            objsupportservicemaster.serviceprovider_phonenumber = txtprovidercontactnno.Value;
            objsupportservicemaster.description = txtdescription.Value;

            if (FileUpload.HasFile)
            {
                string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(FileUpload.PostedFile.FileName));
                string filePath = string.Concat(dirPath, "/", fileName);
                DirectoryInfo di = new DirectoryInfo(dirPath);
                if (!di.Exists)
                    di.Create();
                FileUpload.PostedFile.SaveAs(filePath);
                objsupportservicemaster.imagepath= fileName;                
            }
            if (mode == "new")
                db.supportservicemaster.Add(objsupportservicemaster);
            db.SaveChanges();
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
        Response.Redirect(webURL + "admin/supportservicelisting.aspx", true);
    }
}