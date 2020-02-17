using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantscholarships : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    public static int scholarshipCount = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    int UniversityID = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.scholarship_instruction).FirstOrDefault();

            var allScholarshipList = (from sm in db.scholarships.AsNoTracking()
                                      join usm in db.universitywise_scholarshipmapping on sm.id equals usm.scholarshipId
                                      where (sm.application_deadline > DateTime.Now && (sm.awarded_by.Contains("University - " + UniversityID) || !sm.awarded_by.Contains("University")))
                                      select sm).ToList();
                        
            var appliedScholarshipList = db.applicant_scholarships.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();

            // Remove applied scholarships
            foreach (var item in appliedScholarshipList)
                if (allScholarshipList.Any(x => x.id == item.scholarship_id))
                    allScholarshipList.RemoveAll(x => x.id == item.scholarship_id);

            if (allScholarshipList.Count == 0)
            {
                emptyScholarshipDiv.Visible = true;
                emptyScholarshipDiv.Style.Remove("display");
                scholarships.Visible = false;
                lblEmptyList.Text = "No scholarships are available at the moment for " + Session["universityName"] + ". Please check again later.";
            }
            else
                bindDataList(allScholarshipList);
        }
    }

    private void bindDataList(List<scholarships> allScholarshipList)
    {
        try
        {
            var universityName = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.university_name).FirstOrDefault();
            foreach (var item in allScholarshipList)
            {
                if (item.awarded_by.Contains("University"))
                    item.awarded_by = universityName;
            }
            scholarshipCount = allScholarshipList.Count;
            scholarshipList.DataSource = allScholarshipList;
            scholarshipList.DataBind();

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int scholarshipId = 0;
        try
        {
            docPath = docPath + "/Scholarship Application Forms/";
            foreach (DataListItem item in scholarshipList.Items)
            {
                Label lblScholarshipNo = (Label)item.FindControl("lblScholarshipId");
                scholarshipId = Convert.ToInt32(lblScholarshipNo.Text);

                bool scholarshipApplied = db.applicant_scholarships.Any(x => x.applicant_id == UserID && x.university_id == UniversityID && x.scholarship_id == scholarshipId);
                if (!scholarshipApplied)
                {
                    CheckBox checkBox = (CheckBox)item.FindControl("chkApply");
                    FileUpload applicationForm = (FileUpload)item.FindControl("completedApplicationForm");
                    if (checkBox.Checked)
                    {
                        string applicationName = string.Empty;
                        if (applicationForm.HasFile)  //fileupload control contains a file  
                        {
                            if (!Directory.Exists(docPath))
                                Directory.CreateDirectory(docPath);
                            string extension = Path.GetExtension(applicationForm.PostedFile.FileName);
                            string filename = Guid.NewGuid().ToString() + extension;
                            applicationForm.SaveAs(docPath + filename);
                            applicationName = filename;

                            applicant_scholarships scholarship = new applicant_scholarships()
                            {
                                applicant_id = UserID,
                                university_id = UniversityID,
                                scholarship_id = scholarshipId,
                                upload_form = applicationName,
                                approval_status = "Applied"
                            };

                            db.applicant_scholarships.Add(scholarship);
                            db.SaveChanges();
                        }
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void scholarshipList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            var scholarshipId = Convert.ToInt32(e.CommandArgument);
            var scholarshipDetails = db.scholarships.Where(x => x.id == scholarshipId).Select(x => new { x.scholarship_form, x.name }).FirstOrDefault();
            var fileExtension = Path.GetExtension(scholarshipDetails.scholarship_form);

            string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
            string filePath = string.Concat(dirPath + "\\" + "Scholarship Forms", "\\", scholarshipDetails.scholarship_form);

            //Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=ApplicationForm_" + scholarshipDetails.name + fileExtension);
            Response.TransmitFile(filePath);
            Response.End();
        }
    }
}