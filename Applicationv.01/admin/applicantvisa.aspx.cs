using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantvisa : System.Web.UI.Page
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
            PopulateVisaInfo();
            SetAdminComments();
        }
    }

    private void PopulateVisaInfo()
    {
        try
        {
            var VisaInfo = (from pInfo in db.applicantvisadetails
                            where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                            select pInfo).FirstOrDefault();
            if (VisaInfo != null)
            {
                if (VisaInfo.hasvisa == 1)
                    lblHaveVisa.Text = "Yes";
                else if (VisaInfo.hasvisa == 2)
                    lblHaveVisa.Text = "No - I will need to apply for an international student visa";
                if (VisaInfo.applicantvisatype != null)
                {
                    lblvisa.Text = objCom.GetVisaType(Convert.ToInt32(VisaInfo.applicantvisatype));

                }
                if (VisaInfo.validityfrom != null)
                    lblvalidityFrom.Text = Convert.ToDateTime(VisaInfo.validityfrom).ToString("yyyy-MM-dd");
                if (VisaInfo.validityto != null)
                    lblvalidityTo.Text = Convert.ToDateTime(VisaInfo.validityto).ToString("yyyy-MM-dd");
                lblvisano.Text = VisaInfo.visano;
                if (VisaInfo.firstvisit != null)
                    lblfirstvisit.Text = Convert.ToDateTime(VisaInfo.firstvisit).ToString("yyyy-MM-dd");
                lblvisacity.Text = VisaInfo.city;
                if (VisaInfo.visaapplied == 1)
                    lblvisaapplied.Text = "Country where the college is located";
                else if (VisaInfo.visaapplied == 2)
                    lblvisaapplied.Text = "Offshore";
                if (VisaInfo.country != null)
                {
                    lblvisacountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.country));

                }
                if (VisaInfo.havelivedearlier == 1)
                    lblPreviuosstay.Text = "Yes";
                else if (VisaInfo.havelivedearlier == 2)
                    lblPreviuosstay.Text = "No";
                if (VisaInfo.haveparent == 1)
                    lblparent.Text = "Yes";
                else if (VisaInfo.haveparent == 2)
                    lblparent.Text = "No";
                if (VisaInfo.isvisadenied == 1)
                    lblDeniedVisa.Text = "Yes";
                else if (VisaInfo.isvisadenied == 2)
                    lblDeniedVisa.Text = "No";
                if (VisaInfo.isparentvisadenied == 1)
                    lblparentdeny.Text = "Yes";
                else if (VisaInfo.isparentvisadenied == 2)
                    lblparentdeny.Text = "No";
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
                case "Do you currently have a visa that allows you to study in ":
                    txtHaveVisa.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblHaveVisaNo.Checked = true;
                    else
                        rblHaveVisaYes.Checked = true;
                    break;
                case "Which Visa Do You Hold":
                    txtVisa.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvisaNo.Checked = true;
                    else
                        rblvisaYes.Checked = true;
                    break;
                case "Validity From":
                    txtvalidityFrom.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvalidityFromNo.Checked = true;
                    else
                        rblvalidityFromYes.Checked = true;
                    break;
                case "Validity To":
                    txtvalidityTo.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvalidityToNo.Checked = true;
                    else
                        rblvalidityToYes.Checked = true;
                    break;
                case "Visa No":
                    txtvisano.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvisanoNo.Checked = true;
                    else
                        rblvisanoYes.Checked = true;
                    break;

                case "Where would you be making your Visa application":
                    txtvisaappliedCountry.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvisaappliedCountryNo.Checked = true;
                    else
                        rblvisaappliedCountryYes.Checked = true;
                    break;
                case "City":
                    txtvisacity.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvisacityNo.Checked = true;
                    else
                        rblvisacityYes.Checked = true;
                    break;
                case "Visa Application Country":
                    txtvisacountry.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblvisacountryNo.Checked = true;
                    else
                        rblvisacountryYes.Checked = true;
                    break;
                case "Date of first Visit to Country of Application":
                    txtfirstvisit.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblfirstvisitNo.Checked = true;
                    else
                        rblfirstvisitYes.Checked = true;
                    break;
                case "Have you ever, lived, worked, studied in Country of Application before":
                    txtPreviuosstay.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblPreviuosstayNo.Checked = true;
                    else
                        rblPreviuosstayYes.Checked = true;
                    break;
                case "Do your parents/step parents/spouse/partner/children/step-children live":
                    txtparent.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblparentNo.Checked = true;
                    else
                        rblparentYes.Checked = true;
                    break;
                case "Have you ever been refused a Visa or Deported by Country of Application":
                    txtDeniedVisa.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblparentdenyNo.Checked = true;
                    else
                        rblparentdenyYes.Checked = true;
                    break;
                case "Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from":
                    txtparentdeny.Value = setComments(Comments[k]);
                    if (Comments[k].adminaction == 0)
                        rblparentdenyNo.Checked = true;
                    else
                        rblparentdenyYes.Checked = true;
                    break;
                default:
                    break;

            }
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {

            adminInputs.Add("Do you currently have a visa that allows you to study in {insert name of country}", txtHaveVisa.Value.Trim() + "~" + (rblHaveVisaNo.Checked == true ? 0 : 1));
            adminInputs.Add("Which Visa Do You Hold", txtVisa.Value.Trim() + "~" + (rblvisaNo.Checked == true ? 0 : 1));
            adminInputs.Add("Validity From", txtvalidityFrom.Value.Trim() + "~" + (rblvalidityFromNo.Checked == true ? 0 : 1));
            adminInputs.Add("Validity To", txtvalidityTo.Value.Trim() + "~" + (rblvalidityToNo.Checked == true ? 0 : 1));
            adminInputs.Add("Visa No", txtvisano.Value.Trim() + "~" + (rblvisanoNo.Checked == true ? 0 : 1));
            adminInputs.Add("Where would you be making your Visa application", txtvisaappliedCountry.Value.Trim() + "~" + (rblvisaappliedCountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("City", txtvisacity.Value.Trim() + "~" + (rblvisacityNo.Checked == true ? 0 : 1));
            adminInputs.Add("Visa Application Country", txtvisacountry.Value.Trim() + "~" + (rblvisacountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("Date of first Visit to Country of Application", txtfirstvisit.Value.Trim() + "~" + (rblfirstvisitNo.Checked == true ? 0 : 1));
            adminInputs.Add("Have you ever, lived, worked, studied in Country of Application before", txtPreviuosstay.Value.Trim() + "~" + (rblPreviuosstayNo.Checked == true ? 0 : 1));
            adminInputs.Add("Do your parents/step parents/spouse/partner/children/step-children live, study, work in Country of Application", txtparent.Value.Trim() + "~" + (rblparentNo.Checked == true ? 0 : 1));
            adminInputs.Add("Have you ever been refused a Visa or Deported by Country of Application", txtDeniedVisa.Value.Trim() + "~" + (rblDeniedVisaNo.Checked == true ? 0 : 1));
            adminInputs.Add("Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from", txtparentdeny.Value.Trim() + "~" + (rblparentdenyNo.Checked == true ? 0 : 1));

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