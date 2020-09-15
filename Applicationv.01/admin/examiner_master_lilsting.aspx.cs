using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_examiner_master_lilsting : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    int universityID = 0;

    string roleName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        roleName = Utility.GetRoleName();
        if (string.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
            BindGrid();

    }
    private void BindGrid()
    {
        try
        {
            dynamic list;
            if (roleName.ToLower() =="admin")
             list = (from q in db.examiner_master
                     join rm in db.rolemaster
                     on q.roleid equals rm.roleid
                     join um in db.university_master
                     on q.universityId equals um.universityid
                     join am in db.adminusers on q.adminrecordID equals am.adminid into adminData
                     from x in adminData.DefaultIfEmpty()
                     select new
                        {
                            id = q.examinerID,
                            name = q.name,
                            email = q.email,
                            universityname = um.university_name,
                            rolename = rm.rolename,
                         createdby = q.adminrecordID == null ? string.Empty : x.username + " ("+ q.adminrecordID+")",
                     }).SortBy("id").ToList();
            else
                list = (from q in db.examiner_master
                        join rm in db.rolemaster
                        on q.roleid equals rm.roleid
                        join um in db.university_master
                        on q.universityId equals um.universityid
                        join am in db.adminusers on q.adminrecordID equals am.adminid into adminData
                        from x in adminData.DefaultIfEmpty()
                        where q.universityId == universityID
                        select new
                        {
                            id = q.examinerID,
                            name = q.name,
                            email = q.email,
                            universityname = um.university_name,
                            rolename = rm.rolename,
                            createdby = q.adminrecordID == null? string.Empty: x.username + " (" + q.adminrecordID + ")",
                        }).SortBy("id").ToList();
            if (list != null)
            {
                UserGridView.DataSource = list;
                UserGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        UserGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);

                var isassignasproctor = db.exam_assign.Where(x => x.proctorid == ID).ToList();
                var isassignascrator = db.exam_master.Where(x => x.examinerId == ID).ToList();
                var issassignaschecker = db.examchecking_assignment.Where(x => x.examinerId == ID).ToList();

                if (isassignasproctor.Count == 0 || isassignascrator.Count == 0 || issassignaschecker.Count == 0)
                {
                    examiner_master qm = db.examiner_master.Where(b => b.examinerID == ID).First();
                    db.examiner_master.Remove(qm);
                    db.SaveChanges();

                    adminusers objuser = db.adminusers.Where(x => x.examinermasterID == ID).First();
                    db.adminusers.Remove(objuser);
                    db.SaveChanges();
                    BindGrid();
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Can not delete this role.')", true);
            }
            if (e.CommandName.Equals("resend"))
            {
                var password = objCom.EncodePasswordToMD5(Hidpassword.Value);
                int ID = Convert.ToInt32(e.CommandArgument);
                var examinermaster = db.examiner_master.Where(x => x.examinerID == ID).FirstOrDefault();
                if (examinermaster.password == password)
                {
                    string rolename = db.rolemaster.Where(x => x.roleid == examinermaster.roleid).Select(x => x.rolename).FirstOrDefault();
                    if (examinermaster.email != null)
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("Dear " + examinermaster.name + ",<br/><br/>");
                        sb.Append("Assign as a " + rolename + ".<br/>");
                        sb.Append("Detail :<br/>");
                        sb.Append("Your passkey for access to assessment module is " + examinermaster.examinerkey + "<br/>");
                        sb.Append("Thank You <br/>");
                        objCom.SendMail(examinermaster.email, sb.ToString(), "Your Passkey Details");
                    }
                    Hidpassword.Value = "";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your passkey is send to registered email address.')", true);                  
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your password does not match.')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}