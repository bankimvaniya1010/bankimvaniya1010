using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edittransportchoice : System.Web.UI.Page
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

                managetransportchoice existingTransportchoice = db.managetransportchoice.Where(obj => obj.id == id).First();
                bindTransportchoice();
                bindCity();
                bindCurrency();
                if (existingTransportchoice != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingTransportchoice.amount);
                    if (existingTransportchoice.extra_adult_percentage != null)
                        txtExtraAdultPercentage.Value = Convert.ToString(existingTransportchoice.extra_adult_percentage);
                    if (existingTransportchoice.extra_child_percentage != null)
                        txtExtraChildPercentage.Value = Convert.ToString(existingTransportchoice.extra_child_percentage);

                    if (existingTransportchoice.transportchoice != 0)
                    {
                        ddlTransportchoice.ClearSelection();
                        ddlTransportchoice.Items.FindByValue(existingTransportchoice.transportchoice.ToString()).Selected = true;
                    }
                    if (existingTransportchoice.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingTransportchoice.currencyid.ToString()).Selected = true;
                    }
                    if (existingTransportchoice.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingTransportchoice.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Transportchoice details does not exists')", true);

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
    private void bindTransportchoice()
    {
        try
        {
            ListItem lst = new ListItem("Please select Transportchoice", "0");
            List<transportchoice> transportchoiceplan = db.transportchoice.ToList();

            ddlTransportchoice.DataSource = transportchoiceplan;
            ddlTransportchoice.DataTextField = "description";
            ddlTransportchoice.DataValueField = "id";
            ddlTransportchoice.DataBind();
            ddlTransportchoice.Items.Insert(0, lst);
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
        int TransportchoiceID = 0, CityID = 0, Currencyid = 0;
        if (ddlTransportchoice.SelectedItem.Value != "0")
            TransportchoiceID = Convert.ToInt32(ddlTransportchoice.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingTransportchoice = (from Transportchoice in db.managetransportchoice
                                       where Transportchoice.transportchoice == TransportchoiceID && Transportchoice.cityid == CityID
                                       && Transportchoice.id != id
                                   select Transportchoice).FirstOrDefault();
        if (existingTransportchoice == null)
        {
            managetransportchoice TransportchoiceObj = db.managetransportchoice.Where(x => x.id == id).First();
            try
            {

                TransportchoiceObj.transportchoice = Convert.ToInt32(ddlTransportchoice.SelectedItem.Value);
                TransportchoiceObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                TransportchoiceObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                TransportchoiceObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdultPercentage.Value.Trim() != "")
                    TransportchoiceObj.extra_adult_percentage = Convert.ToDecimal(txtExtraAdultPercentage.Value.Trim());
                if (txtExtraChildPercentage.Value.Trim() != "")
                    TransportchoiceObj.extra_child_percentage = Convert.ToDecimal(txtExtraChildPercentage.Value.Trim());

                db.SaveChanges();
                Response.Redirect("~/admin/managetransportchoice.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Transportchoice details already exists for the selected city')", true);
    }
}