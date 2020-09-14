using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitywiseclassmapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objcom = new Common();
    string webURL = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            objcom.BindCountries(ddlinstitution);
            BindClass();
        }
    }
    private void BindClass()
    {
        try
        {
            var idproof = db.class_master.ToList();
            chkIdProof.DataSource = idproof;
            chkIdProof.DataTextField = "description";
            chkIdProof.DataValueField = "id";
            chkIdProof.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            var institutionID = Convert.ToInt32(ddlinstitution.SelectedValue);
            IEnumerable<institutionwiseclassmaster> list = db.institutionwiseclassmaster.Where(x => x.institutionID == institutionID).ToList();
            db.institutionwiseclassmaster.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in chkIdProof.Items)
            {
                if (li.Selected)
                {
                    int proofId = Convert.ToInt16(li.Value);
                    institutionwiseclassmaster mappingObj = new institutionwiseclassmaster();
                    mappingObj.institutionID = institutionID;
                    mappingObj.classId = proofId;
                    db.institutionwiseclassmaster.Add(mappingObj);
                    db.SaveChanges();
                    lblMessage.Text = "Date saved successfully";
                    lblMessage.Visible = true;
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved successfully')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlinstitution_SelectedIndexChanged(object sender, EventArgs e)
    {
        var institutionid = Convert.ToInt32(ddlinstitution.SelectedValue);
        BindClass();
        var institutionidwise = db.institutionwiseclassmaster.Where(x => x.institutionID == institutionid).ToList();
        for (int k = 0; k < institutionidwise.Count; k++)
        {
            chkIdProof.Items.FindByValue(institutionidwise[k].classId.ToString()).Selected = true;
        }
    }
}