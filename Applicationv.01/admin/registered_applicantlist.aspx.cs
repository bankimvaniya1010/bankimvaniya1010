using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();

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
            applicant = (from ad in db.applicantdetails

                         
                         join cm in db.countriesmaster on ad.residentialcountry equals cm.id into cmdata
                         from c in cmdata.DefaultIfEmpty()

                         join sm in db.students on ad.applicantid equals sm.studentid into studentData
                         from s in studentData.DefaultIfEmpty()                       

                         join um in db.university_master on ad.universityid equals um.universityid into umData
                         from u in umData.DefaultIfEmpty()

                         where ad.universityid == universityID
                         select new Details()
                         {
                             applicantid = ad.applicantid,
                             universityId = u.universityid,
                             university_name = u.university_name,
                             firstname = ad.firstname == null ? string.Empty : ad.firstname,
                             lastname = ad.lastname == null ?string.Empty : ad.lastname,
                             email = ad.email == null ? s.email : ad.email,
                             registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                             mobile = ad.mobileno == null ? string.Empty : ad.mobileno,
                             countryofresidence = c.country_name == null ? string.Empty : c.country_name,
                             Status = "Prospect",

                         }).OrderByDescending(x => x.applicantid).Distinct().ToList();
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
        public int? applicantid;
        public int? universityId;
        public string university_name;
        public string firstname;
        public string lastname;
        public string email;
        public DateTime? registereDate;
        public string mobile;
        public string countryofresidence;
        public string Status;
    }

}