using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_class_create_assign_instructor : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int adminId, universityID, RecordID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    ec_class_applicationmaster objec_class_master = new ec_class_applicationmaster();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        adminId = Convert.ToInt32(Session["UserID"]);
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            RecordID = -1;
            if (int.TryParse(Request.QueryString["id"], out RecordID))
            {
                objec_class_master = db.ec_class_applicationmaster.Where(obj => obj.classid == RecordID).FirstOrDefault();
                if (objec_class_master == null)
                    RecordID = -1;
            }
        }

        if (!IsPostBack)
        {
            BindDropdowns();
            if (objec_class_master != null)
                populate(RecordID);

        }
    }
    private void populate(int classID)
    {
        try
        {
            var data = db.ec_class_master.Where(x => x.id == classID).FirstOrDefault();
            if (data.gradeid != null)
            {
                ddlgrade.ClearSelection();
                ddlgrade.Items.FindByValue(data.gradeid.ToString()).Selected = true;
            }
            if (data.subjectid != null)
            {
                ddlsubject.ClearSelection();
                ddlsubject.Items.FindByValue(data.subjectid.ToString()).Selected = true;
            }
            if (data.type != null)
            {
                ddltype.ClearSelection();
                ddltype.Items.FindByValue(data.type.ToString()).Selected = true;
            }
            if (data.modeid != null)
            {
                ddlmode.ClearSelection();
                ddlmode.Items.FindByValue(data.modeid.ToString()).Selected = true;
            }

            if (data.modeid != null)
            {
                GetClass(Convert.ToInt32(data.gradeid), Convert.ToInt32(data.subjectid), Convert.ToInt32(data.type), Convert.ToInt32(data.modeid));

                ddlclass.ClearSelection();
                ddlclass.Items.FindByValue(classID.ToString()).Selected = true;
            }
            setApplicant(Convert.ToInt32(data.gradeid), Convert.ToInt32(data.subjectid), Convert.ToInt32(data.type), Convert.ToInt32(data.modeid), classID);
            //chkstudent.ClearSelection();
            //var universityWise = db.ec_class_applicant_mapping.Where(x => x.universityid == universityID && x.classid == classID).ToList();
            //for (int k = 0; k < universityWise.Count; k++)
            //{
            //    chkstudent.Items.FindByValue(universityWise[k].applicantid.ToString()).Selected = true;
            //}
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void BindDropdowns()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");

            var grade = db.ec_grademaster.ToList();
            ddlgrade.DataSource = grade;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            var subject = db.subjectmaster.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

            var clas = db.ec_class_master.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void GetClass(int gradeID, int subjectID, int typeID, int modeID)
    {

        var temp = (from x in db.ec_class_master
                    where x.universityid == universityID && x.gradeid == gradeID && x.subjectid == subjectID && x.type == typeID && x.modeid == modeID
                    select new
                    {
                        fieldname = x.classname,
                        id = x.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        ListItem lst = new ListItem("Please select", "0");
        ddlclass.DataSource = temp;
        ddlclass.DataTextField = "fieldname";
        ddlclass.DataValueField = "id";
        ddlclass.DataBind();
        ddlclass.Items.Insert(0, lst);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //string[] selectedApplicant = Request.Form["university"].Split(',');

        try
        {
            int classID = Convert.ToInt32(ddlclass.SelectedValue);
            IEnumerable<ec_class_applicationmaster> list = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == classID).ToList();
            // Use Remove Range function to delete all records at once
            db.ec_class_applicationmaster.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            ec_class_applicationmaster objmapping = new ec_class_applicationmaster();
            //foreach (ListItem li in chkstudent.Items)
            //{
            //    if (li.Selected)
            //    {
            //        int applicantid = Convert.ToInt32(li.Value);
            //        objmapping.universityid = universityID;
            //        objmapping.classid = classID;
            //        objmapping.applicantid = applicantid;

            //        db.ec_class_applicant_mapping.Add(objmapping);
            //        db.SaveChanges();
            //    }
            //}
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID = Convert.ToInt32(ddlmode.SelectedValue);
        int classID = Convert.ToInt32(ddlclass.SelectedValue);
        setApplicant(gradeID, subjectID, typeID, modeID, classID);
    }

    private void setApplicant(int gradeID, int subjectID, int typeID, int modeID, int classID)
    {
        try
        {
            var temp = (from x in db.applicantdetails
                        where x.universityid == universityID && x.isdeletedbyAdmin != true /*&& x.subjectId == subjectID && x.gradeid == gradeID && x.classId == classID*/
                        select new
                        {
                            fieldname = x.firstname + " " + x.middlename + " " + x.lastname,
                            id = x.applicantid,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();

            //chkstudent.DataSource = temp;
            //chkstudent.DataTextField = "fieldname";
            //chkstudent.DataValueField = "id";
            //chkstudent.DataBind();

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        int typeID = Convert.ToInt32(ddltype.SelectedValue);
        int modeID = Convert.ToInt32(ddlmode.SelectedValue);

        GetClass(gradeID, subjectID, typeID, modeID);
    }
}