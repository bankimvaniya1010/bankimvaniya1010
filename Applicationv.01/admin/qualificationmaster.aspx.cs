using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_qualificationmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "admin/login.aspx", true);
        if (!IsPostBack)
            BindQualification();
    }
    private void BindQualification()
    {
        try
        {
            var QualificationList = (from q in db.qualificationmaster

                                     select new
                                     {
                                         qualificationid = q.qualificationid,
                                         qualificationname = q.qualificationname,

                                     }).ToList();
            if (QualificationList != null)
            {
                QualificationGridView.DataSource = QualificationList;
                QualificationGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QualificationGridView_DataBound(object sender, EventArgs e)
    {

    }

    protected void QualificationGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QualificationGridView.EditIndex = -1;
        BindQualification();
    }

    protected void QualificationGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                qualificationmaster objQualification = new qualificationmaster();

                TextBox txtQualification = (TextBox)QualificationGridView.FooterRow.FindControl("txtQualificationFooter");

                objQualification.qualificationname = txtQualification.Text.Trim();

                db.qualificationmaster.Add(objQualification);
                db.SaveChanges();
                BindQualification();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QualificationGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void QualificationGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void QualificationGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int qualificationID = Convert.ToInt32(QualificationGridView.DataKeys[e.RowIndex].Values[0]);
            qualificationmaster QID = db.qualificationmaster.Where(b => b.qualificationid == qualificationID).First();
            db.qualificationmaster.Remove(QID);
            db.SaveChanges();
            BindQualification();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QualificationGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QualificationGridView.EditIndex = e.NewEditIndex;
        BindQualification();
    }

    protected void QualificationGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void QualificationGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int qualificationID = Convert.ToInt32(QualificationGridView.DataKeys[e.RowIndex].Values[0]);
            qualificationmaster objQualification = db.qualificationmaster.Where(b => b.qualificationid == qualificationID).First();


            TextBox txtQualification = (TextBox)QualificationGridView.Rows[e.RowIndex].FindControl("txtQualification");

            objQualification.qualificationname = txtQualification.Text.Trim();

            QualificationGridView.EditIndex = -1;
            db.SaveChanges();
            BindQualification();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}