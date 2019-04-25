using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantsocial : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    Logger objLog = new Logger();
    protected int isStudyBefore = 0, isApplyBefore = 0;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        if (!IsPostBack)
        {
            SetToolTips();
            PopulatePersonalInfo(); SetControlsUniversitywise(1);
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
    private void SetControlsUniversitywise(int universityID)
    {

        var fields = (from pfm in db.primaryfieldmaster
                      join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                      where ufm.universityid == universityID && ufm.formid == 7
                      select new
                      {
                          primaryfiledname = pfm.primaryfiledname,

                      }).ToList();
        for (int k = 0; k < fields.Count; k++)
        {
            switch (fields[k].primaryfiledname)
            {
                case "LINK TO YOUR LINKEDIN PROFILE":
                    linkedin.Attributes.Add("style", "display:block;");
                    labellinked.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "LINK TO YOUR FACEBOOK PROFILE":
                    facebook.Attributes.Add("style", "display:block;");
                    labelfacebook.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "LINK TO YOUR TWITTER HANDLE":
                    twitter.Attributes.Add("style", "display:block;");
                    labeltwitter.InnerHtml = fields[k].primaryfiledname;
                    break;
                default:
                    break;
            }
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