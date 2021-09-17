using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin_manage_application : System.Web.UI.Page
{
    int roleID = 0, universityID = 0;
    string universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string roleName = string.Empty;
    
    string webURL = String.Empty;
    private string constr, query;
    public int fullservice;
    public string lbltotal = "0", lblavailable = "0";
    List<exam_subjectmaster> appliedsubjectlist = new List<exam_subjectmaster>();

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
       
        //BindApplicant();
        if (!IsPostBack)
        {
            BindApplicant();
            
        }
    }
    
    private void BindApplicant()
    {
        try
        {
           var applicant = (from am in db.applicationmaster

                            join gtead in db.applicantdetails on am.applicantid equals gtead.applicantid
                            join course in db.coursemaster on am.course equals course.courseid
                            join u in db.university_master on gtead.universityid equals u.universityid
                            join status in db.application_status_master on am.current_status equals status.id
                            join campus in db.universitycampus on am.campus equals campus.campusid

                            where gtead.universityid == universityID && gtead.isdeletedbyAdmin == false
                         select new data()
                         {
                             id = am.applicationmasterid,
                             applicantid = am.applicantid,
                             application_datetime = am.activity_date,
                             courseid = course.courseid,
                             coursename = course.coursename,
                             applicantname = gtead.firstname +" "+ gtead.lastname,
                             //Payment_Status= pymt.status_description,
                             universityname = u.university_name,
                             campusname = campus.campusname,
                             Status = status.status_description,
                             dateofapplication = am.dateofapplication,
                             ManageApplicant_Link = webURL+ "admin/manage_applicant.aspx?ID="+am.applicantid,
                             ManageApplicantion_Link = webURL + "admin/processstudentapplication.aspx?applicantId=" + am.applicantid + "&universityId=" + universityID + "&applicationmasterID=" + am.applicationmasterid,
                             ProcessPayment_Link= webURL+ "admin/processpaymentrequest.aspx?applicantId="+am.applicantid+"&universityId="+am.universityid+ "&applicationmasterID="+am.applicationmasterid,

                         }).Distinct().OrderByDescending(x => x.id).ToList();

            foreach (var item in applicant) {
                var paymentdata = db.payment_details.Where(x => x.applicationmaster_id == item.id).FirstOrDefault();
                if (paymentdata != null)
                {
                    item.Payment_Status = db.payment_status_master.Where(x => x.id == paymentdata.payment_status).Select(x => x.status_description).FirstOrDefault();
                }
                else
                    item.Payment_Status = "Initiate Payment";

            }

            UserGridView.DataSource = applicant;
            UserGridView.DataBind();


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public class data
    {
        public int? id { get; set; }
        public int? applicantid { get; set; }
        public int? universityId { get; set; }
        public string Status { get; set; }
        public string Payment_Status { get; set; }
        public string campusname { get; set; }
        public string universityname { get; set; }
        public string applicantname { get; set; }
        public DateTime? application_datetime { get; set; }
        public DateTime? dateofapplication { get; set; }
        public string coursename { get; set; }
        public int courseid { get; set; }
        public string ManageApplicant_Link { get; set; }
        public string ManageApplicantion_Link { get; set; }
        public string ProcessPayment_Link { get; set; }
    }

   

    protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserGridView.PageIndex = e.NewPageIndex;
        BindApplicant();
    }

}