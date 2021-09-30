using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantworkexperience : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    bool? is_review = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        is_review = objCom.is_review(userID, universityID);
        if (is_review != null && is_review == true)
            btn_Save.Visible = false;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
            objCom.BindCountries(ddlCountry);
            SetToolTips();
            Bindworkexperienceyears();
            BindRelationship();
            // PopulateEmployerInfo(1);
            BindEmploymentDetails();
            SetControlsUniversitywise();
            var date = (from s in db.applicantdetails where s.applicantid == objUser.studentid select new { s.dateofbirth }).FirstOrDefault();
            hdfDateFoBrith.Value = date.dateofbirth.ToString();
        }
    }

    private void Bindworkexperienceyears()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var workexperienceyears = db.workexperienceyearsmaster.ToList();
            ddlworkexperience.DataSource = workexperienceyears;
            ddlworkexperience.DataTextField = "description";
            ddlworkexperience.DataValueField = "workexperienceyearsid";
            ddlworkexperience.DataBind();
            ddlworkexperience.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.universitywisetooltipmaster
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
                          from x in tmp.Where(c => c.formid == formId).DefaultIfEmpty()
                          where (x.formid == formId ||z.formid== formId)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              universitywiseToolTips = (z == null ? String.Empty : z.tooltips),
                              tooltips = (x == null ? String.Empty : x.tooltips)
                          }).ToList();

            
            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        icemploymentInfo.Attributes.Add("style", "display:block;");
                        icemploymentInfo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WEBSITE":
                        icemployerwebsite.Attributes.Add("style", "display:block;");
                        icemployerwebsite.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF EMPLOYER ORGANISATION":
                        icemployer.Attributes.Add("style", "display:block;");
                        icemployer.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;

                    case "CITY OF EMPLOYER’S LOCATION":
                        icemployercity.Attributes.Add("style", "display:block;");
                        icemployercity.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF EMPLOYER’S LOCATION":
                        icemployercountry.Attributes.Add("style", "display:block;");
                        icemployercountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "POSITION/ROLE IN":
                        icposition.Attributes.Add("style", "display:block;");
                        icposition.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "START DATE OF EMPLOYMENT":
                        icstartdate.Attributes.Add("style", "display:block;");
                        icstartdate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "END DATE OF EMPLOYMENT":
                        icenddate.Attributes.Add("style", "display:block;");
                        icenddate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "BRIEF JOB DESCRIPTION":
                        icemploymentInfo.Attributes.Add("style", "display:block;");
                        icemploymentInfo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        icreportingmanger.Attributes.Add("style", "display:block;");
                        icreportingmanger.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        icemploymentverification.Attributes.Add("style", "display:block;");
                        icemploymentverification.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        icrelationship.Attributes.Add("style", "display:block;");
                        icrelationship.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        icemail.Attributes.Add("style", "display:block;");
                        icemail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        iclinkedin.Attributes.Add("style", "display:block;");
                        iclinkedin.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HOW MANY YEARS OF WORK EXPERIENCE DO YOU WISH TO RECORD?":
                        icyearsOfexp.Attributes.Add("style", "display:block;");
                        icyearsOfexp.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    default:
                        break;

                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());

        }
    }
    private String setTooltips(dynamic obj)
    {
        return obj.universitywiseToolTips == "" ? obj.tooltips : obj.universitywiseToolTips;
    }
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }
    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();
            }

            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        employmentInfo.Attributes.Add("style", "display:block;");
                        labelemployment.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WEBSITE":
                        employerwebsite.Attributes.Add("style", "display:block;");
                        labelemployerwebsite.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF EMPLOYER ORGANISATION":
                        employer.Attributes.Add("style", "display:block;");
                        labelemployer.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "CITY OF EMPLOYER’S LOCATION":
                        employercity.Attributes.Add("style", "display:block;");
                        labelemployercity.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF EMPLOYER’S LOCATION":
                        employercountry.Attributes.Add("style", "display:block;");
                        labelemployercountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        position.Attributes.Add("style", "display:block;");
                        labelposition.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "START DATE OF EMPLOYMENT":
                        startdate.Attributes.Add("style", "display:block;");
                        labelstartdate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "END DATE OF EMPLOYMENT":
                        endate.Attributes.Add("style", "display:block;");
                        labelendate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "BRIEF JOB DESCRIPTION":
                        briefDescription.Attributes.Add("style", "display:block;");
                        labelbriefDescription.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger.Attributes.Add("style", "display:block;");
                        labelreportingmanger.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverification.Attributes.Add("style", "display:block;");
                        labelemploymentverification.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationship.Attributes.Add("style", "display:block;");
                        labelrelationship.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        email.Attributes.Add("style", "display:block;");
                        labelemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedin.Attributes.Add("style", "display:block;");
                        labellinkedin.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HOW MANY YEARS OF WORK EXPERIENCE DO YOU WISH TO RECORD?":
                        yearsOfexp.Attributes.Add("style", "display:block;");
                        labelyearsOfexp.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void PopulateEmployerInfo(int employerId)
    {
        try
        {
            var experienceInfo = (from ad in db.applicantdetails
                                where ad.applicantid == userID && ad.universityid == universityID
                                select ad).FirstOrDefault();
            
            var employerInfo = (from pInfo in db.applicantemployerdetails
                                where pInfo.employerid == employerId
                                select pInfo).FirstOrDefault();
            if (employerInfo != null)
            {
                if (employerInfo.wishtoaddemployer == 1) {
                    rblEmploymentYes.Checked = true;
                    if (experienceInfo.totalyearofexperience != null)
                    {
                        ddlworkexperience.ClearSelection();
                        ddlworkexperience.Items.FindByValue(experienceInfo.totalyearofexperience.ToString()).Selected = true;
                    }
                    txtEmployer.Value = employerInfo.organization;
                    txtemployerwebsite.Value = employerInfo.website;
                    txtCity.Value = employerInfo.city;
                    if (employerInfo.country != null)
                    {
                        ddlCountry.ClearSelection();
                        ddlCountry.Items.FindByValue(employerInfo.country.ToString()).Selected = true;
                    }
                    txtPosition.Value = employerInfo.designation;
                    txtStartDate.Value = Convert.ToDateTime(employerInfo.durationfrom).ToString("yyyy-MM-dd");
                    if(employerInfo.durationto != null)
                        txtEndate.Value = Convert.ToDateTime(employerInfo.durationto).ToString("yyyy-MM-dd");
                    if (employerInfo.iscurrentworking == 1)
                    {
                        chkCurrentlyWorking.Checked = true;
                        txtEndate.Attributes.Add("disabled", "disabled");
                        txtEndate.Attributes.Add("style", "background-color :#e9ecef");
                    }
                    txtbriefDescription.Value = employerInfo.briefdescription;
                    txtreportingmanger.Value = employerInfo.nameofreportingmanger;
                    txtemploymentverification.Value = employerInfo.contactpersonwithdetails;
                    if (employerInfo.relationshipwithcontact != null)
                    {
                        ddlRelationship.ClearSelection();
                        ddlRelationship.Items.FindByValue(employerInfo.relationshipwithcontact.ToString()).Selected = true;
                    }
                    txtEmail.Value = employerInfo.emailid;
                    txtlinkedin.Value = employerInfo.linkedinidofcontact;

                }

                else
                    rblEmploymentNo.Checked = false;
                lblSaveTime.Text = " Record was last saved at " + employerInfo.lastsavedtime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SaveEmploymentDetails()
    {
        try
        {
            var applicantNameDetails = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).Select(x => new { x.firstname, x.lastname ,x.middlename,x.totalyearofexperience }).FirstOrDefault();
            var noExperience = (from ad in db.applicantdetails
                                where ad.applicantid == userID && ad.universityid == universityID
                                select ad).FirstOrDefault();
            var mode = "new";
            string employerid = hdnemployer.Value;
            applicantemployerdetails objEmployer = new applicantemployerdetails();
            if (employerid != "")
            {
                mode = "update";
                int eID = Convert.ToInt32(employerid);
                var employerInfo = (from pInfo in db.applicantemployerdetails
                                    where pInfo.employerid == eID
                                    select pInfo).FirstOrDefault();
                objEmployer = employerInfo;
            }

            if (rblEmploymentYes.Checked)
            {
                noExperience.haveworkexperience = true;
                if (ddlworkexperience.SelectedValue != null)
                    noExperience.totalyearofexperience = ddlworkexperience.SelectedValue;
                objEmployer.wishtoaddemployer = 1;
                objEmployer.organization = txtEmployer.Value;
                objEmployer.designation = txtPosition.Value;
                objEmployer.website = txtemployerwebsite.Value;
                objEmployer.city = txtCity.Value;
                objEmployer.country = Convert.ToInt32(ddlCountry.SelectedValue);
                objEmployer.briefdescription = txtbriefDescription.Value;
                objEmployer.nameofreportingmanger = txtreportingmanger.Value;
                objEmployer.contactpersonwithdetails = txtemploymentverification.Value;
                objEmployer.relationshipwithcontact = ddlRelationship.SelectedValue;
                objEmployer.emailid = txtEmail.Value;
                objEmployer.linkedinidofcontact = txtlinkedin.Value;
                objEmployer.durationfrom = Convert.ToDateTime(txtStartDate.Value);
                if (chkCurrentlyWorking.Checked)
                {
                    objEmployer.iscurrentworking = 1;
                    objEmployer.durationto = null;
                }
                else
                {
                    objEmployer.iscurrentworking = 0;
                    objEmployer.durationto = Convert.ToDateTime(txtEndate.Value);
                }
                objEmployer.applicantid = userID;
                objEmployer.employerverificationkey = Guid.NewGuid().ToString();
                objEmployer.isemployerdetailverified = false;
                objEmployer.lastsavedtime = DateTime.Now;
                objEmployer.universityid = universityID;
                if (mode == "new")
                    db.applicantemployerdetails.Add(objEmployer);
            }
            else
            {
                noExperience.haveworkexperience = false;
                noExperience.totalyearofexperience = "";
                var record = db.applicantemployerdetails.Where(c => c.applicantid == userID && c.universityid == universityID).ToList();
                for (var i = 0; i < record.Count; i++)
                    db.applicantemployerdetails.Remove(db.applicantemployerdetails.Find(record[i].employerid));

            }
            db.SaveChanges();

            string applicantName = applicantNameDetails.firstname + " " + applicantNameDetails.middlename + " " + applicantNameDetails.lastname;
            string applicantFirstName = applicantNameDetails.firstname;
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo, x.cityid }).FirstOrDefault();

            if (rblEmploymentYes.Checked)
            {
                string url = webURL + "verifyemployment.aspx?key=" + objEmployer.employerverificationkey;
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/employmentdetailNotification.html"));
                html = html.Replace("@UniversityName", universitydetails.university_name);
                html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + universitydetails.logo);
                html = html.Replace("@locationofInstitution", objCom.GetCityName(Convert.ToInt32(universitydetails.cityid)));
                html = html.Replace("@applicatFullName", applicantName);
                html = html.Replace("@applicantFirstname", applicantFirstName);
                html = html.Replace("@yearsofWorkExperience", applicantNameDetails.totalyearofexperience);
                html = html.Replace("@Positioninorganisation", objEmployer.designation);
                html = html.Replace("@NameofOrganisation", objEmployer.organization);
                html = html.Replace("@City", objEmployer.city);
                html = html.Replace("@Country", objCom.GetCountryDiscription(Convert.ToInt32(objEmployer.country)));
                html = html.Replace("@verifyemploymenturl", url);
                objCom.SendMail(objEmployer.emailid, html, "Employment detail check for " + applicantName);
            }

            lblMessage.Text = "Your Work Experience Details have been saved";
            //          lblMessage.Visible = true;
            BindEmploymentDetails();
            employment.Attributes.Add("style", "display:none;");

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
        {
        SaveEmploymentDetails();
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        if (is_review != null && is_review == true)
            Response.Redirect(webURL + "applicantsocial.aspx?formid=8", true);
        else
        {
            SaveEmploymentDetails();
            Response.Redirect(webURL + "applicantsocial.aspx?formid=8", true);
        }
    }

    private void BindEmploymentDetails()
    {
        try
        {
            var empDetails = (from eInfo in db.applicantemployerdetails
                              where eInfo.applicantid == userID && eInfo.universityid == universityID && eInfo.wishtoaddemployer == 1
                              select eInfo).ToList();
            
            grdEmployment.DataSource = empDetails;
            grdEmployment.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindRelationship()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var relationship = db.realtionshipmaster.ToList();
            ddlRelationship.DataSource = relationship;
            ddlRelationship.DataTextField = "relationshipname";
            ddlRelationship.DataValueField = "relationshiptid";
            ddlRelationship.DataBind();
            ddlRelationship.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdEmployment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdEmployment_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void grdEmployment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Edit"))

            {
                int employerid = Convert.ToInt32(e.CommandArgument.ToString());
                PopulateEmployerInfo(employerid);
                hdnemployer.Value = e.CommandArgument.ToString();
                employment.Attributes.Add("style", "display:block");
            }
            if (e.CommandName.Equals("Delete"))
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                applicantemployerdetails grade = db.applicantemployerdetails.Where(b => b.employerid == id).First();
                db.applicantemployerdetails.Remove(grade);
                db.SaveChanges();
                BindEmploymentDetails();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

   
}