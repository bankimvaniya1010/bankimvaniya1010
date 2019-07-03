﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorcontactdetails : System.Web.UI.Page
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

        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
            SetAdminComments();
            PopulatePersonalInfo();
            SetControlsUniversitywise();
            PopulateSupervisorComments();
        }
    }
    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                lblEmail.Text = profileInfo.email;
                lblMobile.Text = profileInfo.mobileno;
                lblHomePhone.Text = profileInfo.homephone;
                if (profileInfo.haveskypeid == 1)
                {
                    lblSkype.Text = "Yes";
                    lblSkypeDescription.Text = profileInfo.skypeid;
                    skypeDesc.Visible = true;
                }
                else if (profileInfo.haveskypeid == 0)
                {
                    lblSkype.Text = "No";
                    lblSkypeDescription.Text = "";
                    skypeDesc.Visible = false;
                }

                if (profileInfo.havewhatsup == 1)
                {
                    lblWhatsapp.Text = "Yes";
                    if (profileInfo.isdifferentwhatsapp == 1)
                    {
                        lblWhatsapphave.Text = "No";
                        lblWhastappDesription.Text = profileInfo.whatsappno;
                    }
                    else if (profileInfo.isdifferentwhatsapp == 2)
                    {
                        lblWhatsapphave.Text = "Yes";
                        whatsappDesc.Visible = false;
                    }
                }
                else if (profileInfo.havewhatsup == 2)
                {
                    lblWhatsapp.Text = "No";
                    whatsappHave.Visible = false;
                    whatsappDesc.Visible = false;
                }


                lblPostalAddress.Text = profileInfo.postaladdrees1 + "," + profileInfo.postaladdrees2 + "," + profileInfo.postaladdrees3 + "," +
                    "," + profileInfo.postalcity + "," + profileInfo.postalstate + "," + profileInfo.postalpostcode;

                if (profileInfo.postalcountry != null)
                {
                    lblPostalAddress.Text += "," + objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.postalcountry));
                }
                if (profileInfo.issameaspostal == 1)
                {
                    lblAddress.Text = "Yes";
                    lblResidential.Text = lblPostalAddress.Text;
                }
                else if (profileInfo.issameaspostal == 2)
                {
                    lblAddress.Text = "No";
                    lblResidential.Text = profileInfo.residentialaddress1 + "," + profileInfo.residentialaddress2 + "," + profileInfo.residentialaddress3 + "," +
                    "," + profileInfo.residentialcity + "," + profileInfo.residentialstate + "," + profileInfo.residentailpostcode;

                    if (profileInfo.residentialcountry != null)
                    {
                        lblPostalAddress.Text += "," + objCom.GetCountryDiscription(Convert.ToInt32(profileInfo.residentialcountry));
                    }
                }
                if (profileInfo.haspreviousresidence.HasValue && profileInfo.haspreviousresidence.Value)
                {
                    lblCurrentAddress.Text = "Yes";

                    var lstOfResidences = db.applicantresidencehistory.Where(x => x.applicantid == userID && x.universityid == universityID).ToList();

                    lblPrevAddStartDate.Text = Convert.ToDateTime(lstOfResidences[0].residencestartdate).ToString("yyyy-MM-dd");
                    lblPrevAddEndDate.Text = Convert.ToDateTime(lstOfResidences[0].residenceenddate).ToString("yyyy-MM-dd");
                    lblprevAddress1.Text = lstOfResidences[0].residenceaddress1;
                    lblprevAddress2.Text = lstOfResidences[0].residenceaddress2;
                    lblprevAddress3.Text = lstOfResidences[0].residenceaddress3;
                    lblprevAddressCity.Text = lstOfResidences[0].residentialcity;
                    lblprevAddressState.Text = lstOfResidences[0].residentialstate;
                    lblprevAddressPostalCode.Text = lstOfResidences[0].residencepostcode;
                    if (lstOfResidences[0].residentialcountry != null)
                    {

                        lblPrevAddressCountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(lstOfResidences[0].residentialcountry));
                    }

                    addressHistory.Style.Remove("display");

                    for (int i = 1; i < lstOfResidences.Count; i++)
                    {
                        hidAddress1.Value += lstOfResidences[i].residenceaddress1 + ";";
                        hidAddress2.Value += lstOfResidences[i].residenceaddress2 + ";";
                        hidAddress3.Value += lstOfResidences[i].residenceaddress3 + ";";
                        hidAddressCity.Value += lstOfResidences[i].residentialcity + ";";
                        hidAddressStartDate.Value += Convert.ToDateTime(lstOfResidences[i].residencestartdate).ToString("yyyy-MM-dd") + ";";
                        hidAddressEndDate.Value += Convert.ToDateTime(lstOfResidences[i].residenceenddate).ToString("yyyy-MM-dd") + ";";
                        hidAddressState.Value += lstOfResidences[i].residentialstate + ";";
                        hidAddressPostalCode.Value += lstOfResidences[i].residencepostcode + ";";
                        hidAddressCountry.Value += objCom.GetCountryDiscription(Convert.ToInt32(lstOfResidences[i].residentialcountry)) + ";";
                    }
                }
                else if (!profileInfo.haspreviousresidence.Value)
                    lblCurrentAddress.Text = "No";
                lblNominneName.Text = profileInfo.nomineefullname;
                lblNomineeEmail.Text = profileInfo.nomineeemail;
                lblNomineeMobile.Text = profileInfo.nomineemobile;
                lblNomineeRealtion.Text = profileInfo.relationshipwithnominee;
                DateTime zeroTime = new DateTime(1, 1, 1);
                DateTime Dob = Convert.ToDateTime(profileInfo.dateofbirth);
                Age objAge = new Age(Dob, DateTime.Now);
                if (profileInfo.isnomineeverified == true)
                    isVerifed.Visible = true;
                else
                    isVerifed.Visible = false;
                if (objAge.Years < 18)
                {

                    guardian.Visible = true;
                    // gurdianmessgae.InnerText = gurdianmessgae.InnerText.Replace("#Year#", objAge.Years.ToString()).Replace("#Month#", objAge.Months.ToString());
                }
                else
                    guardian.Visible = false;

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
                    case "EMAIL":
                        email.Attributes.Add("style", "display:block;");
                        labelemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        mobile.Attributes.Add("style", "display:block;");
                        labelMobile.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "HOME PHONE":
                        phone.Attributes.Add("style", "display:block;");
                        labelphone.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA SKYPE":
                        skype.Attributes.Add("style", "display:block;");
                        labelskype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "SKYPE ID":
                        skypeDesc.Attributes.Add("style", "display:block;");
                        labelskypeDesc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA WHATSAPP":
                        whatsapp.Attributes.Add("style", "display:block;");
                        labelwhatsapp.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO":
                        whatsappHave.Attributes.Add("style", "display:block;");
                        labelwhatsappHave.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WHATSAPP NUMBER":
                        whatsappDesc.Attributes.Add("style", "display:block;");
                        labelwhatsappDesc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "POSTAL ADDRESS":
                        postal.Attributes.Add("style", "display:block;");
                        labelpostal.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "IS YOUR POSTAL ADDRESS SAME AS YOUR CURRENT RESIDENTIAL ADDRESS":
                        address.Attributes.Add("style", "display:block;");
                        labeladdress.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "CURRENT RESIDENTIAL ADDRESS":
                        residential.Attributes.Add("style", "display:block;");
                        labelResidential.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "GUARDIAN FULL NAME":
                        guardianname.Attributes.Add("style", "display:block;");
                        labelguardianname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH GUARDIAN":
                        guardianrelation.Attributes.Add("style", "display:block;");
                        labelrelation.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL OF GUARDIAN":
                        guardianemail.Attributes.Add("style", "display:block;");
                        labelguardianemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER OF GUARDIAN":
                        guardianmobile.Attributes.Add("style", "display:block;");
                        labelguardianmobile.InnerHtml = setInnerHtml(fields[k]);
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
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, userID);
        for (int k = 0; k < Comments.Count; k++)
        {
            switch (Comments[k].fieldname)
            {
                case "Email":
                    lblEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number":
                    lblMobileComments.Text = setComments(Comments[k]);
                    break;
                case "Home phone":
                    lblHomePhoneComments.Text = setComments(Comments[k]);
                    break;
                case "WOULD YOU LIKE TO CONNECT VIA SKYPE":
                    lblSkypeComments.Text = setComments(Comments[k]);
                    break;
                case "Skype ID":
                    lblSkypeDescriptionComments.Text = setComments(Comments[k]);
                    break;
                case "WOULD YOU LIKE TO CONNECT VIA WHATSAPP":
                    lblWhatsappComments.Text = setComments(Comments[k]);
                    break;
                case "IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO":
                    lblWhatsapphaveComments.Text = setComments(Comments[k]);
                    break;
                case "Whatsapp Number":
                    lblWhastappDesriptionComments.Text = setComments(Comments[k]);
                    break;
                case "Postal Address":
                    lblPostalAddressComments.Text = setComments(Comments[k]);
                    break;
                case "Is your Postal Address same as your current residential address":
                    lblAddressComments.Text = setComments(Comments[k]);
                    break;
                case "Current Residential  Address":
                    lblResidentialComments.Text = setComments(Comments[k]);
                    break;
                case "GUARDIAN Full Name":
                    lblNominneNameComments.Text = setComments(Comments[k]);
                    break;
                case "Relationship with GUARDIAN":
                    lblNomineeRealtionComments.Text = setComments(Comments[k]);
                    break;
                case "Email of GUARDIAN":
                    lblNomineeEmailComments.Text = setComments(Comments[k]);
                    break;
                case "Mobile/Cellular Number of GUARDIAN":
                    lblNomineeMobileComments.Text = setComments(Comments[k]);
                    break;
                case "PREVIOUS ADDRESS HISTORY DETAILS":
                    lblAddressHistoryComments.Text = setComments(Comments[k]);
                    break;
                case "HAVE YOU BEEN LIVING IN THE CURRENT ADDRESS FOR LESS THAN 1 YEAR ?":
                    lblCurrentAddressComments.Text = setComments(Comments[k]);
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