using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class australiavisainstruction : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    int UniversityID ;
    public bool? checkTermsandCondition = false;
    australiavisadetailmaster australiavisadetailmaster = new australiavisadetailmaster();
    protected static List<faq> allQuestions = new List<faq>();
    Common objCom = new Common();
    protected void Page_Load(object sender, EventArgs e)
    {

        UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack) {
			allQuestions = objCom.FaqQuestionList();
            australiavisadetailmaster = db.australiavisadetailmaster.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (australiavisadetailmaster != null)
            {
                if (australiavisadetailmaster.termsandcondition == true)
                    Response.Redirect("australiavisadetail.aspx", true);
                else
                    Response.Redirect("australiavisainstruction.aspx", true);
        }
    }
    }

    protected void btntermcondition_Click(object sender, EventArgs e)
    {
        var mode = "update";
        australiavisadetailmaster = db.australiavisadetailmaster.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
        if (australiavisadetailmaster == null)
        {
            mode = "new";
            australiavisadetailmaster = new australiavisadetailmaster();
            australiavisadetailmaster.universityid = UniversityID;
            australiavisadetailmaster.applicantid = UserID;
        }

        australiavisadetailmaster.termsandcondition = true;
        if (mode == "new")
            db.australiavisadetailmaster.Add(australiavisadetailmaster);
        db.SaveChanges();
        Response.Redirect("australiavisadetail.aspx", true);

    }
}