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
    string webURL = String.Empty;
    public string logourl = string.Empty;
    public string universityGTMCode = string.Empty;
    protected string fullservicelbl = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        email = Request.QueryString["email"];
        universityID = Utility.GetUniversityId();
        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
        universityName = university.university_name;

        int isfullservice = university.full_service;
        if (isfullservice == 0)
            fullservicelbl = "GTE Online Center (GOC)";        
        else if (isfullservice == 1)
            fullservicelbl = "APPLICATION CENTER";
        else if (isfullservice == 2)
            fullservicelbl = "Assessment Center";

        logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;
        universityGTMCode = university.university_gtm_code;
    }
}