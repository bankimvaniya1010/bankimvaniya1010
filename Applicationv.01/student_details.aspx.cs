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

public partial class student_details : System.Web.UI.Page
{
    int userID = 0, universityID;
    bool isAgent = false;
    int formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();    
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);


        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);

            objCom.BindCountries(ddlcountrycitizenship);
            objCom.BindCountries(ddldob);
            objCom.BindCountries(ddlcountryresidence);
            BindUniversity();// objCom.BindInstitution(ddlinstitution,universityID);
            populateDetails();
            SetControlsUniversitywise();
        }

    }
    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Universities = db.university_master.Where(x => x.universityid == universityID).ToList();//.Where(x=>x.universityid == universityID).ToList();
            ddlinstitution.DataSource = Universities;
            ddlinstitution.DataTextField = "university_name";
            ddlinstitution.DataValueField = "universityid";
            ddlinstitution.DataBind();
            ddlinstitution.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname + "  " : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ") * ";
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
                    case "Upload photo":
                        uploadphoto.Attributes.Add("style", "display:block;");
                        lbluploadphoto.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of citizenship":
                        countrycitizenship.Attributes.Add("style", "display:block;");
                        lblcountrycitizenship.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "Country of Birth":
                        countryofbirth.Attributes.Add("style", "display:block;");
                        lblcountryofbirth.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Country of Residency":
                        countryofresidence.Attributes.Add("style", "display:block;");
                        lblcountryofresidence.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ID Proof Type":
                        idprooftype.Attributes.Add("style", "display:block;");
                        lblidprooftype.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "ID Proof Number":
                        idprooftypenumber.Attributes.Add("style", "display:block;");
                        lblidprooftypenumber.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "Upload copy of ID Proof":
                        idproofCopy.Attributes.Add("style", "display:block;");
                        lblidproofCopy.InnerHtml = setInnerHtml(fields[k]);
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
    public void Bind_Class(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlclass.DataSource = Class;
            ddlclass.DataTextField = "description";
            ddlclass.DataValueField = "id";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    public void Bind_Group(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.group_master
                        join cwm in db.institutionwisegroupmaster on ap.id equals cwm.groupId
                        where cwm.institutionID == institutionId
                         select new
                        {
                            description = ap.description,
                            id = ap.id
                        }).ToList();
            
                ddlgroup.DataSource = group;
                ddlgroup.DataTextField = "description";
                ddlgroup.DataValueField = "id";
                ddlgroup.DataBind();
                ddlgroup.Items.Insert(0, lst);
           
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    public void Bind_Subject(int institutionId)
    {
        try
        {
            
            var group = (from ap in db.exam_subjectmaster
                         join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                         where cwm.universityID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlsubject.DataSource = group;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
           

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void BindIDProof(int countryofbirth)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var temp = (from ap in db.alternateidproofmaster
                        join cwm in db.countrywisealternateidproofmaster on ap.id equals cwm.alternateidproofID
                        where cwm.countryID == countryofbirth
                        select new
                        {
                            description = ap.description,
                            id = ap.id
                        }).Distinct().ToList();
            ddlidproof.DataSource = temp;
            ddlidproof.DataTextField = "description";
            ddlidproof.DataValueField = "id";
            ddlidproof.DataBind();
            ddlidproof.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    public void Bind_campus(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please Select", "0");
            ListItem lst1 = new ListItem("Not Applicable", "0");
            var temp = (from ap in db.universitycampus
                          where ap.universityid == institutionId
                          select new
                          {
                              description = ap.campusname,
                              id = ap.campusid
                          }).Distinct().ToList();            
            ddlcampus.DataSource = temp;
            ddlcampus.DataTextField = "description";
            ddlcampus.DataValueField = "id";
            ddlcampus.DataBind();
            if (temp.Count == 0)
                ddlcampus.Items.Insert(0, lst1);
            else
                ddlcampus.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string BindAlternateIDProof(int countryofbirth)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from ap in db1.alternateidproofmaster
                            join cwm in db1.countrywisealternateidproofmaster on ap.id equals cwm.alternateidproofID
                            where cwm.countryID == countryofbirth
                            select new
                            {
                                description = ap.description,
                                id = ap.id
                            }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string BindClass(int institutionId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from ap in db1.class_master
                    join cwm in db1.institutionwiseclassmaster on ap.id equals cwm.classId
                    where cwm.institutionID == institutionId
                    select new
                    {
                        description = ap.description,
                        id = ap.id
                    }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }
    
   [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string BindGroup(int institutionId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from ap in db1.group_master
                    join cwm in db1.institutionwisegroupmaster on ap.id equals cwm.groupId
                    where cwm.institutionID == institutionId
                    select new
                    {
                        description = ap.description,
                        id = ap.id
                    }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string BindCampus(int institutionId)
    {
        GTEEntities db1 = new GTEEntities();

        var temp = (from ap in db1.universitycampus
                    where ap.universityid == institutionId
                    select new
                    {
                        description = ap.campusname,
                        id = ap.campusid
                    }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }

    private void populateDetails() {
        try
        {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                if(profileInfo.Isdetailscompleted == true)
                    employerwebsite.Attributes.Add("style", "display:none");
                txtfirstname.Value = profileInfo.firstname;
                txtmiddlename.Value = profileInfo.middlename;
                txtlastname.Value = profileInfo.lastname;
                txtemail.Value = profileInfo.email;
                txtcontactno.Value = profileInfo.mobileno;
                if (profileInfo.dateofbirth != null)
                {
                    txtdob.Value = Convert.ToDateTime(profileInfo.dateofbirth).ToString("yyyy-MM-dd");
                }
                if (profileInfo.profilephoto != null)
                {
                    hidDocumentPath.Value = profileInfo.profilephoto;
                    uploadedFile.NavigateUrl = webURL + "/Docs/Exammodule/Studentdetails/"+universityID+"/"+userID+"/"+ profileInfo.profilephoto;
                    uploadedFile.Text = "View File";
                    fileupload.Attributes.Add("style", "display:none");
                }
                if (profileInfo.residentialcountry != null)
                {
                    ddlcountrycitizenship.ClearSelection();
                    ddlcountrycitizenship.Items.FindByValue(profileInfo.residentialcountry.ToString()).Selected = true;
                }
                if (profileInfo.countryofbirth != null)
                {
                    ddldob.ClearSelection();
                    ddldob.Items.FindByValue(profileInfo.countryofbirth.ToString()).Selected = true;
                }
                if (profileInfo.countryofbirth != null)
                {
                    ddlcountryresidence.ClearSelection();
                    ddlcountryresidence.Items.FindByValue(profileInfo.countryofbirth.ToString()).Selected = true;
                }
                if (profileInfo.idproofId != null)
                {                    
                    ddlidproof.ClearSelection();
                    BindIDProof(Convert.ToInt32(profileInfo.countryofbirth));
                    ddlidproof.Items.FindByValue(profileInfo.idproofId.ToString()).Selected = true;
                    HidIpProffID.Value = Convert.ToString(profileInfo.idproofId);
                }
                txtidproofnumber.Value = profileInfo.idproofNumber;
                if (profileInfo.copyofidproof != null)
                {
                    hidproofdocumentpath.Value = profileInfo.copyofidproof;
                    copylink.NavigateUrl = webURL + "/Docs/Exammodule/Studentdetails/" + universityID + "/" + userID + "/" + profileInfo.copyofidproof;
                    copylink.Text = "View File";
                    fileuploadcopy.Attributes.Add("style", "display:none");
                }

                if (profileInfo.exam_institutionId != null)
                {
                    ddlinstitution.ClearSelection();
                    ddlinstitution.Items.FindByValue(profileInfo.exam_institutionId.ToString()).Selected = true;
                }
                if (profileInfo.exam_institutionId != null)
                {
                    ddlcampus.ClearSelection();
                    Bind_campus(Convert.ToInt32(profileInfo.exam_institutionId));
                    if (profileInfo.campusId != null)
                    {
                        ddlcampus.Items.FindByValue(profileInfo.campusId.ToString()).Selected = true;
                        HidcampusID.Value = profileInfo.campusId.ToString();
                    }
                    else
                    {
                        ddlcampus.Items.FindByValue("0").Selected = true;
                        HidcampusID.Value = "0";
                    }
                }
                txtstudentid.Value = profileInfo.studentid;
                if (profileInfo.classId != null)
                {
                    ddlclass.ClearSelection();
                    Bind_Class(Convert.ToInt32(profileInfo.exam_institutionId));
                    ddlclass.Items.FindByValue(profileInfo.classId.ToString()).Selected = true;
                    HidclassID.Value = profileInfo.classId.ToString();
                }
                if (profileInfo.groupId != null)
                {
                    ddlgroup.ClearSelection();
                    Bind_Group(Convert.ToInt32(profileInfo.exam_institutionId));
                    ddlgroup.Items.FindByValue(profileInfo.groupId.ToString()).Selected = true;
                    HidGroupID.Value = profileInfo.groupId.ToString();
                }
                //int universityId = Convert.ToInt16(ddlUniversity.SelectedValue);
                Bind_Subject(Convert.ToInt32(profileInfo.exam_institutionId));
                var universityWise = (from usm in db.exam_applicant_subjectmapping
                                      join sm in db.exam_subjectmaster on usm.subjectid equals sm.id
                                      where usm.universityid == universityID && usm.applicantid == userID
                                      select usm).ToList();
                for (int k = 0; k < universityWise.Count; k++)
                {
                    ddlsubject.Items.FindByValue(universityWise[k].subjectid.ToString()).Selected = true;
                }
            }
            else {
                var studentdetails = db.students.Where(x => x.studentid == userID).FirstOrDefault();
                txtfirstname.Value = studentdetails.name;
                txtemail.Value = studentdetails.email;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindPreselect()
    {
        try {


        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            applicantdetails objapplicantDetail = new applicantdetails();
            if (profileInfo != null)
            {
                mode = "update";
                objapplicantDetail = profileInfo;
            }

            objapplicantDetail.firstname = txtfirstname.Value;
            objapplicantDetail.middlename = txtmiddlename.Value;
            objapplicantDetail.lastname = txtlastname.Value;
            objapplicantDetail.email = txtemail.Value;
            objapplicantDetail.mobileno = txtcontactno.Value;
            objapplicantDetail.dateofbirth = Convert.ToDateTime(txtdob.Value);
            if (fileupload.HasFile)
            {
                string path = docPath + "/Exammodule/Studentdetails/"+universityID+"/"+userID+"/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload.PostedFile.FileName));
                string filePath = string.Concat(path, fileName);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                fileupload.PostedFile.SaveAs(filePath);                
                objapplicantDetail.profilephoto = fileName;
            }
            if (ddlcountrycitizenship.SelectedValue != null)
            {
                objapplicantDetail.residentialcountry = Convert.ToInt32(ddlcountrycitizenship.SelectedValue);
            }
            if (ddldob.SelectedValue != null)
            {
                objapplicantDetail.countryofbirth = Convert.ToInt32(ddldob.SelectedValue);
            }
            if (ddlcountryresidence.SelectedValue != null )
            {
                objapplicantDetail.residentialcountry = Convert.ToInt32(ddlcountryresidence.SelectedValue);
            }
            if (!string.IsNullOrEmpty(HidIpProffID.Value))
            {
                objapplicantDetail.idproofId = Convert.ToInt32(HidIpProffID.Value);
            }
            objapplicantDetail.idproofNumber = txtidproofnumber.Value;
            if (fileuploadcopy.HasFile)
            {
                string path = docPath + "/Exammodule/Studentdetails/" + universityID + "/" + userID + "/";
                string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileuploadcopy.PostedFile.FileName));
                string filePath = string.Concat(path, fileName);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                fileuploadcopy.PostedFile.SaveAs(filePath);                
                objapplicantDetail.copyofidproof = fileName;
            }
            if (ddlinstitution.SelectedValue != null)
            {
                objapplicantDetail.exam_institutionId = Convert.ToInt32(ddlinstitution.SelectedValue);
            }
            if (ddlcampus.SelectedValue != null)
            {
               objapplicantDetail.campusId = Convert.ToInt32(HidcampusID.Value);
            }
            objapplicantDetail.studentid = txtstudentid.Value;
            if (ddlclass.SelectedValue != null)
            {
                objapplicantDetail.classId = Convert.ToInt32(HidclassID.Value);
            }
            if (ddlgroup.SelectedValue != null)
            {
                objapplicantDetail.groupId = Convert.ToInt32(HidGroupID.Value);
            }

            IEnumerable<exam_applicant_subjectmapping> list = db.exam_applicant_subjectmapping.Where(x => x.universityid == universityID && x.applicantid == userID).ToList();
            db.exam_applicant_subjectmapping.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in ddlsubject.Items)
            {
                if (li.Selected)
                {
                    int subjectid = Convert.ToInt16(li.Value);
                    exam_applicant_subjectmapping mappingObj = new exam_applicant_subjectmapping();
                    mappingObj.universityid = universityID;
                    mappingObj.applicantid = userID;
                    mappingObj.subjectid = subjectid;
                    db.exam_applicant_subjectmapping.Add(mappingObj);
                    db.SaveChanges();
                }
            }

            //if (ddlsubject.SelectedValue != null)
            //{
            //    objapplicantDetail.subjectId = Convert.ToInt32(HidSubjectID.Value);
            //}
            objapplicantDetail.applicantid = userID;
            objapplicantDetail.universityid = universityID;
            objapplicantDetail.Isdetailscompleted = true;
            if (mode == "new")
                db.applicantdetails.Add(objapplicantDetail);
            db.SaveChanges();
            if(mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record saved successfully.')", true);
            else if(mode == "update")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record updated successfully.')", true);
            populateDetails();
        }
        catch (Exception ex)
            {
            objLog.WriteLog(ex.ToString());
        }
    }
}