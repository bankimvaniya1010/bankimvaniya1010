using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class knowyourstudent : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        if (!IsPostBack)
        {
            SetToolTips();
            BindAlternateAgeProof();
            BindAlternateProof();
            BindAlternateIDProof();
            PopulatePersonalInfo();SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
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
                if (rblalternateidenityYes.Checked == true)
                    profileInfo.alternativeiddentiproof = 1;
                else
                    profileInfo.alternativeiddentiproof = 0;
                if (rblalternateresidenceidenityYes.Checked == true)
                    profileInfo.alternativeresidenceproof = 1;
                else
                    profileInfo.alternativeresidenceproof = 0;

                if (rblalternatedobidenityYes.Checked == true)
                    profileInfo.alternativedobproof = 1;
                else
                    profileInfo.alternativedobproof = 0;


                if (ddlalternatedobIdentitytype.SelectedValue != "")
                {
                    profileInfo.alternativeproofdobtype = Convert.ToInt32(ddlalternatedobIdentitytype.SelectedValue);

                }
                if (ddlCountryofIssue.SelectedValue != "")
                {
                    profileInfo.passportissuecountry = ddlCountryofIssue.SelectedValue;

                }
                if (ddlalternateresidenceIdentitytype.SelectedValue != "")
                {
                    profileInfo.alternativeresidenceprooftype = Convert.ToInt32(ddlalternateresidenceIdentitytype.SelectedValue);

                }
                if (ddlalternateIdentitytype.SelectedValue != "")
                {
                    profileInfo.alternativeprooftype = Convert.ToInt32(ddlalternateIdentitytype.SelectedValue);

                }

                profileInfo.alternativeproofdobno = txtalternatedobIdentityNo.Value;
                profileInfo.alternativeresidenceproofno = txtalternateresidenceIdentityNo.Value;
                profileInfo.alternativeproofno = txtalternateIdentityNo.Value;
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
                if (profileInfo.alternativeiddentiproof == 1)
                    rblalternateidenityYes.Checked = true;
                else
                    rblalternateidenityNo.Checked = false;
                if (profileInfo.alternativeresidenceproof == 1)
                    rblalternateresidenceidenityYes.Checked = true;
                else
                    rblalternateresidenceidenityNo.Checked = false;
                if (profileInfo.alternativedobproof == 1)
                    rblalternatedobidenityYes.Checked = true;
                else
                    rblalternatedobidenityNo.Checked = false;

                if (profileInfo.alternativeproofdobtype != null)
                {
                    ddlalternatedobIdentitytype.ClearSelection();
                    ddlalternatedobIdentitytype.Items.FindByValue(profileInfo.alternativeproofdobtype.ToString()).Selected = true;
                }
                if (profileInfo.alternativeresidenceprooftype != null)
                {
                    ddlalternateresidenceIdentitytype.ClearSelection();
                    ddlalternateresidenceIdentitytype.Items.FindByValue(profileInfo.alternativeresidenceprooftype.ToString()).Selected = true;
                }
                if (profileInfo.alternativeprooftype != null)
                {
                    ddlalternateIdentitytype.ClearSelection();
                    ddlalternateIdentitytype.Items.FindByValue(profileInfo.alternativeprooftype.ToString()).Selected = true;
                }
                if (profileInfo.passportissuecountry != null)
                {
                    ddlCountryofIssue.ClearSelection();
                    ddlCountryofIssue.Items.FindByValue(profileInfo.passportissuecountry.ToString()).Selected = true;
                }
                txtalternatedobIdentityNo.Value = profileInfo.alternativeproofdobno;
                txtalternateresidenceIdentityNo.Value = profileInfo.alternativeresidenceproofno;
                txtalternateIdentityNo.Value = profileInfo.alternativeproofno;
                lblSaveTime.Text = " Record was last saved at " + profileInfo.identificationsavetime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindAlternateAgeProof()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var age = db.alternatedobproof.ToList();
            ddlalternatedobIdentitytype.DataSource = age;
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
    private void BindAlternateProof()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var address = db.alternateadressproofmaster.ToList();
            ddlalternateIdentitytype.DataSource = address;
            ddlalternateIdentitytype.DataTextField = "description";
            ddlalternateIdentitytype.DataValueField = "id";
            ddlalternateIdentitytype.DataBind();
            ddlalternateIdentitytype.Items.Insert(0, lst);
            ddlalternateresidenceIdentitytype.DataSource = address;
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

    private void BindAlternateIDProof()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Id = db.alternateidproofmaster.ToList();
            ddlalternateIdentitytype.DataSource = Id;
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
                    case "HavealternativeAddressProof":
                        rblalternateresidenceidenityYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblalternateresidenceidenityNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "HaveAlternativeDob":
                        rblalternatedobidenityNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblalternatedobidenityYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "HavealternativeID":
                        rblalternateidenityYes.ToolTip = lstToolTips[k].tooltips;
                        rblalternateidenityNo.ToolTip = lstToolTips[k].tooltips;
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
    private void SetControlsUniversitywise(int universityID)
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
                          where ufm.universityid == universityID && ufm.formid == 8 && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
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
                          where ufm.formid == 8 && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
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
                          where ufm.formid == 8 && ufm.universityid == universityID
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

                          where pfm.formid == 8
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
                        alternateidentity.Attributes.Add("style", "display:block;");
                        alternateIdentitytype.Attributes.Add("style", "display:block;");
                        alternateIdentityNo.Attributes.Add("style", "display:block;");
                        labelalternateidentity.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ALTERNATIVE PROOF OF DATE OF BIRTH":
                        alternatedobidentity.Attributes.Add("style", "display:block;");
                        alternatedobIdentitytype.Attributes.Add("style", "display:block;");
                        alternatedobIdentityNo.Attributes.Add("style", "display:block;");
                        labelalternatedobidentity.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ALTERNATIVE PROOF OF RESIDENCE":
                        alternateresidenceidenity.Attributes.Add("style", "display:block;");
                        alternateresidenceIdentitytype.Attributes.Add("style", "display:block;");
                        alternateresidenceIdentityNo.Attributes.Add("style", "display:block;");
                        labelalternateresidenceidenity.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "IDENTITY TYPE":
                        labelalternatedobIdentitytype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        labelalternateIdentitytype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        labelalternateresidenceIdentitytype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "IDENTITY NUMBER":
                        labelalternateIdentityNo.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        labelalternatedobIdentityNo.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        labelalternateresidenceIdentityNo.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
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