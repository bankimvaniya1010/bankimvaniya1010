using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class languageproficiency : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string TestGiven = "HAS THE STUDENT TAKEN ENGLISH PROEFICIENCY TEST";
    protected string BookedExamDate = "DATE OF EXAM BOOKED";
    protected string TestName = "TEST NAME";
    protected string OverAll = "OVERALL SCORE";
    protected string Speaking = "SPEAKING";
    protected string Listening = "LISTENING";
    protected string Reading = "READING";
    protected string Writing = "WRITING";
    protected string TestDate = "TEST DATE";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        if (!IsPostBack)
        {
            GetSecondaryFieldname();
            BindProefiencyDetails(ApplicantID);

        }
    }
    protected void btnProeficiency_Click(object sender, EventArgs e)
    {
        string examBookedDate, ProfiencyDate = "";
        examBookedDate = ProfiencyTestDate.Value;
        ProfiencyDate = txtEnglishTest.Value;
        applicant_languagetest objLanugaeTest = new applicant_languagetest();
        objLanugaeTest.applicantId = ApplicantID;

        if (rdoYes.Checked)
        {
            objLanugaeTest.examDate = Convert.ToDateTime(examBookedDate);
            objLanugaeTest.IsTestDone = 1;
        }
        else
        {
            objLanugaeTest.examDate = Convert.ToDateTime(examBookedDate);
            objLanugaeTest.IsTestDone = 0;
        }
        objLanugaeTest.listening = txtListening.Value;
        objLanugaeTest.overallscore = txtOverAll.Value;
        objLanugaeTest.reading = txtReading.Value;
        objLanugaeTest.speaking = txtSpeaking.Value;
        objLanugaeTest.testId = Convert.ToInt32(ddlEnglish.SelectedValue);
        objLanugaeTest.writing = txtWriting.Value;
        db.applicant_languagetest.Add(objLanugaeTest);
        db.SaveChanges();
        BindProefiencyDetails(ApplicantID);
    }
    private void BindProefiencyDetails(int ApplicantID)
    {
        var testDetails = (from tInfo in db.applicant_languagetest
                           where tInfo.applicantId == ApplicantID
                           select tInfo).ToList();
        grdEnglish.DataSource = testDetails;
        grdEnglish.DataBind();
    }
    protected void grdEnglish_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow && grdEnglish.EditIndex == e.Row.RowIndex))
        {
            Label Name = (e.Row.FindControl("lblName") as Label);
            if (Name.Text == "1")
                Name.Text = "IELTS";
            else if (Name.Text == "2")
                Name.Text = "PTE";
            else
                Name.Text = "TOFEL";
        }
    }
    private void GetSecondaryFieldname()
    {
        string SecondaryLanguage = "";
        if (Session["SecondaryLang"] == null)
        {
           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Secondary Language')", true);
           // Response.Redirect("default.aspx");
        }
        else
        {
            SecondaryLanguage = Session["SecondaryLang"].ToString();
            var SecondaryField = (from am in db.applicantformmaster
                                  join pm in db.primaryfieldmaster on am.primaryfieldid equals pm.primaryfieldid
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 3)

                                  select new
                                  {
                                      id = am.id,
                                      fieldnameinstructions = am.fieldnameinstructions,
                                      secondaryfieldnameinstructions = am.secondaryfieldnameinstructions,
                                      primaryfieldname = pm.primaryfiledname,
                                      secondaryfieldnamelanguage = am.secondaryfieldnamelanguage,
                                      secondaryfielddnamevalue = am.secondaryfielddnamevalue

                                  }).ToList();
            // var    am =  db.applicantformmaster.Where(x => x.secondaryfieldnamelanguage == SecondaryLanguage && x.formname == 1).ToList();
            for (int k = 0; k < SecondaryField.Count; k++)
            {

                switch (SecondaryField[k].primaryfieldname.ToString())
                {

                    case "HAS THE STUDENT TAKEN ENGLISH PROEFICIENCY TEST":
                        TestGiven = SecondaryField[k].secondaryfielddnamevalue == "" ? TestGiven : TestGiven + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DATE OF EXAM BOOKED":
                        BookedExamDate = SecondaryField[k].secondaryfielddnamevalue == "" ? BookedExamDate : BookedExamDate + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "TEST NAME":
                        TestName = SecondaryField[k].secondaryfielddnamevalue == "" ? TestName : TestName + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "OVERALL SCORE":
                        OverAll = SecondaryField[k].secondaryfielddnamevalue == "" ? OverAll : OverAll + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "SPEAKING":
                        Speaking = SecondaryField[k].secondaryfielddnamevalue == "" ? Speaking : Speaking + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "LISTENING":
                        Listening = SecondaryField[k].secondaryfielddnamevalue == "" ? Listening : Listening + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "READING":
                        Reading = SecondaryField[k].secondaryfielddnamevalue == "" ? Reading : Reading + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "WRITING":
                        Writing = SecondaryField[k].secondaryfielddnamevalue == "" ? Writing : Writing + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "TEST DATE":
                        TestDate = SecondaryField[k].secondaryfielddnamevalue == "" ? TestDate : TestDate + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }
}