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
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            objCom.BindCountries(ddlpostalCountry);
            objCom.BindCountries(ddlResidentialCountry);
            PopulatePersonalInfo();
            SetToolTips();
            SetControlsUniversitywise();
        }
    }
    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
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
                    ddlpostalCountry.Items.FindByValue(profileInfo.postalcountry.ToString()).Selected = true;
                }
                txtResidentialAddress1.Value = profileInfo.residentialaddress1;
                txtResidentialAddress2.Value = profileInfo.residentialaddress2;
                txtResidentialAddress3.Value = profileInfo.residentialaddress3;
                txtResidentialCity.Value = profileInfo.residentialcity;
                txtResidentialState.Value = profileInfo.residentialstate;
                if (profileInfo.residentialcountry != null)
                {
                    ddlResidentialCountry.ClearSelection();
                    ddlResidentialCountry.Items.FindByValue(profileInfo.residentialcountry.ToString()).Selected = true;
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
            objapplicantDetail.mobileno = txtMobile.Value;
            //  objapplicantDetail.workphone = txtworkphone.Value;
            objapplicantDetail.homephone = txtHomePhone.Value;
            objapplicantDetail.email = txtEmail.Value;
            objapplicantDetail.postaladdrees1 = txtAddressLine1.Value;
            objapplicantDetail.postaladdrees2 = txtAddressLine2.Value;
            objapplicantDetail.postaladdrees3 = txtAddressLine3.Value;
            objapplicantDetail.postalcity = txtCity.Value;
            if (ddlpostalCountry.SelectedValue != "")
                objapplicantDetail.postalcountry = Convert.ToInt32(ddlpostalCountry.SelectedValue);
            objapplicantDetail.postalstate = txtState.Value;
            objapplicantDetail.postalpostcode = txtPostal.Value;
            if (rblSkypeYes.Checked == true)
            {
                objapplicantDetail.haveskypeid = 1;
                objapplicantDetail.skypeid = txtSkype.Text;
            }

            else
            { objapplicantDetail.haveskypeid = 0; }

            if (rblwhatsappYes.Checked)
            {
                objapplicantDetail.havewhatsup = 1;
            }


            else
            { objapplicantDetail.havewhatsup = 2; }
            if (rblWhatsupsameYes.Checked)
            {
                objapplicantDetail.isdifferentwhatsapp = 1;
            }


            else
            { objapplicantDetail.isdifferentwhatsapp = 2; }

            if (rblAddressYes.Checked == true)
                objapplicantDetail.issameaspostal = 1;
            else
                objapplicantDetail.issameaspostal = 1;

            objapplicantDetail.residentialaddress1 = txtResidentialAddress1.Value;
            objapplicantDetail.residentialaddress2 = txtResidentialAddress2.Value;
            objapplicantDetail.residentialaddress3 = txtResidentialAddress3.Value;
            objapplicantDetail.residentialcity = txtResidentialCity.Value;
            objapplicantDetail.residentialstate = txtResidentialState.Value;
            if (ddlResidentialCountry.SelectedValue != "")
                objapplicantDetail.residentialcountry = Convert.ToInt32(ddlResidentialCountry.SelectedValue);

            objapplicantDetail.nomineefullname = txtNomineeName.Value;
            objapplicantDetail.residentailpostcode = txtResidentialpostal.Value;
            objapplicantDetail.nomineeemail = txtEmailNominee.Value;
            objapplicantDetail.nomineemobile = txtMobileNominee.Value;
            objapplicantDetail.relationshipwithnominee = txtRelationNominee.Value;
            objapplicantDetail.contactdetailsavetime = DateTime.Now;
            objapplicantDetail.universityid = universityID;
            objapplicantDetail.applicantid = userID;
            if (mode == "new")
                db.applicantdetails.Add(objapplicantDetail);
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
                        ddlResidentialCountry.Attributes.Add("title", lstToolTips[k].tooltips);
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
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname + " * " : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ") * ";
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
                        labelskype.InnerHtml = setInnerHtml(fields[k]);
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
}