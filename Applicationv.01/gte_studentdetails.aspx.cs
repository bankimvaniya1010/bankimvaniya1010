using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gte_studentdetails : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    gte_applicantdetails objgte_applicantdetails = new gte_applicantdetails();
    bool isuniversityGroupHead;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);

        var isFullService = (bool)Session["FullService"];
        if (isFullService)
            Response.Redirect("default.aspx", true);

        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        isuniversityGroupHead = db.universitygrouping.Where(x => x.groupingheaduniversityid == universityID).ToList().Count > 0;

        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            objCom.BindCountries(ddlcountryofdob);
            objCom.BindCountries(ddlnationality);
            objCom.BindCountries(ddlspousenationality);
            objCom.BindCountries(ddlcountryresidence);
            objCom.BindCountries(ddlhighestqualificationcountry);
            BindMaritalstatus();
            Bindworkexperienceyears();
            Bindtypeofworkexperienceyears();
            FillMonth(ddlhighestqualificationmonth);
            FillYears(ddlhighestqualificationYear);
            BindMajorDiscipline(ddlhighestqualificationfield);
            BindMajorDiscipline(ddlfieldofstudy);
            Bindannualfee();
            BindstudyField(ddlhighestqualificationAchieved);
            BindstudyField(ddlcourseapplied);
            if (isuniversityGroupHead)
                BindUnivercity(universityID);
            else
            {
                universityname.Style.Add("display", "none");
                BindcityofInstitution();
            }
            populategteapplicantdetail();            
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCourseDropdown(int coursetypeid , int selectedMajorid)
    {
        GTEEntities db1 = new GTEEntities();
        var universityID1 = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var temp = (from cm in db1.coursemaster
                    where cm.majordisciplineId == selectedMajorid && cm.levelofstudyId == coursetypeid
                    select new
                    {
                        coursename = cm.coursename,
                        courseid = cm.courseid
                    }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    private void BindCourses(int coursetypeid, int selectedMajorid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var courses = (from cm in db.coursemaster
                           join md in db.majordiscipline_master on cm.majordisciplineId equals md.id                           
                           join sl in db.studylevelmaster on cm.levelofstudyId equals sl.studylevelid
                           where md.universityid == universityID && cm.majordisciplineId == selectedMajorid && cm.levelofstudyId == coursetypeid
                           select new
                           {
                               coursename = cm.coursename,
                               courseid = cm.courseid
                           }).ToList();
            ddlnameofcourse.DataSource = courses;
            ddlnameofcourse.DataTextField = "coursename";
            ddlnameofcourse.DataValueField = "courseid";
            ddlnameofcourse.DataBind();
            ddlnameofcourse.Items.Insert(0, lst);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btngteapplicantdetail_Click(object sender, EventArgs e)
    {

        try
        {
            var mode = "new";
            var studentInfo = (from pInfo in db.gte_applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            gte_applicantdetails objgte_applicantdetails = new gte_applicantdetails();
            if (studentInfo != null)
            {
                mode = "update";
                objgte_applicantdetails = studentInfo;
            }
            objgte_applicantdetails.dateofbirth = Convert.ToDateTime(txtdob.Value);
            if (ddlnationality.SelectedValue != "")
                objgte_applicantdetails.nationality = Convert.ToInt32(ddlnationality.SelectedValue);

            if (ddlcountryofdob.SelectedValue != "")
                objgte_applicantdetails.countryofbirth = Convert.ToInt32(ddlcountryofdob.SelectedValue);

            if (ddlmaritalstatus.SelectedValue != "")
                objgte_applicantdetails.maritalstatus = Convert.ToInt32(ddlmaritalstatus.SelectedValue);

            if (ddlmaritalstatus.SelectedValue.Equals("Married", StringComparison.OrdinalIgnoreCase))
            {
                objgte_applicantdetails.dateofmarriage = Convert.ToDateTime(txtmarriagedob.Value);
                if (ddlspousenationality.SelectedValue != "")
                    objgte_applicantdetails.nationalityofspouse = Convert.ToInt32(ddlspousenationality.SelectedValue);
            }
            else
            {
                objgte_applicantdetails.dateofmarriage = null;
                objgte_applicantdetails.nationalityofspouse = null;
            }

            objgte_applicantdetails.highestqualificationname = txthighestqualification.Value;

            if (ddlhighestqualificationAchieved.SelectedValue != "")
                objgte_applicantdetails.highestqualifiactionachieved = ddlhighestqualificationAchieved.SelectedValue;

            if (ddlhighestqualificationfield.SelectedValue != "")
                objgte_applicantdetails.highestqualificationfield = Convert.ToInt32(ddlhighestqualificationfield.SelectedValue);

            if ((ddlhighestqualificationmonth.SelectedValue != "") && (ddlhighestqualificationYear.SelectedValue != ""))
                objgte_applicantdetails.highestqualificationdate = ddlhighestqualificationmonth.SelectedValue + "-" + ddlhighestqualificationYear.SelectedValue;

            if (ddlhighestqualificationcountry.SelectedValue != "")
                objgte_applicantdetails.highestqualificationcountry = Convert.ToInt32(ddlhighestqualificationcountry.SelectedValue);

            if (ddlcourseapplied.SelectedValue != "")
                objgte_applicantdetails.levelofcourse = ddlcourseapplied.SelectedValue;

            if (ddlfieldofstudy.SelectedValue != "")
                objgte_applicantdetails.fieldofstudyapplied = Convert.ToInt32(ddlfieldofstudy.SelectedValue);
            objgte_applicantdetails.coursename = hidnameofcourse.Value;
            if (ddlCommencementdate.SelectedValue != "")
                objgte_applicantdetails.commencementdate = ddlCommencementdate.SelectedValue;
            //objgte_applicantdetails.commencementdate = Convert.ToDateTime(txtcommencementdate.Value);

            if (ddlworkexperience.SelectedValue != "" && Convert.ToInt32(ddlworkexperience.SelectedValue) == 1)
                objgte_applicantdetails.workexperience = 0;

            if (ddlworkexperience.SelectedValue != "" && Convert.ToInt32(ddlworkexperience.SelectedValue) != 1)
                objgte_applicantdetails.workexperience = Convert.ToInt32(ddlworkexperience.SelectedValue);

            if (ddltypeofworkexperience.SelectedValue != "")
                objgte_applicantdetails.typeofworkexperience = Convert.ToInt32(ddltypeofworkexperience.SelectedValue);


            if (ddlcountryresidence.SelectedValue != "")
                objgte_applicantdetails.residencecountry = Convert.ToInt32(ddlcountryresidence.SelectedValue);

            if (ddlannualfee.SelectedValue != "")
                objgte_applicantdetails.tuitionandlivingcost = Convert.ToInt32(ddlannualfee.SelectedValue);

            if (ddluniversityname.SelectedValue != "")
            {
                objgte_applicantdetails.nameofuniversityappliedfor = Convert.ToInt32(ddluniversityname.SelectedValue);
                objgte_applicantdetails.cityofeducationInstitution = Convert.ToInt32(hidCityField.Value);
            }
            else
            {
                objgte_applicantdetails.nameofuniversityappliedfor = universityID;
                objgte_applicantdetails.cityofeducationInstitution = Convert.ToInt32(ddleduinstitutioncity.Value);
            }

            objgte_applicantdetails.applicantid = userID;
            objgte_applicantdetails.universityid = universityID;
            if (mode == "new")
                db.gte_applicantdetails.Add(objgte_applicantdetails);
            db.SaveChanges();

            var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
            if (!isProfileDetailsCompletedByApplicant)
                Session["ProfileDetailsCompletedByApplicant"] = objCom.SetGteStudentDetailsCompletedStatus(userID, universityID);
            Response.Redirect("gte_questions1.aspx", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void populategteapplicantdetail() {
        try
        {
            var studentInfo = (from pInfo in db.gte_applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (studentInfo != null) {
                if(studentInfo.dateofbirth != null)
                    txtdob.Value = Convert.ToDateTime(studentInfo.dateofbirth).ToString("dd-MM-yyyy");
                if (studentInfo.nationality != null)
                {
                    ddlnationality.ClearSelection();
                    ddlnationality.Items.FindByValue(studentInfo.nationality.ToString()).Selected = true;
                }
                if (studentInfo.countryofbirth != null)
                {
                    ddlcountryofdob.ClearSelection();
                    ddlcountryofdob.Items.FindByValue(studentInfo.countryofbirth.ToString()).Selected = true;
                }
                if (studentInfo.maritalstatus != null)
                {
                    ddlmaritalstatus.ClearSelection();
                    ddlmaritalstatus.Items.FindByValue(studentInfo.maritalstatus.ToString()).Selected = true;
                }
                if (studentInfo.dateofmarriage != null)
                    txtmarriagedob.Value = Convert.ToDateTime(studentInfo.dateofmarriage).ToString("yyyy-MM-dd");

                if (studentInfo.nationalityofspouse != null)
                {
                    ddlspousenationality.ClearSelection();
                    ddlspousenationality.Items.FindByValue(studentInfo.nationalityofspouse.ToString()).Selected = true;
                }
                txthighestqualification.Value = studentInfo.highestqualificationname;

                if (studentInfo.highestqualifiactionachieved != null)
                {
                    ddlhighestqualificationAchieved.ClearSelection();
                    ddlhighestqualificationAchieved.Items.FindByValue(studentInfo.highestqualifiactionachieved.ToString()).Selected = true;
                }
                if (studentInfo.highestqualificationfield != null)
                {
                    ddlhighestqualificationfield.ClearSelection();
                    ddlhighestqualificationfield.Items.FindByValue(studentInfo.highestqualificationfield.ToString()).Selected = true;
                }
                if (studentInfo.highestqualificationdate != null)
                {
                    string[] highestqualificationdate = studentInfo.highestqualificationdate.ToString().Split('-');
                    ddlhighestqualificationmonth.ClearSelection();
                    ddlhighestqualificationmonth.Items.FindByValue(Convert.ToString(highestqualificationdate[0])).Selected = true;
                    ddlhighestqualificationYear.ClearSelection();
                    ddlhighestqualificationYear.Items.FindByValue(Convert.ToString(highestqualificationdate[1])).Selected = true;
                }

                if (studentInfo.highestqualificationcountry!= null)
                {
                    ddlhighestqualificationcountry.ClearSelection();
                    ddlhighestqualificationcountry.Items.FindByValue(studentInfo.highestqualificationcountry.ToString()).Selected = true;
                }

                if (studentInfo.levelofcourse != null)
                {
                    ddlcourseapplied.ClearSelection();
                    ddlcourseapplied.Items.FindByValue(studentInfo.levelofcourse.ToString()).Selected = true;
                }

                if (studentInfo.fieldofstudyapplied != null)
                {
                    ddlfieldofstudy.ClearSelection();
                    ddlfieldofstudy.Items.FindByValue(studentInfo.fieldofstudyapplied.ToString()).Selected = true;
                }
                if (studentInfo.coursename != null)
                {
                    BindCourses(Convert.ToInt32(ddlcourseapplied.SelectedValue), Convert.ToInt32(ddlfieldofstudy.SelectedValue));
                    ddlnameofcourse.ClearSelection();
                    ddlnameofcourse.Items.FindByValue(studentInfo.coursename.ToString()).Selected = true;
                    hidnameofcourse.Value = studentInfo.coursename.ToString();
                }
                // txtnameofcourse.Value = studentInfo.coursename;
                //txtcommencementdate.Value = Convert.ToDateTime(studentInfo.commencementdate).ToString("yyyy-MM-dd");
                if (studentInfo.commencementdate != null)
                {
                    ddlCommencementdate.ClearSelection();
                    ddlCommencementdate.Items.FindByValue(studentInfo.commencementdate.ToString()).Selected = true;
                }
                if (studentInfo.workexperience != null && studentInfo.workexperience != 0)
                {
                    ddlworkexperience.ClearSelection();
                    ddlworkexperience.Items.FindByValue(studentInfo.workexperience.ToString()).Selected = true;
                }
                if (studentInfo.workexperience != null && studentInfo.workexperience == 0)
                {
                    ddlworkexperience.ClearSelection();
                    ddlworkexperience.Items.FindByValue(1.ToString()).Selected = true;
                }
                if (studentInfo.typeofworkexperience != null)
                {
                    ddltypeofworkexperience.ClearSelection();
                    ddltypeofworkexperience.Items.FindByValue(studentInfo.typeofworkexperience.ToString()).Selected = true;
                }
                if (studentInfo.residencecountry != null)
                {
                    ddlcountryresidence.ClearSelection();
                    ddlcountryresidence.Items.FindByValue(studentInfo.residencecountry.ToString()).Selected = true;
                }
                if (studentInfo.tuitionandlivingcost != null)
                {
                    ddlannualfee.ClearSelection();
                    ddlannualfee.Items.FindByValue(studentInfo.tuitionandlivingcost.ToString()).Selected = true;
                }
                if (studentInfo.nameofuniversityappliedfor != null && isuniversityGroupHead)
                {
                    ddluniversityname.ClearSelection();
                    ddluniversityname.Items.FindByValue(studentInfo.nameofuniversityappliedfor.ToString()).Selected = true;
                }
                if (studentInfo.cityofeducationInstitution != null)
                {
                    if (isuniversityGroupHead)
                    {
                        ListItem lst = new ListItem("Please select", "0");
                        ddleduinstitutioncity.DataSource = JsonConvert.DeserializeObject<List<object>>(GetUniversityCities(studentInfo.nameofuniversityappliedfor.Value)); ;
                        ddleduinstitutioncity.DataTextField = "cityName";
                        ddleduinstitutioncity.DataValueField = "city_id";
                        ddleduinstitutioncity.DataBind();
                        ddleduinstitutioncity.Items.Insert(0, lst);
                    }
                    ddleduinstitutioncity.Items.FindByValue(studentInfo.cityofeducationInstitution.ToString()).Selected = true;
                }
            }
        }
        catch(Exception ex)
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
            cityDetails.AddRange(db1.universitycampus_city_mapping.Where(x => x.campusid == campusid).Select(x => new { city_id = x.cityid, cityName = x.citymaster.name}).ToList());

        if (cityDetails.Count == 0)
            cityDetails.Add(db1.university_master.Where(x => x.universityid == universityId).Select(x => new { city_id = x.cityid, cityName = x.citymaster.name }));
            
        return JsonConvert.SerializeObject(cityDetails.Distinct());
    }

    private void BindcityofInstitution() {
        try
        {

            ListItem lst = new ListItem("Please select", "0");
            ddleduinstitutioncity.DataSource = JsonConvert.DeserializeObject<List<object>>(GetUniversityCities(universityID)); ;
            ddleduinstitutioncity.DataTextField = "cityName";
            ddleduinstitutioncity.DataValueField = "city_id";
            ddleduinstitutioncity.DataBind();
            ddleduinstitutioncity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void Bindtypeofworkexperienceyears()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var workexperiencetype = db.typeofworkexperiencemaster.ToList();
            ddltypeofworkexperience.DataSource = workexperiencetype;
            ddltypeofworkexperience.DataTextField = "description";
            ddltypeofworkexperience.DataValueField = "workexperiencetypesid";
            ddltypeofworkexperience.DataBind();
            ddltypeofworkexperience.Items.Insert(0, lst);
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

    private void BindstudyField(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var fields = db.studylevelmaster.ToList();
            ddl.DataSource = fields;
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

    private void BindMajorDiscipline(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var discipline_master = db.majordiscipline_master.Where(x => x.universityid == universityID).ToList();
            ddl.DataSource = discipline_master;
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

    private void BindUnivercity(int univerisityHeadId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            List<object> objUniversities = new List<object>();
            var universities = db.universitygrouping.Where(x => x.groupingheaduniversityid == univerisityHeadId).Select(x => x.universityid).ToList();

            foreach (int universityId in universities)
                objUniversities.Add(db.university_master.Where(x => x.universityid == universityId).Select(x => new { x.university_name, x.universityid }).FirstOrDefault());

            objUniversities.Add(db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.university_name, x.universityid }).FirstOrDefault());
            ddluniversityname.DataSource = objUniversities;
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

    public void FillMonth(DropDownList ddl)
    {
        try
        {
            // ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;  //set current year as selected
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            //Fill Months
            ddl.Items.Add(new ListItem("Please select", "0"));
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

    public void FillYears(DropDownList ddl)
    {
        try
        {
            int maxYers = DateTime.Now.Year;
            int minYrs = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["YearsSince"].ToString());
            ddl.Items.Add(new ListItem("Please select", "0"));
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

    
}