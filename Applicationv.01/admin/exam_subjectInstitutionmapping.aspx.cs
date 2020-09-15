using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_subjectInstitutionmapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string roleName = string.Empty;
    int universityID = 0;
    string webURL = string.Empty;
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

        }
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlUniversity.SelectedValue != "0")
            {                
                BindField();
                BindPresected(Convert.ToInt32(ddlUniversity.SelectedValue));
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
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
    private void BindField()
    {
        try
        {
            var Field = db.exam_subjectmaster.ToList();
            chkField.DataSource = Field;
            chkField.DataTextField = "description";
            chkField.DataValueField = "id";
            chkField.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
  
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            IEnumerable<exam_universitywisesubjectmapping> list = db.exam_universitywisesubjectmapping.Where(x => x.universityID == UniversityID).ToList();
            // Use Remove Range function to delete all records at once
            db.exam_universitywisesubjectmapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chkField.Items)
            {

                if (li.Selected)
                {
                    int subjectID = Convert.ToInt32(li.Value);

                    exam_universitywisesubjectmapping mappingObj = new exam_universitywisesubjectmapping();
                    mappingObj.subjectID = subjectID;
                    mappingObj.universityID = UniversityID;
                    db.exam_universitywisesubjectmapping.Add(mappingObj);
                    db.SaveChanges();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindPresected(int university)
    {
        try
        {
            var universityWise = (from fa in db.exam_subjectmaster
                                  join ufqm in db.exam_universitywisesubjectmapping on fa.id equals ufqm.subjectID
                                  where (ufqm.universityID == university)
                                  select ufqm).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chkField.Items.FindByValue(universityWise[k].subjectID.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    
}