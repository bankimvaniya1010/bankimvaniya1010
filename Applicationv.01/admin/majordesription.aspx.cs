using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_majordesription : System.Web.UI.Page
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
            BindMajorDescription();
    }
    private void BindMajorDescription()
    {
        try
        {
            var MajorList = (from q in db.majordiscipline_master                             
                             select new
                             {
                                 id = q.id,
                                 description = q.description,                                
                             }).ToList();
            if (MajorList != null)
            {
                gvMajorDescription.DataSource = MajorList;
                gvMajorDescription.DataBind();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_DataBound(object sender, EventArgs e)
    {

    }

    protected void gvMajorDescription_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvMajorDescription.EditIndex = -1;
        BindMajorDescription();
    }

    protected void gvMajorDescription_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))

            {
                majordiscipline_master objMajor = new majordiscipline_master();

                TextBox txtDescription = (TextBox)gvMajorDescription.FooterRow.FindControl("txtDescription1");

                var existingData = (from data in db.majordiscipline_master
                                    where data.description == txtDescription.Text.Trim()
                                    select data.description).FirstOrDefault();
                if (string.IsNullOrEmpty(existingData))
                {
                    objMajor.description = txtDescription.Text.Trim();
                    db.majordiscipline_master.Add(objMajor);
                    db.SaveChanges();
                    BindMajorDescription();
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

    protected void gvMajorDescription_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void gvMajorDescription_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }

    protected void gvMajorDescription_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvMajorDescription.DataKeys[e.RowIndex].Values[0]);
            majordiscipline_master objMajor = db.majordiscipline_master.Where(b => b.id == ID).First();
            var existsInApplicationmaster = db.applicationmaster.Where(x=> x.majorofdiscipline == ID).ToList();
            var existsInApplicantdetails = db.applicantdetails.Where(c => c.fieldofhigheststudy == ID).ToList();
            var existsIngteapplicantdetails = db.gte_applicantdetails.Where(g => g.highestqualificationfield == ID && g.fieldofstudyapplied == ID).ToList();
            var existsIncoursemaster = db.coursemaster.Where(c => c.modeofstudyId == ID).ToList();
            var existsInUniversitywisemapping = (from umm in db.universitywisemastermapping
                                                 join mn in db.master_name on umm.masterid equals mn.masterid
                                                 where umm.universityid == universityID && mn.mastername.ToUpper().Contains("Major Discipline Master") && umm.mastervalueid == ID
                                                 select umm).ToList();
            if (existsInApplicationmaster.Count == 0 && existsInApplicantdetails.Count == 0 && existsIngteapplicantdetails.Count == 0 && existsIncoursemaster.Count == 0 && existsInUniversitywisemapping.Count == 0)
            {
                db.majordiscipline_master.Remove(objMajor);
                db.SaveChanges();
                BindMajorDescription();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete this Major Discipline as it already used in another records')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvMajorDescription.EditIndex = e.NewEditIndex;
            BindMajorDescription();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }

    protected void gvMajorDescription_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(gvMajorDescription.DataKeys[e.RowIndex].Values[0]);
            majordiscipline_master objMajor = db.majordiscipline_master.Where(b => b.id == ID).First();


            TextBox txtDescription = (TextBox)gvMajorDescription.Rows[e.RowIndex].FindControl("txtDescription");

            objMajor.description = txtDescription.Text.Trim();
            
            gvMajorDescription.EditIndex = -1;
            db.SaveChanges();
            BindMajorDescription();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void gvMajorDescription_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvMajorDescription.PageIndex = e.NewPageIndex;
        BindMajorDescription();
    }

    protected void Add(object sender, EventArgs e)
    {
        Control control = null;
        if (gvMajorDescription.FooterRow != null)
            control = gvMajorDescription.FooterRow;
        else
            control = gvMajorDescription.Controls[0].Controls[0];
        string idDescriptonText = (control.FindControl("txtEmptyRecordDescription") as TextBox).Text;
        if (string.IsNullOrEmpty(idDescriptonText))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Description Cannot Be Empty')", true);
            return;
        }

        majordiscipline_master objID = new majordiscipline_master();

        objID.description = idDescriptonText;

        db.majordiscipline_master.Add(objID);
        db.SaveChanges();
        BindMajorDescription();
    }
}