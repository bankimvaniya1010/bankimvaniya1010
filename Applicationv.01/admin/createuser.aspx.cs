﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            ListItem lst = new ListItem("Please select", "0");
            dynamic roleMaster = db.rolemaster.ToList();

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

    public void saverec() {
        Common objCom = new Common();
        adminusers usrObj = new adminusers();
        var mode = "new";
        if (RecordId != -1)
        {
            var adminData = (from tInfo in db.adminusers
                             where tInfo.universityId == universityID && tInfo.adminid == RecordId
                             select tInfo).FirstOrDefault();

            if (adminData != null)
            {
                mode = "update";
                usrObj = adminData;
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

        if (mode == "new")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully'); window.location='" + webURL + "admin/editusers.aspx';", true);
        else if (mode == "update")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='" + webURL + "admin/editusers.aspx';", true);
    }
}