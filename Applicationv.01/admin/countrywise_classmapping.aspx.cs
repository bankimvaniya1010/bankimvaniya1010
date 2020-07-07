using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_countrywise_classmapping : System.Web.UI.Page
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
            Bindclass();
        }
    }
    private void Bindclass()
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
            var countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            IEnumerable<countrywiseclassmaster> list = db.countrywiseclassmaster.Where(x => x.countryID == countryid).ToList();
            db.countrywiseclassmaster.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in chkIdProof.Items)
            {
                if (li.Selected)
                {
                    int proofId = Convert.ToInt16(li.Value);
                    countrywiseclassmaster mappingObj = new countrywiseclassmaster();
                    mappingObj.countryID = countryid;
                    mappingObj.classId = proofId;
                    db.countrywiseclassmaster.Add(mappingObj);
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
        Bindclass();
        var countrywise = db.countrywiseclassmaster.Where(x => x.countryID == countryid).ToList();
        for (int k = 0; k < countrywise.Count; k++)
        {
            chkIdProof.Items.FindByValue(countrywise[k].classId.ToString()).Selected = true;
        }
    }
}