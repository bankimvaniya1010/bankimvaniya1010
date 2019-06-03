using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_educationverificationcontactmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "admin/login.aspx", true);
        if (!IsPostBack)
            BindEducationVerificationContact();
    }
    private void BindEducationVerificationContact()
    {
        try
        {
            var EducationVerificationContactList = (from q in db.educationverificationcontactmaster

                             select new
                             {
                                 id = q.id,
                                 description = q.description,

                             }).ToList();
            if (EducationVerificationContactList != null)
            {
                gvEducationVerificationContact.DataSource = EducationVerificationContactList;
                gvEducationVerificationContact.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationVerificationContact_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvEducationVerificationContact_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvEducationVerificationContact.EditIndex = -1;
        BindEducationVerificationContact();
    }

    protected void gvEducationVerificationContact_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                educationverificationcontactmaster objEducation = new educationverificationcontactmaster();

                TextBox txtDescription = (TextBox)gvEducationVerificationContact.FooterRow.FindControl("txtDescriptionFooter");

                objEducation.description = txtDescription.Text.Trim();

                db.educationverificationcontactmaster.Add(objEducation);
                db.SaveChanges();
                BindEducationVerificationContact();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationVerificationContact_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
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

    protected void gvEducationVerificationContact_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvEducationVerificationContact_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvEducationVerificationContact.DataKeys[e.RowIndex].Values[0]);
            educationverificationcontactmaster objEducation = db.educationverificationcontactmaster.Where(b => b.id == ID).First();
            db.educationverificationcontactmaster.Remove(objEducation);
            db.SaveChanges();
            BindEducationVerificationContact();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationVerificationContact_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvEducationVerificationContact.EditIndex = e.NewEditIndex;
            BindEducationVerificationContact();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvEducationVerificationContact_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvEducationVerificationContact_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvEducationVerificationContact.DataKeys[e.RowIndex].Values[0]);
            educationverificationcontactmaster objEducation = db.educationverificationcontactmaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvEducationVerificationContact.Rows[e.RowIndex].FindControl("txtDescription");

            objEducation.description = txtDescription.Text.Trim();

            gvEducationVerificationContact.EditIndex = -1;
            db.SaveChanges();
            BindEducationVerificationContact();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}