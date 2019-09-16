using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_majordesription : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindMajorDescription();
    }
    private void BindMajorDescription()
    {
        try
        {
            var MajorList = (from q in db.majordiscipline_master
                             join um in db.university_master
                             on q.universityid equals um.universityid

                             select new
                             {
                                 id = q.id,
                                 description = q.description,
                                 UniversityName = um.university_name,
                             }).ToList();
            if (MajorList != null)
            {
                gvMajorDescription.DataSource = MajorList;
                gvMajorDescription.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvMajorDescription_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvMajorDescription.EditIndex = -1;
        BindMajorDescription();
    }

    protected void gvMajorDescription_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                majordiscipline_master objMajor = new majordiscipline_master();

                TextBox txtDescription = (TextBox)gvMajorDescription.FooterRow.FindControl("txtDescription1");
                DropDownList ddlUniversityFooter = (DropDownList)gvMajorDescription.FooterRow.FindControl("ddlUniversityFooter");

                objMajor.description = txtDescription.Text.Trim();
                objMajor.universityid = Convert.ToInt32(ddlUniversityFooter.SelectedValue);
                db.majordiscipline_master.Add(objMajor);
                db.SaveChanges();
                BindMajorDescription();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvMajorDescription_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvMajorDescription_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvMajorDescription.DataKeys[e.RowIndex].Values[0]);
            majordiscipline_master objMajor = db.majordiscipline_master.Where(b => b.id == ID).First();
            db.majordiscipline_master.Remove(objMajor);
            db.SaveChanges();
            BindMajorDescription();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvMajorDescription.EditIndex = e.NewEditIndex;
            BindMajorDescription();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvMajorDescription_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvMajorDescription.DataKeys[e.RowIndex].Values[0]);
            majordiscipline_master objMajor = db.majordiscipline_master.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvMajorDescription.Rows[e.RowIndex].FindControl("txtDescription");
            DropDownList ddlUniversity = (DropDownList)gvMajorDescription.Rows[e.RowIndex].FindControl("ddlUniversity");

            objMajor.description = txtDescription.Text.Trim();
            objMajor.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            
            gvMajorDescription.EditIndex = -1;
            db.SaveChanges();
            BindMajorDescription();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}