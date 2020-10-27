using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_openanswerSet_list : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int typeid = 0;

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

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
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

    private void BindExaminer(int universityid)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var examinerId = db.examiner_master.Where(x => x.universityId == universityid && x.roleid == 9).ToList();
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

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {

            int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
            int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
            string enteredPasskey = txtpasskey.Value.Trim();
            var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniID && x.examinerID == examinerId).Select(x => x.examinerkey).FirstOrDefault();

            if (enteredPasskey == examinerpasskey)
            {
                gridDiv.Attributes.Add("style", "display:block");
                validateDiv.Attributes.Add("style", "display:none");
                BindGrid(selecteduniID, examinerId);
            }
            else
            {
                validateDiv.Attributes.Add("style", "display:block");
                gridDiv.Attributes.Add("style", "display:none");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridDiv.Attributes.Add("style", "display:none");
        btn_submit.Attributes.Add("style", "display:block");
        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindExaminer(selecteduniID);
    }

    protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    {
        gridDiv.Attributes.Add("style", "display:none");
        btn_submit.Attributes.Add("style", "display:block");
        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
        int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        // BindGrid(selecteduniID, examinerId);
    }

    private void BindGrid(int selecteduniversityid, int selectedexaminerId)
    {
        try
        {
            var examlList = (from em in db.exam_openanswer_master
                             join um in db.university_master on em.universityid equals um.universityid
                             where em.universityid == selecteduniversityid && em.examinerid == selectedexaminerId
                             select new
                             {
                                 questionid = em.questionid,
                                 universityid = em.universityid,
                                 universityname = um.university_name,
                                 question = em.question,
                                 type = em.type == 1 ? "Text" : em.type == 2 ? "Image" : em.type == 3 ? "Video" : em.type == 4 ? "Audio" : null,
                                 questiontype = em.type == 1 ? null : em.type,
                                 answer = em.type == 1 ? em.answer : webURL + "Docs/Exammodule/OpenAnswerFiles/" + em.universityid + "/" + em.examinerid + "/" + em.answer,
                                 marks = em.marks,
                                 duration = em.duration,
                                 checking_file = webURL + "Docs/Exammodule/OpenAnswerFiles/" + selecteduniversityid + "/" + selectedexaminerId + "/evaluationfile/" + em.checking_file,
                             }).OrderBy(x => x.questionid).ToList();
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

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
        int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        Response.Redirect(webURL + "admin/exam_openanswerSet.aspx?universityid=" + selecteduniID + "&examinerid="+ examinerId, true);
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
        int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindGrid(selecteduniID, examinerId);
    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                
                var ifmapped = db.exampapers_master.Where(x => x.questionId == ID && x.questiontype== "Open Answer").ToList();

                if (ifmapped.Count == 0)
                {
                    exam_openanswer_master qm = db.exam_openanswer_master.Where(b => b.questionid == ID).FirstOrDefault();
                    db.exam_openanswer_master.Remove(qm);
                    db.SaveChanges();
                    int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
                    int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
                    BindGrid(selecteduniID, examinerId);
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Can not delete this Question, as its already used in mapping assessment.')", true);
            }
            if (e.CommandName.Equals("Edit"))
            {
                int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
                int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
                int ID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(webURL + "admin/exam_openanswerSet.aspx?universityid="+selecteduniID+ "&examinerid="+examinerId+"&ID=" + ID, true);
            }
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QuestiontGridView.EditIndex = e.NewEditIndex;
        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
        int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
        BindGrid(selecteduniID, examinerId);
    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
}