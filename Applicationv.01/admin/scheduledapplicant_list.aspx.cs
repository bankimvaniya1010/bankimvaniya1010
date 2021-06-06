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
    public string roleName = string.Empty;
    int UniversityID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
            BindGrid();

    }

    private void BindGrid()
    {
        try
        {
            dynamic StudentList;
            if (roleName.ToLower() == "gte admin" || roleName.ToLower() == "gte user")
            {
                StudentList = (from q in db.applicant_meeting_schedule
                                   join um in db.university_master on q.university_id equals um.universityid
                                   join ad in db.applicantdetails on q.applicant_id equals ad.applicantid
                                   join prom in db.proctor_master on q.proctor_id equals prom.proctorID into procdata
                                   from x in procdata.DefaultIfEmpty()
                                   where q.is_meetingtime_expires == null && ad.universityid == q.university_id && q.university_id == UniversityID
                                   select new
                                   {
                                       id = q.id,
                                       applicant_id = q.applicant_id,
                                       applicantname = ad.firstname + " " + ad.lastname,
                                       universityID = q.university_id,
                                       UniversityName = um.university_name,
                                       utc_meeting_time = q.utc_meeting_time,
                                       applicant_time_zone = q.applicant_time_zone,
                                       otp = q.proctor_id == null ? "wait for proctor to be assign" : q.otp,
                                       proctorname = string.IsNullOrEmpty(x.name) ? "" : x.name,
                                       proctorEmail = string.IsNullOrEmpty(x.email) ? "" : x.email,
                                       proctorMobile = string.IsNullOrEmpty(x.mobile) ? "" : x.mobile,
                                       meetingInfo = q.virtualmeetinginfo,
                                   }).OrderByDescending(x => x.id).ToList();

            }
            else {
                 StudentList = (from q in db.applicant_meeting_schedule
                                   join um in db.university_master on q.university_id equals um.universityid
                                   join ad in db.applicantdetails on q.applicant_id equals ad.applicantid 
                                   join prom in db.proctor_master on q.proctor_id equals prom.proctorID into procdata
                                   from x in procdata.DefaultIfEmpty()
                                   where q.is_meetingtime_expires == null && ad.universityid == q.university_id
                                   select new
                                   {
                                       id = q.id,
                                       applicant_id = q.applicant_id,
                                       applicantname = ad.firstname + " " + ad.lastname,
                                       universityID = q.university_id,
                                       UniversityName = um.university_name,
                                       utc_meeting_time = q.utc_meeting_time,
                                       applicant_time_zone = q.applicant_time_zone,
                                       otp = q.proctor_id == null ? "wait for proctor to be assign" : q.otp,
                                       proctorname = string.IsNullOrEmpty(x.name) ? "" : x.name,
                                       proctorEmail = string.IsNullOrEmpty(x.email) ? "" : x.email,
                                       proctorMobile = string.IsNullOrEmpty(x.mobile) ? "" : x.mobile,
                                       meetingInfo = q.virtualmeetinginfo,
                                   }).OrderByDescending(x => x.id).ToList();
            }
            
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

    protected void gvapplicantlist_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvapplicantlist.EditIndex = -1;
        BindGrid();
    }

    protected void gvapplicantlist_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Update")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int applicantID = Convert.ToInt32(gvapplicantlist.DataKeys[index].Value);

                GridViewRow row = gvapplicantlist.Rows[index];
                TextBox txtproctorname = (TextBox)row.FindControl("txtproctorname") as TextBox;
                TextBox txtproctorEmail = (TextBox)row.FindControl("txtproctorEmail") as TextBox;
                TextBox txtproctorMobile = (TextBox)row.FindControl("txtproctorMobile") as TextBox;
                TextBox txtmeetingInfo = (TextBox)row.FindControl("txtmeetingInfo") as TextBox; 
                Label lbluniversityID = (Label)row.FindControl("lbluniversityID") as Label;

                int universityID = Convert.ToInt32(lbluniversityID.Text);
                var mode = "update";
                var applicantinfo = (from cInfo in db.applicant_meeting_schedule
                                     where cInfo.applicant_id == applicantID && cInfo.university_id == universityID && cInfo.is_meetingtime_expires == null
                                     select cInfo).FirstOrDefault();
                applicant_meeting_schedule objmapping = new applicant_meeting_schedule();
                if (applicantinfo != null)
                {
                    mode = "update";
                    objmapping = applicantinfo;
                }

                //objmapping.proctorname = txtproctorname.Text.Trim();
                //objmapping.proctoremail = txtproctorEmail.Text.Trim();
                //objmapping.proctormobile = txtproctorMobile.Text.Trim();
                objmapping.virtualmeetinginfo = txtmeetingInfo.Text.Trim();
                if (mode == "new")
                    db.applicant_meeting_schedule.Add(objmapping);
                gvapplicantlist.EditIndex = -1;
                db.SaveChanges();
                BindGrid();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void gvapplicantlist_RowEditing(object sender, GridViewEditEventArgs e)
    {

        gvapplicantlist.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvapplicantlist_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
    }

    protected void gvapplicantlist_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvapplicantlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvapplicantlist_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void gvapplicantlist_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (roleName.ToLower() == "gte admin" || roleName.ToLower() == "gte user")
        {
            
               ((DataControlField)gvapplicantlist.Columns
                .Cast<DataControlField>()
                .Where(fld => fld.HeaderText == "OTP")
                .SingleOrDefault()).Visible = false;

            ((DataControlField)gvapplicantlist.Columns
                .Cast<DataControlField>()
                .Where(fld => fld.HeaderText == "Assign")
                .SingleOrDefault()).Visible = false;
        }
    }

    //protected void ddlApplicantID_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlApplicantID.SelectedValue != "0")
    //    {
    //        int cityid = Convert.ToInt32(ddlApplicantID.SelectedValue);
    //        BindGrid(0, 0, cityid);
    //    }
    //}

    //protected void ddlProctorID_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlCity.SelectedValue != "0")
    //    {
    //        int cityid = Convert.ToInt32(ddlCity.SelectedValue);
    //        BindGrid(0, 0, cityid);
    //    }
    //}

    //protected void ddlProctorName_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlCity.SelectedValue != "0")
    //    {
    //        int cityid = Convert.ToInt32(ddlCity.SelectedValue);
    //        BindGrid(0, 0, cityid);
    //    }
    //}
}