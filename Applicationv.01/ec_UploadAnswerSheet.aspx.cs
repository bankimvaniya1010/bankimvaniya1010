using Aspose.Pdf.Facades;
using Aspose.Words;
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

public partial class ec_UploadAnswerSheet : System.Web.UI.Page
{
    protected int ApplicantID = 0, universityID = 0;
    string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int assignmentid = 0, assignID;
    ec_assignments_assign data = new ec_assignments_assign();
    public string applicantfirstname, assessmentname, examname;
    public int pagebackDone;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Request.QueryString["assignId"] != null)
        {
            assignID = Convert.ToInt32(Request.QueryString["assignId"]);
            Session["assignId"] = assignID;
        }
        else
            assignID = Convert.ToInt32(Session["assignId"]);
        Session["assignId"] = assignID;

        data = db.ec_assignments_assign.Where(x => x.assignId == assignID).FirstOrDefault();
        universityID = Convert.ToInt32(data.universityid);
        assignmentid = Convert.ToInt32(data.assignmentId);
        ApplicantID = Convert.ToInt32(data.applicantId);
        examname = db.ec_assignment_master.Where(x => x.id == data.assignmentId).Select(x => x.assignment_name).FirstOrDefault();

        applicantfirstname = objCom.GetApplicantFirstName(ApplicantID);
        assessmentname = examname;

        docPath = docPath + "/Eclass_Service/Assignments_AnswerSheet/" + universityID + "/" + ApplicantID + "/" + assignID + "/";
        validateuser(data);

        HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;
        if (httpPostedFile.Count > 0)
        {
            for (int i = 0; i < httpPostedFile.Count; i++)
            {
                uploadVideo(httpPostedFile[i], httpPostedFile.Count, HttpContext.Current.Request["doc_type"]);
            }
        }

    }

    protected void uploadVideo(HttpPostedFile httpPostedFile, int selectedfilecount, string doc_type)
    {
        try
        {
            ec_assignment_answersheet objexam_answersheet = new ec_assignment_answersheet();
            if (!Directory.Exists(docPath))
                Directory.CreateDirectory(docPath);

            string extension = Path.GetExtension(httpPostedFile.FileName);
            string filename = Guid.NewGuid() + extension;

            httpPostedFile.SaveAs(System.IO.Path.Combine(docPath, filename));
            objexam_answersheet.anshwesheetpath = filename;
            objexam_answersheet.universityID = universityID;
            objexam_answersheet.applicantid = ApplicantID;
            objexam_answersheet.assignmentid = assignmentid;
            objexam_answersheet.assignID = data.assignId;
            objexam_answersheet.uploded_at = DateTime.UtcNow;
            db.ec_assignment_answersheet.Add(objexam_answersheet);
            db.SaveChanges();

            //change status in exam_assign table
            //save to assign
            var mode = "new";
            ec_assignments_assign objexam_assign = new ec_assignments_assign();
            var examassign = db.ec_assignments_assign.Where(x => x.applicantId == ApplicantID && x.universityid == universityID && x.assignId == assignID).FirstOrDefault();

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

            //if multiple images there then convert to pdf 
            var answersheets = db.ec_assignment_answersheet.Where(x => x.applicantid == ApplicantID && x.universityID == universityID && x.assignID == assignID && x.assignmentid == assignmentid).Select(x => x.anshwesheetpath).ToList();
            Document doc = new Document();
            string[] files = new string[answersheets.Count];
            string ext = null;
            if (selectedfilecount == answersheets.Count)
            {
                foreach (var item in answersheets)
                {
                    if (item != null)
                    {
                        string s = item;
                        string[] after_split = s.Split('.');
                        string extension1 = after_split[after_split.Length - 1].ToLower();
                        ext = extension1;
                        for (int i = 0; i < answersheets.Count; i++)
                        {
                            files[i] = @"" + docPath + "/" + answersheets[i];
                        }
                    }
                }
                if (files.Count() > 0)
                {
                    //Convertfromimagetopdf(files, doc);
                    //string pdfname = data.applicantid + "_" + exampaperid + "_answersheets.pdf";
                    //doc.Save(@"" + docPath + "/" + pdfname);

                    string pdfname = data.applicantId + "_" + assignID+ "_" + Guid.NewGuid() + "_answersheets.pdf";
                    if (ext == "pdf")
                    {
                        PdfFileEditor fileEditor = new PdfFileEditor();
                        fileEditor.Concatenate(files, @"" + docPath + "/" + pdfname);
                    }
                    else
                    {
                        Convertfromimagetopdf(files, doc);
                        doc.Save(@"" + docPath + "/" + pdfname);
                    }

                    objexam_answersheet.universityID = universityID;
                    objexam_answersheet.applicantid = ApplicantID;
                    objexam_answersheet.assignmentid= assignmentid;
                    objexam_answersheet.assignID= assignID;
                    //objexam_answersheet.exam_datetime = data.exam_datetime;
                    objexam_answersheet.ispdfgenrated = 1;
                    objexam_answersheet.genratedanswerpdfPath = pdfname;
                    objexam_answersheet.anshwesheetpath = pdfname;
                    objexam_answersheet.uploded_at = DateTime.UtcNow;
                    db.ec_assignment_answersheet.Add(objexam_answersheet);
                    db.SaveChanges();
                }

            }

            toshowDiv.Attributes.Add("style", "display:none");
            ifanswersubmitted.Attributes.Add("style", "display:block");
            lblmsg.InnerText = "YOUR ANSWER SHEET SUBMITED SUCCESSFULLY...!";
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
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

    private void validateuser(ec_assignments_assign assign_data)
    {
        try
        {
            if (assign_data.status == 2)
                ifanswersubmitted.Attributes.Add("style", "display:block");
            else
                toshowDiv.Attributes.Add("style", "display:block");
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

        var data = db1.ec_assignments_assign.Where(x => x.assignId == assignID).FirstOrDefault();
        if (data != null && data.status == 2)
            response = "responsesubmitted";
        else
            response = "NOresponsesubmitted";

        return JsonConvert.SerializeObject(response);
    }
}