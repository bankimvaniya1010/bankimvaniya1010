using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editmanageaccomdation : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected string imagepath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id;
                if (!Int32.TryParse(Request.QueryString["id"], out id))
                    Response.Redirect("~/admin/default.aspx");

                manageaccomdationplan existingAccomdation = db.manageaccomdationplan.Where(obj => obj.id == id).First();
                bindAccomdation();
                bindCity();
                bindCurrency();
                if (existingAccomdation != null)
                {
                    ViewState["id"] = id;
                    if (existingAccomdation.extra_adult_percentage != null)
                        txtExtraAdultPercentage.Value = Convert.ToString(existingAccomdation.extra_adult_percentage);
                    if (existingAccomdation.extra_child_percentage != null)
                        txtExtraChildPercentage.Value = Convert.ToString(existingAccomdation.extra_child_percentage);

                    txtFee.Value = Convert.ToString(existingAccomdation.amount);

                    if (existingAccomdation.accomdationid != 0)
                    {
                        ddlAccomdation.ClearSelection();
                        ddlAccomdation.Items.FindByValue(existingAccomdation.accomdationid.ToString()).Selected = true;
                    }
                    if (existingAccomdation.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingAccomdation.currencyid.ToString()).Selected = true;
                    }
                    if (existingAccomdation.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingAccomdation.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Accomdation details does not exists')", true);

            }
            else
                Response.Redirect("~/admin/default.aspx");
        }
    }

    private void bindCity()
    {
        try
        {
            ListItem lst = new ListItem("Please select City", "0");
            List<citymaster> Citymaster = db.citymaster.ToList();

            ddlCity.DataSource = Citymaster;
            ddlCity.DataTextField = "name";
            ddlCity.DataValueField = "city_id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, lst);
            //ddldiscipline.SelectedIndex = universityID;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void bindAccomdation()
    {
        try
        {
            ListItem lst = new ListItem("Please select Accomdation", "0");
            List<accommodationplan> Accommodationplan = db.accommodationplan.ToList();

            ddlAccomdation.DataSource = Accommodationplan;
            ddlAccomdation.DataTextField = "description";
            ddlAccomdation.DataValueField = "id";
            ddlAccomdation.DataBind();
            ddlAccomdation.Items.Insert(0, lst);
            //ddlstudylevel.SelectedIndex = universityID;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void bindCurrency()
    {
        try
        {
            ListItem lst = new ListItem("Please select Currency", "0");
            List<currency_master> Currencymaster = db.currency_master.ToList();

            ddlCurrency.DataSource = Currencymaster;
            ddlCurrency.DataTextField = "currency_symbol";
            ddlCurrency.DataValueField = "id";
            ddlCurrency.DataBind();
            ddlCurrency.Items.Insert(0, lst);
            // ddlstudymode.SelectedIndex = universityID;

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(ViewState["id"]);
        int accomdationID = 0, CityID = 0, Currencyid = 0;
        if (ddlAccomdation.SelectedItem.Value != "0")
            accomdationID = Convert.ToInt32(ddlAccomdation.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingAccomdation = (from Accomdation in db.manageaccomdationplan
                                   where Accomdation.accomdationid == accomdationID && Accomdation.cityid == CityID && Accomdation.currencyid == Currencyid && Accomdation.id != id
                                   select Accomdation).FirstOrDefault();
        if (existingAccomdation == null)
        {
            manageaccomdationplan AccomdationObj = db.manageaccomdationplan.Where(x => x.id == id).First();
            try
            {

                AccomdationObj.accomdationid = Convert.ToInt32(ddlAccomdation.SelectedItem.Value);
                AccomdationObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                AccomdationObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                AccomdationObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    AccomdationObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    AccomdationObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());

                db.SaveChanges();
                Response.Redirect("~/admin/manageaccomdation.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Accomdation details already exists for the selected city')", true);
    }
}