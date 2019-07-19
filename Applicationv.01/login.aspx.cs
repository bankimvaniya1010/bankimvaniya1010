using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class login : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        //var University = db.university_master.FirstOrDefault();
        //string UniversityURL = University.website.Split('.')[0];
        //webURL = webURL.Replace("edu", UniversityURL);

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            string encodedPassword = objCom.EncodePasswordToMD5(txt_pass.Text.ToString());
            var chkUser = (from usr in db.students
                           where (usr.username.Equals(txtUser.Text.Trim()) && usr.password.Equals(encodedPassword))
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
                pnl_warning.Visible = false;                
                Session["LoginInfo"] = chkUser;
                Session["UserID"] = chkUser.studentid;
                objCom.IsDeclarationDoneByApplicant(chkUser.studentid, universityID);
                objCom.IsGteDeclarationDoneByApplicant(chkUser.studentid);
                objCom.SetStudentDetailsCompletedStatus(chkUser.studentid, universityID);

                //switch (chkUser.role)
                //{
                //    case 1:
                //        Response.Redirect(webURL + "admin/default.aspx");
                //        break;
                //    case 2:
                //        Response.Redirect(webURL + "agentdashboard.aspx");
                //        break;
                //    case 3:
                Response.Redirect(webURL + "default.aspx",true);
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

        catch (Exception ex)
        { objLog.WriteLog(ex.ToString()); }
    }

}
