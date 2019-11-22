using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminuniversitywisetooltips : System.Web.UI.Page
{
    int id = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            bindUniversity();
            if (Int32.TryParse(Request.QueryString["id"], out id))
                ViewState["id"] = id;
            adminuniversitywisetooltips tooltips = db.adminuniversitywisetooltips.Where(obj => obj.id == id).FirstOrDefault();
            if (tooltips != null)
            {

                txtTooltips.Text = tooltips.tooltips;
                if (tooltips.universityid != 0)
                {
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(Convert.ToString(tooltips.formid)).Selected = true;
                    bindFrom(tooltips.universityid);
                }
                if (tooltips.formid != 0)
                {
                    ddlForm.ClearSelection();
                    ddlForm.Items.FindByValue(Convert.ToString(tooltips.formid)).Selected = true;
                    BindField(Convert.ToInt32(ddlForm.SelectedValue));
                }
                if (tooltips.fieldid != 0)
                {
                    ddlField.ClearSelection();
                    ddlField.Items.FindByValue(Convert.ToString(tooltips.fieldid)).Selected = true;
                }
            }

        }
    }
    private void bindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.university_master

                         select new
                         {
                             universityid = a.universityid,
                             university_name = a.university_name
                         }).ToList();
            ddlUniversity.DataSource = forms;
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
    private void bindFrom(int UniversityID)
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
    protected void ddlForm_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindField(Convert.ToInt32(ddlForm.SelectedValue));

    }
    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUniversity.SelectedValue != "")
            bindFrom(Convert.ToInt32(ddlUniversity.SelectedValue));
    }
    private void BindField(int formID)
    {
        ListItem lst = new ListItem("Please select", "0");
        try
        {
            var Field = db.primaryfieldmaster.Where(x => x.formid == formID).ToList();
            ddlField.DataSource = Field;
            ddlField.DataTextField = "primaryfiledname";
            ddlField.DataValueField = "primaryfieldid";
            ddlField.DataBind();
            ddlField.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
      adminuniversitywisetooltips objToolTips = new adminuniversitywisetooltips();
        try
        {

            int fieldId = 0, universityid = 0;
            int id = Convert.ToInt32(ViewState["id"]);
            if (ddlField.SelectedValue != "")
                fieldId = Convert.ToInt32(ddlField.SelectedValue);
            if (ddlUniversity.SelectedValue != "")
                universityid = Convert.ToInt32(ddlUniversity.SelectedValue);
            var existingTooltips = (from tooltips in db.adminuniversitywisetooltips
                                    where (tooltips.id.Equals(id))
                                    select tooltips).FirstOrDefault();
            if (existingTooltips == null)
            {
                existingTooltips = (from tooltips in db.adminuniversitywisetooltips
                                    where (tooltips.fieldid == fieldId && tooltips.universityid == universityid)
                                    select tooltips).FirstOrDefault();

            }
            if (existingTooltips != null)
            {
                objToolTips = existingTooltips;
            }
            if (existingTooltips != null && id == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tool tips for this field is already available')", true);
                return;
            }
            if (ddlForm.SelectedValue != "")
                objToolTips.formid = Convert.ToInt32(ddlForm.SelectedValue);
            objToolTips.tooltips = txtTooltips.Text.Trim();

            if (ddlField.SelectedValue != "")
                objToolTips.fieldid = Convert.ToInt32(ddlField.SelectedValue.Trim());
            if (ddlUniversity.SelectedValue != "")
                objToolTips.universityid = Convert.ToInt32(ddlUniversity.SelectedValue.Trim());
            if (existingTooltips == null)
            {
                db.adminuniversitywisetooltips.Add(objToolTips);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                db.SaveChanges();
                Response.Redirect(webURL + "admin/adminuniversitywisetooltipslisting.aspx", true);
            }

        }


        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}