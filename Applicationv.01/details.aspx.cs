using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class details : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    int applicantid = 0, universityID;
    string webURL = String.Empty;
    public string universityGTMCode = string.Empty;
    public string logourl = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == ""))
        {
            Response.Redirect(webURL + "login.aspx", true);
        }
        else
            applicantid = Convert.ToInt32(Request.QueryString["id"].ToString());
        try
        {
            var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();
            logourl = webURL + "/Docs/" + university.universityid + "/" + university.logo;
            universityGTMCode = university.university_gtm_code;

            if (!IsPostBack)
            {
                Bind_Class(universityID);
                Bind_Group(universityID);
                Bind_Subject(universityID);
                populate();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public void populate() {
        try {
            var existingDetails = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityID).FirstOrDefault();
            if (existingDetails != null)
            {
                if (existingDetails.classId != null)
                {
                    ddlclass.ClearSelection();
                    ddlclass.Items.FindByValue(existingDetails.classId.ToString()).Selected = true;
                }
                if (existingDetails.groupId != null)
                {
                    ddlgroup.ClearSelection();
                    ddlgroup.Items.FindByValue(existingDetails.groupId.ToString()).Selected = true;
                }
                if (existingDetails.subjectId != null)
                {
                    ddlsubject.ClearSelection();
                    ddlsubject.Items.FindByValue(existingDetails.subjectId.ToString()).Selected = true;
                }
                if (existingDetails.studentid != null)
                    txtstudentid.Value = existingDetails.studentid;
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public void Bind_Subject(int institutionId)
    {
        try
        {
           
            var group = (from ap in db.exam_subjectmaster
                         join cwm in db.exam_universitywisesubjectmapping on ap.id equals cwm.subjectID
                         where cwm.universityID == institutionId
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();

            ddlsubject.DataSource = group;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
           
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try {
            var mode = "new";
            applicantdetails objmapping = new applicantdetails();
            var details = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityID).FirstOrDefault();
            if (details != null)
            {
                mode = "update";
                objmapping = details;
            }
            objmapping.classId = Convert.ToInt32(ddlclass.SelectedValue);
            objmapping.groupId = Convert.ToInt32(ddlgroup.SelectedValue);
            //objmapping.subjectId = Convert.ToInt32(ddlsubject.SelectedValue);
            objmapping.studentid = txtstudentid.Value; 
            objmapping.exam_institutionId = universityID; 
            if (mode == "new")
                db.applicantdetails.Add(objmapping);
            db.SaveChanges();


            IEnumerable<exam_applicant_subjectmapping> list = db.exam_applicant_subjectmapping.Where(x => x.universityid == universityID && x.applicantid == applicantid).ToList();
            db.exam_applicant_subjectmapping.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in ddlsubject.Items)
            {
                if (li.Selected)
                {
                    int subjectid = Convert.ToInt16(li.Value);
                    exam_applicant_subjectmapping mappingObj = new exam_applicant_subjectmapping();
                    mappingObj.universityid = universityID;
                    mappingObj.applicantid = applicantid;
                    mappingObj.subjectid = subjectid;
                    db.exam_applicant_subjectmapping.Add(mappingObj);
                    db.SaveChanges();
                }
            }

            Response.Redirect(webURL + "default.aspx");
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}