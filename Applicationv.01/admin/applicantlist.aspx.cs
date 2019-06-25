using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantlist : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!IsPostBack)
        { BindApplicant(); }

    }

    private void BindApplicant()
    {
        try
        {
            var applicant = (from q in db.applicantdetails
                             where q.universityid == universityID

                             select new
                             {
                                 applicantid = q.applicantid,
                                 name = q.firstname + " " + q.lastname,

                             }).ToList();
            gvApplicant.DataSource = applicant;
            gvApplicant.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void gvApplicant_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string Comamandname = e.CommandName;
            var form = db.formmaster.Where(x => x.formname.Contains(Comamandname)).FirstOrDefault();
            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            
            if (Comamandname.Equals("Personal"))
            {
                Response.Redirect(webURL + "admin/personaldetail.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Contact"))
            {
                Response.Redirect(webURL + "admin/applicantcontactdetail.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Identification"))
            {
                Response.Redirect(webURL + "admin/knowyourstudent.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Education"))
            {
                Response.Redirect(webURL + "admin/applicanteducation.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Language"))
            {
                Response.Redirect(webURL + "admin/applicantlanguage.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Employers"))
            {
                Response.Redirect(webURL + "admin/applicantworkexperince.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Social"))
            {
                Response.Redirect(webURL + "admin/applicantsocial.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Visa"))
            {
                Response.Redirect(webURL + "admin/applicantvisa.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Funding"))
            {
                Response.Redirect(webURL + "admin/applicantfunding.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            if (Comamandname.Equals("Reference"))
            {
                Response.Redirect(webURL + "admin/applicantreferncecheck.aspx?userid=" + ID + "&formid=" + form.formid, true);
            }
            //else if (e.CommandName.Equals("ViewPersonal")) { Response.Redirect(webURL + "admin/viewinfo.aspx?ID=" + ID); }
            //else if (e.CommandName.Equals("ValidateData")) { Response.Redirect(webURL + "admin/applicantdetailsvalidation.aspx?ID=" + ID); }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvApplicant_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvApplicant.PageIndex = e.NewPageIndex;
        BindApplicant();
    }
}