using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifystudent : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["referencekey"] != null)
            {
                string referenceKey = Request.QueryString["referencekey"];
                students student = db.students.Where(obj => obj.verificationkey == referenceKey && obj.isverified == false).FirstOrDefault();

                if (student != null)
                {
                    if (student.isverified)
                    {
                        afterVerfication.Visible = false;
                        verified.Visible = true;
                    }
                    else
                    {
                        student.isverified = true;
                        db.SaveChanges();
                        verified.Visible = false;
                        afterVerfication.Visible = true;
                    }

                }
                else
                    Response.Redirect("~/login.aspx");
            }
            else
                Response.Redirect("~/login.aspx");
        }
    }
}