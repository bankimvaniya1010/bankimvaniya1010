using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_grademaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!IsPostBack)
            BindGrade();
    }
    private void BindGrade()
    {
        try
        {
            var gradeList = (from q in db.grademaster

                             select new
                             {
                                 id = q.id,
                                 description = q.description,

                             }).ToList();
            if (gradeList != null)
            {
                gvGrade.DataSource = gradeList;
                gvGrade.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvGrade_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvGrade.EditIndex = -1;
        BindGrade();
    }

    protected void gvGrade_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("AddNew"))

            {
                grademaster objGrade = new grademaster();

                TextBox txtDescription = (TextBox)gvGrade.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.grademaster
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objGrade.description = txtDescription.Text.Trim();

                    db.grademaster.Add(objGrade);
                    db.SaveChanges();
                    BindGrade();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data is already recorded with entered description ')", true);
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvGrade_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvGrade_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvGrade.DataKeys[e.RowIndex].Values[0]);
            grademaster objGrade = db.grademaster.Where(b => b.id == ID).First();
            var existsInUniversitywisemapping = (from umm in db.universitywisemastermapping
                                                 join mn in db.master_name on umm.masterid equals mn.masterid
                                                 where umm.universityid == universityID && mn.mastername.ToUpper().Contains("Major Discipline Master") && umm.mastervalueid == ID
                                                 select umm).ToList();
            var existsInLanguageDetail = db.applicantlanguagecompetency.Where(x =>x.gradetype == ID.ToString()).ToList();
            var existsInEducationDetails = db.applicanteducationdetails.Where(d => d.highschoolgradetypeid == ID && d.secondarygradetypeid == ID && d.diplomagradetypeid == ID).ToList();
            var existsInHigheduDetail = db.applicanthighereducation.Where(h => h.gradetypeid == ID).ToList();
            var existsInsubjectwisemapping = db.applicantsubjectwisegrade.Where(s => s.gradeid == ID).ToList();

            if (existsInUniversitywisemapping.Count == 0 && existsInLanguageDetail.Count == 0 && existsInsubjectwisemapping.Count == 0 && existsInEducationDetails.Count == 0 && existsInHigheduDetail.Count == 0)
            {
                db.grademaster.Remove(objGrade);
                db.SaveChanges();
                BindGrade();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This grade as it already Used in another records')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvGrade.EditIndex = e.NewEditIndex;
        BindGrade();
    }

    protected void gvGrade_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvGrade_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvGrade.DataKeys[e.RowIndex].Values[0]);
            grademaster objGrade = db.grademaster.Where(b => b.id == ID).First();
            TextBox txtDescription = (TextBox)gvGrade.Rows[e.RowIndex].FindControl("txtDescription");
            objGrade.description = txtDescription.Text.Trim();
            gvGrade.EditIndex = -1;
            db.SaveChanges();
            BindGrade();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvGrade_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGrade.PageIndex = e.NewPageIndex;
        BindGrade();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvGrade.FooterRow != null)
            control = gvGrade.FooterRow;
        else
            control = gvGrade.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        grademaster objID = new grademaster();

        objID.description = idDescriptonText;

        db.grademaster.Add(objID);
        db.SaveChanges();
        BindGrade();
    }
}