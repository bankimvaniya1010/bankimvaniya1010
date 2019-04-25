using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_disability : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindDisability();
    }
    private void BindDisability()
    {
        try
        {
            var disabilityList = (from q in db.disabilitymaster

                                  select new
                                  {
                                      id = q.id,
                                      description = q.description,

                                  }).ToList();
            if (disabilityList != null)
            {
                gvDisability.DataSource = disabilityList;
                gvDisability.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvDisability_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvDisability_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDisability.EditIndex = -1;
        BindDisability();
    }

    protected void gvDisability_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                disabilitymaster objDisability = new disabilitymaster();

                TextBox txtDescription = (TextBox)gvDisability.FooterRow.FindControl("txtDescription1");

                objDisability.description = txtDescription.Text.Trim();

                db.disabilitymaster.Add(objDisability);
                db.SaveChanges();
                BindDisability();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvDisability_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvDisability_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvDisability_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvDisability.DataKeys[e.RowIndex].Values[0]);
            disabilitymaster objDisability = db.disabilitymaster.Where(b => b.id == ID).First();
            db.disabilitymaster.Remove(objDisability);
            db.SaveChanges();
            BindDisability();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvDisability_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvDisability.EditIndex = e.NewEditIndex;
            BindDisability();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvDisability_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvDisability_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvDisability.DataKeys[e.RowIndex].Values[0]);
            disabilitymaster objDisability = db.disabilitymaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvDisability.Rows[e.RowIndex].FindControl("txtDescription");

            objDisability.description = txtDescription.Text.Trim();

            gvDisability.EditIndex = -1;
            db.SaveChanges();
            BindDisability();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}