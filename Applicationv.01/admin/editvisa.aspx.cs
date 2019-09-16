using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_editvisa : System.Web.UI.Page
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

                managevisa existingVisa = db.managevisa.Where(obj => obj.id == id).First();
                bindVisa();
                bindCity();
                bindCurrency();
                if (existingVisa != null)
                {
                    ViewState["id"] = id;

                    txtFee.Value = Convert.ToString(existingVisa.amount);

                    if (existingVisa.visaid != 0)
                    {
                        ddlVisa.ClearSelection();
                        ddlVisa.Items.FindByValue(existingVisa.visaid.ToString()).Selected = true;
                    }
                    if (existingVisa.currencyid != 0)
                    {
                        ddlCurrency.ClearSelection();
                        ddlCurrency.Items.FindByValue(existingVisa.currencyid.ToString()).Selected = true;
                    }
                    if (existingVisa.cityid != 0)
                    {
                        ddlCity.ClearSelection();
                        ddlCity.Items.FindByValue(existingVisa.cityid.ToString()).Selected = true;
                    }


                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Visa details does not exists')", true);

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
    private void bindVisa()
    {
        try
        {
            ListItem lst = new ListItem("Please select Visa", "0");
            List<visa> Visaplan = db.visa.ToList();

            ddlVisa.DataSource = Visaplan;
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
        int id = Convert.ToInt32(ViewState["id"]);
        int VisaID = 0, CityID = 0, Currencyid = 0;
        if (ddlVisa.SelectedItem.Value != "0")
            VisaID = Convert.ToInt32(ddlVisa.SelectedItem.Value);
        if (ddlCity.SelectedItem.Value != "0")
            CityID = Convert.ToInt32(ddlCity.SelectedItem.Value);
        if (ddlCurrency.SelectedItem.Value != "0")
            Currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
        var existingVisa = (from Visa in db.managevisa
                            where Visa.visaid == VisaID && Visa.cityid == CityID && Visa.id != id
                            select Visa).FirstOrDefault();
        if (existingVisa == null)
        {
            managevisa VisaObj = db.managevisa.Where(x => x.id == id).First();
            try
            {

                VisaObj.visaid = Convert.ToInt32(ddlVisa.SelectedItem.Value);
                VisaObj.cityid = Convert.ToInt32(ddlCity.SelectedItem.Value);
                VisaObj.currencyid = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
                VisaObj.amount = Convert.ToDecimal(txtFee.Value.Trim());
                db.SaveChanges();
                Response.Redirect("~/admin/manageVisa.aspx");
            }
            catch (Exception ex)
            {
                objLog.WriteLog(ex.StackTrace.ToString());
            }
        }
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Visa details already exists for the selected city')", true);
    }
}