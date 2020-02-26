using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_customfieldaddition : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    private int id = 0;
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
            bindUniversity();
            if (Request.QueryString["id"] != null)
            {
                if (Int32.TryParse(Request.QueryString["id"], out id))
                    ViewState["id"] = id;

                customfieldmaster customField = db.customfieldmaster.Where(obj => obj.customfieldid == id).FirstOrDefault();
                if (customField != null)
                {

                    txtDescription.Text = customField.labeldescription;
                    if (customField.universityid != 0)
                    {
                        ddlUniversity.ClearSelection();
                        ddlUniversity.Items.FindByValue(Convert.ToString(customField.universityid)).Selected = true;
                        bindFrom(Convert.ToInt32(customField.universityid));
                    }
                    if (customField.formid != 0)
                    {
                        ddlForm.ClearSelection();
                        ddlForm.Items.FindByValue(Convert.ToString(customField.formid)).Selected = true;
                    }
                    if (customField.type != "")
                    {
                        ddlControlType.ClearSelection();
                        ddlControlType.Items.FindByValue(Convert.ToString(customField.type)).Selected = true;
                    }
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        customfieldmaster objCustom = new customfieldmaster();
        try
        {

            int UniversityID = 0, formID = 0;
            if (ddlUniversity.SelectedValue != "")
                UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            if (ddlForm.SelectedValue != "")
                formID = Convert.ToInt32(ddlForm.SelectedValue);
            int id = Convert.ToInt32(ViewState["id"]);

            var existingCustomField = (from customfield in db.customfieldmaster
                                       where (customfield.customfieldid.Equals(id))
                                       select customfield).FirstOrDefault();
            if (existingCustomField == null)
            {
                existingCustomField = (from customfield in db.customfieldmaster
                                       where (customfield.formid == formID && customfield.universityid == UniversityID && customfield.labeldescription == txtDescription.Text.Trim())
                                       select customfield).FirstOrDefault();

            }
            if (existingCustomField != null)
            {
                objCustom = existingCustomField;
            }
            if (existingCustomField != null && id == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('This control is already available for the form')", true);
                return;
            }
            var existsInValueRecord = db.customfieldvalue.Where(x => x.customfieldid == id).ToList();
            if (existsInValueRecord.Count != 0 && existingCustomField.type != ddlControlType.SelectedValue)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We Cannot change the control type,as its used over student details page.' )", true);
                return;
            }
            if (ddlForm.SelectedValue != "")
                objCustom.formid = Convert.ToInt32(ddlForm.SelectedValue);
            objCustom.labeldescription = txtDescription.Text.Trim();
            objCustom.type = ddlControlType.SelectedValue;
            if (ddlUniversity.SelectedValue != "")
                objCustom.universityid = Convert.ToInt32(ddlUniversity.SelectedValue.Trim());
            if (existingCustomField == null)
            {
                db.customfieldmaster.Add(objCustom);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                db.SaveChanges();
                Response.Redirect(webURL + "admin/customfieldlisting.aspx", true);
            }
        }


        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUniversity.SelectedValue != "")
            bindFrom(Convert.ToInt32(ddlUniversity.SelectedValue));
    }
}