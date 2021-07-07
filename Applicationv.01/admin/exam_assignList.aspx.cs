using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_assignList : System.Web.UI.Page
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
    
    private void BindGrid(int universityid, int selectedexamassignerid, int examid,DateTime examdate)
    {
        try
        {
            var examlList = (from es in db.exam_assign
                             join ad in db.applicantdetails on es.applicantid equals ad.applicantid

                             join em in db.exam_master on es.exampapersid equals em.exampapersid

                             join eshe in db.exam_schedule on es.exampapersid equals eshe.exampapersid 

                             join um in db.university_master on es.universityID equals um.universityid 

                             where es.universityID == universityid && ad.universityid == universityid && es.exam_datetime == eshe.exam_datetime && es.examassignerid == selectedexamassignerid && es.exam_datetime == examdate && es.exampapersid == examid
                             select new
                             {
                                 assignid = es.assignid,
                                 universityname = um.university_name,
                                 paper_name = em.exam_name,
                                 studentname = es.applicantid +" "+ ad.firstname,
                                 exam_datetime = eshe.exam_datetime,
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
            int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniversityid && x.examinerID == selectedexaminerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                validateDiv.Attributes.Add("style", "display:none");
                creatediv.Attributes.Add("style", "display:block");
                Bind_Class(selecteduniversityid);
                Bind_Group(selecteduniversityid);
                Bind_Subject(selecteduniversityid);

                //BindGrid(selecteduniversityid, selectedexaminerId);
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
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        Response.Redirect(webURL + "admin/exam_assign.aspx?universityid=" + selecteduniversityid + "&examinerid=" + selectedexaminerId + "", true);
    }
       
    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        int examid = Convert.ToInt32(ddlexam.SelectedValue);
        DateTime examdatetime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);

        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid(selecteduniversityid, selectedexaminerId, examid, examdatetime);
    }

    protected void ddlsubjcet_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlexam.ClearSelection();
        ddlExamDateTime.ClearSelection();
        int classid = Convert.ToInt32(ddlclass.SelectedValue);
        int groupid = Convert.ToInt32(ddlgroup.SelectedValue);
        int subjectid = Convert.ToInt32(ddlsubjcet.SelectedValue);
        string subjectID = ddlsubjcet.SelectedValue;
        int selecteduniversiy = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindSheduledExamPaper(selecteduniversiy, classid, groupid, subjectID);

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

            int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedexamId = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selecteddatetime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
            int selectedexamassignerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            DivGrid.Attributes.Add("style", "display:block");
            BindGrid(selecteduniversityid, selectedexamassignerId, selectedexamId, selecteddatetime);

        }
        else
            DivGrid.Attributes.Add("style", "display:none");

    }
    protected void ddlexam_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlExamDateTime.ClearSelection();
        

        int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
        int selectedexaminerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindExamDateTime(selectedexampapersid, selectedexaminerId);
    }
    private void BindExamDateTime(int exampapersid, int examassignerid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "Please select");
            var paper = db.exam_schedule.Where(x => x.exampapersid == exampapersid && x.examassignerid == examassignerid).ToList();
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
}