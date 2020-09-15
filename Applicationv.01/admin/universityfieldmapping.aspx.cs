using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class universityfieldmapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
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

        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            int FormID = Convert.ToInt32(ddlForm.SelectedValue);
            IEnumerable<universitywisefieldmapping> list = db.universitywisefieldmapping.Where(x => x.universityid == UniversityID && x.formid == FormID).ToList();
            // Use Remove Range function to delete all records at once
            db.universitywisefieldmapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chkField.Items)
            {

                if (li.Selected)
                {
                    int filedID = Convert.ToInt32(li.Value);

                    universitywisefieldmapping mappingObj = new universitywisefieldmapping();
                    mappingObj.primaryfieldid = filedID;
                    mappingObj.formid = FormID;
                    mappingObj.universityid = UniversityID;
                    db.universitywisefieldmapping.Add(mappingObj);
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
                BindForm(Convert.ToInt32(ddlUniversity.SelectedValue));
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
    private void BindField(int formID)
    {
        try
        {
            var Field = db.primaryfieldmaster.Where(x => x.formid == formID).ToList();
            chkField.DataSource = Field;
            chkField.DataTextField = "primaryfiledname";
            chkField.DataValueField = "primaryfieldid";
            chkField.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    private void BindForm(int UniversityID)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.formmaster
                         join q in db.universitywiseformmapping on a.formid equals q.formid
                         where q.universityid == UniversityID
                         select new
                         {
                             formname = a.formname,
                             formid = a.formid
                         }).ToList();
            ddlForm.DataSource = forms;
            ddlForm.DataTextField = "formname";
            ddlForm.DataValueField = "formid";
            ddlForm.DataBind();
            ddlForm.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindPresected(int university, int FormID)
    {
        try
        {
            chkField.Items.Clear();
            BindField(FormID);
            var universityWise = db.universitywisefieldmapping.Where(x => x.universityid == university && x.formid == FormID).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chkField.Items.FindByValue(universityWise[k].primaryfieldid.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlForm_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindField(Convert.ToInt32(ddlForm.SelectedValue));
        BindPresected(Convert.ToInt32(ddlUniversity.SelectedValue), Convert.ToInt32(ddlForm.SelectedValue));
    }
}