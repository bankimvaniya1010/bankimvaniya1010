﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_viewVideo : System.Web.UI.Page
{
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    int ApplicantID = 0;
    Logger objLog = new Logger();
    string webURL = String.Empty;
    int UniversityID = -1;
    public List<details> allDocuments = new List<details>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {

            allDocuments = (from vm in db.admin_videomaster
                            join uvm in db.universitywise_admin_video_mapping on vm.videoID equals uvm.videoID
                            where uvm.universityID == UniversityID
                            select new details() {
                                url = webURL+ "Docs/AdminHelpingVideo/"+vm.videopath,
                            }).ToList();
        }
    }

    public class details
    {
        public string url;
    }
}