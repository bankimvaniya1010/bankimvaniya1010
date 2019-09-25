using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

public partial class applicantscholarshipstatus : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            BindGrid();
        }
    }

    private void BindGrid()
    {
        try
        {
            List<object> applicantScholarshipsObj = new List<object>();
            var scholarshipList = db.applicant_scholarships.AsNoTracking().Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
            foreach (var item in scholarshipList)
            {
                string awarded_by = string.Empty;
                string extension = Path.GetExtension(docPath + "\\Scholarship Application Forms\\" + item.upload_form);
                if (item.scholarships.awarded_by.Contains("University"))
                {
                    var universityId = Convert.ToInt32(Regex.Replace(item.scholarships.awarded_by, "[^0-9]+", string.Empty));
                    item.scholarships.awarded_by = db.university_master.Where(x => x.universityid == universityId).Select(x => x.university_name).FirstOrDefault();
                    awarded_by = item.scholarships.awarded_by.ToString();
                }
                else
                    awarded_by = item.scholarships.awarded_by.ToString();

                var scholarshipObj = new {
                    scholarship_form = "\\Docs\\Scholarship Application Forms\\" + item.upload_form,
                    item.scholarships.name,
                    award_amount = item.scholarships.award_amount.ToString(),
                    item.approval_status,
                    awarded_by,
                    image_icon = "/assets/images/pdf-icon.jpg"
                };
                applicantScholarshipsObj.Add(scholarshipObj);
            }
            if (applicantScholarshipsObj != null)
            {
                scholarshipGridView.DataSource = applicantScholarshipsObj.ToArray();
                scholarshipGridView.DataBind();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}