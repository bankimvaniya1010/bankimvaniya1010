using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_preliminaryvideomaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var QuestionList = (from q in db.tutorialmaster join um in db.university_master
                                on q.universityid equals um.universityid

                                select new
                                {
                                    id = q.id,
                                    videourl = q.videourl,
                                    description = q.description,
                                    status = q.status,
                                    UniversityName= um.university_name
                                }).ToList();
            if (QuestionList != null)
            {
                QuestiontGridView.DataSource = QuestionList;
                QuestiontGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                tutorialmaster objVideo = new tutorialmaster();
                TextBox txtVideoURL = (TextBox)QuestiontGridView.FooterRow.FindControl("txtVideoFooter");
                TextBox txtDescription = (TextBox)QuestiontGridView.FooterRow.FindControl("txtDescriptionFooter");
                DropDownList ddlUniversity = (DropDownList)QuestiontGridView.FooterRow.FindControl("ddlUniversityFooter");
                CheckBox chkStatus = (CheckBox)QuestiontGridView.FooterRow.FindControl("chkValidFooter");

                objVideo.videourl = txtVideoURL.Text.Trim();
                objVideo.description = txtDescription.Text.Trim();
                if (ddlUniversity.SelectedValue != "")
                    objVideo.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                objVideo.status = chkStatus.Checked==true?1:0;
                db.tutorialmaster.Add(objVideo);

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
        QuestiontGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            tutorialmaster qm = db.tutorialmaster.Where(b => b.id == ID).First();
            TextBox txtVideoURL = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtVideoURL");
            TextBox txtDescription = (TextBox)QuestiontGridView.Rows[e.RowIndex].FindControl("txtDescription");
            DropDownList ddlUniversity = (DropDownList)QuestiontGridView.Rows[e.RowIndex].FindControl("ddlUniversity");
            CheckBox chkStatus = (CheckBox)QuestiontGridView.Rows[e.RowIndex].FindControl("chkValidEdit");
            qm.videourl = txtVideoURL.Text.Trim();
            qm.description = txtDescription.Text.Trim();
            qm.status = chkStatus.Checked == true ? 1 : 0;
            if (ddlUniversity.SelectedValue != "")
                qm.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            QuestiontGridView.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QuestiontGridView.EditIndex = -1;
        BindGrid();
    }

    protected void QuestiontGridView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in QuestiontGridView.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            tutorialmaster qm = db.tutorialmaster.Where(b => b.id == ID).First();
            db.tutorialmaster.Remove(qm);
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ListItem lst = new ListItem("Please select", "0");
        var University = db.university_master.ToList();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.DataItem != null)
            {
                //check if is in edit mode
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {

                    DropDownList ddlUniversityEdit = (e.Row.FindControl("ddlUniversity") as DropDownList);
                    string selectedName = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();

                    Label lblUniversity = (e.Row.FindControl("lblUniversityEdit") as Label);
                    if (lblUniversity != null)
                        selectedName = lblUniversity.Text;
                    if (ddlUniversityEdit != null)
                    {

                        ddlUniversityEdit.DataSource = University;
                        ddlUniversityEdit.DataTextField = "university_name";
                        ddlUniversityEdit.DataValueField = "universityID";
                        ddlUniversityEdit.DataBind();
                        ddlUniversityEdit.Items.Insert(0, lst);
                        ddlUniversityEdit.Items.FindByText(selectedName).Selected = true;
                    }
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            DropDownList ddlUniversityFooter = (e.Row.FindControl("ddlUniversityFooter") as DropDownList);
            if (ddlUniversityFooter != null)
            {

                ddlUniversityFooter.DataSource = University;
                ddlUniversityFooter.DataTextField = "university_name";
                ddlUniversityFooter.DataValueField = "universityID";
                ddlUniversityFooter.DataBind();
                ddlUniversityFooter.Items.Insert(0, lst);
            }
        }

    }

  
}