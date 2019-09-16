using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_alternateIdproofcountrywiselisting : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindData();
        }
    }
    private void BindData()
    {
        try
        {
            var list = (from um in db.countrywisealternateidproofmaster
                        join proof in db.alternateidproofmaster on um.alternateidproofID equals proof.id
                        join countries in db.countriesmaster on um.countryID equals countries.id
                        select new
                        {
                            id = um.id,
                            alternateidproofID = proof.description,
                            country = countries.country_name,
                        }).SortBy("id").ToList();
            if (list != null)
            {
                alternateidproofGridView.DataSource = list;
                alternateidproofGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void alternateidproofGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            alternateidproofGridView.EditIndex = e.NewEditIndex;
            BindData();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void alternateidproofGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void alternateidproofGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(alternateidproofGridView.DataKeys[e.RowIndex].Values[0]);
            countrywisealternateidproofmaster objcountrywiseIdmaster= db.countrywisealternateidproofmaster.Where(b => b.id == ID).First();
            db.countrywisealternateidproofmaster.Remove(objcountrywiseIdmaster);
            db.SaveChanges();
            BindData();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void alternateidproofGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        alternateidproofGridView.EditIndex = -1;
        BindData();
    }

    protected void alternateidproofGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void alternateidproofGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(alternateidproofGridView.DataKeys[e.RowIndex].Values[0]);
            countrywisealternateidproofmaster objidproof = db.countrywisealternateidproofmaster.Where(b => b.id == ID).First();


            DropDownList ddlcountry = (DropDownList)alternateidproofGridView.Rows[e.RowIndex].FindControl("ddlcountry");
            DropDownList ddlidproof = (DropDownList)alternateidproofGridView.Rows[e.RowIndex].FindControl("ddlIdProof");

            objidproof.alternateidproofID= Convert.ToInt32(ddlidproof.SelectedValue);
            objidproof.countryID = Convert.ToInt32(ddlcountry.SelectedValue);

            alternateidproofGridView.EditIndex = -1;
            db.SaveChanges();
            BindData();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void alternateidproofGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            var formMaster = db.formmaster.ToList();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    //check if is in edit mode
                    if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                    {

                        DropDownList ddlcountryEdit = (e.Row.FindControl("ddlcountry") as DropDownList);
                        string selectedcountry = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();

                        Label countryname = (e.Row.FindControl("lblCOuntry") as Label);
                        if (countryname != null)
                            selectedcountry = countryname.Text;
                        if (ddlcountryEdit != null)
                        {

                            ddlcountryEdit.DataSource = db.countriesmaster.ToList(); ;
                            ddlcountryEdit.DataTextField = "country_name";
                            ddlcountryEdit.DataValueField = "id";
                            ddlcountryEdit.DataBind();
                            ddlcountryEdit.Items.FindByText(selectedcountry).Selected = true;
                        }

                        DropDownList ddlIdProofEdit = (e.Row.FindControl("ddlIdProof") as DropDownList);
                        string selectedIdProod = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();

                        Label proofName = (e.Row.FindControl("lblddlIdProof") as Label);
                        if (proofName != null)
                            selectedIdProod = proofName.Text;
                        if (ddlIdProofEdit != null)
                        {

                            ddlIdProofEdit.DataSource = db.alternateidproofmaster.ToList(); ;
                            ddlIdProofEdit.DataTextField = "description";
                            ddlIdProofEdit.DataValueField = "id";
                            ddlIdProofEdit.DataBind();
                            ddlIdProofEdit.Items.FindByText(selectedIdProod).Selected = true;
                        }
                    }
                }
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
}