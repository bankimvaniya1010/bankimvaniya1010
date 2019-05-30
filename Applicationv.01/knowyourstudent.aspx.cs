using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class knowyourstudent : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx",true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            BindCountry();
            SetToolTips();
            BindAlternateDobProof();
            BindAlternateIDProof();
            PopulatePersonalInfo();
            SetControlsUniversitywise();
            BindResidenceIdProof();
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                profileInfo.passportno = txtPassportNo.Value;
                profileInfo.passportissuedate = Convert.ToDateTime(txtdateofissue.Value);
                profileInfo.passportexpirydate = Convert.ToDateTime(txtexpirydate.Value);
                profileInfo.passportissuecity = txtissueplaceCity.Value;            
                
                if (ddlalternatedobIdentitytype.SelectedValue != "")
                {
                    profileInfo.alternativeproofdobId = Convert.ToInt32(ddlalternatedobIdentitytype.SelectedValue);

                }
                if (ddlCountryofIssue.SelectedValue != "")
                {
                    profileInfo.passportissuecountry = ddlCountryofIssue.SelectedValue;

                }
                if (ddlalternateresidenceIdentitytype.SelectedValue != "")
                {
                    profileInfo.alternativeresidenceproofId = Convert.ToInt32(ddlalternateresidenceIdentitytype.SelectedValue);

                }
                if (ddlalternateIdentitytype.SelectedValue != "")
                {
                   profileInfo.alternativeIdentityproofId = Convert.ToInt32(ddlalternateIdentitytype.SelectedValue);

                }

                profileInfo.alternativeproofdobno = txtalternatedobIdentityNo.Value;
                profileInfo.alternativeresidenceproofno = txtalternateresidenceIdentityNo.Value;
                profileInfo.alternativeIdentityproofno = txtalternateIdentityNo.Value;
                profileInfo.identificationsavetime = DateTime.Now;
                db.SaveChanges();
                lblMessage.Text = "Your Contact Details have been saved";
                lblMessage.Visible = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                txtPassportNo.Value = profileInfo.passportno;
                txtdateofissue.Value = Convert.ToDateTime(profileInfo.passportissuedate).ToString("yyyy-MM-dd");
                txtexpirydate.Value = Convert.ToDateTime(profileInfo.passportexpirydate).ToString("yyyy-MM-dd");
                txtissueplaceCity.Value = profileInfo.passportissuecity;
                if (profileInfo.alternativeIdentityproofId != null)
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
    private void BindCountry()
    {
        try
        {
            ListItem lst = new ListItem("Please Select", "0");
            var country = db.countriesmaster.ToList();
            ddlCountryofIssue.DataSource = country;
            ddlCountryofIssue.DataTextField = "country_name";
            ddlCountryofIssue.DataValueField = "country_code";
            ddlCountryofIssue.DataBind();
            ddlCountryofIssue.Items.Insert(0, lst);
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
            ListItem lst = new ListItem("Please select", "0");
            var identitytype = (from ap in db.alternateidproofmaster
                      join ump in db.universitywisemastermapping on ap.id equals ump.mastervalueid
                      join mn in db.master_name on ump.masterid equals mn.masterid
                      where ump.universityid == universityID && ump.masterid == 3
                      select new
                      {
                          description = ap.description,
                          id = ap.id
                      }).ToList();

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
            lstToolTips = db.tooltipmaster.ToList();
            for (int k = 0; k < lstToolTips.Count; k++)
            {
                switch (lstToolTips[k].field)
                {

                    case "Passportno":
                        txtPassportNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Passportissuedate":
                        txtdateofissue.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Passportexpirydate":
                        txtexpirydate.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "PassportIssuecountry":
                        ddlCountryofIssue.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "PassportIssueCity":
                        txtissueplaceCity.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;                                      
                    case "AlternativeIDNo":
                        txtalternateIdentityNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "AlternativeIdentitytype":
                        ddlalternateIdentitytype.Attributes.Add("title", lstToolTips[k].tooltips);                        
                        break;
                    case "AlternativeDobno":
                        txtalternatedobIdentityNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "AlternativeDobType":
                        ddlalternatedobIdentitytype.ToolTip = lstToolTips[k].tooltips;
                      
                        break;
                    case "AlternativeAddressNo":
                        txtalternateresidenceIdentityNo.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "AlternativeAddressType":
                        ddlalternateresidenceIdentitytype.Attributes.Add("title", lstToolTips[k].tooltips);
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
    private void SetControlsUniversitywise()
    {try
        {
            string SecondaryLanguage = "";
            if (Session["SecondaryLang"] != null)
            {
                SecondaryLanguage = Session["SecondaryLang"].ToString();
            }
            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.universityid == universityID && ufm.formid == formId && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = afm.fieldnameinstructions,
                              secondaryfieldnameinstructions = afm.secondaryfieldnameinstructions,
                              secondaryfieldnamelanguage = afm.secondaryfieldnamelanguage,
                              secondaryfielddnamevalue = afm.secondaryfielddnamevalue
                          }).ToList();
            if (fields.Count == 0 && SecondaryLanguage != "")
            {
                fields = (from ufm in db.universitywisefieldmapping
                          join pfm in db.primaryfieldmaster on ufm.primaryfieldid equals pfm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.formid == formId && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = afm.fieldnameinstructions,
                              secondaryfieldnameinstructions = afm.secondaryfieldnameinstructions,
                              secondaryfieldnamelanguage = afm.secondaryfieldnamelanguage,
                              secondaryfielddnamevalue = afm.secondaryfielddnamevalue
                          }).ToList();
            }
            else if (fields.Count == 0 && SecondaryLanguage == "")
            {
                fields = (from ufm in db.universitywisefieldmapping
                          join pfm in db.primaryfieldmaster on ufm.primaryfieldid equals pfm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.formid == formId && ufm.universityid == universityID
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = "",
                              secondaryfieldnameinstructions = "",
                              secondaryfieldnamelanguage = "",
                              secondaryfielddnamevalue = ""
                          }).ToList();
            }
            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster

                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = "",
                              secondaryfieldnameinstructions = "",
                              secondaryfieldnamelanguage = "",
                              secondaryfielddnamevalue = ""
                          }).ToList();
            }

            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "PASSPORT NUMBER":
                        passportno.Attributes.Add("style", "display:block;");
                        labelpassportno.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "DATE OF ISSUE":
                        dateofissue.Attributes.Add("style", "display:block;");
                        labeldateofissue.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COUNTRY OF ISSUE":
                        countryIssue.Attributes.Add("style", "display:block;");
                        labelcountryIssue.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EXPIRY DATE":
                        expirydate.Attributes.Add("style", "display:block;");
                        labelexpirydate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CITY OF ISSUE":
                        issueplace.Attributes.Add("style", "display:block;");
                        labelissueplace.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ALTERNATIVE PROOF OF IDENTITY":
                        alternateIdentitytype.Attributes.Add("style", "display:block;");
                        alternateIdentityNo.Attributes.Add("style", "display:block;");
                        break;
                    case "ALTERNATIVE PROOF OF DATE OF BIRTH":
                        alternatedobIdentitytype.Attributes.Add("style", "display:block;");
                        alternatedobIdentityNo.Attributes.Add("style", "display:block;");                        
                        break;
                    case "ALTERNATIVE PROOF OF RESIDENCE":
                        alternateresidenceIdentitytype.Attributes.Add("style", "display:block;");
                        alternateresidenceIdentityNo.Attributes.Add("style", "display:block;");
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