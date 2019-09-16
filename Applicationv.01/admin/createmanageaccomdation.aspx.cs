using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createmanageaccomdation : System.Web.UI.Page
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
            bindAccomdation();
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
        manageaccomdationplan accomdationObj = new manageaccomdationplan();
        try
        {
            int accomdationID = 0, CityID = 0, Currencyid = 0;
            if (ddlAccomdation.SelectedItem.Value != "0")
                accomdationID = Convert.ToInt32(ddlAccomdation.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingAccomdation = (from Accomdation in db.manageaccomdationplan
                                       where Accomdation.accomdationid == accomdationID && Accomdation.cityid == CityID
                                       select Accomdation).FirstOrDefault();
            if (existingAccomdation == null)
            {

                accomdationObj.accomdationid = accomdationID;
                accomdationObj.cityid = CityID;
                accomdationObj.currencyid = Currencyid;
                accomdationObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                db.manageaccomdationplan.Add(accomdationObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Accomdation details already exists for the selected city')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}