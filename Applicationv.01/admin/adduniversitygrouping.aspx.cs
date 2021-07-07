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
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
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
            List<university_master> universityMaster = db.university_master.OrderBy(x=>x.university_name).Where(x=>x.IsDeleted != 1).ToList();

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
        try
        {
            IEnumerable<universitygrouping> list = db.universitygrouping.Where(x => x.groupingheaduniversityid == groupHeadUniversity).ToList();
            // Use Remove Range function to delete all records at once
            db.universitygrouping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chk_universitylist.Items)
            {

                if (li.Selected)
                {
                    int uid = Convert.ToInt32(li.Value);

                    universitygrouping mappingObj = new universitygrouping();
                    mappingObj.groupingheaduniversityid = groupHeadUniversity;
                    mappingObj.universityid = uid;
                    db.universitygrouping.Add(mappingObj);
                    db.SaveChanges();
                }

            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Record added successfully.');window.location='" + webURL + "admin/universitygroupingmaster.aspx';", true);
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int uid = Convert.ToInt32(ddlUniversity.SelectedValue);
        if (uid != 0)
        {
            BindCheckbox(uid);
            BindMappped(uid);
        }
    }
    private void BindCheckbox(int HeaduniversityID)
    {
        try {
            ListItem lst = new ListItem("Please select university", "0");
            List<university_master> universityMaster = db.university_master.OrderBy(x => x.university_name).Where(x=>x.universityid != HeaduniversityID && x.IsDeleted != 1).ToList();
            
            chk_universitylist.DataSource = universityMaster;
            chk_universitylist.DataTextField = "university_name";
            chk_universitylist.DataValueField = "universityid";
            chk_universitylist.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
    private void BindMappped(int universityID)
    {
        try
        {
            chk_universitylist.ClearSelection();
            var universityWise = db.universitygrouping.Where(x => x.groupingheaduniversityid == universityID).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chk_universitylist.Items.FindByValue(universityWise[k].universityid.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}