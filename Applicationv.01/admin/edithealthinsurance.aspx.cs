using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edithealthinsurance : System.Web.UI.Page
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

                managehealth_insurance existingInsurance = db.managehealth_insurance.Where(obj => obj.id == id).First();
                bindInsurance();
                bindCity();
                bindCurrency();
                if (existingInsurance != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingInsurance.amount);

                    if (existingInsurance.insuranceid != 0)
                    {
                        ddlInsurance.ClearSelection();
                        ddlInsurance.Items.FindByValue(existingInsurance.insuranceid.ToString()).Selected = true;
                    }
                    if (existingInsurance.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingInsurance.currencyid.ToString()).Selected = true;
                    }
                    if (existingInsurance.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingInsurance.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insurance details does not exists')", true);

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
    private void bindInsurance()
    {
        try
        {
            ListItem lst = new ListItem("Please select Insurance", "0");
            List<health_insurance> Insuranceplan = db.health_insurance.ToList();

            ddlInsurance.DataSource = Insuranceplan;
            ddlInsurance.DataTextField = "description";
            ddlInsurance.DataValueField = "id";
            ddlInsurance.DataBind();
            ddlInsurance.Items.Insert(0, lst);
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
        int InsuranceID = 0, CityID = 0, Currencyid = 0;
        if (ddlInsurance.SelectedItem.Value != "0")
            InsuranceID = Convert.ToInt32(ddlInsurance.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingInsurance = (from Insurance in db.managehealth_insurance
                            where Insurance.insuranceid == InsuranceID && Insurance.cityid == CityID && Insurance.id != id
                            select Insurance).FirstOrDefault();
        if (existingInsurance == null)
        {
            managehealth_insurance InsuranceObj = db.managehealth_insurance.Where(x => x.id == id).First();
            try
            {

                InsuranceObj.insuranceid = Convert.ToInt32(ddlInsurance.SelectedItem.Value);
                InsuranceObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                InsuranceObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                InsuranceObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                db.SaveChanges();
                Response.Redirect("~/admin/managehealthinsurance.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insurance details already exists for the selected city')", true);
    }
}