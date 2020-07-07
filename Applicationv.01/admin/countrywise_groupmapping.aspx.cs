using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_countrywise_groupmapping : System.Web.UI.Page
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
            objcom.BindCountries(ddlcountry);
            BindGroup();
        }
    }
    private void BindGroup()
    {
        try
        {
            var idproof = db.group_master.ToList();
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
            var countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            IEnumerable<countrywisegroupmaster> list = db.countrywisegroupmaster.Where(x => x.countryID == countryid).ToList();
            db.countrywisegroupmaster.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in chkIdProof.Items)
            {
                if (li.Selected)
                {
                    int proofId = Convert.ToInt16(li.Value);
                    countrywisegroupmaster mappingObj = new countrywisegroupmaster();
                    mappingObj.countryID = countryid;
                    mappingObj.groupId = proofId;
                    db.countrywisegroupmaster.Add(mappingObj);
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

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        var countryid = Convert.ToInt32(ddlcountry.SelectedValue);
        BindGroup();
        var countrywise = db.countrywisegroupmaster.Where(x => x.countryID == countryid).ToList();
        for (int k = 0; k < countrywise.Count; k++)
        {
            chkIdProof.Items.FindByValue(countrywise[k].groupId.ToString()).Selected = true;
        }
    }
}