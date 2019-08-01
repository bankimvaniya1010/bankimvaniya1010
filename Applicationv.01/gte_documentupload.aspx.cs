using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_documentupload : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0, universityID, formId = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    List<gte_applicantdocument> lstgte_applicantdocument = new List<gte_applicantdocument>();

    gte_applicantdocument objgte_applicantdocument = new gte_applicantdocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
            Response.Redirect(webURL + "default.aspx", true);
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            SetControlsUniversitywise();
            populatedocument();
        }
    }

    private void uploadGTEDocs(FileUpload fileUpload, string documentname)
    {
        try {
            var mode = "new";
            var documentData = (from dInfo in db.gte_applicantdocument
                                where dInfo.universityid == universityID && dInfo.applicantid == UserID && dInfo.documentname == documentname
                                select dInfo).FirstOrDefault();

            if (documentData != null)
            {
                mode = "update";
                objgte_applicantdocument = documentData;
            }

            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/GTEApplicantDocument";
            DirectoryInfo di = new DirectoryInfo(dirPath);
            if (!di.Exists)
                di.Create();

            string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileUpload.PostedFile.FileName));
            string filePath = string.Concat(dirPath, "/", fileName);
            fileUpload.PostedFile.SaveAs(filePath);

            objgte_applicantdocument.documentname = documentname;
            objgte_applicantdocument.documentpath = fileName;
            objgte_applicantdocument.applicantid = UserID;
            objgte_applicantdocument.universityid = universityID;
            if (mode == "new")
                db.gte_applicantdocument.Add(objgte_applicantdocument);
            db.SaveChanges();

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    
    protected void uploadbtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (passportidupload.HasFile)
                uploadGTEDocs(passportidupload, "Passport");
            if(acadamicdocupload.HasFile)
                uploadGTEDocs(acadamicdocupload, "Academic Documents");
            if(experiencedocumentupload.HasFile)
                uploadGTEDocs(experiencedocumentupload, "professional experience");
            if (evidenceofenglishlangupload.HasFile)
                uploadGTEDocs(evidenceofenglishlangupload, "Evidence of English Language");
            if (parentapprovalupload.HasFile)
                uploadGTEDocs(parentapprovalupload, "Parent / Guardian approval");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

  
    private void populatedocument() {
        try
        {
            var docData = (from tInfo in db.gte_applicantdocument
                           where tInfo.universityid == universityID && tInfo.applicantid == UserID
                           select tInfo).ToList();
            foreach (var item in docData) {
                if (item.documentname == "Passport")
                {

                    hidpassportDocumentPath.Value = item.documentpath;
                    passportuploadedFile.NavigateUrl = webURL + "/Docs/GTEApplicantDocument/" + item.documentpath;
                    passportuploadedFile.Text = "View File";
                }
                else if (item.documentname == "Academic Documents")
                {
                    hidacadamicDocumentPath.Value = item.documentpath;
                    acadamicuploadedFile.NavigateUrl = webURL + "/Docs/GTEApplicantDocument/" + item.documentpath;
                    acadamicuploadedFile.Text = "View File";
                }
                else if (item.documentname == "professional experience")
                {
                    hidExperiencedocPath.Value = item.documentpath;
                    experienceuploadedFile.NavigateUrl = webURL + "/Docs/GTEApplicantDocument/" + item.documentpath;
                    experienceuploadedFile.Text = "View File";
                }
                else if (item.documentname == "Evidence of English Language")
                {
                    hidevidencedocPath.Value = item.documentpath;
                    evdidenceUploadedFile.NavigateUrl = webURL + "/Docs/GTEApplicantDocument/" + item.documentpath;
                    evdidenceUploadedFile.Text = "View File";
                }
                else if (item.documentname == "Parent / Guardian approval") {
                    hidparentapprovalpath.Value = item.documentpath;
                    parentapprovaluploadedFile.NavigateUrl = webURL + "/Docs/GTEApplicantDocument/" + item.documentpath;
                    parentapprovaluploadedFile.Text = "View File";
                }
            }

        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    


    }

    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }

    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();
            }


            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "Certified Copy of Passport (Bio Pages)":
                        passportid.Attributes.Add("style", "display:block;");
                        lblpassportid.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Academic Documents – Certificates and Transcripts (certified and translated into English)":
                        acadamicdoc.Attributes.Add("style", "display:block;");
                        lblacadamicdoc.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Relevant professional experience, if any (CV, employment references or equivalent )":
                        experiencedocument.Attributes.Add("style", "display:block;");
                        lblexperiencedocument.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Evidence of English Language (IELTS, PTE, TOEFL or equivalent)":
                        evidenceofenglishlanguage.Attributes.Add("style", "display:block;");
                        lblevidenceofenglishlang.InnerHtml = setInnerHtml(fields[k]);
                       break;
                    case "Parent / Guardian approval":
                        parentapproval.Attributes.Add("style", "display:block;");
                        lblparentapproval.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}