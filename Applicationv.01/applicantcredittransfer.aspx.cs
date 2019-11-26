using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantcredittransfer : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int userID = 0, ApplicantID = 0, universityID;
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if (!isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack) {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
            PopulateCreditDetails();
        }
    }
    private void PopulateCreditDetails() {
        var creditInfo = (from cInfo in db.applicantfundingmaster
                          where cInfo.applicantid == userID && cInfo.universityid == universityID
                          select cInfo).FirstOrDefault();
        if (creditInfo != null) {
            if (creditInfo.credittransfer == 1)
                rblCreditYes.Checked = true;
            else if (creditInfo.credittransfer == 2)
                rblCreditNo.Checked = true;
        }
    }
    protected void btn_credit_Click(object sender, EventArgs e)
    {
        //applicantfundingmaster applicantfundingmaster = new applicantfundingmaster();
        try
        {
            var mode = "update";
            var applicantfundingmaster = (from cInfo in db.applicantfundingmaster
                                          where cInfo.applicantid == userID && cInfo.universityid == universityID
                                          select cInfo).FirstOrDefault();
            if (applicantfundingmaster == null)
            {
                mode = "new";
                applicantfundingmaster = new applicantfundingmaster();
                applicantfundingmaster.universityid = universityID;
                applicantfundingmaster.applicantid = userID;
            }

            if (rblCreditYes.Checked)
                applicantfundingmaster.credittransfer = 1;
            else
                applicantfundingmaster.credittransfer = 2;
            if (mode == "new")
                db.applicantfundingmaster.Add(applicantfundingmaster);
            db.SaveChanges();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}