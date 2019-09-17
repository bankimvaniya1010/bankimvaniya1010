using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createhealthinsurance : System.Web.UI.Page
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
            bindInsurance();
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
            List<health_insurance> Insurance = db.health_insurance.ToList();

            ddlInsurance.DataSource = Insurance;
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
        managehealth_insurance InsuranceObj = new managehealth_insurance();
        try
        {
            int InsuranceID = 0, CityID = 0, Currencyid = 0;
            if (ddlInsurance.SelectedItem.Value != "0")
                InsuranceID = Convert.ToInt32(ddlInsurance.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingInsurance = (from Insurance in db.managehealth_insurance
                                     where Insurance.insuranceid == InsuranceID && Insurance.cityid == CityID
                                 select Insurance).FirstOrDefault();
            if (existingInsurance == null)
            {

                InsuranceObj.insuranceid = InsuranceID;
                InsuranceObj.cityid = CityID;
                InsuranceObj.currencyid = Currencyid;
                InsuranceObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdult.Value.Trim() != "")
                    InsuranceObj.extra_adult_amount = Convert.ToDecimal(txtExtraAdult.Value.Trim());
                if (txtExtraChild.Value.Trim() != "")
                    InsuranceObj.extra_child_amount = Convert.ToDecimal(txtExtraChild.Value.Trim());
                db.managehealth_insurance.Add(InsuranceObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Insurance details already exists for the selected city')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}