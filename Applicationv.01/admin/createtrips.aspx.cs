using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createtrips : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            bindCity();
            bindTrips();
            bindCurrency();
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
    private void bindTrips()
    {
        try
        {
            ListItem lst = new ListItem("Please select Trips", "0");
            List<trips> trips = db.trips.ToList();

            ddlTrips.DataSource = trips;
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
        managetrips TripsObj = new managetrips();
        try
        {
            int TripsID = 0, CityID = 0, Currencyid = 0;
            if (ddlTrips.SelectedItem.Value != "0")
                TripsID = Convert.ToInt32(ddlTrips.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingTrips = (from Trips in db.managetrips
                                 where Trips.tripid == TripsID && Trips.cityid == CityID
                                       select Trips).FirstOrDefault();
            if (existingTrips == null)
            {

                TripsObj.tripid = TripsID;
                TripsObj.cityid = CityID;
                TripsObj.currencyid = Currencyid;
                TripsObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    TripsObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    TripsObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());

                db.managetrips.Add(TripsObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Trips details already exists for the selected city')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}