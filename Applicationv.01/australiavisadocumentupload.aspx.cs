using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class australiavisadocumentupload : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0, universityID, formId = 0;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    australiavisadetailmaster australiavisadetailmaster = new australiavisadetailmaster();
    public DateTime studentDOB;
    australiavisadocumentmaster objaustraliavisadocumentmaster = new australiavisadocumentmaster();
    protected static List<faq> allQuestions = new List<faq>();
    Common objCom = new Common();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            populatedocument();
        }

    }

    protected void uploadbtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (identitydocupload.HasFile)
                uploadAustraliavisaDocs(1,identitydocupload, ddlidentity);
            if(WelfaredocFileUpload.HasFile)
                uploadAustraliavisaDocs(2,WelfaredocFileUpload, ddlWelfaredoc);
            if(GTERdocFileUpload.HasFile)
                uploadAustraliavisaDocs(3, GTERdocFileUpload , ddlGTERdoc);
            if (employmenthistoryFileUpload.HasFile)
                uploadAustraliavisaDocs(4, employmenthistoryFileUpload , ddlemploymenthistory);
            if (relationshipEvidenceFileUpload.HasFile)
                uploadAustraliavisaDocs(5, relationshipEvidenceFileUpload, ddlrelationshipEvidence);
            if (namechangeevidenceFileUpload.HasFile)
                uploadAustraliavisaDocs(6, namechangeevidenceFileUpload, ddlnamechangeevidence);

            populatedocument();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    private void uploadAustraliavisaDocs(int documentid,FileUpload fileUpload, DropDownList dropDownList)
    {
        try
        {
            var mode = "new";
            var documentData = (from dInfo in db.australiavisadocumentmaster
                                where dInfo.universityid == universityID && dInfo.applicantid == UserID && dInfo.documentId == documentid
                                select dInfo).FirstOrDefault();

            if (documentData != null)
            {
                mode = "update";
                objaustraliavisadocumentmaster = documentData;
            }

            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/AustraliavisaDocument";
            DirectoryInfo di = new DirectoryInfo(dirPath);
            if (!di.Exists)
                di.Create();

            string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileUpload.PostedFile.FileName));
            string filePath = string.Concat(dirPath, "/", fileName);
            fileUpload.PostedFile.SaveAs(filePath);

            objaustraliavisadocumentmaster.documentId = documentid;
            objaustraliavisadocumentmaster.documenttype = dropDownList.SelectedValue;
            objaustraliavisadocumentmaster.documentpath = fileName;
            objaustraliavisadocumentmaster.applicantid = UserID;
            objaustraliavisadocumentmaster.universityid = universityID;
            if (mode == "new")
                db.australiavisadocumentmaster.Add(objaustraliavisadocumentmaster);
            db.SaveChanges();

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    private void populatedocument()
    {
        try
        {
            var docData = (from tInfo in db.australiavisadocumentmaster
                           where tInfo.universityid == universityID && tInfo.applicantid == UserID 
                           select tInfo).ToList();
            foreach (var item in docData)
            {
                if (item.documentId == 1)
                {
                    if (item.documenttype != null)
                    {
                        ddlidentity.ClearSelection();
                        ddlidentity.Items.FindByValue(item.documenttype.ToString()).Selected = true;
                    }
                    hididentitydocPath.Value = item.documentpath;
                    identitydocuploadedFile.NavigateUrl = webURL + "/Docs/AustraliavisaDocument/" + item.documentpath;
                    identitydocuploadedFile.Text = "View File";
                }
                else if (item.documentId == 2)
                {
                    if (item.documenttype != null)
                    {
                        ddlWelfaredoc.ClearSelection();
                        ddlWelfaredoc.Items.FindByValue(item.documenttype.ToString()).Selected = true;
                    }
                    HidWelfaredocPath.Value = item.documentpath;
                    Welfaredocuploadedfile.NavigateUrl = webURL + "/Docs/AustraliavisaDocument/" + item.documentpath;
                    Welfaredocuploadedfile.Text = "View File";
                }
                else if (item.documentId == 3)
                {
                    if (item.documenttype != null)
                    {
                        ddlGTERdoc.ClearSelection();
                        ddlGTERdoc.Items.FindByValue(item.documenttype.ToString()).Selected = true;
                    }
                    HidGTERdocPath.Value = item.documentpath;
                    GTERdocfileLink.NavigateUrl = webURL + "/Docs/AustraliavisaDocument/" + item.documentpath;
                    GTERdocfileLink.Text = "View File";
                }
                else if (item.documentId == 4)
                {
                    if (item.documenttype != null)
                    {
                        ddlemploymenthistory.ClearSelection();
                        ddlemploymenthistory.Items.FindByValue(item.documenttype.ToString()).Selected = true;
                    }
                    HidemploymenthistoryPath.Value = item.documentpath;
                    employmenthistoryfileLink.NavigateUrl = webURL + "/Docs/AustraliavisaDocument/" + item.documentpath;
                    employmenthistoryfileLink.Text = "View File";
                }
                else if (item.documentId == 5)
                {
                    if (item.documenttype != null)
                    {
                        ddlrelationshipEvidence.ClearSelection();
                        ddlrelationshipEvidence.Items.FindByValue(item.documenttype.ToString()).Selected = true;
                    }
                    HidrelationshipEvidencePath.Value = item.documentpath;
                    relationshipEvidencefileLink.NavigateUrl = webURL + "/Docs/AustraliavisaDocument/" + item.documentpath;
                    relationshipEvidencefileLink.Text = "View File";
                }
                else if (item.documentId == 6)
                {
                    HidnamechangeevidencePath.Value = item.documentpath;
                    namechangeevidenceLink.NavigateUrl = webURL + "/Docs/AustraliavisaDocument/" + item.documentpath;
                    namechangeevidenceLink.Text = "View File";
                }
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

}


