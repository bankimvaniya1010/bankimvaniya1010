using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_knowyourstudent : System.Web.UI.Page
{
    int formId = 0;
    Common objCom = new Common();
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();

    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();        
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        userID = Convert.ToInt32(Session["UserID"]);
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if ((Request.QueryString["userid"] == null) || (Request.QueryString["userid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            ApplicantID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        CustomControls = objCom.CustomControlist(formId, universityID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
            SetAdminComments();
            SetToolTips();
            PopulateKYSDetails();
            SetControlsUniversitywise();
        }
    }


    private void PopulateKYSDetails()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                lblPassportNo.Text = profileInfo.passportno;
                if (profileInfo.passportissuedate != null)
                    lblDateOfissue.Text = Convert.ToDateTime(profileInfo.passportissuedate).ToString("yyyy-MM-dd");
                if (profileInfo.passportexpirydate != null)
                    lblExpiryDate.Text = Convert.ToDateTime(profileInfo.passportexpirydate).ToString("yyyy-MM-dd");
                lblissueplace.Text = profileInfo.passportissuecity;
                if (profileInfo.passportissuecountry != null)
                {
                    lblcountryIssue.Text = objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.passportissuecountry));
                }
                if (profileInfo.alternativeproofdobId != null)
                {
                    lblalternatedobIdentitytype.Text = objCom.GetDOBProof(Convert.ToInt32(profileInfo.alternativeproofdobId));
                }
                if (profileInfo.alternativeresidenceproofId != null)
                {
                    lblalternateresidenceIdentitytype.Text = objCom.GetAddressProof(Convert.ToInt32(profileInfo.alternativeresidenceproofId));
                }
                if (profileInfo.alternativeIdentityproofId != null)
                {
                    lblalternateIdentitytype.Text = objCom.GetIdentityProof(Convert.ToInt32(profileInfo.alternativeIdentityproofId));
                }

                lblalternatedobIdentityNo.Text = profileInfo.alternativeproofdobno;
                lblalternateresidenceIdentityNo.Text = profileInfo.alternativeresidenceproofno;
                lblalternateIdentityNo.Text = profileInfo.alternativeIdentityproofno;

            }
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
                          join utm in db.adminuniversitywisetooltips
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.admintooltips on pfm.primaryfieldid equals tm.fieldid into tmp
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
                    case "PASSPORT EXPIRY DATE":
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
        return obj.primaryfiledname;
    }

    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname
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
                    case "PASSPORT EXPIRY DATE":
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
    private String setComments(dynamic obj)
    {
        return obj.comments;
    }
    private void SetAdminComments()
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "Passport Number":
                    if (Comments[k].adminaction == 0)
                        rblPassportNoNo.Checked = true;
                    else
                        rblPassportNoYes.Checked = true;
                    txtPassportNo.Value = setComments(Comments[k]);
                    break;
                case "Date of Issue":
                    if (Comments[k].adminaction == 0)
                        rblDateOfissueNo.Checked = true;
                    else
                        rblDateOfissueYes.Checked = true;
                    txtDateOfissue.Value = setComments(Comments[k]);
                    break;
                case "PASSPORT EXPIRY DATE":
                    if (Comments[k].adminaction == 0)
                        rblExpiryDateNo.Checked = true;
                    else
                        rblExpiryDateYes.Checked = true;
                    txtExpiryDate.Value = setComments(Comments[k]);
                    break;
                case "COUNTRY OF ISSUE":
                    if (Comments[k].adminaction == 0)
                        rblcountryIssueNo.Checked = true;
                    else
                        rblcountryIssueYes.Checked = true;
                    txtcountryIssue.Value = setComments(Comments[k]);
                    break;
                case "CITY OF ISSUE":
                    if (Comments[k].adminaction == 0)
                        rblissueplaceNo.Checked = true;
                    else
                        rblissueplaceYes.Checked = true;
                    txtissueplace.Value = setComments(Comments[k]);
                    break;
                case "Select Identity Proof Type":
                    if (Comments[k].adminaction == 0)
                        rblalternateIdentitytypeNo.Checked = true;
                    else
                        rblalternateIdentitytypeYes.Checked = true;
                    txtalternateIdentitytype.Value = setComments(Comments[k]);
                    break;
                case "Identity Proof Number":
                    if (Comments[k].adminaction == 0)
                        rblalternateIdentityNoNo.Checked = true;
                    else
                        rblalternateIdentityNoYes.Checked = true;
                    txtalternateIdentityNo.Value = setComments(Comments[k]);
                    break;
                case "Select DOB Proof Type":
                    if (Comments[k].adminaction == 0)
                        rblalternatedobIdentitytypeNo.Checked = true;
                    else
                        rblalternatedobIdentitytypeYes.Checked = true;
                    txtalternatedobIdentitytype.Value = setComments(Comments[k]);
                    break;
                case "DOB proof Number":
                    if (Comments[k].adminaction == 0)
                        rblalternatedobIdentityNoNo.Checked = true;
                    else
                        rblalternatedobIdentityNoYes.Checked = true;
                    txtalternatedobIdentityNo.Value = setComments(Comments[k]);
                    break;
                case "Select Residence Proof Type":
                    if (Comments[k].adminaction == 0)
                        rblalternateresidenceIdentitytypeNo.Checked = true;
                    else
                        rblalternateresidenceIdentitytypeYes.Checked = true;
                    txtalternateresidenceIdentitytype.Value = setComments(Comments[k]);
                    break;
                case "Residence Proof Number":
                    if (Comments[k].adminaction == 0)
                        rblalternateresidenceIdentityNoNo.Checked = true;
                    else
                        rblalternateresidenceIdentityNoYes.Checked = true;
                    txtalternateresidenceIdentityNo.Value = setComments(Comments[k]);
                    break;
               

                default:
                    break;

            }

        }
        if (CustomControls.Count > 0)
            objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            if (passportno.Style.Value != "display: none")
                adminInputs.Add("Passport Number", txtPassportNo.Value.Trim() + "~" + (rblPassportNoNo.Checked == true ? 0 : 1));
            if (dateofissue.Style.Value != "display: none")
                adminInputs.Add("Date of Issue", txtDateOfissue.Value.Trim() + "~" + (rblDateOfissueNo.Checked == true ? 0 : 1));
            if (expirydate.Style.Value != "display: none")
                adminInputs.Add("PASSPORT EXPIRY DATE", txtExpiryDate.Value.Trim() + "~" + (rblExpiryDateNo.Checked == true ? 0 : 1));
            if (countryIssue.Style.Value != "display: none")
                adminInputs.Add("COUNTRY OF ISSUE", txtcountryIssue.Value.Trim() + "~" + (rblcountryIssueNo.Checked == true ? 0 : 1));
            if (issueplace.Style.Value != "display: none")
                adminInputs.Add("CITY OF ISSUE", txtissueplace.Value.Trim() + "~" + (rblissueplaceNo.Checked == true ? 0 : 1));
            if (alternateIdentitytype.Style.Value != "display: none")
                adminInputs.Add("Select Identity Proof Type", txtalternateIdentitytype.Value.Trim() + "~" + (rblalternateIdentitytypeNo.Checked == true ? 0 : 1));
            if (alternateIdentityNo.Style.Value != "display: none")
                adminInputs.Add("Identity Proof Number", txtalternateIdentityNo.Value.Trim() + "~" + (rblalternateIdentityNoNo.Checked == true ? 0 : 1));
            if (alternatedobIdentitytype.Style.Value != "display: none")
                adminInputs.Add("Select DOB Proof Type", txtalternatedobIdentitytype.Value.Trim() + "~" + (rblalternatedobIdentitytypeNo.Checked == true ? 0 : 1));
            if (alternatedobIdentityNo.Style.Value != "display: none")
                adminInputs.Add("DOB proof Number", txtalternatedobIdentityNo.Value.Trim() + "~" + (rblalternatedobIdentityNoNo.Checked == true ? 0 : 1));
            if (alternateresidenceIdentitytype.Style.Value != "display: none")
                adminInputs.Add("Select Residence Proof Type", txtalternateresidenceIdentitytype.Value.Trim() + "~" + (rblalternateresidenceIdentitytypeNo.Checked == true ? 0 : 1));
            if (alternateresidenceIdentityNo.Style.Value != "display: none")
                adminInputs.Add("Residence Proof Number", txtalternateresidenceIdentityNo.Value.Trim() + "~" + (rblalternateresidenceIdentityNoNo.Checked == true ? 0 : 1));

            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, userID, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}