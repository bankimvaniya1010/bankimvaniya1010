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
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    private static GTEEntities dbCon = new GTEEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourses( ddlCourse1);
            BindCourses(ddlCourse2);
            BindCourses(ddlCourse3);
            BindCourses(ddlCourse4);
            BindCourses(ddlCourse5);
            BindUniversities(ddlCollege1);
            BindUniversities(ddlCollege2);
            BindUniversities(ddlCollege3);
            BindUniversities(ddlCollege4);
            BindUniversities(ddlCollege5);
            BindMode(ddlmode1);
            BindMode(ddlMode2);
            BindMode(ddlMode3);
            BindMode(ddlMode4);
            BindMode(ddlMode5);
            FillMonth();
            FillYears();
            BindMajor(ddlMajor1);
            BindMajor(ddlMajor2);
            BindMajor(ddlMajor3);
            BindMajor(ddlMajor4);
            BindMajor(ddlMajor5);
            //Fill Years

        }
    }

    private void BindCourses( DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var courses = db.coursemaster.ToList();
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
            var major = db.majordiscipline_master.ToList();
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
            ListItem lst = new ListItem("Please select", "0");
            var mode = db.studymodemaster.ToList();
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
    private void BindUniversities(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var universities = db.university_master.ToList();
            ddl.DataSource = universities;
            ddl.DataTextField = "university_name";
            ddl.DataValueField = "universityID";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void FillYears()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            int i = DateTime.Now.Year;
            for (i = i - 1; i <= DateTime.Now.Year + 10; i++)
            {
                ddlCommenceYear1.Items.Add(Convert.ToString(i));
                ddlCommencementYear2.Items.Add(Convert.ToString(i));
                ddlCommencementYear3.Items.Add(Convert.ToString(i));
                ddlCommencementyear4.Items.Add(Convert.ToString(i));
                ddlCommencementYear5.Items.Add(Convert.ToString(i));
            }
            ddlCommenceYear1.Items.Insert(0, lst);
            ddlCommencementYear2.Items.Insert(0, lst);
            ddlCommencementYear3.Items.Insert(0, lst);
            ddlCommencementyear4.Items.Insert(0, lst);
            ddlCommencementYear5.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void FillMonth()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            //Fill Months
            for (int i = 1; i <= 12; i++)
            {
                ddlCommencementmonth1.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
                ddlCommencementMonth2.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
                ddlCommencementMonth3.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
                ddlCommencementMonth4.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
                ddlCommencementMonth5.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
            }
            ddlCommencementmonth1.Items.Insert(0, lst);
            ddlCommencementMonth2.Items.Insert(0, lst);
            ddlCommencementYear3.Items.Insert(0, lst);
            ddlCommencementMonth3.Items.Insert(0, lst);
            ddlCommencementMonth5.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    [WebMethod]
   public static string GetDropDownDataCampus(int  university)
    {
        //int id = Convert.ToInt32(university);
        var query = (from uc in dbCon.universitycampus

                     where uc.universityid == university
                     select new
                     {
                         campusid = uc.campusid,
                         campusname = uc.campusname
                     }).ToList();
        JavaScriptSerializer jscript = new JavaScriptSerializer();

        return jscript.Serialize(query);
    }
    [WebMethod]
    public static string GetDropDownDataCity(int campusId)
    {
        //int id = Convert.ToInt32(university);
        var query = (from uc in dbCon.university_campusmapping

                     where uc.campusid == campusId
                     select new
                     {
                         universitylocationid = uc.universitylocationid,
                         cityname = uc.cityname
                     }).ToList();
        JavaScriptSerializer jscript = new JavaScriptSerializer();

        return jscript.Serialize(query);
    }
    //[WebMethod]
    //public static string GetDropDownDataCountry(int campusId)
    //{
    //    var Countries = (from uc in dbCon.university_campusmapping

    //                 where uc.campusid == campusId
    //                 select new
    //                 {
    //                     countryid = uc.countryid
    //                 }).ToList();
    //    //int[] countriesID = Countries.OfType<int>();
    //    //var query = (from uc in dbCon.countriesmaster

    //    //             where Countries.Contains((int)uc.id) 
    //    //             select new
    //    //             {
    //    //                 universitylocationid = uc.universitylocationid,
    //    //                 cityname = uc.cityname
    //    //             }).ToList();
    //    JavaScriptSerializer jscript = new JavaScriptSerializer();

    //    return jscript.Serialize(query);
    //}
}