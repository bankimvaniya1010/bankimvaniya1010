using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visastatus : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int applicantID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
    int UniversityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        applicantID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            var instruction = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.visa_instructions).FirstOrDefault();
            if (instruction == null || instruction == "")
                universityInstruction.InnerText = "No Instructions Set By Institution";
            else
                universityInstruction.InnerText = instruction;
            BindVisaStatus();
        }
    }

    private void BindVisaStatus()
    {
        try
        {
            //1
            var visadetails = db.australiavisadetailmaster.Where(x => x.applicantid == applicantID && x.universityid == UniversityID).Select(x=>x.recordsaved_at).FirstOrDefault();

            if (visadetails == null)
            {
                lblvisastatus.Text = "Pending";
                lblvisastatus.ForeColor = Color.Red;
            }
            else
            {
                lblvisastatus.Text = Convert.ToDateTime(visadetails).ToString("dd/MM/yyyy");
                lblvisastatus.ForeColor = Color.Green;
            }
            //2
            var visafeestatus = (from pd in db.payment_details
                                 join pdesc in db.payment_description_master on pd.payment_for equals pdesc.id
                                 join pdm in db.payment_description_mappings on pdesc.id equals pdm.payment_description_id
                                 where pd.university_id == UniversityID && pdm.university_id == UniversityID && pd.payment_status == 1 && pdesc.payment_description.Equals("Visa Fee", StringComparison.OrdinalIgnoreCase)
                                 select pd.payment_verified_date).FirstOrDefault();
            if (visafeestatus == null)
            {
                lblvisafee.Text = "Pending";
                lblvisafee.ForeColor = Color.Red;
            }
            else
            {
                lblvisafee.Text = Convert.ToDateTime(visafeestatus).ToString("dd/MM/yyyy");
                lblvisafee.ForeColor = Color.Green;
            }
            //3 4 5 6
            var statusDetails = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == UniversityID).FirstOrDefault();
            if (statusDetails == null || statusDetails.visaverfied_date == null)
            {
                lblverfiedbystaff.Text = "pending";
                lblverfiedbystaff.ForeColor = Color.Red;
            }
            else
            {
                lblverfiedbystaff.Text = Convert.ToDateTime(statusDetails.visaverfied_date).ToString("dd/MM/yyyy");
                lblverfiedbystaff.ForeColor = Color.Green;
            }
            if (statusDetails == null || statusDetails.visasubmittedtodepartment_date == null)
            {
                lblsubmited.Text = "pending";
                lblsubmited.ForeColor = Color.Red;
            }
            else
            {
                lblsubmited.Text = Convert.ToDateTime(statusDetails.visasubmittedtodepartment_date).ToString("dd/MM/yyyy");
                lblsubmited.ForeColor = Color.Green;
            }
            if (statusDetails == null || statusDetails.visadecisionreceived_date == null)
            {
                lbldecisionreceived.Text = "pending";
                lbldecisionreceived.ForeColor = Color.Red;
            }
            else
            {
                lbldecisionreceived.Text = Convert.ToDateTime(statusDetails.visadecisionreceived_date).ToString("dd/MM/yyyy");
                lbldecisionreceived.ForeColor = Color.Green;
            }
            if (statusDetails != null && statusDetails.visagranted != null && statusDetails.visagranted == 1)
            {
                lblstatus.Text = "Visa Granted";
                lblstatus.ForeColor = Color.Green;
            }
            else
            {
                lblstatus.Text = "Visa Not Granted";
                lblstatus.ForeColor = Color.Red;
            }
            if (statusDetails != null && statusDetails.visaremarks != null && statusDetails.visaremarks != "")
            {
                lblvisaremark.Text = statusDetails.visaremarks;
            }
            else
                lblvisaremark.Text = "No Remarks set By Staff";

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
   
}