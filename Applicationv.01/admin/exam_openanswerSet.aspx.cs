            using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_openanswerSet : System.Web.UI.Page
{
     Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public int typeid = 0;
    public int recordID = 0;
    exam_openanswer_master objmapping = new exam_openanswer_master();
    int selectedexaminerid, selecteduniversityid;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if ((Request.QueryString["universityid"] == null) || (Request.QueryString["universityid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selecteduniversityid = Convert.ToInt32(Request.QueryString["universityid"]);

        if ((Request.QueryString["examinerid"] == null) || (Request.QueryString["examinerid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            selectedexaminerid = Convert.ToInt32(Request.QueryString["examinerid"]);


        if (Request.QueryString["ID"] != null && Request.QueryString["ID"].ToString() != "")
        {
            recordID = -1;
            if (int.TryParse(Request.QueryString["id"], out recordID))
            {
                objmapping = db.exam_openanswer_master.Where(obj => obj.questionid == recordID).FirstOrDefault();
                if (objmapping == null)
                    recordID = -1;
            }
        }

        if (!IsPostBack)
        {
            if (objmapping != null)
                PopulatetInfo();
        }

        //if (!IsPostBack)
        //    BindUniversity();
    }

    //private void BindUniversity()
    //{
    //    try
    //    {
    //        ListItem lst = new ListItem("Please select", "0");
    //        dynamic Universities;
    //        if (roleName.ToLower() == "admin")
    //            Universities = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
    //        else
    //        {
    //            universityID = Convert.ToInt32(Session["universityId"]);
    //            Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
    //        }

    //        ddlUniversity.DataSource = Universities;
    //        ddlUniversity.DataTextField = "university_name";
    //        ddlUniversity.DataValueField = "universityid";
    //        ddlUniversity.DataBind();
    //        ddlUniversity.Items.Insert(0, lst);
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    //private void BindExaminer(int universityid)
    //{
    //    try
    //    {
    //        ListItem lst = new ListItem("Please select", "0");
    //        var examinerId = db.examiner_master.Where(x => x.universityId == universityid && x.roleid == 9).ToList();
    //        ddlexaminer.DataSource = examinerId;
    //        ddlexaminer.DataTextField = "name";
    //        ddlexaminer.DataValueField = "examinerID";
    //        ddlexaminer.DataBind();
    //        ddlexaminer.Items.Insert(0, lst);
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    //protected void btn_submit_Click(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
    //        int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
    //        string enteredPasskey = txtpasskey.Value.Trim();
    //        var examinerpasskey = db.examiner_master.Where(x => x.universityId == selecteduniID && x.examinerID == examinerId).Select(x => x.examinerkey).FirstOrDefault();

    //        if (enteredPasskey == examinerpasskey)
    //        {
    //            gridDiv.Attributes.Add("style", "display:block");
    //            validateDiv.Attributes.Add("style", "display:none");
    //            BindGrid(selecteduniID, examinerId);
    //        }
    //        else
    //        {
    //            validateDiv.Attributes.Add("style", "display:block");
    //            gridDiv.Attributes.Add("style", "display:none");
    //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered passkey doest not match with records.')", true);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    //protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    gridDiv.Attributes.Add("style", "display:none");
    //    btn_submit.Attributes.Add("style", "display:block");
    //    int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
    //    BindExaminer(selecteduniID);
    //}

    //protected void ddlexaminer_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    gridDiv.Attributes.Add("style", "display:none");
    //    btn_submit.Attributes.Add("style", "display:block");
    //    int selecteduniID = Convert.ToInt32(ddlUniversity.SelectedValue);
    //    int examinerId = Convert.ToInt32(ddlexaminer.SelectedValue);
    //    // BindGrid(selecteduniID, examinerId);
    //}

    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {
        int typeId = Convert.ToInt32(ddltype.SelectedValue);
        typeid = typeId;
        if (typeId == 1)
        {
            txtanswer.Attributes.Add("style", "display:block");
            fileuploaddiv.Attributes.Add("style", "display:none");
        }
        else
        {
            txtanswer.Attributes.Add("style", "display:none");
            fileuploaddiv.Attributes.Add("style", "display:block");
        }
    }

    private void PopulatetInfo()
    {
        try {
            
            var data = db.exam_openanswer_master.Where(x => x.questionid == recordID).FirstOrDefault();
            if (data != null)
            {
                txtquestion.Text = data.question;
                if (data.checking_file != null)
                {
                    hidlnkevalution.Value = data.checking_file;
                    lnkevalution.NavigateUrl = webURL + "Docs/Exammodule/OpenAnswerFiles/"+data.universityid+"/"+data.examinerid+ "/evaluationfile/" + data.checking_file;
                    lnkevalution.Text = "View File";
                }

                if (data.type != null)
                {
                    ddltype.ClearSelection();
                    ddltype.Items.FindByValue(data.type.ToString()).Selected = true;
                }

                if (data.type != null)
                {
                    if (data.type == 1)
                        txtanswer.Text = data.answer;
                    else
                    {
                        hidlnkanswer.Value = data.answer;
                        lnkanswer.NavigateUrl = webURL + "Docs/Exammodule/OpenAnswerFiles/" + data.universityid + "/" + data.examinerid + "/" + data.answer;
                        lnkanswer.Text = "View File";
                    }
                }
                txtmarks.Value = data.marks;
                txttime.Value = data.duration;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            if (recordID != -1)
            {
                var Data = (from tInfo in db.exam_openanswer_master
                            where tInfo.questionid == recordID
                                    select tInfo).FirstOrDefault();

                if (Data != null)
                {
                    mode = "update";
                    objmapping = Data;
                }
            }
            //var mode = "new";

            docPath = docPath + "/Exammodule/OpenAnswerFiles/" + selecteduniversityid + "/" + selectedexaminerid;
            objmapping.question = txtquestion.Text;
            if (uploadcheckingfile.HasFile)
            {
                string path1 = docPath + "/evaluationfile/";
                string fileName1 = string.Concat(Guid.NewGuid(), Path.GetExtension(uploadcheckingfile.PostedFile.FileName));
                string filePath1 = string.Concat(path1, fileName1);
                if (!Directory.Exists(path1))
                    Directory.CreateDirectory(path1);
                uploadcheckingfile.PostedFile.SaveAs(filePath1);
                objmapping.checking_file = fileName1;
            }
            objmapping.universityid = selecteduniversityid;
            objmapping.examinerid = selectedexaminerid;
            objmapping.type = Convert.ToInt32(ddltype.SelectedValue);
            if (Convert.ToInt32(ddltype.SelectedValue) == 1)
                objmapping.answer = txtanswer.Text;
            else
            {

                if (fileupload.HasFile)
                {
                    string path = docPath + "/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileupload.PostedFile.FileName));
                    string filePath = string.Concat(path, fileName);
                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);
                    fileupload.PostedFile.SaveAs(filePath);
                    objmapping.answer = fileName;
                }
            }
            objmapping.marks = txtmarks.Value;
            objmapping.duration = txttime.Value;
            if(mode=="new")
                db.exam_openanswer_master.Add(objmapping);
            db.SaveChanges();

            txtquestion.Text = "";
            ddltype.ClearSelection();
            txtmarks.Value = "";
            txttime.Value = "";
            txtanswer.Attributes.Add("style", "display:none");
            fileuploaddiv.Attributes.Add("style", "display:none");
            if(mode== "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved .')", true);
            else if(mode =="update")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record updated.')", true);
            //BindGrid(selecteduniversityid, selectedexaminerid);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void GridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    private void BindGrid(int universityid, int examinerid)
    {
        try
        {
            var List = (from mv in db.exam_openanswer_master
                        where mv.universityid == universityid && mv.examinerid == examinerid
                        select new
                        {
                            id = mv.questionid,
                            question = mv.question,
                            type = mv.type == 1 ? "Text": mv.type == 2 ? "Image": mv.type == 3 ?"Video": mv.type == 4 ?"Audio": null,
                            questiontype = mv.type== 1? null : mv.type,
                            marks= mv.marks,
                            duration = mv.duration,
                            answer = mv.type == 1 ? mv.answer : webURL + "Docs/Exammodule/OpenAnswerFiles/" + mv.universityid + "/" + mv.examinerid + "/" + mv.answer,
                        }).ToList();
            if (List != null)
            {
                GridView.DataSource = List;
                GridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}