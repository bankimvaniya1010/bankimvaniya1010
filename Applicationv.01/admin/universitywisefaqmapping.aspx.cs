using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_universitywisefaqmapping : System.Web.UI.Page
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
                BindForm(Convert.ToInt32(ddlUniversity.SelectedValue));
                chkField.Items.Clear();
            }
            else
            {
                ddlForm.ClearSelection();
                chkField.Items.Clear();
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
    private void BindField(int formID)
    {
        try
        {
            var Field = db.faq.ToList();
            chkField.DataSource = Field;
            chkField.DataTextField = "question";
            chkField.DataValueField = "id";
            chkField.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    private void BindForm(int UniversityID)
    {
        try
        {
            int is_service = objCom.GetUniversityservice(UniversityID);
            ListItem lst = new ListItem("Please select", "0");
            // List<formmaster> forms = new List<formmaster>();
            var forms = (from a in db.formmaster
                         join q in db.universitywiseformmapping on a.formid equals q.formid
                         where q.universityid == UniversityID 
                         select new
                         {
                             formname = a.formname,
                             formid = a.formid
                         }).ToList();
            ddlForm.DataSource = forms;
            ddlForm.DataTextField = "formname";
            ddlForm.DataValueField = "formid";
            ddlForm.DataBind();
            ddlForm.Items.Insert(0, lst);
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
            int FormID = Convert.ToInt32(ddlForm.SelectedValue);
            IEnumerable<universitywise_faqmapping> list = db.universitywise_faqmapping.Where(x => x.universityid == UniversityID && x.formid == FormID).ToList();
            // Use Remove Range function to delete all records at once
            db.universitywise_faqmapping.RemoveRange(list);
            // Save changes
            db.SaveChanges();
            foreach (ListItem li in chkField.Items)
            {

                if (li.Selected)
                {
                    int faqquestionID = Convert.ToInt32(li.Value);

                    universitywise_faqmapping mappingObj = new universitywise_faqmapping();
                    mappingObj.faq_questionID = faqquestionID;
                    mappingObj.formid = FormID;
                    mappingObj.university_service = objCom.GetUniversityservice(UniversityID);
                    mappingObj.universityid = UniversityID;
                    db.universitywise_faqmapping.Add(mappingObj);
                    db.SaveChanges();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindPresected(int university, int FormID, int service)
    {
        try
        {
            dynamic universityWise;
            chkField.Items.Clear();
            BindField(FormID);
            if(FormID == 30)
                universityWise = (from fa in db.faq
                                  join ufqm in db.universitywise_faqmapping on fa.id equals ufqm.faq_questionID
                                  where (ufqm.universityid == university && ufqm.formid == FormID && ufqm.university_service == service)
                                  select ufqm).ToList();
            else
                universityWise = (from fa in db.faq
                                  join ufqm in db.universitywise_faqmapping on fa.id equals ufqm.faq_questionID
                                  where (ufqm.universityid == university && ufqm.formid == FormID)
                                  select ufqm).ToList();
            for (int k = 0; k < universityWise.Count; k++)
            {
                chkField.Items.FindByValue(universityWise[k].faq_questionID.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void ddlForm_SelectedIndexChanged(object sender, EventArgs e)
    {
        int formid = Convert.ToInt32(ddlForm.SelectedValue);
        int selecteduniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);

        BindField(Convert.ToInt32(ddlForm.SelectedValue));

        if (formid == 30)
        {
            int university_service = objCom.GetUniversityservice(selecteduniversityID);
            BindPresected(Convert.ToInt32(ddlUniversity.SelectedValue), Convert.ToInt32(ddlForm.SelectedValue), university_service);

        }
        else
            BindPresected(Convert.ToInt32(ddlUniversity.SelectedValue), Convert.ToInt32(ddlForm.SelectedValue), -1);
    }
}