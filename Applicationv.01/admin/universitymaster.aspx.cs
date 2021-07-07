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
    public List<Details> universitiesList = new List<Details>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
            BindGrid();
    }
    public class Details
    {
        public int? univerityID { get; set; }
        public int? countryID { get; set; }
        public string universityName { get; set; }
        public string city { get; set; }
        public int? CityID { get; set; }
        public string country { get; set; }
        public string address { get; set; }
        public string url { get; set; }
        public string cricoscode { get; set; }
        public int? countryid { get; set; }
    }

    private void BindGrid(int uid = 0, int cid = 0, int cityid =0, string cricosID="0", string u_name = "0")
    {
        try
        {
            if (roleName.ToLower() == "admin")
            {
                universitiesList = (from um in db.university_master
                                    join cities in db.citymaster on um.cityid equals cities.city_id
                                    join countries in db.countriesmaster on um.countryid equals countries.id
                                    where um.IsDeleted != 1 && um.IsDeleted != 1
                                    select new Details
                                    {
                                        univerityID = um.universityid,
                                        universityName = um.university_name,
                                        city = cities.name,
                                        country = countries.country_name,
                                        address = um.address,
                                        countryID = um.countryid,
                                        CityID = um.cityid,
                                        url = "https://"+um.hosturl+"/admin/login.aspx",
                                        cricoscode= um.CRICOS_Code,
                                    }).OrderBy(x=>x.univerityID).ToList();

                ListItem lst = new ListItem("Search By UID", "0");
                ddlUniversityID.DataSource = universitiesList;
                ddlUniversityID.DataTextField = "univerityID";
                ddlUniversityID.DataValueField = "univerityID";
                ddlUniversityID.DataBind();
                ddlUniversityID.Items.Insert(0, lst);

                ListItem lst5 = new ListItem("Search By Name", "0");
                ddlname.DataSource = universitiesList.OrderBy(x => x.universityName).ToList();
                ddlname.DataTextField = "universityName";
                ddlname.DataValueField = "universityName";
                ddlname.DataBind();
                ddlname.Items.Insert(0, lst5);

                ListItem lst2 = new ListItem("Search By Country", "0");                
                ddlcountry.DataSource = universitiesList.Distinct().OrderBy(x=>x.country).ToList();
                ddlcountry.DataTextField = "country";
                ddlcountry.DataValueField = "countryid";
                ddlcountry.DataBind();
                ddlcountry.Items.Insert(0, lst2);
                RemoveDuplicateItems(ddlcountry);

                ListItem lst23 = new ListItem("Search By City ", "0");
                ddlCity.DataSource = universitiesList.Distinct().OrderBy(x=>x.city).ToList();
                ddlCity.DataTextField = "city";
                ddlCity.DataValueField = "CityID";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, lst23);
                RemoveDuplicateItems(ddlCity);

                ListItem lstcc = new ListItem("Search By Cricos ", "0");
                ddlCricos.DataSource = universitiesList.Distinct().OrderBy(x => x.univerityID).Where(c=>c.cricoscode != ""  && c.cricoscode != null).ToList();
                ddlCricos.DataTextField = "cricoscode";
                ddlCricos.DataValueField = "cricoscode";
                ddlCricos.DataBind();
                ddlCricos.Items.Insert(0, lstcc);
                
            }
            else
            {
                filtertble.Attributes.Add("style", "display:none;");
                universityID = Convert.ToInt32(Session["universityId"]);
                universitiesList = (from um in db.university_master
                                    join cities in db.citymaster on um.cityid equals cities.city_id
                                    join countries in db.countriesmaster on um.countryid equals countries.id
                                    where um.universityid == universityID && um.IsDeleted != 1
                                    select new Details
                                    {
                                        univerityID = um.universityid,
                                        universityName = um.university_name,
                                        city = cities.name,
                                        country = countries.country_name,
                                        address = um.address,
                                        countryID = um.countryid,
                                        CityID = um.cityid,
                                        url = "https://" + um.hosturl + "admin/login.aspx",
                                        cricoscode = um.CRICOS_Code,
                                    }).ToList();
            }


            if (universitiesList != null)
            {
                if (uid != 0 || cid != 0 || cityid !=0 || cricosID !="0" || u_name!= "0")
                {
                   // var filterlist = universitiesList;
                    if (uid != 0)
                    {
                        universitiesList = universitiesList.Where(x => x.univerityID == uid).ToList();
                        ddlUniversityID.Items.FindByValue(uid.ToString()).Selected = true;
                    }
                    if (cid != 0)
                    {
                        universitiesList = universitiesList.Where(x => x.countryID == cid).ToList();
                        ddlcountry.Items.FindByValue(cid.ToString()).Selected = true;
                    }
                    if (cityid != 0)
                    {
                        universitiesList = universitiesList.Where(x => x.CityID == cityid).ToList();
                        ddlCity.Items.FindByValue(cityid.ToString()).Selected = true;
                    }
                    if (cricosID != "0") {
                        universitiesList = universitiesList.Where(x => x.cricoscode == cricosID).ToList();
                        ddlCricos.Items.FindByValue(cricosID.ToString()).Selected = true;
                    }
                    if (u_name != "0") {
                        universitiesList = universitiesList.Where(x => x.universityName.Contains(u_name)).ToList();
                        ddlname.Items.FindByValue(u_name.ToString()).Selected = true;
                    }
                }

                universityGridView.DataSource = universitiesList;
                universityGridView.DataBind();
            }
            if (roleName.ToLower() != "admin")
            {
                ((DataControlField)universityGridView.Columns
                 .Cast<DataControlField>()
                 .Where(fld => fld.HeaderText == "Delete")
                 .SingleOrDefault()).Visible = false;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    void RemoveDuplicateItems(DropDownList ddl)
    {
        string selectvalue = ddl.SelectedValue;
        for (int i = 0; i < ddl.Items.Count; i++)
        {
            ddl.SelectedIndex = i;
            string str = ddl.SelectedItem.ToString();
            for (int counter = i + 1; counter < ddl.Items.Count; counter++)
            {
                ddl.SelectedIndex = counter;
                string compareStr = ddl.SelectedItem.ToString();
                if (str == compareStr)
                {
                    ddl.Items.RemoveAt(counter);
                    counter = counter - 1;
                }
            }
        }
        ddl.ClearSelection();
    }

    protected void universityGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = Convert.ToInt32(universityGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/universitydetails_editN.aspx?universityID=" + id);
       
    }

    protected void ddlCricos_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCricos.SelectedValue != null)
        {
            string CricosID = ddlCricos.SelectedValue;
            BindGrid(0, 0, 0, CricosID);
        }
    }

    protected void ddlUniversityID_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUniversityID.SelectedValue != null)
        {
            int uid = Convert.ToInt32(ddlUniversityID.SelectedValue);
            BindGrid(uid,0,0);
            
        }
    }

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedValue != null)
        {
            int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            BindGrid(0, countryid,0,"0");
        }
    }
    protected void ddlname_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlname.SelectedValue != null)
        {
            string name = ddlname.SelectedValue;
            BindGrid(0, 0, 0,"0",name);
        }
    }
    

    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCity.SelectedValue != null)
        {
            int cityid = Convert.ToInt32(ddlCity.SelectedValue);            
            BindGrid(0, 0, cityid);
            //ddlCity.Items.FindByValue(cityid.ToString()).Selected = true;
        }
    }

    protected void universityGridView_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        universityGridView.PageIndex = e.NewPageIndex;

        if (ddlUniversityID.SelectedValue != null && ddlUniversityID.SelectedValue != "0")
        {
            int uid = Convert.ToInt32(ddlUniversityID.SelectedValue);
            BindGrid(uid, 0, 0);
        }
        else if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0")
        {
            int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            BindGrid(0, countryid, 0);
        }
        else if (ddlCity.SelectedValue != null && ddlCity.SelectedValue != "0")
        {
            int cityid = Convert.ToInt32(ddlCity.SelectedValue);
            BindGrid(0, 0, cityid);
        }
        else
            BindGrid();
    }


    protected void universityGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try {
            if (e.CommandName.Equals("Delete")) {
                int UID = Convert.ToInt32(e.CommandArgument);
                var mode = "new";
                university_master objmapping = new university_master();
                var data = db.university_master.Where(x => x.universityid == UID).FirstOrDefault();
                if (data != null) {
                    mode = "update";
                    objmapping = data;
                }
                objmapping.IsDeleted = 1;
                if (mode == "new")
                    db.university_master.Add(objmapping);
                db.SaveChanges();
                BindGrid();
                
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void universityGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}