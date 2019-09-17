using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createmealplan : System.Web.UI.Page
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
            bindMealPlan();
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
    private void bindMealPlan()
    {
        try
        {
            ListItem lst = new ListItem("Please select Plan", "0");
            List<managemeal> Accommodationplan = db.managemeal.ToList();

            ddlMeal.DataSource = Accommodationplan;
            ddlMeal.DataTextField = "description";
            ddlMeal.DataValueField = "id";
            ddlMeal.DataBind();
            ddlMeal.Items.Insert(0, lst);
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
        managemealplan mealObj = new managemealplan();
        try
        {
            int mealID = 0, CityID = 0, Currencyid = 0;
            if (ddlMeal.SelectedItem.Value != "0")
                mealID = Convert.ToInt32(ddlMeal.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingMeal = (from meal in db.managemealplan
                                       where meal.mealid == mealID && meal.cityid == CityID 
                                       select meal).FirstOrDefault();
            if (existingMeal == null)
            {

                mealObj.mealid = mealID;
                mealObj.cityid = CityID;
                mealObj.currencyid = Currencyid;
                mealObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    mealObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    mealObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());

                db.managemealplan.Add(mealObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Meal details already exists for the selected city')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}