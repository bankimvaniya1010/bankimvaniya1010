using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class registeragent : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Common objCom = new Common();
        adminusers usrObj = new adminusers();
        applicantdetails objapplicant = new applicantdetails();
        try
        {

            var existingUser = (from cats in db.adminusers
                                where cats.name.Equals(name.Value.Trim())
                                select cats.username).SingleOrDefault();
            if (string.IsNullOrEmpty(existingUser))
            {
                usrObj.name = name.Value.Trim();
                usrObj.username = name.Value.Trim();
                usrObj.password = objCom.EncodePasswordToMD5(password.Value.Trim());
                usrObj.roleid = 2;
                usrObj.email = email.Value.Trim();
                // usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
                usrObj.status = 1;
                db.adminusers.Add(usrObj);
                db.SaveChanges();

                ///agenttable
                agentmaster objmaster = new agentmaster();
                var data = db.agentmaster.Where(x => x.email == email.Value.Trim() && x.agentname == name.Value.Trim()).FirstOrDefault();
                if (data == null) {
                    objmaster.agentname = name.Value.Trim();
                    objmaster.email = email.Value.Trim();
                    objmaster.isactive = 1;
                    db.agentmaster.Add(objmaster);
                    db.SaveChanges();
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Use Another username/email')", true);

                int universityID = Utility.GetUniversityId();
                StringBuilder sb = new StringBuilder();
                var univresityDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo, x.full_service }).FirstOrDefault();
                var subject = "Registration with GTE";
                if (univresityDetails.full_service == 0)
                    subject = "GTE Centre: Congratulations! You have successfully registered your agency.";

                sb.Append("Dear " + name.Value.Trim() + ",");
                webURL = webURL + "login.aspx";
                sb.Append("Congratulations, you have been successfully registered as an authorised agent in the GTE Direct Centre.< br/>");
                sb.Append("You will now feature in our database and future students can choose to assign the credit of their GTE Assessment to you." +" <br/><br/>");

                sb.Append("Have a good day,:" + " <br/>");
                if(univresityDetails.full_service == 0)
                    sb.Append("GTE Direct Team"+ "<br/><br/><br/>");
                else
                    sb.Append("The Application Centre Team"+ "<br/><br/><br/>");
                
                sb.Append("The "+ univresityDetails.university_name + " GTE Centre is managed by GTE DIRECT, the World's leading Artificial Intelligence driven Global Students Training, Evaluation and Documents Verification Services. To know more about how we support Education Institutions, Education & Migration Agents, and International Students visit www.gtedirect.com" + " <br/>");
                sb.Append("Password:" + password.Value.Trim() + " <br/>");
                sb.Append("Thank You GTE Backend Team");
                objCom.SendMail(email.Value.Trim(), sb.ToString(), subject);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your profile has been created')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username already taken try with something else')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}