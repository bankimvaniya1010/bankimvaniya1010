using System;
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
   
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
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
            userID = Convert.ToInt32(Request.QueryString["userid"].ToString());
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, userID, CustomControls, mainDiv);

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
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
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

}