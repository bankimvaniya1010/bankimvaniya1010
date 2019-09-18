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

                ObjMOde.description = txtDescription.Text.Trim();
                ObjMOde.universityid = Convert.ToInt32(ddlUniversityFooter.SelectedValue);

                db.studymodemaster.Add(ObjMOde);
                db.SaveChanges();
                BindStudyMode();
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
                    LinkButton lb = (LinkButton)e.Row.Cells[3].Controls[0];
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
            db.studymodemaster.Remove(ObjMOde);
            db.SaveChanges();
            BindStudyMode();
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
}