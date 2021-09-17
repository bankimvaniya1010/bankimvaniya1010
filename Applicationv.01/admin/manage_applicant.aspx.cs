using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;
using NReco.PdfGenerator;


public partial class admin_manage_applicant : System.Web.UI.Page
{
    GTEEntities db = new GTEEntities();
    public int ApplicantID = 0, universityID = 0;
    Logger objLog = new Logger();
    string webURL = String.Empty;
    Common objCom = new Common();
    public List<coursemaster> appliedcourseData = new List<coursemaster>();
    int previous_applicantid = 0, next_applicantid = 0;
    public string viewperoonal, viewcontact, viewIdentification, universityName, viewEducation, downloaddetails_all, viewLanguage, viewEmployment, viewSocial, viewReference, processpayment, viewFunding, managescholarship, processapplication;
    public string sopReportLink, gtereportLink, applicantdeclarationLink, feedbackURL, certificateLink, applicantdocLink, personaldetailLink, recommendedwithcaution, verificationLink, institutionapplied, manageapplicabtionLink, recommendtionText, familyname = "-", profileURL, firstname = "-", nationality = "-", middlename ="-", dateofbirth = "-", gtereportNo, courseapplied, gender, countryofresidence, facilitingagent, passportno, packagapplied,
        RegisteredDate, assessment_date, report_date, counsellorLink,
        servity_final, satisfaction_final, risk_final, blck_cls_risk_final, blck_cls_satisfaction_final, blck_cls_servity_final, block_satisfaction_final, block_servity_final, block_risk_final;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["ID"] != null) || (Request.QueryString["ID"].ToString() != ""))
            ApplicantID = Convert.ToInt32(Request.QueryString["ID"]);
        else
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        bool? is_newApplicant = objCom.GetIS_oldOrNew_applicant(ApplicantID);
       
        showContent(ApplicantID);
        populateAppliedCourseData();
    }
  
    private void showContent(int aid)
    {
        try
        {
            viewperoonal = webURL + "admin/personaldetail.aspx?userid=" + aid + "&formid=1";
            viewcontact = webURL + "admin/applicantcontactdetail.aspx?userid=" + aid + "&formid=2";
            viewIdentification = webURL + "admin/knowyourstudent.aspx?userid=" + aid + "&formid=3";
            viewEducation = webURL + "admin/applicanteducation.aspx?userid=" + aid + "&formid=4";
            viewLanguage = webURL + "admin/applicantlanguage.aspx?userid=" + aid + "&formid=5";
            viewEmployment = webURL + "admin/applicantworkexperince.aspx?userid=" + aid + "&formid=7";
            viewSocial = webURL + "admin/applicantsocial.aspx?userid=" + aid + "&formid=8";
            viewReference = webURL + "admin/applicantreferncecheck.aspx?userid=" + aid + "&formid=6";
            downloaddetails_all= 
            processpayment = webURL + "admin/processpaymentrequest.aspx?applicantId=" + aid + "&universityId=" + universityID;
            viewFunding = webURL + "admin/applicantfunding.aspx?userid=" + aid + "&formid=11";
            managescholarship = webURL + "admin/scholarshipmaster.aspx?ID=" + aid;


            processapplication = webURL + "admin/processstudentapplication.aspx?applicantId="+aid+"&universityId=" + universityID;

            var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(ApplicantID);
            var CID = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            var gteProgressData = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();

            if (Is_new_applicant == true)
            {
                //if (!string.IsNullOrEmpty(CID.gtereportNO))
                //    feedbackURL = webURL + "/gte_ReportN.aspx?downloadPdf=0&feedback=1&CID=" + CID.gtereportNO + "&id=" + aid;
                //else
                //{
                    
                //    feedbackURL = webURL + "/gte_ReportN.aspx?downloadPdf=0&feedback=1&CID=NO&id=" + aid;
                //}
               
                personaldetailLink = webURL + "admin/gte_studentdetailsN.aspx?userid=" + ApplicantID + "&formid=" + 21;
                if (gteProgressData != null)
                {
                    if (!string.IsNullOrEmpty(gteProgressData.certificate_name))
                        certificateLink = webURL + "admin/gte_certificateN.aspx?CID=" + gteProgressData.certificate_name;
                    else
                        certificateLinkDiv.Attributes.Add("style", "display:none;");

                    if (gteProgressData.is_gte_declaration_completed == true)
                        applicantdeclarationLink = webURL + "/gte_declaration_download.aspx?id=" + aid + "&UniversityID=" + universityID + "&download=1";
                    else
                        decalarationDiv.Attributes.Add("style", "display:none;");

                    if (!string.IsNullOrEmpty(CID.gtereportNO))
                    {
                        gtereportLink = webURL + "gte_ReportN.aspx?id=" + ApplicantID + "&CID=" + CID.gtereportNO;
                        counsellorLink = webURL + "counsellor_report.aspx?aid=" + ApplicantID + "&downloadPdf=0&uid=" + universityID;
                    }
                    else
                    {
                        feedbackDiv.Attributes.Add("style", "display:none;");
                        gtereportDIv.Attributes.Add("style", "display:none;");
                        sopDiv.Attributes.Add("style", "display:none;");
                        //certificateDiv.Attributes.Add("style", "display:none;");
                        DivCounsellor.Attributes.Add("style", "display:none;");
                    }
                }
                else
                {
                    sopDiv.Attributes.Add("style", "display:none;");
                    //certificateDiv.Attributes.Add("style", "display:none;");
                    DivCounsellor.Attributes.Add("style", "display:none;");
                    decalarationDiv.Attributes.Add("style", "display:none;");
                }
                sopReportLink = webURL + "admin/gte_sopReport.aspx?applicantId=" + ApplicantID + "&universityId=" + universityID;   //webURL + "admin/gte_sopreport_View.aspx?applicantId=" + ApplicantID;
            }
            else
            {
                feedbackURL = webURL + "admin/gtereport.aspx?downloadPdf=0&type=Final&id=" + ApplicantID;
                personaldetailLink = webURL + "admin/gte_studentdetailsaspx.aspx?userid=" + ApplicantID + "&formid=" + 21;
                certificateLink = webURL + "gte_certificate1.aspx?downloadPdf=0&applicantId=" + ApplicantID + "&universityId=" + universityID;
                gtereportLink = webURL + "admin/gtereport.aspx?token=XS7MKjHLunMAvqzCGr&id=" + ApplicantID + "&type=Final" + "&downloadPdf=0";
                sopReportLink = webURL + "admin/sopreport.aspx?token=YKUcfdhNWwp17azByk&id=" + ApplicantID + "&type=Final&downloadPdf=1";
            }

            var ispassword = db.students.Where(x => x.studentid == ApplicantID).Select(x => x.password).FirstOrDefault();
            if (!string.IsNullOrEmpty(ispassword))
            {
                Label7.Visible = true;
                btnresendotpDiv.Attributes.Add("style", "display:none;");
            }

            verificationLink = webURL + "admin/verification_video.aspx?applicantId=" + ApplicantID;
            applicantdocLink = webURL + "admin/view_gteapplicantdocuments.aspx?applicantid=" + ApplicantID;

            var admin_response = db.gte_report_admin_comment.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID).FirstOrDefault();
            if (admin_response != null)
            {
                //recommDiv.Attributes.Add("style", "display:block;");
                if (admin_response.recommendedwithcaution != null)
                {
                    if (admin_response.recommendedwithcaution == 1)
                    {
                        recommendedwithcaution = webURL + "assets/GTEReport/tumb_right.png";
                        recommendtionText = "Recommended" + "<br><br>";
                    }
                    else if (admin_response.recommendedwithcaution == 2)
                    {
                        recommendedwithcaution = webURL + "assets/GTEReport/tumb.png";
                        recommendtionText = "Recommended" + "<br>" + " with caution";
                    }
                    else if (admin_response.recommendedwithcaution == 3)
                    {
                        recommendedwithcaution = webURL + "assets/GTEReport/tumb_down.png";
                        recommendtionText = " Not Recommended" + "<br><br>";
                    }
                }
            }
           
            var Personal = db.applicantdetails.Where(x => x.applicantid == aid && x.universityid == universityID).FirstOrDefault();
            if (Personal != null)
            {
                institutionapplied = objCom.GetUniversityName(universityID);
                familyname = Personal.lastname;
                firstname = Personal.firstname;
                middlename = Personal.middlename;
                dateofbirth = Convert.ToDateTime(Personal.dateofbirth).ToString("dd-MM-yyyy");

                gtereportNo = Personal.gtereportNO;
                if (Personal.profilephoto != null)
                    profileURL = webURL + "/Docs/GTEProfileDetail/" + Personal.profilephoto;
                else
                    divProfile.Attributes.Add("style", "display:none;");
                courseapplied = objCom.GetDetailedFieldDescription(Convert.ToInt32(Personal.detailedFieldIDyouwillComplete));
                int? genderid = Personal.gender;
                if (Personal.gender != null)
                    gender = " " + db.gender_master.Where(x => x.id == genderid).Select(x => x.description).FirstOrDefault();

                if (Personal.residentialcountry != null)
                    countryofresidence = objCom.GetCountryDiscription(Convert.ToInt32(Personal.residentialcountry));

                passportno = Personal.passportno;
                if (Personal.nationality != null)
                    nationality = objCom.GetCountryDiscription(Convert.ToInt32(Personal.nationality));
                if (Personal.isstudentreferbyagent == 1)
                {
                    if (Personal.agentid != null)
                        facilitingagent = db.agentmaster.Where(x => x.agentid == Personal.agentid).Select(x => x.agentname).FirstOrDefault();
                }
                else if (Personal.isstudentreferbyagent == 0)
                    facilitingagent = "NOT SET";
                if (!string.IsNullOrEmpty(Personal.what_package))
                    packagapplied = Personal.what_package;
                else
                    packagapplied = "None";

                var date1 = db.students.Where(x => x.studentid == aid).Select(x => x.creationdate).FirstOrDefault();
                if (date1 != null)
                    RegisteredDate = Convert.ToDateTime(date1).ToString("dd/MM/yyy");

                if (Personal.Is_clarification_submitted_date != null)
                    assessment_date = Convert.ToDateTime(Personal.Is_clarification_submitted_date).ToString("dd/MM/yyyy");

                var date3 = db.gte_report_admin_comment.Where(x => x.applicant_id == aid && x.university_id == universityID).Select(x => x.reported_date).FirstOrDefault();
                if (date3 != null)
                    report_date = Convert.ToDateTime(date3).ToString("dd/MM/yyyy");
                
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }

    private int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
            age = age - 1;

        return age;
    }

    private void downloadGTECertificate(int ApplicantID)
    {

        int universityID = Utility.GetUniversityId();

        if (ApplicantID == 0 || universityID == 0)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Invalid Details');window.location='" + webURL + "admin/default.aspx';", true);

        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.Default;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(ApplicantID);
        if (Is_new_applicant == true)
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_certificateN.aspx?token=XS7MKjHLunMAvqzCGr&downloadPdf=1&applicantId=" + ApplicantID + "&universityId=" + universityID, null, filePath);
        else
            htmlToPdf.GeneratePdfFromFile(webURL + "gte_certificate1.aspx?token=XS7MKjHLunMAvqzCGr&downloadPdf=1&applicantId=" + ApplicantID + "&universityId=" + universityID, null, filePath);

        var mode = "new";
        gte_progressbar objmapping = new gte_progressbar();
        var data = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();

        if (data != null)
        {
            mode = "update";
            objmapping = data;
        }
        objmapping.certificatepath = fileName;
        if (mode == "new")
            db.gte_progressbar.Add(objmapping);
        db.SaveChanges();

        HttpContext.Current.Response.ContentType = "application/pdf";
        HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=GTE_Certificate.pdf");
        HttpContext.Current.Response.TransmitFile(filePath);

        HttpContext.Current.Response.Flush();

    }

    protected void btncertificate_Click(object sender, EventArgs e)
    {
        downloadGTECertificate(ApplicantID);
    }
    private void downloadSOPReport(int applicantID, string type)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A4;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);

        var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(applicantID);
        if (Is_new_applicant == true)
            htmlToPdf.GeneratePdfFromFile(webURL + "sop_reportN.aspx?token=YKUcfdhNWwp17azByk&applicantId=" + applicantID + "&type=" + type + "&downloadPdf=1", null, filePath);
        else
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/sopreport.aspx?token=YKUcfdhNWwp17azByk&id=" + applicantID + "&type=" + type + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + type + "_SOP_Report_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }

    protected void btnsop_Click(object sender, EventArgs e)
    {
        downloadSOPReport(ApplicantID, "Final");
    }

    private void downloadGTEReport(int applicantID, string type)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A3;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        var Is_new_applicant = objCom.GetIS_oldOrNew_applicant(applicantID);
        if (Is_new_applicant == true)
        {
            var CID = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();

            if (Is_new_applicant == true)
                if (!string.IsNullOrEmpty(CID.gtereportNO))
                    htmlToPdf.GeneratePdfFromFile(webURL + "gte_ReportN.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&CID=" + CID.gtereportNO + "&downloadPdf=1", null, filePath);
        }
        else
            htmlToPdf.GeneratePdfFromFile(webURL + "admin/gtereport.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&type=" + type + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + type + "_GTE_Report_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }

    protected void btngte_Click(object sender, EventArgs e)
    {
        downloadGTEReport(ApplicantID, "Final");
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        if (previous_applicantid != 0)
            Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + previous_applicantid, true);
        else
            divPrev.Attributes.Add("style", "display:none;");
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        if (next_applicantid != 0)
            Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + next_applicantid, true);
        else
            divnext.Attributes.Add("style", "display:none;");
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/manage_application.aspx", true);
    }

    protected void ddlapplicant_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlapplicant.SelectedValue != null)
        {
            int aid = Convert.ToInt32(ddlapplicant.SelectedValue);
            if (aid != 0)
                Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + aid, true);
        }
    }

    protected void btnresendotp_Click(object sender, EventArgs e)
    {
        try
        {
            var password = objCom.EncodePasswordToMD5(Hidpassword.Value);

            int adminID = Convert.ToInt32(Session["UserID"]);
            var adminData = db.adminusers.Where(x => x.adminid == adminID).FirstOrDefault();
            //var studentInfo = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            var studentInfo = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();

            if (adminData.password == password)
            {
                var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();

                //resnd otp to applicant as well as loggedin admin

                StringBuilder sb1 = new StringBuilder();
                sb1.Append("Dear " + studentInfo.name + "<br/>");
                sb1.Append("Based on your resend request, please find below the Online Time Password (OTP) details:" + "<br/>");
                sb1.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                sb1.Append("<li>" + "Applicant Name: " + studentInfo.name + "</li>");
                sb1.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                sb1.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                sb1.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                sb1.Append("Thank you" + "<br/>");
                sb1.Append("Support Team." + "<br/>");

                objCom.SendMail(studentInfo.email, sb1.ToString(), "Your OTP resend request was successful.");

                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + adminData.name + "<br/>");
                sb.Append("Based on your resend request, please find below the Online Time Password (OTP) details:" + "<br/>");
                sb.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                sb.Append("<li>" + "Applicant Name: " + studentInfo.name + "</li>");
                sb.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                sb.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                sb.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                sb.Append("Thank you" + "<br/>");
                sb.Append("Support Team." + "<br/>");
                objCom.SendMail(adminData.email, sb.ToString(), "Your OTP resend request was successful for applicant ID " + ApplicantID);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnfinalreport_Click(object sender, EventArgs e)
    {
        try
        {
            var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            var students = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();
            var gtereportsubmitteddate = db.gte_report_admin_comment.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID).FirstOrDefault();
            var gteProgressData = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).FirstOrDefault();
            var sheduleData = db.applicant_meeting_schedule.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.is_otpverified == true).FirstOrDefault();
            var proctorname = string.Empty;
            if (sheduleData != null)
                proctorname = db.proctor_master.Where(x => x.proctorID == sheduleData.proctor_id).Select(x => x.name).FirstOrDefault();

            if (gtereportsubmitteddate != null)
            {
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_reportNotification.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

                html = html.Replace("@familyname", details.lastname);
                html = html.Replace("@studentname", details.firstname);
                html = html.Replace("@firstname", details.firstname);
                html = html.Replace("@middlename", details.middlename);
                html = html.Replace("@dob", Convert.ToDateTime(details.dateofbirth).ToString("dd/MM/yyyy"));
                html = html.Replace("@countryofresidence", objCom.GetCountryDiscription(Convert.ToInt32(details.residentialcountry)));
                html = html.Replace("@passportno", details.passportno);
                html = html.Replace("@nationality", objCom.GetCountryDiscription(Convert.ToInt32(details.nationality)));
                html = html.Replace("@institutionapplied", objCom.GetUniversityName(universityID));
                html = html.Replace("@courseapplied", "None");
                html = html.Replace("@package", details.what_package);
                html = html.Replace("@proctorname", proctorname);
                dynamic facilitingagenttxt = "None";
                if (details.isstudentreferbyagent == 1)
                {
                    if (details.agentid != null)
                        facilitingagenttxt = db.agentmaster.Where(x => x.agentid == details.agentid).Select(x => x.agentname).FirstOrDefault();
                }
                else if (details.isstudentreferbyagent == 0)
                    facilitingagenttxt = "None";

                html = html.Replace("@facilitingagent", facilitingagenttxt);
                html = html.Replace("@registrationdate", Convert.ToDateTime(students.creationdate).ToString("dd/MM/yyyy"));
                html = html.Replace("@assessmentdate", Convert.ToDateTime(details.Is_clarification_submitted_date).ToString("dd/MM/yyyy"));
                html = html.Replace("@reportdate", Convert.ToDateTime(gtereportsubmitteddate.reported_date).ToString("dd/MM/yyyy"));
                if (gtereportsubmitteddate.recommendedwithcaution == 1)
                    html = html.Replace("@finalrecommendation", "Recommended");
                else if (gtereportsubmitteddate.recommendedwithcaution == 2)
                    html = html.Replace("@finalrecommendation", "Recommended with caution");
                else if (gtereportsubmitteddate.recommendedwithcaution == 3)
                    html = html.Replace("@finalrecommendation", "Not Recommended");

                var final_maxix_value_col1 = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == 0 && x.colname == "1").FirstOrDefault();
                if (final_maxix_value_col1 != null)
                {
                    var col1 = final_maxix_value_col1.score + " / " + final_maxix_value_col1.percentage + "%";
                    html = html.Replace("@levelofrisk", col1);
                }
                else
                    html = html.Replace("@levelofrisk", "High / score -89 ");

                var final_maxix_value_col2 = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == 0 && x.colname == "2").FirstOrDefault();
                if (final_maxix_value_col2 != null)
                {
                    var col2 = final_maxix_value_col2.score + " / " + final_maxix_value_col2.percentage + "%";
                    html = html.Replace("@levelofsatisfaction", col2);
                }
                else
                    html = html.Replace("@levelofsatisfaction", "High / score -89 ");

                var final_maxix_value_col3 = db.gte_report_matrixValue.Where(x => x.applicantid == ApplicantID && x.universityid == universityID && x.tag_id == 0 && x.colname == "3").FirstOrDefault();
                if (final_maxix_value_col3 != null)
                {
                    var col2 = final_maxix_value_col3.score + " / " + final_maxix_value_col3.percentage + "%";
                    html = html.Replace("@severityrisk", col2);
                }
                else
                    html = html.Replace("@severityrisk", "High / score -89 ");

                var certificatURL = webURL + "admin/gte_certificateN.aspx?CID=" + gteProgressData.certificate_name;
                html = html.Replace("@certificateURL", certificatURL);

                var evalutionURL = webURL + "gte_ReportN.aspx?id=" + ApplicantID + "&CID=" + details.gtereportNO;
                html = html.Replace("@evalutionURL", evalutionURL);

                var sopURL = webURL + "admin/gte_sopReport.aspx?applicantId=" + ApplicantID + "&universityId=" + universityID;
                html = html.Replace("@sopURL", sopURL);

                var GTEDeclaration = webURL + "gte_declaration_download.aspx?id=" + ApplicantID + "&UniversityID=" + universityID;
                html = html.Replace("@GTEDeclaration", GTEDeclaration);

                var docUploadURL = webURL + "admin/view_gteapplicatdocuments_.aspx?applicantId=" + ApplicantID + "&UniversityID=" + universityID;
                html = html.Replace("@docUploadURL", docUploadURL);


                var LoginURL = webURL + "admin/login.aspx";
                html = html.Replace("@Loginurl", LoginURL);
                html = html.Replace("@supportemail", "support@gte.direct.com");
                html = html.Replace("@contactno", "+61-417-952-875"/*university.mobile*/);
                html = html.Replace("@proctorname", proctorname);
                int performance_category = Convert.ToInt32(gteProgressData.performance_category);
                html = html.Replace("@certificategrade", db.gte_certificatelevel_description.Where(x => x.id == performance_category).Select(x => x.grade).FirstOrDefault());
                html = html.Replace("@certificatepercentage", gteProgressData.gte_perdentage_score);
                html = html.Replace("@AID", Convert.ToString(details.applicantid));
                objCom.SendMail(university.emai_notification1, html, "GTE Direct: " + details.applicantid + " Final Report Ready for " + details.firstname + " " + details.lastname);

                objCom.SendMail(university.emai_notification2, html, "GTE Direct: " + details.applicantid + " Final Report Ready for " + details.firstname + " " + details.lastname);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The Final GTE Evalution report has been sent.')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Admin feedback not yet submitted.')", true);

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btndocreminder_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> DocRequirement = new List<string>();

            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 183) == false)
                DocRequirement.Add(objCom.Get_gte_docName(183));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 184) == false)
                DocRequirement.Add(objCom.Get_gte_docName(184));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 185) == false)
                DocRequirement.Add(objCom.Get_gte_docName(185));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 186) == false)
                DocRequirement.Add(objCom.Get_gte_docName(186));

            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 188) == false)
                DocRequirement.Add(objCom.Get_gte_docName(188));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 189) == false)
                DocRequirement.Add(objCom.Get_gte_docName(189));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 190) == false)
                DocRequirement.Add(objCom.Get_gte_docName(190));

            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 196) == false)
                DocRequirement.Add(objCom.Get_gte_docName(196));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 197) == false)
                DocRequirement.Add(objCom.Get_gte_docName(197));
            if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 198) == false)
                DocRequirement.Add(objCom.Get_gte_docName(198));

            var details = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
            if (details != null)
            {
                if (details.Iscurrentlyworking != null && details.Isjoboffered != null)
                {
                    if (details.Iscurrentlyworking == 1)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 193) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(193));
                    }
                    if (details.Isjoboffered == 1)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 194) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(194));
                    }
                }

                if (details.maritalstatus != null && (details.maritalstatus == 3 || details.maritalstatus == 2))
                {
                    if (details.maritalstatus == 3)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 200) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(200));
                    }

                    if (details.maritalstatus == 2)
                    {
                        if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 201) == false)
                            DocRequirement.Add(objCom.Get_gte_docName(201));
                    }
                }
                var clarification_response = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.clarification_question_id == 41).Select(x => x.applicant_response).FirstOrDefault();
                if (clarification_response != null && clarification_response != "0")
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 202) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(202));
                }

                var section3_question16 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 16 && x.applicant_response == false).FirstOrDefault();
                if (section3_question16 != null)
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 203) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(203));
                }


                var section3_question14 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 14 && x.applicant_response == true).FirstOrDefault();
                var section3_question28 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 28 && x.applicant_response == false).FirstOrDefault();

                if (section3_question28 != null && section3_question14 != null)
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 205) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(205));
                }
                if (section3_question28 != null)
                {
                    if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 206) == false)
                        DocRequirement.Add(objCom.Get_gte_docName(206));
                }
            }
            var IsGteCertificate = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).Select(x => x.is_gte_certificate_generated).FirstOrDefault();
            if (IsGteCertificate != null && IsGteCertificate == true)
            {
                if (objCom.Is_doc_submittedbyapplicant(ApplicantID, 208) == false)
                    DocRequirement.Add(objCom.Get_gte_docName(208));
            }
            if (DocRequirement.Count > 0)
            {

                var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
                var sheduleData = db.applicant_meeting_schedule.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.is_otpverified == true).FirstOrDefault();
                var proctorname = string.Empty;
                if (sheduleData != null)
                    proctorname = db.proctor_master.Where(x => x.proctorID == sheduleData.proctor_id).Select(x => x.name).FirstOrDefault();

                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_supportDocReminder.html"));
                html = html.Replace("@UniversityName", university.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

                html = html.Replace("@studentname", objCom.GetApplicantFirstName(ApplicantID));
                html = html.Replace("@startlist", "<ol>");
                dynamic data = string.Empty;
                foreach (var item in DocRequirement)
                {
                    //listcontent
                    data += "<li>" + item + "</li><br/>";
                }
                html = html.Replace("@listcontent", data);
                html = html.Replace("@endlist", "<ol>");

                var adminurl = webURL + "admin/login.aspx";

                html = html.Replace("@Loginurl", adminurl);
                html = html.Replace("@proctorname", proctorname);
                if (university.full_service == 0)
                    html = html.Replace("team", "GTE Direct Team");
                else if (university.full_service == 2)
                    html = html.Replace("team", "The Assessment Centre Team");
                else
                    html = html.Replace("team", "The Application Centre Team");
                objCom.SendMail(details.email, html, "GTE Direct: Reminder to upload your documents");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Documents upload reminder sent.')", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btncounsellor_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "counsellor_report.aspx?aid=" + ApplicantID + "&downloadPdf=0&uid=" + universityID, true);
    }
    private void populateAppliedCourseData()
    {
        appliedcourseData = (from am in db.applicationmaster
                             join cm in db.coursemaster on am.course equals cm.courseid
                             where am.universityid == universityID && am.applicantid == ApplicantID
                             select cm).ToList();
    }

    protected void btn_downloadalldetails_Click(object sender, EventArgs e)
    {
        downloadApplicantDetails(ApplicantID);
    }
    private void downloadApplicantDetails(int applicantID)
    {
        universityName = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID && x.IsDeleted != 1).Select(x => x.university_name).FirstOrDefault();
        var applicantdetails = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();
        var applicantemployerdetails = db.applicantemployerdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).ToList();
        var applicantlanguagecompetency = db.applicantlanguagecompetency.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();
        var applicanteducationdetails = db.applicanteducationdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();

        Application xlApp = new Application();
        if (xlApp == null)
        {
            objLog.WriteLog("Excel is not properly installed.");
            return;
        }

        Workbook xlWorkBook = xlApp.Workbooks.Add(Type.Missing);

        Worksheet socialWorksheet = (Worksheet)xlApp.Worksheets.Add();
        socialWorksheet.Name = "Social Details";
        FillSocialDetailSheet(applicantdetails, socialWorksheet);

        Worksheet workExperienceWorksheet = (Worksheet)xlApp.Worksheets.Add();
        workExperienceWorksheet.Name = "Work Experience Details";
        FillWorkExperienceDetailSheet(applicantemployerdetails, workExperienceWorksheet);

        Worksheet languageWorksheet = (Worksheet)xlApp.Worksheets.Add();
        languageWorksheet.Name = "Language Competency Details";
        FillLanguageCompetencyDetailSheet(applicantlanguagecompetency, languageWorksheet);

        Worksheet educationWorksheet = (Worksheet)xlApp.Worksheets.Add();
        educationWorksheet.Name = "Education Details";
        FillEducationDetailSheet(applicanteducationdetails, educationWorksheet);

        Worksheet identificationWorksheet = (Worksheet)xlApp.Worksheets.Add();
        identificationWorksheet.Name = "Identification Details";
        FillIdentificationSheet(applicantdetails, identificationWorksheet);

        Worksheet contactWorksheet = (Worksheet)xlApp.Worksheets.Add();
        contactWorksheet.Name = "Contact Details";
        FillContactDetailSheet(applicantdetails, contactWorksheet);

        Worksheet persoanlWorkSheet = (Worksheet)xlApp.Worksheets.Add();
        persoanlWorkSheet.Name = "Personal Details";
        FillPersonalDetailSheet(applicantdetails, persoanlWorkSheet);

        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string filePath = string.Concat(dirPath, "/", Guid.NewGuid() + ".xls");
        DirectoryInfo di = new DirectoryInfo(dirPath);
        if (!di.Exists)
            di.Create();
        xlWorkBook.SaveAs(filePath);
        xlWorkBook.Close();
        FileInfo file = new FileInfo(filePath);
        if (file.Exists)
        {
            string Outgoingfile = "applicant(" + applicantdetails.applicantid + ")-data.xlsx";
            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Outgoingfile);
            Response.AddHeader("Content-Length", file.Length.ToString());
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.WriteFile(file.FullName);
            Response.Flush();
            Response.Close();
        }
        else
        {
            Response.Write("This file does not exist.");
        }

    }
    private void FillIdentificationSheet(applicantdetails details, Worksheet worksheet)
    {

        string passportissueCountry = string.Empty;
        string alternativeIdentityProofId = string.Empty;
        string alternativeproofDobId = string.Empty;
        string alternativeresidenceProofId = string.Empty;

        worksheet.Name = "Identification Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "Passport Number";
        worksheet.Cells[1, 4] = "Date Of Issue";
        worksheet.Cells[1, 5] = "Expiry Date";
        worksheet.Cells[1, 6] = "Country Of Issue";
        worksheet.Cells[1, 7] = "City Of Issue";
        worksheet.Cells[1, 8] = "Alternate Proof Of Identity";
        worksheet.Cells[1, 9] = "Identity Proof Number";
        worksheet.Cells[1, 10] = "Alternate Proof Of DOB";
        worksheet.Cells[1, 11] = "DOB Proof Number";
        worksheet.Cells[1, 12] = "Alternate Proof Of Residence";
        worksheet.Cells[1, 13] = "Residence Proof Number";
        if (details != null)
        {
            if (details.passportissuecountry != null)
            {
                int intPassportCountry = Convert.ToInt32(details.passportissuecountry);
                passportissueCountry = db.countriesmaster.Where(x => x.id == intPassportCountry).Select(x => x.country_name).FirstOrDefault();
            }
            if (details.alternativeIdentityproofId.HasValue)
                alternativeIdentityProofId = db.alternateidproofmaster.Where(x => x.id == details.alternativeIdentityproofId).Select(x => x.description).FirstOrDefault();
            if (details.alternativeproofdobId.HasValue)
                alternativeproofDobId = db.alternatedobproof.Where(x => x.id == details.alternativeproofdobId).Select(x => x.description).FirstOrDefault();
            if (details.alternativeresidenceproofId.HasValue)
                alternativeresidenceProofId = db.alternateadressproofmaster.Where(x => x.id == details.alternativeresidenceproofId).Select(x => x.description).FirstOrDefault();


            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = string.IsNullOrEmpty(details.passportno) ? "N/A" : details.passportno;
            worksheet.Cells[2, 4] = details.passportissuedate.HasValue ? details.passportissuedate.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 5] = details.passportexpirydate.HasValue ? details.passportexpirydate.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 6] = passportissueCountry;
            worksheet.Cells[2, 7] = string.IsNullOrEmpty(details.passportissuecity) ? "N/A" : details.passportissuecity;
            worksheet.Cells[2, 8] = alternativeIdentityProofId;
            worksheet.Cells[2, 9] = string.IsNullOrEmpty(details.alternativeIdentityproofno) ? "N/A" : details.alternativeIdentityproofno;
            worksheet.Cells[2, 10] = alternativeproofDobId;
            worksheet.Cells[2, 11] = string.IsNullOrEmpty(details.alternativeproofdobno) ? "N/A" : details.alternativeproofdobno;
            worksheet.Cells[2, 12] = alternativeresidenceProofId;
            worksheet.Cells[2, 13] = string.IsNullOrEmpty(details.alternativeresidenceproofno) ? "N/A" : details.alternativeresidenceproofno;
        }
    }

    private void FillLanguageCompetencyDetailSheet(applicantlanguagecompetency details, Worksheet worksheet)
    {
        string countryofCourse = string.Empty;
        string studyMode = string.Empty;
        string qualificationType = string.Empty;
        string gradeType = string.Empty;
        string cefrLevel = string.Empty;
        string giveenglishTest = string.Empty;
        string isfinalGradeachieved = string.Empty;
        string isenglishIntesive = string.Empty;
        string homeLanguage = "N/A";

        worksheet.Name = "LanguageCompetency Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "Home Language";
        worksheet.Cells[1, 4] = "English Language Intensive Course";
        worksheet.Cells[1, 5] = "Country of English Language Intensive ";
        worksheet.Cells[1, 6] = "Year Of Completion";
        worksheet.Cells[1, 7] = "Institute Name";
        worksheet.Cells[1, 8] = "Study Mode";
        worksheet.Cells[1, 9] = "Qualification Type";
        worksheet.Cells[1, 10] = "Qualification  Name";
        worksheet.Cells[1, 11] = "Grade Type";
        worksheet.Cells[1, 12] = "Final Grade Achieved";
        worksheet.Cells[1, 13] = "Expected Date Of Result";
        worksheet.Cells[1, 14] = "English Language Competency Test";
        worksheet.Cells[1, 15] = "Test Name";
        worksheet.Cells[1, 16] = "Candidate Number";
        worksheet.Cells[1, 17] = "Candidate Id";
        worksheet.Cells[1, 18] = "Test Date";
        worksheet.Cells[1, 19] = "Overall Score";
        worksheet.Cells[1, 20] = "Speaking Score";
        worksheet.Cells[1, 21] = "Lisening Score";
        worksheet.Cells[1, 22] = "Reading Score";
        worksheet.Cells[1, 23] = "Writing Score";
        worksheet.Cells[1, 24] = "CERF Level";
        worksheet.Cells[1, 25] = "Test Reference Number";
        if (details != null)
        {
            if (details.countryofcourse != null)
            {
                int intcountryofcourse = Convert.ToInt32(details.countryofcourse);
                countryofCourse = db.countriesmaster.Where(x => x.id == intcountryofcourse).Select(x => x.country_name).FirstOrDefault();
            }
            if (details.studymode.HasValue)
                studyMode = db.studymodemaster.Where(x => x.id == details.studymode).Select(x => x.description).FirstOrDefault();

            if (details.qualificationtype.HasValue)
                qualificationType = db.qualificationmaster.Where(x => x.qualificationid == details.qualificationtype).Select(x => x.qualificationname).FirstOrDefault();

            if (!string.IsNullOrEmpty(details.gradetype))
            {
                int intgradetype = Convert.ToInt32(details.gradetype);
                gradeType = db.grademaster.Where(x => x.id == intgradetype).Select(x => x.description).FirstOrDefault();
            }
            if (!string.IsNullOrEmpty(details.cefrlevel))
            {
                int intcefrlevel = Convert.ToInt32(details.cefrlevel);
                cefrLevel = db.cefrlevelmaster.Where(x => x.id == intcefrlevel).Select(x => x.name).FirstOrDefault();
            }
            if (details.giveenglishtest != null && details.giveenglishtest.Value == 1)
                giveenglishTest = "IELTS";
            else if (details.giveenglishtest != null && details.giveenglishtest.Value == 2)
                giveenglishTest = "PTE";
            else if (details.giveenglishtest != null && details.giveenglishtest.Value == 3)
                giveenglishTest = "TOEFL";

            if (details.isfinalgradeachieved != null && details.isfinalgradeachieved.Value == 1)
                isfinalGradeachieved = "Results Declared";
            else if (details.isfinalgradeachieved != null && details.isfinalgradeachieved.Value == 2)
                isfinalGradeachieved = "Examination not conducted yet";
            else if (details.isfinalgradeachieved != null && details.isfinalgradeachieved.Value == 3)
                isfinalGradeachieved = "Examination Conducted, but Result not declared";

            if (details.isenglishintesive != null && details.isenglishintesive.Value == 1)
                isenglishIntesive = "Yes";
            else if (details.isenglishintesive != null && details.isenglishintesive.Value == 2)
                isenglishIntesive = "No-I am currently still studying for my English Language Course";
            else if (details.isenglishintesive != null && details.isenglishintesive.Value == 3)
                isenglishIntesive = "No-I have not studied an English Language Intensive Course for people from non-English speaking backgrounds";

            if (details.homelanuage.HasValue)
                homeLanguage = objCom.GetStudyMedium(details.homelanuage.Value);

            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = homeLanguage;
            worksheet.Cells[2, 4] = isenglishIntesive;
            worksheet.Cells[2, 5] = string.IsNullOrEmpty(countryofCourse) ? "N/A" : countryofCourse;
            worksheet.Cells[2, 6] = details.yearofcompletion.HasValue ? details.yearofcompletion.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 7] = string.IsNullOrEmpty(details.instituename) ? "N/A" : details.instituename;
            worksheet.Cells[2, 8] = string.IsNullOrEmpty(studyMode) ? "N/A" : studyMode;
            worksheet.Cells[2, 9] = string.IsNullOrEmpty(qualificationType) ? "N/A" : qualificationType;
            worksheet.Cells[2, 10] = string.IsNullOrEmpty(details.qualificationname) ? "N/A" : details.qualificationname;
            worksheet.Cells[2, 11] = string.IsNullOrEmpty(gradeType) ? "N/A" : gradeType;
            worksheet.Cells[2, 12] = string.IsNullOrEmpty(isfinalGradeachieved) ? "N/A" : isfinalGradeachieved;
            worksheet.Cells[2, 13] = details.expectedgraderesult.HasValue ? details.expectedgraderesult.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 14] = giveenglishTest;
            worksheet.Cells[2, 15] = string.IsNullOrEmpty(details.testname) ? "N/A" : details.testname;
            worksheet.Cells[2, 16] = string.IsNullOrEmpty(details.candidateno) ? "N/A" : details.candidateno;
            worksheet.Cells[2, 17] = string.IsNullOrEmpty(details.candidateid) ? "N/A" : details.candidateid;
            worksheet.Cells[2, 18] = details.examdate.HasValue ? details.examdate.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 19] = string.IsNullOrEmpty(details.overallscore) ? "N/A" : details.overallscore;
            worksheet.Cells[2, 20] = string.IsNullOrEmpty(details.speakingscore) ? "N/A" : details.speakingscore;
            worksheet.Cells[2, 21] = string.IsNullOrEmpty(details.listeningscore) ? "N/A" : details.listeningscore;
            worksheet.Cells[2, 22] = string.IsNullOrEmpty(details.readingscore) ? "N/A" : details.readingscore;
            worksheet.Cells[2, 23] = string.IsNullOrEmpty(details.writingscore) ? "N/A" : details.writingscore;
            worksheet.Cells[2, 24] = cefrLevel;
            worksheet.Cells[2, 25] = string.IsNullOrEmpty(details.testreportreferenceno) ? "N/A" : details.testreportreferenceno;

        }

    }

    private void FillWorkExperienceDetailSheet(List<applicantemployerdetails> lstApplicantemployerdetails, Worksheet worksheet)
    {

        string countryOfWork = string.Empty;
        string relationshipwithContact = string.Empty;

        worksheet.Name = "Work Experience Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant Id";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "wish to record work experience";
        worksheet.Cells[1, 4] = "Employement Record Id";
        worksheet.Cells[1, 5] = "Organization Name";
        worksheet.Cells[1, 6] = "Website Name";
        worksheet.Cells[1, 7] = "City";
        worksheet.Cells[1, 8] = "Country of work";
        worksheet.Cells[1, 9] = "Designation/Position";
        worksheet.Cells[1, 10] = "Start Date";
        worksheet.Cells[1, 11] = "End Date";
        worksheet.Cells[1, 12] = "Descrition of Work";
        worksheet.Cells[1, 13] = "Name of Reporting Manager";
        worksheet.Cells[1, 14] = "Employement Verification Contact Number";
        worksheet.Cells[1, 15] = "Relationship with Contact";
        worksheet.Cells[1, 16] = "EmailId Of Contact";
        worksheet.Cells[1, 17] = "LinkedIn Profile Link Of Contact";

        if (lstApplicantemployerdetails != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < lstApplicantemployerdetails.Count; i++)
            {
                var applicantemployerdetails = lstApplicantemployerdetails[i];
                worksheet.Cells[rowNumber, 1] = applicantemployerdetails.applicantid;
                worksheet.Cells[rowNumber, 2] = universityName;
                worksheet.Cells[rowNumber, 3] = applicantemployerdetails.wishtoaddemployer.HasValue && applicantemployerdetails.wishtoaddemployer.Value == 1 ? "yes" : "No";
                worksheet.Cells[rowNumber, 4] = applicantemployerdetails.employerid;
                worksheet.Cells[rowNumber, 5] = string.IsNullOrEmpty(applicantemployerdetails.organization) ? "N/A" : applicantemployerdetails.organization;
                worksheet.Cells[rowNumber, 6] = string.IsNullOrEmpty(applicantemployerdetails.website) ? "N/A" : applicantemployerdetails.website;
                worksheet.Cells[rowNumber, 7] = string.IsNullOrEmpty(applicantemployerdetails.city) ? "N/A" : applicantemployerdetails.city;
                if (applicantemployerdetails.country.HasValue)
                    countryOfWork = db.countriesmaster.Where(x => x.id == applicantemployerdetails.country).Select(x => x.country_name).FirstOrDefault();
                worksheet.Cells[rowNumber, 8] = countryOfWork;
                worksheet.Cells[rowNumber, 9] = string.IsNullOrEmpty(applicantemployerdetails.designation) ? "N/A" : applicantemployerdetails.designation;
                worksheet.Cells[rowNumber, 10] = applicantemployerdetails.durationfrom.HasValue ? applicantemployerdetails.durationfrom.Value.ToString("dd/MM/yyyy") : "N/A";
                worksheet.Cells[rowNumber, 11] = applicantemployerdetails.durationto.HasValue ? applicantemployerdetails.durationto.Value.ToString("dd/MM/yyyy") : "N/A";
                worksheet.Cells[rowNumber, 12] = string.IsNullOrEmpty(applicantemployerdetails.briefdescription) ? "N/A" : applicantemployerdetails.briefdescription;
                worksheet.Cells[rowNumber, 13] = string.IsNullOrEmpty(applicantemployerdetails.nameofreportingmanger) ? "N/A" : applicantemployerdetails.nameofreportingmanger;
                worksheet.Cells[rowNumber, 14] = string.IsNullOrEmpty(applicantemployerdetails.contactpersonwithdetails) ? "N/A" : applicantemployerdetails.contactpersonwithdetails;
                if (!string.IsNullOrEmpty(applicantemployerdetails.relationshipwithcontact))
                {
                    int intrelationshipwithcontact = Convert.ToInt32(applicantemployerdetails.relationshipwithcontact);
                    relationshipwithContact = db.realtionshipmaster.Where(x => x.relationshiptid == intrelationshipwithcontact).Select(x => x.relationshipname).FirstOrDefault();
                }
                worksheet.Cells[rowNumber, 15] = relationshipwithContact;
                worksheet.Cells[rowNumber, 16] = string.IsNullOrEmpty(applicantemployerdetails.emailid) ? "N/A" : applicantemployerdetails.emailid;
                worksheet.Cells[rowNumber, 17] = string.IsNullOrEmpty(applicantemployerdetails.linkedinidofcontact) ? "N/A" : applicantemployerdetails.linkedinidofcontact;

                rowNumber++;
            }
        }
    }

    private void FillEducationDetailSheet(applicanteducationdetails details, Worksheet worksheet)
    {
        List<applicantsubjectwisegrade> applicantsubjectwisegrade = null;

        string ishighschoolDone = string.Empty;
        string highschoolCountry = string.Empty;
        string highschoolqualificationType = string.Empty;
        string highschoolmodeId = string.Empty;
        string highschoolmediumId = string.Empty;
        string highschoolgradetypeId = string.Empty;
        string highschoolgradeDeclared = string.Empty;
        string highschoolverificationRelationship = string.Empty;

        string issecondaryDone = string.Empty;
        string secondaryCountry = string.Empty;
        string secondaryqualificationType = string.Empty;
        string secondarymodeStudy = string.Empty;
        string secondarymediumStudy = string.Empty;
        string secondarygradetypeId = string.Empty;
        string secondarygradeDeclared = string.Empty;
        string secondaryverificationRelationship = string.Empty;

        string isdiplomaDone = string.Empty;
        string diplomaCountry = string.Empty;
        string diplomaqualificationType = string.Empty;
        string diplomastudymodeId = string.Empty;
        string diplomamediumId = string.Empty;
        string diplomagradetypeId = string.Empty;
        string diplomaGradeachieved = string.Empty;
        string diplomaverificationRelationship = string.Empty;


        worksheet.Name = "Education Details";
        worksheet.Activate();

        ////High School
        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "Completed High School ";
        worksheet.Cells[1, 4] = "Country Of Highest School";
        worksheet.Cells[1, 5] = "High School Start Date";
        worksheet.Cells[1, 6] = "High School End Date";
        worksheet.Cells[1, 7] = "Name Of School";
        worksheet.Cells[1, 8] = "High School Qualification Name";
        worksheet.Cells[1, 9] = "High School Mode oF Study";
        worksheet.Cells[1, 10] = "High School Language Of Study";
        worksheet.Cells[1, 11] = "High School Grade Type";
        worksheet.Cells[1, 12] = "High School Final Grade Achieved";
        worksheet.Cells[1, 13] = "High School Expected Result Date";
        worksheet.Cells[1, 14] = "Name Of Contact Verfied High School Qualification";
        worksheet.Cells[1, 15] = "Relationship with contact";
        worksheet.Cells[1, 16] = "EmailId of contact";
        worksheet.Cells[1, 17] = "Mobile Number of contact";
        worksheet.Cells[1, 18] = "Higher Degree";

        ////Sec School

        worksheet.Cells[1, 19] = "Completed Secondary School ";
        worksheet.Cells[1, 20] = "Country Of Secondary School";
        worksheet.Cells[1, 21] = "start Date";
        worksheet.Cells[1, 22] = "End Date";
        worksheet.Cells[1, 23] = "Name Of Institute";
        worksheet.Cells[1, 24] = "Qualification Name";
        worksheet.Cells[1, 25] = "Mode oF Study";
        worksheet.Cells[1, 26] = "Language Of Study";
        worksheet.Cells[1, 27] = "Grade Type";
        worksheet.Cells[1, 28] = "Final Grade Achieved";
        worksheet.Cells[1, 29] = "Expected Result Date";
        worksheet.Cells[1, 30] = "Name Of Contact Verfied Scondary School Qualification";
        worksheet.Cells[1, 31] = "Relationship with contact";
        worksheet.Cells[1, 32] = "EmailId of contact";
        worksheet.Cells[1, 33] = "Mobile Number of contact";

        ///Diploma
        worksheet.Cells[1, 34] = "Completed Any Diploma";
        worksheet.Cells[1, 35] = "Country Of Diploma Certification";
        worksheet.Cells[1, 36] = "start Date";
        worksheet.Cells[1, 37] = "End Date";
        worksheet.Cells[1, 38] = "Name Of Institute";
        worksheet.Cells[1, 39] = "Qualification Name";
        worksheet.Cells[1, 40] = "Mode oF Study";
        worksheet.Cells[1, 41] = "Language Of Study";
        worksheet.Cells[1, 42] = "Grade Type";
        worksheet.Cells[1, 43] = "Final Grade Achieved";
        worksheet.Cells[1, 44] = "Expected Result Date";
        worksheet.Cells[1, 45] = "Name Of Contact Verfied Scondary School Qualification";
        worksheet.Cells[1, 46] = "Relationship with contact";
        worksheet.Cells[1, 47] = "EmailId of contact";
        worksheet.Cells[1, 48] = "Mobile Number of contact";

        if (details != null)
        {
            ///High School data

            if (details.ishighschooldone != null && details.ishighschooldone.Value == 1)
                ishighschoolDone = "Yes";
            else if (details.ishighschooldone != null && details.ishighschooldone.Value == 2)
                ishighschoolDone = "No- I am currently studying for my high school qualification";
            else if (details.ishighschooldone != null && details.ishighschooldone.Value == 3)
                ishighschoolDone = "No- I do not have a high school qualification";
            if (details.highschoolcountry.HasValue)
                highschoolCountry = db.countriesmaster.Where(x => x.id == details.highschoolcountry).Select(x => x.country_name).FirstOrDefault();
            if (details.highschoolqualificationtype.HasValue)
                highschoolqualificationType = db.qualificationmaster.Where(x => x.qualificationid == details.highschoolqualificationtype).Select(x => x.qualificationname).FirstOrDefault();
            if (details.highschoolmodeid.HasValue)
                highschoolmodeId = db.studymodemaster.Where(x => x.id == details.highschoolmodeid).Select(x => x.description).FirstOrDefault();
            if (details.highschoolmediumid.HasValue)
                highschoolmediumId = db.educationmediummaster.Where(x => x.id == details.highschoolmediumid).Select(x => x.description).FirstOrDefault();
            if (details.highschoolgradetypeid.HasValue)
                highschoolgradetypeId = db.grademaster.Where(x => x.id == details.highschoolgradetypeid).Select(x => x.description).FirstOrDefault();
            if (details.highschoolgradedeclared != null && details.highschoolgradedeclared.Value == 1)
                highschoolgradeDeclared = "Results Declared";
            else if (details.highschoolgradedeclared != null && details.highschoolgradedeclared.Value == 2)
                highschoolgradeDeclared = "Examination not conducted yet";
            else if (details.highschoolgradedeclared != null && details.highschoolgradedeclared.Value == 3)
                highschoolgradeDeclared = "Examination Conducted, but Result not declared";
            if (details.highschoolverificationrelationship.HasValue)
                highschoolverificationRelationship = db.educationverificationcontactmaster.Where(x => x.id == details.highschoolverificationrelationship).Select(x => x.description).FirstOrDefault();

            ///sec School data
            if (details.issecondarydone != null && details.issecondarydone.Value == 1)
                issecondaryDone = "Yes";
            else if (details.issecondarydone != null && details.issecondarydone.Value == 2)
                issecondaryDone = "No- I am currently studying for my higher qualification";
            else if (details.issecondarydone != null && details.issecondarydone.Value == 3)
                issecondaryDone = "No- I do not have a higher qualification";
            if (details.secondarycountry.HasValue)
                secondaryCountry = db.countriesmaster.Where(x => x.id == details.secondarycountry).Select(x => x.country_name).FirstOrDefault();
            if (details.secondaryqualificationtype.HasValue)
                secondaryqualificationType = db.qualificationmaster.Where(x => x.qualificationid == details.secondaryqualificationtype).Select(x => x.qualificationname).FirstOrDefault();
            if (details.secondarymodestudy.HasValue)
                secondarymodeStudy = db.studymodemaster.Where(x => x.id == details.secondarymodestudy).Select(x => x.description).FirstOrDefault();
            if (details.secondarymediumstudy.HasValue)
                secondarymediumStudy = db.educationmediummaster.Where(x => x.id == details.secondarymediumstudy).Select(x => x.description).FirstOrDefault();
            if (details.secondarygradetypeid.HasValue)
                secondarygradetypeId = db.grademaster.Where(x => x.id == details.secondarygradetypeid).Select(x => x.description).FirstOrDefault();
            if (details.secondarygradedeclared.Value == 1)
                secondarygradeDeclared = "Results Declared";
            else if (details.secondarygradedeclared.Value == 2)
                secondarygradeDeclared = "Examination not conducted yet";
            else if (details.secondarygradedeclared.Value == 3)
                secondarygradeDeclared = "Examination Conducted, but Result not declared";
            if (details.secondaryverificationrelationship.HasValue)
                secondaryverificationRelationship = db.educationverificationcontactmaster.Where(x => x.id == details.secondaryverificationrelationship).Select(x => x.description).FirstOrDefault();

            /// Diploma Data

            if (details.isdiplomadone != null && details.isdiplomadone.Value == 1)
                isdiplomaDone = "Yes";
            else if (details.isdiplomadone != null && details.isdiplomadone.Value == 2)
                isdiplomaDone = "No- I am currently studying for my Diploma/Certificate";
            else if (details.isdiplomadone != null && details.isdiplomadone.Value == 3)
                isdiplomaDone = "No - I do not have a Diploma/Certificate qualification";
            if (details.diplomacountry.HasValue)
                diplomaCountry = db.countriesmaster.Where(x => x.id == details.diplomacountry).Select(x => x.country_name).FirstOrDefault();
            if (details.diplomaqualificationtype.HasValue)
                diplomaqualificationType = db.qualificationmaster.Where(x => x.qualificationid == details.diplomaqualificationtype).Select(x => x.qualificationname).FirstOrDefault();
            if (details.diplomastudymodeid.HasValue)
                diplomastudymodeId = db.studymodemaster.Where(x => x.id == details.diplomastudymodeid).Select(x => x.description).FirstOrDefault();
            if (details.diplomamediumid.HasValue)
                diplomamediumId = db.educationmediummaster.Where(x => x.id == details.diplomamediumid).Select(x => x.description).FirstOrDefault();
            if (details.diplomagradetypeid.HasValue)
                diplomagradetypeId = db.grademaster.Where(x => x.id == details.diplomagradetypeid).Select(x => x.description).FirstOrDefault();
            if (details.diplomagradeachieved != null && details.diplomagradeachieved.Value == 1)
                diplomaGradeachieved = "Results Declared";
            else if (details.diplomagradeachieved != null && details.diplomagradeachieved.Value == 2)
                diplomaGradeachieved = "Examination not conducted yet";
            else if (details.diplomagradeachieved != null && details.diplomagradeachieved.Value == 3)
                diplomaGradeachieved = "Examination Conducted, but Result not declared";
            if (details.diplomaverificationrelationship.HasValue)
                diplomaverificationRelationship = db.educationverificationcontactmaster.Where(x => x.id == details.diplomaverificationrelationship).Select(x => x.description).FirstOrDefault();


            ///High School
            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = ishighschoolDone;
            worksheet.Cells[2, 4] = highschoolCountry;
            worksheet.Cells[2, 5] = string.IsNullOrEmpty(details.highschoolstartdate) ? "N/A" : details.highschoolstartdate;
            worksheet.Cells[2, 6] = string.IsNullOrEmpty(details.highschoolendate) ? "N/A" : details.highschoolendate;
            worksheet.Cells[2, 7] = string.IsNullOrEmpty(details.highschoolname) ? "N/A" : details.highschoolname;
            worksheet.Cells[2, 8] = highschoolqualificationType;
            worksheet.Cells[2, 9] = highschoolmodeId;
            worksheet.Cells[2, 10] = highschoolmediumId;
            worksheet.Cells[2, 11] = highschoolgradetypeId;
            worksheet.Cells[2, 12] = highschoolgradeDeclared;
            worksheet.Cells[2, 13] = details.highschoolreusltdate.Value.ToString("dd/MM/yyyy");
            worksheet.Cells[2, 14] = string.IsNullOrEmpty(details.highschoolverificationname) ? "n/A" : details.highschoolverificationname;
            worksheet.Cells[2, 15] = highschoolverificationRelationship;
            worksheet.Cells[2, 16] = string.IsNullOrEmpty(details.highschoolverificationemail) ? "N/A" : details.highschoolverificationemail;
            worksheet.Cells[2, 17] = string.IsNullOrEmpty(details.highschoolverificationmobile) ? "N/A" : details.highschoolverificationmobile;
            //  worksheet.Cells[2, 18] = string.IsNullOrEmpty(details.highestdegree) ? "N/A" : details.highestdegree;

            /// Sec School
            worksheet.Cells[2, 19] = issecondaryDone;
            worksheet.Cells[2, 20] = secondaryCountry;
            worksheet.Cells[2, 21] = string.IsNullOrEmpty(details.secondarystartdate) ? "N/A" : details.secondarystartdate;
            worksheet.Cells[2, 22] = string.IsNullOrEmpty(details.secondaryendate) ? "N/A" : details.secondaryendate;
            worksheet.Cells[2, 23] = string.IsNullOrEmpty(details.secondaryname) ? "N/A" : details.secondaryname;
            worksheet.Cells[2, 24] = secondaryqualificationType;
            worksheet.Cells[2, 25] = secondarymodeStudy;
            worksheet.Cells[2, 26] = secondarymediumStudy;
            worksheet.Cells[2, 27] = secondarygradetypeId;
            worksheet.Cells[2, 28] = secondarygradeDeclared;
            worksheet.Cells[2, 29] = details.secondaryresultdate.HasValue ? details.secondaryresultdate.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 30] = string.IsNullOrEmpty(details.secondaryverificationname) ? "N/A" : details.secondaryverificationname;
            worksheet.Cells[2, 31] = secondaryverificationRelationship;
            worksheet.Cells[2, 32] = string.IsNullOrEmpty(details.secondaryverificationemail) ? "N/A" : details.secondaryverificationemail;
            worksheet.Cells[2, 33] = string.IsNullOrEmpty(details.secondaryverificationmobile) ? "N/A" : details.secondaryverificationmobile;

            //Diploma
            worksheet.Cells[2, 34] = isdiplomaDone;
            worksheet.Cells[2, 35] = diplomaCountry;
            worksheet.Cells[2, 36] = string.IsNullOrEmpty(details.diplomastartdate) ? "N/A" : details.diplomastartdate;
            worksheet.Cells[2, 37] = string.IsNullOrEmpty(details.diplomaendate) ? "N/A" : details.diplomaendate;
            worksheet.Cells[2, 38] = string.IsNullOrEmpty(details.diplomaschoolname) ? "N/A" : details.diplomaschoolname;
            worksheet.Cells[2, 39] = diplomaqualificationType;
            worksheet.Cells[2, 40] = diplomastudymodeId;
            worksheet.Cells[2, 41] = diplomamediumId;
            worksheet.Cells[2, 42] = diplomagradetypeId;
            worksheet.Cells[2, 43] = diplomaGradeachieved;
            worksheet.Cells[2, 44] = details.diplomaresultdate.HasValue ? details.diplomaresultdate.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 45] = string.IsNullOrEmpty(details.diplomaverificationname) ? "N/A" : details.diplomaverificationname;
            worksheet.Cells[2, 46] = diplomaverificationRelationship;
            worksheet.Cells[2, 47] = string.IsNullOrEmpty(details.diplomaverificationemail) ? "N/A" : details.diplomaverificationemail;
            worksheet.Cells[2, 48] = string.IsNullOrEmpty(details.diplomaverificationmobile) ? "N/A" : details.diplomaverificationmobile;

            int rowNum = 2;
            applicantsubjectwisegrade = db.applicantsubjectwisegrade.Where(x => x.applicantid == details.applicantid).ToList();
            for (int i = 0; i < applicantsubjectwisegrade.Count; i++)
            {
                worksheet.Cells[1, 49] = "Course Name";
                worksheet.Cells[rowNum, 49] = applicantsubjectwisegrade[i].coursename;
                worksheet.Cells[1, 50] = "Subject Name";
                worksheet.Cells[rowNum, 50] = applicantsubjectwisegrade[i].subject_name;
                worksheet.Cells[1, 51] = "Other Subject";
                worksheet.Cells[rowNum, 51] = applicantsubjectwisegrade[i].othersubject;
                worksheet.Cells[1, 52] = "Grade Type";
                worksheet.Cells[rowNum, 52] = applicantsubjectwisegrade[i].gradeid;
                worksheet.Cells[1, 53] = "Grade";
                worksheet.Cells[rowNum, 53] = applicantsubjectwisegrade[i].grade;

                rowNum++;
            }
        }
    }

    private void FillContactDetailSheet(applicantdetails details, Worksheet worksheet)
    {
        List<applicantresidencehistory> residentHistory = null;
        string postalCountry = string.Empty;
        string residentialCountry = string.Empty;

        worksheet.Name = "Contact Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "Email ID";
        worksheet.Cells[1, 4] = "Mobile Number";
        worksheet.Cells[1, 5] = "Home Phone Number";
        worksheet.Cells[1, 6] = "Use Skype";
        worksheet.Cells[1, 7] = "Skype ID";
        worksheet.Cells[1, 8] = "Use Whats App";
        worksheet.Cells[1, 9] = "Whats App no. same as your mobile no.";
        worksheet.Cells[1, 10] = "Whats App Number";
        worksheet.Cells[1, 11] = "Postal Address 1";
        worksheet.Cells[1, 12] = "Postal Address 2";
        worksheet.Cells[1, 13] = "Postal Address 3";
        worksheet.Cells[1, 14] = "Postal City";
        worksheet.Cells[1, 15] = "Postal State";
        worksheet.Cells[1, 16] = "Postal Country";
        worksheet.Cells[1, 17] = "Postal Code";
        worksheet.Cells[1, 18] = "Residential Address same as Postal";
        worksheet.Cells[1, 19] = "Residential Address 1";
        worksheet.Cells[1, 20] = "Residential Address 2";
        worksheet.Cells[1, 21] = "Residential Address 3";
        worksheet.Cells[1, 22] = "Residential City";
        worksheet.Cells[1, 23] = "Residential State";
        worksheet.Cells[1, 24] = "Residential Country";
        worksheet.Cells[1, 25] = "Residential Code";
        worksheet.Cells[1, 26] = "Nominee Name";
        worksheet.Cells[1, 27] = "Nominee Relation";
        worksheet.Cells[1, 28] = "Nominee Email";
        worksheet.Cells[1, 29] = "Nominee Mobile";
        worksheet.Cells[1, 30] = "Current Address living duration less than 1 year";
        worksheet.Cells[1, 31] = "Previous Residential Address 1";
        worksheet.Cells[1, 32] = "Previous Residential Address 2";
        worksheet.Cells[1, 33] = "Previous Residential Address 3";
        worksheet.Cells[1, 34] = "Previous Residential City";
        worksheet.Cells[1, 35] = "Previous Residential State";
        worksheet.Cells[1, 36] = "Previous Residential Country";
        worksheet.Cells[1, 37] = "Previous Residential Code";
        worksheet.Cells[1, 38] = "Previous Residential Start Date";
        worksheet.Cells[1, 39] = "Previous Residential End Date";
        if (details != null)
        {
            if (details.postalcountry.HasValue)
                postalCountry = db.countriesmaster.Where(x => x.id == details.postalcountry).Select(x => x.country_name).FirstOrDefault();
            if (details.residentialcountry.HasValue)
                residentialCountry = db.countriesmaster.Where(x => x.id == details.residentialcountry).Select(x => x.country_name).FirstOrDefault();

            if (details.haspreviousresidence.HasValue && details.haspreviousresidence.Value)
            {
                int rowNum = 2;


                residentHistory = db.applicantresidencehistory.Where(x => x.applicantid == details.applicantid && x.universityid == universityID).ToList();
                for (int i = 0; i < residentHistory.Count; i++)
                {

                    worksheet.Cells[rowNum, 31] = residentHistory[i].residenceaddress1;
                    worksheet.Cells[rowNum, 32] = residentHistory[i].residenceaddress2;
                    worksheet.Cells[rowNum, 33] = residentHistory[i].residenceaddress3;
                    worksheet.Cells[rowNum, 34] = residentHistory[i].residentialcity;
                    worksheet.Cells[rowNum, 35] = residentHistory[i].residentialstate;
                    worksheet.Cells[rowNum, 36] = residentHistory[i].residentialcountry;
                    worksheet.Cells[rowNum, 37] = residentHistory[i].residencepostcode;
                    worksheet.Cells[rowNum, 38] = residentHistory[i].residencestartdate.Value.ToString("dd/MM/yyyy");
                    worksheet.Cells[rowNum, 39] = residentHistory[i].residenceenddate.Value.ToString("dd/MM/yyyy");
                    rowNum++;
                }
            }

            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = string.IsNullOrEmpty(details.email) ? "N/A" : details.email;
            worksheet.Cells[2, 4] = string.IsNullOrEmpty(details.mobileno) ? "N/A" : details.mobileno;
            worksheet.Cells[2, 5] = string.IsNullOrEmpty(details.homephone) ? "N/A" : details.homephone;
            worksheet.Cells[2, 6] = details.haveskypeid.HasValue && details.haveskypeid.Value == 1 ? "Yes" : "NO";
            worksheet.Cells[2, 7] = string.IsNullOrEmpty(details.skypeid) ? "N/A" : details.skypeid;
            worksheet.Cells[2, 8] = details.havewhatsup.HasValue && details.havewhatsup.Value == 1 ? "Yes" : "No";
            worksheet.Cells[2, 9] = details.isdifferentwhatsapp.HasValue && details.isdifferentwhatsapp == 1 ? "Yes" : "No";
            worksheet.Cells[2, 10] = string.IsNullOrEmpty(details.whatsappno) ? "N/A" : details.whatsappno;
            worksheet.Cells[2, 11] = string.IsNullOrEmpty(details.postaladdrees1) ? "N/A" : details.postaladdrees1;
            worksheet.Cells[2, 12] = string.IsNullOrEmpty(details.postaladdrees2) ? "N/A" : details.postaladdrees2;
            worksheet.Cells[2, 13] = string.IsNullOrEmpty(details.postaladdrees3) ? "N/A" : details.postaladdrees3;
            worksheet.Cells[2, 14] = string.IsNullOrEmpty(details.postalcity) ? "N/A" : details.postalcity;
            worksheet.Cells[2, 15] = string.IsNullOrEmpty(details.postalstate) ? "N/A" : details.postalstate;
            worksheet.Cells[2, 16] = postalCountry;
            worksheet.Cells[2, 17] = string.IsNullOrEmpty(details.postalpostcode) ? "N/A" : details.postalpostcode;
            worksheet.Cells[2, 18] = details.issameaspostal.HasValue && details.issameaspostal.Value == 1 ? "Yes" : "No";
            worksheet.Cells[2, 19] = string.IsNullOrEmpty(details.residentialaddress1) ? "N/A" : details.residentialaddress1;
            worksheet.Cells[2, 20] = string.IsNullOrEmpty(details.residentialaddress2) ? "N/A" : details.residentialaddress2;
            worksheet.Cells[2, 21] = string.IsNullOrEmpty(details.residentialaddress3) ? "N/A" : details.residentialaddress3;
            worksheet.Cells[2, 22] = string.IsNullOrEmpty(details.residentialcity) ? "N/A" : details.residentialcity;
            worksheet.Cells[2, 23] = string.IsNullOrEmpty(details.residentialstate) ? "N/A" : details.residentialstate;
            worksheet.Cells[2, 24] = residentialCountry;
            worksheet.Cells[2, 25] = string.IsNullOrEmpty(details.residentailpostcode) ? "N/A" : details.residentailpostcode;
            worksheet.Cells[2, 26] = string.IsNullOrEmpty(details.nomineefullname) ? "N/A" : details.nomineefullname;
            worksheet.Cells[2, 27] = string.IsNullOrEmpty(details.relationshipwithnominee) ? "N/A" : details.relationshipwithnominee;
            worksheet.Cells[2, 28] = string.IsNullOrEmpty(details.nomineeemail) ? "N/A" : details.nomineeemail;
            worksheet.Cells[2, 29] = string.IsNullOrEmpty(details.nomineemobile) ? "N/A" : details.nomineemobile;
            worksheet.Cells[2, 30] = details.haspreviousresidence.HasValue && details.haspreviousresidence.HasValue ? "Yes" : "NO";
        }
    }

    private void FillSocialDetailSheet(applicantdetails details, Worksheet worksheet)
    {

        worksheet.Name = "Social Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "Have LinkedIn Profile";
        worksheet.Cells[1, 4] = "LinkedIn Profile";
        worksheet.Cells[1, 5] = "Have Facebook Profile";
        worksheet.Cells[1, 6] = "Facebook Profile";
        worksheet.Cells[1, 7] = "Have Twitter Profile";
        worksheet.Cells[1, 8] = "Twitter Profile";
        if (details != null)
        {

            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = details.havelinkedinaccount.HasValue && details.havelinkedinaccount.Value ? "Yes" : "No";
            worksheet.Cells[2, 4] = string.IsNullOrEmpty(details.linkedprofile) ? "N/A" : details.linkedprofile;
            worksheet.Cells[2, 5] = details.havefacebookaccount.HasValue && details.havefacebookaccount.Value ? "Yes" : "No";
            worksheet.Cells[2, 6] = string.IsNullOrEmpty(details.facebookprofle) ? "N/A" : details.facebookprofle;
            worksheet.Cells[2, 7] = details.havetwitteraccount.HasValue && details.havetwitteraccount.Value ? "Yes" : "No";
            worksheet.Cells[2, 8] = string.IsNullOrEmpty(details.twiterprofile) ? "N/A" : details.twiterprofile;
        }

    }

    private void FillPersonalDetailSheet(applicantdetails details, Worksheet worksheet)
    {
        string nationality = string.Empty;
        string otherNationality = string.Empty;
        string countryOfBirth = string.Empty;
        string maritalStatus = string.Empty;
        string spouseNationality = string.Empty;
        string disabilityDesc = "N/A";
        string agentName = "N/A";
        string gender = string.Empty;

        worksheet.Name = "Personal Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "Institution";
        worksheet.Cells[1, 3] = "First Name";
        worksheet.Cells[1, 4] = "Middle Name";
        worksheet.Cells[1, 5] = "Family Name";
        worksheet.Cells[1, 6] = "Prefered Name";
        worksheet.Cells[1, 7] = "Passport First Name";
        worksheet.Cells[1, 8] = "Passport Middle Name";
        worksheet.Cells[1, 9] = "Passport Family Name";
        worksheet.Cells[1, 10] = "Date of Birth";
        worksheet.Cells[1, 11] = "Gender";
        worksheet.Cells[1, 12] = "Nationality";
        worksheet.Cells[1, 13] = "Has Chinese Commercial Code";
        worksheet.Cells[1, 14] = "Chinese Commercial Code";
        worksheet.Cells[1, 15] = "Russian Patronymic Name";
        worksheet.Cells[1, 16] = "Have Dual Nationality";
        worksheet.Cells[1, 17] = "Other Nationality";
        worksheet.Cells[1, 18] = "Birth Country";
        worksheet.Cells[1, 19] = "Marital Status";
        worksheet.Cells[1, 20] = "Spouse Name";
        worksheet.Cells[1, 21] = "Spouse Nationality";
        worksheet.Cells[1, 22] = "Spouse DOB";
        worksheet.Cells[1, 23] = "Marriage Date";
        worksheet.Cells[1, 24] = "Has Disability";
        worksheet.Cells[1, 25] = "Disablity Description";
        worksheet.Cells[1, 26] = "Reffered by Agent";
        worksheet.Cells[1, 27] = "Agent Name";
        if (details != null)
        {

            if (details.nationality.HasValue)
                nationality = db.countriesmaster.Where(x => x.id == details.nationality).Select(x => x.country_name).FirstOrDefault();
            if (details.nationality2.HasValue)
                otherNationality = db.countriesmaster.Where(x => x.id == details.nationality2).Select(x => x.country_name).FirstOrDefault();
            if (details.countryofbirth.HasValue)
                countryOfBirth = db.countriesmaster.Where(x => x.id == details.countryofbirth).Select(x => x.country_name).FirstOrDefault();
            if (details.maritalstatus.HasValue)
                maritalStatus = db.maritalstatusmaster.Where(x => x.id == details.maritalstatus).Select(x => x.description).FirstOrDefault();
            if (details.spousenationality.HasValue)
                spouseNationality = db.countriesmaster.Where(x => x.id == details.spousenationality).Select(x => x.country_name).FirstOrDefault();
            if (details.isdisable.HasValue && details.isdisable.Value == 1)
                disabilityDesc = db.disabilitymaster.Where(x => x.id == Convert.ToInt32(details.disabilitydescription)).Select(x => x.description).FirstOrDefault();
            if (details.isstudentreferbyagent.HasValue && details.isstudentreferbyagent.Value == 1 && details.agentid.HasValue)
                agentName = db.agentmaster.Where(x => x.agentid == details.agentid).Select(x => x.agentname).FirstOrDefault();
            if (details.gender.HasValue)
            {
                if (details.gender.Value == 1)
                    gender = "Male";
                else if (details.gender.Value == 0)
                    gender = "Female";
                else if (details.gender.Value == 2)
                    gender = "Other";
                else if (details.gender.Value == 3)
                    gender = "Prefer not to say";
            }

            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = string.IsNullOrEmpty(details.firstname) ? "N/A" : details.firstname;
            worksheet.Cells[2, 4] = string.IsNullOrEmpty(details.middlename) ? "N/A" : details.middlename;
            worksheet.Cells[2, 5] = string.IsNullOrEmpty(details.lastname) ? "N/A" : details.lastname;
            worksheet.Cells[2, 6] = string.IsNullOrEmpty(details.prefferedname) ? "N/A" : details.prefferedname;
            worksheet.Cells[2, 7] = details.ispassportfirstname.HasValue && details.ispassportfirstname.Value ? "Yes" : "No";
            worksheet.Cells[2, 8] = details.ispassportmiddlename.HasValue && details.ispassportmiddlename.Value ? "Yes" : "No";
            worksheet.Cells[2, 9] = details.ispassportlastname.HasValue && details.ispassportlastname.Value ? "Yes" : "No";
            worksheet.Cells[2, 10] = details.dateofbirth.HasValue ? details.dateofbirth.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 11] = gender;
            worksheet.Cells[2, 12] = nationality;
            worksheet.Cells[2, 13] = details.haschinesecodenumber.HasValue ? "Yes" : "No";
            worksheet.Cells[2, 14] = string.IsNullOrEmpty(details.chinesecodenumber) ? "N/A" : details.chinesecodenumber;
            worksheet.Cells[2, 15] = string.IsNullOrEmpty(details.patronymicname) ? "N/A" : details.patronymicname;
            worksheet.Cells[2, 16] = details.nationality2.HasValue ? "Yes" : "No";
            worksheet.Cells[2, 17] = string.IsNullOrEmpty(otherNationality) ? "N/A" : otherNationality;
            worksheet.Cells[2, 18] = countryOfBirth;
            worksheet.Cells[2, 19] = maritalStatus;
            worksheet.Cells[2, 20] = string.IsNullOrEmpty(details.spousename) ? "N/A" : details.spousename;
            worksheet.Cells[2, 21] = spouseNationality;
            worksheet.Cells[2, 22] = details.spousedob.HasValue ? details.spousedob.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 23] = details.marriagedate.HasValue ? details.marriagedate.Value.ToString("dd/MM/yyyy") : "N/A";
            worksheet.Cells[2, 24] = (disabilityDesc != "N/A") ? "Yes" : "No";
            worksheet.Cells[2, 25] = disabilityDesc;
            worksheet.Cells[2, 26] = details.isstudentreferbyagent != null && details.isstudentreferbyagent.Value == 1 ? "Yes" : "No";
            worksheet.Cells[2, 27] = agentName;
        }
    }

}
