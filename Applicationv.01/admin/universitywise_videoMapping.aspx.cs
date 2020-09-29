using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitywise_videoMapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            BindUniversity();
            BindForm();
        }

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            IEnumerable<universitywise_admin_video_mapping> list = db.universitywise_admin_video_mapping.Where(x => x.universityID == UniversityID).ToList();
            // Use Remove Range function to delete all records at once
            db.universitywise_admin_video_mapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chkForm.Items)
            {

                if (li.Selected)
                {
                    int videoID = Convert.ToInt32(li.Value);

                    universitywise_admin_video_mapping mappingObj = new universitywise_admin_video_mapping();
                    mappingObj.videoID= videoID;
                    mappingObj.universityID = UniversityID;
                    db.universitywise_admin_video_mapping.Add(mappingObj);
                    db.SaveChanges();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlUniversity.SelectedValue != "0")
                BindPresected(Convert.ToInt32(ddlUniversity.SelectedValue));
            else
                chkForm.ClearSelection();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
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
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindForm()
    {
        try
        {           
            var forms = db.admin_videomaster.ToList();
            chkForm.DataSource = forms;
            chkForm.DataTextField = "sectioname";
            chkForm.DataValueField = "videoID";
            chkForm.DataBind();

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindPresected(int university)
    {
        try
        {
            chkForm.Items.Clear();
            BindForm();
            var universityWise = db.universitywise_admin_video_mapping.Where(x => x.universityID == university).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chkForm.Items.FindByValue(universityWise[k].videoID.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}