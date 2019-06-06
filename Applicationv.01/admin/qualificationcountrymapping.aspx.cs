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
        if ((Session["Role"] == null) || (Session["UserID"] == null))
            Response.Redirect(webURL + "admin/login.aspx", true);
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
            var list = db.qualificationcountriesmapping.Where(x => x.countryid == countryID).ToList();
            foreach (ListItem li in chkQualification.Items)
            {

                if (li.Selected)
                {
                    int QualificationID = Convert.ToInt32(li.Value);
                    SelectedItems.Add(QualificationID);
                }

            }

            if (list.Count > 0)
            {

                bool isAvailbale = false;
                for (int k = 0; k < SelectedItems.Count; k++)
                {

                    foreach (var item in list)
                    {
                        if (item.qualificationid == Convert.ToInt32(SelectedItems[k]))
                        {
                            isAvailbale = true;
                            break;
                        }

                    }
                    if (isAvailbale == false)
                        AddItem(Convert.ToInt32(SelectedItems[k]), countryID);
                }

                // To remove Old values if not selected

                foreach (var item in list)
                {
                    isAvailbale = false;
                    for (int k = 0; k < SelectedItems.Count; k++)
                    {
                        if (item.qualificationid == Convert.ToInt32(SelectedItems[k]))
                        {
                            isAvailbale = true;
                            break;
                        }

                    }
                    if (isAvailbale == false)
                        RemoveItem(Convert.ToInt32(item.qualificationid));
                }

            }
            else
            {
                for (int k = 0; k < SelectedItems.Count; k++)
                {
                    AddItem(Convert.ToInt32(SelectedItems[k]), countryID);
                }
            }



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