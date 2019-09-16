using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editutilities : System.Web.UI.Page
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

                manageutilities existingUtilities = db.manageutilities.Where(obj => obj.id == id).First();
                bindUtilities();
                bindCity();
                bindCurrency();
                if (existingUtilities != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingUtilities.amount);

                    if (existingUtilities.utilityid != 0)
                    {
                        ddlUtilities.ClearSelection();
                        ddlUtilities.Items.FindByValue(existingUtilities.utilityid.ToString()).Selected = true;
                    }
                    if (existingUtilities.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingUtilities.currencyid.ToString()).Selected = true;
                    }
                    if (existingUtilities.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingUtilities.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Utilities details does not exists')", true);

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
    private void bindUtilities()
    {
        try
        {
            ListItem lst = new ListItem("Please select Utilities", "0");
            List<utilities> Utilitiesplan = db.utilities.ToList();

            ddlUtilities.DataSource = Utilitiesplan;
            ddlUtilities.DataTextField = "description";
            ddlUtilities.DataValueField = "id";
            ddlUtilities.DataBind();
            ddlUtilities.Items.Insert(0, lst);
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
        int UtilitiesID = 0, CityID = 0, Currencyid = 0;
        if (ddlUtilities.SelectedItem.Value != "0")
            UtilitiesID = Convert.ToInt32(ddlUtilities.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingUtilities = (from Utilities in db.manageutilities
                            where Utilities.utilityid == UtilitiesID && Utilities.cityid == CityID && Utilities.id != id
                            select Utilities).FirstOrDefault();
        if (existingUtilities == null)
        {
            manageutilities UtilitiesObj = db.manageutilities.Where(x => x.id == id).First();
            try
            {

                UtilitiesObj.utilityid = Convert.ToInt32(ddlUtilities.SelectedItem.Value);
                UtilitiesObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                UtilitiesObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                UtilitiesObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                db.SaveChanges();
                Response.Redirect("~/admin/manageUtilities.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Utilities details already exists for the selected city')", true);
    }
}