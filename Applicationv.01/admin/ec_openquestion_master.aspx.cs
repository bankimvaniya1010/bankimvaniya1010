using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_openquestion_master : System.Web.UI.Page
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
            var data = (from om in db.ec_openquestion_master
                        join gm in db.ec_grademaster on om.gradeid equals gm.id into Gdata
                        from G1 in Gdata.DefaultIfEmpty()
                        join sm in db.subjectmaster on om.subjectid equals sm.id into SData
                        from s1 in SData.DefaultIfEmpty()
                        select new
                        {
                            id = om.id,
                            subject = s1.description,
                            grade = G1.description,
                            questiontype = om.questiontype == 1 ? "Text" : om.questiontype == 2 ? "Image" : om.questiontype == 3 ? "Audio" : om.questiontype == 4 ? "Video" : string.Empty,
                            viewpage = "#",
                            question = om.question,
                            uploadedfile_url= webURL+ "/Docs/Eclass_Service/QuestionBank/" + om.uploadedfile_url,
                            checkingguid_url = webURL + "/Docs/Eclass_Service/QuestionBank/" + om.checkingguid_url,
                            correctanswer= om.correctanswer,
                            marks = om.marks,
                            time= om.time,
                            questionfor = om.question_for == 1 ? "For Assignment" : om.question_for == 2 ? "For Assessment" : om.question_for == null ? "-" : "For Both",
                        }).OrderByDescending(x=>x.id).ToList();
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
        Response.Redirect(webURL + "admin/ec_openquestion_create.aspx", true);
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
                Response.Redirect(webURL + "admin/ec_openquestion_create.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("Delete"))
            {
                ec_openquestion_master em = db.ec_openquestion_master.Where(b => b.id == ID).First();
                db.ec_openquestion_master.Remove(em);
                db.SaveChanges();
                BindGrid();
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


    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblquestiontype = (Label)e.Row.FindControl("lblquestion");
                HyperLink fileURL = (HyperLink)e.Row.FindControl("fileURL");
                Label lbltext = ((Label)e.Row.FindControl("lbltext"));

                if (lblquestiontype.Text == "Text")
                {
                    fileURL.Attributes.Add("style", "display:none");
                    lbltext.Attributes.Add("style", "display:block");
                }
                else
                {
                    fileURL.Attributes.Add("style", "display:block");
                    lbltext.Attributes.Add("style", "display:none");
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}