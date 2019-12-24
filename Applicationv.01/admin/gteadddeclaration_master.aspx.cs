﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gteadddeclaration_master : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();    
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID = 0;
    int RecordID = 0;
    gte_declaration_master objdeclarationmaster = new gte_declaration_master();

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
            RecordID = -1;
            ddlUniversity.Enabled = false;
            if (int.TryParse(Request.QueryString["id"], out RecordID))
            {
                objdeclarationmaster = db.gte_declaration_master.Where(obj => obj.Id == RecordID).FirstOrDefault();
                if (objdeclarationmaster == null)
                    RecordID = -1;
            }
        }
        if (!IsPostBack)
        {
            BindUniversity();
            if (objdeclarationmaster != null)
                PopulateInfo();
        }
    }

    private void PopulateInfo()
    {
        try
        {
            var declarationData = (from tInfo in db.gte_declaration_master
                                   where tInfo.Id == RecordID
                                   select tInfo).FirstOrDefault();
            if (declarationData != null)
            {
                if (declarationData.universityId != null)
                {
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(declarationData.universityId.ToString()).Selected = true;
                }
                txtstatement.Value = declarationData.statementdescription;
                txtheaderstatement.Value = declarationData.header_description;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0"); ;
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
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            int selectedUniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            var RecordOFUniversity = (from tInfo in db.gte_declaration_master
                                      where tInfo.universityId == selectedUniversityID
                                      select tInfo).FirstOrDefault();
            if (RecordOFUniversity != null && RecordID == 0)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Record already present with selected Institution.');window.location='" + Request.ApplicationPath + "admin/gtemanagedeclaration_master.aspx';", true);
            else
            {
                var mode = "new";
                if (RecordID != -1)
                {
                    var RecordData = (from tInfo in db.gte_declaration_master
                                      where tInfo.universityId == selectedUniversityID && tInfo.Id == RecordID
                                      select tInfo).FirstOrDefault();

                    if (RecordData != null)
                    {
                        mode = "update";
                        objdeclarationmaster = RecordData;
                    }
                }

                objdeclarationmaster.statementdescription = txtstatement.Value;
                objdeclarationmaster.header_description = txtheaderstatement.Value;
                objdeclarationmaster.universityId = Convert.ToInt32(ddlUniversity.SelectedValue);
                objdeclarationmaster.edited_by = Convert.ToInt32(Session["Role"]);
                if (mode == "new")
                    db.gte_declaration_master.Add(objdeclarationmaster);
                db.SaveChanges();

                if (mode == "new")
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('Record Inserted Successfully');window.location='" + Request.ApplicationPath + "admin/gtemanagedeclaration_master.aspx';", true);
                else if (mode == "update")
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                            "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + "admin/gtemanagedeclaration_master.aspx';", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }

    }
}