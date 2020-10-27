using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_educationalinstitutionmaster_addedit : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objCom = new Common();
    string roleName = string.Empty;
    string webURL = String.Empty;
    int universityID;
    int recordId;

    educationalinstitution_country_city_mappingmaster objmaster = new educationalinstitution_country_city_mappingmaster();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            recordId = -1;
            if (int.TryParse(Request.QueryString["id"], out recordId))
            {
                objmaster = db.educationalinstitution_country_city_mappingmaster.Where(obj => obj.id == recordId).FirstOrDefault();
                if (objmaster == null)
                    recordId = -1;
            }
        }

        if (!IsPostBack)
        {
            BindUniversity();
            objCom.BindCountries(ddlcountry);
            if (objmaster != null)
                PopulatetutorialInfo();
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetCityDropdown(int countryId)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.citymaster.Where(x => x.country_id == countryId).Select(x => new { x.city_id, x.name }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    private void PopulatetutorialInfo()
    {
        try
        {
            var Data = (from tInfo in db.educationalinstitution_country_city_mappingmaster
                        where tInfo.id == recordId
                        select tInfo).FirstOrDefault();
            if (Data != null)
            {
                if (Data.universityid != null)
                {
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(Data.universityid.ToString()).Selected = true;
                }
                if (Data.countryid != null)
                {
                    ddlcountry.ClearSelection();
                    ddlcountry.Items.FindByValue(Data.countryid.ToString()).Selected = true;
                }
                if (Data.cityid != null)
                {
                    ddlcity.ClearSelection();
                    bindCityDropdown(Convert.ToInt32(Data.countryid));
                    ddlcity.Items.FindByValue(Data.cityid.ToString()).Selected = true;
                    hidCityField.Value = Data.cityid.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            var countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            var cityid = Convert.ToInt32(hidCityField.Value);

            var repeateData = (from tInfo in db.educationalinstitution_country_city_mappingmaster
                               where tInfo.universityid == universityid && tInfo.countryid == countryid && tInfo.cityid == cityid
                                select tInfo).FirstOrDefault();
            if (repeateData != null)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record with selected combination already exsists')", true);
            else {
                if (recordId != -1)
                {
                    var tutorailData = (from tInfo in db.educationalinstitution_country_city_mappingmaster
                                        where tInfo.universityid == universityid && tInfo.id == recordId
                                        select tInfo).FirstOrDefault();

                    if (tutorailData != null)
                    {
                        mode = "update";
                        objmaster = tutorailData;
                    }
                }

                objmaster.universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                objmaster.countryid = Convert.ToInt32(ddlcountry.SelectedValue);
                objmaster.cityid = Convert.ToInt32(hidCityField.Value);

                if (mode == "new")
                    db.educationalinstitution_country_city_mappingmaster.Add(objmaster);
                db.SaveChanges();
                Response.Redirect(webURL + "admin/educationalinstitutionmaster_listing.aspx", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void bindCityDropdown(int countryId)
    {
        try
        {
            var cityMaster = db.citymaster.Where(x => x.country_id == countryId).ToList();

            ddlcity.DataSource = cityMaster;
            ddlcity.DataBind();
            ddlcity.DataTextField = "name";
            ddlcity.DataValueField = "city_id";
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("Please Select", ""));
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }
}