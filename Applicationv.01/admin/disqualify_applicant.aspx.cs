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
        universityID = Utility.GetUniversityId();
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
                int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
                DateTime selectedexamdate = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
                BindGrid(selecteduniversityid, selectedproctorid, selectedexamid, selectedexamdate);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindExamDateTime(int exampapersid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "Please select");
            var paper = db.exam_schedule.Where(x => x.exampapersid == exampapersid).ToList();
            ddlExamDateTime.DataSource = paper;
            ddlExamDateTime.DataTextField = "exam_datetime";
            ddlExamDateTime.DataValueField = "exam_datetime";
            ddlExamDateTime.DataBind();
            ddlExamDateTime.Items.Insert(0, lst);
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
        Bind_Class(institutionid);
        Bind_Group(institutionid);
        Bind_Subject(institutionid);
        bindProctorname(institutionid);
    }

    private void BindSheduledExamPaper(int universityid, int classid, int groupid, string subjectid) // Bind universitywise sheduled exam papers
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = (from a in db.exam_master
                         join q in db.exam_schedule on a.exampapersid equals q.exampapersid into cmdata
                         from x in cmdata.DefaultIfEmpty()
                         where a.universityID == universityid && x.universityid == universityid && a.classid == classid && a.groupid == groupid && a.exam_subject == subjectid
                         select new
                         {
                             exam_name = a.exam_name,
                             exampapersid = a.exampapersid
                         }).Distinct().ToList();
            ddlexam.DataSource = paper;
            ddlexam.DataTextField = "exam_name";
            ddlexam.DataValueField = "exampapersid";
            ddlexam.DataBind();
            ddlexam.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public void Bind_Group(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var group = (from ap in db.group_master
                         join cwm in db.institutionwisegroupmaster on ap.id equals cwm.groupId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlgroup.DataSource = group;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void Bind_Subject(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var subject = (from ap in db.exam_subjectmaster
                           join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                           where cwm.universityID == institutionId
                           select new
                           {
                               description = ap.description,
                               id = ap.id
                           }).ToList();

            ddlsubjcet.DataSource = subject;
            ddlsubjcet.DataTextField = "description";
            ddlsubjcet.DataValueField = "id";
            ddlsubjcet.DataBind();
            ddlsubjcet.Items.Insert(0, lst);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    public void Bind_Class(int institutionId)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlclass.DataSource = Class;
            ddlclass.DataTextField = "description";
            ddlclass.DataValueField = "id";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    private void BindGrid(int universityid, int selectedproctorid,int examid, DateTime examdatetime)
    {
        try
        {
            var examlList = (from es in db.exam_assign
                             join ad in db.applicantdetails on es.applicantid equals ad.applicantid

                             join em in db.exam_master on es.exampapersid equals em.exampapersid

                             join eshe in db.exam_schedule on es.exampapersid equals eshe.exampapersid

                             join um in db.university_master on es.universityID equals um.universityid

                             where es.exampapersid==examid && es.exam_datetime == examdatetime && es.universityID == universityid && ad.universityid == universityid && es.exam_datetime == eshe.exam_datetime && es.proctorid == selectedproctorid
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
        int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
        DateTime selectedexamdate = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
        BindGrid(selecteduniversityid, selectedproctorid, selectedexamid, selectedexamdate);
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
                    int selectedexamid = Convert.ToInt32(ddlexam.SelectedValue);
                    DateTime selectedexamdate = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
                    BindGrid(selecteduniversityid, selectedproctorid, selectedexamid, selectedexamdate);
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

    protected void ddlsubjcet_SelectedIndexChanged(object sender, EventArgs e)
    {
        var selectuniversity = Convert.ToInt32(ddlUniversity.SelectedValue);
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        int classid = Convert.ToInt32(ddlclass.SelectedValue);
        int groupid = Convert.ToInt32(ddlgroup.SelectedValue);
        int subjectid = Convert.ToInt32(ddlsubjcet.SelectedValue);
        string subjectID = ddlsubjcet.SelectedValue;

        BindSheduledExamPaper(selectuniversity, classid, groupid, subjectID);

    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubjcet.ClearSelection();
        ddlgroup.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlsubjcet.ClearSelection();
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
    }

    protected void ddlExamDateTime_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlExamDateTime.SelectedValue != "Please select")
        {
            var selectuniversity = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selecteduniversityid = selectuniversity;
            int selectedexamId = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selecteddatetime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
        }        
    }

    protected void ddlexam_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlExamDateTime.ClearSelection();
        int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
        BindExamDateTime(selectedexampapersid);
    }
}