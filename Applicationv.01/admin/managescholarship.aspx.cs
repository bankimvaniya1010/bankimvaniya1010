using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_managescholarship : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if (!IsPostBack)
        {
            bindUniversities();
            FillMonth(ddlMonth);
            FillYears(ddlYear);
            if (Request.QueryString["scholarshipID"] != null)
            {
                int scholarshipID;
                if (!Int32.TryParse(Request.QueryString["scholarshipID"], out scholarshipID))
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid ScholarshipID'); window.location='" + webURL + "admin/scholarshipmaster.aspx';", true);
                else
                    populateScholarship(scholarshipID);
            }
        }
    }

    private void bindUniversities()
    {
        try
        {
            ListItem lst = new ListItem("Please select institution", "0");
            List<university_master> universityMaster = db.university_master.Where(x=>x.IsDeleted != 1).ToList();

            ddlUniversity.DataSource = universityMaster;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityid";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    protected void populateScholarship(int scholarshipID)
    {
        try
        {
            scholarships existingScholarship = db.scholarships.Where(obj => obj.id == scholarshipID).First();

            if (existingScholarship != null)
            {
                ViewState["scholarshipID"] = scholarshipID;

                txtScholarshipEligibility.Value = existingScholarship.eligibility;
                txtScholarshipDescription.Value = existingScholarship.description;
                txtScholarshipName.Value = existingScholarship.name;
                txtScholarshipAmount.Value = existingScholarship.award_amount.ToString();
                if (existingScholarship.application_deadline != null)
                {
                    DateTime deadLineDate = Convert.ToDateTime(existingScholarship.application_deadline);
                    FillMonth(ddlMonth);
                    FillYears(ddlYear);

                    ddlMonth.ClearSelection();
                    ddlYear.ClearSelection();
                    ddlMonth.Items.FindByValue(deadLineDate.Month.ToString()).Selected = true;
                    ddlYear.Items.FindByValue(deadLineDate.Year.ToString()).Selected = true;
                    FillDays(ddlDay, ddlYear, ddlMonth);
                    ddlDay.Items.FindByValue(deadLineDate.Day.ToString()).Selected = true;
                    hidDeadLineDate.Value = deadLineDate.Day.ToString();
                }

                if (existingScholarship.awarded_by.Contains("University"))
                {
                    rbtnUniversity.Checked = true;
                    var universityId = Convert.ToInt32(Regex.Replace(existingScholarship.awarded_by, "[^0-9]+", string.Empty));
                    ddlUniversity.ClearSelection();
                    ddlUniversity.Items.FindByValue(universityId.ToString()).Selected = true;
                }
                else
                {
                    rbtnUniversal.Checked = true;
                    txtScholarshipAwardedBy.Value = existingScholarship.awarded_by;
                }

                hidFileUploaded.Value = existingScholarship.scholarship_form;
                string fileExtension = existingScholarship.scholarship_form.Split('.')[1];
                fileName.InnerText = txtScholarshipName.Value + "." + fileExtension;
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Scholarship does not exists'); window.location='" + webURL + "admin/scholarshipmaster.aspx';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public void FillMonth(DropDownList ddl)
    {
        try
        {
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            for (int i = 1; i <= 12; i++)
                ddl.Items.Add(new ListItem(info.GetMonthName(i).Substring(0, 3).ToUpper(), i.ToString()));
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
    public void FillYears(DropDownList ddl)
    {
        try
        {
            int maxYers = DateTime.Now.AddYears(2).Year;
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear; i <= maxYers; i++)
                ddl.Items.Add(i.ToString());
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    public void FillDays(DropDownList ddl, DropDownList ddlFromYear, DropDownList ddlFromMonth)
    {
        try
        {
            ddl.Items.Clear();
            ddl.Items.Add("Select Day");
            List<dynamic> daysData = new List<dynamic>();
            daysData.Add(new { displayName = "Select Day", value = 0 });
            if (Convert.ToInt32(ddlFromYear.SelectedValue) > 0 && Convert.ToInt32(ddlFromMonth.SelectedValue) > 0)
            {
                //getting numbner of days in selected month & year
                int noofdays = DateTime.DaysInMonth(Convert.ToInt32(ddlFromYear.SelectedValue), Convert.ToInt32(ddlFromMonth.SelectedValue));
                //Fill days         

                for (int i = 1; i <= noofdays; i++)
                    daysData.Add(new { displayName = i.ToString(), value = i });
            }
            ddl.DataSource = daysData;
            ddl.DataTextField = "displayName";
            ddl.DataValueField = "value";
            ddl.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        int scholarshipID = Convert.ToInt32(ViewState["scholarshipID"]);
        try
        {
            var existingScholarship = db.scholarships.Where(x => x.id == scholarshipID).FirstOrDefault();
            var mode = "new";
            scholarships objScholarship = new scholarships();
            if (existingScholarship != null)
            {
                mode = "update";
                objScholarship = existingScholarship;
            }

            objScholarship.name = txtScholarshipName.Value.Trim();
            objScholarship.description = txtScholarshipDescription.Value.Trim();
            objScholarship.award_amount = txtScholarshipAmount.Value.Trim();
            string deadLineDate = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + hidDeadLineDate.Value;
            objScholarship.application_deadline = Convert.ToDateTime(deadLineDate);
            if (rbtnUniversal.Checked)
                objScholarship.awarded_by = txtScholarshipAwardedBy.Value.Trim();
            else if (rbtnUniversity.Checked)
                objScholarship.awarded_by = "University - " + ddlUniversity.SelectedValue;
            objScholarship.eligibility = txtScholarshipEligibility.Value.Trim();
            if (applicationForm.HasFile)  //fileupload control contains a file  
            {
                docPath = docPath + "/Scholarship Forms/";
                if (!Directory.Exists(docPath))
                    Directory.CreateDirectory(docPath);
                string extension = Path.GetExtension(applicationForm.PostedFile.FileName);
                string filename = Guid.NewGuid().ToString() + extension;
                if (mode == "update")
                {
                    File.Delete(docPath + objScholarship.scholarship_form);
                    db.SaveChanges();
                }
                applicationForm.SaveAs(docPath + filename);
                objScholarship.scholarship_form = filename;
            }

            if (mode == "new")
                db.scholarships.Add(objScholarship);
            db.SaveChanges();

            if (mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully'); window.location='" + webURL + "admin/scholarshipmaster.aspx';", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully'); window.location='" + webURL + "admin/scholarshipmaster.aspx';", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error saving record. Please try again')", true);
            objLog.WriteLog(ex.StackTrace.ToString());
        }
    }
}