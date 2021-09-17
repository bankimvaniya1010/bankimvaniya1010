using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_course_institution_mapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objcom = new Common();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int headUniversityId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        
        if (!Int32.TryParse(Request.QueryString["ID"], out headUniversityId))
            Response.Redirect(webURL + "admin/default.aspx");
        if (headUniversityId != 0) {

            lblheadUniversityId.Text = objcom.GetUniversityName(headUniversityId);
            if(ddlgroupuniversity.SelectedValue == "0" || ddlgroupuniversity.SelectedValue == "-1")
                BindGroupedUniversity(headUniversityId);
        }
        
    }
   
    private void BindGroupedUniversity(int groupuniID)
    {
        try
        {
            ddlgroupuniversity.Items.Clear();
            ListItem lst = new ListItem("Please select", "0");
            var Master = (from gm in db.universitygrouping
                          join um in db.university_master on gm.universityid equals um.universityid
                          where gm.groupingheaduniversityid == groupuniID && gm.universityid != groupuniID
                          select new {
                              name = um.university_name,
                              id = um.universityid,
                          }).ToList();
               
            ddlgroupuniversity.DataSource = Master;
            ddlgroupuniversity.DataTextField = "name";
            ddlgroupuniversity.DataValueField = "id";
            ddlgroupuniversity.DataBind();
            ddlgroupuniversity.Items.Insert(0, lst);
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

   

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int UserID = 0;
        int UniversityID = headUniversityId;
        int grouped_universityID = Convert.ToInt16(ddlgroupuniversity.SelectedValue);

        var objUser = (adminusers)Session["LoginInfo"];
        UserID = objUser.adminid;

        IEnumerable<university_course_mapping> list = db.university_course_mapping.Where(x => x.main_universityID == UniversityID && x.grouped_universityID == grouped_universityID).ToList();
        db.university_course_mapping.RemoveRange(list);
        db.SaveChanges();

        foreach (ListItem li in chkMasterField.Items)
        {
            if (li.Selected)
            {
                int course_campus_mapping_ID = Convert.ToInt16(li.Value);
                university_course_mapping mappingObj = new university_course_mapping();
                mappingObj.main_universityID = UniversityID;
                mappingObj.grouped_universityID = grouped_universityID;
                mappingObj.course_campus_mapping_ID = course_campus_mapping_ID;
                mappingObj.courseID= db.course_campus_mapping.Where(x=>x.id == course_campus_mapping_ID).Select(x=>x.courseid).FirstOrDefault();
                db.university_course_mapping.Add(mappingObj);
                db.SaveChanges();
            }

        }

    }

    protected void ddlgroupuniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int group_UniID = Convert.ToInt32(ddlgroupuniversity.SelectedValue);
        var masterdata = (from ccm in db.course_campus_mapping
                          join campus in db.universitycampus on ccm.campusid equals campus.campusid
                          join cm in db.coursemaster on ccm.courseid equals cm.courseid
                          where cm.universityid == group_UniID
                          select new {
                              id = ccm.id,
                              coursename = cm.coursename+"[CAMPUS: "+campus.campusname+" ]"
                          }).ToList(); 
            
        chkMasterField.DataSource = masterdata;
        chkMasterField.DataTextField = "coursename";
        chkMasterField.DataValueField = "id";
        chkMasterField.DataBind();

        int UniversityID = headUniversityId;
        int group_UniversityID = Convert.ToInt32(ddlgroupuniversity.SelectedValue);
        var universityWise = db.university_course_mapping.Where(x => x.main_universityID == UniversityID && x.grouped_universityID == group_UniversityID).ToList();
        for (int k = 0; k < universityWise.Count; k++)
        {
            chkMasterField.Items.FindByValue(universityWise[k].course_campus_mapping_ID.ToString()).Selected = true;
        }
        Session["group_UniID"] = group_UniID;
    }
    
}


