using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_registered_applicantlist : System.Web.UI.Page
{
    int roleID = 0, universityID = 0;
    string universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string roleName = string.Empty;
    public List<Details> applicant = new List<Details>();
    string webURL = String.Empty;
    private string constr, query;
    public int fullservice;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();
        fullservice = Convert.ToInt32(Session["isfullservice"]);
        roleID = Convert.ToInt32(Session["Role"]);
        if (!IsPostBack)
        {
            Bindlabel(universityID);
            BindApplicant();
        }
    }
    private void Bindlabel(int universityID) {
        int? studentcount_byuniveristy = db.university_master.Where(x => x.universityid == universityID).Select(x => x.numberof_applicant).FirstOrDefault();
        lbltotal.InnerText = studentcount_byuniveristy.ToString();

        int registeredapplicantcCount = db.applicantdetails.Where(x => x.universityid == universityID).ToList().Count;

        var availableApplicant_Count = studentcount_byuniveristy - registeredapplicantcCount;

        lblavailable.InnerText = availableApplicant_Count.ToString();

    }

    private void BindApplicant()
    {
        try
        {
            if (fullservice == 0)
            {
                applicant = (from gtead in db.applicantdetails

                             join s in db.students on gtead.applicantid equals s.studentid 

                             join u in db.university_master on gtead.universityid equals u.universityid

                             join sd in db.gte_applicantdetails on gtead.applicantid equals sd.applicantid into data
                             from sdata in data.DefaultIfEmpty()

                             join cm in db.countriesmaster on sdata.residencecountry equals cm.id into countrydata
                             from cmdata in countrydata.DefaultIfEmpty()

                             where gtead.universityid == universityID && s.isdeletedbyAdmin == false
                             select new Details()
                             {
                                 id = gtead.applicantid,
                                 applicantid = gtead.applicantid,
                                 universityId = u.universityid,
                                 university_name = u.university_name,
                                 firstname = gtead.firstname == null ? string.Empty : gtead.firstname,
                                 lastname = gtead.lastname == null ? string.Empty : gtead.lastname,
                                 email = gtead.email == null ? s.email : gtead.email,
                                 registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                                 mobile = gtead.mobileno == null ? string.Empty : gtead.mobileno,
                                 countryofresidence = cmdata.country_name == null ? string.Empty : cmdata.country_name,
                                 Status = "Prospect",
                                 approve = s.isverifiedbyAdmin == true ? "Approved" : "Pending",
                                 suspend = s.isdeletedbyAdmin == true?"Deleted":string.Empty,

                             }).Distinct().OrderByDescending(x => x.applicantid).ToList();
            }
            else
            {
                applicant = (from ad in db.applicantdetails


                             join cm in db.countriesmaster on ad.residentialcountry equals cm.id into cmdata
                             from c in cmdata.DefaultIfEmpty()

                             join gtesd in db.gte_applicantdetails on ad.applicantid equals gtesd.applicantid into gtestudentData
                             from sd in gtestudentData.DefaultIfEmpty()

                             join sm in db.students on ad.applicantid equals sm.studentid into studentData
                             from s in studentData.DefaultIfEmpty()

                             join um in db.university_master on ad.universityid equals um.universityid into umData
                             from u in umData.DefaultIfEmpty()

                             where ad.universityid == universityID && s.isdeletedbyAdmin == false
                             select new Details()
                             {
                                 id = ad.applicantid,
                                 applicantid = ad.applicantid,
                                 universityId = u.universityid,
                                 university_name = u.university_name,
                                 firstname = ad.firstname == null ? string.Empty : ad.firstname,
                                 lastname = ad.lastname == null ? string.Empty : ad.lastname,
                                 email = ad.email == null ? s.email : ad.email,
                                 registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                                 mobile = ad.mobileno == null ? string.Empty : ad.mobileno,
                                 countryofresidence = c.country_name == null ? string.Empty : c.country_name,
                                 Status = "Prospect",
                                 approve = s.isverifiedbyAdmin == true ? "Approved" : "Pending",
                                 suspend = s.isdeletedbyAdmin == true ? "Deleted" : string.Empty,

                             }).Distinct().OrderByDescending(x => x.applicantid).ToList();
            }
            //Starts filling up any form - Applicant
            foreach (var item in applicant)
            {
                var personalDetails = db.applicantdetails.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                var educationDetails = db.applicanteducationdetails.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                var languageCompetency = db.applicantlanguagecompetency.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                var courseData = db.applicationmaster.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                var applicationmaster = db.applicationmaster.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).ToList();
                var applicationStatus = db.application_status_master.AsNoTracking().Select(x => new { x.id, x.status_description });

                if (personalDetails != null && (personalDetails.ispersonaldetailspresent || personalDetails.iscontactdetailspresent || personalDetails.issocialprofilepresent || personalDetails.isidentificationpresent))
                {
                    item.Status = "Applicant";
                }
                else if (educationDetails != null && !educationDetails.iseducationdetailspresent)
                {
                    item.Status = "Applicant";
                }
                else if (languageCompetency != null && !languageCompetency.islanguagecompetencypresent)
                {
                    item.Status = "Applicant";
                }
                if (personalDetails != null && personalDetails.ispersonaldetailspresent && courseData != null)
                {
                    item.Status = "Successful Applicant";
                }
                if (applicationmaster.Count > 0)
                {
                    foreach (var data in applicationmaster)
                    {

                        if (data.current_status != null && (data.current_status == 2 || data.current_status == 3))
                            item.Status = "Offered Applicant";

                        if (data.current_status != null && (data.current_status == 6 || data.current_status == 9 || data.current_status == 10))
                            item.Status = "Accepted Applicant";

                        if (data.current_status != null && data.current_status == 11)
                            item.Status = "Enrolled Applicant";
                    }
                }
            }
            UserGridView.DataSource = applicant;
            UserGridView.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected DataTable BindDatatable()
    {
        BindApplicant();
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Applicant Id", typeof(Int32));
        dt.Columns.Add("University Name", typeof(string));
        dt.Columns.Add("First Name", typeof(string));
        dt.Columns.Add("Last Name", typeof(string));
        dt.Columns.Add("Email", typeof(string));
        dt.Columns.Add("Registration Date", typeof(DateTime));
        dt.Columns.Add("Contact Number", typeof(string));
        dt.Columns.Add("Country of Residence", typeof(string));
        dt.Columns.Add("Status", typeof(string));
        // to print rows
        if (applicant != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var applicantemployerdetails = applicant[i];

                dt.Rows.Add(applicantemployerdetails.applicantid, applicantemployerdetails.university_name, applicantemployerdetails.firstname, applicantemployerdetails.lastname, applicantemployerdetails.email, Convert.ToDateTime(applicantemployerdetails.registereDate), applicantemployerdetails.mobile, applicantemployerdetails.countryofresidence, applicantemployerdetails.Status);

                rowNumber++;
            }
        }
        return dt;
    }

    protected void downloadbtn_Click(object sender, EventArgs e)
    {
        try
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "RegisteredApplicant_List.xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = BindDatatable();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            
            Response.End();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public class Details
    {
        public int? id { get; set; }
        public int? applicantid { get; set; }
        public int? universityId { get; set; }
        public string university_name { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public DateTime? registereDate { get; set; }
        public string mobile { get; set; }
        public string countryofresidence { get; set; }
        public string Status { get; set; }
        public string approve { get; set; }
        public string suspend { get; set; }
    }

    protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        UserGridView.EditIndex = e.NewEditIndex;
        BindApplicant();
    }

    protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserGridView.PageIndex = e.NewPageIndex;
        BindApplicant();
    }

    protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Delete"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                var mode = "new";
                students objstude = new students();
                var data = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objstude = data;
                }
                objstude.isdeletedbyAdmin = true;
                if (mode == "new")
                    db.students.Add(objstude);
                db.SaveChanges();
                BindApplicant();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applicant'"+objstude.name+"'('"+objstude.studentid+"' deleted successfully.)')", true);

            }
            if (e.CommandName.Equals("Verify"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                var mode = "new";
                students objstude = new students();
                var data = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objstude = data;
                }
                objstude.isverifiedbyAdmin = true;
                if (mode == "new")
                    db.students.Add(objstude);
                db.SaveChanges();
                BindApplicant();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applicant'" + objstude.name + "'('" + objstude.studentid + "' verified successfully.)')", true);
                
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void UserGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblstatus = (Label)e.Row.FindControl("Label6");
                LinkButton lnkapprove = ((LinkButton)e.Row.FindControl("lnkapprove"));

                if (lblstatus.Text == "Approved")
                    lnkapprove.Attributes.Add("style", "display:none");
                else
                    lnkapprove.Attributes.Add("style", "display:block");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}