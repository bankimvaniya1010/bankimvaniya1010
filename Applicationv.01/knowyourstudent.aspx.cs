using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class knowyourstudent : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected static List<faq> allQuestions = new List<faq>();
    private static string studentName;
    private static string studentdob;
    public static bool verifiedPassportDetails = false;

    public static string StudentName { get; set; }
    public static string StudentDOB { get; set; }

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !isDeclarationCompleted)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            var obj = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).Select(x => new { Name = x.firstname + " " + x.middlename + " " +x.lastname, dob = x.dateofbirth, verifiedDetails = x.verifiedpassportnamedob }).FirstOrDefault();

            if (obj != null && !string.IsNullOrEmpty(obj.Name) && obj.dob != null)
            {
                StudentName = obj.Name;
                StudentDOB = obj.dob.Value.ToShortDateString().ToString();
                if (obj.verifiedDetails.HasValue)
                    verifiedPassportDetails = obj.verifiedDetails.Value;
            }
            else
                Response.Redirect("personaldetails.aspx?formid=1", true);
            allQuestions = objCom.FaqQuestionList();
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlCountryofIssue);
            SetToolTips();
            BindAlternateDobProof();
            BindAlternateIDProof();
            BindResidenceIdProof();
            PopulateKYSDetails();
            SetControlsUniversitywise();
        }
    }

    private void SaveIdentificationDetails()
    {
        try
        {
            var mode = "new";
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            applicantdetails objapplicantDetail = new applicantdetails();
            if (profileInfo != null)
            {
                mode = "update";
                objapplicantDetail = profileInfo;
            }
            objapplicantDetail.passportno = txtPassportNo.Value;
            objapplicantDetail.passportissuedate = Convert.ToDateTime(txtdateofissue.Value);
            objapplicantDetail.passportexpirydate = Convert.ToDateTime(txtexpirydate.Value);
            if (ddlCountryofIssue.SelectedValue != "")
            {
                objapplicantDetail.passportissuecountry = ddlCountryofIssue.SelectedValue;
            }
            objapplicantDetail.passportissuecity = txtissueplaceCity.Value;
            if (ddlalternateIdentitytype.SelectedValue != "")
            {
                objapplicantDetail.alternativeIdentityproofId = Convert.ToInt32(ddlalternateIdentitytype.SelectedValue);
            }
            if (ddlalternatedobIdentitytype.SelectedValue != "")
            {
                objapplicantDetail.alternativeproofdobId = Convert.ToInt32(ddlalternatedobIdentitytype.SelectedValue);
            }

            if (ddlalternateresidenceIdentitytype.SelectedValue != "")
            {
                objapplicantDetail.alternativeresidenceproofId = Convert.ToInt32(ddlalternateresidenceIdentitytype.SelectedValue);
            }
            objapplicantDetail.alternativeproofdobno = txtalternatedobIdentityNo.Value;
            objapplicantDetail.alternativeresidenceproofno = txtalternateresidenceIdentityNo.Value;
            objapplicantDetail.alternativeIdentityproofno = txtalternateIdentityNo.Value;
            objapplicantDetail.identificationsavetime = DateTime.Now;
            objapplicantDetail.isidentificationpresent = true;
            objapplicantDetail.applicantid = userID;
            objapplicantDetail.universityid = universityID;
            if (mode == "new")
                db.applicantdetails.Add(objapplicantDetail);
            db.SaveChanges();
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetStudentDetailsCompletedStatus(userID, universityID);

            lblMessage.Text = "Your Contact Details have been saved";
            //           lblMessage.Visible = true;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnidentification_Click(object sender, EventArgs e)
    {
        SaveIdentificationDetails();
    }

    private void PopulateKYSDetails()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                txtPassportNo.Value = profileInfo.passportno;
                if(profileInfo.passportissuedate != null)
                    txtdateofissue.Value = Convert.ToDateTime(profileInfo.passportissuedate).ToString("yyyy-MM-dd");
                if(profileInfo.passportexpirydate != null)
                    txtexpirydate.Value = Convert.ToDateTime(profileInfo.passportexpirydate).ToString("yyyy-MM-dd");
                txtissueplaceCity.Value = profileInfo.passportissuecity;
                if (profileInfo.alternativeproofdobId != null)
                {
                    ddlalternatedobIdentitytype.ClearSelection();
                    ddlalternatedobIdentitytype.Items.FindByValue(profileInfo.alternativeproofdobId.ToString()).Selected = true;
                }
                if (profileInfo.alternativeresidenceproofId != null)
                {
                    ddlalternateresidenceIdentitytype.ClearSelection();
                    ddlalternateresidenceIdentitytype.Items.FindByValue(profileInfo.alternativeresidenceproofId.ToString()).Selected = true;
                }
                if (profileInfo.alternativeIdentityproofId != null)
                {
                    ddlalternateIdentitytype.ClearSelection();
                    ddlalternateIdentitytype.Items.FindByValue(profileInfo.alternativeIdentityproofId.ToString()).Selected = true;
                }
                if (profileInfo.passportissuecountry != null)
                {
                    ddlCountryofIssue.ClearSelection();
                    ddlCountryofIssue.Items.FindByValue(profileInfo.passportissuecountry.ToString()).Selected = true;
                }
                txtalternatedobIdentityNo.Value = profileInfo.alternativeproofdobno;
                txtalternateresidenceIdentityNo.Value = profileInfo.alternativeresidenceproofno;
                txtalternateIdentityNo.Value = profileInfo.alternativeIdentityproofno;
                lblSaveTime.Text = " Record was last saved at " + profileInfo.identificationsavetime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindAlternateDobProof()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var dobtype = (from ap in db.alternatedobproof
                           join ump in db.universitywisemastermapping on ap.id equals ump.mastervalueid
                           join mn in db.master_name on ump.masterid equals mn.masterid
                           where ump.universityid == universityID && ump.masterid == 2
                           select new
                           {
                               description = ap.description,
                               id = ap.id
                           }).ToList();
            ddlalternatedobIdentitytype.DataSource = dobtype;
            ddlalternatedobIdentitytype.DataTextField = "description";
            ddlalternatedobIdentitytype.DataValueField = "id";
            ddlalternatedobIdentitytype.DataBind();
            ddlalternatedobIdentitytype.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindAlternateIDProof()
    {
        try
        {
            int countryofuser = 0;
            var applicantdetails = db.applicantdetails.Where(x=>x.applicantid == userID).FirstOrDefault();
            if (applicantdetails != null)
                countryofuser = Convert.ToInt32(applicantdetails.countryofbirth);            
            ListItem lst = new ListItem("Please select", "0");
            var identitytype = (from ap in db.alternateidproofmaster
                                join cwm in db.countrywisealternateidproofmaster on ap.id equals cwm.alternateidproofID                                
                                where cwm.countryID == countryofuser
                                select new
                                {
                                    description = ap.description,
                                    id = ap.id
                                }).Distinct().ToList();

            ddlalternateIdentitytype.DataSource = identitytype;
            ddlalternateIdentitytype.DataTextField = "description";
            ddlalternateIdentitytype.DataValueField = "id";
            ddlalternateIdentitytype.DataBind();
            ddlalternateIdentitytype.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindResidenceIdProof()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var addresstype = (from ap in db.alternateadressproofmaster
                               join ump in db.universitywisemastermapping on ap.id equals ump.mastervalueid
                               join mn in db.master_name on ump.masterid equals mn.masterid
                               where ump.universityid == universityID && ump.masterid == 1
                               select new
                               {
                                   description = ap.description,
                                   id = ap.id
                               }).ToList();

            ddlalternateresidenceIdentitytype.DataSource = addresstype;
            ddlalternateresidenceIdentitytype.DataTextField = "description";
            ddlalternateresidenceIdentitytype.DataValueField = "id";
            ddlalternateresidenceIdentitytype.DataBind();
            ddlalternateresidenceIdentitytype.Items.Insert(0, lst);
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
                          where (x.formid == formId || z.formid == formId)
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
                    case "PASSPORT NUMBER":
                        icPassport.Attributes.Add("style", "display:block;");
                        icPassport.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DATE OF ISSUE":
                        icPassportIssueDate.Attributes.Add("style", "display:block;");
                        icPassportIssueDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF ISSUE":
                        icCountryofIssue.Attributes.Add("style", "display:block;");
                        icCountryofIssue.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EXPIRY DATE":
                        icPassportExpiryDate.Attributes.Add("style", "display:block;");
                        icPassportExpiryDate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CITY OF ISSUE":
                        icCityofIssue.Attributes.Add("style", "display:block;");
                        icCityofIssue.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ALTERNATIVE PROOF OF IDENTITY":
                        icIdentityProofType.Attributes.Add("style", "display:block;");
                        icIdentityProofType.Attributes.Add("data-tipso", setTooltips(fields[k]));

                        break;
                    case "ALTERNATIVE PROOF OF DATE OF BIRTH":
                        icDOBProofType.Attributes.Add("style", "display:block;");
                        icDOBProofType.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ALTERNATIVE PROOF OF RESIDENCE":
                        icResidencyProof.Attributes.Add("style", "display:block;");
                        icResidencyProof.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "IDENTITY NUMBER":
                        icResidencyProofNo.Attributes.Add("style", "display:block;");
                        icResidencyProofNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icDOBProofNo.Attributes.Add("style", "display:block;");
                        icDOBProofNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        icIdentityProofNo.Attributes.Add("style", "display:block;");
                        icIdentityProofNo.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
                    case "PASSPORT NUMBER":
                        passportno.Attributes.Add("style", "display:block;");
                        labelpassportno.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "DATE OF ISSUE":
                        dateofissue.Attributes.Add("style", "display:block;");
                        labeldateofissue.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF ISSUE":
                        countryIssue.Attributes.Add("style", "display:block;");
                        labelcountryIssue.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EXPIRY DATE":
                        expirydate.Attributes.Add("style", "display:block;");
                        labelexpirydate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CITY OF ISSUE":
                        issueplace.Attributes.Add("style", "display:block;");
                        labelissueplace.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ALTERNATIVE PROOF OF IDENTITY":
                        alternateIdentitytype.Attributes.Add("style", "display:block;");
                        alternateIdentityNo.Attributes.Add("style", "display:block;");
                        labelalternateIdentitytype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ALTERNATIVE PROOF OF DATE OF BIRTH":
                        alternatedobIdentitytype.Attributes.Add("style", "display:block;");
                        alternatedobIdentityNo.Attributes.Add("style", "display:block;");
                        labelalternatedobIdentitytype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ALTERNATIVE PROOF OF RESIDENCE":
                        alternateresidenceIdentitytype.Attributes.Add("style", "display:block;");
                        alternateresidenceIdentityNo.Attributes.Add("style", "display:block;");
                        labelalternateresidenceIdentitytype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "IDENTITY NUMBER":
                        labelalternateIdentityNo.InnerHtml = setInnerHtml(fields[k]);
                        labelalternatedobIdentityNo.InnerHtml = setInnerHtml(fields[k]);
                        labelalternateresidenceIdentityNo.InnerHtml = setInnerHtml(fields[k]);
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void postConfirmation(bool confirmation)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID = Convert.ToInt32(ConfigurationManager.AppSettings["UniversityID"].ToString());
        int userID = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
        var details = db1.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
        details.verifiedpassportnamedob = confirmation;
        db1.SaveChanges();
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        SaveIdentificationDetails();
        Response.Redirect("applicanteducation.aspx?formid=4", true);
    }
}