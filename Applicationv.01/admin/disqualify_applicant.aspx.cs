using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_disqualify_applicant : System.Web.UI.Page
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
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            objCom.BindInstitution(ddlUniversity, universityID);
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedproctorid = Convert.ToInt32(ddlproctor.SelectedValue);
            string enteredPasskey = txtproctorpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedproctorid).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                validatediv.Attributes.Add("style", "display:none");
                disqualify.Attributes.Add("style", "display:block");
                BindGrid(selecteduniversityid, selectedproctorid);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void bindProctorname(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var data = db.examiner_master.Where(x => x.roleid == 10 && x.universityId == universityid).ToList();

            ddlproctor.DataSource = data;
            ddlproctor.DataTextField = "name";
            ddlproctor.DataValueField = "examinerID";
            ddlproctor.DataBind();
            ddlproctor.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        var institutionid = Convert.ToInt32(ddlUniversity.SelectedValue);
        bindProctorname(institutionid);
    }

    private void BindGrid(int universityid, int selectedproctorid)
    {
        try
        {
            var examlList = (from es in db.exam_assign
                             join ad in db.applicantdetails on es.applicantid equals ad.applicantid

                             join em in db.exam_master on es.exampapersid equals em.exampapersid

                             join eshe in db.exam_schedule on es.exampapersid equals eshe.exampapersid

                             join um in db.university_master on es.universityID equals um.universityid

                             where es.universityID == universityid && ad.universityid == universityid && es.exam_datetime == eshe.exam_datetime && es.proctorid == selectedproctorid
                             select new
                             {
                                 assignid = es.assignid,
                                 universityname = um.university_name,
                                 paper_name = em.exam_name,
                                 studentname = es.applicantid + " " + ad.firstname,
                                 exam_datetime = eshe.exam_datetime,
                                 isverified = es.is_verified,
                                 status = string.IsNullOrEmpty(es.status)? null: es.status,
                                 disqualify_reason = string.IsNullOrEmpty(es.disqualify_reason)? string.Empty :es.disqualify_reason,
                             }).OrderBy(x => x.assignid).ToList();
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


    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedproctorid = Convert.ToInt32(ddlproctor.SelectedValue);
        BindGrid(selecteduniversityid, selectedproctorid);
    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Disqualify")
            {
                var reason = Hidpassword.Value;
                if (!string.IsNullOrEmpty(reason))
                {
                    //int index = Convert.ToInt32(e.CommandArgument);
                    int assignid = Convert.ToInt32(e.CommandArgument);
                    //GridViewRow row = QuestiontGridView.Rows[index];

                    var mode = "new";
                    exam_assign objexam_assign = new exam_assign();
                    var data = db.exam_assign.Where(x => x.assignid == assignid).FirstOrDefault();
                    if (data != null)
                    {
                        mode = "update";
                        objexam_assign = data;
                    }
                    objexam_assign.status = "Disqualified";
                    objexam_assign.disqualify_reason = reason;
                    if (mode == "new")
                        db.exam_assign.Add(objexam_assign);
                    db.SaveChanges();
                    int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                    int selectedproctorid = Convert.ToInt32(ddlproctor.SelectedValue);
                    BindGrid(selecteduniversityid, selectedproctorid);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Reason can not be empty.')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblstatus = (Label)e.Row.FindControl("lblstatus");
                LinkButton lnkDisqualify = ((LinkButton)e.Row.FindControl("lnkSubmit"));

                if (lblstatus.Text == "")
                    lnkDisqualify.Attributes.Add("style", "display:block");
                else
                    lnkDisqualify.Attributes.Add("style", "display:none");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_DataBinding(object sender, EventArgs e)
    {

    }
}