﻿using Newtonsoft.Json;
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

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);

            objCom.BindCountries(ddlcountrycitizenship);
            objCom.BindCountries(ddldob);
            objCom.BindCountries(ddlcountryresidence);
            //BindClass();
            //BindGroup();
           // BindAlternateIDProof();
        }

    }
    public void Bind_Class(int countryofbirth)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Class = (from ap in db.class_master
                         join cwm in db.countrywiseclassmaster on ap.id equals cwm.classId
                         where cwm.countryID == countryofbirth
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).Distinct().ToList();
            ddlclass.DataSource = Class;
            ddlclass.DataTextField = "studylevel";
            ddlclass.DataValueField = "studylevelid";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    public void Bind_Group(int countryofbirth)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.group_master
                        join cwm in db.countrywisegroupmaster on ap.id equals cwm.groupId
                        where cwm.countryID == countryofbirth
                        select new
                        {
                            description = ap.description,
                            id = ap.id
                        }).Distinct().ToList();
            ddlgroup.DataSource = group;
            ddlgroup.DataTextField = "studylevel";
            ddlgroup.DataValueField = "studylevelid";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);
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
            ddlgroup.DataSource = temp;
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
    public static string BindGroup(int countryofbirth)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from ap in db1.class_master
                    join cwm in db1.countrywiseclassmaster on ap.id equals cwm.classId
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
    public static string BindClass(int countryofbirth)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from ap in db1.group_master
                    join cwm in db1.countrywisegroupmaster on ap.id equals cwm.groupId
                    where cwm.countryID == countryofbirth
                    select new
                    {
                        description = ap.description,
                        id = ap.id
                    }).Distinct().ToList();
        return JsonConvert.SerializeObject(temp);
    }

    private void populateDetails() {
        try
        {
            var profileInfo = (from pInfo in db.exam_applicantdetail
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null)
            {
                txtfirstname.Value = profileInfo.firstname;
                txtmiddlename.Value = profileInfo.middlename;
                txtlastname.Value = profileInfo.lastname;
                txtemail.Value = profileInfo.email;
                txtcontactno.Value = profileInfo.contactno;
                if (profileInfo.dateofbirth != null)
                {
                    txtdob.Value = Convert.ToDateTime(profileInfo.dateofbirth).ToString("yyyy-MM-dd");
                }
                if (profileInfo.countryof_citizenship != null)
                {
                    ddlcountrycitizenship.ClearSelection();
                    ddlcountrycitizenship.Items.FindByValue(profileInfo.countryof_citizenship.ToString()).Selected = true;
                }
                if (profileInfo.countryof_birth != null)
                {
                    ddldob.ClearSelection();
                    ddldob.Items.FindByValue(profileInfo.countryof_birth.ToString()).Selected = true;
                }
                if (profileInfo.countryof_residence != null)
                {
                    ddlcountryresidence.ClearSelection();
                    ddlcountryresidence.Items.FindByValue(profileInfo.countryof_residence.ToString()).Selected = true;
                }
                if (profileInfo.idproofId != null)
                {
                    BindIDProof(Convert.ToInt32(profileInfo.countryof_birth));
                    ddlidproof.ClearSelection();
                    ddlidproof.Items.FindByValue(profileInfo.idproofId.ToString()).Selected = true;
                    HidIpProffID.Value = Convert.ToString(profileInfo.idproofId);
                }
                txtidproofnumber.Value = profileInfo.idproofNumber;

                if (profileInfo.institutionId != null)
                {
                    ddlinstitution.ClearSelection();
                    ddlinstitution.Items.FindByValue(profileInfo.institutionId.ToString()).Selected = true;
                }
                if (profileInfo.campusId != null)
                {
                    ddlcampus.ClearSelection();
                    ddlcampus.Items.FindByValue(profileInfo.campusId.ToString()).Selected = true;
                }
                txtstudentid.Value = profileInfo.studentid;
                if (profileInfo.classId != null)
                {
                    Bind_Class(Convert.ToInt32(profileInfo.countryof_birth));
                    ddlcampus.ClearSelection();
                    ddlcampus.Items.FindByValue(profileInfo.classId.ToString()).Selected = true;
                    HidclassID.Value = profileInfo.classId.ToString();
                }
                if (profileInfo.groupId != null)
                {
                    Bind_Group(Convert.ToInt32(profileInfo.countryof_birth));
                    ddlgroup.ClearSelection();
                    ddlgroup.Items.FindByValue(profileInfo.groupId.ToString()).Selected = true;
                    HidGroupID.Value = profileInfo.groupId.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var profileInfo = (from pInfo in db.exam_applicantdetail
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            exam_applicantdetail objapplicantDetail = new exam_applicantdetail();
            if (profileInfo != null)
            {
                mode = "update";
                objapplicantDetail = profileInfo;
            }

            objapplicantDetail.firstname = txtfirstname.Value;
            objapplicantDetail.middlename = txtmiddlename.Value;
            objapplicantDetail.lastname = txtlastname.Value;
            objapplicantDetail.email = txtemail.Value;
            objapplicantDetail.contactno = txtcontactno.Value;
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
                objapplicantDetail.countryof_citizenship = Convert.ToInt32(ddlcountrycitizenship.SelectedValue);
            }
            if (ddldob.SelectedValue != null)
            {
                objapplicantDetail.countryof_birth = Convert.ToInt32(ddldob.SelectedValue);
            }
            if (ddlcountryresidence.SelectedValue != null)
            {
                objapplicantDetail.countryof_residence = Convert.ToInt32(ddlcountryresidence.SelectedValue);
            }
            if (ddlidproof.SelectedValue != null)
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
                objapplicantDetail.institutionId = Convert.ToInt32(ddlinstitution.SelectedValue);
            }
            if (ddlcampus.SelectedValue != null)
            {
                objapplicantDetail.campusId = Convert.ToInt32(ddlcampus.SelectedValue);
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
            if (mode == "new")
                db.exam_applicantdetail.Add(objapplicantDetail);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}