using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyhighschool : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["key"] != null || Request.QueryString["type"] != null)
            {
                string verificationKey = Request.QueryString["key"];
                string type = Request.QueryString["type"];
                applicanteducationdetails educationDetails = null;
                applicanthighereducation higherEducationDetails = null;
                if (type == "highschool")
                    educationDetails = db.applicanteducationdetails.Where(obj => obj.highschoolverificationkey == verificationKey && obj.ishighschooldone == 1).FirstOrDefault();
                else if (type == "secondary")
                    educationDetails = db.applicanteducationdetails.Where(obj => obj.secondaryverificationkey == verificationKey && obj.issecondarydone == 1).FirstOrDefault();
                else if (type == "diploma")
                    educationDetails = db.applicanteducationdetails.Where(obj => obj.diplomaverificationkey == verificationKey && obj.isdiplomadone == 1).FirstOrDefault();
                else if (type == "highereducation")
                    higherEducationDetails = db.applicanthighereducation.Where(obj => obj.highereducationverificationkey == verificationKey).FirstOrDefault();

                if (educationDetails != null || higherEducationDetails != null)
                {
                    if (educationDetails != null)
                    {
                        if (type == "highschool")
                        {
                            if (educationDetails.ishighschoolverified.HasValue && educationDetails.ishighschoolverified.Value)
                                alreadyVerified();
                            else
                            {
                                educationDetails.ishighschoolverified = true;
                                db.SaveChanges();
                                afterVerification();
                            }
                        }
                        else if (type == "secondary")
                        {
                            if (educationDetails.issecondaryverified.HasValue && educationDetails.issecondaryverified.Value)
                                alreadyVerified();
                            else
                            {
                                educationDetails.issecondaryverified = true;
                                db.SaveChanges();
                                afterVerification();
                            }
                        }
                        else if (type == "diploma")
                        {
                            if (educationDetails.isdiplomaverified.HasValue && educationDetails.isdiplomaverified.Value)
                                alreadyVerified();
                            else
                            {
                                educationDetails.isdiplomaverified = true;
                                db.SaveChanges();
                                afterVerification();
                            }
                        }
                    }
                    else if (higherEducationDetails != null)
                    {
                        if (higherEducationDetails.ishighereducationverified.HasValue && higherEducationDetails.ishighereducationverified.Value)
                            alreadyVerified();
                        else
                        {
                            higherEducationDetails.ishighereducationverified = true;
                            db.SaveChanges();
                            afterVerification();
                        }
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