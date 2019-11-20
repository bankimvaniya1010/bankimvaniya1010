using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_subjectmaster : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindSubject();
    }
    private void BindSubject()
    {
        try
        {
            var SubjectList = (from sm in db.subjectmaster
                        select new
                        {
                            id = sm.id,
                            description = sm.description,
                        }).SortBy("id").ToList();
            if (SubjectList != null)
            {
                gvsubjectmasterGridView.DataSource = SubjectList;
                gvsubjectmasterGridView.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
        
    protected void gvsubjectmasterGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvsubjectmasterGridView.EditIndex = -1;
            BindSubject();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvsubjectmasterGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                subjectmaster objsubjectmaster = new subjectmaster();

                TextBox txtDescription = (TextBox)gvsubjectmasterGridView.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.subjectmaster
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objsubjectmaster.description = txtDescription.Text.Trim();

                    db.subjectmaster.Add(objsubjectmaster);
                    db.SaveChanges();
                    BindSubject();
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

    protected void gvsubjectmasterGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvsubjectmasterGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvsubjectmasterGridView.DataKeys[e.RowIndex].Values[0]);
            subjectmaster subject = db.subjectmaster.Where(b => b.id == ID).First();
            var existsInCountrywiseSubjectmapping = db.subjectwisecountrymapping.Where(c => c.subjectid == ID).ToList();
            if (existsInCountrywiseSubjectmapping.Count == 0)
            {
                db.subjectmaster.Remove(subject);
                db.SaveChanges();
                BindSubject();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This Subject as it already Used in country wise mapping records')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvsubjectmasterGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvsubjectmasterGridView.EditIndex = e.NewEditIndex;
            BindSubject();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvsubjectmasterGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvsubjectmasterGridView.DataKeys[e.RowIndex].Values[0]);
            subjectmaster subject = db.subjectmaster.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvsubjectmasterGridView.Rows[e.RowIndex].FindControl("txtDescription");

            subject.description = txtDescription.Text.Trim();

            gvsubjectmasterGridView.EditIndex = -1;
            db.SaveChanges();
            BindSubject();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvsubjectmasterGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvsubjectmasterGridView.PageIndex = e.NewPageIndex;
        BindSubject();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvsubjectmasterGridView.FooterRow != null)
            control = gvsubjectmasterGridView.FooterRow;
        else
            control = gvsubjectmasterGridView.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        subjectmaster objID = new subjectmaster();

        objID.description = idDescriptonText;

        db.subjectmaster.Add(objID);
        db.SaveChanges();
        BindSubject();
    }
}