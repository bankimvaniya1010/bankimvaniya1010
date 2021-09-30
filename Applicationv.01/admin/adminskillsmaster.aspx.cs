﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_skillsmaster : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    Logger log = new Logger();
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();        
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        if (!IsPostBack)
            BindAddressProof();
    }
    private void BindAddressProof()
    {
        try
        {
            var AddressList = (from q in db.adminskillsmaster

                               select new
                               {
                                   id = q.id,
                                   coursetype = q.skillsmaster,

                               }).ToList();
            if (AddressList!=null)
            {
                gvAddressProof.DataSource = AddressList;
                gvAddressProof.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvAddressProof_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvAddressProof_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {

            gvAddressProof.EditIndex = -1;
            BindAddressProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvAddressProof_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))
            {
                adminskillsmaster objAdress = new adminskillsmaster();
                
                TextBox txtDescription = (TextBox)gvAddressProof.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.adminskillsmaster
                                    where data.skillsmaster == txtDescription.Text.Trim()
                                    select data.skillsmaster).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objAdress.skillsmaster = txtDescription.Text.Trim();

                    db.adminskillsmaster.Add(objAdress);
                    db.SaveChanges();
                    BindAddressProof();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered skills ')", true);
                }
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }

    protected void gvAddressProof_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvAddressProof_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvAddressProof_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

            int ID = Convert.ToInt32(gvAddressProof.DataKeys[e.RowIndex].Values[0]);
            adminskillsmaster Address = db.adminskillsmaster.Where(b => b.id == ID).First();
           // var existsIndetails = db.applicantdetails.Where(d => d.alternativeresidenceproofId == ID).ToList();
            //var existsInUniversitywisemapping = (from umm in db.universitywisemastermapping
            //                                     join mn in db.master_name on umm.masterid equals mn.masterid
            //                                     where umm.universityid == universityID && mn.mastername.ToUpper().Contains("Alternate Address Proof") && umm.mastervalueid == ID
            //                                     select umm).ToList();

            //if (existsIndetails.Count == 0 && existsInUniversitywisemapping.Count == 0)
            if(Address!=null)
            {
                db.adminskillsmaster.Remove(Address);
                db.SaveChanges();
                BindAddressProof();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Delete successfully')", true);

            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Alternate Address Proof as it already used in another records')", true);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvAddressProof_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {

            gvAddressProof.EditIndex = e.NewEditIndex;
            BindAddressProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvAddressProof_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvAddressProof_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            int ID = Convert.ToInt32(gvAddressProof.DataKeys[e.RowIndex].Values[0]);
            adminskillsmaster fn = db.adminskillsmaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvAddressProof.Rows[e.RowIndex].FindControl("txtDescription");

            fn.skillsmaster = txtDescription.Text.Trim();

            gvAddressProof.EditIndex = -1;
            db.SaveChanges();
            BindAddressProof();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvAddressProof_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAddressProof.PageIndex = e.NewPageIndex;
        BindAddressProof();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvAddressProof.FooterRow != null)
            control = gvAddressProof.FooterRow;
        else
            control = gvAddressProof.Controls[0].Controls[0];
        string addressDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(addressDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('skill Cannot Be Empty')", true);
            return;
        }

        adminskillsmaster objAdress = new adminskillsmaster();

        objAdress.skillsmaster = addressDescriptonText;

        db.adminskillsmaster.Add(objAdress);
        db.SaveChanges();
        BindAddressProof();
    }
}