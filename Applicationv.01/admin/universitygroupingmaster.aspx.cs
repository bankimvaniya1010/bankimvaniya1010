using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitygroupingmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            bindGrid();
        }
    }

    private void bindGrid()
    {
        try
        {
            var mappingList = (from mappings in db.universitygrouping
                               join groupheaduniversities in db.university_master on mappings.groupingheaduniversityid equals groupheaduniversities.universityid
                               join universities in db.university_master on mappings.universityid equals universities.universityid
                               where universities.IsDeleted != 1
                               select new {
                                   groupHeadUniversityID = mappings.groupingheaduniversityid,
                                   groupHeadUniversityName = groupheaduniversities.university_name,
                                   universities_name = universities.university_name
                               }).ToList().GroupBy(x => x.groupHeadUniversityID);

            var groupedList = mappingList.Select(item => new {
                                key = item.Key,
                                universityHeadName = item.Select(x => x.groupHeadUniversityName).First(),
                                universitiesNames = item.Select(x => x.universities_name).ToList()
                              }).ToList();

            if (groupedList != null)
            {
                universityGroupingGridView.DataSource = groupedList;
                universityGroupingGridView.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void universityGroupingGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            object myTYpe = e.Row.DataItem;
            PropertyInfo pi = myTYpe.GetType().GetProperty("universitiesNames");
            List<string> universityNames = pi.GetValue(myTYpe, null) as List<string>;
            
            e.Row.Cells[2].Text = string.Join(", ", universityNames); // this will give CSV value of your List<string>
        }
    }

    protected void universityGroupingGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int groupHeadUniversityId = Convert.ToInt32(universityGroupingGridView.DataKeys[e.NewEditIndex].Value);
        Response.Redirect(webURL + "admin/edituniversitygrouping.aspx?headUniversityID=" + groupHeadUniversityId);
    }

    protected void universityGroupingGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        universityGroupingGridView.PageIndex = e.NewPageIndex;
        bindGrid();
    }
}