using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_studentstatus : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        userID = Convert.ToInt32(Session["UserID"]);

        if ((Request.QueryString["userid"] == null) || (Request.QueryString["userid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            ApplicantID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        if (!IsPostBack)
            PrefillValue();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var applicant = db.applicantdetails.Where(x => x.applicantid == ApplicantID).FirstOrDefault();
        if (applicant != null)
        {
            if (ddlSegment.SelectedItem.Value != "")
                applicant.studentsegment = ddlSegment.SelectedItem.Value;
            if (ddlStatus.SelectedItem.Value != "")
                applicant.studentstatus = Convert.ToInt32(ddlStatus.SelectedItem.Value);
            db.SaveChanges();
        }
    }

    private void PrefillValue()
    {
        var applicant = db.applicantdetails.Where(x => x.applicantid == ApplicantID).FirstOrDefault();
        string segment = "";
        int status = 0;
        if (applicant != null)
        {
            if (!string.IsNullOrEmpty(applicant.studentsegment))
            {
                segment = applicant.studentsegment;
                var item = ddlSegment.Items.FindByText(segment);
                if (item != null)
                    item.Selected = true;
            }
            if (applicant.studentstatus != null)
            {
                status = Convert.ToInt32(applicant.studentstatus);
                var item = ddlStatus.Items.FindByText(status.ToString());
                if (item != null)
                    item.Selected = true;
            }
        }

    }
}