using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_alternateIdproofcountrywise : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    Common objcom = new Common();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            objcom.BindCountries(ddlcountry);
            BindIdProof();
        }
    }
    private void BindIdProof()
    {
        try
        {
            var idproof = db.alternateidproofmaster.ToList();
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
            IEnumerable<countrywisealternateidproofmaster> list = db.countrywisealternateidproofmaster.Where(x => x.countryID == countryid).ToList();
            db.countrywisealternateidproofmaster.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in chkIdProof.Items)
            {
                if (li.Selected)
                {
                    int proofId = Convert.ToInt16(li.Value);
                    countrywisealternateidproofmaster mappingObj = new countrywisealternateidproofmaster();
                    mappingObj.countryID = countryid;
                    mappingObj.alternateidproofID = proofId;
                    db.countrywisealternateidproofmaster.Add(mappingObj);
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
        BindIdProof();
        var countrywise = db.countrywisealternateidproofmaster.Where(x => x.countryID == countryid).ToList();
        for (int k = 0; k < countrywise.Count; k++)
        {
            chkIdProof.Items.FindByValue(countrywise[k].alternateidproofID.ToString()).Selected = true;
        }
    }
}