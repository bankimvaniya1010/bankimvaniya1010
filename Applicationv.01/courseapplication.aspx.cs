using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class courseapplication : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int universityID, userID = 0;
    string webURL = String.Empty;
    public List<CoursegridData> courses = new List<CoursegridData>();
    public List<coursemaster> appliedcourseData = new List<coursemaster>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);

        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if (!isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);

        userID = Convert.ToInt32(Session["UserID"].ToString());
        populateAppliedCourseData();
        if (!IsPostBack)
        {
            BindCountry();
            BindMajor();
            Bindlevelofstudy();
        }
    }

    private void populateAppliedCourseData()
    {
        appliedcourseData = (from am in db.applicationmaster
                             join cm in db.coursemaster on am.course equals cm.courseid
                             where am.universityid == universityID && am.applicantid == userID
                             select cm).ToList();

        HidpreferenceID.Value = (appliedcourseData.Count + 1).ToString();
    }

    private void BindGrid(int cityID, int levelofstudyID, int majorID)
    {
        try
        {
            courses = (from cm in db.coursemaster
                       join um in db.university_master on cm.universityid equals um.universityid into umdData
                       from x1 in umdData.DefaultIfEmpty()
                       join sm in db.studymodemaster on cm.modeofstudyId equals sm.id into smdData
                       from x2 in smdData.DefaultIfEmpty()
                       join ucm in db.universitycampus on universityID equals ucm.universityid into ucmdData
                       from x3 in ucmdData.DefaultIfEmpty()
                       join citym in db.citymaster on x3.cityid equals citym.city_id into cityData
                       from x4 in cityData.DefaultIfEmpty()
                       join countrym in db.countriesmaster on x4.country_id equals countrym.id into countryData
                       from x5 in countryData.DefaultIfEmpty()
                       join sl in db.studylevelmaster on cm.levelofstudyId equals sl.studylevelid into sldData
                       from x6 in sldData.DefaultIfEmpty()
                       join major in db.majordiscipline_master on cm.majordisciplineId equals major.id into majorData
                       from x7 in majorData.DefaultIfEmpty()
                       join currency in db.currency_master on cm.currencyid equals currency.id into currencyData
                       from x8 in currencyData.DefaultIfEmpty()
                       where cm.universityid == universityID && cm.isactive == true
                       select new CoursegridData()
                       {
                           id = cm.courseid,
                           coursename = cm.coursename,
                           universityname = x1.university_name,
                           universityid = x1.universityid,
                           campus = x3.campusname,
                           campusid = x3.campusid,
                           campuscityID = x3.cityid,
                           campuscityname = x4.name,
                           campuscontryID = x4.country_id,
                           campuscountryName = x5.country_name,
                           modeofstudy = x2.description,
                           modeofstudyid = x2.id,
                           coursefee = cm.coursefee,
                           levelodstudyID = cm.levelofstudyId,
                           levelodstudy = x6.studylevel,
                           major = x7.description,
                           majorID = cm.majordisciplineId,
                           currencysymbol = x8.currency_symbol,

                       }).ToList();
            if (cityID != 0)
                courses.RemoveAll(x => x.campuscityID != cityID);
            if (levelofstudyID != 0)
                courses.RemoveAll(x => x.levelodstudyID != levelofstudyID);
            if (majorID != 0)
                courses.RemoveAll(x => x.majorID != majorID);

            courseGridView.DataSource = courses;
            courseGridView.DataBind();
            Hidresultcount.Value = Convert.ToString(courses.Count);
            lblresultcount.InnerText = Hidresultcount.Value;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindMajor()
    {
        try
        {
            ListItem lst = new ListItem("All", "0");
            var major = (from md in db.majordiscipline_master
                         join umd in db.universitywisemastermapping on md.id equals umd.mastervalueid into umdData
                         from x1 in umdData.DefaultIfEmpty()
                         join mn in db.master_name on x1.masterid equals mn.masterid into mnData
                         from x in mnData.DefaultIfEmpty()
                         where (x1.universityid == universityID && x.mastername.ToUpper().Contains("Major Discipline Master"))
                         select new
                         {
                             description = md.description,
                             id = md.id,
                         }).ToList();

            rblmajor.DataSource = major;
            rblmajor.DataTextField = "description";
            rblmajor.DataValueField = "id";
            rblmajor.DataBind();
            rblmajor.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void Bindlevelofstudy()
    {
        try
        {
            ListItem lst = new ListItem("All", "0");
            var levelofstudyList = (from slm in db.studylevelmaster
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
            rbllevelofstudy.DataSource = levelofstudyList;
            rbllevelofstudy.DataTextField = "studylevel";
            rbllevelofstudy.DataValueField = "studylevelid";
            rbllevelofstudy.DataBind();
            rbllevelofstudy.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCountry()
    {
        try
        {
            ListItem lst = new ListItem("All", "0");
            var country = (from cm in db.countriesmaster
                           join unicampus in db.universitycampus on universityID equals unicampus.universityid
                           join city in db.citymaster on unicampus.cityid equals city.city_id
                           where city.country_id == cm.id
                           select new
                           {
                               country_name = cm.country_name,
                               id = cm.id
                           }).ToList().Distinct();

            rblcountry.DataSource = country;
            rblcountry.DataTextField = "country_name";
            rblcountry.DataValueField = "id";
            rblcountry.DataBind();
            rblcountry.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCourseDetails(int courseid)
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Utility.GetUniversityId();
        var temp = (from cm in db1.coursemaster
                    join um in db1.university_master on cm.universityid equals um.universityid
                    where cm.universityid == universityID1 && cm.courseid == courseid
                    select new
                    {
                        coursedescription = string.IsNullOrEmpty(cm.coursedescription) ? "Not set" : cm.coursedescription,
                        courseduration = string.IsNullOrEmpty(cm.courseduration) ? "Not set" : cm.courseduration,
                        courseurl = string.IsNullOrEmpty(cm.courseurl) ? "#" : cm.courseurl,
                        eligibility = string.IsNullOrEmpty(cm.courseeligibility) ? "No Eligibility" : cm.courseeligibility.Replace(Environment.NewLine, "<br />"),
                        university_name = um.university_name,

                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetcareerOutcomes(int courseid)
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Utility.GetUniversityId();
        var temp = (from cm in db1.careerposition_course_mapping
                    join om in db1.careeroutcomes_master on cm.careeroutcomeId equals om.careerID into outcomeData
                    from x1 in outcomeData.DefaultIfEmpty()
                    join pm in db1.careeroutcomes_position_master on cm.positionID equals pm.careerpositionID
                    where cm.courseID == courseid
                    select new
                    {
                        Careeroutcome = x1.description,
                        Careeroutcomepositions = pm.description
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCommenceDateDropdown(int courseid)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.course_dates.Where(x => x.courseid == courseid && x.commencementdate > DateTime.Now).OrderBy(x => x.commencementdate).ToList().Select(x => new { commencementdate = x.commencementdate.ToString("dd/MMM/yyyy"), x.id });
        return JsonConvert.SerializeObject(temp);
    }

    protected void btnsearchcourse_Click(object sender, EventArgs e)
    {
        //to bind grid
        int CountryID = Convert.ToInt32(HidselectedcountryID.Value);
        int CityID = Convert.ToInt32(HidselectedcityID.Value);
        int levelodstudyID = Convert.ToInt32(HidselectedstudylevelID.Value);
        int majorID = Convert.ToInt32(HidselectedmajorID.Value);

        coursegrid.Attributes.Add("style", "display:block");
        BindGrid(CityID, levelodstudyID, majorID);

        //statusbar
        selectedcountry.InnerText = HidselectedcountryName.Value;
        selectedcity.InnerText = HidselectedcityName.Value;
        selectedstudylevel.InnerText = HidselectedstudylevelName.Value;
        selectedmajor.InnerText = HidselectedmajorName.Value;
        Hidresultcount.Value = Convert.ToString(courses.Count);
        lblresultcount.InnerText = Hidresultcount.Value;

        populateAppliedCourseData();
    }

    protected void savedata_Click(object sender, EventArgs e)
    {
        try
        {
            applicationmaster objapplicationmaster = new applicationmaster();

            objapplicationmaster.college_universityname = HidInstitutionId.Value;
            objapplicationmaster.campus = Convert.ToInt32(HidCampusID.Value);
            objapplicationmaster.city = Convert.ToInt32(HidCampusCityID.Value);
            objapplicationmaster.country = Convert.ToInt32(HidCampusCountryID.Value);
            objapplicationmaster.modeofstudy = Convert.ToInt32(HidstudymodeID.Value);
            objapplicationmaster.majorofdiscipline = Convert.ToInt32(HidMajorID.Value);
            objapplicationmaster.coursetype = Convert.ToInt32(HidStudylevelID.Value);
            objapplicationmaster.course = Convert.ToInt32(HidCourseid.Value);
            objapplicationmaster.commencementdate = HidSelectedDateID.Value;
            objapplicationmaster.preferenceid = Convert.ToInt32(HidpreferenceID.Value);
            if (yesRB.Checked == true)
                objapplicationmaster.eligibility_response = 1;
            else
                objapplicationmaster.eligibility_response = 0;
            objapplicationmaster.applicantid = userID;
            objapplicationmaster.universityid = universityID;
            objapplicationmaster.current_status = 1;
            db.applicationmaster.Add(objapplicationmaster);
            db.SaveChanges();

            //clearselection of grid radiobutton
            for (int i = 0; i <= courseGridView.Rows.Count - 1; i++)
            {
                RadioButton rdbChoice = (RadioButton)courseGridView.Rows[i].FindControl("selectedRB");
                rdbChoice.Checked = false;
            }
            recordsaveDateTime.Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm");
            int? remainingcoursecount = 5 - objapplicationmaster.preferenceid;
            if (remainingcoursecount != 0)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Course Application for " + Hidcoursename.Value + " at " + HidUniversityName.Value + "," + HidCampusname.Value + " for commencement date " + HidSelectedDateText.Value + " has been sucessfully submitted on " + recordsaveDateTime.Value + ". You can submit " + remainingcoursecount + " more applications.')", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Course Application for " + Hidcoursename.Value + " at " + HidUniversityName.Value + "," + HidCampusname.Value + " for commencement date " + HidSelectedDateText.Value + " has been sucessfully submitted on " + recordsaveDateTime.Value + ".Course Application limit Exhausted.')", true);
            populateAppliedCourseData();
            BindCountry();
            Bindlevelofstudy();
            BindMajor();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void courseGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        courseGridView.PageIndex = e.NewPageIndex;
        coursegrid.Attributes.Add("style", "display:block");        
        BindGrid(Convert.ToInt32(HidselectedcityID.Value), Convert.ToInt32(HidselectedstudylevelID.Value), Convert.ToInt32(HidselectedmajorID.Value));
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCityDropdown(int countryId)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();
        List<cityData> cityList = new List<cityData>();

        if (countryId != 0)
            cityList = (from cm in db1.citymaster
                        join unicampus in db1.universitycampus on universityID1 equals unicampus.universityid
                        where cm.city_id == unicampus.cityid && cm.country_id == countryId
                        select new cityData()
                        {
                            name = cm.name,
                            city_id = cm.city_id
                        }).Distinct().ToList();
        else
            cityList = (from cm in db1.citymaster
                        join unicampus in db1.universitycampus on universityID1 equals unicampus.universityid
                        where cm.city_id == unicampus.cityid
                        select new cityData()
                        {
                            name = cm.name,
                            city_id = cm.city_id
                        }).Distinct().ToList();
        cityList.Add(new cityData { name = "All", city_id = 0 });
        return JsonConvert.SerializeObject(cityList.OrderBy(x => x.city_id));
    }
   
    public class cityData
    {
        public int city_id { get; set; }
        public string name { get; set; }

        public cityData()
        {
            this.city_id = -1;
            this.name = string.Empty;

        }
    }

    public class CoursegridData
    {
        public int id { get; set; }
        public string coursename { get; set; }
        public string universityname { get; set; }
        public int universityid { get; set; }
        public string campus { get; set; }
        public int campusid { get; set; }
        public int campuscityID { get; set; }
        public string campuscityname { get; set; }
        public int campuscontryID { get; set; }
        public string campuscountryName { get; set; }
        public string modeofstudy { get; set; }
        public int modeofstudyid { get; set; }
        public decimal? coursefee { get; set; }
        public int? levelodstudyID { get; set; }
        public string levelodstudy { get; set; }
        public string major { get; set; }
        public int? majorID { get; set; }
        public string currencysymbol { get; set; }


        public CoursegridData()
        {
            this.id = -1;
            this.coursename = string.Empty;
            this.universityname = string.Empty;
            this.campuscityname = string.Empty;
            this.campus = string.Empty;
            this.campuscountryName = string.Empty;
            this.modeofstudy = string.Empty;
            this.levelodstudy = string.Empty;
            this.major = string.Empty;
            this.universityid = -1;
            this.campusid = -1;
            this.campuscityID = -1;
            this.campuscontryID = -1;
            this.modeofstudyid = -1;
            this.levelodstudyID = null;
            this.majorID = null;
            this.coursefee = null;
            this.currencysymbol = null;
        }
    }
}