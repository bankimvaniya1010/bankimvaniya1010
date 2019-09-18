using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitycampusmaster : System.Web.UI.Page
{
    Common objCommon = new Common();
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        int universityID;
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            bindUniversityDropdown();
            if (Request.QueryString["universityID"] != null)
            {
                if (Int32.TryParse(Request.QueryString["universityID"], out universityID))
                {
                    ddlUniversity.SelectedIndex = universityID;
                    BindGrid(universityID);
                }
            }
        }
    }

    private void bindUniversityDropdown()
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            List<university_master> universityMaster = db.university_master.ToList();

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    private void BindGrid(int universityID)
    {
        try
        {
            var campusList = (from unicampus in db.universitycampus
                              join university in db.university_master on unicampus.universityid equals university.universityid
                              where unicampus.universityid == universityID
                              select new
                              {
                                  campusID = unicampus.campusid,
                                  campusName = unicampus.campusname,
                                  unicampus.description,
                                  facultyDescription = unicampus.faculty_description,
                                  campusResearch = unicampus.research,
                                  universityName = university.university_name
                              }).ToList();

            if (campusList != null)
            {
                universityCampusGridView.DataSource = campusList;
                universityCampusGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int universityID = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindGrid(universityID);
    }

    protected void addNewCampus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/createuniversitycampus.aspx");
    }

    protected void addNewFacility_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/createfacility.aspx");
    }

    protected void addNewFacilityInCampus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/createcampusfacilitymapping.aspx");
    }

    protected void universityCampusGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int campusID = Convert.ToInt32(universityCampusGridView.DataKeys[e.Row.RowIndex].Value);
            DropDownList DropDownList1 = (e.Row.FindControl("ddlFacilities") as DropDownList);

            var campusFacilities = (from facilities in db.facilitiesmaster
                                    join facility_mapping in db.facility_campus_mapping on facilities.id equals facility_mapping.facilityId
                                    where facility_mapping.campusId == campusID
                                    select new
                                    {
                                        mappingId = facility_mapping.id,
                                        name = facilities.facility_name
                                    }).ToList();

            DropDownList1.DataSource = campusFacilities;

            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "mappingId";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Facilities", "0"));
        }
    }

    protected void universityCampusGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int campusID = Convert.ToInt32(universityCampusGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect("~/admin/edituniversitycampus.aspx?universityCampusID=" + campusID);
    }
}