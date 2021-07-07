using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    public int? questioncompleted = 0 , isclarificationquestionset = 0;
    string webURL = String.Empty;
    int universityID;
    public int UserID = 0;    
    public string logourl = string.Empty;
    public string fontColor = string.Empty;
    public string headercolor = string.Empty;
    public string verticalnavigationcolor = string.Empty;
    public string username = string.Empty;
    public string useremail = string.Empty;
    DateTime meetingTime, fiveminbeforemeeetingtimeis, currenttime ;
    public string applicantname;
    public bool? isVerifiedByAdmin;
    public int gtesubService;
    public string CertificateURL, SOPPageURL, gtestudentdetailpageURL, gtedocumentuploadURL;
    public string CID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        string firstname = objCom.GetApplicantFirstName(UserID);
        string lastname = objCom.GetApplicantLastName(UserID);
        applicantname = firstname + " " + lastname;

        var data = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
        isVerifiedByAdmin = data.isverifiedbyAdmin;
        Session["isVerifiedByAdmin"] = isVerifiedByAdmin;

        CID = data.gtereportNO;//.Replace("GTE-AR-", ""); ;

        var gteQuestionPart2Count = db.gte_question_master_part2.Count();
        var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();

        if (applicant_response.Count == gteQuestionPart2Count) // Condition for checking gte Questions Part 2 completed
            questioncompleted = 1;

        var clarification_questionsList = db.gte_clarification_questionmaster.ToList();

        foreach (var item in applicant_response)
            clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

        if (clarification_questionsList.Count == 0)
            isclarificationquestionset = 0;
        else
            isclarificationquestionset = 1;

        if (!IsPostBack) {
            Bindseclanguagelist();
            populateSelectedLanguage();
        }
        var universityDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.universityid, x.fontcolor, x.headerstripcolor, x.verticalnavigationcolor, x.logo, x.sub_gte_service }).FirstOrDefault();
        if (Session["universitylogo"] == null || Session["universityverticalnavigationcolor"] == null || Session["universityfontColor"] == null || Session["universityheadercolor"] == null)
        {
            Session["universitylogo"] = universityDetails.logo;
            Session["universityverticalnavigationcolor"] = universityDetails.verticalnavigationcolor;
            Session["universityfontColor"] = universityDetails.fontcolor;
            Session["universityheadercolor"] = universityDetails.headerstripcolor;            
        }
        gtesubService = Convert.ToInt32(universityDetails.sub_gte_service);
        students loggedInApplicant = (students)Session["LoginInfo"];
        lblusername.Text = loggedInApplicant.name;
        username = loggedInApplicant.name;
        useremail = loggedInApplicant.email;
        logourl = webURL + "/Docs/" + universityID + "/" + (string)Session["universitylogo"];
        lbluniversityName.Text = (string)Session["universityName"];
        verticalnavigationcolor = (string)Session["universityverticalnavigationcolor"];
        fontColor = (string)Session["universityfontColor"];
        headercolor = (string)Session["universityheadercolor"];
        int isfullservice = (int)Session["isfullservice"];
        
        if (isfullservice == 0)
            isfullservicethenlbl.Text = "GTE DIRECT CENTRE";
        else if (isfullservice == 1)
            isfullservicethenlbl.Text = "APPLICATION CENTRE";
        else if (isfullservice == 2)
            isfullservicethenlbl.Text = "Assessment Centre";

        
        bool? Isold_or_new_applicant = objCom.GetIS_oldOrNew_applicant(UserID);
        if (Isold_or_new_applicant == true)
        {
            gtestudentdetailpageURL = "gte_studentdetailsN.aspx?formid=21";
            CertificateURL = "gte_certificateN.aspx";
            SOPPageURL = "gte_sop_builder.aspx?formid=26";
            gtedocumentuploadURL = "gte_supportingdocument.aspx";
        }
        else
        {
            gtestudentdetailpageURL = "gte_studentdetails.aspx?formid=21";
            CertificateURL = "gte_certificate.aspx";
            SOPPageURL = "gte_sop.aspx?formid=26";
            gtedocumentuploadURL = "gte_documentupload.aspx?formid=15";
        }       
    }

    private void populateSelectedLanguage()
    {
        string SecondaryLanguage = Utility.GetSecondaryLanguage();
        if (SecondaryLanguage != "")
            ddlseclanguage.Items.FindByValue(SecondaryLanguage.ToString()).Selected = true;
    }


    private void Bindseclanguagelist()
    {
        ListItem lst = new ListItem("Select Language", "0");
        var slm = db.secondarylanguagemaster.ToList();
        ddlseclanguage.DataSource = slm;
        ddlseclanguage.DataTextField = "secondarylanguagename";
        ddlseclanguage.DataValueField = "languagecode";
        ddlseclanguage.DataBind();
        ddlseclanguage.Items.Insert(0, lst);
    }


}
