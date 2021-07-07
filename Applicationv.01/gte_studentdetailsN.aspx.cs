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

public partial class gte_studentdetailsN : System.Web.UI.Page
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
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        var isFullService = (int)Session["FullService"];
        if (isFullService == 1)
            Response.Redirect(webURL + "default.aspx", true);

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        //var isGteDeclarationDoneByApplicant = (bool)Session["GteDeclarationDoneByApplicant"];
        //if (!isGteDeclarationDoneByApplicant)
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
        //            "alert('GTE Declaration is not completed.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        isuniversityGroupHead = db.universitygrouping.Where(x => x.groupingheaduniversityid == universityID).ToList().Count > 0;
        if (isuniversityGroupHead)
            isunigrouped = 1;
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        firstname = objCom.GetApplicantFirstName(userID).ToUpper();
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
            objCom.BindCountries(ddlcountryofdob);
            objCom.BindCountries(ddlnationality);
            //objCom.BindCountries(ddlspousenationality);
            //objCom.BindCountries(ddlcountyofstudy);
            objCom.BindCountries(ddlcountryresidence);
            objCom.BindCountries(ddlhighestqualificationcountry);
            // BindUniversityCampuses();
            BindMaritalstatus();
            Bindworkexperienceyears();
            FillMonth(ddlhighestqualificationmonth, "Please select month of completion");
            FillYears(ddlhighestqualificationYear, 0, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString()), "Please select year of completion");

            FillMonth(ddlMonth);
            FillYears(ddlYear,0, Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString()));
            //BindMajorDiscipline(ddlhighestqualificationfield, true);
            BindMajorDiscipline(ddlfieldofstudy, true);
            Bindannualfee();
            BindCountrycode();
            BindstudyField(ddlhighestqualificationAchieved, true);
            BindstudyField(ddlcourseapplied, true);

            BindAgent();
            //objCom.BindCountries(ddluniversityCountry);
            //BindCommencementDate(ddlCommencementdate);
            FillMonth(ddlCommencementdateMonth);
            FillYears(ddlCommencementdateYear, 30, DateTime.Now.Year);
            if (isuniversityGroupHead)
                BindUnivercity(universityID);
            else
            {
                BindEducationCountry(universityID);
                universityname.Style.Add("display", "none");
                //BindcityofInstitution();
            }

            objCom.BindCountries(ddlpostalCountry);
            objCom.BindCountries(ddlResidentialCountry);
            BindGender();
            int? maxAge = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => x.acceptedmaxage).First();
            int? minAge = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => x.acceptedminage).First();
            if (maxAge != null)
                GlobalVariables.universityMaxAge = Convert.ToInt32(maxAge);
            if (minAge != null)
                GlobalVariables.universityMinAge = Convert.ToInt32(minAge);
            SetToolTips();
            populategteapplicantdetail();
        }
    }

    private void BindEducationCountry(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            List<data> list = new List<data>();
            List<data> list_final = new List<data>();
            List<data> temp = new List<data>();

            var campuscount = db.universitycampus.Where(x => x.universityid == universityid).ToList();
            if (campuscount.Count > 0)
            {
                temp = (from em in db.countriesmaster

                        join um in db.university_master on em.id equals um.countryid into primaryData
                        from uni in primaryData.DefaultIfEmpty()

                        join uc in db.universitycampus on universityid equals uc.universityid into uniData
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

                    list.Add((from cm in db.citymaster
                              join coun in db.countriesmaster on cm.country_id equals coun.id into counData
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
                list_final = (from em in db.countriesmaster

                              join um in db.university_master on em.id equals um.countryid into primaryData
                              from uni in primaryData.DefaultIfEmpty()

                              where uni.universityid == universityid && uni.IsDeleted != 1
                              select new data()
                              {
                                  country_name = em.country_name,
                                  id = em.id,
                              }).Distinct().ToList();
            }

            ddluniversityCountry.DataSource = list_final;
            ddluniversityCountry.DataTextField = "country_name";
            ddluniversityCountry.DataValueField = "id";
            ddluniversityCountry.DataBind();
            ddluniversityCountry.Items.Insert(0, lst);

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

    private void bindcity(int countryId, int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            //List<citydata> temp = new List<citydata>();

            //var campuscount = db.universitycampus.Where(x => x.universityid == universityid).ToList();
            //if (campuscount.Count > 0)
            //{
            //    temp = (from cm in db.citymaster
            //            join uc in db.universitycampus on cm.city_id equals uc.cityid into campusData
            //            from campus in campusData.DefaultIfEmpty()

            //            where cm.country_id == countryId && campus.universityid == universityid
            //            select new citydata
            //            {
            //                name = cm.name,
            //                city_id = cm.city_id,
            //            }).Distinct().ToList();
            //    var universitycity = (from cm in db.citymaster
            //                          join um in db.university_master on cm.city_id equals um.cityid
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
            //    temp = (from cm in db.citymaster
            //            join um in db.university_master on cm.city_id equals um.cityid

            //            where um.universityid == universityid
            //            select new citydata
            //            {
            //                name = cm.name,
            //                city_id = cm.city_id,
            //            }).Distinct().ToList();
            //}

            var citydata = (from cm in db.citymaster
                            where cm.country_id == countryId
                            select new citydata
                            {
                                name = cm.name,
                                city_id = cm.city_id,
                            }).Distinct().ToList();
            ddleduinstitutioncity.DataSource = citydata;//temp;
            ddleduinstitutioncity.DataTextField = "name";
            ddleduinstitutioncity.DataValueField = "city_id";
            ddleduinstitutioncity.DataBind();
            ddleduinstitutioncity.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
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

            foreach (var item in code)
            {
                String CurrentString = item.description;

                String s1 = CurrentString.Substring(CurrentString.IndexOf("(") + 1);
                var countryname = CurrentString.Split('(')[0].Trim();
                item.description = "+" + item.code + " " + countryname;

            }

            ddlcountrycode.DataSource = code;
            ddlcountrycode.DataTextField = "description";
            ddlcountrycode.DataValueField = "id";
            ddlcountrycode.DataBind();
            ddlcountrycode.Items.Insert(0, lst);
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

            objapplicantdetails.firstname = txtFirstName.Value;
            objapplicantdetails.middlename = txtMiddleName.Value;
            objapplicantdetails.lastname = txtLastName.Value;

            string dateofBirth = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + hidDOBDate.Value;
            objapplicantdetails.dateofbirth = Convert.ToDateTime(dateofBirth);

            //objapplicantdetails.dateofbirth = Convert.ToDateTime(txtdob.Value);
            objapplicantdetails.countryof_citizenship = Convert.ToInt32(ddlnationality.SelectedValue);
            objapplicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);
            objapplicantdetails.maritalstatus = Convert.ToInt32(ddlmaritalstatus.SelectedValue);
            objapplicantdetails.gender = Convert.ToInt32(ddlgenderList.SelectedValue);

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


            if (ddlboradfieldyouwillComplete.SelectedValue != "")
                objapplicantdetails.broadFieldIDyouwillComplete = Convert.ToInt32(HidboradfieldyouwillComplete.Value);
            if (ddlnarrowfieldyouwillcomplete.SelectedValue != "")
                objapplicantdetails.narrowFieldIDyouwillComplete = Convert.ToInt32(Hidnarrowfieldyouwillcomplete.Value);
            if (ddldetailedfieldyowillcomplete.SelectedValue != "")
                objapplicantdetails.detailedFieldIDyouwillComplete = Convert.ToInt32(Hiddetailedfieldyowillcomplete.Value);

            //if (ddlhighestqualificationfield.SelectedValue != "")
            //    objgte_applicantdetails.highestqualificationfield = Convert.ToInt32(ddlhighestqualificationfield.SelectedValue);

            objapplicantdetails.nationality = Convert.ToInt32(ddlnationality.SelectedValue); // country of citizenship
            objapplicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);
            objapplicantdetails.maritalstatus = Convert.ToInt32(ddlmaritalstatus.SelectedValue);
           // objapplicantdetails.dateofbirth = Convert.ToDateTime(txtdob.Value);
            
            if (ddlcountryofdob.SelectedValue != "")
                objapplicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);

            if (ddlhighestqualificationAchieved.SelectedValue != "")
                objapplicantdetails.highestqualifiactionachieved = ddlhighestqualificationAchieved.SelectedValue;

            if ((ddlhighestqualificationmonth.SelectedValue != "") && (ddlhighestqualificationYear.SelectedValue != ""))
                objapplicantdetails.highestqualificationdate = ddlhighestqualificationmonth.SelectedValue + "-" + ddlhighestqualificationYear.SelectedValue;
            if (ddlhighestqualificationcountry.SelectedValue != "")
                objapplicantdetails.highestqualificationcountry = Convert.ToInt32(ddlhighestqualificationcountry.SelectedValue);

            if (ddlcourseapplied.SelectedValue != "")
                objapplicantdetails.levelofcourse = Convert.ToInt32(ddlcourseapplied.SelectedValue);

            if ((ddlCommencementdateMonth.SelectedValue != "") && (ddlCommencementdateYear.SelectedValue != ""))
                objapplicantdetails.commencementdate = ddlCommencementdateMonth.SelectedValue + "-" + ddlCommencementdateYear.SelectedValue;

            if (ddluniversityname.SelectedValue != "")
                objapplicantdetails.nameofuniversityappliedfor = Convert.ToInt32(ddluniversityname.SelectedValue);
            else
                objapplicantdetails.nameofuniversityappliedfor = universityID;
            if (ddluniversityCountry.SelectedValue != null)
                objapplicantdetails.countryofeducationInstitution = Convert.ToInt32(HiduniversityCountry.Value);
            objapplicantdetails.cityofeducationInstitution = Convert.ToInt32(hidCityField.Value);

            if (ddlworkexperience.SelectedValue != "")
                objapplicantdetails.workexperience = Convert.ToInt32(ddlworkexperience.SelectedValue);

            if (ddlcurrentlyworking.SelectedValue != "")
                objapplicantdetails.Iscurrentlyworking = Convert.ToInt32(ddlcurrentlyworking.SelectedValue);
            if (ddljoboffered.SelectedValue != "")
                objapplicantdetails.Isjoboffered = Convert.ToInt32(ddljoboffered.SelectedValue);

            if (rblpackageYes.Checked == true)
                objapplicantdetails.Ispackage = 1;
            else if (rblpackageNO.Checked == true)
                objapplicantdetails.Ispackage = 0;
            if (rblpackageYes.Checked == true)
                applicantInfo.what_package = txtpackage.Value;
            //profile pic
            if (fileUpload.HasFile)
            {
                string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                docPath = docPath + "/GTEProfileDetail/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(fileUpload.PostedFile.FileName);
                string filename = userID + extension;

                if (File.Exists(docPath + filename))
                {
                    File.Delete(docPath + filename);
                }

                fileUpload.PostedFile.SaveAs(docPath + filename);
                objapplicantdetails.profilephoto = filename;
                
            }
            objapplicantdetails.passportno = txtpassportno.Value;
            if (FileUpload_passport.HasFile)
            {
                string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                docPath = docPath + "/GTEProfileDetail/passportcopy/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(FileUpload_passport.PostedFile.FileName);
                string filename = userID + extension;

                if (File.Exists(docPath + filename))
                {
                    File.Delete(docPath + filename);
                }

                FileUpload_passport.PostedFile.SaveAs(docPath + filename);

                objapplicantdetails.passportcopy = filename;
            }
            //agent 
            if (rblAgentYes.Checked)
            {
                objapplicantdetails.isstudentreferbyagent = 1;
                if (ddlAgent.SelectedValue != "")
                    objapplicantdetails.agentid = Convert.ToInt32(ddlAgent.SelectedValue);

            }
            else if (rblAgentNo.Checked)
            {
                objapplicantdetails.isstudentreferbyagent = 0;
                objapplicantdetails.agentid = null;
            }
            objapplicantdetails.registeragent_email = txtAgentname.Text;

            objapplicantdetails.Isdetailscompleted = true;
            if (mode1 == "new")
                db.applicantdetails.Add(obj_applicantdetails);
           
            db.SaveChanges();

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetGteStudentDetailsCompletedStatus(userID, universityID);

            SavetoAWS(fileUpload);

            Response.Redirect(webURL + "gte_declaration.aspx?formid=20", true);

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

                txtFirstName.Value = applicantInfo.firstname;
                txtLastName.Value = applicantInfo.lastname;
                txtMiddleName.Value = applicantInfo.middlename;
                if (applicantInfo.gender != null)
                {
                    ddlgenderList.ClearSelection();
                    ddlgenderList.Items.FindByValue(applicantInfo.gender.ToString()).Selected = true;
                }
                txtAddressLine1.Value = applicantInfo.postaladdrees1;
                txtAddressLine2.Value = applicantInfo.postaladdrees2;
                txtAddressLine3.Value = applicantInfo.postaladdrees3;
                txtCity.Value = applicantInfo.postalcity;
                txtState.Value = applicantInfo.postalstate;
                txtPostal.Value = applicantInfo.postalpostcode;
                if (applicantInfo.postalcountry != null)
                {
                    ddlpostalCountry.ClearSelection();
                    ddlpostalCountry.Items.FindByValue(applicantInfo.postalcountry.ToString()).Selected = true;
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
                if (applicantInfo.levelofcourse != null)
                {
                    ddlcourseapplied.ClearSelection();
                    ddlcourseapplied.Items.FindByValue(applicantInfo.levelofcourse.ToString()).Selected = true;
                    BindBroadField(Convert.ToInt32(applicantInfo.levelofcourse), ddlboradfieldyouwillComplete);
                }

                // BindBroadField(Convert.ToInt32(applicantInfo.levelofcourse), ddlboradfieldyouwillComplete);
                if (applicantInfo.broadFieldIDyouwillComplete != null)
                {
                    ddlboradfieldyouwillComplete.ClearSelection();
                    ddlboradfieldyouwillComplete.Items.FindByValue(applicantInfo.broadFieldIDyouwillComplete.ToString()).Selected = true;
                    HidboradfieldyouwillComplete.Value = applicantInfo.broadFieldIDyouwillComplete.ToString();
                }
                if (applicantInfo.narrowFieldIDyouwillComplete != null)
                {
                    BindNarrowField(Convert.ToInt32(applicantInfo.broadFieldIDyouwillComplete), ddlnarrowfieldyouwillcomplete);
                    ddlnarrowfieldyouwillcomplete.ClearSelection();
                    ddlnarrowfieldyouwillcomplete.Items.FindByValue(applicantInfo.narrowFieldIDyouwillComplete.ToString()).Selected = true;
                    Hidnarrowfieldyouwillcomplete.Value = applicantInfo.narrowFieldIDyouwillComplete.ToString();
                }
                if (applicantInfo.detailedFieldIDyouwillComplete != null)
                {
                    BindDetailedField(Convert.ToInt32(applicantInfo.narrowFieldIDyouwillComplete), ddldetailedfieldyowillcomplete);
                    ddldetailedfieldyowillcomplete.ClearSelection();
                    ddldetailedfieldyowillcomplete.Items.FindByValue(applicantInfo.detailedFieldIDyouwillComplete.ToString()).Selected = true;
                    Hiddetailedfieldyowillcomplete.Value = applicantInfo.detailedFieldIDyouwillComplete.ToString();
                }
                if (applicantInfo.passportno != null)
                    txtpassportno.Value = applicantInfo.passportno;

                //if (applicantInfo.highestqualificationfield != null)
                //{
                //    ddlhighestqualificationfield.ClearSelection();
                //    ddlhighestqualificationfield.Items.FindByValue(applicantInfo.highestqualificationfield.ToString()).Selected = true;
                //}

                //if (applicantInfo.dateofbirth != null)
                //    txtdob.Value = Convert.ToDateTime(applicantInfo.dateofbirth).ToString("yyyy-MM-dd");

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
                    dobDiv.Attributes.Add("style","display:none;");

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


                if (applicantInfo.commencementdate != null)
                {
                    string[] commencementdate = applicantInfo.commencementdate.ToString().Split('-');
                    ddlCommencementdateMonth.ClearSelection();
                    ddlCommencementdateMonth.Items.FindByValue(Convert.ToString(commencementdate[0])).Selected = true;
                    ddlCommencementdateYear.ClearSelection();
                    ddlCommencementdateYear.Items.FindByValue(Convert.ToString(commencementdate[1])).Selected = true;
                }

                if (applicantInfo.nameofuniversityappliedfor != null && isuniversityGroupHead)
                {
                    ddluniversityname.ClearSelection();
                    ddluniversityname.Items.FindByValue(applicantInfo.nameofuniversityappliedfor.ToString()).Selected = true;
                }
                if (applicantInfo.countryofeducationInstitution != null)
                {
                    ddluniversityCountry.ClearSelection();
                    BindEducationCountry(Convert.ToInt32(applicantInfo.nameofuniversityappliedfor));
                    ddluniversityCountry.Items.FindByValue(applicantInfo.countryofeducationInstitution.ToString()).Selected = true;
                    HiduniversityCountry.Value = Convert.ToString(applicantInfo.countryofeducationInstitution);
                }
                if (applicantInfo.cityofeducationInstitution != null)
                {
                    bindcity(Convert.ToInt32(applicantInfo.countryofeducationInstitution), Convert.ToInt32(applicantInfo.nameofuniversityappliedfor));
                    ddleduinstitutioncity.ClearSelection();
                    ddleduinstitutioncity.Items.FindByValue(applicantInfo.cityofeducationInstitution.ToString()).Selected = true;
                    hidCityField.Value = Convert.ToString(applicantInfo.cityofeducationInstitution);
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
                if (applicantInfo.Isjoboffered != null)
                {
                    ddljoboffered.ClearSelection();
                    ddljoboffered.Items.FindByValue(applicantInfo.Isjoboffered.ToString()).Selected = true;
                }

                if (applicantInfo.Ispackage == 1)
                    rblpackageYes.Checked = true;
                else if (applicantInfo.Ispackage == 0)
                    rblpackageNO.Checked = true;
                if (applicantInfo.Ispackage == 1)
                    txtpackage.Value = applicantInfo.what_package;
                //agent
                if (applicantInfo.isstudentreferbyagent == 1)
                    rblAgentYes.Checked = true;
                else if (applicantInfo.isstudentreferbyagent == 0)
                    rblAgentNo.Checked = true;
                if (applicantInfo.agentid != null)
                {
                    ddlAgent.ClearSelection();
                    ddlAgent.Items.FindByValue(applicantInfo.agentid.ToString()).Selected = true;
                    addnewagent.Attributes.Add("style", "display:none");
                }
                txtAgentname.Text = applicantInfo.registeragent_email;
                //profile pic
                if (applicantInfo.profilephoto != null)
                {
                    //fileUpload.Visible = false;
                    hidDocumentPath.Value = applicantInfo.profilephoto;
                    uploadedFile.NavigateUrl = webURL + "/Docs/GTEProfileDetail/" + applicantInfo.profilephoto;
                    uploadedFile.Text = "View File";
                    fileUpload.Attributes.Add("style", "display:none");
                }
                if (applicantInfo.passportcopy != null)
                {
                    //FileUpload_passport.Visible = false;
                    hidPassportDocPath.Value = applicantInfo.passportcopy;
                    HyperLink1.NavigateUrl = webURL + "/Docs/GTEProfileDetail/passportcopy/" + applicantInfo.passportcopy;
                    HyperLink1.Text = "View File";
                    FileUpload_passport.Attributes.Add("style", "display:none");
                }
            }
            
            if (applicantInfo != null && applicantInfo.Isdetailscompleted == true)
                btgteapplicantdetail.Attributes.Add("style", "display:none;");

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

    private void Bindannualfee()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var cost = db.tuitionAndlivingcostmaster.ToList();
            ddlannualfee.DataSource = cost;
            ddlannualfee.DataTextField = "description";
            ddlannualfee.DataValueField = "id";
            ddlannualfee.DataBind();
            ddlannualfee.Items.Insert(0, lst);
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

    //private void BindcityofInstitution() {
    //    try
    //    {

    //        ListItem lst = new ListItem("Please select", "0");
    //        ddleduinstitutioncity.DataSource = JsonConvert.DeserializeObject<List<object>>(GetUniversityCities(universityID)); ;
    //        ddleduinstitutioncity.DataTextField = "cityName";
    //        ddleduinstitutioncity.DataValueField = "city_id";
    //        ddleduinstitutioncity.DataBind();
    //        ddleduinstitutioncity.Items.Insert(0, lst);
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}
    private void Bindtypeofworkexperienceyears(int ddlworkexpValue)
    {
        try
        {
            if (ddlworkexpValue == 0)
                ddltypeofworkexperience.Items.Insert(0, "Not Applicable");
            else
            {
                ListItem lst = new ListItem("Please select", "0");
                var workexperiencetype = db.typeofworkexperiencemaster.ToList();
                ddltypeofworkexperience.DataSource = workexperiencetype;
                ddltypeofworkexperience.DataTextField = "description";
                ddltypeofworkexperience.DataValueField = "workexperiencetypesid";
                ddltypeofworkexperience.DataBind();
                ddltypeofworkexperience.Items.Insert(0, lst);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
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

    private void BindUnivercity(int univerisityHeadId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            List<uniData> objUniversities = new List<uniData>();
            var universities = db.universitygrouping.Where(x => x.groupingheaduniversityid == univerisityHeadId).Select(x => x.universityid).ToList();

            foreach (int universityId in universities)
                objUniversities.Add(db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityId).Select(x => new uniData { university_name = x.university_name, universityid = x.universityid, uniflag = x.university_flag }).FirstOrDefault());

            objUniversities.Add(db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new uniData { university_name = x.university_name, universityid = x.universityid, uniflag = x.university_flag }).FirstOrDefault());

            objUniversities.RemoveAll(x => x.uniflag != 1);
            ddluniversityname.DataSource = objUniversities.OrderBy(x=>x.university_name).ToList();
            ddluniversityname.DataTextField = "university_name";
            ddluniversityname.DataValueField = "universityid";
            ddluniversityname.DataBind();
            ddluniversityname.Items.Insert(0, lst);

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

    public void FillMonth(DropDownList ddl, string text ="Please Select Month")
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

    //public void sendemail(string email)
    //{
    //    var applicantNameDetails = db.students.Where(x => x.studentid == userID).Select(x => new { x.name }).FirstOrDefault();
    //    var univresityDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo }).FirstOrDefault();

    //    string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_agentResgistrationNotification.html"));
    //    html = html.Replace("@UniversityName", univresityDetails.university_name);
    //    html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + univresityDetails.logo);
    //    html = html.Replace("@applicatFullName", applicantNameDetails.name + "'s");
    //    html = html.Replace("@applicantFirstname", applicantNameDetails.name);
    //    html = html.Replace("@agentRegistrationurl", webURL + "registeragent.aspx");
    //    objCom.SendMail(email, html, "Agent Registration Link");
    //}

    private void BindAgent()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var agent = db.agentmaster.ToList();
            ddlAgent.DataSource = agent;
            ddlAgent.DataTextField = "agentname";
            ddlAgent.DataValueField = "agentid";
            ddlAgent.DataBind();
            ddlAgent.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string sendemailtoAgent(string email)
    {
        GTEEntities db = new GTEEntities();
        Common objCom = new Common();
        int universityID = Utility.GetUniversityId();
        int userID = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
        string webURL = Utility.GetWebUrl();
        var applicantNameDetails = db.students.Where(x => x.studentid == userID).Select(x => new { x.name }).FirstOrDefault();
        var univresityDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo, x.full_service }).FirstOrDefault();

        string html = File.ReadAllText(System.Web.HttpContext.Current.Server.MapPath("/assets/Emailtemplate/gte_agentResgistrationNotification.html"));

        var subjects = "Agent Registration Link";
        if (univresityDetails.full_service == 0)
            subjects = "GTE Centre: Registration Link, credit for GTE Assessment";

        html = html.Replace("@UniversityName", univresityDetails.university_name);
        html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + univresityDetails.logo);
        html = html.Replace("@applicatFullName", applicantNameDetails.name + "'s");
        html = html.Replace("@applicantFirstname", applicantNameDetails.name);
        html = html.Replace("@agentRegistrationurl", webURL + "registeragent.aspx");
        if (univresityDetails.full_service == 0)
            html = html.Replace("team", "GTE Direct Team");
        else if(univresityDetails.full_service == 2)
            html = html.Replace("team", "The Assessment Centre Team");
        else
            html = html.Replace("team", "The Application Centre Team");
        objCom.SendMail(email, html, subjects);

        return JsonConvert.SerializeObject(email);
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
                        }).Distinct().OrderBy(x=>x.fieldname).ToList();
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
        try {
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
                    case "LEVEL OF THE HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                        i6.Attributes.Add("style", "display:block;");
                        i6.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "BROAD FIELD OF EDUCATION OF THE HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                        i7.Attributes.Add("style", "display:block;");
                        i7.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NARROW FIELD OF EDUCATION OF THE LAST AND HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                        i8.Attributes.Add("style", "display:block;");
                        i8.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DETAILED FIELD OF EDUCATION OF THE LAST AND HIGHEST ACADEMIC QUALIFICATION YOU WILL COMPLETE":
                        i9.Attributes.Add("style", "display:block;");
                        i9.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DATE YOU INTEND TO START YOUR NEXT STUDIES":
                        i10.Attributes.Add("style", "display:block;");
                        i10.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF Institution YOU ARE APPLYING TO  ":
                        icuniversityname.Attributes.Add("style", "display:block;");
                        icuniversityname.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF THE COUNTRY WHERE YOU ARE APPLYING TO STUDY":
                        icuniversitycountry.Attributes.Add("style", "display:block;");
                        icuniversitycountry.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NAME OF THE CITY WHERE YOUR EDUCATIONAL INSTITUTION/CAMPUS IS LOCATED":
                        iceduinstitutioncity.Attributes.Add("style", "display:block;");
                        iceduinstitutioncity.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "NUMBER OF YEARS OF FULL-TIME WORK EXPERIENCE":
                        icworkexperience.Attributes.Add("style", "display:block;");
                        icworkexperience.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ARE YOU CURRENTLY WORKING IN A FULL-TIME JOB?":
                        i4.Attributes.Add("style", "display:block;");
                        i4.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "DO YOU HAVE A JOB OFFER OR GUARANTEED JOB TO RETURN TO AFTER YOU HAVE COMPLETED YOUR STUDIES?":
                        i5.Attributes.Add("style", "display:block;");
                        i5.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ARE YOU APPLYING FOR A PACKAGE YES/NO":
                        i11.Attributes.Add("style", "display:block;");
                        i11.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "WHAT PACKAGE ARE YOU APPLYING FOR":
                        i12.Attributes.Add("style", "display:block;");
                        i12.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PLEASE UPLOAD AN ELECTRONIC PHOTO FOR YOUR PROFILE PICTURE":
                        icprofilephoto.Attributes.Add("style", "display:block;");
                        icprofilephoto.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PASSPORT NUMBER":
                        i14.Attributes.Add("style", "display:block;");
                        i14.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "PLEASE UPLOAD PASSPORT COPY":
                        i15.Attributes.Add("style", "display:block;");
                        i15.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "ARE YOU USING THE SERVICES OF AN EDUCATION AGENT?":
                        icAgent.Attributes.Add("style", "display:block;");
                        icAgent.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "AGENT NAME":
                        icAgentList.Attributes.Add("style", "display:block;");
                        icAgentList.Attributes.Add("data-tipso", setTooltips(fields[k]));
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
}