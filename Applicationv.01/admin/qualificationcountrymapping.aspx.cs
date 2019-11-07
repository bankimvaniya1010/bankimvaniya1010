using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
public partial class admin_qualificationcountrymapping : System.Web.UI.Page
{
    ArrayList SelectedItems = new ArrayList();
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            objCom.BindCountries(ddlCountry);
            BindQualification();
        }
    }
    private void BindQualification()
    {
        try
        {
            var qualification = db.qualificationmaster.ToList();
            chkQualification.DataSource = qualification;
            chkQualification.DataTextField = "qualificationname";
            chkQualification.DataValueField = "qualificationid";
            chkQualification.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    private void BindPresected(int countryID)
    {
        try
        {
            chkQualification.Items.Clear();
            BindQualification();
            var qualificationuniversitywise = db.qualificationcountriesmapping.Where(x => x.countryid == countryID).ToList();
            for (int k = 0; k < qualificationuniversitywise.Count; k++)
            {
                chkQualification.Items.FindByValue(qualificationuniversitywise[k].qualificationid.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPresected(Convert.ToInt32(ddlCountry.SelectedItem.Value));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            var countryid = Convert.ToInt32(ddlCountry.SelectedValue);
            IEnumerable<qualificationcountriesmapping> list = db.qualificationcountriesmapping.Where(x => x.countryid == countryid).ToList();
            db.qualificationcountriesmapping.RemoveRange(list);
            db.SaveChanges();

            foreach (ListItem li in chkQualification.Items)
            {
                if (li.Selected)
                {
                    int qualificationId = Convert.ToInt16(li.Value);
                    qualificationcountriesmapping mappingObj = new qualificationcountriesmapping();
                    mappingObj.countryid = countryid;
                    mappingObj.qualificationid = qualificationId;
                    db.qualificationcountriesmapping.Add(mappingObj);
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

    private void AddItem(int Qualificationid, int CountryID)
    {
        try
        {
            qualificationcountriesmapping mappingObj = new qualificationcountriesmapping();
            mappingObj.qualificationid = Qualificationid;
            mappingObj.countryid = CountryID;
            db.qualificationcountriesmapping.Add(mappingObj);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void RemoveItem(int Qualificationid)
    {
        try
        {
            var notselectedItem = (from smap in db.qualificationcountriesmapping
                                   where smap.qualificationid == Qualificationid
                                   select smap).SingleOrDefault();

            //Delete it from memory
            db.qualificationcountriesmapping.Remove(notselectedItem);
            //Save to database
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}