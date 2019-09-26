using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitywiserejectionreasonmapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            BindUniversity();
            BindReason();
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
    private void BindReason()
    {
        try
        {   
            var reason = db.rejection_reasonmaster.ToList();
            chkrejectionreason.DataSource = reason;
            chkrejectionreason.DataTextField = "description";
            chkrejectionreason.DataValueField = "id";
            chkrejectionreason.DataBind();             
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        int adminId = 0;
        int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);

        var objUser = (adminusers)Session["LoginInfo"];
        adminId = objUser.adminid;

        IEnumerable<universitywise_rejectionreasonmapping> list = db.universitywise_rejectionreasonmapping.Where(x => x.universityid == UniversityID).ToList();
        db.universitywise_rejectionreasonmapping.RemoveRange(list);
        db.SaveChanges();

        foreach (ListItem li in chkrejectionreason.Items)
        {
            if (li.Selected)
            {
                int reasonValueid = Convert.ToInt16(li.Value);
                universitywise_rejectionreasonmapping mappingObj = new universitywise_rejectionreasonmapping();
                mappingObj.universityid = UniversityID;
                mappingObj.reasonid = reasonValueid;
                mappingObj.created_by = adminId;                
                db.universitywise_rejectionreasonmapping.Add(mappingObj);
                db.SaveChanges();
            }

        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int universityId = Convert.ToInt16(ddlUniversity.SelectedValue);
        var universityWise = db.universitywise_rejectionreasonmapping.Where(x => x.universityid == universityId).ToList();
        for (int k = 0; k < universityWise.Count; k++)
        {
            chkrejectionreason.Items.FindByValue(universityWise[k].reasonid.ToString()).Selected = true;
        }
    }
}