using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantworkexperince : System.Web.UI.Page
{
    int formId = 0;
    protected Common objCom = new Common();
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    protected List<applicantemployerdetails> EmployersDetail = new List<applicantemployerdetails>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected string employmentInfoToolTips = "", employerwebsiteToolTips = "", employerToolTips = "", employercityToolTips = "", employercountryToolTips = "", positionToolTips = "", startdateToolTips = "", enddateToolTips = "", BriefDescriptionToolTips = "", reportingmangerToolTips = "", employmentverificationToolTips = "", relationshipToolTips = "", emailToolTips = "", linkedinToolTips = "";
    protected string employmentInfo = "", employerwebsite = "", employer = "", employercity = "", employercountry = "", position = "", startdate = "", enddate = "", BriefDescription = "", reportingmanger = "", employmentverification = "", relationship = "", email = "", linkedin = "";

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
            EmployersDetail = db.applicantemployerdetails.Where(x => x.applicantid == userID && x.universityid == universityID).ToList();
            SetToolTips();
            SetControlsUniversitywise();

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
                    case "NAME OF ORGANIZATION":
                        employerToolTips = setTooltips(fields[k]);
                        break;

                    case "CITY":
                        employercityToolTips = setTooltips(fields[k]);
                        break;
                    case "COUNTRY":
                        employercountryToolTips = setTooltips(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        positionToolTips = setTooltips(fields[k]);
                        break;
                    case "START DATE":
                        startdateToolTips = setTooltips(fields[k]);
                        break;
                    case "END DATE":
                        enddateToolTips = setTooltips(fields[k]);
                        break;
                    case "BRIEF DESCRIPTION OF WHAT YOU DID":
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

}