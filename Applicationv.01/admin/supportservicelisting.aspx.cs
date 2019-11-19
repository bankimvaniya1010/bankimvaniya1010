using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_supportservicelisting : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {
            var ServiceList = (from q in db.supportservicemaster
                               select new
                               {
                                   id = q.supportservicemasterId,
                                   servicetype = q.servicetype,
                                   providername = q.serviceprovider_name,
                                   provideremail = q.serviceprovider_email,
                                   providerphonenumber = q.serviceprovider_phonenumber,
                                   description = q.description,
                               }).ToList();
            if (ServiceList != null)
            {
                grSupportService.DataSource = ServiceList;
                grSupportService.DataBind();
            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void grSupportService_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(grSupportService.DataKeys[e.RowIndex].Values[0]);
            supportservicemaster sm = db.supportservicemaster.Where(b => b.supportservicemasterId == ID).First();
            var existsInUniversitywisemapping = db.universitywise_supportservicemapping.Where(x => x.supportserviceID == ID).ToList();
            if (existsInUniversitywisemapping.Count == 0)
            {
                db.supportservicemaster.Remove(sm);
                db.SaveChanges();
                BindGrid();
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('We can not delete This Support Service as it already mapped in university wise mapping records')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grSupportService_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grSupportService.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[6].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grSupportService_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grSupportService.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}