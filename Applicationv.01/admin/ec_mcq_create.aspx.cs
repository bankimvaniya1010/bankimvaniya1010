using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_mcq_create : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, mcqID= 0, adminId, recordid;
    ec_mcq_question_master objmapping = new ec_mcq_question_master();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminId = Convert.ToInt32(Session["UserID"]);
        

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            mcqID = -1;
            if (int.TryParse(Request.QueryString["id"], out mcqID))
            {
                objmapping = db.ec_mcq_question_master.Where(obj => obj.id == mcqID).FirstOrDefault();
                if (objmapping  == null)
                    mcqID = -1;
            }
        }

        if (!IsPostBack)
        {
            BindDropdown();
            if (objmapping != null)
                popuate(mcqID);
        }
    }
    private void BindDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please Select", "0");
            var data = db.subjectmaster.ToList();
            ddlsubject.DataSource = data;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

            var grade = db.ec_grademaster.ToList();
            ddlgrade.DataSource = grade;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void popuate(int mcqID) {
        try {
            var data = db.ec_mcq_question_master.Where(x => x.id == mcqID).FirstOrDefault();
            if (data != null) {
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
                txtquestionname.Value = data.questionname;

                txtquestion.Text = data.question ;
                txtanswer1.Value = data.answer1 ;
                txtanswer2.Value = data.answer2;
                txtanswer3.Value = data.answer3;
                txtanswer4.Value = data.answer4;

                txtdecription1.Text = data.answer_description1;
                txtdecription2.Text = data.answer_description2 ;
                txtdecription3.Text = data.answer_description3;
                txtdecription4.Text = data.answer_description4;

                if (data.correctanswer != null)
                {
                    ddlcorrectans.ClearSelection();
                    ddlcorrectans.Items.FindByValue(data.correctanswer.ToString()).Selected = true;
                }

                txtmarks.Value = data.marks;
                txttime.Value = data.time;
                if (data.question_for == 1)
                    rbl1.Checked = true;
                else if (data.question_for == 2)
                    rbl2.Checked = true;
                else if (data.question_for == 3)
                    rbl3.Checked = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {
            var mode = "new";
            if (mcqID != -1)
            {
                var data = db.ec_mcq_question_master.Where(x => x.id == mcqID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objmapping = data;
                }
            }
            if (ddlgrade.SelectedValue != "0")
                objmapping.gradeid = Convert.ToInt32(ddlgrade.SelectedValue);

            if (ddlsubject.SelectedValue != "0")
                objmapping.subjectid = Convert.ToInt32(ddlsubject.SelectedValue);

            objmapping.questionname = txtquestionname.Value;

            objmapping.question = txtquestion.Text;
            objmapping.answer1 = txtanswer1.Value;
            objmapping.answer2 = txtanswer2.Value;
            objmapping.answer3 = txtanswer3.Value;
            objmapping.answer4 = txtanswer4.Value;

            objmapping.answer_description1 = txtdecription1.Text;
            objmapping.answer_description2 = txtdecription2.Text;
            objmapping.answer_description3 = txtdecription3.Text;
            objmapping.answer_description4 = txtdecription4.Text;

            if (ddlcorrectans.SelectedValue != "0")
                objmapping.correctanswer = Convert.ToInt32(ddlcorrectans.SelectedValue);

            objmapping.marks = txtmarks.Value;
            objmapping.time = txttime.Value;
            if (rbl1.Checked == true)
                objmapping.question_for = 1;
            else if (rbl2.Checked == true)
                objmapping.question_for = 2;
            else if (rbl3.Checked == true)
                objmapping.question_for = 3;

            objmapping.created_by = adminId;
            objmapping.universityid = universityID;
            if (mode == "new")
                db.ec_mcq_question_master.Add(objmapping);
            db.SaveChanges();
            if (mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Inserted Successfully');window.location='" + Request.ApplicationPath + "admin/ec_mcq_master.aspx';", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + "admin/ec_mcq_master.aspx';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}