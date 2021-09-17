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
using Aspose.Pdf.Facades;


public partial class view_assignment : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    public int UserID = 0;
    public static int QuestionsCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    //protected static List<faq> allfaqQuestion = new List<faq>();
    public string webURL = String.Empty;
    int UniversityID = -1;
    public int? assignmentid = 0, assignschedule_id, assignID;
    //public DateTime? assignDate;
    public int allpapersCount, allpapersheetscount, answeredpapersheetscount;
    public int? exammarks;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected static List<faq> allQuestions = new List<faq>();
    List<int?> lstofIDsTobeRemoved = new List<int?>();
    List<int?> mainList = new List<int?>();
    List<int?> previousList = new List<int?>();
    List<int?> nextList = new List<int?>();
    List<details> allpapers = new List<details>();
    string btnvalue = string.Empty;
    public int is_onetimeshow = 0, examsheetid, examid;
    public DateTime examdatetime;
    public string isaudio_orvideo;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if ((Request.QueryString["assignId"] == null) || (Request.QueryString["assignId"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            assignID = Convert.ToInt32(Request.QueryString["assignId"].ToString());

        //check if assignment is already submitted

        var assign_data = db.ec_assignments_assign.Where(x => x.assignId == assignID).FirstOrDefault();

        if (assign_data.status == 2 || assign_data.status == 3)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('You have already submitted this assignment.');window.location='" + Request.ApplicationPath + "ec_create_my_assignments.aspx';", true);
        else
        {
            assignmentid = assign_data.assignmentId;
            assignschedule_id = assign_data.assignschedule_Id;
            
            var assignment_data = db.ec_assignment_master.Where(x => x.id == assignmentid).FirstOrDefault();
            bindDataList(assignment_data.allowusertodownload);
        }

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
        public int? marks { get; set; }
        public string audiovideofilename { get; set; }
        public string iffile_isaudio_orvideo { get; set; }
    }

    private void bindDataList(int? permission)
    {
        try
        {

            if (permission == 1)
            {
                allpapers = (from em in db.ec_assignment_papers_master
                             where em.universityID == UniversityID && em.assignmentid == assignmentid
                             select new details()
                             {
                                 id = em.id,
                                 questionpaperID = em.id,
                                 questionpaper = webURL + "/Docs/Eclass_Service/Assignments/" + UniversityID + "/" + em.assignmentid + "/" + em.exampaper_path,
                                 extrasheetpath = em.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/Assignments/" + UniversityID + "/" + em.assignmentid + "/ExtraSheet/" + em.extrasheetpath,
                                 audiovideofilepath = em.audiovideofilepath == null ? null : webURL + "Docs/Eclass_Service/Assignments/" + UniversityID + "/" + em.assignmentid + "/AnyFile/" + em.audiovideofilepath,
                                 fileinstruction = string.IsNullOrEmpty(em.fileinstruction) ? null : em.fileinstruction,
                                 onetimeshow = em.is_audiovideofile_onetimeview,
                                 audiovideofilename = em.audiovideofilepath == null ? null : em.audiovideofilepath,
                                 iffile_isaudio_orvideo = null,

                             }).ToList();

            }
            else
            {
                allpapers = (from em in db.ec_assignment_papers_master
                             where em.universityID == UniversityID && em.assignmentid == assignmentid
                             select new details()
                             {
                                 id = em.id,
                                 questionpaperID = em.id,
                                 questionpaper = webURL + "/Docs/Eclass_Service/Assignments/" + UniversityID + "/" + em.assignmentid + "/" + em.exampaper_path + "#toolbar=0",
                                 extrasheetpath = em.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/Assignments/" + UniversityID + "/" + em.assignmentid + "/ExtraSheet/" + em.extrasheetpath,
                                 audiovideofilepath = em.audiovideofilepath == null ? null : webURL + "Docs/Eclass_Service/Assignments/" + UniversityID + "/" + em.assignmentid + "/AnyFile/" + em.audiovideofilepath,
                                 fileinstruction = string.IsNullOrEmpty(em.fileinstruction) ? null : em.fileinstruction,
                                 onetimeshow = em.is_audiovideofile_onetimeview,
                                 audiovideofilename = em.audiovideofilepath == null ? null : em.audiovideofilepath,
                                 iffile_isaudio_orvideo = null,
                                 marks = em.marks,
                             }).ToList();
            }
            foreach (var item in allpapers)
            {
                exammarks = item.marks;
                if (item.audiovideofilename != null)
                {
                    string s = item.audiovideofilename;
                    string[] after_split = s.Split('.');
                    string extension = after_split[after_split.Length - 1].ToLower();

                    if (extension == "mp3" || extension == "3gp" || extension == "webm")
                    {
                        item.iffile_isaudio_orvideo = "audio";
                        isaudio_orvideo = "audio";
                    }
                    else
                    {
                        item.iffile_isaudio_orvideo = null;
                        isaudio_orvideo = "video";
                    }
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
            var papersheet = (List<ec_assignment_papers_master>)Session["papersheet"];

            ec_assignment_answersheet objexam_answersheet = new ec_assignment_answersheet();

            //int exampaperid = 0, exampapersheetID = 0;

            foreach (DataListItem item in questionList.Items)
            {
                //Label lblexampapersheetID = (Label)item.FindControl("lblexampapersheetID");
                //exampapersheetID = Convert.ToInt32(lblexampapersheetID.Text);

                //Label lblexampaperid = (Label)item.FindControl("lblquestionpaperID");
                //exampaperid = Convert.ToInt32(lblexampaperid.Text);

                

                docPath = docPath + "/Eclass_Service/Assignments_AnswerSheet/" + UniversityID + "/" + UserID + "/" + assignID+"/";
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
                        objexam_answersheet.assignmentid = assignmentid;
                        objexam_answersheet.assignschedule_Id = assignschedule_id;
                        objexam_answersheet.uploded_at = DateTime.UtcNow;
                        objexam_answersheet.assignID = assignID;
                        //objexam_answersheet.assignment_start_date = assignDate;
                        db.ec_assignment_answersheet.Add(objexam_answersheet);
                        db.SaveChanges();

                    }
                }

                //if multiple images there then convert to pdf 
                var answersheets = db.ec_assignment_answersheet.Where(x => x.applicantid == UserID && x.universityID == UniversityID && x.assignID == assignID && x.assignmentid == assignmentid && x.assignschedule_Id == assignschedule_id).Select(x => x.anshwesheetpath).ToList();
                string[] files = new string[answersheets.Count];
                Document doc = new Document();

                foreach (var data in answersheets)
                {
                    if (data != null)
                    {
                        string s = data;
                        string[] after_split = s.Split('.');
                        string extension = after_split[after_split.Length - 1].ToLower();
                        for (int i = 0; i < answersheets.Count; i++)
                        {
                            files[i] = @"" + docPath + "/" + answersheets[i];
                        }
                    }
                }
                if (files.Count() > 0)
                {
                    string pdfname = UserID + "_" + assignmentid + "_" + Guid.NewGuid() + "_answersheets.pdf";
                    if (ddltype.SelectedValue == "1")
                    {
                        PdfFileEditor fileEditor = new PdfFileEditor();
                        fileEditor.Concatenate(files, @"" + docPath + "/" + pdfname);
                    }
                    else
                    {
                        Convertfromimagetopdf(files, doc);
                        doc.Save(@"" + docPath + "/" + pdfname);
                    }
                    objexam_answersheet.anshwesheetpath = pdfname;
                    objexam_answersheet.genratedanswerpdfPath = pdfname;
                    objexam_answersheet.ispdfgenrated = 1;
                    objexam_answersheet.universityID = UniversityID;
                    objexam_answersheet.applicantid = UserID;
                    objexam_answersheet.assignmentid = assignmentid;
                    objexam_answersheet.assignschedule_Id = assignschedule_id;
                    //objexam_answersheet.assignment_start_date = assignDate;
                    objexam_answersheet.assignID = assignID;
                    objexam_answersheet.uploded_at = DateTime.UtcNow;
                    db.ec_assignment_answersheet.Add(objexam_answersheet);
                    db.SaveChanges();
                }

                //save to assign
                var mode = "new";
                ec_assignments_assign objexam_assign = new ec_assignments_assign();
                var examassign = db.ec_assignments_assign.Where(x => x.applicantId == UserID && x.universityid == UniversityID && x.assignId == assignID).FirstOrDefault();

                if (examassign != null)
                {
                    mode = "update";
                    objexam_assign = examassign;
                }
                objexam_assign.status = 2;
                objexam_assign.Is_assignemtCompleted = 1;
                if (mode == "new")
                    db.ec_assignments_assign.Add(objexam_assign);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Thank you for answering .');window.location='" + Request.ApplicationPath + "ec_create_my_assignments.aspx';", true);
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
    
   
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Saveaudiovideoresponse(int examid, int examsheetid, int is_onetimeshow, int assignID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        int userID1 = Convert.ToInt32(HttpContext.Current.Session["UserID"]);

        var mode = "new";
        exam_applicantfileviewed_record objmapping = new exam_applicantfileviewed_record();
        var examdata = db1.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        DateTime examdatetime = Convert.ToDateTime(examdata.exam_datetime);
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string isanswersubmitted(int assignID)
    {
        string response = string.Empty;
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var data = db1.ec_assignments_assign.Where(x => x.assignId == assignID).FirstOrDefault();
        if (data != null && data.status == 2)
            response = "responsesubmitted";
        else
            response = "NOresponsesubmitted";

        return JsonConvert.SerializeObject(response);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string RefreshTime(int assignid)
    {
        var result = "NotExpired";
        string session_assignment_expire_Time = string.Empty;
        Logger objLog = new Logger();
        int UniversityID = Utility.GetUniversityId();
        try
        {
            GTEEntities db1 = new GTEEntities();
            HttpContext.Current.Session["assignment_end_time"] = null;

            var assignment_assign = db1.ec_assignments_assign.Where(x => x.assignId == assignid).FirstOrDefault();

            if (assignment_assign != null)
            {
                var assignment_date = db1.ec_assignments_assignschedule_date_master.Where(x => x.asmd_id == assignment_assign.assignment_date_id).FirstOrDefault();

                if (assignment_date != null) {
                    string current_UTC_Time = DateTime.UtcNow.ToString("hh:mm:ss");
                    DateTime current_UTCDatetime = Convert.ToDateTime(current_UTC_Time);

                    DateTime assignment_stop_Datetime_UTC = Convert.ToDateTime(assignment_date.asm_stop_utc_date);
                    if (assignment_stop_Datetime_UTC <= current_UTCDatetime)
                        result = "Expired";

                }
                session_assignment_expire_Time = HttpContext.Current.Session["assignment_end_time"].ToString();
            }
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
       
        return JsonConvert.SerializeObject(result);
    }
}