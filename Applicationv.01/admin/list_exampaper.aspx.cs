using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_list_exampaper : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {            
            var examlList = (from em in db.exam_master
                             join um in db.university_master on em.universityID equals um.universityid
                             select new {
                                 exampapersid= em.exampapersid,
                                 universityname =um.university_name,
                                 universityid = um.universityid,
                                 paper_name =em.exam_name,
                             }).OrderBy(x=>x.universityid).ToList();
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