using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edittrips : System.Web.UI.Page
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

                managetrips existingTrips = db.managetrips.Where(obj => obj.id == id).First();
                bindTrips();
                bindCity();
                bindCurrency();
                if (existingTrips != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingTrips.amount);

                    if (existingTrips.tripid != 0)
                    {
                        ddlTrips.ClearSelection();
                        ddlTrips.Items.FindByValue(existingTrips.tripid.ToString()).Selected = true;
                    }
                    if (existingTrips.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingTrips.currencyid.ToString()).Selected = true;
                    }
                    if (existingTrips.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingTrips.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Trips details does not exists')", true);

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
            ddlCity.DataTextField = "description";
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
    private void bindTrips()
    {
        try
        {
            ListItem lst = new ListItem("Please select Trips", "0");
            List<trips> tripsplan = db.trips.ToList();

            ddlTrips.DataSource = tripsplan;
            ddlTrips.DataTextField = "description";
            ddlTrips.DataValueField = "id";
            ddlTrips.DataBind();
            ddlTrips.Items.Insert(0, lst);
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
        int TripsID = 0, CityID = 0, Currencyid = 0;
        if (ddlTrips.SelectedItem.Value != "0")
            TripsID = Convert.ToInt32(ddlTrips.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingTrips = (from Trips in db.managetrips
                             where Trips.tripid == TripsID && Trips.cityid == CityID && Trips.id!=id
                             select Trips).FirstOrDefault();
        if (existingTrips == null)
        {
            managetrips TripsObj = db.managetrips.Where(x => x.id == id).First();
            try
            {

                TripsObj.tripid = Convert.ToInt32(ddlTrips.SelectedItem.Value);
                TripsObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                TripsObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                TripsObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                db.SaveChanges();
                Response.Redirect("~/admin/managetrips.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Trips details already exists for the selected city')", true);
    }
}