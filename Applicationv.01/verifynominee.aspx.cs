using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifynominee : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null)
            {
                string verificationKey = Request.QueryString["key"];
                applicantdetails details = db.applicantdetails.Where(obj => obj.nomineeverificationkey == verificationKey).FirstOrDefault();

                if (details != null)
                {
                    if (details.isnomineeverified.HasValue && details.isnomineeverified.Value)
                    {
                        alreadyVerified();
                    }
                    else
                    {
                        details.isnomineeverified = true;
                        db.SaveChanges();
                        afterVerification();
                    }
                }
                else
                    notFound();
            }
            else
                notFound();
        }
    }

    private void afterVerification()
    {
        detailsNotFound.Visible = false;
        verified.Visible = false;
        afterVerfication.Visible = true;
    }

    private void alreadyVerified()
    {
        detailsNotFound.Visible = false;
        afterVerfication.Visible = false;
        verified.Visible = true;
    }

    private void notFound()
    {
        detailsNotFound.Visible = true;
        afterVerfication.Visible = false;
        verified.Visible = false;
    }
}