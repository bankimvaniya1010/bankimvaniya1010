using System;
using System.Collections;
using System.Collections.Generic;
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
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());   
    int UserID = 0;    
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        string name = db.students.Where(x => x.studentid == UserID).Select(x => x.name).FirstOrDefault();
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
        lblusername.Text = name;
        string universityName = db.university_master.Where(x => x.universityid == universityID).Select(x => x.university_name).FirstOrDefault();
        lbluniversityName.Text = universityName;

    }

    private void populateSelectedLanguage()
    {
        string SecondaryLanguage = Utility.GetSecondaryLanguage();
        if (SecondaryLanguage != "")
            ddlseclanguage.Items.FindByValue(SecondaryLanguage.ToString()).Selected = true;
    }


    private void Bindseclanguagelist()
    {
        ListItem lst = new ListItem("Please select", "0");
        var slm = db.secondarylanguagemaster.ToList();
        ddlseclanguage.DataSource = slm;
        ddlseclanguage.DataTextField = "secondarylanguagename";
        ddlseclanguage.DataValueField = "languagecode";
        ddlseclanguage.DataBind();
        ddlseclanguage.Items.Insert(0, lst);
    }


}
