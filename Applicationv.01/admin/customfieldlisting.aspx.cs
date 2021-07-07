using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_customfieldlisting : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
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
    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUniversity.SelectedValue != "")
            bindFrom(Convert.ToInt32(ddlUniversity.SelectedValue));
    }
    private void BindGird()
    {
        try
        {
            int universityID = 0, formID = 0; ;
            if (ddlUniversity.SelectedValue != "")
                universityID = Convert.ToInt32(ddlUniversity.SelectedValue);

            if (ddlForm.SelectedValue != "")
                formID = Convert.ToInt32(ddlForm.SelectedValue);
            var FieldList = db.customfieldmaster.Where(x => x.formid == formID && x.universityid == universityID).ToList();

            if (FieldList != null)
            {
                gvCustomField.DataSource = FieldList;
                gvCustomField.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlForm_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGird();
    }

    protected void gvCustomField_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            var id = (int)gvCustomField.DataKeys[e.NewEditIndex].Value;
            Response.Redirect(webURL + "admin/customfieldaddition.aspx?id=" + id, true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvCustomField_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

            int ID = Convert.ToInt32(gvCustomField.DataKeys[e.RowIndex].Values[0]);
            customfieldmaster CustomField = db.customfieldmaster.Where(b => b.customfieldid == ID).First();
            var ExitsInValue = db.customfieldvalue.Where(x => x.customfieldid == ID).ToList();
            if (ExitsInValue.Count == 0)
            {
                db.customfieldmaster.Remove(CustomField);
                db.SaveChanges();
                BindGird();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This data as it already Used in another records')", true);


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvCustomField_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                {
                    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                                                     //cast the ShowDeleteButton link to linkbutton
                    LinkButton lb = (LinkButton)e.Row.Cells[3].Controls[0];
                    if (lb != null)
                    {
                        //attach the JavaScript function with the ID as the paramter
                        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvCustomField_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCustomField.PageIndex = e.NewPageIndex;
        BindGird();
    }
}

