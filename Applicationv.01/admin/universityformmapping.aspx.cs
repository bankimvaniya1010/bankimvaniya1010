using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class universityformmapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
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
                BindPresected(Convert.ToInt32(ddlUniversity.SelectedValue));
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
            var Universities = db.university_master.ToList();
            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityID";
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
            // List<formmaster> forms = new List<formmaster>();
            var forms = db.formmaster.ToList();
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
            BindForm();
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