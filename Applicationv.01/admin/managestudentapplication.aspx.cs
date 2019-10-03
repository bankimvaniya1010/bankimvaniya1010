using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_managestudentapplication : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var applicantList = db.applicationmaster.Where(x => x.universityid == universityID).Select(x => x.applicantid).Distinct().ToList();
            List<object> list = new List<object>();
            foreach (var applicant in applicantList)
            {
                var details = db.applicantdetails.Where(x => x.applicantid == applicant.Value && x.universityid == universityID).FirstOrDefault();
                var obj = new { details.applicantid, name = details.firstname + " " + details.lastname, details.nationality };
                list.Add(obj);
            }
            gvApplications.DataSource = list;
            gvApplications.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void gvApplications_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int applicantID = Convert.ToInt32(e.CommandArgument);
        Response.Redirect("~/admin/processstudentapplication.aspx?applicantId=" + applicantID + "&universityId=" + universityID);
    }
}