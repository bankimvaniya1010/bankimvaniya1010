using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantlist : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { BindApplicant(); }

    }

    private void BindApplicant()
    {
        try
        {
            var applicant = (from q in db.applicantdetails

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
            if (e.CommandName.Equals("Social"))
            {
                Response.Redirect(webURL + "admin/applicantsocial.aspx?userid=" + ID + "&formid=" + form.formid,true);
            }
            //else if (e.CommandName.Equals("ViewPersonal")) { Response.Redirect(webURL + "admin/viewinfo.aspx?ID=" + ID); }
            //else if (e.CommandName.Equals("ValidateData")) { Response.Redirect(webURL + "admin/applicantdetailsvalidation.aspx?ID=" + ID); }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}