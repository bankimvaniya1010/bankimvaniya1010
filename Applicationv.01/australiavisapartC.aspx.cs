using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class australiavisapartC : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    int userID = 0, ApplicantID = 0, universityID;
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    australiavisadetailmaster australiavisadetailmaster = new australiavisadetailmaster();
    protected static List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            populateVisaDetails();
        }
    }

    private void populateVisaDetails() {
        try
        {

            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();
            if (visaInfo != null)
            {
                //////////PART C

                //44
                if (visaInfo.ifFamilyunitcompletedformpartC == 1)
                    iscompletedformNO.Checked = true;
                else if (visaInfo.ifFamilyunitcompletedformpartC == 2)
                    iscompletedformYes.Checked = true;

                //45

                if (visaInfo.studymorethanthreemonthpartC == 1)
                    studymorethanthreemonthNo.Checked = true;
                else if (visaInfo.studymorethanthreemonthpartC == 2)
                    studymorethanthreemonthYes.Checked = true;

                //46
                studentnamepartC.Value = visaInfo.studentnamepartC;
                relationshiptostudentpartC.Value = visaInfo.relationshiptostudentpartC;
                if (visaInfo.studentdobpartC != null)
                    studentdobpartC.Value = Convert.ToDateTime(visaInfo.studentdobpartC).ToString("yyyy-MM-dd");
                citizenshipofstudentpartC.Value = visaInfo.citizenshipofstudentpartC;
                studentaddresspartC.Value = visaInfo.studentaddresspartC;
                studentaddpostalcodepartC.Value = visaInfo.studentaddpostalcodepartC;
                typeofstudentvisaheldpartC.Value = visaInfo.typeofstudentvisaheldpartC;
                assessmentlevelpartC.Value = visaInfo.assessmentlevelpartC;
                if (visaInfo.assessmentgrantdatepartC != null)
                    assessmentgrantdatepartC.Value = Convert.ToDateTime(visaInfo.assessmentgrantdatepartC).ToString("yyyy-MM-dd");
                if (visaInfo.assessmentexpirydatepartC != null)
                    assessmentexpirydatepartC.Value = Convert.ToDateTime(visaInfo.assessmentexpirydatepartC).ToString("yyyy-MM-dd");
                //47
                if (visaInfo.isstudentjoiningdeclarepartC == 1)
                    isstudentjoiningdeclarepartCNo.Checked = true;
                else if (visaInfo.isstudentjoiningdeclarepartC == 2)
                    isstudentjoiningdeclarepartYes.Checked = true;

                //48
                if (visaInfo.isstudentjoiningsatisfiedconditionpartC == 1)
                    isstudentjoiningsatisfiedconditionpartCNo.Checked = true;
                else if (visaInfo.isstudentjoiningsatisfiedconditionpartC == 2)
                    isstudentjoiningsatisfiedconditionpartCYes.Checked = true;

                //49
                if (visaInfo.suficientfundpartC == 1)
                    suficientfundpartCNo.Checked = true;
                else if (visaInfo.suficientfundpartC == 2)
                    suficientfundpartCNo.Checked = true;
            }
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }

    }



    protected void btnvisadetails_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();
            australiavisadetailmaster objaustraliavisadetail = new australiavisadetailmaster();


            if (visaInfo != null)
            {
                mode = "update";
                objaustraliavisadetail = visaInfo;
            }
            /////PART C

            //44
            if (iscompletedformNO.Checked)
                objaustraliavisadetail.ifFamilyunitcompletedformpartC = 1;
            else if (iscompletedformYes.Checked)
                objaustraliavisadetail.ifFamilyunitcompletedformpartC = 2;

            //45
            if (studymorethanthreemonthNo.Checked)
                objaustraliavisadetail.studymorethanthreemonthpartC = 1;
            else if (studymorethanthreemonthYes.Checked)
                objaustraliavisadetail.studymorethanthreemonthpartC = 2;
            //46
            objaustraliavisadetail.studentnamepartC = studentnamepartC.Value;
            objaustraliavisadetail.relationshiptostudentpartC = relationshiptostudentpartC.Value;
            if(studentdobpartC.Value != null)
                objaustraliavisadetail.studentdobpartC = Convert.ToDateTime(studentdobpartC.Value);
            objaustraliavisadetail.citizenshipofstudentpartC = citizenshipofstudentpartC.Value;
            objaustraliavisadetail.studentaddresspartC = studentaddresspartC.Value;
            objaustraliavisadetail.studentaddpostalcodepartC = studentaddpostalcodepartC.Value;
            objaustraliavisadetail.typeofstudentvisaheldpartC = typeofstudentvisaheldpartC.Value;
            objaustraliavisadetail.assessmentlevelpartC = assessmentlevelpartC.Value;
            if(assessmentgrantdatepartC.Value != null)
                objaustraliavisadetail.assessmentgrantdatepartC = Convert.ToDateTime(assessmentgrantdatepartC.Value);
            if(assessmentexpirydatepartC.Value != null)
                objaustraliavisadetail.assessmentexpirydatepartC = Convert.ToDateTime(assessmentexpirydatepartC.Value);

            //47
            if (isstudentjoiningdeclarepartCNo.Checked)
                objaustraliavisadetail.isstudentjoiningdeclarepartC = 1;
            else if (isstudentjoiningdeclarepartYes.Checked)
                objaustraliavisadetail.isstudentjoiningdeclarepartC = 2;
            //48
            if (isstudentjoiningsatisfiedconditionpartCNo.Checked)
                objaustraliavisadetail.isstudentjoiningsatisfiedconditionpartC = 1;
            else if (isstudentjoiningsatisfiedconditionpartCYes.Checked)
                objaustraliavisadetail.isstudentjoiningsatisfiedconditionpartC = 2;
            //49
            if (suficientfundpartCNo.Checked)
                objaustraliavisadetail.suficientfundpartC = 1;
            else if (suficientfundpartCYes.Checked)
                objaustraliavisadetail.suficientfundpartC = 2;

            objaustraliavisadetail.applicantid = userID;
            objaustraliavisadetail.universityid = universityID;
            if (mode == "new")
                db.australiavisadetailmaster.Add(objaustraliavisadetail);
            db.SaveChanges();
            Response.Redirect(webURL + "australiavisapartD.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}