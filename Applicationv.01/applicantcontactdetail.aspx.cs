using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantcontactdetail : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();

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
        CustomControls = objCom.CustomControlist(formId, universityID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlpostalCountry);
            objCom.BindCountries(ddlResidentialCountry);
            objCom.BindCountries(ddlPrevAddressCountry);
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
                txtEmail.Value = profileInfo.email;
                txtEmail.Disabled = true;
                txtMobile.Value = profileInfo.mobileno;
                txtHomePhone.Value = profileInfo.homephone;
                if (profileInfo.haveskypeid == 1)
                {
                    rblSkypeYes.Checked = true;
                    txtSkype.Text = profileInfo.skypeid;
                }
                else if (profileInfo.haveskypeid == 0)
                { rblSkypeNo.Checked = true; }

                if (profileInfo.havewhatsup == 1)
                {
                    rblwhatsappYes.Checked = true;
                }
                else if (profileInfo.havewhatsup == 2)
                {
                    rblwhatsappNo.Checked = true;
                }

                if (profileInfo.isdifferentwhatsapp == 1)
                {
                    rblWhatsupsameYes.Checked = true;
                }
                else if (profileInfo.isdifferentwhatsapp == 2)
                {
                    rblWhatsupsameNo.Checked = true;
                    txtWhatsappNo.Text = profileInfo.whatsappno;
                }
                txtAddressLine1.Value = profileInfo.postaladdrees1;
                txtAddressLine2.Value = profileInfo.postaladdrees2;
                txtAddressLine3.Value = profileInfo.postaladdrees3;
                txtCity.Value = profileInfo.postalcity;
                txtState.Value = profileInfo.postalstate;
                txtPostal.Value = profileInfo.postalpostcode;
                if (profileInfo.postalcountry != null)
                {
                    ddlpostalCountry.ClearSelection();
                    ddlpostalCountry.Items.FindByValue(profileInfo.postalcountry.ToString()).Selected = true;
                }
                if (profileInfo.issameaspostal == 1)
                    rblAddressYes.Checked = true;
                else if (profileInfo.issameaspostal == 2)
                {
                    rblAddressNo.Checked = false;
                    txtResidentialAddress1.Value = profileInfo.residentialaddress1;
                    txtResidentialAddress2.Value = profileInfo.residentialaddress2;
                    txtResidentialAddress3.Value = profileInfo.residentialaddress3;
                    txtResidentialCity.Value = profileInfo.residentialcity;
                    txtResidentialState.Value = profileInfo.residentialstate;
                    txtResidentialpostal.Value = profileInfo.residentailpostcode;
                    if (profileInfo.residentialcountry != null)
                    {
                        ddlResidentialCountry.ClearSelection();
                        ddlResidentialCountry.Items.FindByValue(profileInfo.residentialcountry.ToString()).Selected = true;
                    }
                }

                if (profileInfo.haspreviousresidence.HasValue && profileInfo.haspreviousresidence.Value)
                {
                    rblCurrentAddYes.Checked = true;

                    var lstOfResidences = db.applicantresidencehistory.Where(x => x.applicantid == userID && x.universityid == universityID).ToList();

                    txtPrevAddStartDate.Value = Convert.ToDateTime(lstOfResidences[0].residencestartdate).ToString("yyyy-MM-dd");
                    txtPrevAddEndDate.Value = Convert.ToDateTime(lstOfResidences[0].residenceenddate).ToString("yyyy-MM-dd");
                    prevAddress1.Value = lstOfResidences[0].residenceaddress1;
                    prevAddress2.Value = lstOfResidences[0].residenceaddress2;
                    prevAddress3.Value = lstOfResidences[0].residenceaddress3;
                    prevAddressCity.Value = lstOfResidences[0].residentialcity;
                    prevAddressState.Value = lstOfResidences[0].residentialstate;
                    prevAddressPostalCode.Value = lstOfResidences[0].residencepostcode;
                    if (lstOfResidences[0].residentialcountry != null)
                    {
                        ddlPrevAddressCountry.ClearSelection();
                        ddlPrevAddressCountry.Items.FindByValue(lstOfResidences[0].residentialcountry.ToString()).Selected = true;
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
                        hidAddressCountry.Value += lstOfResidences[i].residentialcountry + ";";
                    }
                }
                else if(profileInfo.haspreviousresidence.HasValue && !profileInfo.haspreviousresidence.Value)
                    rblCurrentAddNo.Checked = true;

                txtNomineeName.Value = profileInfo.nomineefullname;
                txtEmailNominee.Value = profileInfo.nomineeemail;
                txtMobileNominee.Value = profileInfo.nomineemobile;
                txtRelationNominee.Value = profileInfo.relationshipwithnominee;
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
                    case "EMAIL":
                        icEmail.Attributes.Add("style", "display:block;");
                        icEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        icMobile.Attributes.Add("style", "display:block;");
                        icMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "HOME PHONE":
                        icHomePhone.Attributes.Add("style", "display:block;");
                        icHomePhone.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA SKYPE":
                        icSkype.Attributes.Add("style", "display:block;");
                        icSkype.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "SKYPE ID":
                        icSkypeDesc.Attributes.Add("style", "display:block;");
                        icSkypeDesc.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WOULD YOU LIKE TO CONNECT VIA WHATSAPP":
                        icWhatsapp.Attributes.Add("style", "display:block;");
                        icWhatsapp.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "IS YOUR WHATSAPP NO SAME AS YOUR MOBILE NO":
                        icWhatsapphave.Attributes.Add("style", "display:block;");
                        icWhatsapphave.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WHATSAPP NUMBER":
                        icWhatsappDesc.Attributes.Add("style", "display:block;");
                        icWhatsappDesc.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "POSTAL ADDRESS":
                        icPostal.Attributes.Add("style", "display:block;");
                        icPostal.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "IS YOUR POSTAL ADDRESS SAME AS YOUR CURRENT RESIDENTIAL ADDRESS":
                        icAddress.Attributes.Add("style", "display:block;");
                        icAddress.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CURRENT RESIDENTIAL ADDRESS":
                        icResedentail.Attributes.Add("style", "display:block;");
                        icResedentail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "GUARDIAN FULL NAME":
                        icNomineeName.Attributes.Add("style", "display:block;");
                        icNomineeName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "RELATIONSHIP WITH GUARDIAN":
                        icNomineeRealation.Attributes.Add("style", "display:block;");
                        icNomineeRealation.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL OF GUARDIAN":
                        icNomineeEmail.Attributes.Add("style", "display:block;");
                        icNomineeEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MOBILE/CELLULAR NUMBER OF GUARDIAN":
                        icNomineeMobile.Attributes.Add("style", "display:block;");
                        icNomineeMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
    private void SavePersonalInfo() {
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

            objapplicantDetail.email = txtEmail.Value;
            objapplicantDetail.mobileno = txtMobile.Value;
            objapplicantDetail.homephone = txtHomePhone.Value;

            if (rblSkypeYes.Checked == true)
            {
                objapplicantDetail.haveskypeid = 1;
                objapplicantDetail.skypeid = txtSkype.Text;
            }

            else if (rblSkypeNo.Checked == true)
            { objapplicantDetail.haveskypeid = 0; }

            if (rblwhatsappYes.Checked)
            {
                objapplicantDetail.havewhatsup = 1;
            }
            else if (rblwhatsappNo.Checked == true)
            { objapplicantDetail.havewhatsup = 2; }

            if (rblWhatsupsameYes.Checked)
            {
                objapplicantDetail.isdifferentwhatsapp = 1;
            }
            else if (rblWhatsupsameNo.Checked)
            {
                objapplicantDetail.isdifferentwhatsapp = 2;
                objapplicantDetail.whatsappno = txtWhatsappNo.Text;
            }

            objapplicantDetail.postaladdrees1 = txtAddressLine1.Value;
            objapplicantDetail.postaladdrees2 = txtAddressLine2.Value;
            objapplicantDetail.postaladdrees3 = txtAddressLine3.Value;
            objapplicantDetail.postalcity = txtCity.Value;
            objapplicantDetail.postalstate = txtState.Value;
            objapplicantDetail.postalpostcode = txtPostal.Value;
            if (ddlpostalCountry.SelectedValue != "")
                objapplicantDetail.postalcountry = Convert.ToInt32(ddlpostalCountry.SelectedValue);

            if (rblAddressYes.Checked == true)
            {
                objapplicantDetail.issameaspostal = 1;
            }

            else if (rblAddressNo.Checked == true)
            {
                objapplicantDetail.issameaspostal = 2;
                objapplicantDetail.residentialaddress1 = txtResidentialAddress1.Value;
                objapplicantDetail.residentialaddress2 = txtResidentialAddress2.Value;
                objapplicantDetail.residentialaddress3 = txtResidentialAddress3.Value;
                objapplicantDetail.residentialcity = txtResidentialCity.Value;
                objapplicantDetail.residentialstate = txtResidentialState.Value;
                objapplicantDetail.residentailpostcode = txtResidentialpostal.Value;
                if (ddlResidentialCountry.SelectedValue != "")
                    objapplicantDetail.residentialcountry = Convert.ToInt32(ddlResidentialCountry.SelectedValue);
            }

            if (rblCurrentAddYes.Checked)
            {
                var existinglst = db.applicantresidencehistory.Where(x => x.applicantid == userID && x.universityid == universityID).ToList();
                if (existinglst != null && existinglst.Count > 0)
                {
                    db.applicantresidencehistory.RemoveRange(existinglst);
                    db.SaveChanges();
                }

                objapplicantDetail.haspreviousresidence = true;
                List<applicantresidencehistory> lstresidenceHistory = new List<applicantresidencehistory>();
                applicantresidencehistory resHistory = new applicantresidencehistory();

                resHistory.applicantid = userID;
                resHistory.universityid = universityID;
                resHistory.residencestartdate = Convert.ToDateTime(txtPrevAddStartDate.Value);
                resHistory.residenceenddate = Convert.ToDateTime(txtPrevAddEndDate.Value);
                resHistory.residenceaddress1 = prevAddress1.Value;
                resHistory.residenceaddress2 = prevAddress2.Value;
                resHistory.residenceaddress3 = prevAddress3.Value;
                resHistory.residentialcity = prevAddressCity.Value;
                resHistory.residentialstate = prevAddressState.Value;
                resHistory.residencepostcode = prevAddressPostalCode.Value;
                if (ddlResidentialCountry.SelectedValue != "")
                    resHistory.residentialcountry = Convert.ToInt32(ddlPrevAddressCountry.SelectedValue);

                lstresidenceHistory.Add(resHistory);

                string[] prevAddressStartDates = hidAddressStartDate.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddressEndDates = hidAddressEndDate.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddresses1 = hidAddress1.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddresses2 = hidAddress2.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddresses3 = hidAddress3.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddressCities = hidAddressCity.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddressStates = hidAddressState.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddressCountries = hidAddressCountry.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                string[] prevAddressPostalCodes = hidAddressPostalCode.Value.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                int count = prevAddressStartDates.Length;

                for (int i = 0; i < count; i++)
                {
                    applicantresidencehistory tempHistory = new applicantresidencehistory();

                    tempHistory.applicantid = userID;
                    tempHistory.universityid = universityID;
                    tempHistory.residencestartdate = Convert.ToDateTime(prevAddressStartDates[i]);
                    tempHistory.residenceenddate = Convert.ToDateTime(prevAddressEndDates[i]);
                    tempHistory.residenceaddress1 = prevAddresses1[i];
                    tempHistory.residenceaddress2 = prevAddresses2[i];
                    tempHistory.residenceaddress3 = prevAddresses3[i];
                    tempHistory.residentialcity = prevAddressCities[i];
                    tempHistory.residentialstate = prevAddressStates[i];
                    tempHistory.residencepostcode = prevAddressPostalCodes[i];
                    tempHistory.residentialcountry = Convert.ToInt32(prevAddressCountries[i]);

                    lstresidenceHistory.Add(tempHistory);
                }

                db.applicantresidencehistory.AddRange(lstresidenceHistory);
                db.SaveChanges();
            }
            else if (rblCurrentAddNo.Checked)
                objapplicantDetail.haspreviousresidence = false;
            if (rblCurrentAddNo.Checked && mode == "update")
            {
                var existinglst = db.applicantresidencehistory.Where(x => x.applicantid == userID && x.universityid == universityID).ToList();
                if (existinglst != null && existinglst.Count > 0)
                {
                    db.applicantresidencehistory.RemoveRange(existinglst);
                    db.SaveChanges();
                }
            }
            objapplicantDetail.nomineefullname = txtNomineeName.Value;
            objapplicantDetail.nomineeemail = txtEmailNominee.Value;
            objapplicantDetail.nomineemobile = txtMobileNominee.Value;
            objapplicantDetail.relationshipwithnominee = txtRelationNominee.Value;
            if (objapplicantDetail.nomineeemail != null && !string.IsNullOrEmpty(objapplicantDetail.nomineeemail))
            {
                objapplicantDetail.isnomineeverified = false;
                objapplicantDetail.nomineeverificationkey = Guid.NewGuid().ToString();
            }
            objapplicantDetail.contactdetailsavetime = DateTime.Now;
            objapplicantDetail.iscontactdetailspresent = true;
            objapplicantDetail.universityid = universityID;
            objapplicantDetail.applicantid = userID;
            if (mode == "new")
                db.applicantdetails.Add(objapplicantDetail);
            db.SaveChanges();
            hidAddressHistory.Value = "0";

            if (objapplicantDetail.nomineeemail != null && !string.IsNullOrEmpty(objapplicantDetail.nomineeemail))
            {
                string url = webURL + "verifynominee.aspx?key=" + objapplicantDetail.nomineeverificationkey;
                StringBuilder sb = new StringBuilder();
                sb.Append("Dear " + objapplicantDetail.nomineefullname + ",<br/><br/>");

                sb.Append(objapplicantDetail.firstname + " " + objapplicantDetail.lastname + " has given your nomination for verification.<br/>");
                sb.Append("Please validate nomination details of " + objapplicantDetail.firstname + " " + objapplicantDetail.lastname + " with link given below <br/>");
                sb.Append("<a href=" + url + ">Validate Now</a> <br/>");
                sb.Append("Thank You <br/>");
                sb.Append("The Application Center Validation Team <br/>");
                objCom.SendMail(objapplicantDetail.nomineeemail, sb.ToString(), "Nomination Detail check for" + objapplicantDetail.firstname + " " + objapplicantDetail.lastname);
            }

            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetStudentDetailsCompletedStatus(userID, universityID);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        SavePersonalInfo();
    }

    protected void gotoNextPage_Click(object sender, EventArgs e)
    {
        SavePersonalInfo();
        Response.Redirect("knowyourstudent.aspx?formid=3", true);
    }
}