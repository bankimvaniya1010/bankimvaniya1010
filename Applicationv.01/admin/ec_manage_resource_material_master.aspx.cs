using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_manage_resource_material_master : System.Web.UI.Page
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
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
          var  QuestionList = (from q in db.ec_tutorialmaster
                                join e in db.university_master on q.universityid equals e.universityid into university
                                from e in university.DefaultIfEmpty()
                                select new details_material
                                {
                                    id = q.id,
                                    videourl = q.videourl,
                                    title = q.title,
                                    status = q.status,
                                    document=q.documentpath,
                                    type = q.type,
                                    UniversityName = e.university_name,
                                    institute_service=q.serviceId
                                }).OrderBy(s=>s.id).ToList();
            if (QuestionList != null)
            {
                QuestiontGridView.DataSource = QuestionList;
                QuestiontGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    public class details_material : admin_ec_manage_resource_material_master
    {
        public int id { get; set; }
        public string videourl { get; set; }
        public string title { get; set; }
        public string type { get; set; }
        public Nullable<int> status { get; set; }
        public Nullable<int> institute_service { get; set; }
        public string document { get; set; }
        public string UniversityName { get; set; }
        public string Get_Material_link
        {
            get
            {
                if(type=="web_link")
                {
                    return videourl;
                }
                else
                {
                    return webURL+"/Docs/"+document;
                }
            }
        }
        public string get_service_name
        {
            get
            {
                switch (institute_service)
                {
                    case 0:
                        return "GTE Service";
                    case 1:
                        return "Full Service";
                    case 2:
                        return "Assessment Service";
                    case 3:
                        return "GTE(Certification)";
                    case 4:
                        return "GTE(Evalution)";
                    case 5:
                        return "E-Class Service";
                    default:
                        return UniversityName;
                }
            }
        }
    }
    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        QuestiontGridView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void QuestiontGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        QuestiontGridView.EditIndex = -1;
        BindGrid();
    }

    protected void QuestiontGridView_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in QuestiontGridView.Rows)
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

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(QuestiontGridView.DataKeys[e.RowIndex].Values[0]);
            ec_tutorialmaster qm = db.ec_tutorialmaster.Where(b => b.id == ID).First();
            db.ec_tutorialmaster.Remove(qm);
            db.SaveChanges();
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}