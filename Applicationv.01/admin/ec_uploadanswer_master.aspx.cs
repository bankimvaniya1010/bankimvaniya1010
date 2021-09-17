using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_uploadanswer_master : System.Web.UI.Page
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
            var List = (from x in db.ec_uploadanswer_master
                        join gm in db.ec_grademaster on x.gradeid equals gm.id into Gdata
                        from G1 in Gdata.DefaultIfEmpty()
                        join sm in db.subjectmaster on x.subjectid equals sm.id into SData
                        from s1 in SData.DefaultIfEmpty()
                        where x.adminid == adminId && x.univesityid == universityID
                        select new
                        {
                            id = x.questionid,
                            subject = s1.description,
                            grade = G1.description,
                            questiondescription = x.questiondescription,
                            questionpath = webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminId + "/" + x.questionpath,
                            extrasheetpath = x.extrasheetpath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminId + "/ExtraSheet/" + x.extrasheetpath,
                            extrafilepath = x.extrafilepath == null ? null : webURL + "Docs/Eclass_Service/QuestionBank/upload_answer_master/" + universityID + "/" + adminId + "/AnyFile/" + x.extrafilepath,
                            audiovideofile_tobeviewed = x.ischeckonce == null ? "No" : "Yes",
                            check = x.ischeckonce == null ? 0 : 1,
                            marks = x.marks,
                            time = x.duration,
                        }).ToList();
            QuestiontGridView.DataSource = List;
            QuestiontGridView.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_uploadanswer_create.aspx", true);
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
                Response.Redirect(webURL + "admin/ec_uploadanswer_create.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("Delete"))
            {
                ec_uploadanswer_master em = db.ec_uploadanswer_master.Where(b => b.questionid == ID).First();
                db.ec_uploadanswer_master.Remove(em);
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