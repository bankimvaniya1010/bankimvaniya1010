using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitywisesupportservicemapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string roleName = string.Empty;
    int universityID = 0;
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
            BindService();
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
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindService()
    {
        try
        {
            var service = db.supportservicemaster.ToList();
            chkService.DataSource = service;
            chkService.DataTextField = "servicetype";
            chkService.DataValueField = "supportservicemasterId";
            chkService.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        chkService.Items.Clear();
        BindService();
        int universityId = Convert.ToInt16(ddlUniversity.SelectedValue);
        var universityWise = (from usm in db.universitywise_supportservicemapping
                              join sm in db.supportservicemaster on usm.supportserviceID equals sm.supportservicemasterId
                              where usm.universityid == universityId select usm).ToList();
        for (int k = 0; k < universityWise.Count; k++)
        {
            chkService.Items.FindByValue(universityWise[k].supportserviceID.ToString()).Selected = true;
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        int adminId = 0;
        int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);

        var objUser = (adminusers)Session["LoginInfo"];
        adminId = objUser.adminid;

        IEnumerable<universitywise_supportservicemapping> list = db.universitywise_supportservicemapping.Where(x => x.universityid == UniversityID).ToList();
        db.universitywise_supportservicemapping.RemoveRange(list);
        db.SaveChanges();

        foreach (ListItem li in chkService.Items)
        {
            if (li.Selected)
            {
                int Serviceid = Convert.ToInt16(li.Value);
                universitywise_supportservicemapping mappingObj = new universitywise_supportservicemapping();
                mappingObj.universityid = UniversityID;
                mappingObj.supportserviceID = Serviceid;
                mappingObj.created_by = adminId;
                db.universitywise_supportservicemapping.Add(mappingObj);
                db.SaveChanges();
            }

        }
    }
}