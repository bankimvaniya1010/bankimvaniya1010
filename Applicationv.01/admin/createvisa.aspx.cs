using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createvisa : System.Web.UI.Page
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
            bindVisa();
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
    private void bindVisa()
    {
        try
        {
            ListItem lst = new ListItem("Please select Visa", "0");
            List<visa> Visa = db.visa.ToList();

            ddlVisa.DataSource = Visa;
            ddlVisa.DataTextField = "description";
            ddlVisa.DataValueField = "id";
            ddlVisa.DataBind();
            ddlVisa.Items.Insert(0, lst);
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
        managevisa VisaObj = new managevisa();
        try
        {
            int VisaID = 0, CityID = 0, Currencyid = 0;
            if (ddlVisa.SelectedItem.Value != "0")
                VisaID = Convert.ToInt32(ddlVisa.SelectedItem.Value);
            if (ddlCity.SelectedItem.Value != "0")
                CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
            if (ddlCurrency.SelectedItem.Value != "0")
                Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            var existingVisa = (from Visa in db.managevisa
                                where Visa.visaid == VisaID && Visa.cityid == CityID
                                 select Visa).FirstOrDefault();
            if (existingVisa == null)
            {

                VisaObj.visaid = VisaID;
                VisaObj.cityid = CityID;
                VisaObj.currencyid = Currencyid;
                VisaObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                if (txtExtraAdult.Value.Trim() != "")
                    VisaObj.extra_adult_amount = Convert.ToDecimal(txtExtraAdult.Value.Trim());
                if (txtExtraChild.Value.Trim() != "")
                    VisaObj.extra_child_amount = Convert.ToDecimal(txtExtraChild.Value.Trim());
                db.managevisa.Add(VisaObj);
                db.SaveChanges();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Visa details already exists for the selected city')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}