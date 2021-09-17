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
public partial class ec_book_class : System.Web.UI.Page
{
    Common objCom = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    int universityID, userID = 0;
    string webURL = String.Empty;
    
    public List<ec_class_master> appliedcourseData = new List<ec_class_master>();
    public string universityname;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        universityname = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => x.university_name).FirstOrDefault();
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

        var IsProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
        if (!IsProfileDetailsCompletedByApplicant)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Please complete Your details before proceeding.');window.location='" + Request.ApplicationPath + "ec_applicantdetails.aspx';", true);
        
        userID = Convert.ToInt32(Session["UserID"].ToString());
        populateAppliedCourseData();
        if (!IsPostBack)
        {
            BindDropdown();
           
        }
    }

    private void populateAppliedCourseData()
    {
        appliedcourseData = (from am in db.ec_class_applicationmaster
                             join cm in db.ec_class_master on am.classid equals cm.id
                             where am.universityid == universityID && am.applicantid == userID
                             select cm).ToList();

        HidpreferenceID.Value = (appliedcourseData.Count + 1).ToString();
    }

    private void BindGrid(int gradeId, int subjectID, int typeid =0,int modeid=0,int locationid=0)
    {
        try
        {
            List<CoursegridData> temp_List = new List<CoursegridData>();

            var courses = (from cm in db.ec_class_master

                           join gm in db.ec_grademaster on cm.gradeid equals gm.id
                           join sm in db.subjectmaster on cm.subjectid equals sm.id
                           join tm in db.ec_type_master on cm.type equals tm.type_id
                           join mm in db.ec_mode_master on cm.modeid equals mm.mode_id
                           //join ucm in db.universitycampus on cm.location equals ucm.campusid into lData
                           //from x in lData.DefaultIfEmpty()
                           join currency in db.currency_master on cm.fee_currency equals currency.id

                           where cm.universityid == universityID
                           select new CoursegridData{
                               id = cm.id,
                               classname = cm.classname,
                               type = tm.type_description,
                               type_id = tm.type_id,
                               grade =gm.description,
                               grade_id = gm.id,
                               subject = sm.description,
                               subject_id = sm.id,
                               mode = mm.mode_description,
                               mode_id =mm.mode_id,
                               //location = x.campusname,
                               //location_id =x.campusid,
                               fee_amount = currency.currency_symbol+" "+cm.fee_amount,
                               startdate = cm.startdate,
                               startdate_utc = cm.startdate_utc,
                               bookingdeadline =cm.bookingdeadline,
                               bookingdeadline_utc = cm.bookingdeadline_utc,
                               availability = cm.availability == null ? 0:cm.availability,
                           }).ToList();
            foreach (var item in courses) {
                //check aavilability
                var applied_class_data = db.ec_class_applicationmaster.Where(x => x.universityid == universityID  && x.classid == item.id && x.status == 7).ToList();

                if (item.availability >= applied_class_data.Count + 1)
                    temp_List.Add(item);
            }

            courses = temp_List;

            if (gradeId != 0)
                courses.RemoveAll(x => x.grade_id != gradeId);
            if (subjectID != 0)
                courses.RemoveAll(x => x.subject_id != subjectID);
            if (typeid != 0)
                courses.RemoveAll(x => x.type_id != typeid);
            if (modeid != 0)
                courses.RemoveAll(x => x.mode_id != modeid);
            //if (locationid != 0)
            //    courses.RemoveAll(x => x.location_id != locationid);

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
    
    public class data
    {

        public int id { get; set; }
        public string country_name { get; set; }
        public int campuscity { get; set; }
    }
    private void BindDropdown()
    {
        try
        {
            ListItem lst = new ListItem("By Grade", "0");
            var list_final = (from ap in db.applicantdetails
                              join gm in db.ec_grademaster on ap.gradeid equals gm.id
                              where ap.applicantid == userID && ap.universityid == universityID
                              select new
                              {
                                  description = gm.description,
                                  id = gm.id,
                              }).ToList();
                
            ddlgrade.DataSource = list_final;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            ListItem lst1 = new ListItem("By Subject", "0");
            var subject_list = (from subjcet in db.exam_applicant_subjectmapping
                        join sm in db.subjectmaster on subjcet.subjectid equals sm.id
                        where subjcet.applicantid == userID && subjcet.universityid == universityID
                        select new
                        {
                            description = sm.description,
                            id = sm.id,
                        }).Distinct().ToList();

            ddlsubject.DataSource = subject_list;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst1);

            ListItem lst2 = new ListItem("By Type", "0");
            var type_list = db.ec_type_master.ToList();

            ddltype.DataSource = type_list;
            ddltype.DataTextField = "type_description";
            ddltype.DataValueField = "type_id";
            ddltype.DataBind();
            ddltype.Items.Insert(0, lst2);

            ListItem lst3 = new ListItem("By Mode", "0");
            var mode_list = db.ec_mode_master.ToList();

            ddlMode.DataSource = mode_list;
            ddlMode.DataTextField = "mode_description";
            ddlMode.DataValueField = "mode_id";
            ddlMode.DataBind();
            ddlMode.Items.Insert(0, lst3);

            ListItem lst4 = new ListItem("By Location", "0");
            var location_list = db.universitycampus.Where(x=>x.universityid == universityID).ToList();

            ddllocation.DataSource = location_list;
            ddllocation.DataTextField = "campusname";
            ddllocation.DataValueField = "campusid";
            ddllocation.DataBind();
            ddllocation.Items.Insert(0, lst4);
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
        var temp = (from cm in db1.ec_class_master
                    join um in db1.university_master on cm.universityid equals um.universityid
                    join gm in db1.ec_grademaster on cm.gradeid equals gm.id
                    join sm in db1.subjectmaster on cm.subjectid equals sm.id
                    join tm in db1.ec_type_master on cm.type equals tm.type_id
                    join mm in db1.ec_mode_master on cm.modeid equals mm.mode_id
                    //join ucm in db1.universitycampus on cm.location equals ucm.campusid
                    join currency in db1.currency_master on cm.fee_currency equals currency.id


                    where cm.universityid == universityID1 && cm.id == courseid && um.IsDeleted != 1
                    select new
                    {
                        id = cm.id,
                        classdescription = string.IsNullOrEmpty(cm.classdescription) ? "Not set" : cm.classdescription,
                        courseduration = cm.duration_year + " Years " + cm.duration_month + " Months " + cm.duration_day + " Days " + cm.duration_hours + " Hours ",
                        eligibility = string.IsNullOrEmpty(cm.requirement) ? "No Requirement" : cm.requirement.Replace(Environment.NewLine, "<br />"),
                        university_name = um.university_name,

                        type = tm.type_description,
                        type_id = tm.type_id,
                        grade = gm.description,
                        grade_id = gm.id,
                        subject = sm.description,
                        subject_id = sm.id,
                        mode = mm.mode_description,
                        mode_id = mm.mode_id,
                        //location = ucm.campusname,
                        //location_id = ucm.campusid,
                        fee_amount = currency.currency_symbol + " " + cm.fee_amount,
                        startdate = cm.startdate,
                        startdate_utc = cm.startdate_utc,
                        bookingdeadline = cm.bookingdeadline,
                        bookingdeadline_utc = cm.bookingdeadline_utc,
                        classstarttime = cm.class_starttime,
                        classendtime = cm.class_endtime,
                        currencyId = cm.fee_currency,
                        fee_amountID = cm.enrollment_fee_amount,
                    }).ToList();
       
        return JsonConvert.SerializeObject(temp);
    }
  
    protected void btnsearchcourse_Click(object sender, EventArgs e)
    {
        //to bind grid
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID= Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID= Convert.ToInt32(ddlMode.SelectedValue);
        int locationID = Convert.ToInt32(ddllocation.SelectedValue);

        coursegrid.Attributes.Add("style", "display:block");
        BindGrid(gradeID, subjectID,typeID,modeID,locationID);

       
        populateAppliedCourseData();
    }

    protected void savedata_Click(object sender, EventArgs e)
    {
        try
        {
            int clsid = Convert.ToInt32(HidClassid.Value);

            //check aavilability
            var checkaavilability = db.ec_class_master.Where(x => x.id == clsid).Select(x => x.availability).FirstOrDefault();
            var applied_class_data = db.ec_class_applicationmaster.Where(x => x.classid == clsid && x.universityid == universityID && x.status == 7).ToList();

            if (checkaavilability >= applied_class_data.Count + 1)
            {
                ec_class_applicationmaster objapplicationmaster = new ec_class_applicationmaster();

                var exsisitingdata = db.ec_class_applicationmaster.Where(x => x.applicantid == userID && x.universityid == universityID && x.classid == clsid).FirstOrDefault();
                if (exsisitingdata == null)
                {
                    objapplicationmaster.classid = clsid;

                    if (yesRB.Checked == true)
                        objapplicationmaster.eligibility_response = 1;
                    else
                        objapplicationmaster.eligibility_response = 0;
                    objapplicationmaster.applicantid = userID;
                    objapplicationmaster.universityid = universityID;
                    objapplicationmaster.status = 10;//payment pending
                    objapplicationmaster.booking_datetime = DateTime.UtcNow;
                    db.ec_class_applicationmaster.Add(objapplicationmaster);
                    db.SaveChanges();
                    
                    int applicationmasterId = objapplicationmaster.id;
                    int paymentFor_ID = db.payment_description_master.Where(x => x.payment_description.ToUpper() == "ENROLLMENT FEE").Select(x => x.id).FirstOrDefault();

                    int currencyID = Convert.ToInt32(Hidfee_currencyID.Value);
                    int amount = Convert.ToInt32(Hidfee_amount.Value);

                    Save_PaymentDetails(applicationmasterId, paymentFor_ID, amount, currencyID, clsid);

                    populateAppliedCourseData();
                    BindDropdown();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Congratulations! Your application for" + Hidcoursename.Value + " at " + lbllocation.InnerText + "has been successfully submitted.')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have already applied for this course.')", true);
                }
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('search for another course.')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void Save_PaymentDetails(int applicationmasterId, int paymentFor_ID =0, int amount=0, int currencyID=0,int classid=0) {
        try {
            
            int paymentDetailsId;
            Int32.TryParse(Convert.ToString(ViewState["paymentDetailId"]), out paymentDetailsId);
            
            ec_payment_details objPaymentDetail = new ec_payment_details();

            objPaymentDetail.applicationmaster_id = applicationmasterId;
            objPaymentDetail.payment_for = paymentFor_ID;
            //objPaymentDetail.instruction = txtPaymentInstruction.Text;
            objPaymentDetail.amount = amount;
            objPaymentDetail.currency_id = currencyID;
            objPaymentDetail.university_id = universityID;
            objPaymentDetail.applicant_id = userID;
            objPaymentDetail.applicationmaster_id = applicationmasterId;
            objPaymentDetail.class_id = classid;

            var today = DateTime.UtcNow;
            var tomorrow = today.AddDays(1);
            
            objPaymentDetail.due_date = tomorrow;
            objPaymentDetail.request_date = DateTime.UtcNow;
            objPaymentDetail.payment_status = 10; // Hard Coded for payment pending
            db.ec_payment_details.Add(objPaymentDetail);
            
            db.SaveChanges();
            SendEmailtoApplicat(classid);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SendEmailtoApplicat(int classid) {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == userID).Select(x => x.email).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo }).FirstOrDefault();
            var classdetails = db.ec_class_master.Where(x => x.id == classid).FirstOrDefault();
            string currency = "0";
            if (classdetails != null && classdetails.fee_currency != null)
            {
                currency = db.currency_master.Where(x => x.id == classdetails.fee_currency).Select(x => x.currency_symbol).FirstOrDefault();
            }

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ec_classbooking.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + universitydetails.logo);
            html = html.Replace("@applicantFirstname", details.firstname);

            html = html.Replace("@class_code", classid.ToString());
            html = html.Replace("@class_name", classdetails.classname);
            html = html.Replace("@payment_currency", currency.ToString());
            html = html.Replace("@enrolment_fee", classdetails.enrollment_fee_amount);

            html = html.Replace("@Loginurl", webURL + "login.aspx");
            objCom.SendMail(studentEmailAddress, html, "Successful Booking For Class : " + classdetails.classname.ToUpper());
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    protected void courseGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        courseGridView.PageIndex = e.NewPageIndex;
        coursegrid.Attributes.Add("style", "display:block");

        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID = Convert.ToInt32(ddlMode.SelectedValue);
        int locationID = Convert.ToInt32(ddllocation.SelectedValue);
        
        BindGrid(gradeID, subjectID, typeID, modeID, locationID);
    }

    public class CoursegridData
    {
        public int id { get; set; }
        public string classname { get; set; }
        public string type { get; set; }
        public int type_id { get; set; }
        public string grade { get; set; }
        public int grade_id { get; set; }
        public string subject { get; set; }
        public int subject_id { get; set; }
        public string mode { get; set; }
        public int mode_id { get; set; }
        //location = x.campusname,
        //location_id =x.campusid,
        public string fee_amount { get; set; }
        public DateTime? startdate { get; set; }
        public DateTime? startdate_utc { get; set; }
        public DateTime? bookingdeadline { get; set; }
        public DateTime? bookingdeadline_utc { get; set; }
        public int? availability { get; set; }


        //public CoursegridData()
        //{
        //    this.id = -1;
        //    this.coursename = string.Empty;
        //    this.universityname = string.Empty;
        //    this.campuscityname = string.Empty;
        //    this.campus = string.Empty;
        //    this.campuscountryName = string.Empty;
        //    this.modeofstudy = string.Empty;
        //    this.levelodstudy = string.Empty;
        //    this.major = string.Empty;
        //    this.universityid = -1;
        //    this.UID = -1;
        //    this.campusid = -1;
        //    this.campuscityID = -1;
        //    this.campuscontryID = -1;
        //    this.modeofstudyid = -1;
        //    this.levelodstudyID = null;
        //    this.majorID = null;
        //    this.coursefee = null;
        //    this.currencysymbol = null;
        //}
    }

}