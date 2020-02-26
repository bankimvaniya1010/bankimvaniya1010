using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admintooltips : System.Web.UI.Page
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
            BindForm();
            if (Int32.TryParse(Request.QueryString["id"], out id))
                ViewState["id"] = id;
            admintooltips tooltips = db.admintooltips.Where(obj => obj.id == id).FirstOrDefault();
            if (tooltips != null)
            {

                txtTooltips.Text = tooltips.tooltips;

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
    private void BindForm()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.formmaster

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
        admintooltips objToolTips = new admintooltips();
        try
        {

            int fieldId = 0;
            int id = Convert.ToInt32(ViewState["id"]);
            if (ddlField.SelectedValue != "")
                fieldId = Convert.ToInt32(ddlField.SelectedValue);
            var existingTooltips = (from tooltips in db.admintooltips
                                    where (tooltips.id.Equals(id))
                                    select tooltips).FirstOrDefault();
            if (existingTooltips == null)
            {
                existingTooltips = (from tooltips in db.admintooltips
                                    where (tooltips.fieldid == fieldId)
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
            if (existingTooltips == null)
            {
                db.admintooltips.Add(objToolTips);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                db.SaveChanges();
                Response.Redirect(webURL + "admin/admintooltipslisting.aspx", true);
            }

        }


        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}