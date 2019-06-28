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
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, ApplicantID, CustomControls, mainDiv);
            SetToolTips();
            PopulatePersonalInfo();
            SetControlsUniversitywise();
            SetAdminComments();
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
                    lblFacebook.Text = "User has opted, he has no facebook account";
                else
                    lblFacebook.Text = profileInfo.facebookprofle;
                if ((profileInfo.havelinkedinaccount == null) || (profileInfo.havelinkedinaccount == false))
                    lblLinkedin.Text = "User has opted, he has no Linkedin  account";
                else
                    lblLinkedin.Text = profileInfo.linkedprofile;
                if ((profileInfo.havetwitteraccount == null) || (profileInfo.havetwitteraccount == false))
                    lblTwitter.Text = "User has opted, he has no Linkedin  account";
                else
                    lblTwitter.Text = profileInfo.twiterprofile;

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
                    txtLinkedinComments.Value = setComments(Comments[k]);
                    break;
                case "Link to your Facebook profile":
                    txtFacebookComments.Value = setComments(Comments[k]);
                    break;
                case "Link to your twitter handle":
                    txtTwitterComments.Value = setComments(Comments[k]);
                    break;
               
                default:
                    break;

            }

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            if (linkedin.Style.Value != "display: none")
                adminInputs.Add("Link to your LinkedIn profile", txtLinkedinComments.Value.Trim());
            else if (facebook.Style.Value != "display: none")
                adminInputs.Add("Link to your Facebook profile", txtFacebookComments.Value.Trim());
            else if (twitter.Style.Value != "display: none")
                adminInputs.Add("Link to your twitter handle", txtTwitterComments.Value.Trim());

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