using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registerconfimation : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int universityID = 0;
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string email = "";
    protected string universityName = "";
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        email = Request.QueryString["email"];
        universityID = Utility.GetUniversityId();
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        universityName = university.university_name;
    }
}