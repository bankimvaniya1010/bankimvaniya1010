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
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if (!isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack) {
            allQuestions = objCom.FaqQuestionList();
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
        var mode = "new";
        var creditInfo = (from cInfo in db.applicantfundingmaster 
                          where cInfo.applicantid == userID && cInfo.universityid == universityID
                          select cInfo).FirstOrDefault();
        applicantfundingmaster objapplicantfundingmaster = new applicantfundingmaster();
        if (creditInfo != null)
        {
             mode = "update";
            objapplicantfundingmaster = creditInfo;
        }

        if (rblCreditYes.Checked)
            objapplicantfundingmaster.credittransfer = 1;
        else
            objapplicantfundingmaster.credittransfer = 2;
        if (mode == "new")
            db.applicantfundingmaster.Add(objapplicantfundingmaster);
        db.SaveChanges();
    }
}