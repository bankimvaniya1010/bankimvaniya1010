using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supervisorapplicantworkexperince : System.Web.UI.Page
{
    int formId = 0;
    protected Common objCom = new Common();
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    protected List<applicantemployerdetails> EmployersDetail = new List<applicantemployerdetails>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    protected List<admincomments> Comments = new List<admincomments>();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected string employmentInfoToolTips = "", employerwebsiteToolTips = "", employerToolTips = "", employercityToolTips = "", employercountryToolTips = "", positionToolTips = "", startdateToolTips = "", enddateToolTips = "", BriefDescriptionToolTips = "", reportingmangerToolTips = "", employmentverificationToolTips = "", relationshipToolTips = "", emailToolTips = "", linkedinToolTips = "";
    protected string employmentInfo = "", employerwebsite = "", employer = "", employercity = "", employercountry = "", position = "", startdate = "", enddate = "", BriefDescription = "", reportingmanger = "", employmentverification = "", relationship = "", email = "", linkedin = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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
        EmployersDetail = db.applicantemployerdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();
      
        SetControlsUniversitywise();
        Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        if (!IsPostBack)
        {
            PopulateSupervisorComments();
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
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
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        employmentInfo = setInnerHtml(fields[k]);
                        break;
                    case "WEBSITE":
                        employerwebsite = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF ORGANIZATION":
                        employer = setInnerHtml(fields[k]);
                        break;

                    case "CITY":
                        employercity = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY":
                        employercountry = setInnerHtml(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        position = setInnerHtml(fields[k]);
                        break;
                    case "START DATE":
                        startdate = setInnerHtml(fields[k]);
                        break;
                    case "END DATE":
                        enddate = setInnerHtml(fields[k]);
                        break;
                    case "BRIEF DESCRIPTION OF WHAT YOU DID":
                        BriefDescription = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverification = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationship = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        email = setInnerHtml(fields[k]);
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedin = setInnerHtml(fields[k]);
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