using System;
using System.Linq;
using System.Web;

public partial class logout : System.Web.UI.Page
{
    Logger objLog = new Logger();
    string webURL = String.Empty;
    GTEEntities db = new GTEEntities();
    int UniversityID;
    int UserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if(Session["UserID"] != null)
             UserID = Convert.ToInt32(Session["UserID"].ToString());

        Session["universityId"] = null;
        Session["universityName"] = null;
        
        Session["totalResponseTime"] = null;
        Session["totalResponseTimeQue2"] = null;

        Session["meetingTime"] = null;
        Session["currentlogintime"] = null;
        ViewState["NewList"] = null;
        ViewState["MainList"] = null;
        ViewState["NewPreviousList"] = null;
        ViewState["totalResponseTime"] = null;
        SaveStatus();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        try
        {
            Session.Clear();
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

        Response.Redirect(webURL + "login.aspx");
    }

    private void SaveStatus()
    {
        try
        {
            if (Session["assignid"] != null)
            {
                var mode = "new";
                int assignid = Convert.ToInt32(Session["assignid"]);
                exam_assign objapplicant = new exam_assign();

                var data = db.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
                if (data != null)
                {
                    mode = "update";
                    objapplicant = data;
                }
                objapplicant.logout_forexam_at = System.DateTime.Now;
                objapplicant.is_studentactiveforexam = 0;
                if (mode == "new")
                    db.exam_assign.Add(objapplicant);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}