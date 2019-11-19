using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_sutdymode : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindStudyMode();
    }
    private void BindStudyMode()
    {
        try
        {
            var ModeList = (from q in db.studymodemaster
                            join um in db.university_master
                            on q.universityid equals um.universityid
                            select new
                            {
                                id = q.id,
                                description = q.description,
                                universityid = um.university_name,
                            }).ToList();
            if (ModeList != null)
            {
                gvStudemode.DataSource = ModeList;
                gvStudemode.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvStudemode_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvStudemode_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvStudemode.EditIndex = -1;
        BindStudyMode();
    }

    protected void gvStudemode_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                studymodemaster ObjMOde = new studymodemaster();

                TextBox txtDescription = (TextBox)gvStudemode.FooterRow.FindControl("txtDescription1");
                DropDownList ddlUniversityFooter = (DropDownList)gvStudemode.FooterRow.FindControl("ddlUniversityFooter");

                var existingData = (from data in db.studymodemaster
                                    where data.description == txtDescription.Text.Trim() && data.universityid.ToString() == ddlUniversityFooter.SelectedValue
                                    select data).FirstOrDefault();
                if (existingData == null)
                {
                    ObjMOde.description = txtDescription.Text.Trim();
                    ObjMOde.universityid = Convert.ToInt32(ddlUniversityFooter.SelectedValue);

                    db.studymodemaster.Add(ObjMOde);
                    db.SaveChanges();
                    BindStudyMode();
                }
                else {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description and university')", true);
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvStudemode_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            var universitymaster = db.university_master.ToList();
            DropDownList ddlUniversityEdit = (e.Row.FindControl("ddlUniversity") as DropDownList);
            DropDownList ddlUniversityFooter = (e.Row.FindControl("ddlUniversityFooter") as DropDownList);
            ListItem lst = new ListItem("Please select", "0");

            if (ddlUniversityFooter != null)
            {
                ddlUniversityFooter.DataSource = universitymaster;
                ddlUniversityFooter.DataTextField = "university_name";
                ddlUniversityFooter.DataValueField = "universityid";
                ddlUniversityFooter.DataBind();
                ddlUniversityFooter.Items.Insert(0, lst);
            }
            if (ddlUniversityEdit != null)
            {
                ddlUniversityEdit.DataSource = universitymaster;
                ddlUniversityEdit.DataTextField = "university_name";
                ddlUniversityEdit.DataValueField = "universityid";
                ddlUniversityEdit.DataBind();
                ddlUniversityEdit.Items.Insert(0, lst);
            }
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[4].Controls[0];
                    if (lb != null)
                    {
                        //attach the JavaScript function with the ID as the paramter
                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvStudemode_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvStudemode_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvStudemode.DataKeys[e.RowIndex].Values[0]);
            studymodemaster ObjMOde = db.studymodemaster.Where(b => b.id == ID).First();
            var existsInapplicationlanguagedetails = db.applicantlanguagecompetency.Where(l => l.studymode == ID).ToList();
            var existsInapplicationmaster = db.applicationmaster.Where(a => a.modeofstudy == ID).ToList();
            var existsInapplicanteducationdetails = db.applicanteducationdetails.Where(d => d.highschoolmodeid == ID && d.secondarymodestudy == ID && d.diplomastudymodeid == ID).ToList();
            var existsINapplicanthighereducation = db.applicanthighereducation.Where(h => h.studymodeid == ID).ToList();
            var existsIncoursemaster = db.coursemaster.Where(c => c.modeofstudyId == ID).ToList();
            if (existsInapplicationlanguagedetails.Count == 0 && existsInapplicationmaster.Count == 0 && existsInapplicanteducationdetails.Count == 0 && existsINapplicanthighereducation.Count == 0 && existsIncoursemaster.Count == 0)
            {
                db.studymodemaster.Remove(ObjMOde);
                db.SaveChanges();
                BindStudyMode();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This Mode Of Study as it already Used in another records')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        } 
    }

    protected void gvStudemode_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvStudemode.EditIndex = e.NewEditIndex;
        BindStudyMode();
    }

    protected void gvStudemode_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvStudemode_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvStudemode.DataKeys[e.RowIndex].Values[0]);
            studymodemaster ObjMOde = db.studymodemaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvStudemode.Rows[e.RowIndex].FindControl("txtDescription");
            DropDownList ddlUniversity = (DropDownList)gvStudemode.Rows[e.RowIndex].FindControl("ddlUniversity");

            ObjMOde.description = txtDescription.Text.Trim();
            ObjMOde.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);

            gvStudemode.EditIndex = -1;
            db.SaveChanges();
            BindStudyMode();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvStudemode_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStudemode.PageIndex = e.NewPageIndex;
        BindStudyMode();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvStudemode.FooterRow != null)
            control = gvStudemode.FooterRow;
        else
            control = gvStudemode.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        DropDownList ddlEmptyRecorduniversity = (control.FindControl("ddlEmptyRecorduniversity") as DropDownList);

        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        studymodemaster objID = new studymodemaster();

        objID.description = idDescriptonText;
        objID.universityid = Convert.ToInt32(ddlEmptyRecorduniversity.SelectedValue);

        db.studymodemaster.Add(objID);
        db.SaveChanges();
        BindStudyMode();
    }

    protected void ddlEmptyRecorduniversity_Load(object sender, EventArgs e)
    {
        Control control = null;        
        DropDownList ddlEmptyRecorduniversity = (control.FindControl("ddlEmptyRecorduniversity") as DropDownList);

        var universitymaster = db.university_master.ToList();
        ListItem lst = new ListItem("Please select", "0");
        ddlEmptyRecorduniversity.DataSource = universitymaster;
        ddlEmptyRecorduniversity.DataTextField = "university_name";
        ddlEmptyRecorduniversity.DataValueField = "universityid";
        ddlEmptyRecorduniversity.DataBind();
        ddlEmptyRecorduniversity.Items.Insert(0, lst);
    }
}