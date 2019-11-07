using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
public partial class admin_fieldmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindFormView();
    }
    private void BindFormView()
    {
        try
        {
            var FormList = (from am in db.applicantformmaster
                            join pm in db.primaryfieldmaster on am.primaryfieldid equals pm.primaryfieldid
                            join
                            fm in db.formmaster on am.formname equals fm.formid

                            select new
                            {
                                id = am.id,
                                formname = fm.formname,
                                fieldnameinstructions = am.fieldnameinstructions,
                                secondaryfieldnameinstructions = am.secondaryfieldnameinstructions,
                                primaryfieldname = pm.primaryfiledname,
                                secondaryfieldnamelanguage = am.secondaryfieldnamelanguage,
                                secondaryfielddnamevalue = am.secondaryfielddnamevalue

                            }).ToList();
            if (FormList != null)
            {
                FormFieldGridView.DataSource = FormList;
                FormFieldGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_DataBound(object sender, EventArgs e)
    {

    }

    protected void FormFieldGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        FormFieldGridView.EditIndex = -1;
        BindFormView();
    }

    protected void FormFieldGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                applicantformmaster objForm = new applicantformmaster();
                DropDownList ddlFormNameFooter = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlFormnameFooter");
                DropDownList ddlFieldNameFooter = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlfieldNameFooter");
                DropDownList ddlSecondaryLangFooter = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlSecondaryLangFooter");
                TextBox SecondayFieldvalueFooter = (TextBox)FormFieldGridView.FooterRow.FindControl("txtSecondayFieldvalueFooter");
                TextBox PrimaryInstructionsFooter = (TextBox)FormFieldGridView.FooterRow.FindControl("txtPrimaryInstructionsFooter");
                TextBox SecondaryFooterInstructions = (TextBox)FormFieldGridView.FooterRow.FindControl("txtSecondaryFooterInstructions");


                objForm.formname = Convert.ToInt32(ddlFormNameFooter.SelectedValue);
                objForm.primaryfieldid = Convert.ToInt32(ddlFieldNameFooter.SelectedValue);
                objForm.secondaryfieldnamelanguage = ddlSecondaryLangFooter.SelectedValue;
                objForm.secondaryfielddnamevalue = SecondayFieldvalueFooter.Text;
                objForm.fieldnameinstructions = PrimaryInstructionsFooter.Text;
                objForm.secondaryfieldnameinstructions = SecondaryFooterInstructions.Text;
                db.applicantformmaster.Add(objForm);
                db.SaveChanges();
                BindFormView();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
            {
                //if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
                //{
                //    string id = e.Row.Cells[0].Text; // Get the id to be deleted
                //                                     //cast the ShowDeleteButton link to linkbutton
                //    LinkButton lb = (LinkButton)e.Row.Cells[8].Controls[0];
                //    if (lb != null)
                //    {
                //        //attach the JavaScript function with the ID as the paramter
                //        lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                //    }
                //}
            }
            if ((e.Row.RowType == DataControlRowType.DataRow && FormFieldGridView.EditIndex == e.Row.RowIndex) || (e.Row.RowType == DataControlRowType.Footer))
            {
                var SecondaryLanguage = db.secondarylanguagemaster.ToList();
                var formMaster = db.formmaster.ToList();
                var primaryfieldmaster = db.primaryfieldmaster.ToList();
                DropDownList ddlFormNameEdit = (e.Row.FindControl("ddlFormname") as DropDownList);
                DropDownList ddlFormNameFooter = (e.Row.FindControl("ddlFormnameFooter") as DropDownList);
                DropDownList ddlFieldNameEdit = (e.Row.FindControl("ddlfieldName") as DropDownList);
                DropDownList ddlFieldNameFooter = (e.Row.FindControl("ddlfieldNameFooter") as DropDownList);
                DropDownList ddlSecondaryLangEdit = (e.Row.FindControl("ddlSecondaryLang") as DropDownList);
                DropDownList ddlSecondaryLangFooter = (e.Row.FindControl("ddlSecondaryLangFooter") as DropDownList);
                ListItem lst = new ListItem("Please select", "0");
                string selectedFieldName = "";
                string selectedFormName = ""; // DataBinder.Eval(e.Row.DataItem, "inferenceDescription").ToString();
                Label Fieldname = (e.Row.FindControl("lblFieldname") as Label);
                Label FormName = (e.Row.FindControl("lblFormEdit") as Label);
                if (Fieldname != null)
                    selectedFieldName = Fieldname.Text;
                if (FormName != null)
                    selectedFormName = FormName.Text;
                if (ddlFormNameEdit != null)
                {

                    ddlFormNameEdit.DataSource = formMaster;
                    ddlFormNameEdit.DataTextField = "formname";
                    ddlFormNameEdit.DataValueField = "formid";
                    ddlFormNameEdit.DataBind();
                    ddlFormNameEdit.Items.Insert(0, lst);
                    ddlFormNameEdit.Items.FindByText(selectedFormName).Selected = true;
                }
                if (ddlFormNameFooter != null)
                {

                    ddlFormNameFooter.DataSource = formMaster;
                    ddlFormNameFooter.DataTextField = "formname";
                    ddlFormNameFooter.DataValueField = "formid";
                    ddlFormNameFooter.DataBind();
                    ddlFormNameFooter.Items.Insert(0, lst);
                }
                if (ddlFieldNameFooter != null)
                {

                    ddlFieldNameFooter.DataSource = primaryfieldmaster;
                    ddlFieldNameFooter.DataTextField = "primaryfiledname";
                    ddlFieldNameFooter.DataValueField = "primaryfieldid";
                    ddlFieldNameFooter.DataBind();
                    ddlFieldNameFooter.Items.Insert(0, lst);
                    // ddlFieldNameFooter.Items.FindByText(selectedFieldName).Selected = true;
                }
                if (ddlFieldNameEdit != null)
                {

                    ddlFieldNameEdit.DataSource = primaryfieldmaster;
                    ddlFieldNameEdit.DataTextField = "primaryfiledname";
                    ddlFieldNameEdit.DataValueField = "primaryfieldid";
                    ddlFieldNameEdit.DataBind();
                    ddlFieldNameEdit.Items.Insert(0, lst);
                }
                if (ddlSecondaryLangFooter != null)
                {

                    ddlSecondaryLangFooter.DataSource = SecondaryLanguage;
                    ddlSecondaryLangFooter.DataTextField = "secondaryLanguagename";
                    ddlSecondaryLangFooter.DataValueField = "languagecode";
                    ddlSecondaryLangFooter.DataBind();
                    ddlSecondaryLangFooter.Items.Insert(0, lst);
                    // ddlSecondaryLangFooter.Items.FindByText(selectedQuestion).Selected = true;
                }
                if (ddlSecondaryLangEdit != null)
                {

                    ddlSecondaryLangEdit.DataSource = SecondaryLanguage;
                    ddlSecondaryLangEdit.DataTextField = "secondaryLanguagename";
                    ddlSecondaryLangEdit.DataValueField = "languagecode";
                    ddlSecondaryLangEdit.DataBind();
                    ddlSecondaryLangEdit.Items.Insert(0, lst);
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void FormFieldGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormFieldGridView.DataKeys[e.RowIndex].Values[0]);
            applicantformmaster FormID = db.applicantformmaster.Where(b => b.id == formID).First();
            db.applicantformmaster.Remove(FormID);
            db.SaveChanges();
            BindFormView();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        FormFieldGridView.EditIndex = e.NewEditIndex;
        BindFormView();
    }

    protected void FormFieldGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void FormFieldGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int formID = Convert.ToInt32(FormFieldGridView.DataKeys[e.RowIndex].Values[0]);
            formmaster fn = db.formmaster.Where(b => b.formid == formID).First();



            FormFieldGridView.EditIndex = -1;
            db.SaveChanges();
            BindFormView();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlFormname_SelectedIndexChanged(object sender, EventArgs e)

    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            DropDownList drp = (DropDownList)sender;

            GridViewRow gv = (GridViewRow)drp.NamingContainer;

            int index = gv.RowIndex;
            DropDownList ddlFormName = (DropDownList)FormFieldGridView.Rows[index].FindControl("ddlFormname");
            int formID = Convert.ToInt32(ddlFormName.SelectedValue);
            DropDownList ddlFieldName = (DropDownList)FormFieldGridView.Rows[index].FindControl("ddlfieldName");
            var primaryfieldmaster = db.primaryfieldmaster.Where(x => x.formid == formID).ToList();
            ddlFieldName.DataSource = primaryfieldmaster;
            ddlFieldName.DataBind();
            ddlFieldName.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }


    }
    protected void ddlFormnameFooter_SelectedIndexChanged(object sender, EventArgs e)

    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            DropDownList drp = (DropDownList)sender;

            GridViewRow gv = (GridViewRow)drp.NamingContainer;

            int index = gv.RowIndex;
            DropDownList ddlFormName = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlFormnameFooter");
            int formID = Convert.ToInt32(ddlFormName.SelectedValue);
            DropDownList ddlFieldName = (DropDownList)FormFieldGridView.FooterRow.FindControl("ddlfieldNameFooter");
            var primaryfieldmaster = db.primaryfieldmaster.Where(x => x.formid == formID).ToList();
            ddlFieldName.DataSource = primaryfieldmaster;
            ddlFieldName.DataTextField = "primaryfiledname";
            ddlFieldName.DataValueField = "primaryfieldid";
            ddlFieldName.DataBind();
            ddlFieldName.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void FormFieldGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        FormFieldGridView.PageIndex = e.NewPageIndex;
        BindFormView();
    }
}