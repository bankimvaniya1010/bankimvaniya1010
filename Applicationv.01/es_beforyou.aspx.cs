using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class es_beforyou : System.Web.UI.Page
{
    public static int videoCount = 0;
    public static int otherDocCount = 0;
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    int ApplicantID = 0, UserID = 0;
    Logger objLog = new Logger();
    string webURL = String.Empty;
    int UniversityID = -1, fullservice;
    public string yesornolbl;
    public List<detailssuparmaster> allDocumentssuparmaster = new List<detailssuparmaster>();
    public List<detailssuparmaster> tutorial_list = new List<detailssuparmaster>();
    //public List<detailstutorial> allDocumentstutorial = new List<detailstutorial>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        fullservice = Convert.ToInt32(Session["isfullservice"]);

      if(!IsPostBack)
            populate();

    }
    public class detailssuparmaster : es_beforyou
    {
        public string videourl { get; set; }
        public string title { get; set; }
        public string type { get; set; }
        public string document { get; set; }
        public string Get_Material_link
        {
            get
            {
                if (type == "web_link")
                {
                    return videourl;
                }
                else
                {
                    return webURL + "/Docs/" + document;
                }
            }
        }
    }

    private void populate() {
        try {
            yesornolbl = "I Have";


            allDocumentssuparmaster = (from tm in db.ec_tutorialmaster
                                       where tm.serviceId == fullservice && tm.serviceId != null && tm.status == 1
                                       orderby tm.id descending
                                       select new detailssuparmaster()
                                       {
                                           type = tm.type,
                                           document = tm.documentpath,
                                           videourl = tm.videourl,
                                           title = tm.title
                                       }).Take(5).ToList();

            tutorial_list = (from tm in db.ec_tutorialmaster
                             where tm.universityid == UniversityID && tm.universityid != null && tm.status == 1
                             orderby tm.id descending
                             select new detailssuparmaster()
                             {
                                 type = tm.type,
                                 document = tm.documentpath,
                                 videourl = tm.videourl,
                                 title = tm.title,
                             }).Take(5).ToList();

            var applicnat_response = db.ec_applicant_declaration_master.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            if (applicnat_response != null)
            {
                if (applicnat_response.is_tutorial_completed == 1)
                {
                    yesornolbl = string.Empty;
                    yesornolbl = "Yes, I have";
                    btnDiv.Attributes.Add("style", "display:none;");
                }
                else
                {
                    yesornolbl = string.Empty;
                    yesornolbl = "Yes, I have not";
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_yes_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            ec_applicant_declaration_master objmapping = new ec_applicant_declaration_master();
            var data = db.ec_applicant_declaration_master.Where(x => x.universityid == UniversityID && x.applicantid == UserID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = UserID;
            objmapping.universityid = UniversityID;
            objmapping.is_tutorial_completed = 1;
            objmapping.activity_ip = Request.UserHostAddress; // IP adderess value

            if (mode == "new")
                db.ec_applicant_declaration_master.Add(objmapping);
            db.SaveChanges();
            populate();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_no_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            ec_applicant_declaration_master objmapping = new ec_applicant_declaration_master();
            var data = db.ec_applicant_declaration_master.Where(x => x.universityid == UniversityID && x.applicantid == UserID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = UserID;
            objmapping.universityid = UniversityID;
            objmapping.is_tutorial_completed = 0;
            objmapping.activity_ip = Request.UserHostAddress; // IP adderess value
            if (mode == "new")
                db.ec_applicant_declaration_master.Add(objmapping);
            db.SaveChanges();
            populate();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}