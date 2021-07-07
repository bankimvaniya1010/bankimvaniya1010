using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class universityformmapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string roleName = string.Empty;
    int universityID = 0, isfullservice;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        isfullservice = (int)Session["isfullservice"];

        if (!IsPostBack)
        {
            BindUniversity();
        }

    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            IEnumerable<universitywiseformmapping> list = db.universitywiseformmapping.Where(x => x.universityid == UniversityID).ToList();
            // Use Remove Range function to delete all records at once
            db.universitywiseformmapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chkForm.Items)
            {

                if (li.Selected)
                {
                    int formID = Convert.ToInt32(li.Value);

                    universitywiseformmapping mappingObj = new universitywiseformmapping();
                    mappingObj.formid = formID;
                    mappingObj.universityid = UniversityID;
                    db.universitywiseformmapping.Add(mappingObj);
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
            {
                int universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
                BindForm(universityid);
                BindPresected(universityid);
            }
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
                Universities = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
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
    private void BindForm(int universityid)
    {
        try
        {
            int service = objCom.GetUniversityservice(universityid);
            // List<formmaster> forms = new List<formmaster>();
            var forms = db.formmaster.Where(x=>x.service == 3 || x.service == service).ToList();
            chkForm.DataSource = forms;
            chkForm.DataTextField = "formname";
            chkForm.DataValueField = "formid";
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
            BindForm(university);
            //chkForm.Items.FindByValue(30.ToString()).Enabled = false;
            var universityWise = db.universitywiseformmapping.Where(x => x.universityid == university).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chkForm.Items.FindByValue(universityWise[k].formid.ToString()).Selected = true;                
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}