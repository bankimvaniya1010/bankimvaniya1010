using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_createuniversitycrendentials : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");

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
        int universityId = Convert.ToInt32(ddlUniversity.SelectedItem.Value);

        credentialmaster credentialObj = new credentialmaster();
        try
        {
            var existingCredential = (from credentials in db.credentialmaster
                                      where credentials.university_id == universityId
                                      select credentials).FirstOrDefault();
            if (existingCredential == null)
            {
                credentialObj.description = txtCredDescription.Value.Trim();
                credentialObj.overall_rank_type1 = txtRankType1.Value.Trim();
                credentialObj.overall_rank_type2 = txtRankType2.Value.Trim();
                credentialObj.overall_rank_type3 = txtRankType3.Value.Trim();
                credentialObj.ranking_by_subject = txtRankSubject.Value.Trim();
                credentialObj.ranking_by_region = txtRankRegion.Value.Trim();
                credentialObj.awards = txtAwards.Value.Trim();
                credentialObj.university_id = universityId;

                db.credentialmaster.Add(credentialObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Credential already exists for this university. Please select another university')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}