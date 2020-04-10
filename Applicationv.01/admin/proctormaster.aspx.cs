using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;
using System.IO;


public partial class admin_proctormaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    Common objCom = new Common();
    int recordId;
    proctor_master objproctor = new proctor_master();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            recordId = -1;
            if (int.TryParse(Request.QueryString["id"], out recordId))
            {
                objproctor = db.proctor_master.Where(obj => obj.proctorID == recordId).FirstOrDefault();
                if (objproctor == null)
                    recordId = -1;
            }
        }

        if (!IsPostBack)
        {
            objCom.BindCountries(ddlproctoecountry);
            if (objproctor != null)
                PopulateInfo();
        }
    }

    private void PopulateInfo()
    {
        try
        {
            var proctorData = (from tInfo in db.proctor_master
                                   where tInfo.proctorID == recordId
                                   select tInfo).FirstOrDefault();
            if (proctorData != null)
            {
                txtproctorname.Value = proctorData.name;
                txtproctoremail.Value = proctorData.email;
                txtproctorphone.Value = proctorData.mobile;

                if (proctorData.country != null)
                {
                    ddlproctoecountry.ClearSelection();
                    ddlproctoecountry.Items.FindByValue(proctorData.country.ToString()).Selected = true;
                }
                if (proctorData.city != null)
                {
                    ddlproctorcity.ClearSelection();
                    BindCity(Convert.ToInt32(proctorData.country));
                    ddlproctorcity.Items.FindByValue(proctorData.city.ToString()).Selected = true;
                    hidCityField.Value = Convert.ToString(proctorData.country);
                }                
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void BindCity( int countryid) {
        try {
            ListItem lst = new ListItem("Please select", "0");

            var city = db.citymaster.Where(x => x.country_id == countryid).Select(x => new { x.city_id, x.name }).ToList();

            ddlproctorcity.DataSource = city;
            ddlproctorcity.DataTextField = "name";
            ddlproctorcity.DataValueField = "city_id";
            ddlproctorcity.DataBind();
            ddlproctorcity.Items.Insert(0, lst);

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCityDropdown(int countryId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.citymaster.Where(x => x.country_id == countryId).Select(x => new { x.city_id, x.name }).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            if (recordId != -1)
            {
                var proctorData = (from tInfo in db.proctor_master
                                    where tInfo.proctorID == recordId
                                    select tInfo).FirstOrDefault();

                if (proctorData != null)
                {
                    mode = "update";
                    objproctor = proctorData;
                }
            }
            
            objproctor.name = txtproctorname.Value.Trim();
            objproctor.email = txtproctoremail.Value.Trim();
            objproctor.mobile = txtproctorphone.Value.Trim();
            if(ddlproctoecountry.SelectedValue != null)
                objproctor.country = Convert.ToInt32(ddlproctoecountry.SelectedValue);
            objproctor.city = Convert.ToInt32(hidCityField.Value);
            //objproctor.timezone = DropdownList1.SelectedValue;
            if (mode == "new")
                db.proctor_master.Add(objproctor);
            db.SaveChanges();
            if(mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record Inserted Successfully.');window.location='" + Request.ApplicationPath + "admin/proctormasterListing.aspx';", true);                
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record Updated Successfully.');window.location='" + Request.ApplicationPath + "admin/proctormasterListing.aspx';", true);
        }
        catch (Exception Ex) { objLog.WriteLog(Ex.ToString()); }
    }

}