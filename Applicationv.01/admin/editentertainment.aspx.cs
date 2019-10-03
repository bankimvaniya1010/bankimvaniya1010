using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editentertainment : System.Web.UI.Page
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

                manageentertainment existingEntertainment = db.manageentertainment.Where(obj => obj.id == id).First();
                bindEntertainment();
                bindCity();
                bindCurrency();
                if (existingEntertainment != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingEntertainment.amount);
                    if (existingEntertainment.extra_adult_percentage != null)
                        txtExtraAdultPercentage.Value = Convert.ToString(existingEntertainment.extra_adult_percentage);
                    if (existingEntertainment.extra_child_percentage != null)
                        txtExtraChildPercentage.Value = Convert.ToString(existingEntertainment.extra_child_percentage);

                    if (existingEntertainment.entertainmentid != 0)
                    {
                        ddlEntertainment.ClearSelection();
                        ddlEntertainment.Items.FindByValue(existingEntertainment.entertainmentid.ToString()).Selected = true;
                    }
                    if (existingEntertainment.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingEntertainment.currencyid.ToString()).Selected = true;
                    }
                    if (existingEntertainment.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingEntertainment.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entertainment details does not exists')", true);

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
    private void bindEntertainment()
    {
        try
        {
            ListItem lst = new ListItem("Please select Entertainment", "0");
            List<entertainment> entertainmentplan = db.entertainment.ToList();

            ddlEntertainment.DataSource = entertainmentplan;
            ddlEntertainment.DataTextField = "description";
            ddlEntertainment.DataValueField = "id";
            ddlEntertainment.DataBind();
            ddlEntertainment.Items.Insert(0, lst);
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
        int EntertainmentID = 0, CityID = 0, Currencyid = 0;
        if (ddlEntertainment.SelectedItem.Value != "0")
            EntertainmentID = Convert.ToInt32(ddlEntertainment.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingEntertainment = (from Entertainment in db.manageentertainment
                                     where Entertainment.entertainmentid == EntertainmentID && Entertainment.cityid == CityID
                                     && Entertainment.id != id
                                     select Entertainment).FirstOrDefault();
        if (existingEntertainment == null)
        {
            manageentertainment EntertainmentObj = db.manageentertainment.Where(x => x.id == id).First();
            try
            {

                EntertainmentObj.entertainmentid = Convert.ToInt32(ddlEntertainment.SelectedItem.Value);
                EntertainmentObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                EntertainmentObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                EntertainmentObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    EntertainmentObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    EntertainmentObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());
                db.SaveChanges();
                Response.Redirect("~/admin/manageentertainment.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entertainment details already exists for the selected city')", true);
    }
}