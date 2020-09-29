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

public partial class createuser : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID = 0;
    int RecordId;
    adminusers objadminusers = new adminusers();
    public string pagemode = "new";
    int isfullservice;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            RecordId = -1;
            if (int.TryParse(Request.QueryString["id"], out RecordId))
            {
                objadminusers = db.adminusers.Where(obj => obj.adminid == RecordId).FirstOrDefault();
                if (objadminusers == null)
                    RecordId = -1;
                pagemode = "edit";                   
            }
        }
        if (!IsPostBack)
        {
            bindDropdown();
            BindSubRoles();
            if (objadminusers != null)
                PopulateUserInfo();
        }
    }

    private void PopulateUserInfo()
    {
        try
        {
            var data = (from tInfo in db.adminusers
                                   where tInfo.adminid == RecordId
                                   select tInfo).FirstOrDefault();
            if (data != null)
            {
                txtName.Value = data.name;
                txtUsername.Value = data.username;
                TxtMobile.Value = data.mobile;                
                if (data.roleid != null)
                {
                    ddlRole.ClearSelection();
                    ddlRole.Items.FindByValue(data.roleid.ToString()).Selected = true;
                }                
                txtEmail.Value = data.email;
                if (data.roleid == 13 || data.roleid ==14)
                {
                    subroles.Attributes.Add("style","display:block");
                   // Divpasskey.Attributes.Add("style", "display:none");
                    // preselected
                    var preselected = db.examiner_master.Where(x => x.adminrecordID == RecordId).ToList();
                    for (int k = 0; k < preselected.Count; k++)
                    {
                        chkroles.Items.FindByValue(preselected[k].roleid.ToString()).Selected = true;
                        chkroles.Items.FindByValue(preselected[k].roleid.ToString()).Enabled = false;
                    }
                    hidpasskey.Value = db.examiner_master.Where(x => x.adminrecordID == RecordId).Select(x => x.examinerkey).FirstOrDefault();
                    txtpasskey.Value = hidpasskey.Value;                    
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void bindDropdown()
    {
        try
        {
            dynamic roleMaster;
            ListItem lst = new ListItem("Please select", "0");

            isfullservice = (int)Session["isfullservice"];
            if (isfullservice == 0)//gte
                roleMaster = db.rolemaster.Where(x => x.forservice.ToLower() == "gte").ToList();
            else if (isfullservice == 1)//fullservice
                roleMaster = db.rolemaster.Where(x => x.forservice.ToLower() == "full").ToList();
            else if (isfullservice == 2)//exam
                roleMaster = db.rolemaster.Where(x => x.forservice.ToLower() == "assessment").ToList();            
            else
                roleMaster = db.rolemaster.ToList();

            ddlRole.DataSource = roleMaster;
            ddlRole.DataBind();
            ddlRole.DataTextField = "rolename";
            ddlRole.DataValueField = "roleid";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, lst);

            if (roleName.ToLower() == "university admin")
            {
                ListItem removeListItem = ddlRole.Items.FindByText("Admin");
                ddlRole.Items.Remove(removeListItem);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void BindSubRoles() {
        try
        {
            dynamic roleMaster;
            
            roleMaster = db.rolemaster.Where(x => x.forservice.ToLower() == "sub_assessment").ToList();

            chkroles.DataSource = roleMaster;
            chkroles.DataBind();
            chkroles.DataTextField = "rolename";
            chkroles.DataValueField = "roleid";
            chkroles.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        try
        {
            int selectedrole = Convert.ToInt32(ddlRole.SelectedValue);            
            var existingUser = (from cats in db.adminusers
                                where (cats.username == txtUsername.Value.Trim() && cats.email == txtEmail.Value && cats.roleid == selectedrole)
                                select cats).SingleOrDefault();
            if (pagemode == "new") {
                if(existingUser == null)
                    saverec();                
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username with entered email already available')", true);
            }
            else if (pagemode == "edit")
            {
                saverec();
            }            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
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

    public void saverec() {
        
        adminusers usrObj = new adminusers();
        examiner_master objmapping = new examiner_master();
        var mode = "new";
        if (RecordId != -1 && RecordId != 0)
        {
            var adminData = (from tInfo in db.adminusers
                             where tInfo.universityId == universityID && tInfo.adminid == RecordId
                             select tInfo).FirstOrDefault();
            if (adminData.roleid == 13 || adminData.roleid == 14)
            {
                var examinerdata = (from em in db.examiner_master
                                    where em.universityId == universityID && em.adminrecordID == RecordId
                                    select em).FirstOrDefault();
                if (adminData != null && examinerdata != null)
                {
                    mode = "update";
                    usrObj = adminData;
                    objmapping = examinerdata;
                }
            }
            else
            {
                if (adminData != null)
                {
                    mode = "update";
                    usrObj = adminData;
                }
            }
        }
        usrObj.name = txtName.Value.Trim();
        usrObj.username = txtUsername.Value.Trim();
        usrObj.mobile = TxtMobile.Value.Trim();
        if (pagemode == "new")
            usrObj.password = objCom.EncodePasswordToMD5(Txtpassword.Value.Trim());
        else
        {
            if (Txtpassword.Value != "")
                usrObj.password = objCom.EncodePasswordToMD5(Txtpassword.Value.Trim());
        }
        usrObj.roleid = Convert.ToInt32(ddlRole.SelectedItem.Value);
        usrObj.email = txtEmail.Value.Trim();
        usrObj.universityId = Utility.GetUniversityId();
        //usrObj.usercreationdate = Convert.ToDateTime(DateTime.Now.ToString(), System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
        usrObj.status = 1;
        if (mode == "new")
            db.adminusers.Add(usrObj);
        db.SaveChanges();
        if (usrObj.roleid == 13 || usrObj.roleid == 14)
        {            
            foreach (ListItem li in chkroles.Items)
            {
                if (li.Selected)
                {
                    int sub_roleid = Convert.ToInt16(li.Value);
                    var examinerdata = db.examiner_master.Where(x => x.adminrecordID == usrObj.adminid && x.roleid == sub_roleid).FirstOrDefault();
                    if (examinerdata == null)
                    {
                        objmapping.universityId = universityID;
                        objmapping.name = usrObj.name;
                        objmapping.email = usrObj.email;
                        objmapping.mobileno = usrObj.mobile;
                        objmapping.examinerkey = hidpasskey.Value.Trim();
                        objmapping.username = usrObj.username;
                        objmapping.password = usrObj.password;
                        objmapping.roleid = sub_roleid;
                        objmapping.adminrecordID = usrObj.adminid;
                        db.examiner_master.Add(objmapping);
                        db.SaveChanges();

                        var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                        string rolename = db.rolemaster.Where(x => x.roleid == objmapping.roleid).Select(x => x.rolename).FirstOrDefault();

                        if (objmapping.email != null)
                        {
                            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/NewExaminer_Created_Notification.html"));
                            string emailsubject = "Your Assessment Centre Account has been created";
                            html = html.Replace("@UniversityName", university.university_name);
                            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + university.logo);
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
                            else if (objmapping.roleid == 10)
                            {
                                html = html.Replace("@accesssectionstatement", "allow you to be the Invigilator for Online ");
                                html = html.Replace("@examinertask", "Invigilator");
                            }
                            else if (objmapping.roleid == 11)
                            {
                                html = html.Replace("@accesssectionstatement", "give you access to the Check Assessment Section of the ");
                                html = html.Replace("@examinertask", "check");
                            }
                            objCom.SendMail(objmapping.email, html, emailsubject);
                        }
                    }
                }
            }
        }
        if (mode == "new")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully'); window.location='" + webURL + "admin/editusers.aspx';", true);
        else if (mode == "update")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='" + webURL + "admin/editusers.aspx';", true);
    }
}