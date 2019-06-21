using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyemployment : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null)
            {
                string verificationKey = Request.QueryString["key"];
                applicantemployerdetails details = db.applicantemployerdetails.Where(obj => obj.employerverificationkey == verificationKey).FirstOrDefault();

                if (details != null)
                {
                    if (details.isemployerdetailverified.HasValue && details.isemployerdetailverified.Value)
                    {
                        alreadyVerified();
                    }
                    else
                    {
                        details.isemployerdetailverified = true;
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