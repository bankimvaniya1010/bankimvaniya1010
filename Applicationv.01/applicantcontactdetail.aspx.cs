using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantcontactdetail : System.Web.UI.Page
{
    int formId = 0;
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
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) && (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx");
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            PopulatePersonalInfo(); SetToolTips(); SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
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
                txtAddressLine1.Value = profileInfo.postaladdrees1;
                txtAddressLine2.Value = profileInfo.postaladdrees2;
                txtAddressLine3.Value = profileInfo.postaladdrees3;
                txtCity.Value = profileInfo.postalcity;
                txtState.Value = profileInfo.postalstate;
                txtResidentialpostal.Value = profileInfo.residentailpostcode;
                txtPostal.Value = profileInfo.postalpostcode;
                if (profileInfo.postalcountry != null)
                {
                    ddlpostalCountry.ClearSelection();
                    ddlpostalCountry.Items.FindByValue(profileInfo.postalcountry).Selected = true;
                }
                txtResidentialAddress1.Value = profileInfo.residentialaddress1;
                txtResidentialAddress2.Value = profileInfo.residentialaddress2;
                txtResidentialAddress3.Value = profileInfo.residentialaddress3;
                txtResidentialCity.Value = profileInfo.residentialcity;
                txtResidentialState.Value = profileInfo.residentialstate;
                if (profileInfo.residentialcountry != null)
                {
                    ddlResidential.ClearSelection();
                    ddlResidential.Items.FindByValue(profileInfo.residentialcountry).Selected = true;
                }
                txtMobile.Value = profileInfo.mobileno;
                // txtworkphone.Value = profileInfo.workphone;
                txtHomePhone.Value = profileInfo.homephone;
                txtEmail.Value = profileInfo.email;
                // txtConfirmEmail.Value = profileInfo.email;
                txtNomineeName.Value = profileInfo.nomineefullname;
                txtEmailNominee.Value = profileInfo.nomineeemail;
                txtMobileNominee.Value = profileInfo.nomineemobile;
                txtRelationNominee.Value = profileInfo.relationshipwithnominee;
                if (profileInfo.haveskypeid == 1)
                {
                    rblSkypeYes.Checked = true;

                    txtSkype.Text = profileInfo.skypeid;
                }

                else
                { rblSkypeNo.Checked = true; }

                if (profileInfo.isdifferentwhatsapp == 1)
                {
                    rblWhatsupsameYes.Checked = true;
                }
                else
                {
                    rblWhatsupsameNo.Checked = true;
                }
                if (profileInfo.havewhatsup == 1)
                {
                    rblwhatsappYes.Checked = true;
                }
                else
                {
                    rblwhatsappDif.Checked = true;
                }


                if (profileInfo.issameaspostal == 1)
                    rblAddressYes.Checked = true;
                else
                    rblAddressNo.Checked = false;
                DateTime zeroTime = new DateTime(1, 1, 1);
                DateTime Dob = Convert.ToDateTime(profileInfo.dateofbirth);
                Age objAge = new Age(Dob, DateTime.Now);

                if (objAge.Years < 18)
                {
                    guardian.Visible = true;
                    gurdianmessgae.InnerText = gurdianmessgae.InnerText.Replace("#Year#", objAge.Years.ToString()).Replace("#Month#", objAge.Months.ToString());

                }
                else
                    guardian.Visible = false;
                lblSaveTime.Text = " Record was last saved at " + profileInfo.contactdetailsavetime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();

            profileInfo.mobileno = txtMobile.Value;
            //  profileInfo.workphone = txtworkphone.Value;
            profileInfo.homephone = txtHomePhone.Value;
            profileInfo.email = txtEmail.Value;
            profileInfo.postaladdrees1 = txtAddressLine1.Value;
            profileInfo.postaladdrees2 = txtAddressLine2.Value;
            profileInfo.postaladdrees3 = txtAddressLine3.Value;
            profileInfo.postalcity = txtCity.Value;
            profileInfo.postalcountry = ddlpostalCountry.SelectedValue;
            profileInfo.postalstate = txtState.Value;
            profileInfo.postalpostcode = txtPostal.Value;
            if (rblSkypeYes.Checked == true)
            {
                profileInfo.haveskypeid = 1;
                profileInfo.skypeid = txtSkype.Text;
            }

            else
            { profileInfo.haveskypeid = 0; }

            if (rblwhatsappYes.Checked)
            {
                profileInfo.havewhatsup = 1;
            }


            else
            { profileInfo.havewhatsup = 2; }
            if (rblWhatsupsameYes.Checked)
            {
                profileInfo.isdifferentwhatsapp = 1;
            }


            else
            { profileInfo.isdifferentwhatsapp = 2; }

            if (rblAddressYes.Checked == true)
                profileInfo.issameaspostal = 1;
            else
                profileInfo.issameaspostal = 1;

            profileInfo.residentialaddress1 = txtResidentialAddress1.Value;
            profileInfo.residentialaddress2 = txtResidentialAddress2.Value;
            profileInfo.residentialaddress3 = txtResidentialAddress3.Value;
            profileInfo.residentialcity = txtResidentialCity.Value;
            profileInfo.residentialstate = txtResidentialState.Value;
            profileInfo.residentialcountry = ddlResidential.SelectedValue;
            profileInfo.nomineefullname = txtNomineeName.Value;
            profileInfo.residentailpostcode = txtResidentialpostal.Value;
            profileInfo.nomineeemail = txtEmailNominee.Value;
            profileInfo.nomineemobile = txtMobileNominee.Value;
            profileInfo.relationshipwithnominee = txtRelationNominee.Value;
            profileInfo.contactdetailsavetime = DateTime.Now;

            db.SaveChanges();
            lblMessage.Text = "Your Contact Details have been saved";
            lblMessage.Visible = true;
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

                    case "Email":
                        txtEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Mobile":
                        txtMobile.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Homephone":
                        txtHomePhone.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Haveskype":
                        rblSkypeYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblSkypeNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Skypeid":
                        txtSkype.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Havewhatsapp":
                        rblwhatsappYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblwhatsappDif.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Coonectwithwhatsapp":
                        rblWhatsupsameNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        rblWhatsupsameYes.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Anotherwhatsapp":
                        txtWhatsappNo.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Postalddress":
                        txtAddressLine1.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtAddressLine2.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtAddressLine3.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtCity.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtState.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtPostal.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlpostalCountry.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "ResedentialAddress":
                        txtResidentialAddress1.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtResidentialAddress2.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtResidentialAddress3.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtResidentialCity.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtResidentialState.Attributes.Add("title", lstToolTips[k].tooltips);
                        txtResidentialpostal.Attributes.Add("title", lstToolTips[k].tooltips);
                        ddlResidential.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Addresssame":
                        rblAddressYes.ToolTip = lstToolTips[k].tooltips;
                        rblAddressNo.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Guardianname":
                        txtNomineeName.Attributes.Add("title", lstToolTips[k].tooltips);
                       
                        break;
                    case "RelationswithGuardian":
                        txtRelationNominee.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Guradianemail":
                        txtEmailNominee.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "GuardianMobile":
                        txtMobileNominee.Attributes.Add("title", lstToolTips[k].tooltips);
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
    {
        try
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
                    case "EMAIL":
                        email.Attributes.Add("style", "display:block;");
                        labelemail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        mobile.Attributes.Add("style", "display:block;");
                        labelMobile.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "HOME PHONE":
                        phone.Attributes.Add("style", "display:block;");
                        labelphone.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA SKYPE":
                        skype.Attributes.Add("style", "display:block;");
                        labelskype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "SKYPE ID":
                        skypeDesc.Attributes.Add("style", "display:block;");
                        labelskype.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA WHATSAPP":
                        whatsapp.Attributes.Add("style", "display:block;");
                        labelwhatsapp.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO":
                        whatsappHave.Attributes.Add("style", "display:block;");
                        labelwhatsappHave.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "WHATSAPP NUMBER":
                        whatsappDesc.Attributes.Add("style", "display:block;");
                        labelwhatsappDesc.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "POSTAL ADDRESS":
                        postal.Attributes.Add("style", "display:block;");
                        labelpostal.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "IS YOUR POSTAL ADDRESS SAME AS YOUR CURRENT RESIDENTIAL ADDRESS":
                        address.Attributes.Add("style", "display:block;");
                        labeladdress.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "CURRENT RESIDENTIAL ADDRESS":
                        residential.Attributes.Add("style", "display:block;");
                        labelResidential.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "GUARDIAN FULL NAME":
                        guardianname.Attributes.Add("style", "display:block;");
                        labelguardianname.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "RELATIONSHIP WITH GUARDIAN":
                        guardianrelation.Attributes.Add("style", "display:block;");
                        labelrelation.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EMAIL OF GUARDIAN":
                        guardianemail.Attributes.Add("style", "display:block;");
                        labelguardianemail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MOBILE/CELLULAR NUMBER OF GUARDIAN":
                        guardianmobile.Attributes.Add("style", "display:block;");
                        labelguardianmobile.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;

                    default:
                        break;
                }
            }
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }
}