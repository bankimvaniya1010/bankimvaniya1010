﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_alternatedobproof : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        if (!IsPostBack)
            BindDOBProof();
    }
    private void BindDOBProof()
    {
        try
        {
            var DOBProof = (from q in db.alternatedobproof

                            select new
                            {
                                id = q.id,
                                description = q.description,

                            }).ToList();
            if (DOBProof != null)
            {
                gvDOBProof.DataSource = DOBProof;
                gvDOBProof.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvDOBProof_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvDOBProof_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvDOBProof.EditIndex = -1;
            BindDOBProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvDOBProof_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                alternatedobproof objDOBAdress = new alternatedobproof();

                TextBox txtDescription = (TextBox)gvDOBProof.FooterRow.FindControl("txtDescription1");

                objDOBAdress.description = txtDescription.Text.Trim();

                db.alternatedobproof.Add(objDOBAdress);
                db.SaveChanges();
                BindDOBProof();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvDOBProof_RowDataBound(object sender, GridViewRowEventArgs e)
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
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvDOBProof_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvDOBProof_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvDOBProof.DataKeys[e.RowIndex].Values[0]);
            alternatedobproof DOB = db.alternatedobproof.Where(b => b.id == ID).First();
            db.alternatedobproof.Remove(DOB);
            db.SaveChanges();
            BindDOBProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvDOBProof_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvDOBProof.EditIndex = e.NewEditIndex;
            BindDOBProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvDOBProof_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvDOBProof_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvDOBProof.DataKeys[e.RowIndex].Values[0]);
            alternatedobproof DOB = db.alternatedobproof.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvDOBProof.Rows[e.RowIndex].FindControl("txtDescription");

            DOB.description = txtDescription.Text.Trim();

            gvDOBProof.EditIndex = -1;
            db.SaveChanges();
            BindDOBProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
}