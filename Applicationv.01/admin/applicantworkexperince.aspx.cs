using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantworkexperince : System.Web.UI.Page
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

            SetToolTips();
            SetControlsUniversitywise();
            PopulateEmployerInfo();


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
                        icemploymentInfo.Attributes.Add("style", "display:block;");
                        icemploymentInfo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WEBSITE":
                        icemployerwebsite.Attributes.Add("style", "display:block;");
                        icemployerwebsite.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF ORGANIZATION":
                        icemployer.Attributes.Add("style", "display:block;");
                        icemployer.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;

                    case "CITY":
                        icemployercity.Attributes.Add("style", "display:block;");
                        icemployercity.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY":
                        icemployercountry.Attributes.Add("style", "display:block;");
                        icemployercountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "POSITION/ROLE IN":
                        icposition.Attributes.Add("style", "display:block;");
                        icposition.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "START DATE":
                        icstartdate.Attributes.Add("style", "display:block;");
                        icstartdate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "END DATE":
                        icenddate.Attributes.Add("style", "display:block;");
                        icenddate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "BRIEF DESCRIPTION OF WHAT YOU DID":
                        icemploymentInfo.Attributes.Add("style", "display:block;");
                        icemploymentInfo.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        icreportingmanger.Attributes.Add("style", "display:block;");
                        icreportingmanger.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        icemploymentverification.Attributes.Add("style", "display:block;");
                        icemploymentverification.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        icrelationship.Attributes.Add("style", "display:block;");
                        icrelationship.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        icemail.Attributes.Add("style", "display:block;");
                        icemail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        iclinkedin.Attributes.Add("style", "display:block;");
                        iclinkedin.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
                        employmentInfo.Attributes.Add("style", "display:block;");
                        labelemployment.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WEBSITE":
                        employerwebsite.Attributes.Add("style", "display:block;");
                        labelemployerwebsite.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF ORGANIZATION":
                        employer.Attributes.Add("style", "display:block;");
                        labelemployer.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "CITY":
                        employercity.Attributes.Add("style", "display:block;");
                        labelemployercity.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY":
                        employercountry.Attributes.Add("style", "display:block;");
                        labelemployercountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        position.Attributes.Add("style", "display:block;");
                        labelposition.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "START DATE":
                        startdate.Attributes.Add("style", "display:block;");
                        labelstartdate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "END DATE":
                        endate.Attributes.Add("style", "display:block;");
                        labelendate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "BRIEF DESCRIPTION OF WHAT YOU DID":
                        briefDescription.Attributes.Add("style", "display:block;");
                        labelbriefDescription.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger.Attributes.Add("style", "display:block;");
                        labelreportingmanger.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverification.Attributes.Add("style", "display:block;");
                        labelemploymentverification.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationship.Attributes.Add("style", "display:block;");
                        labelrelationship.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        email.Attributes.Add("style", "display:block;");
                        labelemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedin.Attributes.Add("style", "display:block;");
                        labellinkedin.InnerHtml = setInnerHtml(fields[k]);
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
    private void PopulateEmployerInfo()
    {
        try
        {
            var employerInfo = (from pInfo in db.applicantemployerdetails
                                where pInfo.applicantid == userID && pInfo.universityid == universityID
                                select pInfo).FirstOrDefault();
            if (employerInfo != null)
            {
                if (employerInfo.wishtoaddemployer == 1)
                    lblemploymentInfo.Text = "";
                else
                    lblemploymentInfo.Text = "";
                lblemployer.Text = employerInfo.organization;
                lblemployerwebsite.Text = employerInfo.website;
                lblemployercity.Text = employerInfo.city;
                if (employerInfo.country != null)
                {
                    lblemployercountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(employerInfo.country));

                }
                lblposition.Text = employerInfo.designation;
                lblstartdate.Text = Convert.ToDateTime(employerInfo.durationfrom).ToString("yyyy-MM-dd");
                lblendate.Text = Convert.ToDateTime(employerInfo.durationto).ToString("yyyy-MM-dd");
                lblbriefDescription.Text = employerInfo.briefdescription;
                lblreportingmanger.Text = employerInfo.nameofreportingmanger;
                lblemploymentverification.Text = employerInfo.contactpersonwithdetails;
                if (employerInfo.relationshipwithcontact != null)
                {
                    lblrelationship.Text = objCom.GetRealtionship(Convert.ToInt32(employerInfo.relationshipwithcontact));
                }
                lblemail.Text = employerInfo.emailid;
                lbllinkedin.Text = employerInfo.linkedinidofcontact;

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }






}