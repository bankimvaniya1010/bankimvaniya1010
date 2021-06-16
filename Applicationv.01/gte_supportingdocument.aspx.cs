using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_supportingdocument : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    int ApplicantID = 0, universityID, formId = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = String.Empty;
    gte_applicantdocument objgte_applicantdocument = new gte_applicantdocument();
    applicantdetails details = new applicantdetails();
    List<int> doclistID = new List<int>();

    List<int> tag3_doclistID = new List<int>();
    List<int> tag5_doclistID = new List<int>();
    List<int> tag6_doclistID = new List<int>();

    gte_clarification_applicantresponse clarification_response = new gte_clarification_applicantresponse();
    public string Country_I_am_applying_to_Study;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        ApplicantID = Convert.ToInt32(Session["UserID"].ToString());
        doclistID.Clear();
        tag3_doclistID.Clear();
        tag5_doclistID.Clear();
        tag6_doclistID.Clear();

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
                
        docPath = docPath + "/GTEApplicantDocument/" + universityID + "/" + ApplicantID+"/";
        details = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
        if (details != null && details.countryofeducationInstitution != null)
            Country_I_am_applying_to_Study = objCom.GetCountryDiscription(Convert.ToInt32(details.countryofeducationInstitution));
        setQuestion();
        HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;

        if (httpPostedFile.Count > 0)
        {

            string h = HttpContext.Current.Request["doc_id"];
            string[] docIDList = h.Split(',');
            for (int i = 0; i < httpPostedFile.Count; i++)
            {
                uploadVideo(httpPostedFile[i], httpPostedFile.Count, docIDList[i]);
            }
            
        }
        
        populatedocument();
        if (!IsPostBack)
        {            
            //if(details != null && details.countryofeducationInstitution != null)
            //    Country_I_am_applying_to_Study = objCom.GetCountryDiscription(Convert.ToInt32(details.countryofeducationInstitution));
            //setQuestion();
           // populatedocument();
           
        }
        
    }
    protected void uploadVideo(HttpPostedFile httpPostedFile, int selectedfilecount, string doc_id)
    {
        try
        {
            int docid = Convert.ToInt32(doc_id);

            var mode = "new";
            var document = (from dInfo in db.gte_applicantdocument
                            where dInfo.universityid == universityID && dInfo.applicantid == ApplicantID && dInfo.documentid == docid
                            select dInfo).FirstOrDefault();
            gte_applicantdocument objDocument = new gte_applicantdocument();
            if (document != null)
            {
                mode = "update";
                objDocument = document;
            }
            if (httpPostedFile != null)
            {
                //docPath = docPath + "/" + docid;
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(httpPostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                httpPostedFile.SaveAs(docPath + filename);          // file path where you want to upload  

                objDocument.applicantid = ApplicantID;
                objDocument.universityid = universityID;
                objDocument.documentid = docid;
                objDocument.documentpath = filename;
                //objDocument.uploadedtime = DateTime.UtcNow;
                if (mode == "new")
                    db.gte_applicantdocument.Add(objDocument);
                db.SaveChanges();
            }
            populatedocument();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void setQuestion() {
        try {
            doclistID.Add(183);
            doclistID.Add(184);
            doclistID.Add(185);
            doclistID.Add(186);

            doclistID.Add(188);
            doclistID.Add(189);
            doclistID.Add(190);

            doclistID.Add(196);
            doclistID.Add(197);
            doclistID.Add(198);

            if (details != null)
            {
                if (details.Iscurrentlyworking != null && details.Isjoboffered != null)
                {
                    if (details.Iscurrentlyworking == 1 || details.Isjoboffered == 1)
                        EmploymentandValueofthecoursetomyfuture.Attributes.Add("style", "display:block");

                    if (details.Iscurrentlyworking == 1)
                    {
                        question8.Attributes.Add("style", "display:block");
                        tag3_doclistID.Add(193);
                    }
                    else if (details.Iscurrentlyworking == 0)
                        question8.Attributes.Add("style", "display:none");

                    if (details.Isjoboffered == 1)
                    {
                        question9.Attributes.Add("style", "display:block");
                        tag3_doclistID.Add(194);
                    }
                    else if (details.Isjoboffered == 0)
                        question9.Attributes.Add("style", "display:none");
                }
                else
                    EmploymentandValueofthecoursetomyfuture.Attributes.Add("style", "display:none");


                if (details.maritalstatus != null && (details.maritalstatus == 3 || details.maritalstatus == 2))
                {
                    PotentialSituation.Attributes.Add("style", "display:block");
                   
                    if (details.maritalstatus == 3)
                    {
                        question13.Attributes.Add("style", "display:block"); tag5_doclistID.Add(200);
                    }
                    else
                        question13.Attributes.Add("style", "display:none");

                    if (details.maritalstatus == 2)
                    {
                        question14.Attributes.Add("style", "display:block"); tag5_doclistID.Add(201);
                    }
                    else
                        question14.Attributes.Add("style", "display:none");
                }
                else
                {
                    question13.Attributes.Add("style", "display:none");
                    question14.Attributes.Add("style", "display:none");
                }
                var clarification_response = db.gte_clarification_applicantresponse.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.clarification_question_id == 41).Select(x => x.applicant_response).FirstOrDefault();
                if (clarification_response != null && clarification_response != "0")
                {
                    PotentialSituation.Attributes.Add("style", "display:block");
                    question15.Attributes.Add("style", "display:block");
                    tag5_doclistID.Add(202);
                }
                else
                    question15.Attributes.Add("style", "display:none");
                var section3_question16 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 16 && x.applicant_response == false).FirstOrDefault();
                if (section3_question16 != null)
                {
                    PotentialSituation.Attributes.Add("style", "display:block");
                    question16.Attributes.Add("style", "display:block");
                    tag5_doclistID.Add(203);
                }
                else
                    question16.Attributes.Add("style", "display:none");


                var section3_question14 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 14 && x.applicant_response == true).FirstOrDefault();
                var section3_question28 = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == ApplicantID && x.university_id == universityID && x.question_id == 28 && x.applicant_response == false).FirstOrDefault();

                if (section3_question28 != null && section3_question14 != null)
                {
                    ImmigrationHistory.Attributes.Add("style", "display:block");
                    question17.Attributes.Add("style", "display:block");
                    tag6_doclistID.Add(205);
                }
                else
                    question17.Attributes.Add("style", "display:none");

                if (section3_question28 != null)
                {
                    question18.Attributes.Add("style", "display:block");
                    ImmigrationHistory.Attributes.Add("style", "display:block");
                    tag6_doclistID.Add(206);
                }
                else
                    question18.Attributes.Add("style", "display:none");
            }
            else
            {
                EmploymentandValueofthecoursetomyfuture.Attributes.Add("style", "display:none");
                PotentialSituation.Attributes.Add("style", "display:none");
                ImmigrationHistory.Attributes.Add("style", "display:none");
            }
            var IsGteCertificate = db.gte_progressbar.Where(x => x.applicantid == ApplicantID && x.universityId == universityID).Select(x=>x.is_gte_certificate_generated).FirstOrDefault();
            if (IsGteCertificate != null && IsGteCertificate == true)
            {
                visarequirements.Attributes.Add("style", "display:block"); doclistID.Add(208);
            }
            else
                visarequirements.Attributes.Add("style", "display:none");
        }
        catch (Exception ex){objLog.WriteLog(ex.ToString());}
    }
    
    private void populatedocument() {
        try {
            List<int> uploadedList = new List<int>();
            var docData = (from tInfo in db.gte_applicantdocument
                           where tInfo.universityid == universityID && tInfo.applicantid == ApplicantID
                           select tInfo).ToList();

            foreach (var item in docData)
            {
                uploadedList.Add(Convert.ToInt32(item.documentid));
                var data = (from tInfo in db.gte_applicantdocument
                            where tInfo.universityid == universityID && tInfo.applicantid == ApplicantID && tInfo.documentid == item.documentid
                            select tInfo).FirstOrDefault();
                HyperLink tb = pnl.FindControl("HyperLink_question" + item.documentid) as HyperLink;
                FileUpload file = pnl.FindControl("FileUpload_question"+item.documentid) as FileUpload;
                HiddenField Hfile = pnl.FindControl("HidDocPath_question" + item.documentid) as HiddenField;
                if (tb != null)
                {
                    file.Attributes.Add("style", "display:none;");
                    Hfile.Value = data.documentpath;                    
                    tb.NavigateUrl = webURL + "Docs/GTEApplicantDocument/" + universityID + "/" + ApplicantID + "/" + data.documentpath;
                    tb.Text = "View File";
                }
            }

            if (doclistID.Contains(183) == uploadedList.Contains(183) && doclistID.Contains(184) == uploadedList.Contains(184) && doclistID.Contains(185) == uploadedList.Contains(185)&& doclistID.Contains(186) == uploadedList.Contains(186))
                btn_identity.Visible = false;

            if (doclistID.Contains(189) == uploadedList.Contains(189) && doclistID.Contains(190) == uploadedList.Contains(190))
            {
                btnpreviousdoc.Visible = false;
                progress2Div.Visible = false;
            }

            if (doclistID.Contains(196) == uploadedList.Contains(196) && doclistID.Contains(197) == uploadedList.Contains(197) && doclistID.Contains(198) == uploadedList.Contains(198))
                btntiesresidence.Visible = false;


            if (tag3_doclistID.Count > 0)
            {
                var countTohidebtn = 0;
                foreach (var list3 in tag3_doclistID)
                {
                    if (uploadedList.Contains(list3))
                        countTohidebtn = countTohidebtn + 1;
                }
                if (tag3_doclistID.Count == countTohidebtn)
                    btnPotential.Visible = false;
            }
            if (tag3_doclistID.Contains(193) ==uploadedList.Contains(193) && tag3_doclistID.Contains(194) == uploadedList.Contains(194))
                btnEmploymentDoc.Visible = false;

            if (tag5_doclistID.Count > 0)
            {
                var countTohidebtn = 0;
                foreach (var list5 in tag5_doclistID)
                {
                    if (uploadedList.Contains(list5))
                        countTohidebtn = countTohidebtn + 1;
                }
                if (tag5_doclistID.Count == countTohidebtn)
                    btnPotential.Visible = false;
            }

            //if (tag5_doclistID.Contains(200) == uploadedList.Contains(200) && tag5_doclistID.Contains(201) == uploadedList.Contains(201) && tag5_doclistID.Contains(202) == uploadedList.Contains(202) && tag5_doclistID.Contains(203) == uploadedList.Contains(203))
            //    btnPotential.Visible = false;

            if (tag6_doclistID.Count > 0)
            {
                var countTohidebtn = 0;
                foreach (var list6 in tag6_doclistID) {
                    if (uploadedList.Contains(list6))
                        countTohidebtn = countTohidebtn + 1;
                }
                if(tag6_doclistID.Count == countTohidebtn)
                    btnImmigration.Visible = false;
            }

            //if (tag6_doclistID.Contains(205)== uploadedList.Contains(205) && tag6_doclistID.Contains(206)== uploadedList.Contains(206))
            //    btnImmigration.Visible = false;

            if (doclistID.Contains(208) == uploadedList.Contains(208))
                btnvisaDocument.Visible = false;
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}