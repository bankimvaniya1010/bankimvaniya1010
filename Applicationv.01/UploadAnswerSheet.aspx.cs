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

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl(); 
        if (Request.QueryString["ID"] != null)
            assignID = Convert.ToInt32(Request.QueryString["ID"]);
        data = db.exam_assign.Where(x => x.assignid == assignID).FirstOrDefault();
        universityID = Convert.ToInt32(data.universityID);
        exampaperid = Convert.ToInt32(data.exampapersid);
        validateuser();
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
                lblmsg.InnerText = "YOU HAVE ALREADY SUBMITED ANSWER SHEET.";
            }

            //var password = objCom.EncodePasswordToMD5(Hidpassword.Value);

            //var studentmaster = db.students.Where(x => x.studentid == data.applicantid).FirstOrDefault();
            //if (studentmaster.password == password)
            //{
            //    if (data.status == null)
            //        ifanswersubmitted.Attributes.Add("style", "display:block");
            //    else
            //        ifanswersubmitted.Attributes.Add("style", "display:none");
            //}
            //else
            //{
            //    toshowDiv.Attributes.Add("style", "display:none");
            //    ifanswersubmitted.Attributes.Add("style", "display:block");
            //    lblmsg.InnerText = "Incorrect password. Rescan code to access again.";
            //}

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        try {
            exam_answersheet objexam_answersheet = new exam_answersheet();
            docPath = docPath + "/Exammodule/AnswerSheet/" + universityID + "/" + data.applicantid + "/" + exampaperid;
            
            if (fileupload.HasFiles)
            {
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);

                foreach (HttpPostedFile uploadedFile in fileupload.PostedFiles)
                {
                    string extension = Path.GetExtension(uploadedFile.FileName);
                    string filename = Guid.NewGuid() + extension;

                    uploadedFile.SaveAs(System.IO.Path.Combine(docPath, filename));
                    objexam_answersheet.anshwesheetpath = filename;
                    objexam_answersheet.universityID = universityID;
                    objexam_answersheet.applicantid = data.applicantid;
                    objexam_answersheet.exampaperid = exampaperid;
                    objexam_answersheet.exam_datetime = data.exam_datetime;
                    //objexam_answersheet.exampapersheetID = exampapersheetID;
                    //objexam_answersheet.response_time = response_time;

                    db.exam_answersheet.Add(objexam_answersheet);
                    db.SaveChanges();

                }
            }
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
            toshowDiv.Attributes.Add("style", "display:none");
            ifanswersubmitted.Attributes.Add("style", "display:block");
            lblmsg.InnerText = "SAVED SUCCESSFULLY...!";
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
      
    }
}