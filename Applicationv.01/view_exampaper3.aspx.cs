using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aspose.Words;

public partial class view_exampaper3 : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    public static int QuestionsCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    //protected static List<faq> allfaqQuestion = new List<faq>();
    public string webURL = String.Empty;
    int UniversityID = -1;
    public int exampaperid = 0, assignID;
    DateTime assignDate;
    public int allpapersCount, allpapersheetscount, answeredpapersheetscount;
    public string exammarks;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected static List<faq> allQuestions = new List<faq>();
    List<int?> lstofIDsTobeRemoved = new List<int?>();
    List<int?> mainList = new List<int?>();
    List<int?> previousList= new List<int?>();
    List<int?> nextList = new List<int?>();
    List<details> allpapers = new List<details>();
    string btnvalue = string.Empty;
    public int is_onetimeshow = 0, examsheetid, examid;
    public DateTime examdatetime;

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
        
        var data = db.exam_assign.Where(x => x.assignid == assignID).Select(x => new { x.exampapersid, x.exam_datetime,x.status }).FirstOrDefault();
        if (data != null)
        {
            if (!string.IsNullOrEmpty(data.status))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('You have answered all question.');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
            else
            {
                exampaperid = Convert.ToInt32(data.exampapersid);
                assignDate = Convert.ToDateTime(data.exam_datetime);
                examdatetime = assignDate;
            }
        }

        var exammpaperaster = db.exampapers_master.Where(x => x.universityID == UniversityID && x.exampapersid == exampaperid).ToList();
        if (exammpaperaster != null)
        {
            allpapersheetscount = exammpaperaster.Count;
        }

        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(data.status))
                showdetails();
            else
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                if (data.status == "Completed")
                    lblCompleted.Text = "YOUR ANSWER SHEETS HAVE BEEN SUBMITTED SUCCESSFULLY. ";
                else if (data.status == "Expired")
                    lblCompleted.Text = "ASSESSMENT TIME EXHAUSTED.";
                else if (data.status == "Disqualified")
                    lblCompleted.Text = "YOUR ASSESSMENT HAS BEEN DISQUALIFY BY INVIGILATOR.";
                else if (data.status == "Not Appered")
                    lblCompleted.Text = "YOU HAVE LEFT THE ASSESSMENT.";
                if (data.status == "Disqualified")
                    lblCompleted.Text = "Your assessment has been disqualify by invigilator.";
            }
        }
            
    }

    private void showTime() {
        try {           
                
            var exammaster = db.exam_master.Where(x => x.universityID == UniversityID && x.exampapersid == exampaperid).FirstOrDefault();
            if (exammaster != null)
            {
                exammarks = exammaster.maximummarks;

                if (Session["totalResponseTime"] == null)
                    Session["totalResponseTime"] = exammaster.exam_duration;
                else
                {

                    Session["totalResponseTime"] = Session["totalResponseTime"];
                    var time = Session["totalResponseTime"];
                }
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    private void showdetails()
    {
        try
        {
            showTime();
            var answeredpapersheets = db.exam_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampaperid == exampaperid && x.exam_datetime == assignDate).ToList();
            var allpapersheets = db.exampapers_master.Where(y => y.exampapersid == exampaperid).ToList();
            if (mainList.Count == 0)
            {
                foreach (var item in allpapersheets)
                {
                    mainList.Add(item.id);
                }
            }
           
            if (answeredpapersheets.Count > 0)
            {
                completedDiv.Visible = true;
                completedDiv.Style.Remove("display");
                questions.Visible = false;
                upload.Visible = false;
                lblCompleted.Text = "You have answered all question.";
            }
            else
            {
                ViewState["MainList"] = mainList;
                ViewState["MainList2"] = mainList;
                int? bindid = 0;
                if (lstofIDsTobeRemoved.Count == 0)
                {
                    List<int?> temp_NewPreviousList = new List<int?>();
                    temp_NewPreviousList = (List<int?>)(ViewState["NewPreviousList"]);
                    if (temp_NewPreviousList == null)
                        answeredpapersheetscount = 1;
                    bindid = mainList.First();
                    previousDiv.Attributes.Add("style", "display:none");
                    
                }
                else
                {                   
                                        
                    List<int?> temp_newlist = new List<int?>();
                    temp_newlist = (List<int?>)(ViewState["NewList"]);

                    List<int?> temp_NewPreviousList = new List<int?>();
                    temp_NewPreviousList = (List<int?>)(ViewState["NewPreviousList"]);

                    answeredpapersheetscount = temp_NewPreviousList.Count + 1;
                    if (temp_NewPreviousList != null)
                    {
                        if(temp_NewPreviousList.Count == 0)
                            previousDiv.Attributes.Add("style", "display:none");
                        else
                            previousDiv.Attributes.Add("style", "display:block");
                    }

                    if (temp_newlist != null)
                    {
                        if (temp_newlist.Count != 0)
                        {

                            ViewState["MainList"] = ViewState["NewList"];
                            bindid = temp_newlist.First();
                            if (temp_newlist.Count == 1)
                                nextDiv.Attributes.Add("style", "display:none");
                            else
                                nextDiv.Attributes.Add("style", "display:block");
                        }
                        else
                            nextDiv.Attributes.Add("style", "display:block");
                    }                  
                }
                var exammaster = db.exam_master.Where(x => x.exampapersid == exampaperid).FirstOrDefault();

                bindDataList(bindid, exammaster.download_permission); 
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

    public class details
    {
        public int id { get; set; }
        public int? questionpaperID { get; set; }
        public string questionpaper { get; set; }
        public string extrasheetpath { get; set; }
        public string audiovideofilepath { get; set; }
        public string fileinstruction { get; set; }
        public int? onetimeshow { get; set; }
        public string audiovideofilename { get; set; }
        public string iffile_isaudio_orvideo { get; set; }
    }

    private void bindDataList(int? idtoshow, int? permission)
    {
        try
        {
            
            if (permission == 1)
            {
                allpapers = (from em in db.exampapers_master
                                 where em.universityID == UniversityID && em.exampapersid == exampaperid && em.id == idtoshow
                                 select new details()
                                 {
                                     id = em.id,
                                     questionpaperID = em.exampapersid,
                                     questionpaper = webURL + "/Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/" + em.exampaper_path,
                                     extrasheetpath = em.extrasheetpath == null ? null : webURL + "Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/ExtraSheet/" + em.extrasheetpath,
                                     audiovideofilepath = em.audiovideofilepath == null ? null : webURL + "Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/AnyFile/" + em.audiovideofilepath,
                                     fileinstruction = string.IsNullOrEmpty(em.fileinstruction) ? null : em.fileinstruction,
                                     onetimeshow = em.is_audiovideofile_onetimeview,
                                     audiovideofilename = em.audiovideofilepath == null ? null : em.audiovideofilepath,
                                     iffile_isaudio_orvideo = null,
                                 }).ToList();

            }
            else
            {
                allpapers = (from em in db.exampapers_master
                                 where em.universityID == UniversityID && em.exampapersid == exampaperid && em.id == idtoshow
                                 select new details()
                                 {
                                     id = em.id,
                                     questionpaperID = em.exampapersid,
                                     questionpaper = webURL + "/Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/" + em.exampaper_path + "#toolbar=0",
                                     extrasheetpath = em.extrasheetpath == null ? null : webURL + "Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/ExtraSheet/" + em.extrasheetpath,
                                     audiovideofilepath = em.audiovideofilepath == null ? null : webURL + "Docs/Exammodule/" + UniversityID + "/" + em.exampapersid + "/AnyFile/" + em.audiovideofilepath,
                                     fileinstruction = string.IsNullOrEmpty(em.fileinstruction) ? null : em.fileinstruction,
                                     onetimeshow = em.is_audiovideofile_onetimeview,
                                     audiovideofilename = em.audiovideofilepath == null ? null : em.audiovideofilepath,
                                     iffile_isaudio_orvideo = null,
                                 }).ToList();
            }
            foreach (var item in allpapers)
            {
                if (item.audiovideofilename != null)
                {
                    string s = item.audiovideofilename;
                    string[] after_split = s.Split('.');
                    string extension = after_split[after_split.Length - 1].ToLower();

                    if (extension == "mp3" || extension == "3gp" || extension == "webm")
                        item.iffile_isaudio_orvideo = "audio";
                    else
                        item.iffile_isaudio_orvideo = null;

                }

                var data_ifviewed = db.exam_applicantfileviewed_record.Where(x => x.examID == item.questionpaperID && x.examdatetime == examdatetime && x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
                if (data_ifviewed == null)
                    is_onetimeshow = Convert.ToInt32(item.onetimeshow);
                else
                {
                    is_onetimeshow = 0;
                    item.audiovideofilepath = null;
                }

                examid = Convert.ToInt32(item.questionpaperID);
                examsheetid = item.id;
            }
            questionList.DataSource = allpapers;
            questionList.DataBind();

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

            int exampaperid = 0, exampapersheetID= 0;
            
            foreach (DataListItem item in questionList.Items)
            {
                Label lblexampapersheetID = (Label)item.FindControl("lblexampapersheetID");
                exampapersheetID = Convert.ToInt32(lblexampapersheetID.Text);

                Label lblexampaperid = (Label)item.FindControl("lblquestionpaperID");
                exampaperid = Convert.ToInt32(lblexampaperid.Text);

                string response_time = hidTime.Value;

                docPath = docPath + "/Exammodule/AnswerSheet/" + UniversityID + "/" + UserID + "/" + exampaperid ;
                //FileUpload answersheetfile = (FileUpload)item.FindControl("ansersheet");
                if (ansersheet.HasFiles)
                {
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);

                    foreach (HttpPostedFile uploadedFile in ansersheet.PostedFiles)
                    {
                        string extension = Path.GetExtension(uploadedFile.FileName);
                        string filename = Guid.NewGuid() + extension;

                        uploadedFile.SaveAs(System.IO.Path.Combine(docPath, filename));
                        objexam_answersheet.anshwesheetpath = filename;
                        objexam_answersheet.universityID = UniversityID;
                        objexam_answersheet.applicantid = UserID;
                        objexam_answersheet.exampaperid = exampaperid;
                        objexam_answersheet.exam_datetime = assignDate;
                        //objexam_answersheet.exampapersheetID = exampapersheetID;
                        objexam_answersheet.response_time = response_time;
                        db.exam_answersheet.Add(objexam_answersheet);
                        db.SaveChanges();

                    }
                }
                //if multiple images there then convert to pdf 
                var answersheets = db.exam_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.exampaperid == exampaperid && x.exam_datetime == assignDate).Select(x=>x.anshwesheetpath).ToList();

                Document doc = new Document();
                string[] files = new string[answersheets.Count];
                for (int i = 0; i < answersheets.Count; i++)
                {
                    files[i] = @"" + docPath +"/"+ answersheets[i];
                }
                
                Convertfromimagetopdf(files, doc);
                string pdfname = exampaperid + "answersheets.pdf";
                doc.Save(@""+ docPath + "/"+ pdfname);
                
                objexam_answersheet.universityID = UniversityID;
                objexam_answersheet.applicantid = UserID;
                objexam_answersheet.exampaperid = exampaperid;
                objexam_answersheet.exam_datetime = assignDate;
                objexam_answersheet.response_time = response_time;
                objexam_answersheet.ispdfgenrated = 1;
                objexam_answersheet.genratedanswerpdfPath = pdfname;
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering .');window.location='" + Request.ApplicationPath + "exammodule.aspx';", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void Convertfromimagetopdf(string[] files, Document doc)
    {
        try
        {
            DocumentBuilder builder = new DocumentBuilder(doc);
            for (int i = 0; i < files.Length; i++)
            {
                System.Drawing.Image image = System.Drawing.Image.FromFile(files[i]);

                PageSetup pagesetup = builder.PageSetup;
                pagesetup.PageWidth = ConvertUtil.PixelToPoint(image.Width, image.HorizontalResolution);
                pagesetup.PageHeight = ConvertUtil.PixelToPoint(image.Width, image.VerticalResolution);


                builder.InsertImage(image, Aspose.Words.Drawing.RelativeHorizontalPosition.Page, 0, Aspose.Words.Drawing.RelativeVerticalPosition.Page, 0
                    , pagesetup.PageWidth, pagesetup.PageHeight, Aspose.Words.Drawing.WrapType.None);

                if (i < files.Length - 1)
                    builder.InsertBreak(BreakType.SectionBreakNewPage);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void disqualifiedbtn_Click(object sender, EventArgs e)
    {
        try
        {
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
    
    protected void btnnext_Click1(object sender, EventArgs e)
    {
        try
        {
            btnvalue = "NEXT";
            int exampapersheetID = 0;
            
            foreach (DataListItem item in questionList.Items)
            {
                Label lblexampapersheetID = (Label)item.FindControl("lblexampapersheetID");
                exampapersheetID = Convert.ToInt32(lblexampapersheetID.Text);
            }

            previousList.Add(exampapersheetID);

            List<int?> tem_mainlist = new List<int?>();
            tem_mainlist = (List<int?>)(ViewState["MainList"]);
            tem_mainlist.Remove(exampapersheetID);
            ViewState["NewList"] = tem_mainlist;

            List<int?> tem_mainlist2 = new List<int?>();
            tem_mainlist2 = (List<int?>)(ViewState["MainList2"]);

            List<int?> tem_Newlist = new List<int?>();
            tem_Newlist = (List<int?>)(ViewState["NewList"]);

            tem_mainlist2.RemoveAll(item => tem_Newlist.Contains(item));
            ViewState["NewPreviousList"] = tem_mainlist2;

            lstofIDsTobeRemoved.Add(exampapersheetID);
            Session["totalResponseTime"] = hidTime.Value;
            showdetails();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnprevious_Click1(object sender, EventArgs e)
    {
        try {
            btnvalue = "PREVIOUS";
            int exampapersheetID = 0;

            foreach (DataListItem item in questionList.Items)
            {
                Label lblexampapersheetID = (Label)item.FindControl("lblexampapersheetID");
                exampapersheetID = Convert.ToInt32(lblexampapersheetID.Text);
            }
             List<int?> temp_previouslist = new List<int?>();
            temp_previouslist = (List<int?>)(ViewState["NewPreviousList"]);
            var lastid = temp_previouslist.LastOrDefault();

            List<int?> temp_newlist = new List<int?>();
            temp_newlist = (List<int?>)(ViewState["NewList"]);

            temp_newlist.Insert(0, lastid);
            ViewState["NewList"] = temp_newlist;

            
            temp_previouslist.Remove(lastid);            
            ViewState["NewPreviousList"] = temp_previouslist;
            
            lstofIDsTobeRemoved.Add(exampapersheetID);
            Session["totalResponseTime"] = hidTime.Value;
            showdetails();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string isanswersubmitted(int assignID)
    {
        string response = string.Empty;
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var data = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        if (string.IsNullOrEmpty(data.status))
            response = "NOresponsesubmitted";
        else if (data.status == "Disqualified")
            response = "Disqualified";
        else
            response = "responsesubmitted";
        
        return JsonConvert.SerializeObject(response);
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Saveaudiovideoresponse(int examid, int examsheetid, int is_onetimeshow, DateTime examdatetime)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        int userID1 = Convert.ToInt32(HttpContext.Current.Session["UserID"]);

        var mode = "new";
        exam_applicantfileviewed_record objmapping = new exam_applicantfileviewed_record();
        var data = db1.exam_applicantfileviewed_record.Where(x => x.examID == examid && x.examdatetime == examdatetime && x.exampapersheetID == examsheetid && x.applicantid == userID1 && x.universityid == universityID1).FirstOrDefault();

        if (data != null)
        {
            mode = "update";
            objmapping = data;
        }
        objmapping.isviewedonce = 1;
        objmapping.exampapersheetID = examsheetid;
        objmapping.examID = examid;
        objmapping.applicantid = userID1;
        objmapping.universityid = universityID1;
        objmapping.examdatetime = examdatetime;
        if (mode == "new")
            db1.exam_applicantfileviewed_record.Add(objmapping);
        db1.SaveChanges();
        return JsonConvert.SerializeObject(is_onetimeshow);
    }
}