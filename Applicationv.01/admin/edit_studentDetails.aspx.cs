using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edit_studentDetails : System.Web.UI.Page
{
    int userID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if ((Request.QueryString["ID"] == null) || (Request.QueryString["ID"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            userID = Convert.ToInt32(Request.QueryString["ID"].ToString());

        if (!IsPostBack) {
            populateInfo();
        }
    }

    private void BindList() {
        try {

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    private void populateInfo()
    {
        try {
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            if (profileInfo != null) {
                lblname.Value = profileInfo.firstname + " " + profileInfo.lastname;
                txtstudentid.Value = profileInfo.studentid;
                if (profileInfo.classId != null)
                {
                    ddlclass.ClearSelection();
                    Bind_Class(Convert.ToInt32(profileInfo.exam_institutionId));
                    ddlclass.Items.FindByValue(profileInfo.classId.ToString()).Selected = true;
                    HidclassID.Value = profileInfo.classId.ToString();
                }
                else
                    Bind_Class(Convert.ToInt32(profileInfo.exam_institutionId));

                if (profileInfo.groupId != null)
                {
                    ddlgroup.ClearSelection();
                    Bind_Group(Convert.ToInt32(profileInfo.exam_institutionId));
                    ddlgroup.Items.FindByValue(profileInfo.groupId.ToString()).Selected = true;
                    HidGroupID.Value = profileInfo.groupId.ToString();
                }
                else
                    Bind_Group(Convert.ToInt32(profileInfo.exam_institutionId));
                Bind_Subject(Convert.ToInt32(profileInfo.exam_institutionId));
                var universityWise = (from usm in db.exam_applicant_subjectmapping
                                      join sm in db.exam_subjectmaster on usm.subjectid equals sm.id
                                      where usm.universityid == universityID && usm.applicantid == userID
                                      select usm).ToList();
                for (int k = 0; k < universityWise.Count; k++)
                {
                    ddlsubject.Items.FindByValue(universityWise[k].subjectid.ToString()).Selected = true;
                }
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try {

            var mode = "new";
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            applicantdetails objapplicantDetail = new applicantdetails();
            if (profileInfo != null)
            {
                mode = "update";
                objapplicantDetail = profileInfo;
            }
            objapplicantDetail.studentid = txtstudentid.Value;
            if (ddlclass.SelectedValue != null)
            {
                objapplicantDetail.classId = Convert.ToInt32(ddlclass.SelectedValue);
            }
            if (ddlgroup.SelectedValue != null)
            {
                objapplicantDetail.groupId = Convert.ToInt32(ddlgroup.SelectedValue);
            }

            IEnumerable<exam_applicant_subjectmapping> list = db.exam_applicant_subjectmapping.Where(x => x.universityid == universityID && x.applicantid == userID).ToList();
            db.exam_applicant_subjectmapping.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in ddlsubject.Items)
            {
                if (li.Selected)
                {
                    int subjectid = Convert.ToInt16(li.Value);
                    exam_applicant_subjectmapping mappingObj = new exam_applicant_subjectmapping();
                    mappingObj.universityid = universityID;
                    mappingObj.applicantid = userID;
                    mappingObj.subjectid = subjectid;
                    db.exam_applicant_subjectmapping.Add(mappingObj);
                    db.SaveChanges();
                }
            }

            if (mode == "new")
            {
                objapplicantDetail.applicantid = userID;
                objapplicantDetail.universityid = universityID;
                db.applicantdetails.Add(objapplicantDetail);
            }
            db.SaveChanges();
            if (mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record saved successfully.');window.location='" + Request.ApplicationPath + "admin/registered_applicantlist.aspx';", true);                
            else if (mode == "update")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Record updated successfully.');window.location='" + Request.ApplicationPath + "admin/registered_applicantlist.aspx';", true);
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
}