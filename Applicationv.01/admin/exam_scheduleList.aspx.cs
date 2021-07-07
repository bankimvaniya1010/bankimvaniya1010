﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_scheduleList : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        
        if (!IsPostBack)
            BindUniversity();
    }

    private void BindGrid( int universityid , int selectedexamassignerid)
    {
        try
        {
            var examlList = (from es in db.exam_schedule
                             join em in db.exam_master on es.exampapersid equals em.exampapersid
                             join um in db.university_master on es.universityid equals um.universityid
                             where es.universityid == universityid && es.examassignerid == selectedexamassignerid
                             select new
                             {
                                 scheduleid = es.scheduleid,
                                 universityname = um.university_name,
                                 paper_name = em.exam_name,
                                 utctimezone = es.utctimezone,
                                 exam_datetime = es.exam_datetime,
                                 exam_datetime_utc = es.exam_datetime_utc,
                             }).OrderBy(x => x.scheduleid).ToList();
            if (examlList != null)
            {
                QuestiontGridView.DataSource = examlList;
                QuestiontGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
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

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniversityid);
    }

    private void BindExaminer(int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x => x.universityId == universityId && x.roleid == 12).ToList();
            ddlexaminer.DataSource = examinerId;
            ddlexaminer.DataTextField = "name";
            ddlexaminer.DataValueField = "examinerID";
            ddlexaminer.DataBind();
            ddlexaminer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        creatediv.Attributes.Add("style", "display:none");
        txtpasskey.Value = "";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexamassignerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedexamassignerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                validateDiv.Attributes.Add("style", "display:none");
                creatediv.Attributes.Add("style", "display:block");
                BindGrid(selecteduniversityid, selectedexamassignerId);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexamassignerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        Response.Redirect(webURL + "admin/exam_schedule.aspx?universityid=" + selecteduniversityid + "&examinerid=" + selectedexamassignerId + "", true);
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid(selecteduniversityid, selectedexaminerId);
    }
}