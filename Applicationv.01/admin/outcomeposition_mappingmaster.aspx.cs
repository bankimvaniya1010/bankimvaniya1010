using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_outcomeposition_mappingmaster : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    int universityID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        if (!IsPostBack)
        {
            BindCourse();
            BindCareer();
        }
    }

    private void BindCourse() {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var courses = db.coursemaster.Where(x => x.universityid == universityID).ToList();
            ddlCourses.DataSource = courses;
            ddlCourses.DataTextField = "coursename";
            ddlCourses.DataValueField = "courseid";
            ddlCourses.DataBind();
            ddlCourses.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindCareer()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var careers = db.careeroutcomes_master.ToList();
            ddlcareer.DataSource = careers;
            ddlcareer.DataTextField = "description";
            ddlcareer.DataValueField = "careerID";
            ddlcareer.DataBind();
            ddlcareer.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindPositions(int carrerid) {
        try
        {            
            var positions = db.careeroutcomes_position_master.Where(x=>x.careerID == carrerid).ToList();
            chkpositions.DataSource = positions;
            chkpositions.DataTextField = "description";
            chkpositions.DataValueField = "careerpositionID";
            chkpositions.DataBind();         
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            int courseID = Convert.ToInt32(ddlCourses.SelectedValue);
            int careeroutcomeID = Convert.ToInt32(ddlcareer.SelectedValue);
            IEnumerable<careerposition_course_mapping> list = db.careerposition_course_mapping.Where(x => x.courseID == courseID && x.careeroutcomeId == careeroutcomeID).ToList();
            db.careerposition_course_mapping.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in chkpositions.Items)
            {
                if (li.Selected)
                {
                    int positionID = Convert.ToInt16(li.Value);
                    careerposition_course_mapping mappingObj = new careerposition_course_mapping();
                    mappingObj.courseID = Convert.ToInt32(ddlCourses.SelectedValue);
                    mappingObj.careeroutcomeId = Convert.ToInt32(ddlcareer.SelectedValue);
                    mappingObj.positionID= positionID;
                    
                    db.careerposition_course_mapping.Add(mappingObj);
                    db.SaveChanges();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record saved Successfully.')", true);
                    ddlCourses.ClearSelection();
                    ddlcareer.ClearSelection();
                    chkpositions.Items.Clear();
                }

            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void ddlcareer_SelectedIndexChanged(object sender, EventArgs e)
    {
        int careeroutcomeid = Convert.ToInt32(ddlcareer.SelectedValue);
        int courseid = Convert.ToInt32(ddlCourses.SelectedValue);

        chkpositions.Items.Clear();

        if (careeroutcomeid != 0)
        {
            BindPositions(careeroutcomeid);
                        
            string[] array = new string[chkpositions.Items.Count];
            var list = chkpositions.Items;

            for (int i = 0; i < list.Count; i++)
                array[i] = list[i].Value;

            var courseWise = (from usm in db.careerposition_course_mapping
                              join sm in db.careeroutcomes_position_master on usm.positionID equals sm.careerpositionID
                              join om in db.careeroutcomes_master on usm.careeroutcomeId equals om.careerID
                              where usm.courseID == courseid && array.Contains(usm.positionID.ToString())
                              select usm).ToList();
            for (int k = 0; k < courseWise.Count; k++)
            {
                chkpositions.Items.FindByValue(courseWise[k].positionID.ToString()).Selected = true;
            }
        }
    }

    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcareer.ClearSelection();
        chkpositions.Items.Clear();
    }
}