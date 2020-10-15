using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_educationalinstitutionmaster_listing : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    Common objCom = new Common();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }
    private void BindGrid()
    {
        try
        {
            var QuestionList = (from q in db.educationalinstitution_country_city_mappingmaster
                                join um in db.university_master on q.universityid equals um.universityid
                                join cm in db.countriesmaster on q.countryid equals cm.id
                                join cim in db.citymaster on q.cityid equals cim.city_id
                                select new
                                {
                                    id = q.id,
                                    UniversityName = um.university_name,
                                    country = cm.country_name,
                                    city = cim.name,
                                }).SortBy("UniversityName").ToList();
            if (QuestionList != null)
            {
                gvproctor.DataSource = QuestionList;
                 gvproctor.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }   

    protected void gvproctor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvproctor.EditIndex = -1;
        BindGrid();
    }

    protected void gvproctor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvproctor.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvproctor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void gvproctor_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in gvproctor.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void gvproctor_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvproctor.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}