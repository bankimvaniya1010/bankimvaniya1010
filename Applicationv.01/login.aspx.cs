using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    string active = "";
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    int universityID;
    public string logourl = string.Empty;
    public string universityGTMCode = string.Empty;
    public string isfullservicethenlbl = string.Empty;
    bool isProfileDetailsCompletedByApplicant;
    int isFullService;
    bool isDeclarationCompleted;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (universityID == -1)
        {
            Response.Redirect(Request.Url.Host.ToLower().ToString(), true);
            return;
        }
        else
            Session["universityId"] = universityID;
        active = Request.QueryString["active"];

        var universityDetails = db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.universityid, x.logo, x.university_gtm_code}).FirstOrDefault();
        logourl = webURL + "/Docs/" + universityDetails.universityid + "/" + universityDetails.logo;
        universityGTMCode = universityDetails.university_gtm_code;

        isFullService =  (int)Session["isfullservice"];
        
        if (isFullService == 0)
            isfullservicethenlbl = " GTE Online Center (GOC)";
        else if(isFullService == 1)
            isfullservicethenlbl = " APPLICATION CENTER";
        else if (isFullService == 2)
            isfullservicethenlbl = "Assessment Center";
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var chkUser = db.students.FirstOrDefault();
            int otp = 0;
            if (txt_pass.Text != "")
            {
                bool isActivationMode = int.TryParse(txt_pass.Text, out otp);
                if (isActivationMode && otp.ToString().Length == 6)
                {
                    chkUser = (from usr in db.students
                               where (usr.email.Equals(txtUser.Text.Trim()) && usr.otp == otp)
                               select usr).FirstOrDefault();
                }
                else
                    isActivationMode = false;

                if (isActivationMode && chkUser != null && !chkUser.ispasswordset.HasValue)
                {
                    if (chkUser.isdeletedbyAdmin != true)
                        Response.Redirect(webURL + "resetpassword.aspx", true);
                }
                else
                {
                    string encodedPassword = objCom.EncodePasswordToMD5(txt_pass.Text.ToString());

                    //chk user verification for service GTE & Assessment
                    if (isFullService == 0 || isFullService == 2)
                        chkUser = (from usr in db.students
                                   where (usr.email.Equals(txtUser.Text.Trim()) && usr.password.Equals(encodedPassword) && usr.isdeletedbyAdmin == false)
                                   select usr).FirstOrDefault();
                    else
                        chkUser = (from usr in db.students
                                   where (usr.email.Equals(txtUser.Text.Trim()) && usr.password.Equals(encodedPassword))
                                   select usr).FirstOrDefault();
                    if (chkUser == null)
                    {
                        lbl_warning.Text = "Please enter valid user name and password.";
                        pnl_warning.Visible = true;
                    }
                    else if (!chkUser.isverified)
                    {
                        lbl_warning.Text = "Please activate your account to login.";
                        pnl_warning.Visible = true;
                    }
                    else
                    {
                        var isRecordPresent = db.applicantdetails.Any(x => x.applicantid == chkUser.studentid && x.universityid == universityID);
                        if (!isRecordPresent)
                        {
                            applicantdetails objapplicant = new applicantdetails();
                            objapplicant.applicantid = chkUser.studentid;
                            objapplicant.email = chkUser.email.Trim();

                            string[] nameArr = chkUser.name.Split(' ');
                            objapplicant.firstname = nameArr[0];
                            if (nameArr.Length > 1)
                                objapplicant.lastname = chkUser.name.Substring(nameArr[0].Length + 1);

                            objapplicant.universityid = universityID;
                            db.applicantdetails.Add(objapplicant);
                            db.SaveChanges();
                        }

                        bool isDeclarationDoneByApplicant = false;
                        bool isGteDeclarationDoneByApplicant;


                        pnl_warning.Visible = false;
                        Session["isDomesticStudent"] = chkUser.isDomesticStudent;
                        Session["LoginInfo"] = chkUser;
                        Session["UserID"] = chkUser.studentid;
                        Session["Role"] = "student";
                        isGteDeclarationDoneByApplicant = objCom.IsGteDeclarationDoneByApplicant(chkUser.studentid, universityID);
                        isFullService = db.university_master.Where(x => x.universityid == universityID).Select(x => x.full_service).FirstOrDefault();

                        if (isFullService == 1)
                        {
                            isDeclarationDoneByApplicant = objCom.IsDeclarationDoneByApplicant(chkUser.studentid, universityID);
                            isDeclarationCompleted = isDeclarationDoneByApplicant;
                            isProfileDetailsCompletedByApplicant = objCom.SetStudentDetailsCompletedStatus(chkUser.studentid, universityID);
                        }
                        else if (isFullService == 0)
                        {
                            isDeclarationCompleted = isGteDeclarationDoneByApplicant;
                            isProfileDetailsCompletedByApplicant = objCom.SetGteStudentDetailsCompletedStatus(chkUser.studentid, universityID);
                        }

                        Session["DeclarationDoneByApplicant"] = isDeclarationDoneByApplicant;
                        Session["GteDeclarationDoneByApplicant"] = isGteDeclarationDoneByApplicant;
                        Session["ProfileDetailsCompletedByApplicant"] = isProfileDetailsCompletedByApplicant;
                        Session["FullService"] = isFullService;
                        Session["DeclarationCompleted"] = isDeclarationCompleted;
                        Session["isVerifiedByAdmin"] = chkUser.isverifiedbyAdmin;
                        //switch (chkUser.role)
                        //{
                        //    case 1:
                        //        Response.Redirect(webURL + "admin/default.aspx");
                        //        break;
                        //    case 2:
                        //        Response.Redirect(webURL + "agentdashboard.aspx");
                        //        break;
                        //    case 3:
                        if (isFullService == 2)
                        {
                            var studentdatis = db.applicantdetails.Where(x => x.applicantid == chkUser.studentid && x.universityid == universityID).FirstOrDefault();
                            var subjectcount = db.exam_applicant_subjectmapping.Where(x => x.applicantid == chkUser.studentid && x.universityid == universityID).ToList().Count();
                            if (studentdatis != null)
                            {
                                if (studentdatis.classId == null || studentdatis.groupId == null || subjectcount == 0)
                                    Response.Redirect(webURL + "details.aspx?id=" + chkUser.studentid, true);
                                else
                                    Response.Redirect(webURL + "default.aspx", true);
                            }
                            else
                                Response.Redirect(webURL + "default.aspx", true);
                        }
                        else
                            Response.Redirect(webURL + "default.aspx", true);
                        //            break;
                        //        case 4:
                        //            Response.Redirect(webURL + "universitydashboard.aspx");
                        //            break;
                        //        default:
                        //            Response.Redirect(webURL + "login.aspx");
                        //            break;
                        //    }                

                    }
                }
            }
        }

        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

}
