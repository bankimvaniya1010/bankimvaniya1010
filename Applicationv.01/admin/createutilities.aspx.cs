using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createutilities : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            bindCity();
            bindUtilities();
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void bindUtilities()
    {
        try
        {
            ListItem lst = new ListItem("Please select Utilities", "0");
            List<utilities> Utilities = db.utilities.ToList();

            ddlUtilities.DataSource = Utilities;
            ddlUtilities.DataTextField = "description";
            ddlUtilities.DataValueField = "id";
            ddlUtilities.DataBind();
            ddlUtilities.Items.Insert(0, lst);
            //ddlstudylevel.SelectedIndex = universityID;

        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
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
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        manageutilities UtilitiesObj = new manageutilities();
        try
        {
            int UtilitiesID = 0, CityID = 0, Currencyid = 0;
            if (ddlUtilities.SelectedItem.Value != "0")
                UtilitiesID = Convert.ToInt32(ddlUtilities.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingUtilities = (from Utilities in db.manageutilities
                                     where Utilities.utilityid == UtilitiesID && Utilities.cityid == CityID
                                 select Utilities).FirstOrDefault();
            if (existingUtilities == null)
            {
                UtilitiesObj.utilityid = UtilitiesID;
                UtilitiesObj.cityid = CityID;
                UtilitiesObj.currencyid = Currencyid;
                UtilitiesObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    UtilitiesObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    UtilitiesObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());

                db.manageutilities.Add(UtilitiesObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Record Inserted Successfully.');window.location='" + webURL + "admin/manageutilities.aspx';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Utilities details already exists for the selected city')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
}