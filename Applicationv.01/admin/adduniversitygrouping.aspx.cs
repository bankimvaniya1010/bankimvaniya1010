using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adduniversitygrouping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        { bindUniversityDropDown(); }
    }

    private void bindUniversityDropDown()
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            List<university_master> universityMaster = db.university_master.ToList();

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int groupHeadUniversity = Convert.ToInt32(ddlUniversity.SelectedItem.Value);
        string[] selectedUniversity = Request.Form["university"].Split(',');

        try
        {
            foreach (string s in selectedUniversity)
            {
                universitygrouping groupingObj = new universitygrouping();
                int universityID = Convert.ToInt32(s);
                var existingGrouping = (from mapping in db.universitygrouping
                                        where mapping.universityid.Equals(universityID) && mapping.groupingheaduniversityid.Equals(groupHeadUniversity)
                                        select mapping).FirstOrDefault();
                if (existingGrouping == null)
                {
                    groupingObj.groupingheaduniversityid = groupHeadUniversity;
                    groupingObj.universityid = universityID;

                    db.universitygrouping.Add(groupingObj);
                    db.SaveChanges();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('University mapping already exists for university ID: " + s +")", true);
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}