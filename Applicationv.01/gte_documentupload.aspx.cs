using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class gte_documentupload : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, ApplicantID = 0, universityID, formId = 0;
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    protected List<faq> allQuestions = new List<faq>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    public dynamic fields;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string webURL = Utility.GetWebUrl();   

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
        SetControlsUniversitywise();
        CustomControls = objCom.CustomControlist(formId, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);       
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, UserID, CustomControls, mainDiv);
            populatedocument();
        }
    }
      
    private void SaveValue(int fieldId, string fileName)
    {        
        try
        {
            var mode = "new";
            var docDatas = (from gte_doc in db.gte_applicantdocument
                            where gte_doc.applicantid == UserID && gte_doc.universityid ==universityID && gte_doc.documentid == fieldId
                            select gte_doc).FirstOrDefault();
          
            if (docDatas != null) {
                mode = "update";
                objgte_applicantdocument = docDatas;
            }

            objgte_applicantdocument.documentpath = fileName;
            objgte_applicantdocument.documentid = fieldId;
            objgte_applicantdocument.universityid = universityID;
            objgte_applicantdocument.applicantid = UserID;
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
            for (int k = 0; k < fields.Count; k++)
            {
                int fieldId = fields[k].fieldid;                
                string fileOptionID = "filenonstatic" + fields[k].fieldid;
                FileUpload fileUploadDynamic = (FileUpload)mainDiv.FindControl(fileOptionID);
                if (fileUploadDynamic.HasFile) {
                    string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/GTEApplicantDocument";
                    DirectoryInfo di = new DirectoryInfo(dirPath);
                    if (!di.Exists)
                        di.Create();

                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileUploadDynamic.PostedFile.FileName));
                    string filePath = string.Concat(dirPath, "/", fileName);
                    fileUploadDynamic.PostedFile.SaveAs(filePath);
                    SaveValue(fieldId, fileName);
                }
               
            }
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(UserID, formId, CustomControls, mainDiv);
            populatedocument();
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, UserID, CustomControls, mainDiv);
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
            var docData = (from tInfo in db.gte_applicantdocument
                           where tInfo.universityid == universityID && tInfo.applicantid == UserID
                           select tInfo).ToList();

            try
            {
                for (int k = 0; k < fields.Count; k++)
                {
                    var docList = docData.Where(c => c.documentid == fields[k].fieldid).Select(c=>c.documentpath).ToList().SingleOrDefault();
                    int customValueFieldId = (int)fields[k].fieldid;
                    if (docList != null && docList.Length > 0)
                    {
                        string hyperlinkOptionID = "hyperlinknonstatic" + customValueFieldId;
                        HyperLink hyperlinkDynamic = (HyperLink)mainDiv.FindControl(hyperlinkOptionID);
                        hyperlinkDynamic.Target = "_blank";
                        hyperlinkDynamic.NavigateUrl = Utility.GetWebUrl() + "/Docs/GTEApplicantDocument/" + docList.ToString();
                        hyperlinkDynamic.Text = "View File";
                    }
                }
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }     

    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }

    private void CreateFileUploadControl()
    {
        try
        {
            for (int k = 0; k < fields.Count; k++)
            {

                System.Web.UI.HtmlControls.HtmlGenericControl lstDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                lstDiv.Attributes["class"] = "list-group-item";
                mainDiv.Controls.Add(lstDiv);

                System.Web.UI.HtmlControls.HtmlGenericControl formgroupDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                formgroupDiv.Attributes["class"] = "form-group m-0";
                formgroupDiv.Attributes["role"] = "group";
                formgroupDiv.Attributes["aria - labelledby"] = fields[k].fieldid.ToString();
                lstDiv.Controls.Add(formgroupDiv);
                System.Web.UI.HtmlControls.HtmlGenericControl divFormRow = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                divFormRow.Attributes["class"] = "form-row";
                formgroupDiv.Controls.Add(divFormRow);


                System.Web.UI.HtmlControls.HtmlGenericControl label1 = new System.Web.UI.HtmlControls.HtmlGenericControl("Label");
                label1.ID = "label" + fields[k].fieldid.ToString();
                label1.Attributes["class"] = "col-md-3 col-form-label form-label";
                label1.Attributes["for"] = fields[k].fieldid.ToString();
                label1.InnerHtml = fields[k].primaryfiledname;
                divFormRow.Controls.Add(label1);
                System.Web.UI.HtmlControls.HtmlGenericControl mycontrol = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                mycontrol.Attributes["class"] = "col-md-6";
                divFormRow.Controls.Add(mycontrol);

                FileUpload fileUploadcustombox = new FileUpload();
                fileUploadcustombox.ID = "filenonstatic" + fields[k].fieldid.ToString();

                HyperLink hyperLinkcustombox = new HyperLink();
                hyperLinkcustombox.ID = "hyperlinknonstatic" + fields[k].fieldid.ToString();

                // fileUploadcustombox.Attributes["class"] = "form-control";
                mycontrol.Controls.Add(fileUploadcustombox);
                mycontrol.Controls.Add(hyperLinkcustombox);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              fieldid = pfm.primaryfieldid,
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();

            if (fields.Count == 0 && CustomControls.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where pfm.formid == formId
                          select new
                          {
                              fieldid = pfm.primaryfieldid,
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();
            }
            CreateFileUploadControl();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}