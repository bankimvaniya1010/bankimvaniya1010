using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_examiner_master : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (string.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            BindUniversity();
            BindRoles();
        }
     }

    private void BindRoles() {
        try {
            ListItem lst = new ListItem("Please select", "0");
            var roles = db.rolemaster.Where(x=>x.roleid == 9 || x.roleid == 10 || x.roleid == 11 || x.roleid == 12).ToList();
            ddlroles.DataSource = roles;
            ddlroles.DataTextField = "rolename";
            ddlroles.DataValueField = "roleid";
            ddlroles.DataBind();
            ddlroles.Items.Insert(0, lst);
        } catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {
            int slecteduniversityId = Convert.ToInt32(ddlUniversity.SelectedValue);
            string username = txtusername.Value;
            
            examiner_master objmapping = new examiner_master();
            var data = db.examiner_master.Where(x => x.universityId == slecteduniversityId && x.username == username).FirstOrDefault();

            if (data == null)
            {
                objmapping.universityId = slecteduniversityId;
                objmapping.name = txtname.Value.Trim();
                objmapping.email = txtemail.Value.Trim();
                objmapping.mobileno = txtcontactno.Value.Trim();
                objmapping.examinerkey = hidtxtpasskey.Value.Trim();
                objmapping.username = txtusername.Value.Trim();
                objmapping.password = objCom.EncodePasswordToMD5(txtpassword.Value.Trim());
                objmapping.roleid = Convert.ToInt32(ddlroles.SelectedValue);
                db.examiner_master.Add(objmapping);
                db.SaveChanges();
                //send email to examiner
                var university = db.university_master.Where(x => x.universityid == slecteduniversityId).FirstOrDefault();
                string rolename = db.rolemaster.Where(x => x.roleid == objmapping.roleid).Select(x => x.rolename).FirstOrDefault();

                if (objmapping.email != null)
                {
                    string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/NewExaminer_Created_Notification.html"));
                    string emailsubject = "Your Assessment Centre Account has been created";
                    html = html.Replace("@UniversityName", university.university_name);
                    html = html.Replace("@universityLogo", webURL + "Docs/" + slecteduniversityId + "/" + university.logo);
                    html = html.Replace("@Name", objmapping.name);
                    html = html.Replace("@rolename", rolename);
                    html = html.Replace("@passkey", objmapping.examinerkey);
                    if (objmapping.roleid == 12)
                    {
                        html = html.Replace("@accesssectionstatement", "give you access to the Schedule and Assign Assessment Sections of the ");
                        html = html.Replace("@examinertask", "Schedule and Assign");
                    }
                    else if (objmapping.roleid == 9)
                    {
                        html = html.Replace("@accesssectionstatement", "give you access to the Create Assessment Section of the ");
                        html = html.Replace("@examinertask", "create");
                    }
                    else if (objmapping.roleid == 10) { 
                        html = html.Replace("@accesssectionstatement", "allow you to be the Proctor for Online ");
                        html = html.Replace("@examinertask", "Proctor");
                    }
                    else if (objmapping.roleid == 11) { 
                        html = html.Replace("@accesssectionstatement", "give you access to the Check Assessment Section of the ");
                        html = html.Replace("@examinertask", "check");
                    }
                    objCom.SendMail(objmapping.email, html, emailsubject);
                }

                savetoadminuser(objmapping.examinerID, objmapping.name, txtusername.Value, objmapping.mobileno, objmapping.password, objmapping.email, Convert.ToInt32(objmapping.roleid), slecteduniversityId);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                       "alert('Record Added Successfully');window.location='" + Request.ApplicationPath + "admin/examiner_master_lilsting.aspx';", true);

            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered user name already registered with selected institution.')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void savetoadminuser(int examinerID, string name , string username, string mobile, string password, string email, int roleid, int universityid)
    {
        try {
            adminusers usrObj = new adminusers();
           
            var adminData = (from tInfo in db.adminusers
                             where tInfo.universityId == universityID && tInfo.username == username
                             select tInfo).FirstOrDefault();

            if (adminData == null)
            {
                usrObj.name =name;
                usrObj.username = username;
                usrObj.mobile = mobile;
                usrObj.password = password;
                usrObj.roleid = roleid;
                usrObj.email = email;
                usrObj.universityId = universityid;
                usrObj.status = 1;
                usrObj.examinermasterID = examinerID;
                db.adminusers.Add(usrObj);
                db.SaveChanges();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username with entered email already available')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Genrateotp()
    {
        Random random = new Random();
        int otp = random.Next(100000, 999999);
        return JsonConvert.SerializeObject(otp);
    }
}