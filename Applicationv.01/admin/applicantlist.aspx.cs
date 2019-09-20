using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;
using NReco.PdfGenerator;

public partial class admin_applicantlist : System.Web.UI.Page
{
    int roleID = 0, ApplicantID = 0, universityID = 0;
    string universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleID = Convert.ToInt32(Session["Role"]);
        if (!IsPostBack)
        { BindApplicant(); }

    }

    private void BindApplicant()
    {
        try
        {
            var applicant = (from ad in db.applicantdetails
                             join cm in db.countriesmaster on ad.nationality equals cm.id into cmdata
                             from x in cmdata.DefaultIfEmpty()
                             join am in db.applicationmaster on ad.universityid equals am.universityid into amdata
                             from x1 in amdata.Where(c => c.preferenceid == 1 && c.applicantid == ad.applicantid).DefaultIfEmpty()
                             join course in db.coursemaster on x1.course equals course.courseid into coursedata
                             from x2 in coursedata.DefaultIfEmpty()
                             where ad.universityid == universityID
                             select new
                             {
                                 applicantid = ad.applicantid,
                                 nationality = (x == null) ? string.Empty : x.country_name,
                                 courseapplied = (x2 == null) ? string.Empty : x2.coursename,
                                 name = ad.firstname + " " + ad.lastname,

                             }).SortBy("applicantid").ToList();
            gvApplicant.DataSource = applicant;
            gvApplicant.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void gvApplicant_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string Comamandname = e.CommandName;
            var form = db.formmaster.Where(x => x.formname.Contains(Comamandname)).FirstOrDefault();
            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            if (roleID == 4)
            {
                if (Comamandname.Equals("Personal"))
                {
                    Response.Redirect(webURL + "admin/supervisorpersonaldetails.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Contact"))
                {
                    Response.Redirect(webURL + "admin/supervisorcontactdetails.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Identification"))
                {
                    Response.Redirect(webURL + "admin/supervisorknowyourstudent.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Education"))
                {
                    Response.Redirect(webURL + "admin/Supervisoreducationdetails.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Language"))
                {
                    Response.Redirect(webURL + "admin/supervisorapplicantlanguage.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Employers"))
                {
                    Response.Redirect(webURL + "admin/supervisorapplicantworkexperince.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Social"))
                {
                    Response.Redirect(webURL + "admin/supervisorapplicantsocial.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Visa"))
                {
                    Response.Redirect(webURL + "admin/supervisorapplicantvisa.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Funding"))
                {
                    Response.Redirect(webURL + "admin/supervisorapplicantfunding.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Reference"))
                {
                    Response.Redirect(webURL + "admin/supervisorapplicantreferncecheck.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
            }
            else
            {
                if (Comamandname.Equals("Personal"))
                {
                    Response.Redirect(webURL + "admin/personaldetail.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Contact"))
                {
                    Response.Redirect(webURL + "admin/applicantcontactdetail.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Identification"))
                {
                    Response.Redirect(webURL + "admin/knowyourstudent.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Education"))
                {
                    Response.Redirect(webURL + "admin/applicanteducation.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Language"))
                {
                    Response.Redirect(webURL + "admin/applicantlanguage.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Employers"))
                {
                    Response.Redirect(webURL + "admin/applicantworkexperince.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Social"))
                {
                    Response.Redirect(webURL + "admin/applicantsocial.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Visa"))
                {
                    Response.Redirect(webURL + "admin/applicantvisa.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Funding"))
                {
                    Response.Redirect(webURL + "admin/applicantfunding.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
                if (Comamandname.Equals("Reference"))
                {
                    Response.Redirect(webURL + "admin/applicantreferncecheck.aspx?userid=" + ID + "&formid=" + form.formid, true);
                }
            }

            if (Comamandname.Equals("Download"))
            {
                downloadApplicantDetails(ID);
            }
            if (Comamandname.Equals("FeedBackGTE"))
                Response.Redirect(webURL + "admin/gtereport.aspx?downloadPdf=0&id=" + ID, true);
            if (Comamandname.Equals("GTE"))
                downloadGTEReport(ID);
            if (Comamandname.Equals("VisaForm"))
                downloadVisaForm(ID);
            if (Comamandname.Equals("PerDown"))
                downloadPerDown(ID);
            //else if (e.CommandName.Equals("ViewPersonal")) { Response.Redirect(webURL + "admin/viewinfo.aspx?ID=" + ID); }
            //else if (e.CommandName.Equals("ValidateData")) { Response.Redirect(webURL + "admin/applicantdetailsvalidation.aspx?ID=" + ID); }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void downloadPerDown(int applicantID)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A3;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        htmlToPdf.GeneratePdfFromFile(webURL + "admin/downloadapplicantdetails.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=Personal_Form_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }
    private void downloadVisaForm(int applicantID)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A3;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 300f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        htmlToPdf.GeneratePdfFromFile(webURL + "admin/visaprefill.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=Visa_Form_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }
    private void downloadGTEReport(int applicantID)
    {
        var htmlToPdf = new NReco.PdfGenerator.HtmlToPdfConverter();
        htmlToPdf.Orientation = PageOrientation.Portrait;
        htmlToPdf.Size = PageSize.A3;
        htmlToPdf.Grayscale = false;
        htmlToPdf.PageWidth = 200f;
        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
        string fileName = Guid.NewGuid() + ".pdf";
        string filePath = string.Concat(dirPath, "\\", fileName);
        htmlToPdf.GeneratePdfFromFile(webURL + "admin/gtereport.aspx?token=XS7MKjHLunMAvqzCGr&id=" + applicantID + "&downloadPdf=1", null, filePath);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=GTE_Report_" + fileName);
        Response.TransmitFile(filePath);
        Response.End();
    }
    private void downloadApplicantDetails(int applicantID)
    {
        universityName = db.university_master.Where(x => x.universityid == universityID).Select(x => x.university_name).FirstOrDefault();
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
        worksheet.Cells[1, 2] = "University Name";
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

        worksheet.Name = "LanguageCompetency Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "University Name";
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


            worksheet.Cells[2, 1] = details.applicantid;
            worksheet.Cells[2, 2] = universityName;
            worksheet.Cells[2, 3] = string.IsNullOrEmpty(details.homelanuage) ? "N/A" : details.homelanuage;
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
        worksheet.Cells[1, 2] = "University Name";
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
        worksheet.Cells[1, 2] = "University Name";
        worksheet.Cells[1, 3] = "Completed High School ";
        worksheet.Cells[1, 4] = "Country Of Highest School";
        worksheet.Cells[1, 5] = "High School Start Date";
        worksheet.Cells[1, 6] = "High School End Date";
        worksheet.Cells[1, 7] = "Name Of School";
        worksheet.Cells[1, 8] = "High School Qualification Type";
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
        worksheet.Cells[1, 24] = "Qualification Type";
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
        worksheet.Cells[1, 39] = "Qualification Type";
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
                worksheet.Cells[rowNum, 50] = applicantsubjectwisegrade[i].subjectid;
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
        worksheet.Cells[1, 2] = "University Name";
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
        worksheet.Cells[1, 2] = "University Name";
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

        worksheet.Name = "Personal Details";
        worksheet.Activate();

        worksheet.Cells[1, 1] = "Applicant ID";
        worksheet.Cells[1, 2] = "University Name";
        worksheet.Cells[1, 3] = "First Name";
        worksheet.Cells[1, 4] = "Middle Name";
        worksheet.Cells[1, 5] = "Last Name";
        worksheet.Cells[1, 6] = "Prefered Name";
        worksheet.Cells[1, 7] = "Passport First Name";
        worksheet.Cells[1, 8] = "Passport Middle Name";
        worksheet.Cells[1, 9] = "Passport Last Name";
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
            worksheet.Cells[2, 11] = details.gender != null && details.gender.Value == 1 ? "Male" : "Female";
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

    protected void gvApplicant_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvApplicant.PageIndex = e.NewPageIndex;
        BindApplicant();
    }

    protected void gvApplicant_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkDownloadGteReport = (LinkButton)e.Row.Cells[2].FindControl("lnkDownloadGteReport");
            LinkButton lnkGteReportFeedBack = (LinkButton)e.Row.Cells[2].FindControl("lnkGteReportFeedBack");
            if (lnkDownloadGteReport != null || lnkGteReportFeedBack != null)
            {
                int applicant_id = Convert.ToInt32(e.Row.Cells[0].Text);

                var displayLinkButton = db.gte_student_sop.Where(x => x.applicant_id == applicant_id && x.universityid == universityID)
                                          .Select(x => x.is_sop_submitted_by_applicant).FirstOrDefault();

                if (!displayLinkButton)
                {
                    lnkDownloadGteReport.Style.Add("display", "none");
                    lnkGteReportFeedBack.Style.Add("display", "none");
                }
            }
        }
    }
}