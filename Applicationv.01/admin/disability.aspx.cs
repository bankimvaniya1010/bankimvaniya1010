using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_disability : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();        
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
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

                var existingData = (from data in db.disabilitymaster
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objDisability.description = txtDescription.Text.Trim();

                    db.disabilitymaster.Add(objDisability);
                    db.SaveChanges();
                    BindDisability();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description')", true);
                }
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
            var existsInUniversitywisemapping = (from umm in db.universitywisemastermapping
                                                 join mn in db.master_name on umm.masterid equals mn.masterid
                                                 where umm.universityid == universityID && mn.mastername.ToUpper().Contains("Disability Master") && umm.mastervalueid == ID
                                                 select umm).ToList();
            var existsInPersonalDetails = db.applicantdetails.Where(d => d.disabilitydescription == ID.ToString()).ToList();
            if (existsInUniversitywisemapping.Count == 0 && existsInPersonalDetails.Count == 0)
            {
                db.disabilitymaster.Remove(objDisability);
                db.SaveChanges();
                BindDisability();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This Disability as it already Used in another records')", true);



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

    protected void gvDisability_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDisability.PageIndex = e.NewPageIndex;
        BindDisability();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvDisability.FooterRow != null)
            control = gvDisability.FooterRow;
        else
            control = gvDisability.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        disabilitymaster objID = new disabilitymaster();

        objID.description = idDescriptonText;

        db.disabilitymaster.Add(objID);
        db.SaveChanges();
        BindDisability();
    }
}