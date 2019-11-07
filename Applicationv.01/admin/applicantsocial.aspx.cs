using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantsocial : System.Web.UI.Page
{
    int formId = 0;
    Common objCom = new Common();
    int adminID = 0, ApplicantID = 0, universityID;
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
        adminID = Convert.ToInt32(Session["UserID"]);
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
            SetToolTips();            
            SetControlsUniversitywise();
            SetAdminComments();
            PopulatePersonalInfo();
        }
    }
    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.adminuniversitywisetooltips
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.admintooltips on pfm.primaryfieldid equals tm.fieldid into tmp
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
                    case "LINK TO YOUR LINKEDIN PROFILE":
                        icLinkedin.Attributes.Add("style", "display:block;");
                        icLinkedin.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LINK TO YOUR FACEBOOK PROFILE":
                        icFacebook.Attributes.Add("style", "display:block;");
                        icFacebook.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LINK TO YOUR TWITTER HANDLE":
                        icTwitter.Attributes.Add("style", "display:block;");
                        icTwitter.Attributes.Add("data-tipso", setTooltips(fields[k]));
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

    private void PopulatePersonalInfo()
    {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                if ((profileInfo.havefacebookaccount == null) || (profileInfo.havefacebookaccount == false))
                    lblFacebook.Text = profileInfo.facebookprofle;
                else
                    lblFacebook.Text = "User has opted, he has no facebook account";
                
                if ((profileInfo.havelinkedinaccount == null) || (profileInfo.havelinkedinaccount == false))
                    lblLinkedin.Text = profileInfo.linkedprofile;
                else
                    lblLinkedin.Text = "User has opted, he has no Linkedin  account";
                
                if ((profileInfo.havetwitteraccount == null) || (profileInfo.havetwitteraccount == false))
                    lblTwitter.Text = profileInfo.twiterprofile;
                else
                    lblTwitter.Text = "User has opted, he has no Linkedin  account";
                

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
                case "Link to your LinkedIn profile":
                    {
                        txtLinkedinComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblLinkedinNo.Checked = true;
                        else
                            rblLinkedinYes.Checked = true;
                    }
                    break;
                case "Link to your Facebook profile":
                    {
                        txtFacebookComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblFacebookNo.Checked = true;
                        else
                            rblFacebookYes.Checked = true;
                    }
                    break;
                case "Link to your twitter handle":
                    {
                        txtTwitterComments.Value = setComments(Comments[k]);
                        if (Comments[k].adminaction == 0)
                            rblTwitterNo.Checked = true;
                        else
                            rblTwitterYes.Checked = true;
                    }
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
            if (linkedin.Style.Value != "display: none")
            {

                adminInputs.Add("Link to your LinkedIn profile", txtLinkedinComments.Value.Trim() + "~" + (rblLinkedinNo.Checked == true ? 0 : 1));
            }
            if (facebook.Style.Value != "display: none")
                adminInputs.Add("Link to your Facebook profile", txtFacebookComments.Value.Trim() + "~" + (rblLinkedinNo.Checked == true ? 0 : 1));
            if (twitter.Style.Value != "display: none")
                adminInputs.Add("Link to your twitter handle", txtTwitterComments.Value.Trim() + "~" + (rblLinkedinNo.Checked == true ? 0 : 1));
            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminID, adminInputs);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved successfully')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}