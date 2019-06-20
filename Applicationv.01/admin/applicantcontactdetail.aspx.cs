using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantcontactdetail : System.Web.UI.Page
{

    int formId = 0;
    Common objCom = new Common();
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();
    protected int isStudyBefore = 0, isApplyBefore = 0;
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
                lblNominneName.Text = profileInfo.nomineefullname;
                lblNomineeEmail.Text = profileInfo.nomineeemail;
                lblNomineeMobile.Text = profileInfo.nomineemobile;
                lblNomineeRealtion.Text = profileInfo.relationshipwithnominee;
                DateTime zeroTime = new DateTime(1, 1, 1);
                DateTime Dob = Convert.ToDateTime(profileInfo.dateofbirth);
                Age objAge = new Age(Dob, DateTime.Now);

                if (objAge.Years < 18)
                {
                    gurdianmessgae.Visible = false;
                    guardian.Visible = true;
                    gurdianmessgae.InnerText = gurdianmessgae.InnerText.Replace("#Year#", objAge.Years.ToString()).Replace("#Month#", objAge.Months.ToString());
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
}