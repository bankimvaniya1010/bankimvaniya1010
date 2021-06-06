using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_viewVideo : System.Web.UI.Page
{
    public static int videoCount = 0;
    public static int otherDocCount = 0;
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    int ApplicantID = 0;
    Logger objLog = new Logger();
    string webURL = String.Empty;
    int UniversityID = -1, fullservice;
    public List<details> allDocuments = new List<details>();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        fullservice = Convert.ToInt32(Session["isfullservice"]);

        if (!IsPostBack)
        {

            allDocuments = (from vm in db.admin_videomaster
                            join uvm in db.universitywise_admin_video_mapping on vm.videoID equals uvm.videoID
                            where uvm.universityID == UniversityID
                            select new details()
                            {
                                url = webURL + "Docs/AdminHelpingVideo/" + vm.videopath,
                                type = vm.type,
                                sectionname =vm.sectioname,
                            }).ToList();
            if (fullservice == 0 && allDocuments.Count == 0) {
                allDocuments = (from vm in db.admin_videomaster                                
                                where vm.videoID == 15 || vm.videoID == 16
                                select new details()
                                {
                                    url = webURL + "Docs/AdminHelpingVideo/" + vm.videopath,
                                    type = vm.type,
                                    sectionname = vm.sectioname,
                                }).ToList();
            }
            videoCount = allDocuments.Where(c => c.type == 1).ToList().Count;
            otherDocCount = allDocuments.Where(c => c.type == 2).ToList().Count;
        }
    }

    public class details
    {
        public string url;
        public int? type;
        public string sectionname;
    }
}