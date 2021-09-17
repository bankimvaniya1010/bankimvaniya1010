using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_class_create_assign_students_master : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;

    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

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
        if (!IsPostBack)
        {
            BindGrid();
        }

    }

    private void BindGrid()
    {
        try
        {
            var data = (from om in db.ec_class_master
                        join assm in db.ec_class_applicationmaster on om.id equals assm.classid
                        join gm in db.ec_grademaster on om.gradeid equals gm.id
                        join sm in db.subjectmaster on om.subjectid equals sm.id
                        join tm in db.ec_type_master on om.type equals tm.type_id
                        join mm in db.ec_mode_master on om.modeid equals mm.mode_id
                        where om.universityid == universityID
                        select new
                        {
                            classid = om.id,
                            classname = om.classname,
                            grade = gm.description,
                            Subject = sm.description,
                            Type = tm.type_description,
                            Mode= mm.mode_description,
                            Location =string.Empty,
                            startdate = om.startdate,
                            Recurrence = om.recurrenceid == 1?"Daily":om.recurrenceid== 2?"Weekly":"Monthly",
                            Avialability = om.availability,
                            bookablestatus = om.booklatestatus == 1?"Yes":"No",
                        }).Distinct().ToList();
            QuestiontGridView.DataSource = data;
            QuestiontGridView.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_class_create_assign_students.aspx", true);
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName.Equals("Edit"))
            {
                Response.Redirect(webURL + "admin/ec_class_create_assign_students.aspx?id=" + ID, true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
   
}
