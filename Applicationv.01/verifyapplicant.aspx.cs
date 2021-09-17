using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyapplicant : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        
        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null)
            {
                string verificationKey = Request.QueryString["key"];
                
                applicantdetails details = db.applicantdetails.Where(obj => obj.verification_key_ == verificationKey).FirstOrDefault();

                if (details != null)
                {
                    if (details.isverifiedbyAdmin != true)
                    {
                        details.isverifiedbyAdmin = true;
                        db.SaveChanges();
                        afterVerification();
                    }
                    else
                        alreadyVerified();
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
        afterVerfication.Visible = true;
        alreadyverified.Visible = false;
        Div1.Visible = false;
    }

    private void alreadyVerified()
    {
        afterVerfication.Visible = false;
        alreadyverified.Visible = true;
        Div1.Visible = false;
    }

    private void notFound()
    {
        afterVerfication.Visible = false;
        alreadyverified.Visible = false;
        Div1.Visible = true;
    }
}