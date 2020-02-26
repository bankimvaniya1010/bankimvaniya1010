using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantworkexperince : System.Web.UI.Page
{
    int formId = 0;
    protected Common objCom = new Common();
    int adminID = 0, ApplicantID = 0, universityID;
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
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
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
        CustomControls = objCom.CustomControlist(formId, universityID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControlinAdmin(CustomControls, mainDiv);
        EmployersDetail = db.applicantemployerdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).ToList();
        SetToolTips();
        SetControlsUniversitywise();
        Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomDataAdmin(formId, ApplicantID, CustomControls, mainDiv);
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
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        employmentInfoToolTips = setTooltips(fields[k]);
                        break;
                    case "WEBSITE":
                        employerwebsiteToolTips = setTooltips(fields[k]);
                        break;
                    case "NAME OF EMPLOYER ORGANISATION":
                        employerToolTips = setTooltips(fields[k]);
                        break;

                    case "CITY OF EMPLOYER’S LOCATION":
                        employercityToolTips = setTooltips(fields[k]);
                        break;
                    case "COUNTRY OF EMPLOYER’S LOCATION":
                        employercountryToolTips = setTooltips(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        positionToolTips = setTooltips(fields[k]);
                        break;
                    case "START DATE OF EMPLOYMENT":
                        startdateToolTips = setTooltips(fields[k]);
                        break;
                    case "END DATE OF EMPLOYMENT":
                        enddateToolTips = setTooltips(fields[k]);
                        break;
                    case "BRIEF JOB DESCRIPTION":
                        BriefDescriptionToolTips = setTooltips(fields[k]);
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger = setTooltips(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverificationToolTips = setTooltips(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationshipToolTips = setTooltips(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        emailToolTips = setTooltips(fields[k]);
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedinToolTips = setTooltips(fields[k]);
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
                    case "NAME OF EMPLOYER ORGANISATION":
                        employer = setInnerHtml(fields[k]);
                        break;

                    case "CITY OF EMPLOYER’S LOCATION":
                        employercity = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY OF EMPLOYER’S LOCATION":
                        employercountry = setInnerHtml(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        position = setInnerHtml(fields[k]);
                        break;
                    case "START DATE OF EMPLOYMENT":
                        startdate = setInnerHtml(fields[k]);
                        break;
                    case "END DATE OF EMPLOYMENT":
                        enddate = setInnerHtml(fields[k]);
                        break;
                    case "BRIEF JOB DESCRIPTION":
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


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string value = hdnValue.Value;
        string[] inputs = value.Split('|');
        Hashtable adminInputs = new Hashtable();
        try
        {
            for (int k = 0; k < inputs.Length - 1; k++)
            {
                string values = inputs[k].ToString();
                adminInputs.Add(values.Split(':')[0], values.Split(':')[1]);
            }
            if (CustomControls.Count > 0)
                objCom.ReadCustomfieldAdmininput(ApplicantID, formId, CustomControls, mainDiv, adminInputs);

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminID, adminInputs);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
    }
}