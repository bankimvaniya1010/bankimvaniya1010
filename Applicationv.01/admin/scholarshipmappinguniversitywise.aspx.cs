using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_scholarshipmappinguniversitywise : System.Web.UI.Page
{
    Logger objLog = new Logger();
    private GTEEntities db = new GTEEntities();
    public static string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    string roleName = string.Empty;
    int sessionuniversityId = 0;
    dynamic scholarshipList;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        sessionuniversityId = Convert.ToInt32(Session["universityId"]);
        if (!IsPostBack)
            BindGrid();
    }

    private void BindGrid()
    {
        try
        {            
            var UniversityChoicesList = new List<object>();
            if (roleName.ToLower() == "admin")
            {
                scholarshipList = db.scholarships.ToList();

                foreach (var item in scholarshipList)
                {
                    int scholarshipID = item.id;
                    var check = 0;
                    var universitywisemapped = db.universitywise_scholarshipmapping.Where(x=>x.scholarshipId == scholarshipID).ToList();
                    if (universitywisemapped.Count != 0)
                        check = 1;
                    if (item.awarded_by.Contains("University"))
                    {
                        int universityId = Convert.ToInt32(Regex.Replace(item.awarded_by, "[^0-9]+", string.Empty));
                        item.awarded_by = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityId).Select(x => x.university_name).FirstOrDefault();
                    }                  
                    
                    var choiceObj = new
                    {
                        id= item.id,
                        name = item.name,
                        description = item.description,
                        eligibility = item.eligibility,
                        application_deadline = item.application_deadline,
                        award_amount = item.award_amount,
                        awarded_by = item.awarded_by,
                        scholarship_form = "\\Docs\\Scholarship Forms\\" + item.scholarship_form,
                        check = check,                        
                    };
                    UniversityChoicesList.Add(choiceObj);
                }
            }
            else
            {
                scholarshipList = db.scholarships.ToList();

                foreach (var item in scholarshipList)
                {
                    int scholarshipID = item.id;
                    var check = 0;
                    var universitywisemapped = db.universitywise_scholarshipmapping.Where(x => x.scholarshipId == scholarshipID && x.universityId == sessionuniversityId).ToList();
                    if (universitywisemapped.Count != 0)
                        check = 1;
                    
                    var choiceObj = new
                    {
                        id = item.id,
                        name = item.name,
                        description = item.description,
                        eligibility = item.eligibility,
                        application_deadline = item.application_deadline,
                        award_amount = item.award_amount,
                        awarded_by = item.awarded_by,
                        scholarship_form = "\\Docs\\Scholarship Forms\\" + item.scholarship_form,
                        check = check,
                    };
                    if (item.awarded_by.Contains("University - " + sessionuniversityId) || !item.awarded_by.Contains("University"))
                    {
                        UniversityChoicesList.Add(choiceObj);
                    }   
                }                
            }
            scholarshipGridView.DataSource = UniversityChoicesList;
            scholarshipGridView.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }


    protected void scholarshipGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
               
    }

    protected void scholarshipGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        scholarshipGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void scholarshipGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Submit")
        {            
            int index = Convert.ToInt32(e.CommandArgument);
            int ID = Convert.ToInt32(scholarshipGridView.DataKeys[index].Value);
            GridViewRow row = scholarshipGridView.Rows[index];
            CheckBox checkBox = (CheckBox)row.FindControl("chkactive") as CheckBox;

            universitywise_scholarshipmapping objMapping = new universitywise_scholarshipmapping();
            if (checkBox.Checked == true)
            {
                objMapping.universityId = sessionuniversityId;
                objMapping.scholarshipId = ID;
                db.universitywise_scholarshipmapping.Add(objMapping);
                db.SaveChanges();
            }
            else
            {
                var unselected = db.universitywise_scholarshipmapping.Where(x => x.universityId == sessionuniversityId && x.scholarshipId == ID).FirstOrDefault();
                if (unselected != null)
                {
                    db.universitywise_scholarshipmapping.Remove(unselected);
                    db.SaveChanges();
                }
            }
        }
    }

    protected void scholarshipGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }    
}