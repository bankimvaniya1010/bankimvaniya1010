﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantsocial : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    Logger objLog = new Logger();
    protected int isStudyBefore = 0, isApplyBefore = 0;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);
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
            SetToolTips();
            PopulatePersonalInfo();SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
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

                    case "Linkedin":
                        txtLinkedin.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Facebook":
                        txtFacebook.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Twitter":
                        txtTwitter.Attributes.Add("title", lstToolTips[k].tooltips);
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

    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                txtFacebook.Value = profileInfo.facebookprofle;
                txtLinkedin.Value = profileInfo.linkedprofile;
                txtTwitter.Value = profileInfo.facebookprofle;
            }
            lblSaveTime.Text = " Record was last saved at " + profileInfo.socialprofilesavetime.ToString();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }
    private void SetControlsUniversitywise(int universityID)
    {
        try {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

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
                    case "LINK TO YOUR LINKEDIN PROFILE":
                        linkedin.Attributes.Add("style", "display:block;");
                        labellinked.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LINK TO YOUR FACEBOOK PROFILE":
                        facebook.Attributes.Add("style", "display:block;");
                        labelfacebook.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LINK TO YOUR TWITTER HANDLE":
                        twitter.Attributes.Add("style", "display:block;");
                        labeltwitter.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    default:
                        break;
                }
            }
            }  catch (Exception ex)
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
            if (profileInfo != null)
            {
                profileInfo.facebookprofle = txtFacebook.Value;
                profileInfo.linkedprofile = txtLinkedin.Value;
                profileInfo.facebookprofle = txtTwitter.Value;
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
}