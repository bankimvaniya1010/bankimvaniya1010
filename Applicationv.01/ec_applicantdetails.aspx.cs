using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_applicantdetails : System.Web.UI.Page
{
    int userID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    gte_applicantdetails objgte_applicantdetails = new gte_applicantdetails();
    applicantdetails obj_applicantdetails = new applicantdetails();
    bool isuniversityGroupHead;
    public int isunigrouped = 0;
    int formId = 0;
    List<data> counrylist = new List<data>();
    public string firstname;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
       
        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        var isGteDeclarationDoneByApplicant = (bool)Session["service5_DeclarationDoneByApplicant"];
        if (!isGteDeclarationDoneByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Please complete service agreement before proceeding.');window.location='" + Request.ApplicationPath + "ec_declareaion.aspx';", true);


        //isuniversityGroupHead = db.universitygrouping.Where(x => x.groupingheaduniversityid == universityID).ToList().Count > 0;
        //if (isuniversityGroupHead)
        //    isunigrouped = 1;
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        firstname = objCom.GetApplicantFirstName(userID).ToUpper();
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
            objCom.BindCountries(ddlcountryofdob);
            objCom.BindCountries(ddlnationality);
            objCom.BindCountries(ddlhighestqualificationcountry);
            // BindUniversityCampuses();
            BindAlternateIDProof();
            BindMaritalstatus();
            Bindworkexperienceyears();
            FillMonth(ddlhighestqualificationmonth, "Please select month of completion");
            FillYears(ddlhighestqualificationYear, 0, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString()), "Please select year of completion");

            FillMonth(ddlMonth);
            FillYears(ddlYear, 0, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString()));
            //BindMajorDiscipline(ddlhighestqualificationfield, true);
            //BindMajorDiscipline(ddlfieldofstudy, true);
           // Bindannualfee();
            BindCountrycode();
            BindstudyField(ddlhighestqualificationAchieved, true);
            // BindstudyField(ddlcourseapplied, true);
            BindTitle();
            BindDisability();
            BindDropdown();
            objCom.BindCountries(ddlpostalCountry);
            objCom.BindCountries(ddlResidentialCountry);
            BindGender();
            int? maxAge = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => x.acceptedmaxage).First();
            int? minAge = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => x.acceptedminage).First();
            if (maxAge != null)
                GlobalVariables.universityMaxAge = Convert.ToInt32(maxAge);
            if (minAge != null)
                GlobalVariables.universityMinAge = Convert.ToInt32(minAge);

            txtinstitutionname.Value = objCom.GetUniversityName(Convert.ToInt32(universityID));
            SetToolTips();
            populategteapplicantdetail();
        }
    }
    private void BindDropdown() {
        try
        {
            ListItem lst = new ListItem("Please select", "0");

            var career_major = db.ec_major_career_filed_master.OrderBy(x=>x.major_name).ToList();
            ddlcareer_major.DataSource = career_major;
            ddlcareer_major.DataTextField = "major_name";
            ddlcareer_major.DataValueField = "id";
            ddlcareer_major.DataBind();
            ddlcareer_major.Items.Insert(0, lst);

            var campus = db.universitycampus.Where(x=>x.universityid == universityID).ToList();
            ddlcampus.DataSource = campus;
            ddlcampus.DataTextField = "campusname";
            ddlcampus.DataValueField = "campusid";
            ddlcampus.DataBind();
            ddlcampus.Items.Insert(0, lst);

            var group = db.ec_grademaster.ToList();
            ddlgrade.DataSource = group;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == universityID
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlgroup.DataSource = Class;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);

            var subjet = db.subjectmaster.ToList();
            ddlsubject.DataSource = subjet;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();

            var relationship = db.realtionshipmaster.ToList();
            ddlrelationship_guardian.DataSource = relationship;
            ddlrelationship_guardian.DataTextField = "relationshipname";
            ddlrelationship_guardian.DataValueField = "relationshiptid";
            ddlrelationship_guardian.DataBind();
            ddlrelationship_guardian.Items.Insert(0, lst); 
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindAlternateIDProof()
    {
        try
        {
            int countryofuniversity = 0;
            var details = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
            if (details != null)
                countryofuniversity = Convert.ToInt32(details.countryid);
            ListItem lst = new ListItem("Please select", "0");
            var identitytype = (from ap in db.alternateidproofmaster
                                join cwm in db.countrywisealternateidproofmaster on ap.id equals cwm.alternateidproofID
                                where cwm.countryID == countryofuniversity
                                select new
                                {
                                    description = ap.description,
                                    id = ap.id
                                }).Distinct().ToList();

            ddlalternateIdentitytype.DataSource = identitytype;
            ddlalternateIdentitytype.DataTextField = "description";
            ddlalternateIdentitytype.DataValueField = "id";
            ddlalternateIdentitytype.DataBind();
            ddlalternateIdentitytype.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindDisability() {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var disability = db.disabilitymaster.ToList();
            ddlDisability.DataSource = disability;
            ddlDisability.DataTextField = "description";
            ddlDisability.DataValueField = "id";
            ddlDisability.DataBind();
            ddlDisability.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void BindTitle()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var title = db.titlemaster.ToList();
            ddlTitle.DataSource = title;
            ddlTitle.DataTextField = "titlename";
            ddlTitle.DataValueField = "titleid";
            ddlTitle.DataBind();
            ddlTitle.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetEducationCountry(int universityid)
    {
        GTEEntities db1 = new GTEEntities();
        List<data> list = new List<data>();
        List<data> list_final = new List<data>();
        List<data> temp = new List<data>();

        var campuscount = db1.universitycampus.Where(x => x.universityid == universityid).ToList();
        if (campuscount.Count > 0)
        {
            temp = (from em in db1.countriesmaster

                    join um in db1.university_master on em.id equals um.countryid into primaryData
                    from uni in primaryData.DefaultIfEmpty()

                    join uc in db1.universitycampus on universityid equals uc.universityid into uniData
                    from campus in uniData.DefaultIfEmpty()

                    where uni.universityid == universityid && uni.IsDeleted != 1
                    select new data()
                    {
                        country_name = em.country_name,
                        id = em.id,
                        campuscity = campus.cityid,
                    }).Distinct().ToList();

            foreach (var item in temp)
            {

                list.Add((from cm in db1.citymaster
                          join coun in db1.countriesmaster on cm.country_id equals coun.id into counData
                          from counmaster in counData.DefaultIfEmpty()
                          where cm.city_id == item.campuscity
                          select new data { id = counmaster.id, country_name = counmaster.country_name }).Distinct().FirstOrDefault());

                if (list.Count > 0)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        item.id = list[i].id;
                        item.country_name = list[i].country_name;
                    }
                }
            }
            var product = list;

            foreach (var data in product)
            {
                if (!list_final.Exists(x => x.id == data.id))
                {
                    list_final.Add(data);
                }
            }
        }
        else
        {
            list_final = (from em in db1.countriesmaster

                          join um in db1.university_master on em.id equals um.countryid into primaryData
                          from uni in primaryData.DefaultIfEmpty()

                          where uni.universityid == universityid
                          select new data()
                          {
                              country_name = em.country_name,
                              id = em.id,
                          }).Distinct().ToList();
        }

        return JsonConvert.SerializeObject(list_final);
    }


    public class data
    {

        public int id { get; set; }
        public string country_name { get; set; }
        public int campuscity { get; set; }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCityDropdown(int countryId, int universityid)
    {
        GTEEntities db1 = new GTEEntities();
        //List<citydata> temp = new List<citydata>();
        //var campuscount = db1.universitycampus.Where(x => x.universityid == universityid).ToList();
        //if (campuscount.Count > 0)
        //{
        //    temp = (from cm in db1.citymaster
        //            join uc in db1.universitycampus on cm.city_id equals uc.cityid into campusData
        //            from campus in campusData.DefaultIfEmpty()

        //            where cm.country_id == countryId && campus.universityid == universityid
        //            select new citydata
        //            {
        //                name = cm.name,
        //                city_id = cm.city_id,
        //            }).Distinct().ToList();

        //    var universitycity = (from cm in db1.citymaster
        //                          join um in db1.university_master on cm.city_id equals um.cityid
        //                          where cm.country_id == countryId && um.universityid == universityid
        //                          select new citydata
        //                          {
        //                              name = cm.name,
        //                              city_id = cm.city_id,

        //                          }).ToList();
        //    if (universitycity != null)
        //    {
        //        foreach (var data in universitycity)
        //        {
        //            if (!temp.Exists(x => x.city_id == data.city_id))
        //            {
        //                temp.Add(data);
        //            }
        //        }
        //    }
        //}
        //else
        //{
        //    temp = (from cm in db1.citymaster
        //            join um in db1.university_master on cm.city_id equals um.cityid

        //            where um.universityid == universityid
        //            select new citydata
        //            {
        //                name = cm.name,
        //                city_id = cm.city_id,
        //            }).Distinct().ToList();
        //}
        var citydata = (from cm in db1.citymaster
                        where cm.country_id == countryId
                        select new citydata
                        {
                            name = cm.name,
                            city_id = cm.city_id,
                        }).Distinct().ToList();


        return JsonConvert.SerializeObject(citydata);
    }
    public class citydata
    {
        public string name { get; set; }
        public int city_id { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCommenceDateDropdown(int courseid)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.course_dates.Where(x => x.courseid == courseid && x.commencementdate > DateTime.Now).OrderBy(x => x.commencementdate).ToList().Select(x => new { commencementdate = x.commencementdate.ToString("dd/MM/yyyy"), x.id });
        return JsonConvert.SerializeObject(temp);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetWorkTypeDropdown()
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Utility.GetUniversityId();
        var temp = (from sd in db1.typeofworkexperiencemaster
                    select new
                    {
                        description = sd.description,
                        id = sd.workexperiencetypesid
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    private void BindCommencementDate(int courseId, DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var dates = db.course_dates.Where(x => x.courseid == courseId).ToList().Select(x => new { commencementdate = x.commencementdate.ToString("dd/MM/yyyy"), x.id });
            ddl.DataSource = dates;
            ddl.DataTextField = "commencementdate";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindGender()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var dates = db.gender_master.ToList();
            ddlgenderList.DataSource = dates;
            ddlgenderList.DataTextField = "description";
            ddlgenderList.DataValueField = "id";
            ddlgenderList.DataBind();
            ddlgenderList.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void BindCountrycode()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var code = db.countrycode_master.ToList();

            //foreach (var item in code)
            //{
            //    String CurrentString = item.description;

            //    //String s1 = CurrentString.Substring(CurrentString.IndexOf("(") + 1);
            //    //var countryname = CurrentString.Split('(')[0].Trim();
            //    //item.description = "+" + item.code + " " + countryname;

            //}

            ddlcountrycode.DataSource = code;
            ddlcountrycode.DataTextField = "description";
            ddlcountrycode.DataValueField = "id";
            ddlcountrycode.DataBind();
            ddlcountrycode.Items.Insert(0, lst);

            ddlguardian_countrycode.DataSource = code;
            ddlguardian_countrycode.DataTextField = "description";
            ddlguardian_countrycode.DataValueField = "id";
            ddlguardian_countrycode.DataBind();
            ddlguardian_countrycode.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    //private void BindUniversityCampuses()
    //{
    //    try
    //    {
    //        ListItem lst = new ListItem("Please select", "0");
    //        var status = db.universitycampus.Where(x => x.universityid == universityID).ToList();
    //        ddlUniversityCampus.DataSource = status;
    //        ddlUniversityCampus.DataTextField = "campusname";
    //        ddlUniversityCampus.DataValueField = "campusid";
    //        ddlUniversityCampus.DataBind();
    //        ddlUniversityCampus.Items.Insert(0, lst);
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string GetCourseDropdown(int coursetypeid , int selectedMajorid, int campusId)
    //{
    //    GTEEntities db1 = new GTEEntities();
    //    var universityID1 = Utility.GetUniversityId();
    //    var temp = (from cm in db1.coursemaster
    //                join mapping in db1.course_campus_mapping on cm.courseid equals mapping.courseid
    //                where cm.universityid == universityID1  && cm.majordisciplineId == selectedMajorid && cm.levelofstudyId == coursetypeid && mapping.campusid == campusId && cm.isactive == true
    //                select new
    //                {
    //                    coursename = cm.coursename,
    //                    courseid = cm.courseid
    //                }).ToList();
    //    return JsonConvert.SerializeObject(temp);
    //}

    //private void BindCourses(int coursetypeid, int selectedMajorid, int campusId)
    //{
    //    try
    //    {
    //        ListItem lst = new ListItem("Please select", "0");
    //        var courses = (from cm in db.coursemaster
    //                       join mapping in db.course_campus_mapping on cm.courseid equals mapping.courseid
    //                       where cm.universityid == universityID && cm.majordisciplineId == selectedMajorid && cm.levelofstudyId == coursetypeid && mapping.campusid == campusId && cm.isactive == true
    //                       select new
    //                       {
    //                           coursename = cm.coursename,
    //                           courseid = cm.courseid
    //                       }).ToList();
    //        ddlnameofcourse.DataSource = courses;
    //        ddlnameofcourse.DataTextField = "coursename";
    //        ddlnameofcourse.DataValueField = "courseid";
    //        ddlnameofcourse.DataBind();
    //        ddlnameofcourse.Items.Insert(0, lst);


    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    protected void btngteapplicantdetail_Click(object sender, EventArgs e)
    {
        try
        {
            var mode1 = "new";
            var applicantInfo = (from aInfo in db.applicantdetails
                                 where aInfo.applicantid == userID && aInfo.universityid == universityID
                                 select aInfo).FirstOrDefault();
            applicantdetails objapplicantdetails = new applicantdetails();
            if (applicantInfo != null)
            {
                mode1 = "update";
                objapplicantdetails = applicantInfo;
            }
            if (ddlTitle.SelectedValue != null)
                objapplicantdetails.title = Convert.ToInt32(ddlTitle.SelectedValue);
            objapplicantdetails.firstname = txtFirstName.Value;
            objapplicantdetails.middlename = txtMiddleName.Value;
            objapplicantdetails.lastname = txtLastName.Value;

            string dateofBirth = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + hidDOBDate.Value;
            objapplicantdetails.dateofbirth = Convert.ToDateTime(dateofBirth);

            objapplicantdetails.countryof_citizenship = Convert.ToInt32(ddlnationality.SelectedValue);
            objapplicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);
            objapplicantdetails.maritalstatus = Convert.ToInt32(ddlmaritalstatus.SelectedValue);
            objapplicantdetails.gender = Convert.ToInt32(ddlgenderList.SelectedValue);

            if (rblDisabilityYes.Checked)
                objapplicantdetails.isdisable = 1;
            else if (rblDisabilityNo.Checked)
                objapplicantdetails.isdisable = 2;
            if (ddlDisability.SelectedValue != null)
                objapplicantdetails.disabilitydescription = ddlDisability.SelectedValue;

            if (rblwhatsappYes.Checked)
            {
                applicantInfo.havewhatsup = 1;
            }
            else if (rblwhatsappNo.Checked == true)
            { applicantInfo.havewhatsup = 2; }

            if (rblWhatsupsameYes.Checked)
            {
                applicantInfo.isdifferentwhatsapp = 1;
            }
            else if (rblWhatsupsameNo.Checked)
            {
                applicantInfo.isdifferentwhatsapp = 2;
                applicantInfo.whatsappno = txtWhatsappNo.Text;
            }
            objapplicantdetails.postaladdrees1 = txtAddressLine1.Value;
            objapplicantdetails.postaladdrees2 = txtAddressLine2.Value;
            objapplicantdetails.postaladdrees3 = txtAddressLine3.Value;
            objapplicantdetails.postalcity = txtCity.Value;
            objapplicantdetails.postalstate = txtState.Value;
            objapplicantdetails.postalpostcode = txtPostal.Value;
            objapplicantdetails.postalcountry = Convert.ToInt32(ddlpostalCountry.SelectedValue);

            if (rblAddressYes.Checked == true)
            {
                objapplicantdetails.issameaspostal = 1;
                objapplicantdetails.residentialaddress1 = txtAddressLine1.Value;
                objapplicantdetails.residentialaddress2 = txtAddressLine2.Value;
                objapplicantdetails.residentialaddress3 = txtAddressLine3.Value;
                objapplicantdetails.residentialcity = txtCity.Value;
                objapplicantdetails.residentialstate = txtState.Value;
                objapplicantdetails.residentailpostcode = txtPostal.Value;
                objapplicantdetails.residentialcountry = Convert.ToInt32(ddlpostalCountry.SelectedValue);
            }
            else if (rblAddressNo.Checked == true)
            {
                objapplicantdetails.issameaspostal = 2;
                objapplicantdetails.residentialaddress1 = txtResidentialAddress1.Value;
                objapplicantdetails.residentialaddress2 = txtResidentialAddress2.Value;
                objapplicantdetails.residentialaddress3 = txtResidentialAddress3.Value;
                objapplicantdetails.residentialstate = txtResidentialCity.Value;
                objapplicantdetails.residentialstate = txtResidentialState.Value;
                objapplicantdetails.residentailpostcode = txtResidentialpostal.Value;
                objapplicantdetails.residentialcountry = Convert.ToInt32(ddlResidentialCountry.SelectedValue);
            }

            applicantInfo.guardian_name = txtguardianName.Value;
            applicantInfo.guardian_email = txtguardian_email.Value;
            applicantInfo.guardian_mobileno = txtguardian_mobileno.Value;
            if (applicantInfo.guardian_relationship != null) {
                ddlrelationship_guardian.ClearSelection();
                ddlrelationship_guardian.Items.FindByValue(applicantInfo.guardian_relationship.ToString());
            }
            if (applicantInfo.guardian_countrycode != null)
            {
                ddlguardian_countrycode.ClearSelection();
                ddlguardian_countrycode.Items.FindByValue(applicantInfo.guardian_countrycode.ToString());
            }
            objapplicantdetails.email = txtEmail.Value;
            objapplicantdetails.countrycode = ddlcountrycode.SelectedValue;
            objapplicantdetails.mobileno = "+" + objCom.GetCode(Convert.ToInt32(ddlcountrycode.SelectedValue)) + " " + txtMobile.Value;
            objapplicantdetails.nationality = Convert.ToInt32(ddlnationality.SelectedValue);

            if (ddlboradfield.SelectedValue != "")
                objapplicantdetails.broadFieldID = Convert.ToInt32(hidbroadfieldId.Value);
            if (ddlnarrowfield.SelectedValue != "")
                objapplicantdetails.narrowFieldID = Convert.ToInt32(hidnarrowfieldId.Value);
            if (ddldetailedfield.SelectedValue != "")
                objapplicantdetails.detailedFieldID = Convert.ToInt32(hiddetailedfield.Value);
            
            objapplicantdetails.nationality = Convert.ToInt32(ddlnationality.SelectedValue); // country of citizenship
            objapplicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);
            objapplicantdetails.maritalstatus = Convert.ToInt32(ddlmaritalstatus.SelectedValue);

            if (ddlcountryofdob.SelectedValue != "")
                objapplicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);

            if (ddlhighestqualificationAchieved.SelectedValue != "")
                objapplicantdetails.highestqualifiactionachieved = ddlhighestqualificationAchieved.SelectedValue;

            if ((ddlhighestqualificationmonth.SelectedValue != "") && (ddlhighestqualificationYear.SelectedValue != ""))
                objapplicantdetails.highestqualificationdate = ddlhighestqualificationmonth.SelectedValue + "-" + ddlhighestqualificationYear.SelectedValue;
            if (ddlhighestqualificationcountry.SelectedValue != "")
                objapplicantdetails.highestqualificationcountry = Convert.ToInt32(ddlhighestqualificationcountry.SelectedValue);

            if (ddlworkexperience.SelectedValue != null)
                objapplicantdetails.workexperience = Convert.ToInt32(ddlworkexperience.SelectedValue);

            if (ddlcurrentlyworking.SelectedValue != null)
                objapplicantdetails.Iscurrentlyworking = Convert.ToInt32(ddlcurrentlyworking.SelectedValue);
         
            if(ddlemployeesby.SelectedValue != null)
                objapplicantdetails.Is_employeesby = Convert.ToInt32(ddlemployeesby.SelectedValue);

            if (ddlcareer_major.SelectedValue != null)
                objapplicantdetails.career_major = Convert.ToInt32(ddlcareer_major.SelectedValue);
            if (hidcareer_minor.Value != null && hidcareer_minor.Value != "")
                objapplicantdetails.career_minor = Convert.ToInt32(hidcareer_minor.Value);

            if (hidcareer_broad.Value != null && hidcareer_broad.Value != "")
                objapplicantdetails.career_broad = Convert.ToInt32(hidcareer_broad.Value);

            if (hidcareer_detailed.Value != null && hidcareer_detailed.Value != "")
                objapplicantdetails.career_detailed = Convert.ToInt32(hidcareer_detailed.Value);

            //profile pic
            if (fileUpload.HasFile)
            {
                string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                docPath = docPath + "/Eclass_Service/"+universityID +"/"+userID+"/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(fileUpload.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;

                if (File.Exists(docPath + filename))
                {
                    File.Delete(docPath + filename);
                }

                fileUpload.PostedFile.SaveAs(docPath + filename);
                objapplicantdetails.profilephoto = filename;

            }
            if (ddlalternateIdentitytype.SelectedValue != "")
            {
                objapplicantdetails.alternativeIdentityproofId = Convert.ToInt32(ddlalternateIdentitytype.SelectedValue);
            }
            objapplicantdetails.alternativeIdentityproofno = txtalternateIdentityNo.Value;
            if (FileUpload_passport.HasFile)
            {
                string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                docPath = docPath + "/Eclass_Service/" + universityID + "/" + userID+"/IdproofCopy/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(FileUpload_passport.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;

                if (File.Exists(docPath + filename))
                {
                    File.Delete(docPath + filename);
                }

                FileUpload_passport.PostedFile.SaveAs(docPath + filename);

                objapplicantdetails.passportcopy = filename;
            }
            objapplicantdetails.facebookprofle = txtFacebook.Value;
            if (ChkFacebook.Checked)
            {
                objapplicantdetails.havefacebookaccount = true;
                objapplicantdetails.facebookprofle = "";
            }

            else
                objapplicantdetails.havefacebookaccount = false;

            objapplicantdetails.linkedprofile = txtLinkedin.Value;
            if (chkLinkeIn.Checked)
            {
                objapplicantdetails.havelinkedinaccount = true;
                objapplicantdetails.linkedprofile = "";
            }

            else
                objapplicantdetails.havelinkedinaccount = false;

            objapplicantdetails.twiterprofile = txtTwitter.Value;
            if (chkTwitter.Checked)
            {
                objapplicantdetails.havetwitteraccount = true;
                objapplicantdetails.twiterprofile = "";
            }

            else
                objapplicantdetails.havetwitteraccount = false;

            objapplicantdetails.socialprofilesavetime = DateTime.Now;
            objapplicantdetails.issocialprofilepresent = true;

            objapplicantdetails.guardian_name = txtguardianName.Value;
            objapplicantdetails.guardian_email = txtguardian_email.Value;
            objapplicantdetails.guardian_mobileno = txtguardian_mobileno.Value;
            if(ddlguardian_countrycode.SelectedValue != null)
                objapplicantdetails.guardian_countrycode = Convert.ToInt32(ddlguardian_countrycode.SelectedValue);
            if (ddlrelationship_guardian.SelectedValue != null)
                objapplicantdetails.guardian_relationship = Convert.ToInt32(ddlrelationship_guardian.SelectedValue);
            //reference
            if (ddlcampus.SelectedValue != null)
                objapplicantdetails.campusId = Convert.ToInt32(ddlcampus.SelectedValue);         
            if (ddlgroup.SelectedValue != null)
                objapplicantdetails.groupId= Convert.ToInt32(ddlgroup.SelectedValue);
            if (ddlgrade.SelectedValue != null)
                objapplicantdetails.gradeid= Convert.ToInt32(ddlgrade.SelectedValue);
            
            //int universityId = Convert.ToInt16(ddlUniversity.SelectedValue);

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


            objapplicantdetails.applicantid = userID;
            objapplicantdetails.universityid = universityID;
            
            objapplicantdetails.Isdetailscompleted = true;
            if (mode1 == "new")
                db.applicantdetails.Add(obj_applicantdetails);

            db.SaveChanges();

            Session["ProfileDetailsCompletedByApplicant"] = true;

            //SavetoAWS(fileUpload);

            Response.Redirect(webURL + "ec_book_class.aspx", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void populategteapplicantdetail()
    {
        try
        {

            var applicantInfo = (from pInfo in db.applicantdetails
                                 where pInfo.applicantid == userID && pInfo.universityid == universityID
                                 select pInfo).FirstOrDefault();
            if (applicantInfo != null)
            {
                if (applicantInfo.title!= null)
                {
                    ddlTitle.ClearSelection();
                    ddlTitle.Items.FindByValue(applicantInfo.title.ToString()).Selected = true;
                }
                txtFirstName.Value = applicantInfo.firstname;
                txtLastName.Value = applicantInfo.lastname;
                txtMiddleName.Value = applicantInfo.middlename;
                if (applicantInfo.gender != null)
                {
                    ddlgenderList.ClearSelection();
                    ddlgenderList.Items.FindByValue(applicantInfo.gender.ToString()).Selected = true;
                }
                if (applicantInfo.isdisable == 1)
                    rblDisabilityYes.Checked = true;
                else if (applicantInfo.isdisable == 2)
                    rblDisabilityNo.Checked = true;
                if (applicantInfo.disabilitydescription != null)
                {
                    ddlDisability.ClearSelection();
                    ddlDisability.Items.FindByValue(applicantInfo.disabilitydescription.ToString()).Selected = true;
                }

                if (applicantInfo.havewhatsup == 1)
                {
                    rblwhatsappYes.Checked = true;
                }
                else if (applicantInfo.havewhatsup == 2)
                {
                    rblwhatsappNo.Checked = true;
                }

                if (applicantInfo.isdifferentwhatsapp == 1)
                {
                    rblWhatsupsameYes.Checked = true;
                }
                else if (applicantInfo.isdifferentwhatsapp == 2)
                {
                    rblWhatsupsameNo.Checked = true;
                    txtWhatsappNo.Text = applicantInfo.whatsappno;
                }

                txtAddressLine1.Value = applicantInfo.postaladdrees1;
                txtAddressLine2.Value = applicantInfo.postaladdrees2;
                txtAddressLine3.Value = applicantInfo.postaladdrees3;
                txtCity.Value = applicantInfo.postalcity;
                txtState.Value = applicantInfo.postalstate;
                txtPostal.Value = applicantInfo.postalpostcode;

                txtguardianName.Value = applicantInfo.guardian_name;
                txtguardian_email.Value = applicantInfo.guardian_email;
                txtguardian_mobileno.Value = applicantInfo.guardian_mobileno;
                if (applicantInfo.guardian_relationship != null)
                {
                    ddlrelationship_guardian.ClearSelection();
                    ddlrelationship_guardian.Items.FindByValue(applicantInfo.guardian_relationship.ToString()).Selected=true;
                }
                if (applicantInfo.guardian_countrycode != null)
                {
                    ddlguardian_countrycode.ClearSelection();
                    ddlguardian_countrycode.Items.FindByValue(applicantInfo.guardian_countrycode.ToString()).Selected = true;
                }
               
                if (applicantInfo.postalcountry != null)
                {
                    ddlpostalCountry.ClearSelection();
                    ddlpostalCountry.Items.FindByValue(applicantInfo.postalcountry.ToString()).Selected = true;
                }
                if (applicantInfo.profilephoto != null)
                {
                    //FileUpload_passport.Visible = false;
                    hidDocumentPath.Value = applicantInfo.profilephoto;
                    uploadedFile.NavigateUrl = webURL + "/Docs/Eclass_Service/" + applicantInfo.universityid + "/" + applicantInfo.applicantid +"/"+ applicantInfo.profilephoto;
                    uploadedFile.Text = "View File";
                    fileUpload.Attributes.Add("style", "display:none");
                    lbl1.Attributes.Add("style", "display:none");
                }
                if (applicantInfo.passportcopy != null)
                {
                    //FileUpload_passport.Visible = false;
                    hidPassportDocPath.Value = applicantInfo.passportcopy;
                    HyperLink1.NavigateUrl = webURL + "/Docs/Eclass_Service/" + applicantInfo.universityid +"/"+ applicantInfo.applicantid + "/IdproofCopy/" +applicantInfo.passportcopy;
                    HyperLink1.Text = "View File";
                    FileUpload_passport.Attributes.Add("style", "display:none");
                    lbl2.Attributes.Add("style", "display:none");
                }
                if (applicantInfo.issameaspostal == 1)
                    rblAddressYes.Checked = true;
                else if (applicantInfo.issameaspostal == 2)
                {
                    rblAddressNo.Checked = true;

                    txtResidentialAddress1.Value = applicantInfo.residentialaddress1;
                    txtResidentialAddress2.Value = applicantInfo.residentialaddress2;
                    txtResidentialAddress3.Value = applicantInfo.residentialaddress3;
                    txtResidentialCity.Value = applicantInfo.residentialcity;
                    txtResidentialState.Value = applicantInfo.residentialstate;
                    txtResidentialpostal.Value = applicantInfo.residentailpostcode;
                    if (applicantInfo.residentialcountry != null)
                    {
                        ddlResidentialCountry.ClearSelection();
                        ddlResidentialCountry.Items.FindByValue(applicantInfo.residentialcountry.ToString()).Selected = true;
                    }

                }

                txtEmail.Value = applicantInfo.email;
                txtEmail.Disabled = true;
                txtMobile.Value = applicantInfo.mobileno;
                if (applicantInfo.countrycode != null)
                {
                    countrycodeDiv.Attributes.Add("style", "display:none");
                    ddlcountrycode.ClearSelection();
                    ddlcountrycode.Items.FindByValue(applicantInfo.countrycode.ToString()).Selected = true;
                }
                if (applicantInfo.highestqualifiactionachieved != null)
                {
                    ddlhighestqualificationAchieved.ClearSelection();
                    ddlhighestqualificationAchieved.Items.FindByValue(applicantInfo.highestqualifiactionachieved.ToString()).Selected = true;
                    ddlboradfield.Items.Clear();
                    BindBroadField(Convert.ToInt32(applicantInfo.highestqualifiactionachieved), ddlboradfield);
                }

                if (applicantInfo.broadFieldID != null)
                {
                    ddlboradfield.ClearSelection();
                    ddlboradfield.Items.FindByValue(applicantInfo.broadFieldID.ToString()).Selected = true;
                    hidbroadfieldId.Value = applicantInfo.broadFieldID.ToString();
                }
                if (applicantInfo.narrowFieldID != null)
                {
                    BindNarrowField(Convert.ToInt32(applicantInfo.broadFieldID), ddlnarrowfield);
                    ddlnarrowfield.ClearSelection();
                    ddlnarrowfield.Items.FindByValue(applicantInfo.narrowFieldID.ToString()).Selected = true;
                    hidnarrowfieldId.Value = applicantInfo.narrowFieldID.ToString();
                }
                if (applicantInfo.detailedFieldID != null)
                {
                    BindDetailedField(Convert.ToInt32(applicantInfo.narrowFieldID), ddldetailedfield);
                    ddldetailedfield.ClearSelection();
                    ddldetailedfield.Items.FindByValue(applicantInfo.detailedFieldID.ToString()).Selected = true;
                    hiddetailedfield.Value = applicantInfo.detailedFieldID.ToString();
                }
    
                if (applicantInfo.dateofbirth != null)
                {
                    DateTime dob = Convert.ToDateTime(applicantInfo.dateofbirth);

                    //ddlMonth.ClearSelection();
                    //ddlYear.ClearSelection();
                    //ddlMonth.Items.FindByValue(dob.Month.ToString()).Selected = true;
                    //ddlYear.Items.FindByValue(dob.Year.ToString()).Selected = true;
                    //FillDays(ddlDay, ddlYear, ddlMonth);
                    //ddlDay.Items.FindByValue(dob.Day.ToString()).Selected = true;
                    lbltxtdob.Visible = true;
                    lbltxtdob.Text = Convert.ToDateTime(applicantInfo.dateofbirth).ToString("dd-MMM-yyyy");
                    hidDOBDate.Value = dob.Day.ToString();
                    dobDiv.Attributes.Add("style", "display:none;");

                }

                if (applicantInfo.nationality != null)
                {
                    ddlnationality.ClearSelection();
                    ddlnationality.Items.FindByValue(applicantInfo.nationality.ToString()).Selected = true;
                }
                if (applicantInfo.countryofbirth != null)
                {
                    ddlcountryofdob.ClearSelection();
                    ddlcountryofdob.Items.FindByValue(applicantInfo.countryofbirth.ToString()).Selected = true;
                }

                if (applicantInfo.maritalstatus != null)
                {
                    ddlmaritalstatus.ClearSelection();
                    ddlmaritalstatus.Items.FindByValue(applicantInfo.maritalstatus.ToString()).Selected = true;
                }
                if (applicantInfo.alternativeIdentityproofId != null)
                {
                    ddlalternateIdentitytype.ClearSelection();
                    ddlalternateIdentitytype.Items.FindByValue(applicantInfo.alternativeIdentityproofId.ToString()).Selected = true;
                }
                txtalternateIdentityNo.Value = applicantInfo.alternativeIdentityproofno;
                if (applicantInfo.highestqualificationdate != null)
                {
                    string[] highestqualificationdate = applicantInfo.highestqualificationdate.ToString().Split('-');
                    ddlhighestqualificationmonth.ClearSelection();
                    ddlhighestqualificationmonth.Items.FindByValue(Convert.ToString(highestqualificationdate[0])).Selected = true;
                    ddlhighestqualificationYear.ClearSelection();
                    ddlhighestqualificationYear.Items.FindByValue(Convert.ToString(highestqualificationdate[1])).Selected = true;
                }
                if (applicantInfo.highestqualificationcountry != null)
                {
                    ddlhighestqualificationcountry.ClearSelection();
                    ddlhighestqualificationcountry.Items.FindByValue(applicantInfo.highestqualificationcountry.ToString()).Selected = true;
                }


                if (applicantInfo.workexperience != null)
                {
                    ddlworkexperience.ClearSelection();
                    ddlworkexperience.Items.FindByValue(applicantInfo.workexperience.ToString()).Selected = true;
                }
                if (applicantInfo.Iscurrentlyworking != null)
                {
                    ddlcurrentlyworking.ClearSelection();
                    ddlcurrentlyworking.Items.FindByValue(applicantInfo.Iscurrentlyworking.ToString()).Selected = true;
                }
                if (applicantInfo.Is_employeesby != null)
                {
                    ddlemployeesby.ClearSelection();
                    ddlemployeesby.Items.FindByValue(applicantInfo.Is_employeesby.ToString()).Selected = true;
                }
                if (applicantInfo.career_major != null)
                {
                    ddlcareer_major.ClearSelection();
                    ddlcareer_major.Items.FindByValue(applicantInfo.career_major.ToString()).Selected = true;

                }
                if (applicantInfo.career_minor != null)
                {
                    BindCareer_Minor(Convert.ToInt32(applicantInfo.career_major));
                    ddlcareer_minor.ClearSelection();
                    ddlcareer_minor.Items.FindByValue(applicantInfo.career_minor.ToString()).Selected = true;
                    hidcareer_minor.Value = applicantInfo.career_minor.ToString();
                }
                if (applicantInfo.career_broad != null)
                {
                    BindCareer_broad(Convert.ToInt32(applicantInfo.career_minor));
                    ddlcareer_broad.ClearSelection();
                    ddlcareer_broad.Items.FindByValue(applicantInfo.career_broad.ToString()).Selected = true;
                    hidcareer_broad.Value = applicantInfo.career_broad.ToString();
                }
                if (applicantInfo.career_detailed != null)
                {
                    BindCareer_detailed(Convert.ToInt32(applicantInfo.career_broad));
                    ddlcareer_detailed.ClearSelection();
                    ddlcareer_detailed.Items.FindByValue(applicantInfo.career_detailed.ToString()).Selected = true;
                    hidcareer_detailed.Value = applicantInfo.career_detailed.ToString();
                }
                
                txtFacebook.Value = applicantInfo.facebookprofle;
                if (applicantInfo.havefacebookaccount ?? false)
                {
                    ChkFacebook.Checked = true;
                    txtFacebook.Attributes.Add("disabled", "disabled");
                }
                txtLinkedin.Value = applicantInfo.linkedprofile;
                if (applicantInfo.havelinkedinaccount ?? false)
                {
                    chkLinkeIn.Checked = true;
                    txtLinkedin.Attributes.Add("disabled", "disabled");
                }
                txtTwitter.Value = applicantInfo.twiterprofile;
                if (applicantInfo.havetwitteraccount ?? false)
                {
                    chkTwitter.Checked = true;
                    txtTwitter.Attributes.Add("disabled", "disabled");
                }
                //reference
                if (applicantInfo.campusId != null)
                {
                    ddlcampus.ClearSelection();
                    ddlcampus.Items.FindByValue(applicantInfo.campusId.ToString()).Selected = true;
                }
                if (applicantInfo.gradeid != null)
                {
                    ddlgrade.ClearSelection();
                    ddlgrade.Items.FindByValue(applicantInfo.gradeid.ToString()).Selected = true;
                }
                if (applicantInfo.groupId!= null)
                {
                    ddlgroup.ClearSelection();
                    ddlgroup.Items.FindByValue(applicantInfo.groupId.ToString()).Selected = true;
                }
                //if (applicantInfo.subjectId != null)
                //{
                //    ddlsubject.ClearSelection();
                //    ddlsubject.Items.FindByValue(applicantInfo.subjectId.ToString()).Selected = true;
                //}
                var universityWise = (from usm in db.exam_applicant_subjectmapping
                                      join sm in db.subjectmaster on usm.subjectid equals sm.id
                                      where usm.universityid == universityID && usm.applicantid == userID
                                      select usm).ToList();
                for (int k = 0; k < universityWise.Count; k++)
                {
                    ddlsubject.Items.FindByValue(universityWise[k].subjectid.ToString()).Selected = true;
                }


                if (applicantInfo != null && applicantInfo.Isdetailscompleted == true)
                    btgteapplicantdetail.Attributes.Add("style", "display:none;");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindMaritalstatus()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var status = db.maritalstatusmaster.ToList();
            ddlmaritalstatus.DataSource = status;
            ddlmaritalstatus.DataTextField = "description";
            ddlmaritalstatus.DataValueField = "id";
            ddlmaritalstatus.DataBind();
            ddlmaritalstatus.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetUniversityCities(int universityId)
    {
        GTEEntities db1 = new GTEEntities();
        var campusIds = db1.universitycampus.Where(x => x.universityid == universityId).Select(x => x.campusid).ToList();
        List<object> cityDetails = new List<object>();
        foreach (int campusid in campusIds)
            cityDetails.AddRange(db1.universitycampus.Where(x => x.campusid == campusid).Select(x => new { city_id = x.cityid, cityName = x.citymaster.name }).ToList());

        if (cityDetails.Count == 0)
            cityDetails.Add(db1.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityId).Select(x => new { city_id = x.cityid, cityName = x.citymaster.name }));

        return JsonConvert.SerializeObject(cityDetails.Distinct());
    }

    private void Bindworkexperienceyears()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var workexperienceyears = db.workexperienceyearsmaster.ToList();
            ddlworkexperience.DataSource = workexperienceyears;
            ddlworkexperience.DataTextField = "description";
            ddlworkexperience.DataValueField = "workexperienceyearsid";
            ddlworkexperience.DataBind();
            ddlworkexperience.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindstudyField(DropDownList ddl, bool displayAll)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            if (displayAll)
            {
                var fields = db.studylevelmaster.ToList();

                ddl.DataSource = fields;
                ddl.DataTextField = "studylevel";
                ddl.DataValueField = "studylevelid";
                ddl.DataBind();
                ddl.Items.Insert(0, lst);
            }
            else
            {
                var studyLevel = (from slm in db.studylevelmaster
                                  join umd in db.universitywisemastermapping on slm.studylevelid equals umd.mastervalueid into umdData
                                  from x1 in umdData.DefaultIfEmpty()
                                  join mn in db.master_name on x1.masterid equals mn.masterid into mnData
                                  from x in mnData.DefaultIfEmpty()
                                  where (x1.universityid == universityID && x.mastername.ToUpper().Contains("Study Level Master"))
                                  select new
                                  {
                                      studylevel = slm.studylevel,
                                      studylevelid = slm.studylevelid
                                  }).ToList();
                ddl.DataSource = studyLevel;
                ddl.DataTextField = "studylevel";
                ddl.DataValueField = "studylevelid";
                ddl.DataBind();
                ddl.Items.Insert(0, lst);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCourse(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var course = db.coursemaster.ToList();
            ddl.DataSource = course;
            ddl.DataTextField = "coursename";
            ddl.DataValueField = "levelofcode";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindMajorDiscipline(DropDownList ddl, bool displayAll)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");

            if (displayAll)
            {
                var discipline_master = db.majordiscipline_master.ToList();
                ddl.DataSource = discipline_master;
                ddl.DataTextField = "description";
                ddl.DataValueField = "id";
                ddl.DataBind();
                ddl.Items.Insert(0, lst);
            }
            else
            {
                var discipline_master = (from md in db.majordiscipline_master
                                         join umd in db.universitywisemastermapping on md.id equals umd.mastervalueid into umdData
                                         from x1 in umdData.DefaultIfEmpty()
                                         join mn in db.master_name on x1.masterid equals mn.masterid into mnData
                                         from x in mnData.DefaultIfEmpty()
                                         where (x1.universityid == universityID && x.mastername.ToUpper().Contains("Major Discipline Master"))
                                         select new
                                         {
                                             description = md.description,
                                             id = md.id
                                         }).ToList();
                ddl.DataSource = discipline_master;
                ddl.DataTextField = "description";
                ddl.DataValueField = "id";
                ddl.DataBind();
                ddl.Items.Insert(0, lst);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public class uniData
    {
        public int universityid { get; set; }
        public string university_name { get; set; }
        public int? uniflag { get; set; }
    }

    public void FillMonth(DropDownList ddl, string text = "Please Select Month")
    {
        try
        {
            // ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;  //set current year as selected
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            //Fill Months
            ddl.Items.Add(new ListItem(text, "0"));
            for (int i = 1; i <= 12; i++)
            {
                ddl.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString().PadLeft(2, '0')));
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public void FillYears(DropDownList ddl, int years = 0, int minyears = 0, string text = "Please Select Year")
    {
        try
        {

            int maxYers = DateTime.Now.Year + years;
            int minYrs = minyears;// Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString());
            ddl.Items.Add(new ListItem(text, "0"));
            for (int i = minYrs; i <= maxYers; i++)
            {
                ddl.Items.Add(i.ToString());
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

   
    private void BindBroadField(int studylevelID, DropDownList ddl)
    {
        try
        {
            List<int> lst = new List<int>();
            lst.Add(17); lst.Add(18); lst.Add(19); lst.Add(20);
            lst.Add(21); lst.Add(22); lst.Add(23); lst.Add(24);
            lst.Add(25); lst.Add(26); lst.Add(27); lst.Add(28);

            dynamic temp;
            if (lst.Contains(studylevelID))
            {
                temp = (from bf in db.course_broadFields_master
                        where bf.id == 12
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            }
            else
            {
                temp = (from bf in db.course_broadFields_master
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            }

            ListItem lst1 = new ListItem("Please select", "0");

            ddl.DataSource = temp;
            ddl.DataTextField = "fieldname";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst1);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindNarrowField(int broadfieldID, DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var narrow = (from nf in db.course_narrowFields_master
                          join mapp in db.broad_narrow_mapping on broadfieldID equals mapp.broadField_Id
                          where nf.id == mapp.narrowField_Id
                          select new
                          {
                              fieldname = nf.fieldname,
                              id = nf.id,
                          }).Distinct().OrderBy(x => x.fieldname).ToList();
            ddl.DataSource = narrow;
            ddl.DataTextField = "fieldname";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindDetailedField(int narrowfieldID, DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var temp = (from df in db.course_detailsField_master
                        join mapp in db.narrow_detailed_mapping on narrowfieldID equals mapp.narrowField_Id
                        where df.id == mapp.deatailedField_Id
                        select new
                        {
                            fieldname = df.fieldname,
                            id = df.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            ddl.DataSource = temp;
            ddl.DataTextField = "fieldname";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetNarrowFields(int broadfieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from nf in db1.course_narrowFields_master
                    join mapp in db1.broad_narrow_mapping on broadfieldID equals mapp.broadField_Id
                    where nf.id == mapp.narrowField_Id
                    select new
                    {
                        fieldname = nf.fieldname,
                        id = nf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetDetailedFields(int narrowfieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from df in db1.course_detailsField_master
                    join mapp in db1.narrow_detailed_mapping on narrowfieldID equals mapp.narrowField_Id
                    where df.id == mapp.deatailedField_Id
                    select new
                    {
                        fieldname = df.fieldname,
                        id = df.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetBroadFields(int studeylevelID)
    {
        GTEEntities db1 = new GTEEntities();

        List<int> lst = new List<int>();
        lst.Add(17); lst.Add(18); lst.Add(19); lst.Add(20);
        lst.Add(21); lst.Add(22); lst.Add(23); lst.Add(24);
        lst.Add(25); lst.Add(26); lst.Add(27); lst.Add(28);

        dynamic temp;
        if (lst.Contains(studeylevelID))
        {
            temp = (from bf in db1.course_broadFields_master
                    where bf.id == 12
                    select new
                    {
                        fieldname = bf.fieldname,
                        id = bf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        }
        else
        {
            temp = (from bf in db1.course_broadFields_master
                    select new
                    {
                        fieldname = bf.fieldname,
                        id = bf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        }
        return JsonConvert.SerializeObject(temp);
    }
    protected void testbtn_Click(object sender, EventArgs e)
    {

        //Stream st = fileUpload.PostedFile.InputStream;

        //string name = Path.GetFileName(fileUpload.FileName);
        //string myBucketName = "applicantprofile"; //your s3 bucket name goes here  
        //string s3DirectoryName = "";
        //string s3FileName = userID + "_U" + universityID;//
        //bool a;
        //AmazonUploader myUploader = new AmazonUploader();
        //a = myUploader.sendMyFileToS3(st, myBucketName, s3DirectoryName, s3FileName);
        //if (a == true)
        //{
        //    lbl.InnerText = "successfully uploaded";

        //}
        //else
        //    lbl.InnerText = "Error";

    }
    private void SavetoAWS(FileUpload fileUdpload)
    {
        try
        {
            Stream st = fileUdpload.PostedFile.InputStream;

            string name = Path.GetFileName(fileUdpload.FileName);
            string myBucketName = "applicantprofile"; //your s3 bucket name goes here  
            string s3DirectoryName = "";
            string s3FileName = userID + "_U" + universityID;//
            bool a;
            AmazonUploader myUploader = new AmazonUploader();
            a = myUploader.sendMyFileToS3(st, myBucketName, s3DirectoryName, s3FileName);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public class AmazonUploader
    {
        public bool sendMyFileToS3(System.IO.Stream localFilePath, string bucketName, string subDirectoryInBucket, string fileNameInS3)
        {
            IAmazonS3 client = new AmazonS3Client(RegionEndpoint.APSouth1);
            TransferUtility utility = new TransferUtility(client);
            TransferUtilityUploadRequest request = new TransferUtilityUploadRequest();

            if (subDirectoryInBucket == "" || subDirectoryInBucket == null)
            {
                request.BucketName = bucketName; //no subdirectory just bucket name  
            }
            else
            {   // subdirectory and bucket name  
                request.BucketName = bucketName + @"/" + subDirectoryInBucket;
            }
            request.Key = fileNameInS3; //file name up in S3  
            request.InputStream = localFilePath;
            utility.Upload(request); //commensing the transfer  

            return true; //indicate that the file was sent  
        }
    }

    protected void Linkbutton1_Click(object sender, EventArgs e)
    {
        // to how Pop and calling another Page in Popup.
        string url = "/Captureimage.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=900,height=460,left=100,top=100,resizable=no');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }

    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.universitywisetooltipmaster
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
                          from x in tmp.Where(c => c.formid == formId).DefaultIfEmpty()
                          where (x.formid == formId || z.formid == formId)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              universitywiseToolTips = (z == null ? String.Empty : z.tooltips),
                              tooltips = (x == null ? String.Empty : x.tooltips)
                          }).ToList();


            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "FIRST NAME":
                        icfirstname.Attributes.Add("style", "display:block;");
                        icfirstname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MIDDLE NAME(S)":
                        icmiddlename.Attributes.Add("style", "display:block;");
                        icmiddlename.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "FAMILY NAME":
                        iclastname.Attributes.Add("style", "display:block;");
                        iclastname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DATE OF BIRTH":
                        icdob.Attributes.Add("style", "display:block;");
                        icdob.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF CITIZENSHIP":
                        icnationality.Attributes.Add("style", "display:block;");
                        icnationality.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY OF BIRTH":
                        iccountryofdob.Attributes.Add("style", "display:block;");
                        iccountryofdob.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MARITAL STATUS":
                        icmaritalstatus.Attributes.Add("style", "display:block;");
                        icmaritalstatus.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "GENDER":
                        icGender.Attributes.Add("style", "display:block;");
                        icGender.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "POSTAL ADDRESS":
                        icPostal.Attributes.Add("style", "display:block;");
                        icPostal.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "IS YOUR POSTAL ADDRESS THE SAME AS YOUR CURRENT RESIDENTIAL ADDRESS?":
                        icAddress.Attributes.Add("style", "display:block;");
                        icAddress.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "CURRENT RESIDENTIAL ADDRESS":
                        icResedentail.Attributes.Add("style", "display:block;");
                        icResedentail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL":
                        icEmail.Attributes.Add("style", "display:block;");
                        icEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        icMobile.Attributes.Add("style", "display:block;");
                        icMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "LEVEL OF HIGHEST ACADEMIC QUALIFICATION COMPLETED":
                        ichighestqualificationAchieved.Attributes.Add("style", "display:block;");
                        ichighestqualificationAchieved.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "BROAD FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED":
                        i1.Attributes.Add("style", "display:block;");
                        i1.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NARROW FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED":
                        i2.Attributes.Add("style", "display:block;");
                        i2.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DETAILED FIELD OF EDUCATION OF HIGHEST ACADEMIC QUALIFICATION COMPLETED":
                        i3.Attributes.Add("style", "display:block;");
                        i3.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DATE OF COMPLETION OF HIGHEST ACADEMIC QUALIFICATION":
                        ichighestqualificationdate.Attributes.Add("style", "display:block;");
                        ichighestqualificationdate.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "COUNTRY WHERE YOU STUDIED YOUR HIGHEST ACADEMIC QUALIFICATION":
                        ichighestqualificationcountry.Attributes.Add("style", "display:block;");
                        ichighestqualificationcountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    //case "LEVEL OF THE HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                    //    i6.Attributes.Add("style", "display:block;");
                    //    i6.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "BROAD FIELD OF EDUCATION OF THE HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                    //    i7.Attributes.Add("style", "display:block;");
                    //    i7.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "NARROW FIELD OF EDUCATION OF THE LAST AND HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                    //    i8.Attributes.Add("style", "display:block;");
                    //    i8.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "DETAILED FIELD OF EDUCATION OF THE LAST AND HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                    //    i9.Attributes.Add("style", "display:block;");
                    //    i9.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "DATE YOU INTEND TO START YOUR NEXT STUDIES":
                    //    i10.Attributes.Add("style", "display:block;");
                    //    i10.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "NAME OF Institution YOU ARE APPLYING TO  ":
                    //    icuniversityname.Attributes.Add("style", "display:block;");
                    //    icuniversityname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "NAME OF THE COUNTRY WHERE YOU ARE APPLYING TO STUDY":
                    //    icuniversitycountry.Attributes.Add("style", "display:block;");
                    //    icuniversitycountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    //case "NAME OF THE CITY WHERE YOUR EDUCATIONAL INSTITUTION/CAMPUS IS LOCATED":
                    //    iceduinstitutioncity.Attributes.Add("style", "display:block;");
                    //    iceduinstitutioncity.Attributes.Add("data-tipso", setTooltips(fields[k]));
                    //    break;
                    case "NUMBER OF YEARS OF FULL-TIME WORK EXPERIENCE":
                        icworkexperience.Attributes.Add("style", "display:block;");
                        icworkexperience.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ARE YOU CURRENTLY WORKING IN A FULL-TIME JOB?":
                        i4.Attributes.Add("style", "display:block;");
                        i4.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                  
                    case "PLEASE UPLOAD AN ELECTRONIC PHOTO FOR YOUR PROFILE PICTURE":
                        icprofilephoto.Attributes.Add("style", "display:block;");
                        icprofilephoto.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
    private String setTooltips(dynamic obj)
    {
        return obj.universitywiseToolTips == "" ? obj.tooltips : obj.universitywiseToolTips;
    }
    public void FillDays(DropDownList ddl, DropDownList ddlFromYear, DropDownList ddlFromMonth)
    {
        try
        {
            ddl.Items.Clear();
            ddl.Items.Add("Select Day");
            List<dynamic> daysData = new List<dynamic>();
            daysData.Add(new { displayName = "Select Day", value = 0 });
            if (Convert.ToInt32(ddlFromYear.SelectedValue) > 0 && Convert.ToInt32(ddlFromMonth.SelectedValue) > 0)
            {
                //getting numbner of days in selected month & year
                int noofdays = DateTime.DaysInMonth(Convert.ToInt32(ddlFromYear.SelectedValue), Convert.ToInt32(ddlFromMonth.SelectedValue));
                //Fill days         

                for (int i = 1; i <= noofdays; i++)
                {
                    daysData.Add(new { displayName = i.ToString(), value = i });
                }
            }
            ddl.DataSource = daysData;
            ddl.DataTextField = "displayName";
            ddl.DataValueField = "value";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        // ddlDay.Items.FindByValue(System.DateTime.Now.Day.ToString()).Selected = true;// Set current date as selected
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetFields_minor(int major_fieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from nf in db1.ec_minor_career_filed_master
                    join mapp in db1.ec_careerfield_mapping on major_fieldID equals mapp.career_majorID
                    where nf.id == mapp.career_minorID
                    select new
                    {
                        fieldname = nf.minor_name,
                        id = nf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetFields_broad(int minor_fieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from nf in db1.ec_broad_career_filed_master
                    join mapp in db1.ec_careerfield_mapping on minor_fieldID equals mapp.career_minorID
                    where nf.id == mapp.career_broadID
                    select new
                    {
                        fieldname = nf.broad_name,
                        id = nf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetFields_detailed(int broad_fieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from nf in db1.ec_detailed_career_filed_master
                    join mapp in db1.ec_careerfield_mapping on broad_fieldID equals mapp.career_broadID
                    where nf.id == mapp.career_detailedID
                    select new
                    {
                        fieldname = nf.detailed_name,
                        id = nf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    private void BindCareer_Minor(int major_fieldID) {
        try {
            var temp = (from nf in db.ec_minor_career_filed_master
                        join mapp in db.ec_careerfield_mapping on major_fieldID equals mapp.career_majorID
                        where nf.id == mapp.career_minorID
                        select new
                        {
                            fieldname = nf.minor_name,
                            id = nf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();

            ListItem lst = new ListItem("Please select", "0");
           
            ddlcareer_minor.DataSource = temp;
            ddlcareer_minor.DataTextField = "fieldname";
            ddlcareer_minor.DataValueField = "id";
            ddlcareer_minor.DataBind();
            ddlcareer_minor.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCareer_broad(int minor_fieldID)
    {
        try
        {
            var temp = (from nf in db.ec_broad_career_filed_master
                        join mapp in db.ec_careerfield_mapping on minor_fieldID equals mapp.career_minorID
                        where nf.id == mapp.career_broadID
                        select new
                        {
                            fieldname = nf.broad_name,
                            id = nf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();

            ListItem lst = new ListItem("Please select", "0");

            ddlcareer_broad.DataSource = temp;
            ddlcareer_broad.DataTextField = "fieldname";
            ddlcareer_broad.DataValueField = "id";
            ddlcareer_broad.DataBind();
            ddlcareer_broad.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindCareer_detailed(int broad_fieldID)
    {
        try
        {
            var temp = (from nf in db.ec_detailed_career_filed_master
                        join mapp in db.ec_careerfield_mapping on broad_fieldID equals mapp.career_broadID
                        where nf.id == mapp.career_detailedID
                        select new
                        {
                            fieldname = nf.detailed_name,
                            id = nf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();

            ListItem lst = new ListItem("Please select", "0");

            ddlcareer_detailed.DataSource = temp;
            ddlcareer_detailed.DataTextField = "fieldname";
            ddlcareer_detailed.DataValueField = "id";
            ddlcareer_detailed.DataBind();
            ddlcareer_detailed.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    //[WebMethod]
    //[ScriptMethod(UseHttpGet = true)]
    //public static string GetClasses(int grade, int group ,int subjectList)
    //{
    //    GTEEntities db1 = new GTEEntities();
    //    int universityID = Utility.GetUniversityId();
    //    List<ec_class_master> temp = new List<ec_class_master>();

    //    string[] str = subjectList.ToString().Split('@');
    //    for (int i = 0; i < str.Length; i++) 
    //    {
    //        int subjectid = Convert.ToInt32(str[i]);
    //        if (subjectid != 0)
    //        {
    //            var classList = db1.ec_class_master.Where(x => x.universityid == universityID && x.gradeid == grade && x.groupid == group && x.subjectid == subjectid).FirstOrDefault();
    //            if (classList != null)
    //                temp.Add(classList);
    //        }
    //    }
        
    //    return JsonConvert.SerializeObject(temp);
    //}

}