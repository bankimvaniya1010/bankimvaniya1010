using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_universitywise_payment_description_mappings : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            BindUniversity();
            Bindpaymentdescription();
        }        
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.Where(x=>x.IsDeleted != 1).ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void Bindpaymentdescription()
    {
        try
        {
            var data = db.payment_description_master.ToList();
            chkpaymentdescrip.DataSource = data;
            chkpaymentdescrip.DataTextField = "payment_description";
            chkpaymentdescrip.DataValueField = "id";
            chkpaymentdescrip.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    protected void btn_Save_Click(object sender, EventArgs e)
    {        
        int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);

        IEnumerable<payment_description_mappings> list = db.payment_description_mappings.Where(x => x.university_id == UniversityID).ToList();
        db.payment_description_mappings.RemoveRange(list);
        db.SaveChanges();

        foreach (ListItem li in chkpaymentdescrip.Items)
        {
            if (li.Selected)
            {
                int paymentdescriptionid = Convert.ToInt16(li.Value);
                payment_description_mappings mappingObj = new payment_description_mappings();
                mappingObj.university_id = UniversityID;
                mappingObj.payment_description_id = paymentdescriptionid;                
                db.payment_description_mappings.Add(mappingObj);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Mapping Saved Successfully')", true);
            }
        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        chkpaymentdescrip.Items.Clear();
        Bindpaymentdescription();
        int universityId = Convert.ToInt16(ddlUniversity.SelectedValue);

        var existsIndetails = (from pd in db.payment_details
                               join pdm in db.payment_description_master on pd.payment_for equals pdm.id
                               where pd.university_id == universityId
                               select pdm).ToList();

        if (existsIndetails.Count != 0)
        {
            for (int k = 0; k < existsIndetails.Count; k++)
            {
                chkpaymentdescrip.Items.FindByValue(existsIndetails[k].id.ToString()).Enabled = false;
                shownotification.Attributes.Add("style", "display:block;");               
            }
        }
        else
            shownotification.Attributes.Add("style", "display:none;");

        var universityWise = (from usm in db.payment_description_mappings
                              join sm in db.payment_description_master on usm.payment_description_id equals sm.id
                              where usm.university_id == universityId
                              select usm).ToList();
        for (int k = 0; k < universityWise.Count; k++)
        {
            chkpaymentdescrip.Items.FindByValue(universityWise[k].payment_description_id.ToString()).Selected = true;
        }
    }
}