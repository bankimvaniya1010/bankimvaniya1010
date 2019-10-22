using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_visaDates : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int ApplicantID , universityID;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if ((Request.QueryString["userid"] == null) || (Request.QueryString["userid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            ApplicantID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        if (!IsPostBack)
        {
            PopulateDetails();
        }
    }

    private void PopulateDetails()
    {
        try
        {
            var details = (from pInfo in db.applicantdetails
                           where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                           select pInfo).FirstOrDefault();
            if (details != null)
            {
                if(details.visaverfied_date != null)
                    txtverifedbystaff.Value = Convert.ToDateTime(details.visaverfied_date).ToString("dd-MM-yyyy");
                if (details.visasubmittedtodepartment_date != null)
                    txtsubmittedtodept.Value = Convert.ToDateTime(details.visasubmittedtodepartment_date).ToString("dd-MM-yyyy");
                if (details.visadecisionreceived_date != null)
                    txtvisadecisionreceived.Value = Convert.ToDateTime(details.visadecisionreceived_date).ToString("dd-MM-yyyy");

                if (details.visagranted == 1)
                    rbYes.Checked = true;
                else if (details.visagranted == 0)
                    rbNo.Checked = true;
                txtremarks.Value = details.visaremarks;
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
     
        var mode = "new";
        var details = (from pInfo in db.applicantdetails
                       where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                       select pInfo).FirstOrDefault();
        applicantdetails objapplicantdetails = new applicantdetails();
        if (details != null)
        {
            mode = "update";
            objapplicantdetails = details;
        }
        if (txtverifedbystaff.Value != "")
        {
            var vdateArr = txtverifedbystaff.Value.Split(Convert.ToChar("-"));
            var visaverfied_date = Convert.ToDateTime(string.Concat(vdateArr[2], "-", vdateArr[1], "-", vdateArr[0]));
            objapplicantdetails.visaverfied_date = visaverfied_date;
        }
        if (txtsubmittedtodept.Value != "")
        {
            var sdateArr = txtsubmittedtodept.Value.Split(Convert.ToChar("-"));
            var visasubmittedtodepartment_date = Convert.ToDateTime(string.Concat(sdateArr[2], "-", sdateArr[1], "-", sdateArr[0]));
            objapplicantdetails.visasubmittedtodepartment_date = visasubmittedtodepartment_date;
        }
        if (txtvisadecisionreceived.Value != "")
        {
            var ddateArr = txtvisadecisionreceived.Value.Split(Convert.ToChar("-"));
            var visadecisionreceived_date = Convert.ToDateTime(string.Concat(ddateArr[2], "-", ddateArr[1], "-", ddateArr[0]));
            objapplicantdetails.visadecisionreceived_date = visadecisionreceived_date;
        }
        if (rbYes.Checked)
            objapplicantdetails.visagranted = 1;
        else if (rbNo.Checked)
            objapplicantdetails.visagranted = 0;
        objapplicantdetails.visaremarks = txtremarks.Value;
        if (mode == "new")
            db.applicantdetails.Add(objapplicantdetails);
        db.SaveChanges();
    }
}