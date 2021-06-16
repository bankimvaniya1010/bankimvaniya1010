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

        isFullService = (int)Session["isfullservice"];
        
        if (isFullService == 0)
            isfullservicethenlbl = " GTE DIRECT CENTRE";
        else if(isFullService == 1)
            isfullservicethenlbl = " APPLICATION CENTER";
        else if (isFullService == 2)
            isfullservicethenlbl = "Assessment Center";
        SaveStatus();
    }
    private void SaveStatus()
    {
        try
        {
            var mode = "new";
            if (Session["assignid"] != null)
            {
                int assignid = Convert.ToInt32(Session["assignid"]);

                exam_assign objapplicant = new exam_assign();

                var data = db.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
                if (data != null)
                {
                    mode = "update";
                    objapplicant = data;
                }
                objapplicant.logout_forexam_at = DateTime.UtcNow;
                objapplicant.is_studentactiveforexam = 0;
                if (mode == "new")
                    db.exam_assign.Add(objapplicant);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
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
                    var applicantdetail = db.applicantdetails.Any(x => x.applicantid == chkUser.studentid && x.universityid == universityID && x.isdeletedbyAdmin == true);
                    if (!applicantdetail)
                        Response.Redirect(webURL + "resetpassword.aspx", true);
                }
                else
                {
                    string encodedPassword = objCom.EncodePasswordToMD5(txt_pass.Text.ToString());
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
                            objapplicant.isverifiedbyAdmin = false;
                            objapplicant.isdeletedbyAdmin = false;
                            objapplicant.Isold_or_new_applicant = true;
                            db.applicantdetails.Add(objapplicant);
                            db.SaveChanges();
                        }
                        var isRecord_deltedbyAdmin = db.applicantdetails.Where(x => x.applicantid == chkUser.studentid && x.universityid == universityID && x.isdeletedbyAdmin == true).FirstOrDefault();
                        if (isRecord_deltedbyAdmin == null)
                        {
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

                            var applicantdetail = db.applicantdetails.Where(x => x.applicantid == chkUser.studentid && x.universityid == universityID).FirstOrDefault();

                            Session["isVerifiedByAdmin"] = applicantdetail.isverifiedbyAdmin;
                            //logic to set old or new applicant
                            if (isFullService == 0 || isFullService == 1)
                            {
                                if (applicantdetail != null)
                                {
                                    if (applicantdetail.Isold_or_new_applicant != true)
                                    {
                                        //level 2 of gte certificate
                                        var gteProgress = db.gte_progressbar.Where(x => x.applicantid == chkUser.studentid && x.universityId == universityID).FirstOrDefault();
                                        if (gteProgress != null && gteProgress.is_gte_certificate_generated != true)
                                            SaveApplicantAsNew(chkUser.studentid);
                                        
                                        else
                                        {//level1 of applicantdetails
                                            var gtedetail = db.gte_applicantdetails.Where(x => x.applicantid == chkUser.studentid && x.universityid == universityID).FirstOrDefault();
                                            if (gtedetail == null)
                                                SaveApplicantAsNew(chkUser.studentid);
                                            else
                                            {//level3 check for gte assessment & sop
                                                var IssopComplteted = db.gte_student_sop.Where(x => x.applicant_id == chkUser.studentid && x.universityid == universityID).FirstOrDefault();
                                                if (IssopComplteted != null && IssopComplteted.is_sop_submitted_by_applicant != true)
                                                    SaveApplicantAsNew(chkUser.studentid);
                                            }
                                        }
                                    }

                                }
                            }


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
                                       
                        }
                        else {
                            lbl_warning.Text = "Your Account for this institution is suspended by admin.";
                            pnl_warning.Visible = true;
                        }
                    }
                }
            }
        }

        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
    private void SaveApplicantAsNew(int applicantid) {
        try {
            var mode = "new";
            applicantdetails objapplicant = new applicantdetails();
            var data = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objapplicant = data;
            }
            objapplicant.Isold_or_new_applicant =true;
            if (mode == "new")
                db.applicantdetails.Add(objapplicant);
            db.SaveChanges();
        }
        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }
}
