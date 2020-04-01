using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_scheduledapplicant_list : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    Common objCom = new Common();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();

    }

    private void BindGrid()
    {
        try
        {
            var StudentList = (from q in db.applicant_meeting_schedule
                               join um in db.university_master on q.university_id equals um.universityid
                               join ad in db.applicantdetails on q.applicant_id equals ad.applicantid
                               where q.is_meetingtime_expires == null
                               select new
                                {
                                    id = q.id,
                                    applicant_id = q.applicant_id,
                                    applicantname = ad.firstname + " " + ad.lastname,
                                    UniversityName = um.university_name,
                                    utc_meeting_time = q.utc_meeting_time,
                                    applicant_time_zone = q.applicant_time_zone,
                                    otp = string.IsNullOrEmpty(q.otp) ? "wait for otp to be genrate" : q.otp,
                                }).SortBy("applicant_id").ToList();
            if (StudentList != null)
            {
                gvapplicantlist.DataSource = StudentList;
                gvapplicantlist.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvapplicantlist_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvapplicantlist.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}