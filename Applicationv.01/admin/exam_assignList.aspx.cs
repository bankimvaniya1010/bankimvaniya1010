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
            bindUniversity();
    }
    private void bindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
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
    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUniversity.SelectedValue != "")
            BindGrid(Convert.ToInt32(ddlUniversity.SelectedValue));
    }
    private void BindGrid(int universityid)
    {
        try
        {
            var examlList = (from es in db.exam_assign
                             join ad in db.applicantdetails on es.applicantid equals ad.applicantid

                             join em in db.exam_master on es.exampapersid equals em.exampapersid

                             join eshe in db.exam_schedule on es.exampapersid equals eshe.exampapersid 

                             join um in db.university_master on es.universityID equals um.universityid 

                             where es.universityID == universityid && ad.universityid == universityid && es.exam_datetime == eshe.exam_datetime
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
}