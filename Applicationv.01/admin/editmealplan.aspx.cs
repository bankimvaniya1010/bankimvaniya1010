using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editmealplan : System.Web.UI.Page
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

                managemealplan existingMeal = db.managemealplan.Where(obj => obj.id == id).First();
                bindMeal();
                bindCity();
                bindCurrency();
                if (existingMeal != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingMeal.amount);

                    if (existingMeal.mealid != 0)
                    {
                        ddlMeal.ClearSelection();
                        ddlMeal.Items.FindByValue(existingMeal.mealid.ToString()).Selected = true;
                    }
                    if (existingMeal.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingMeal.currencyid.ToString()).Selected = true;
                    }
                    if (existingMeal.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingMeal.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Meal details does not exists')", true);

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
    private void bindMeal()
    {
        try
        {
            ListItem lst = new ListItem("Please select Meal", "0");
            List<managemeal> mealplan = db.managemeal.ToList();

            ddlMeal.DataSource = mealplan;
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
        int id = Convert.ToInt32(ViewState["id"]);
        int MealID = 0, CityID = 0, Currencyid = 0;
        if (ddlMeal.SelectedItem.Value != "0")
            MealID = Convert.ToInt32(ddlMeal.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingMeal = (from Meal in db.managemealplan
                                   where Meal.mealid == MealID && Meal.cityid == CityID && Meal.id != id
                                   select Meal).FirstOrDefault();
        if (existingMeal == null)
        {
            managemealplan MealObj = db.managemealplan.Where(x => x.id == id).First();
            try
            {

                MealObj.mealid = Convert.ToInt32(ddlMeal.SelectedItem.Value);
                MealObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                MealObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                MealObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                db.SaveChanges();
                Response.Redirect("~/admin/managemealplan.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Meal details already exists for the selected city')", true);
    }
}