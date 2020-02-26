using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sop_report : System.Web.UI.Page
{
    protected int ApplicantID = 0, universityID = 0;
    protected string _universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = String.Empty;

    protected string _genuineStudentAssesment = string.Empty;
    protected string _situationStudentAssesment = string.Empty;
    protected string _potentialStudentAssesment = string.Empty;
    protected string _paragraph4 = string.Empty;
    protected string _paragraph5 = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "" || Request.QueryString["downloadPdf"] == null || Request.QueryString["downloadPdf"].ToString() == "")
        {
        }
        else
        {
            int downloadPdf = 0;
            int.TryParse(Request.QueryString["downloadPdf"].ToString(), out downloadPdf);
            if ((downloadPdf == 0 && Utility.CheckStudentLogin()) || (downloadPdf == 1 && Request.QueryString["token"] != null && Request.QueryString["token"].ToString() == "YKUcfdhNWwp17azByk"))
            {
                universityID = Utility.GetUniversityId();
                ApplicantID = Convert.ToInt32(Request.QueryString["id"].ToString());

                if (!IsPostBack)
                {
                    var gte_student_sop = db.gte_student_sop
                                                   .Where(x => x.applicant_id == ApplicantID && x.universityid == universityID && x.is_sop_submitted_by_applicant == true)
                                                   .FirstOrDefault();
                    if (gte_student_sop != null)
                    {
                        _genuineStudentAssesment = gte_student_sop.applicant_generated_sop_para1;
                        _situationStudentAssesment = gte_student_sop.applicant_generated_sop_para2;
                        _potentialStudentAssesment = gte_student_sop.applicant_generated_sop_para3;
                        _paragraph4 = gte_student_sop.applicant_generated_sop_para4;
                        _paragraph5 = gte_student_sop.applicant_generated_sop_para5;
                    }
                }
            }
        }
    }
}