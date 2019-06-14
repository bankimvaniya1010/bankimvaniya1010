using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantcourse : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    private static GTEEntities dbCon = new GTEEntities();
    int universityID, userID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
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
        }
    }
    private void BindCourseType(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var coursestype = (from ctm in db.coursetypemaster
                               where ctm.universityid == universityID
                               select new
                               {
                                   coursetypename = ctm.coursetypename,
                                   coursetypeid = ctm.coursetypeid
                               }).ToList();
            ddl.DataSource = coursestype;
            ddl.DataTextField = "coursetypename";
            ddl.DataValueField = "coursetypeid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCourses( DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var courses = (from cm in db.coursemaster
                           join md in db.majordiscipline_master on cm.majordisciplineId equals md.id
                           where md.universityid == universityID
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
            ListItem lst = new ListItem(" select University", "0");
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

    protected void ddlCollege1_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity(ddlCity1);
        BindCampus(ddlCampus1);
        BindCountry(ddlCountry1);
        BindMajor(ddlMajor1);
        BindMode(ddlmode1);
    }
    protected void ddlCollege2_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity(ddlCity2);
        BindCampus(ddlCampus2);
        BindCountry(ddlCountry2);
        BindMajor(ddlMajor2);
        BindMode(ddlMode2);
    }
    protected void ddlCollege3_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity(ddlCity3);
        BindCampus(ddlCampus3);
        BindCountry(ddlCountry3);
        BindMajor(ddlMajor3);
        BindMode(ddlMode3);
    }
    protected void ddlCollege4_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity(ddlCity4);
        BindCampus(ddlCampus4);
        BindCountry(ddlCountry4);
        BindMajor(ddlMajor4);
        BindMode(ddlMode4);
    }
    protected void ddlCollege5_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity(ddlCity5);
        BindCampus(ddlCampus5);
        BindCountry(ddlCountry5);
        BindMajor(ddlMajor5);
        BindMode(ddlMode5);
    }


    protected void ddlMajor1_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourses(ddlCourse1);
    }
    protected void ddlMajor2_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourses(ddlCourse2);
    }
    protected void ddlMajor3_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourses(ddlCourse3);
    }
    protected void ddlMajor4_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourses(ddlCourse4);
    }
    protected void ddlMajor5_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourses(ddlCourse5);
    }




}