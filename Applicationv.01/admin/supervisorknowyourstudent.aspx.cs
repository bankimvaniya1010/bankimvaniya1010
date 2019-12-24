using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorknowyourstudent : System.Web.UI.Page
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
            PopulateSupervisorComments();
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
                    lblalternateresidenceIdentitytype.Text = objCom.GetAddressProof(Convert.ToInt32(profileInfo.alternativeIdentityproofId));
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

  
    private String setInnerHtml(dynamic obj)
    {
        return obj.primaryfiledname;
    }

    private void SetControlsUniversitywise()
    {
        try
        {
         
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
                    labelpassportnoComments.Text = setComments(Comments[k]);
                    break;
                case "Date of Issue":
                    if (Comments[k].adminaction == 0)
                        rblDateOfissueNo.Checked = true;
                    else
                        rblDateOfissueYes.Checked = true;
                    lblDateOfissueComments.Text = setComments(Comments[k]);
                    break;
                case "Expiry Date":
                    if (Comments[k].adminaction == 0)
                        rblExpiryDateNo.Checked = true;
                    else
                        rblExpiryDateYes.Checked = true;
                    lblExpiryDateComments.Text = setComments(Comments[k]);
                    break;
                case "COUNTRY OF ISSUE":
                    if (Comments[k].adminaction == 0)
                        rblcountryIssueNo.Checked = true;
                    else
                        rblcountryIssueYes.Checked = true;
                    lblcountryIssueComments.Text = setComments(Comments[k]);
                    break;
                case "CITY OF ISSUE":
                    if (Comments[k].adminaction == 0)
                        rblissueplaceNo.Checked = true;
                    else
                        rblissueplaceYes.Checked = true;
                    lblissueplaceComments.Text = setComments(Comments[k]);
                    break;
                case "Select Identity Proof Type":
                    if (Comments[k].adminaction == 0)
                        rblalternateIdentitytypeNo.Checked = true;
                    else
                        rblalternateIdentitytypeYes.Checked = true;
                    lblalternateIdentitytypeComments.Text = setComments(Comments[k]);
                    break;
                case "Identity Proof Number":
                    if (Comments[k].adminaction == 0)
                        rblalternateIdentityNoNo.Checked = true;
                    else
                        rblalternateIdentityNoYes.Checked = true;
                    lblalternateIdentityNoComments.Text = setComments(Comments[k]);
                    break;
                case "Select DOB Proof Type":
                    if (Comments[k].adminaction == 0)
                        rblalternatedobIdentitytypeNo.Checked = true;
                    else
                        rblalternatedobIdentitytypeYes.Checked = true;
                    lblalternatedobIdentitytypeComments.Text = setComments(Comments[k]);
                    break;
                case "DOB proof Number":
                    if (Comments[k].adminaction == 0)
                        rblalternatedobIdentityNoNo.Checked = true;
                    else
                        rblalternatedobIdentityNoYes.Checked = true;
                    lblalternatedobIdentityNoComments.Text = setComments(Comments[k]);
                    break;
                case "Select Residence Proof Type":
                    if (Comments[k].adminaction == 0)
                        rblalternateresidenceIdentitytypeNo.Checked = true;
                    else
                        rblalternateresidenceIdentitytypeYes.Checked = true;
                    lblalternateresidenceIdentitytypeComments.Text = setComments(Comments[k]);
                    break;
                case "Residence Proof Number":
                    if (Comments[k].adminaction == 0)
                        rblalternateresidenceIdentityNoNo.Checked = true;
                    else
                        rblalternateresidenceIdentityNoYes.Checked = true;
                    lblalternateresidenceIdentityNoComments.Text = setComments(Comments[k]);
                    break;


                default:
                    break;

            }

        }
        if (CustomControls.Count > 0)
            objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
    }
    private void PopulateSupervisorComments()
    {
        List<supervisorcomments> comments = objCom.GetSupervisorComments(ApplicantID, universityID, formId);
        if (comments.Count > 0)
        {
            txtComments.Text = comments[0].comments;
            if (comments[0].supervisoraction == 1)
                rbApproved.Checked = true;
            else if (comments[0].supervisoraction == 2)
                rbDenied.Checked = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int ActionValue = 0;
            if (rbApproved.Checked)
                ActionValue = 1;
            else if (rbDenied.Checked)
                ActionValue = 2;
            objCom.SaveSupervisorComments(ApplicantID, universityID, formId, userID, txtComments.Text, ActionValue);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}