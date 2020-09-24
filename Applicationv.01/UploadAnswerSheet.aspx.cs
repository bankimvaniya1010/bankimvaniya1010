using Aspose.Words;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadAnswerSheet : System.Web.UI.Page
{
    protected int ApplicantID = 0, universityID = 0;
    string webURL = String.Empty;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int exampaperid = 0, assignID;
    exam_assign data = new exam_assign();
    public string applicantfirstname, assessmentname, examname;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (Request.QueryString["ID"] != null)
        {
            assignID = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = assignID;
        }
        else
            assignID =Convert.ToInt32(Session["ID"]);        
        Session["ID"] = assignID;

        data = db.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        universityID = Convert.ToInt32(data.universityID);
        exampaperid = Convert.ToInt32(data.exampapersid);
        ApplicantID = Convert.ToInt32(data.applicantid);
        examname = db.exam_master.Where(x => x.exampapersid == data.exampapersid).Select(x => x.exam_name).FirstOrDefault();

        applicantfirstname = objCom.GetApplicantFirstName(ApplicantID);
        assessmentname = examname;

        docPath = docPath + "/Exammodule/AnswerSheet/" + universityID + "/" + data.applicantid + "/" + exampaperid;
        validateuser();
        HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;
        if (httpPostedFile.Count > 0)
        {
            for(int i = 0; i < httpPostedFile.Count;i++)
            {
                uploadVideo(httpPostedFile[i], httpPostedFile.Count);
            }
        }
                  
    }

    protected void uploadVideo(HttpPostedFile  httpPostedFile , int selectedfilecount)
    {
        try
        {           
            exam_answersheet objexam_answersheet = new exam_answersheet();          
            if (!Directory.Exists(docPath))
                Directory.CreateDirectory(docPath);

            string extension = Path.GetExtension(httpPostedFile.FileName);
            string filename = Guid.NewGuid() + extension;

            httpPostedFile.SaveAs(System.IO.Path.Combine(docPath, filename));
            objexam_answersheet.anshwesheetpath = filename;
            objexam_answersheet.universityID = universityID;
            objexam_answersheet.applicantid = data.applicantid;
            objexam_answersheet.exampaperid = exampaperid;
            objexam_answersheet.exam_datetime = data.exam_datetime;
            db.exam_answersheet.Add(objexam_answersheet);
            db.SaveChanges();

            //change status in exam_assign table
            var mode = "new";
            exam_assign objexam_assign = new exam_assign();
            var examassign = db.exam_assign.Where(x => x.applicantid == data.applicantid && x.universityID == universityID && x.exampapersid == exampaperid && x.exam_datetime == data.exam_datetime).FirstOrDefault();

            if (examassign != null)
            {
                mode = "update";
                objexam_assign = examassign;
            }
            objexam_assign.status = "Completed";
            if (mode == "new")
                db.exam_assign.Add(objexam_assign);
            db.SaveChanges();

            //if multiple images there then convert to pdf 
            var answersheets = db.exam_answersheet.Where(x => x.applicantid == data.applicantid && x.universityID == universityID && x.exampaperid == exampaperid && x.exam_datetime == data.exam_datetime).Select(x => x.anshwesheetpath).ToList();

            if (selectedfilecount == answersheets.Count)
            {
                Document doc = new Document();
                string[] files = new string[answersheets.Count];
                for (int i = 0; i < answersheets.Count; i++)
                {
                    files[i] = @"" + docPath + "/" + answersheets[i];
                }

                Convertfromimagetopdf(files, doc);
                string pdfname = exampaperid + "answersheets.pdf";
                doc.Save(@"" + docPath + "/" + pdfname);

                objexam_answersheet.universityID = universityID;
                objexam_answersheet.applicantid = data.applicantid;
                objexam_answersheet.exampaperid = exampaperid;
                objexam_answersheet.exam_datetime = data.exam_datetime;
                // objexam_answersheet.response_time = response_time;
                objexam_answersheet.ispdfgenrated = 1;
                objexam_answersheet.genratedanswerpdfPath = pdfname;
                db.exam_answersheet.Add(objexam_answersheet);
                db.SaveChanges();
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

    private void validateuser() {
        try{
            if (string.IsNullOrEmpty(data.status))
            {
                toshowDiv.Attributes.Add("style", "display:block");
                ifanswersubmitted.Attributes.Add("style", "display:none");
            }
            else
            {
                toshowDiv.Attributes.Add("style", "display:none");
                ifanswersubmitted.Attributes.Add("style", "display:block");
                lblmsg.InnerText = "THANK YOU "+applicantfirstname+" YOUR ANSWER SHEETS FOR "+examname+" HAVE BEEN SUBMITTED SUCCESSFULLY. ";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
  
}