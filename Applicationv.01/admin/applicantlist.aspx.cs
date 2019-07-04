using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;

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
            var applicant = (from q in db.applicantdetails
                             where q.universityid == universityID

                             select new
                             {
                                 applicantid = q.applicantid,
                                 name = q.firstname + " " + q.lastname,

                             }).ToList();
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
            //else if (e.CommandName.Equals("ViewPersonal")) { Response.Redirect(webURL + "admin/viewinfo.aspx?ID=" + ID); }
            //else if (e.CommandName.Equals("ValidateData")) { Response.Redirect(webURL + "admin/applicantdetailsvalidation.aspx?ID=" + ID); }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void downloadApplicantDetails(int applicantID)
    {
        universityName = db.university_master.Where(x => x.universityid == universityID).Select(x => x.university_name).FirstOrDefault();
        var applicantdetails = db.applicantdetails.Where(x => x.applicantid == applicantID && x.universityid == universityID).FirstOrDefault();

        Application xlApp = new Application();
        if (xlApp == null)
        {
            objLog.WriteLog("Excel is not properly installed.");
            return;
        }

        Workbook xlWorkBook = xlApp.Workbooks.Add(Type.Missing);

        Worksheet persoanlWorkSheet = (Worksheet)xlApp.Worksheets.Add();
        FillPersonalDetailSheet(applicantdetails, persoanlWorkSheet);

        Worksheet contactWorksheet = (Worksheet)xlApp.Worksheets.Add();
        FillContactDetailSheet(applicantdetails, contactWorksheet);

        Worksheet identificationWorksheet = (Worksheet)xlApp.Worksheets.Add();
        identificationWorksheet.Name = "Identification Details";
        FillIdentificationSheet();

        Worksheet educationWorksheet = (Worksheet)xlApp.Worksheets.Add();
        educationWorksheet.Name = "Education Details";
        FillEducationDetailSheet();

        Worksheet workExperienceWorksheet = (Worksheet)xlApp.Worksheets.Add();
        workExperienceWorksheet.Name = "Work Experience Details";
        FillWorkExperienceDetailSheet();

        Worksheet languageWorksheet = (Worksheet)xlApp.Worksheets.Add();
        languageWorksheet.Name = "Language Competency Details";
        FillLanguageCompetencyDetailSheet();

        Worksheet socialWorksheet = (Worksheet)xlApp.Worksheets.Add();
        socialWorksheet.Name = "Social Details";
        FillSocialDetailSheet();
    }

    private void FillSocialDetailSheet()
    {
    }

    private void FillLanguageCompetencyDetailSheet()
    {
    }

    private void FillWorkExperienceDetailSheet()
    {
    }

    private void FillEducationDetailSheet()
    {
    }

    private void FillIdentificationSheet()
    {
    }

    private void FillContactDetailSheet(applicantdetails details, Worksheet worksheet)
    {
        List<applicantresidencehistory> residentHistory = null;

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

        if (details.haspreviousresidence.HasValue && details.haspreviousresidence.Value)
        {
            residentHistory = db.applicantresidencehistory.Where(x => x.applicantid == details.applicantid && x.universityid == universityID).ToList();
            for (int i = 0, j = 31; i < residentHistory.Count;i++)
            {
                worksheet.Cells[1, j] = "Previous Residential Address 1";
                worksheet.Cells[2, j++] = residentHistory[i].residenceaddress1;
                worksheet.Cells[1, j] = "Previous Residential Address 2";
                worksheet.Cells[2, j++] = residentHistory[i].residenceaddress2;
                worksheet.Cells[1, j] = "Previous Residential Address 3";
                worksheet.Cells[2, j++] = residentHistory[i].residenceaddress3;
                worksheet.Cells[1, j] = "Previous Residential City";
                worksheet.Cells[2, j++] = residentHistory[i].residentialcity;
                worksheet.Cells[1, j] = "Previous Residential State";
                worksheet.Cells[2, j++] = residentHistory[i].residentialstate;
                worksheet.Cells[1, j] = "Previous Residential Country";
                worksheet.Cells[2, j++] = residentHistory[i].residentialcountry;
                worksheet.Cells[1, j] = "Previous Residential Code";
                worksheet.Cells[2, j++] = residentHistory[i].residencepostcode;
                worksheet.Cells[1, j] = "Previous Residential Start Date";
                worksheet.Cells[2, j++] = residentHistory[i].residencestartdate.Value.ToString("dd/MM/yyyy");
                worksheet.Cells[1, j] = "Previous Residential End Date";
                worksheet.Cells[2, j++] = residentHistory[i].residenceenddate.Value.ToString("dd/MM/yyyy");
            }
        }

        worksheet.Cells[2, 1] = details.applicantid;
        worksheet.Cells[2, 2] = universityName;
        worksheet.Cells[2, 3] = details.email;
        worksheet.Cells[2, 4] = "Mobile Number";
        worksheet.Cells[2, 5] = "Home Phone Number";
        worksheet.Cells[2, 6] = "Use Skype";
        worksheet.Cells[2, 7] = "Skype ID";
        worksheet.Cells[2, 8] = "Use Whats App";
        worksheet.Cells[2, 9] = "Whats App no. same as your mobile no.";
        worksheet.Cells[2, 10] = "Whats App Number";
        worksheet.Cells[2, 11] = "Postal Address 1";
        worksheet.Cells[2, 12] = "Postal Address 2";
        worksheet.Cells[2, 13] = "Postal Address 3";
        worksheet.Cells[2, 14] = "Postal City";
        worksheet.Cells[2, 15] = "Postal State";
        worksheet.Cells[2, 16] = "Postal Country";
        worksheet.Cells[2, 17] = "Postal Code";
        worksheet.Cells[2, 18] = "Residential Address same as Postal";
        worksheet.Cells[2, 19] = "Residential Address 1";
        worksheet.Cells[2, 20] = "Residential Address 2";
        worksheet.Cells[2, 21] = "Residential Address 3";
        worksheet.Cells[2, 22] = "Residential City";
        worksheet.Cells[2, 23] = "Residential State";
        worksheet.Cells[2, 24] = "Residential Country";
        worksheet.Cells[2, 25] = "Residential Code";
        worksheet.Cells[2, 26] = "Nominee Name";
        worksheet.Cells[2, 27] = "Nominee Relation";
        worksheet.Cells[2, 28] = "Nominee Email";
        worksheet.Cells[2, 29] = "Nominee Mobile";
        worksheet.Cells[2, 30] = "Current Address living duration less than 1 year";
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

        if(details.nationality.HasValue)
            nationality = db.countriesmaster.Where(x => x.id == details.nationality).Select(x=> x.country_name).FirstOrDefault();
        if (details.nationality2.HasValue)
            otherNationality = db.countriesmaster.Where(x => x.id == details.nationality2).Select(x => x.country_name).FirstOrDefault();
        if (details.countryofbirth.HasValue)
            countryOfBirth = db.countriesmaster.Where(x => x.id == details.countryofbirth).Select(x => x.country_name).FirstOrDefault();
        if (details.maritalstatus.HasValue)
            maritalStatus = db.maritalstatusmaster.Where(x => x.id == details.maritalstatus).Select(x => x.description).FirstOrDefault();
        if (details.spousenationality.HasValue)
            spouseNationality = db.countriesmaster.Where(x => x.id == details.spousenationality).Select(x => x.country_name).FirstOrDefault();
        if (details.isdisable.Value == 1)
            disabilityDesc = db.disabilitymaster.Where(x => x.id == Convert.ToInt32(details.disabilitydescription)).Select(x => x.description).FirstOrDefault();
        if (details.isstudentreferbyagent.Value == 1)
            agentName = db.agentmaster.Where(x => x.agentid == details.agentid).Select(x => x.agentname).FirstOrDefault();

        worksheet.Cells[2, 1] = details.applicantid;
        worksheet.Cells[2, 2] = universityName;
        worksheet.Cells[2, 3] = details.firstname;
        worksheet.Cells[2, 4] = details.middlename;
        worksheet.Cells[2, 5] = details.lastname;
        worksheet.Cells[2, 6] = details.prefferedname;
        worksheet.Cells[2, 7] = details.ispassportfirstname.HasValue && details.ispassportfirstname.Value ? "Yes" : "No"; 
        worksheet.Cells[2, 8] = details.ispassportmiddlename.HasValue && details.ispassportmiddlename.Value ? "Yes" : "No";
        worksheet.Cells[2, 9] = details.ispassportlastname.HasValue && details.ispassportlastname.Value ? "Yes" : "No";
        worksheet.Cells[2, 10] = details.dateofbirth.Value.ToString("dd/MM/yyyy");
        worksheet.Cells[2, 11] = details.gender.Value == 1 ? "Male" : "Female";
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
        worksheet.Cells[2, 24] = details.isdisable.Value == 1 ? "Yes" : "No";
        worksheet.Cells[2, 25] = disabilityDesc;
        worksheet.Cells[2, 26] = details.isstudentreferbyagent.Value == 1 ? "Yes" : "No";
        worksheet.Cells[2, 27] = agentName;
    }

    protected void gvApplicant_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvApplicant.PageIndex = e.NewPageIndex;
        BindApplicant();
    }
}