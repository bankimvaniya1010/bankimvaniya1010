using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createtransportchoice : System.Web.UI.Page
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
            bindTransport();
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
    private void bindTransport()
    {
        try
        {
            ListItem lst = new ListItem("Please select Transport Choice", "0");
            List<transportchoice> transportchoiceplan = db.transportchoice.ToList();

            ddlTransport.DataSource = transportchoiceplan;
            ddlTransport.DataTextField = "description";
            ddlTransport.DataValueField = "id";
            ddlTransport.DataBind();
            ddlTransport.Items.Insert(0, lst);
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
        managetransportchoice transportObj = new managetransportchoice();
        try
        {
            int transportID = 0, CityID = 0, Currencyid = 0;
            if (ddlTransport.SelectedItem.Value != "0")
                transportID = Convert.ToInt32(ddlTransport.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingtransport = (from transport in db.managetransportchoice
                                       where transport.transportchoice == transportID && transport.cityid == CityID 
                                       select transport).FirstOrDefault();
            if (existingtransport == null)
            {

                transportObj.transportchoice = transportID;
                transportObj.cityid = CityID;
                transportObj.currencyid = Currencyid;
                transportObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    transportObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    transportObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());



                db.managetransportchoice.Add(transportObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Transport details already exists for the selected city')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}