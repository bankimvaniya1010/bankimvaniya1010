﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorapplicantvisa : System.Web.UI.Page
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
            PopulateSupervisorComments();
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
                case "Do you currently have a visa that allows you to study in {insert name of country}":
                    lblHaveVisaComments.Text = setComments(Comments[k]);
                    break;
                case "Which Visa Do You Hold":
                    lblvisaComments.Text = setComments(Comments[k]);
                    break;
                case "Validity From":
                    lblvalidityFromComments.Text = setComments(Comments[k]);
                    break;
                case "Validity To":
                    lblvalidityToComments.Text = setComments(Comments[k]);
                    break;
                case "Visa No":
                    lblvisanoComments.Text = setComments(Comments[k]);
                    break;
                case "Where would you be making your Visa application":
                    lblvisaappliedComments.Text = setComments(Comments[k]);
                    break;
                case "City":
                    lblvisacityComments.Text = setComments(Comments[k]);
                    break;
                case "Visa Application Country":
                    lblvisacountryComments.Text = setComments(Comments[k]);
                    break;
                case "Date of first Visit to Country of Application":
                    lblfirstvisitComments.Text = setComments(Comments[k]);
                    break;
                case "Have you ever, lived, worked, studied in Country of Application before":
                    lblPreviuosstayComments.Text = setComments(Comments[k]);
                    break;
                case "Do your parents/step parents/spouse/partner/children/step-children live":
                    lblparentComments.Text = setComments(Comments[k]);
                    break;
                case "Have you ever been refused a Visa or Deported by Country of Application":
                    lblDeniedVisaComments.Text = setComments(Comments[k]);
                    break;
                case "Have your parents/step parents/spouse/partner/children/step-children ever been refused a visa or deported from":
                    lblparentdenyComments.Text = setComments(Comments[k]);
                    break;
                default:
                    break;

            }
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdminComments(formId, ApplicantID, CustomControls, mainDiv, Comments);
        }
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