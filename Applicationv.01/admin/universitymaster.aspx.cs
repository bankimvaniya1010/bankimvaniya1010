using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitymaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string roleName = string.Empty;
    int universityID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        roleName = Utility.GetRoleName();
        if (!Utility.CheckAdminLogin() || String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            dynamic universitiesList;
            if (roleName.ToLower() == "admin")
            {
                universitiesList = (from um in db.university_master
                                    join cities in db.citymaster on um.cityid equals cities.city_id
                                    join countries in db.countriesmaster on um.countryid equals countries.id
                                    select new
                                    {
                                        univerityID = um.universityid,
                                        universityName = um.university_name,
                                        city = cities.name,
                                        country = countries.country_name,
                                        address = um.address
                                    }).ToList();
            }
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                universitiesList = (from um in db.university_master
                                    join cities in db.citymaster on um.cityid equals cities.city_id
                                    join countries in db.countriesmaster on um.countryid equals countries.id
                                    where um.universityid == universityID
                                    select new
                                    {
                                        univerityID = um.universityid,
                                        universityName = um.university_name,
                                        city = cities.name,
                                        country = countries.country_name,
                                        address = um.address
                                    }).ToList();
            }

            if (universitiesList != null)
            {
                universityGridView.DataSource = universitiesList;
                universityGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void universityGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(universityGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/edituniversitydetails.aspx?universityID=" + id);
    }
}