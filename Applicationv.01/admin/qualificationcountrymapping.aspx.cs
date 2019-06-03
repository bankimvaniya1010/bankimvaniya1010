using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_qualificationcountrymapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
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
            int countryID = Convert.ToInt32(ddlCountry.SelectedValue);

            IEnumerable<qualificationcountriesmapping> list = db.qualificationcountriesmapping.Where(x => x.countryid == countryID).ToList();
            // Use Remove Range function to delete all records at once
            db.qualificationcountriesmapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chkQualification.Items)
            {

                if (li.Selected)
                {
                    int qualificationID = Convert.ToInt32(li.Value);

                    qualificationcountriesmapping mappingObj = new qualificationcountriesmapping();
                    mappingObj.qualificationid = qualificationID;
                    mappingObj.countryid = countryID;
                    db.qualificationcountriesmapping.Add(mappingObj);
                    db.SaveChanges();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}