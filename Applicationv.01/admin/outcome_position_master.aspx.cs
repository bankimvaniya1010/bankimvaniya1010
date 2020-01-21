using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_outcome_position_master : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var data = (from pm in db.careeroutcomes_position_master
                        join cm in db.careeroutcomes_master on pm.careerID equals cm.careerID
                        select new
                        {
                            id = pm.careerpositionID,
                            description = pm.description,
                            careerID = cm.description,
                        }).ToList();            
            if (data != null)
            {
                gvPositions.DataSource = data;
                gvPositions.DataBind();
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPositions_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvPositions_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvPositions.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPositions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                careeroutcomes_position_master objID = new careeroutcomes_position_master();

                TextBox txtDescription = (TextBox)gvPositions.FooterRow.FindControl("txtDescription1");
                DropDownList ddlcareerFooter = (DropDownList)gvPositions.FooterRow.FindControl("ddlcareerFooter");
                int careerID = Convert.ToInt32(ddlcareerFooter.SelectedValue);

                var existingData = (from data in db.careeroutcomes_position_master
                                    where data.description == txtDescription.Text.Trim() && data.careerID == careerID
                                    select data).FirstOrDefault();
                if (existingData == null)
                {
                    objID.description = txtDescription.Text.Trim();
                    objID.careerID = Convert.ToInt32(ddlcareerFooter.SelectedValue);

                    db.careeroutcomes_position_master.Add(objID);
                    db.SaveChanges();
                    BindGrid();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description ')", true);
                }
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }

    protected void gvPositions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            var careeroutcomesmaster = db.careeroutcomes_master.ToList();
            DropDownList ddlcareer = (e.Row.FindControl("ddlcareer") as DropDownList);
            DropDownList ddlcareerFooter = (e.Row.FindControl("ddlcareerFooter") as DropDownList);

            ListItem lst = new ListItem("Please select", "0");

            string selectedcareerName = "";
            Label careerName = (e.Row.FindControl("lblcareer") as Label);

            if (careerName != null)
                selectedcareerName = careerName.Text;

            if (ddlcareer != null)
            {
                ddlcareer.DataSource = careeroutcomesmaster;
                ddlcareer.DataTextField = "description";
                ddlcareer.DataValueField = "careerID";
                ddlcareer.DataBind();
                ddlcareer.Items.Insert(0, lst);
                ddlcareer.Items.FindByText(selectedcareerName).Selected = true;
            }

            if (ddlcareerFooter != null)
            {
                ddlcareerFooter.DataSource = careeroutcomesmaster;
                ddlcareerFooter.DataTextField = "description";
                ddlcareerFooter.DataValueField = "careerID";
                ddlcareerFooter.DataBind();
                ddlcareerFooter.Items.Insert(0, lst);                
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
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPositions_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvPositions_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvPositions.DataKeys[e.RowIndex].Values[0]);
            careeroutcomes_position_master objID = db.careeroutcomes_position_master.Where(b => b.careerpositionID == ID).First();
            var existsIncaoursemapping = db.careerposition_course_mapping.Where(d => d.positionID == ID).ToList();
            
            if (existsIncaoursemapping.Count == 0)
            {
                db.careeroutcomes_position_master.Remove(objID);
                db.SaveChanges();
                BindGrid();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this outcome position as it already used in another records')", true);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPositions_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPositions.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvPositions_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvPositions_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvPositions.DataKeys[e.RowIndex].Values[0]);
            careeroutcomes_position_master objID = db.careeroutcomes_position_master.Where(b => b.careerpositionID == ID).First();


            TextBox txtDescription = (TextBox)gvPositions.Rows[e.RowIndex].FindControl("txtDescription");
            DropDownList ddlcareer = (DropDownList)gvPositions.Rows[e.RowIndex].FindControl("ddlcareer");

            objID.description = txtDescription.Text.Trim();
            objID.careerID = Convert.ToInt32(ddlcareer.SelectedValue);

            gvPositions.EditIndex = -1;
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }

    protected void gvPositions_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPositions.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void Add(object sender, EventArgs e)
    {
        try
        {
            Control control = null;
            if (gvPositions.FooterRow != null)
                control = gvPositions.FooterRow;
            else
                control = gvPositions.Controls[0].Controls[0];
            string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
            DropDownList ddlEmptyRecordcareer = (control.FindControl("ddlEmptyRecordcareer") as DropDownList);

            if (string.IsNullOrEmpty(idDescriptonText))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
                return;
            }

            careeroutcomes_position_master objID = new careeroutcomes_position_master();

            objID.description = idDescriptonText;
            objID.careerID = Convert.ToInt32(hidSelectedCareer.Value);

            db.careeroutcomes_position_master.Add(objID);
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex) { log.WriteLog(ex.ToString()); }
    }

    protected void ddlEmptyRecordcareer_Load(object sender, EventArgs e)
    {
        Control control = null;
        if (gvPositions.FooterRow != null)
            control = gvPositions.FooterRow;
        else
            control = gvPositions.Controls[0].Controls[0];
        DropDownList ddlEmptyRecordcareer = (control.FindControl("ddlEmptyRecordcareer") as DropDownList);


        ListItem lst = new ListItem("Please select", "0");
        List<careeroutcomes_master> careeroutcomesmaster = new List<careeroutcomes_master>();
        careeroutcomesmaster = db.careeroutcomes_master.ToList();

        ddlEmptyRecordcareer.DataSource = careeroutcomesmaster;
        ddlEmptyRecordcareer.DataTextField = "description";
        ddlEmptyRecordcareer.DataValueField = "careerID";
        ddlEmptyRecordcareer.DataBind();
        ddlEmptyRecordcareer.Items.Insert(0, lst);
    }
}