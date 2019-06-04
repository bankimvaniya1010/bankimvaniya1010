using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
public partial class admin_subjectwisecountrymapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    ArrayList SelectedItems = new ArrayList();
   
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            objCom.BindCountries(ddlCountry);
            BindSubject();
        }
    }
    private void BindSubject()
    {
        try
        {
            var qualification = db.subjectmaster.ToList();
            chkSubject.DataSource = qualification;
            chkSubject.DataTextField = "description";
            chkSubject.DataValueField = "id";
            chkSubject.DataBind();
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
            chkSubject.Items.Clear();
            BindSubject();
            var subjectuniversitywise = db.subjectwisecountrymapping.Where(x => x.countryid == countryID).ToList();
            for (int k = 0; k < subjectuniversitywise.Count; k++)
            {
                chkSubject.Items.FindByValue(subjectuniversitywise[k].subjectid.ToString()).Selected = true;
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
            var list = db.subjectwisecountrymapping.Where(x => x.countryid == countryID).ToList();
            foreach (ListItem li in chkSubject.Items)
            {

                if (li.Selected)
                {
                    int subjectId = Convert.ToInt32(li.Value);
                    SelectedItems.Add(subjectId);
                }

            }

            if (list.Count > 0)
            {

                bool isAvailbale = false;
                for (int k = 0; k < SelectedItems.Count; k++)
                {

                    foreach (var item in list)
                    {
                        if (item.subjectid == Convert.ToInt32(SelectedItems[k]))
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
                        if (item.subjectid == Convert.ToInt32(SelectedItems[k]))
                        {
                            isAvailbale = true;
                            break;
                        }

                    }
                    if (isAvailbale == false)
                        RemoveItem(Convert.ToInt32(item.subjectid));
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

    private void AddItem(int subjectID, int CountryID)
    {
        try
        {
            subjectwisecountrymapping mappingObj = new subjectwisecountrymapping();
            mappingObj.subjectid = subjectID;
            mappingObj.countryid = CountryID;
            db.subjectwisecountrymapping.Add(mappingObj);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void RemoveItem(int subjectID)
    {
        try
        {
            var notselectedItem = (from smap in db.subjectwisecountrymapping
                                   where smap.subjectid == subjectID
                                   select smap).SingleOrDefault();

            //Delete it from memory
            db.subjectwisecountrymapping.Remove(notselectedItem);
            //Save to database
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}
