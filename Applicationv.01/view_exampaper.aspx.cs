using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_exampaper : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    public static int QuestionsCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    //protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
    int UniversityID = -1;
    public int exampaperid = 0, assignID;
    DateTime assignDate;
    public int allpapersCount, allpapersheetscount;
    public string exammarks;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected static List<faq> allQuestions = new List<faq>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if ((Request.QueryString["assignID"] == null) || (Request.QueryString["assignID"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignID = Convert.ToInt32(Request.QueryString["assignID"].ToString());
        //if ((Request.QueryString["exampaperid"] == null) || (Request.QueryString["exampaperid"].ToString() == ""))
        //{
        //    Response.Redirect(webURL + "default.aspx", true);
        //}
        //else
        //    exampaperid = Convert.ToInt32(Request.QueryString["exampaperid"].ToString());
        //if ((Request.QueryString["assignDate"] == null) || (Request.QueryString["assignDate"].ToString() == ""))
        //{
        //    Response.Redirect(webURL + "default.aspx", true);
        //}
        //else
        //    assignDate = Convert.ToDateTime(Request.QueryString["assignDate"]);

        var data = db.exam_assign.Where(x => x.assignid == assignID).Select(x => new { x.exampapersid, x.exam_datetime }).FirstOrDefault();
        if (data != null)
        {

            exampaperid = Convert.ToInt32(data.exampapersid);
            assignDate = Convert.ToDateTime(data.exam_datetime);
        }

        var exammaster = db.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == exampaperid).FirstOrDefault();

        exammarks = exammaster.maximummarks;
        Session["examtime"] = Convert.ToInt32(exammaster.exam_duration);
        if (Session["totalResponseTime"] == null)
            Session["totalResponseTime"] = exammaster.exam_duration;
        else {
            var examtime = db.exam_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampaperid == exampaperid).ToList();
            Session["totalResponseTime"] = examtime.Min(x=>x.response_time);
            var time = Session["totalResponseTime"];
        }

        var answeredpapersheets = db.exam_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampaperid == exampaperid && x.exam_datetime == assignDate).ToList();
        var allpapersheets = db.exampapers_master.Where(y => y.exampapersid == exampaperid).ToList();

        allpapersheetscount = allpapersheets.Count;

        if (!IsPostBack)
        {
            allQuestions = objCommon.FaqQuestionList();
            ViewState["answeredpapersheetscount"] = answeredpapersheets.Count;
            Session["allpapersheets"] = allpapersheets;

            if (answeredpapersheets.Count > 0)
                Session["totalResponseTime"] = answeredpapersheets.Min(x => x.response_time);

            if (answeredpapersheets.Count == allpapersheets.Count)
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;                
                lblCompleted.Text = "You have answered all question.";
            }
            else
                SetQuestionList(answeredpapersheets);
        }
    }

    private void SetQuestionList(List<exam_answersheet> allResponseList)
    {
        try
        {
            var papersheet = (List<exampapers_master>)Session["allpapersheets"];
            if (allResponseList.Count > 0)
            {
                foreach (var response in allResponseList)
                {
                    papersheet.RemoveAll(x => x.id == response.exampapersheetID);                    
                }
            }
            Session["papersheet"] = papersheet;            
            bindDataList();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private void bindDataList()
    {
        try
        {
            var papersheet = (List<exampapers_master>)Session["papersheet"];
            int papersheetId = papersheet.ElementAt(0).id;

            var allpapers = (from em in db.exampapers_master
                             where em.universityID == UniversityID && em.exampapersid == exampaperid && em.id == papersheetId
                             select new {
                                 id= em.id,
                                 questionpaperID = em.exampapersid,
                                 questionpaper = webURL + "/Docs/Exammodule/" + UniversityID + "/"+ em.exampapersid + "/" + em.exampaper_path,
                                 extrasheetpath = em.extrasheetpath == null ? null : webURL + "Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/ExtraSheet/" + em.extrasheetpath,
                                 audiovideofilepath = em.audiovideofilepath == null ? null : webURL + "Docs/Exammodule/" + UniversityID + "/"+ em.exampapersid + "/AnyFile/" + em.audiovideofilepath,
                                 fileinstruction = string.IsNullOrEmpty(em.fileinstruction)? null : em.fileinstruction,
                             }).ToList();

            allpapersCount = allpapers.Count;
            questionList.DataSource = allpapers.Take(1);
            questionList.DataBind();
            
            ViewState["answeredpapersheetscount"] = Convert.ToInt32(ViewState["answeredpapersheetscount"]) + 1;            
            Session["papersheet"] = papersheet;

        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var papersheet = (List<exampapers_master>)Session["papersheet"];

            exam_answersheet objexam_answersheet = new exam_answersheet();

            int exampaperid = 0;
            int exampapersheetID = 0;
            foreach (DataListItem item in questionList.Items)
            {                
                Label lblexampapersheetID = (Label)item.FindControl("lblexampapersheetID");
                exampapersheetID = Convert.ToInt32(lblexampapersheetID.Text);

                Label lblexampaperid = (Label)item.FindControl("lblquestionpaperID");
                exampaperid = Convert.ToInt32(lblexampaperid.Text);

                string response_time = hidTime.Value;

                docPath = docPath + "/Exammodule/AnswerSheet/" + UniversityID + "/"+UserID+"/" + exampaperid + "/" + exampapersheetID;
                FileUpload answersheetfile = (FileUpload)item.FindControl("ansersheet");
                if (answersheetfile.HasFiles)
                {                    
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    foreach (HttpPostedFile uploadedFile in answersheetfile.PostedFiles)
                    {
                        string extension = Path.GetExtension(uploadedFile.FileName);
                        string filename = Guid.NewGuid() + extension;

                        uploadedFile.SaveAs(System.IO.Path.Combine(docPath, filename));
                        objexam_answersheet.anshwesheetpath = filename;
                       
                    }
                }
                objexam_answersheet.universityID = UniversityID;
                objexam_answersheet.applicantid = UserID;
                objexam_answersheet.exampaperid = exampaperid;
                objexam_answersheet.exam_datetime = assignDate;
                objexam_answersheet.exampapersheetID = exampapersheetID;
                objexam_answersheet.response_time = response_time;
                
                db.exam_answersheet.Add(objexam_answersheet);
                db.SaveChanges();
                //change status in exam_assign table
                var mode = "new";
                exam_assign objexam_assign = new exam_assign();
                var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

                if (examassign != null)
                {
                    mode = "update";
                    objexam_assign = examassign;
                }
                objexam_assign.status = "Completed";
                if (mode == "new")
                    db.exam_assign.Add(objexam_assign);
                db.SaveChanges();
                Session["totalResponseTime"] = response_time;

                FileUpload extrasheetfile = (FileUpload)item.FindControl("extrasheet");
                if (extrasheetfile.HasFiles)
                {
                    docPath = docPath + "/extrasheet";
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    foreach (HttpPostedFile uploadedFile in extrasheetfile.PostedFiles)
                    {
                        string extension = Path.GetExtension(uploadedFile.FileName);
                        string filename = Guid.NewGuid() + extension;

                        uploadedFile.SaveAs(System.IO.Path.Combine(docPath, filename));
                        objexam_answersheet.extra_anshwesheetpath = filename;

                    }
                }
                db.SaveChanges();

                papersheet.RemoveAll(x => x.id == exampapersheetID);
            }
            if (papersheet.Count > 0)
            {
                Session["papersheet"] = papersheet;
                bindDataList();
            }
            else
            {
                //if all queshtionsheets are answerd
                var mode = "new";
                exam_assign objexam_assign = new exam_assign();
                var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

                if (examassign != null)
                {
                    mode = "update";
                    objexam_assign = examassign;
                }
                objexam_assign.status = "Completed";
                if (mode == "new")
                    db.exam_assign.Add(objexam_assign);
                db.SaveChanges();

                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                lblCompleted.Text = "Thank you for answering all papersheet.";
                Session["totalResponseTime"] = null;
                //Session.Remove("totalResponseTime");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering .');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
            }
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void disqualifiedbtn_Click(object sender, EventArgs e)
    {
        try {
            var mode = "new";
            exam_assign objexam_assign = new exam_assign();
            var examassign = db.exam_assign.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampapersid == exampaperid && x.exam_datetime == assignDate).FirstOrDefault();

            if (examassign != null)
            {
                mode = "update";
                objexam_assign = examassign;
            }
            objexam_assign.status = "Disqualified";
            if (mode == "new")
                db.exam_assign.Add(objexam_assign);
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Your Assessmnent have been disqualified');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Saveresponse(int assignID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var mode = "new";
        exam_assign objexam_assign = new exam_assign();
        var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();

        if (data != null)
        {
            mode = "update";
            objexam_assign = data;
        }
        if (objexam_assign.status == null)
            objexam_assign.status = "Not Appered";
        if (mode == "new")
            db1.exam_assign.Add(objexam_assign);
        db1.SaveChanges();
        return JsonConvert.SerializeObject(assignID);
    }
}