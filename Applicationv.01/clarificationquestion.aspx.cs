using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class clarificationquestion : System.Web.UI.Page
{
    int userID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Utility.GetUniversityId();
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var showButton = false;
        if (!GlobalVariables.isDeclarationDoneByApplicant)
            Response.Redirect(webURL + "default.aspx", true);

        if (!IsPostBack)
        {
            var questionsList = db.clarificationquestionsmaster.ToList();
            var applicantDetail = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
            var applicantEduDetail = db.applicanteducationdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
            var applicantHighEduDetail = db.applicanthighereducation.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
            int monthGap1012 = 0, higheredumonthGap12 = 0;
            Age currentAge = null;

            if (questionsList != null)
             {
                foreach (var item in questionsList)
                {
                    if (item.questiontype == "10_12_gap")
                    {
                        if (applicantEduDetail != null)
                        {
                            if (applicantEduDetail.ishighschooldone.Value == 1 && applicantEduDetail.issecondarydone.Value == 1)
                                monthGap1012 = monthDiff(Convert.ToDateTime(applicantEduDetail.highschoolendate), Convert.ToDateTime(applicantEduDetail.secondaryendate));
                        }
                        if (monthGap1012 != 0 && monthGap1012 > GlobalVariables.GetHighSchoolSecondaryAllowedGap)
                        {
                            secondaryHighSchoolGap.Style.Remove("display");
                            txtSecondHighGapReason.Value = applicantEduDetail.highschoolsecondaryschoolgapreason;
                            showButton = true;
                        }
                    }
                    else if (item.questiontype == "12_highereducation_gap")
                    {
                        if (applicantEduDetail != null && applicantHighEduDetail != null)
                        {
                            if (applicantHighEduDetail.startdate != null && applicantEduDetail.issecondarydone.Value == 1)
                                higheredumonthGap12 = monthDiff(Convert.ToDateTime(applicantEduDetail.secondaryendate), Convert.ToDateTime(applicantHighEduDetail.startdate));
                        }
                        if (higheredumonthGap12 !=0 && higheredumonthGap12 > GlobalVariables.GetHigherEduSecondarySchoolAllowedGap)
                        {
                            highereduSecondarySchoolGap.Style.Remove("display");
                            txtHigherSecondaryGap.Value = applicantHighEduDetail.secondaryschoolhighereducationgapreason;
                            showButton = true;
                        }
                    }

                    else if (item.questiontype == "age_limit")
                    {
                        if (applicantDetail != null)
                        {
                            if (applicantDetail.dateofbirth.HasValue && applicantDetail.dateofbirth.Value != null)
                                currentAge = new Age(applicantDetail.dateofbirth.Value);
                        }
                        if (currentAge != null && currentAge.Years > GlobalVariables.GetAgeMotivationLimit)
                        {
                            motivationReason.Style.Remove("display");
                            txtMotivationReason.Value = applicantDetail.motivationreason;
                            showButton = true;
                        }
                    }
                }
                if (showButton) 
                    btn_login.Visible = true;                                    
                else
                    LabelMessage.Text = "No Clarification Question.";
            }
        }
    }

    private int monthDiff(DateTime d1, DateTime d2)
    {
        int months;
        months = (d2.Year - d1.Year) * 12;
        months -= d1.Month + 1;
        months += d2.Month;
        return months <= 0 ? 0 : months;
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        var applicantDetail = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
        var applicantEduDetail = db.applicanteducationdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
        var applicantHighEduDetail = db.applicanthighereducation.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();

        if (applicantEduDetail != null && txtSecondHighGapReason != null)
            applicantEduDetail.highschoolsecondaryschoolgapreason = txtSecondHighGapReason.Value;

        if (applicantEduDetail != null && applicantHighEduDetail != null && txtHigherSecondaryGap != null)
            applicantHighEduDetail.secondaryschoolhighereducationgapreason = txtHigherSecondaryGap.Value;

        if (applicantDetail != null && txtMotivationReason != null)
            applicantDetail.motivationreason = txtMotivationReason.Value;

        if(applicantEduDetail != null || applicantEduDetail != null || applicantHighEduDetail != null)
            db.SaveChanges();
    }
}