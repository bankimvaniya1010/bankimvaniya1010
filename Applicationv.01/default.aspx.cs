using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;

public partial class _Default : System.Web.UI.Page
{
    Logger log = new Logger();
    List<int> QuestionList = new List<int>();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, applicantID = 0;
    string webURL = String.Empty;
    string progressStatus = "";
    protected static List<faq> allQuestions = new List<faq>();
    protected static string universityName = string.Empty;
    Common objCom = new Common();
    public int UniversityID = -1;
    public int isfullservice;
    public string applicantname;
    public bool? isVerifiedByAdmin;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        
        applicantname = objCom.GetApplicantFirstName(UserID);

        Session["Applicant"] = UserID;

        isVerifiedByAdmin = db.applicantdetails.Where(x=>x.applicantid == UserID).Select(x=>x.isverifiedbyAdmin).FirstOrDefault();
        Session["isVerifiedByAdmin"] = isVerifiedByAdmin;

        isfullservice = (int)Session["isfullservice"];
        if (isfullservice == 1)
            isfullservicethenlbl.Text = "TO THE APPLICATION CENTER";
        else if (isfullservice == 0)
            isfullservicethenlbl.Text = "TO THE GTE ONLINE CENTER (GOC)";
        else if (isfullservice == 2)
            isfullservicethenlbl.Text = "TO ASSESSMENT CENTER";
        if (isVerifiedByAdmin != true)
            ifnotverifiedshow.Attributes.Add("style","display:block");
        else
            ifverifiedshow.Attributes.Add("style", "display:block");
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList("30", UniversityID, isfullservice);

            if (Session["isDomesticStudent"] == null)
                domesticDiv.Style.Remove("display");
            else
                domesticDiv.Visible = false;
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SetSecondaryLanguage(String tempP)
    {
        HttpContext.Current.Session["SecondaryLang"] = tempP;
        return "";
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        Label lbluniversityName = (Label)this.Master.FindControl("lbluniversityName");
        universityName = lbluniversityName.Text;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string isstudentverified(int UserID)
    {
        string response = string.Empty;
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var data = db1.applicantdetails.Where(x => x.applicantid == UserID).FirstOrDefault();
        HttpContext.Current.Session["isVerifiedByAdmin"] = data.isverifiedbyAdmin;
        if (data.isverifiedbyAdmin == true)
            response = "1";
        else
            response = "0";
        return JsonConvert.SerializeObject(response);
    }

    //private void SetprogressStatus()
    //{
    //    try
    //    {
    //        var ap = db.applicantprogressbar.Where(b => b.applicantid == applicantID).First();
    //        if (ap != null)
    //        {
    //            if (ap.documents == 1)
    //                document.Attributes["class"] = "progress-bar bg-success";
    //            if (ap.profile == 1)
    //                profile.Attributes["class"] = "progress-bar bg-success";
    //            if (ap.video == 1)
    //                Video.Attributes["class"] = "progress-bar bg-success";
    //            if (ap.question == 1)
    //                question.Attributes["class"] = "progress-bar bg-success";
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        log.WriteLog(ex.ToString());

    //    }
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var studentDetails = db.students.Where(x => x.studentid == UserID).FirstOrDefault();
        if (rblYes.Checked)
            studentDetails.isDomesticStudent = rblYes.Checked;
        else if(rblNo.Checked)
            studentDetails.isDomesticStudent = rblYes.Checked;

        db.SaveChanges();
        Session["isDomesticStudent"] = studentDetails.isDomesticStudent.Value;

        Response.Redirect(Request.Url.ToString(), true);
    }
}