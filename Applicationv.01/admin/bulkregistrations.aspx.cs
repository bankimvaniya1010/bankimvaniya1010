using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin_bulkregistrations : System.Web.UI.Page
{
    int roleID = 0, universityID = 0;
    string universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string roleName = string.Empty;
    string webURL = String.Empty;
    public List<students> employees = new List<students>();
    public List<details> invalidlist = new List<details>();
    protected string LoginURL = "";
    public string demolink, unregisteredapplicantlistLink;
    public static string filePath = string.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public string invalid_fileName = null;
    public int? noofapplicantsave;
    string bulkregistrationPath = System.Configuration.ConfigurationManager.AppSettings["bulkregistrationPath"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();

        roleID = Convert.ToInt32(Session["Role"]);

        HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;
        if (httpPostedFile.Count > 0)
            uploadDoc(httpPostedFile[0]);

        if (!IsPostBack)
        {
            demolink = webURL + "Docs/BulkRegistrations/DemoSheet.csv";
            populate();
        }
    }
    private void populate()
    {
        try
        {
            var isrecordpresent = db.bulk_registrations_master.Where(x => x.universityid == universityID).OrderByDescending(x => x.id).FirstOrDefault();
            if (isrecordpresent != null)
            {
                noofapplicantsave = isrecordpresent.noofrecordsaved;
                noofapplicantsaveDiv.Attributes.Add("style", "display:block;");

                if (!string.IsNullOrEmpty(isrecordpresent.invalidfilepath))
                {
                    unregisteredapplicantlistDiv.Attributes.Add("style", "display:block;");
                    unregisteredapplicantlistLink = webURL + "/Docs/BulkRegistrations/"+universityID+"/" + isrecordpresent.invalidfilepath;
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }

    protected void uploadDoc(HttpPostedFile postedFile)
    {
        try
        {
            if (postedFile != null)
            {
                try
                {
                    string fileExtension = Path.GetExtension(postedFile.FileName);
                    string path1 = docPath + "/BulkRegistrations/" + universityID + "/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(postedFile.FileName));
                    string filePath = string.Concat(path1, fileName);
                    if (!Directory.Exists(path1))
                        Directory.CreateDirectory(path1);
                    postedFile.SaveAs(filePath);

                    //Validate uploaded file and return error.
                    if (fileExtension != ".csv")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select the csv file with .csv extension.')", true);
                    }

                    employees = new List<students>();
                    invalidlist = new List<details>();

                    using (var sreader = new StreamReader(postedFile.InputStream))
                    {
                        //First line is header. If header is not passed in csv then we can neglect the below line.
                        string[] headers = sreader.ReadLine().Split(',');
                        //Loop through the records
                        while (!sreader.EndOfStream)
                        {
                            string[] rows = sreader.ReadLine().Split(',');

                            string firstname = rows[0].ToString().Trim();
                            string familyname = rows[1].ToString().Trim();
                            var email = rows[2].ToString().Trim();
                            var Class = rows[3].ToString().Trim();
                            var group = rows[4].ToString().Trim();
                            var studentid = rows[5].ToString().Trim();

                            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                            Match match = regex.Match(email);
                            if (match.Success)
                            {
                                if (!string.IsNullOrEmpty(firstname))
                                {
                                    if (string.IsNullOrEmpty(Class) || checkifClassMapped(Class))
                                    {
                                        if (string.IsNullOrEmpty(group) || checkifGroupMapped(group))
                                        {
                                            savetoDatabase(firstname,familyname , email, Class, group, studentid);
                                        }
                                        else
                                        {
                                            invalidlist.Add(new details
                                            {
                                                firstname = rows[0].ToString().Trim(),
                                                familyname = rows[1].ToString().Trim(),
                                                email = rows[2].ToString().Trim(),
                                                Class = rows[3].ToString().Trim(),
                                                group = rows[4].ToString().Trim(),
                                                studentid = rows[5].ToString().Trim(),
                                                invalidreason = "InValid Group Name"
                                            });
                                        }
                                    }
                                    else
                                    {
                                        invalidlist.Add(new details
                                        {
                                            firstname = rows[0].ToString().Trim(),
                                            familyname = rows[1].ToString().Trim(),
                                            email = rows[2].ToString().Trim(),
                                            Class = rows[3].ToString().Trim(),
                                            group = rows[4].ToString().Trim(),
                                            studentid = rows[5].ToString().Trim(),
                                            invalidreason = "InValid Class Name"
                                        });
                                    }
                                }
                                else
                                {
                                    invalidlist.Add(new details
                                    {
                                        firstname = rows[0].ToString().Trim(),
                                        familyname = rows[1].ToString().Trim(),
                                        email = rows[2].ToString().Trim(),
                                        Class = rows[3].ToString().Trim(),
                                        group = rows[4].ToString().Trim(),
                                        studentid = rows[5].ToString().Trim(),
                                        invalidreason = "InValid Name"
                                    });
                                }
                            }
                            else
                            {
                                invalidlist.Add(new details
                                {
                                    firstname = rows[0].ToString().Trim(),
                                    familyname = rows[1].ToString().Trim(),
                                    email = rows[2].ToString().Trim(),
                                    Class = rows[3].ToString().Trim(),
                                    group = rows[4].ToString().Trim(),
                                    studentid = rows[5].ToString().Trim(),
                                    invalidreason = "InValid Email"
                                });
                            }
                        }
                    }
                    if (invalidlist.Count > 0)
                    {
                         BindDatatable();
                    }
                    else
                        unregisteredapplicantlistDiv.Attributes.Add("style", "display:none;");


                    saverecordofBulkRegistration(employees.Count, fileName, invalid_fileName);
                }
                catch (Exception ex)
                {
                    objLog.WriteLog(ex.ToString());
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select the file first to upload.')", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public bool checkifClassMapped(string classname)
    {
        int classid = objCom.getclassid(classname);
        if (classid == 0)
            return false;
        else
        {
            var data = db.institutionwiseclassmaster.Where(x => x.institutionID == universityID && x.classId == classid).FirstOrDefault();
            if (data != null)
                return true;
            else
                return false;
        }
    }

    public bool checkifGroupMapped(string groupname)
    {
        int groupid = objCom.getgroupid(groupname);
        if (groupid == 0)
            return false;
        else
        {
            var data = db.institutionwisegroupmaster.Where(x => x.institutionID == universityID && x.groupId == groupid).FirstOrDefault();
            if (data != null)
                return true;
            else
                return false;
        }
    }

    private void savetoDatabase(string firstname, string familyname , string useremail, string Class, string group, string studentid)
    {
        try
        {
            //check count set by institution for registration
            var universitycount = db.university_master.Where(x => x.universityid == universityID).Select(x => x.numberof_applicant).FirstOrDefault();
            var registeredapplicant = (from ad in db.applicantdetails
                                       join sd in db.students on ad.applicantid equals sd.studentid
                                       where ad.universityid == universityID && sd.isdeletedbyAdmin == false
                                       select ad.applicantid).ToList();
            //db.applicantdetails.Where(x => x.universityid == universityID).ToList();
            if (universitycount != 0 && registeredapplicant.Count >= universitycount)
            {
                //count exhausted
                invalidlist.Add(new details
                {
                    firstname = firstname,
                    familyname = familyname,
                    email = useremail,
                    Class = Class,
                    group = group,
                    studentid= studentid,
                    invalidreason = "Registration Count Exhausted"
                });
            }
            else
            {
                var record = db.students.Where(x => x.email == useremail).FirstOrDefault();
                if (record == null)
                {

                    students usrObj = new students();
                    usrObj.name = firstname;
                    usrObj.email = useremail;
                    int otp = objCom.RandomNumber(100000, 999999);
                    usrObj.otp = otp;
                    usrObj.studylevelid = 1;
                    usrObj.verificationkey = Guid.NewGuid().ToString();
                    usrObj.isverified = false;
                    usrObj.isdeletedbyAdmin = false;
                    usrObj.isverifiedbyAdmin = true;
                    usrObj.universityid = universityID;
                    db.students.Add(usrObj);
                    db.SaveChanges();

                    // add to list
                    employees.Add(new students
                    {
                        username = firstname,
                        email = useremail,
                        studentid = usrObj.studentid
                    });

                    //save to applicantdetails db
                    applicantdetails objapplicant = new applicantdetails();

                    var id = usrObj.studentid;
                    objapplicant.applicantid = id;
                    objapplicant.email = useremail;
                    objapplicant.firstname = firstname;
                    objapplicant.lastname = familyname;
                    universityID = Utility.GetUniversityId();
                    objapplicant.universityid = universityID;
                    objapplicant.groupId = objCom.getgroupid(group);
                    objapplicant.classId = objCom.getclassid(Class);
                    objapplicant.studentid = studentid;
                    db.applicantdetails.Add(objapplicant);
                    db.SaveChanges();

                    var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                    //sender email notification to university 
                    if (university.emai_notification1 != null)
                    {
                        sendNotification(university.emai_notification1, useremail, id);
                    }

                    if (university.emai_notification2 != null)
                    {
                        sendNotification(university.emai_notification2, useremail, id);
                    }
                    string username = firstname + " " + familyname;
                    sendNotificationToStudent(university, useremail, username, otp);
                }
                else
                {
                    //same email id presenet
                    invalidlist.Add(new details
                    {
                        firstname = firstname,
                        familyname=familyname,
                        email = useremail,
                        Class = Class,
                        group = group,
                        studentid =studentid,
                        invalidreason = "Email Already Exists"
                    });
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void saverecordofBulkRegistration(int noofrecordsaved, string uploadfilename, string invalidfilename)
    {
        try
        {
            bulk_registrations_master objmapping = new bulk_registrations_master();
            var isrecordpresent = db.bulk_registrations_master.Where(x => x.universityid == universityID).FirstOrDefault();

            objmapping.universityid = universityID;
            objmapping.uploadedfilepath = uploadfilename;
            objmapping.invalidfilepath = invalidfilename;
            objmapping.noofrecordsaved = noofrecordsaved;
            objmapping.created_by = roleID;

            db.bulk_registrations_master.Add(objmapping);
            db.SaveChanges();
            populate();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }


    }

    private void sendNotificationToStudent(university_master university, string email, string name, int otp)
    {
        try
        {
            string html = string.Empty;
            string emailsubject = string.Empty;

            if (university.full_service == 0)// if (Utility.GetUniversityId() == 13) exsisting now change acc #376
            {
                html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/gte_direct_signupNotification.html"));
                emailsubject = "Welcome to GTE-Direct Online Centre (GOC)";
            }
            else if (university.full_service == 1)
            {
                html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerconfirmationwithotp.html"));
                emailsubject = "Application Centre Account Created Email";
            }
            else if (university.full_service == 2)
            {
                html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/assessment_signupNotification.html"));
                emailsubject = "Your Assessment Centre Account has been created";
            }

            html = html.Replace("@UniversityName", university.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

            html = html.Replace("@Name", name == "" ? "Hello" : name);
            html = html.Replace("@Email", email);
            html = html.Replace("@OTP", otp.ToString());
            LoginURL = webURL + "/login.aspx?active=1";
            html = html.Replace("@activeLoginurl", LoginURL);
            html = html.Replace("@Loginurl", webURL + "login.aspx");
            html = html.Replace("@UniversityEmailID", university.email);
            html = html.Replace("@UniversityChatID", university.chatid);
            html = html.Replace("@UniversityMobileNumber", university.mobile);
            objCom.SendMail(email, html, emailsubject);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void sendNotification(string notificationemail, string studentemail, int studentid)
    {
        try
        {
            var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/registerNotification.html"));
            html = html.Replace("@UniversityName", university.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);

            html = html.Replace("@Email", studentemail);
            html = html.Replace("@studentid", Convert.ToString(studentid));
            objCom.SendMail(notificationemail, html, "New Applicant Registered");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public class details
    {
        public string firstname { get; set; }
        public string familyname { get; set; }
        public string email { get; set; }
        public string Class { get; set; }
        public string group { get; set; }
        public string studentid { get; set; }
        public string invalidreason { get; set; }
    }


    protected System.Data.DataTable BindDatatable()
    {      
        System.Data.DataTable dt = new System.Data.DataTable();
        // all columns
        dt.Columns.Add("First Name", typeof(string));
        dt.Columns.Add("Family Name", typeof(string));
        dt.Columns.Add("Email", typeof(string));
        dt.Columns.Add("Class", typeof(string));
        dt.Columns.Add("Group", typeof(string));
        dt.Columns.Add("Reason", typeof(string));
        // to print rows

        if (invalidlist != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < invalidlist.Count; i++)
            {
                var details = invalidlist[i];

                dt.Rows.Add(details.firstname, details.familyname, details.email, details.Class, details.group, details.invalidreason);

                rowNumber++;
            }
        }
        SaveExcel(dt);
        return dt;
    }

    private void SaveExcel(System.Data.DataTable dt1)
    {
        try
        {

            string csv = string.Empty;

            foreach (DataColumn column in dt1.Columns)
            {
                //Add the Header row for CSV file.
                csv += column.ColumnName + ',';
            }

            //Add new line.
            csv += "\r\n";

            foreach (DataRow row in dt1.Rows)
            {
                foreach (DataColumn column in dt1.Columns)
                {
                    //Add the Data rows.
                    csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
                }

                //Add new line.
                csv += "\r\n";
            }

            string datetime = Convert.ToString(DateTime.Today.ToString("dd-MM-yyyy")).Trim();
            string filepath = @"" + docPath + "/BulkRegistrations/" + universityID + "/";
            if (!Directory.Exists(filepath))
                Directory.CreateDirectory(filepath);

            string filename = "UnRegisteredApplicantFile" + "_" + universityID + ".CSV";
            string combinepath = filepath + filename;
            invalid_fileName = filename;
            System.IO.File.WriteAllText(combinepath, csv);
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}