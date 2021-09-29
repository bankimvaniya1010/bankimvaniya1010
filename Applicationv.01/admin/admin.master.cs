using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    public int adminID = 0 , roleID = 0;    
    string webURL = String.Empty;
    public string roleName = string.Empty;
    public string fullservice = string.Empty, manageapplicationLink= string.Empty;
    public int? applicantid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        
        adminID = Convert.ToInt32(Session["UserID"].ToString());
        roleID= Convert.ToInt32(Session["Role"].ToString());
        string name = db.adminusers.Where(x => x.adminid == adminID).Select(x => x.name).FirstOrDefault();       
        lbladminname.Text = name;
        fullservice = Convert.ToString(Session["isfullservice"]);
        roleName = Utility.GetRoleName();
        
        int universityID = Utility.GetUniversityId();
        var applicant = db.applicantdetails.Where(x => x.universityid == universityID && x.isdeletedbyAdmin == false).OrderByDescending(x=>x.applicantid).ToList();
        if(applicant.Count > 0)
            applicantid = applicant.Select(x => x.applicantid).FirstOrDefault();
    }

}
