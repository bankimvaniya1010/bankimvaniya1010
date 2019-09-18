using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class login : System.Web.UI.Page
{
    string active = "";
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        active = Request.QueryString["active"];
        //var University = db.university_master.FirstOrDefault();
        //string UniversityURL = University.website.Split('.')[0];
        //webURL = webURL.Replace("edu", UniversityURL);

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

                if (isActivationMode && chkUser != null)
                    Response.Redirect(webURL + "resetpassword.aspx", true);
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
                            db.applicantdetails.Add(objapplicant);
                            db.SaveChanges();
                        }

                        bool isDeclarationDoneByApplicant = false;
                        bool isGteDeclarationDoneByApplicant;
                        bool isProfileDetailsCompletedByApplicant;

                        bool isFullService;
                        bool isDeclarationCompleted;

                        pnl_warning.Visible = false;
                        Session["LoginInfo"] = chkUser;
                        Session["UserID"] = chkUser.studentid;
                        Session["Role"] = "student";
                        isGteDeclarationDoneByApplicant = objCom.IsGteDeclarationDoneByApplicant(chkUser.studentid);
                        isFullService = db.university_master.Where(x => x.universityid == universityID).Select(x => x.full_service).FirstOrDefault();

                        if (isFullService)
                        {
                            isDeclarationDoneByApplicant = objCom.IsDeclarationDoneByApplicant(chkUser.studentid, universityID);
                            isDeclarationCompleted = isDeclarationDoneByApplicant;
                            isProfileDetailsCompletedByApplicant = objCom.SetStudentDetailsCompletedStatus(chkUser.studentid, universityID);
                        }
                        else
                        {
                            isDeclarationCompleted = isGteDeclarationDoneByApplicant;
                            isProfileDetailsCompletedByApplicant = objCom.SetGteStudentDetailsCompletedStatus(chkUser.studentid, universityID);
                        }

                        Session["DeclarationDoneByApplicant"] = isDeclarationDoneByApplicant;
                        Session["GteDeclarationDoneByApplicant"] = isGteDeclarationDoneByApplicant;
                        Session["ProfileDetailsCompletedByApplicant"] = isProfileDetailsCompletedByApplicant;
                        Session["FullService"] = isFullService;
                        Session["DeclarationCompleted"] = isDeclarationCompleted;

                        //switch (chkUser.role)
                        //{
                        //    case 1:
                        //        Response.Redirect(webURL + "admin/default.aspx");
                        //        break;
                        //    case 2:
                        //        Response.Redirect(webURL + "agentdashboard.aspx");
                        //        break;
                        //    case 3:
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
