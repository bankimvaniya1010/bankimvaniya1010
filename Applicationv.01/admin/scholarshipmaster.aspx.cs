using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_scholarshipmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    public static string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var scholarshipList = db.scholarships.ToList();
            foreach (var item in scholarshipList)
            {
                item.scholarship_form = "\\Docs\\Scholarship Forms\\" + item.scholarship_form;
                // set awarded by option
                if (item.awarded_by.Contains("University"))
                {
                    var universityId = Convert.ToInt32(Regex.Replace(item.awarded_by, "[^0-9]+", string.Empty));
                    item.awarded_by = db.university_master.Where(x => x.universityid == universityId).Select(x => x.university_name).FirstOrDefault();
                }
            }
            if (scholarshipList != null)
            {
                scholarshipGridView.DataSource = scholarshipList;
                scholarshipGridView.DataBind();
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnCreateScholarship_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/managescholarship.aspx");
    }

    protected void scholarshipGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int scholarshipId = Convert.ToInt32(scholarshipGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/managescholarship.aspx?scholarshipID=" + scholarshipId);
    }

    protected void scholarshipGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        scholarshipGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}