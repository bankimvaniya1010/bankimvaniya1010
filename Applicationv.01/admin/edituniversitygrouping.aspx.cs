using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_edituniversitygrouping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (Request.QueryString["headUniversityID"] != null)
        {
            int headUniversityId;
            if (!Int32.TryParse(Request.QueryString["headUniversityID"], out headUniversityId))
                Response.Redirect("~/admin/default.aspx");

            if (!IsPostBack)
            {
                var existingMapping = (from mappings in db.universitygrouping
                                       where mappings.groupingheaduniversityid == headUniversityId
                                       select mappings).ToList();

                if (existingMapping != null)
                {
                    ViewState["headUniversityID"] = headUniversityId;
                    bindUniversityDropDown(headUniversityId);

                    List<university_master> notSelectedUniversityList = db.university_master.ToList();
                    foreach (var item in existingMapping)
                        notSelectedUniversityList.Remove(notSelectedUniversityList.Where(x => x.universityid == item.universityid).First());

                    notSelectedUniversityList.Remove(notSelectedUniversityList.Where(x => x.universityid == headUniversityId).First());

                    var selectedUniversityList = (from universities in db.university_master
                                                  join mappings in db.universitygrouping on universities.universityid equals mappings.universityid
                                                  where universities.universityid == mappings.universityid && mappings.groupingheaduniversityid == headUniversityId
                                                  select universities).ToList();

                    foreach (var item in notSelectedUniversityList)
                    {
                        if (item.universityid != headUniversityId)
                        {
                            ListItem checkBox = new ListItem();
                            checkBox.Text = item.university_name;
                            checkBox.Selected = false;
                            checkBox.Value = Convert.ToString(item.universityid);
                            checkBoxList.Items.Add(checkBox);
                        }
                    }

                    foreach (var item in selectedUniversityList)
                    {
                        ListItem checkBox = new ListItem();
                        checkBox.Text = item.university_name;
                        checkBox.Selected = true;
                        checkBox.Value = Convert.ToString(item.universityid);
                        checkBoxList.Items.Add(checkBox);
                        //set checked properties of checke box with mappings;
                    }

                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No University/universities present under this university')", true);
            }
            
        }
        else
            Response.Redirect("~/admin/default.aspx");
    }

    private void bindUniversityDropDown(int universityId)
    {
        try
        {
            ListItem lst = new ListItem("Please select university", "0");
            List<university_master> universityMaster = db.university_master.ToList();

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
            ddlUniversity.SelectedIndex = universityId;
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int groupHeadUniversity = Convert.ToInt32(ddlUniversity.SelectedItem.Value);
        string[] selectedUniversity;

        if (Request.Form["university"] == null)
        {
            selectedUniversity = new string[checkBoxList.Items.Count];
            for (int i = 0, j = 0; i < checkBoxList.Items.Count; i++)
            {
                if (checkBoxList.Items[i].Selected == true) 
                {
                    selectedUniversity.SetValue(checkBoxList.Items[i].Value, j); // add selected Item text to the String.
                    j++;
                }
            }
        }
        else
            selectedUniversity = Request.Form["university"].Split(',');

        int existingGroupHeadID = Convert.ToInt32(ViewState["headUniversityID"]);
        var existingGrouping = (from mapping in db.universitygrouping
                                where mapping.groupingheaduniversityid == existingGroupHeadID
                                select mapping).ToList();

        db.universitygrouping.RemoveRange(existingGrouping);
        db.SaveChanges();
        try
        {
            foreach (string s in selectedUniversity)
            {
                if (!string.IsNullOrEmpty(s))
                {
                    universitygrouping groupingObj = new universitygrouping();
                    groupingObj.groupingheaduniversityid = groupHeadUniversity;
                    groupingObj.universityid = Convert.ToInt32(s);

                    db.universitygrouping.Add(groupingObj);
                    db.SaveChanges();
                }
            }
            Response.Redirect("~/admin/universitygroupingmaster.aspx");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}