using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantcourse : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    private GTEEntities db = new GTEEntities();
    private static GTEEntities dbCon = new GTEEntities();
    int universityID, userID = 0;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if (!isDeclarationCompleted)
            Response.Redirect(webURL + "default.aspx", true);
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            second.Attributes.Add("style", "display:none;");
            third.Attributes.Add("style", "display:none;");
            four.Attributes.Add("style", "display:none;");
            five.Attributes.Add("style", "display:none;");

            BindUniversities(ddlCollege1);
            BindCourseType(ddlCourseType1);

            BindUniversities(ddlCollege2);
            BindCourseType(ddlcoursetype2);

            BindUniversities(ddlCollege3);
            BindCourseType(ddlcoursetype3);

            BindUniversities(ddlCollege4);
            BindCourseType(ddlcoursetype4);

            BindUniversities(ddlCollege5);
            BindCourseType(ddlcoursetype5);
            PopulateAppllicationInfo();

        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCityDropdown()
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var temp = (from cm in db1.citymaster
                    join um in db1.university_master on cm.city_id equals um.cityid
                    where um.universityid == universityID1
                    select new
                    {
                        description = cm.description,
                        city_id = cm.city_id
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCampusDropdown()
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var temp = (from uc in db1.universitycampus
                    where uc.universityid == universityID1
                    select new
                    {
                        campusname = uc.campusname,
                        campusid = uc.campusid
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCountryDropdown()
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var temp = (from cm in db1.countriesmaster
                    join um in db1.university_master on cm.id equals um.countryid
                    where um.universityid == universityID1
                    select new
                    {
                        country_name = cm.country_name,
                        id = cm.id
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetMajorDropdown()
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var temp = (from md in db1.majordiscipline_master
                    where md.universityid == universityID1
                    select new
                    {
                        description = md.description,
                        id = md.id
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetModeDropdown()
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var temp = (from sd in db1.studymodemaster
                    where sd.universityid == universityID1
                    select new
                    {
                        description = sd.description,
                        id = sd.id
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCourseDropdown(int coursetypeid,int modeofstudyid ,int selectedMajorid)
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());        
        var temp = (from cm in db1.coursemaster
                    where cm.majordisciplineId == selectedMajorid && cm.modeofstudyId == modeofstudyid && cm.levelofstudyId == coursetypeid
                    select new
                    {
                        coursename = cm.coursename,
                        courseid = cm.courseid
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }    


    private void BindCourseType(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var coursestype = db.studylevelmaster.ToList();
            ddl.DataSource = coursestype;
            ddl.DataTextField = "studylevel";
            ddl.DataValueField = "studylevelid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCourses( DropDownList ddl, int coursetypeid, int selectedMajorid , int modeofstudyid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var courses = (from cm in db.coursemaster
                           where cm.majordisciplineId == selectedMajorid && cm.modeofstudyId == modeofstudyid && cm.levelofstudyId == coursetypeid
                           select new
                           {
                               coursename = cm.coursename,
                               courseid = cm.courseid
                           }).ToList();
            ddl.DataSource = courses;
            ddl.DataTextField = "coursename";
            ddl.DataValueField = "courseid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);

            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindMajor(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var major = (from md in db.majordiscipline_master
                         where md.universityid == universityID
                         select new
                         {
                             description = md.description,
                             id = md.id
                         }).ToList();
            ddl.DataSource = major;
            ddl.DataTextField = "description";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);

          
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindMode(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("select Study Mode", "0");
            var mode = (from sd in db.studymodemaster
                        where sd.universityid == universityID
                        select new
                        {
                            description = sd.description,
                            id = sd.id
                        }).ToList();
            ddl.DataSource = mode;
            ddl.DataTextField = "description";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);

            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCampus(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("select Campus", "0");
            var campus = (from uc in db.universitycampus
                          where uc.universityid == universityID
                          select new
                          {
                              campusname = uc.campusname,
                              campusid = uc.campusid
                          }).ToList();                       
            ddl.DataSource = campus;
            ddl.DataTextField = "campusname";
            ddl.DataValueField = "campusid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCity(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("select City", "0");
            var campus = (from cm in db.citymaster
                          join um in db.university_master on cm.city_id equals um.cityid
                          where um.universityid == universityID
                          select new
                          {
                              description = cm.description,
                              city_id = cm.city_id
                          }).ToList();
          
            ddl.DataSource = campus;
            ddl.DataTextField = "description";
            ddl.DataValueField = "city_id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCountry(DropDownList ddl)
    {
        try
        {
            
           
            ListItem lst = new ListItem("select Country", "0");

            var campus = (from cm in db.countriesmaster
                          join um in db.university_master on cm.id equals um.countryid
                          where um.universityid == universityID
                          select new
                          {
                              country_name = cm.country_name,
                              id = cm.id
                          }).ToList();

            ddl.DataSource = campus;
            ddl.DataTextField = "country_name";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0,lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindUniversities(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem(" Select University", "0");
            var universities = (from um in db.university_master
                                join am in db.applicantdetails on um.universityid equals am.universityid 
                                where am.applicantid == userID && um.universityid == universityID
                                select new
                                {
                                    university_name = um.university_name,
                                    universityid = um.universityid
                                }).ToList();

            ddl.DataSource = universities;
            ddl.DataTextField = "university_name";
            ddl.DataValueField = "universityid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulateAppllicationInfo()
    {
        try
        {
            var applications = (from fInfo in db.applicationmaster
                              where fInfo.applicantid == userID && fInfo.universityid == universityID
                              select fInfo).ToList();
            //Preference 1
            for (var i = 0; i < applications.Count; i++)
            {
                var courseInfo = applications[i];
                if (courseInfo.preferenceid == 1)
                {
                    if (courseInfo.college_universityname != null)
                    {
                        ddlCollege1.ClearSelection();
                        ddlCollege1.Items.FindByValue(courseInfo.college_universityname.ToString()).Selected = true;
                    }
                    if (courseInfo.campus != null)
                    {
                        BindCampus(ddlCampus1);
                        ddlCampus1.Items.FindByValue(courseInfo.campus.ToString()).Selected = true;
                        hidCampusField1.Value = courseInfo.campus.ToString();
                    }
                    if (courseInfo.city != null)
                    {
                        BindCity(ddlCity1);
                        ddlCity1.Items.FindByValue(courseInfo.city.ToString()).Selected = true;
                        hidCityField1.Value = courseInfo.city.ToString();
                    }
                    if (courseInfo.country != null)
                    {
                        BindCountry(ddlCountry1);
                        ddlCountry1.Items.FindByValue(courseInfo.country.ToString()).Selected = true;
                        hidCountryField1.Value = courseInfo.country.ToString();
                    }
                    if (courseInfo.modeofstudy != null)
                    {
                        BindMode(ddlmode1);
                        ddlmode1.Items.FindByValue(courseInfo.modeofstudy.ToString()).Selected = true;
                        hidModeField1.Value = courseInfo.modeofstudy.ToString();
                    }
                    if (courseInfo.majorofdiscipline != null)
                    {
                        BindMajor(ddlMajor1);
                        ddlMajor1.Items.FindByValue(courseInfo.majorofdiscipline.ToString()).Selected = true;
                        HidMajorField1.Value = courseInfo.majorofdiscipline.ToString();
                    }
                    if (courseInfo.coursetype != null)
                    {
                        BindCourseType(ddlCourseType1);
                        ddlCourseType1.ClearSelection();
                        ddlCourseType1.Items.FindByValue(courseInfo.coursetype.ToString()).Selected = true;
                    }
                    if (courseInfo.course != null)
                    {
                        BindCourses(ddlCourse1,Convert.ToInt32(ddlCourseType1.SelectedValue), Convert.ToInt32(ddlMajor1.SelectedValue), Convert.ToInt32(ddlmode1.SelectedValue));
                        ddlCourse1.Items.FindByValue(courseInfo.course.ToString()).Selected = true;
                        hidCourseField1.Value = courseInfo.course.ToString();
                    }
                    //txtCommencementdate1.Value = Convert.ToDateTime(courseInfo.commencementdate).ToString("yyyy-MM-dd");
                    if (courseInfo.commencementdate != null)
                    {
                        ddlCommencementdate.ClearSelection();
                        ddlCommencementdate.Items.FindByValue(courseInfo.commencementdate.ToString()).Selected = true;
                    }
                }

                // Preference 2
                if (courseInfo.preferenceid == 2)
                {
                    second.Attributes.Add("style", "display:block;");
                    if (courseInfo.college_universityname != null)
                    {
                        ddlCollege2.ClearSelection();
                        ddlCollege2.Items.FindByValue(courseInfo.college_universityname.ToString()).Selected = true;
                    }
                    if (courseInfo.campus != null)
                    {
                        BindCampus(ddlCampus2);
                        ddlCampus2.ClearSelection();
                        ddlCampus2.Items.FindByValue(courseInfo.campus.ToString()).Selected = true;
                        hidCampusField2.Value = courseInfo.college_universityname.ToString();
                    }
                    if (courseInfo.city != null)
                    {
                        BindCity(ddlCity2);
                        ddlCity2.ClearSelection();
                        ddlCity2.Items.FindByValue(courseInfo.city.ToString()).Selected = true;
                        hidCityField2.Value = courseInfo.city.ToString();
                    }
                    if (courseInfo.country != null)
                    {

                        BindCountry(ddlCountry2);
                        ddlCountry2.ClearSelection();
                        ddlCountry2.Items.FindByValue(courseInfo.country.ToString()).Selected = true;
                        hidCountryField2.Value = courseInfo.country.ToString();
                    }
                    if (courseInfo.modeofstudy != null)
                    {

                        BindMode(ddlMode2);
                        ddlMode2.ClearSelection();
                        ddlMode2.Items.FindByValue(courseInfo.modeofstudy.ToString()).Selected = true;
                        hidModeField2.Value = courseInfo.modeofstudy.ToString();
                    }
                    if (courseInfo.majorofdiscipline != null)
                    {

                        BindMajor(ddlMajor2);
                        ddlMajor2.ClearSelection();
                        ddlMajor2.Items.FindByValue(courseInfo.majorofdiscipline.ToString()).Selected = true;
                        hidMajorField2.Value = courseInfo.majorofdiscipline.ToString();
                    }
                    if (courseInfo.coursetype != null)
                    {
                        BindCourseType(ddlcoursetype2);
                        ddlcoursetype2.ClearSelection();
                        ddlcoursetype2.Items.FindByValue(courseInfo.coursetype.ToString()).Selected = true;
                    }
                    if (courseInfo.course != null)
                    {
                        BindCourses(ddlCourse2, Convert.ToInt32(ddlcoursetype2.SelectedValue), Convert.ToInt32(ddlMajor2.SelectedValue), Convert.ToInt32(ddlMode2.SelectedValue));
                        ddlCourse2.ClearSelection();
                        ddlCourse2.Items.FindByValue(courseInfo.course.ToString()).Selected = true;
                        hidCourseField2.Value = courseInfo.course.ToString();
                    }
                    //txtCommencementdate2.Value = Convert.ToDateTime(courseInfo.commencementdate).ToString("yyyy-MM-dd");
                    if (courseInfo.commencementdate != null)
                    {
                        ddlCommencementdate2.ClearSelection();
                        ddlCommencementdate2.Items.FindByValue(courseInfo.commencementdate.ToString()).Selected = true;
                    }
                }

                // Preference 3
                if (courseInfo.preferenceid == 3)
                {
                    third.Attributes.Add("style", "display:block;");
                    if (courseInfo.college_universityname != null)
                    {
                        ddlCollege3.ClearSelection();
                        ddlCollege3.Items.FindByValue(courseInfo.college_universityname.ToString()).Selected = true;
                    }
                    if (courseInfo.campus != null)
                    {
                        BindCampus(ddlCampus3);
                        ddlCampus3.ClearSelection();
                        ddlCampus3.Items.FindByValue(courseInfo.campus.ToString()).Selected = true;
                        hidCampusField3.Value = courseInfo.campus.ToString();
                    }
                    if (courseInfo.city != null)
                    {
                        BindCity(ddlCity3);
                        ddlCity3.ClearSelection();
                        ddlCity3.Items.FindByValue(courseInfo.city.ToString()).Selected = true;
                        hidCityField3.Value = courseInfo.city.ToString();
                    }
                    if (courseInfo.country != null)
                    {

                        BindCountry(ddlCountry3);
                        ddlCountry3.ClearSelection();
                        ddlCountry3.Items.FindByValue(courseInfo.country.ToString()).Selected = true;
                        hidCountryField3.Value = courseInfo.country.ToString();
                    }
                    if (courseInfo.modeofstudy != null)
                    {

                        BindMode(ddlMode3);
                        ddlMode3.ClearSelection();
                        ddlMode3.Items.FindByValue(courseInfo.modeofstudy.ToString()).Selected = true;
                        hidModeField3.Value = courseInfo.modeofstudy.ToString();
                    }
                    if (courseInfo.majorofdiscipline != null)
                    {

                        BindMajor(ddlMajor3);
                        ddlMajor3.ClearSelection();
                        ddlMajor3.Items.FindByValue(courseInfo.majorofdiscipline.ToString()).Selected = true;
                        hidMajorField3.Value = courseInfo.majorofdiscipline.ToString();
                    }
                    if (courseInfo.coursetype != null)
                    {
                        BindCourseType(ddlcoursetype3);
                        ddlcoursetype3.ClearSelection();
                        ddlcoursetype3.Items.FindByValue(courseInfo.coursetype.ToString()).Selected = true;
                    }
                    if (courseInfo.course != null)
                    {
                        BindCourses(ddlCourse3, Convert.ToInt32(ddlcoursetype3.SelectedValue), Convert.ToInt32(ddlMajor3.SelectedValue), Convert.ToInt32(ddlMode3.SelectedValue));
                        ddlCourse3.ClearSelection();
                        ddlCourse3.Items.FindByValue(courseInfo.course.ToString()).Selected = true;
                        hidCourseField3.Value = courseInfo.course.ToString();
                    }
                    //txtCommencementdate3.Value = Convert.ToDateTime(courseInfo.commencementdate).ToString("yyyy-MM-dd");
                    if (courseInfo.commencementdate != null)
                    {
                        ddlCommencementdate3.ClearSelection();
                        ddlCommencementdate3.Items.FindByValue(courseInfo.commencementdate.ToString()).Selected = true;
                    }
                }

                // Preference 4
                if (courseInfo.preferenceid == 4)
                {
                    four.Attributes.Add("style", "display:block;");
                    if (courseInfo.college_universityname != null)
                    {
                        ddlCollege4.ClearSelection();
                        ddlCollege4.Items.FindByValue(courseInfo.college_universityname.ToString()).Selected = true;
                    }
                    if (courseInfo.campus != null)
                    {
                        BindCampus(ddlCampus4);
                        ddlCampus4.ClearSelection();
                        ddlCampus4.Items.FindByValue(courseInfo.campus.ToString()).Selected = true;
                        hidCampusField4.Value = courseInfo.campus.ToString();
                    }
                    if (courseInfo.city != null)
                    {
                        BindCity(ddlCity4);
                        ddlCity4.ClearSelection();
                        ddlCity4.Items.FindByValue(courseInfo.city.ToString()).Selected = true;
                        hidCityField4.Value = courseInfo.city.ToString();
                    }
                    if (courseInfo.country != null)
                    {

                        BindCountry(ddlCountry4);
                        ddlCountry4.ClearSelection();
                        ddlCountry4.Items.FindByValue(courseInfo.country.ToString()).Selected = true;
                        hidCountryField4.Value = courseInfo.country.ToString();
                    }
                    if (courseInfo.modeofstudy != null)
                    {

                        BindMode(ddlMode4);
                        ddlMode4.ClearSelection();
                        ddlMode4.Items.FindByValue(courseInfo.modeofstudy.ToString()).Selected = true;
                        hidModeField4.Value = courseInfo.modeofstudy.ToString();
                    }
                    if (courseInfo.majorofdiscipline != null)
                    {

                        BindMajor(ddlMajor4);
                        ddlMajor4.ClearSelection();
                        ddlMajor4.Items.FindByValue(courseInfo.majorofdiscipline.ToString()).Selected = true;
                        hidMajorField4.Value = courseInfo.majorofdiscipline.ToString();
                    }
                    if (courseInfo.coursetype != null)
                    {
                        BindCourseType(ddlcoursetype4);
                        ddlcoursetype4.ClearSelection();
                        ddlcoursetype4.Items.FindByValue(courseInfo.coursetype.ToString()).Selected = true;
                    }
                    if (courseInfo.course != null)
                    {
                        BindCourses(ddlCourse4, Convert.ToInt32(ddlcoursetype4.SelectedValue), Convert.ToInt32(ddlMajor4.SelectedValue), Convert.ToInt32(ddlMode4.SelectedValue));
                        ddlCourse4.ClearSelection();
                        ddlCourse4.Items.FindByValue(courseInfo.course.ToString()).Selected = true;
                        hidCourseField4.Value = courseInfo.course.ToString();
                    }
                    //txtCommencementdate4.Value = Convert.ToDateTime(courseInfo.commencementdate).ToString("yyyy-MM-dd");
                    if (courseInfo.commencementdate != null)
                    {
                        ddlCommencementdate4.ClearSelection();
                        ddlCommencementdate4.Items.FindByValue(courseInfo.commencementdate.ToString()).Selected = true;
                    }
                }

                // Preference 5
                if (courseInfo.preferenceid == 5)
                {
                    four.Attributes.Add("style", "display:block;");
                    if (courseInfo.college_universityname != null)
                    {
                        ddlCollege5.ClearSelection();
                        ddlCollege5.Items.FindByValue(courseInfo.college_universityname.ToString()).Selected = true;
                    }
                    if (courseInfo.campus != null)
                    {
                        BindCampus(ddlCampus5);
                        ddlCampus5.ClearSelection();
                        ddlCampus5.Items.FindByValue(courseInfo.campus.ToString()).Selected = true;
                        hidCampusField5.Value = courseInfo.campus.ToString();
                    }
                    if (courseInfo.city != null)
                    {
                        BindCity(ddlCity5);
                        ddlCity5.ClearSelection();
                        ddlCity5.Items.FindByValue(courseInfo.city.ToString()).Selected = true;
                        hidCityField5.Value = courseInfo.city.ToString();
                    }
                    if (courseInfo.country != null)
                    {

                        BindCountry(ddlCountry5);
                        ddlCountry5.ClearSelection();
                        ddlCountry5.Items.FindByValue(courseInfo.country.ToString()).Selected = true;
                        hidCountryField5.Value = courseInfo.country.ToString();
                    }
                    if (courseInfo.modeofstudy != null)
                    {

                        BindMode(ddlMode5);
                        ddlMode5.ClearSelection();
                        ddlMode5.Items.FindByValue(courseInfo.modeofstudy.ToString()).Selected = true;
                        hidModeField5.Value = courseInfo.modeofstudy.ToString();
                    }
                    if (courseInfo.majorofdiscipline != null)
                    {

                        BindMajor(ddlMajor5);
                        ddlMajor5.ClearSelection();
                        ddlMajor5.Items.FindByValue(courseInfo.majorofdiscipline.ToString()).Selected = true;
                        hidMajorField5.Value = courseInfo.majorofdiscipline.ToString();
                    }
                    if (courseInfo.coursetype != null)
                    {
                        BindCourseType(ddlcoursetype5);
                        ddlcoursetype5.ClearSelection();
                        ddlcoursetype5.Items.FindByValue(courseInfo.coursetype.ToString()).Selected = true;
                    }
                    if (courseInfo.course != null)
                    {
                        BindCourses(ddlCourse5, Convert.ToInt32(ddlcoursetype5.SelectedValue), Convert.ToInt32(ddlMajor5.SelectedValue), Convert.ToInt32(ddlMode5.SelectedValue));
                        ddlCourse5.ClearSelection();
                        ddlCourse5.Items.FindByValue(courseInfo.course.ToString()).Selected = true;
                        hidCourseField5.Value = courseInfo.course.ToString();
                    }
                    //txtCommencementdate5.Value = Convert.ToDateTime(courseInfo.commencementdate).ToString("yyyy-MM-dd");
                    if (courseInfo.commencementdate != null)
                    {
                        ddlCommencementdate5.ClearSelection();
                        ddlCommencementdate5.Items.FindByValue(courseInfo.commencementdate.ToString()).Selected = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    private void SaveApplicantPreference(int preferenceid, string collegename,int campus, int city, int country, int modeofstudy, int majorofdiscipline, int coursetype, int course, string commencementdate)
    {
        try
        { 
            var mode = "new";
            var courseInfo = (from fInfo in db.applicationmaster
                              where fInfo.applicantid == userID && fInfo.universityid == universityID && fInfo.preferenceid == preferenceid
                              select fInfo).FirstOrDefault();
            applicationmaster objapplicationmaster = new applicationmaster();
            if (courseInfo != null)
            {
                mode = "update";
                objapplicationmaster = courseInfo;
            }
            objapplicationmaster.college_universityname = collegename;
            objapplicationmaster.campus = campus;
            objapplicationmaster.city = city;
            objapplicationmaster.country = country;
            objapplicationmaster.modeofstudy = modeofstudy;
            objapplicationmaster.majorofdiscipline = majorofdiscipline;
            objapplicationmaster.coursetype = coursetype;
            objapplicationmaster.course = course;
            objapplicationmaster.commencementdate = commencementdate;
            objapplicationmaster.preferenceid = preferenceid;
            objapplicationmaster.applicantid = userID;
            objapplicationmaster.universityid = universityID;
            if (mode == "new")
                db.applicationmaster.Add(objapplicationmaster);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_coursedetail_Click(object sender, EventArgs e)
    {
        try
        {                  
            SaveApplicantPreference(1, ddlCollege1.SelectedValue, Convert.ToInt32(hidCampusField1.Value) , Convert.ToInt32(hidCityField1.Value), Convert.ToInt32(hidCountryField1.Value), Convert.ToInt32(hidModeField1.Value), Convert.ToInt32(HidMajorField1.Value), Convert.ToInt32(ddlCourseType1.SelectedValue), Convert.ToInt32(hidCourseField1.Value), ddlCommencementdate.SelectedValue);
            if (Convert.ToInt16(ddlCollege2.SelectedValue.ToString()) > 0)
                SaveApplicantPreference(2, ddlCollege2.SelectedValue, Convert.ToInt32(hidCampusField2.Value), Convert.ToInt32(hidCityField2.Value), Convert.ToInt32(hidCountryField2.Value), Convert.ToInt32(hidModeField2.Value), Convert.ToInt32(hidMajorField2.Value), Convert.ToInt32(ddlcoursetype2.SelectedValue), Convert.ToInt32(hidCourseField2.Value), ddlCommencementdate2.SelectedValue);
            if (Convert.ToInt16(ddlCollege3.SelectedValue.ToString()) > 0)
                SaveApplicantPreference(3, ddlCollege3.SelectedValue, Convert.ToInt32(hidCampusField3.Value), Convert.ToInt32(hidCityField3.Value), Convert.ToInt32(hidCountryField3.Value), Convert.ToInt32(hidModeField3.Value), Convert.ToInt32(hidMajorField3.Value), Convert.ToInt32(ddlcoursetype3.SelectedValue), Convert.ToInt32(hidCourseField3.Value), ddlCommencementdate3.SelectedValue);
            if (Convert.ToInt16(ddlCollege4.SelectedValue.ToString()) > 0)
                SaveApplicantPreference(4, ddlCollege4.SelectedValue, Convert.ToInt32(hidCampusField4.Value), Convert.ToInt32(hidCityField4.Value), Convert.ToInt32(hidCountryField4.Value), Convert.ToInt32(hidModeField4.Value), Convert.ToInt32(hidMajorField4.Value), Convert.ToInt32(ddlcoursetype4.SelectedValue), Convert.ToInt32(hidCourseField4.Value), ddlCommencementdate4.SelectedValue);
            if (Convert.ToInt16(ddlCollege5.SelectedValue.ToString()) > 0)
                SaveApplicantPreference(5, ddlCollege5.SelectedValue, Convert.ToInt32(hidCampusField5.Value), Convert.ToInt32(hidCityField5.Value), Convert.ToInt32(hidCountryField5.Value), Convert.ToInt32(hidModeField5.Value), Convert.ToInt32(hidMajorField5.Value), Convert.ToInt32(ddlcoursetype5.SelectedValue), Convert.ToInt32(hidCourseField5.Value), ddlCommencementdate5.SelectedValue);
            PopulateAppllicationInfo();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

}