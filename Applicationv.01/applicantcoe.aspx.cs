using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantcoe : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
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
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.coe_instruction).FirstOrDefault();
            bindDataList();
        }
    }

    private void bindDataList()
    {
        try
        {
            var coeStatus = db.application_status_master.Where(x => x.status_for == "university" && x.status_description.ToUpper() == "CONFIRMATION OF ENROLMENT GENERATED").Select(x => x.id).FirstOrDefault();
            var allCoeList = db.applicationmaster.Where(x => x.applicantid == UserID && x.universityid == UniversityID && x.current_status == coeStatus).SortBy("preferenceid").ToList();
            if (allCoeList.Count == 0)
            {
                emptyChoicesDiv.Visible = true;
                emptyChoicesDiv.Style.Remove("display");
                coeCard.Visible = false;
                lblEmptyList.Text = "No Confirmation of Enrolment has been generated for any of your course application(s). Come back again to check whether you have received a COE for any of your course choice(s).";
            }
            else
            {
                lblEmptyList.Text = "Congratulations! You have received Confirmation of Enrolment(s) for [No_of_COEs_issued]. Click on the relevant link below to view your COE(s).";
                var applicantChoicesList = new List<object>();
                foreach (var item in allCoeList)
                {
                    int universityId = Convert.ToInt32(item.college_universityname);
                    int commencementDate = Convert.ToInt32(item.commencementdate);
                    int currentStatus = Convert.ToInt32(item.current_status);
                    var choiceObj = new
                    {
                        id = item.applicationmasterid,
                        choice = item.preferenceid,
                        universityId,
                        universityName = db.university_master.Where(x => x.universityid == universityId).Select(x => x.university_name).FirstOrDefault(),
                        campusName = db.universitycampus.Where(x => x.campusid == item.campus).Select(x => x.campusname).FirstOrDefault(),
                        courseName = db.coursemaster.Where(x => x.courseid == item.course).Select(x => x.coursename).FirstOrDefault(),
                        commencementDate = db.course_dates.Where(x => x.id == commencementDate).Select(x => x.commencementdate).FirstOrDefault().ToString("dd/MM/yyyy"),
                        currentStatus = db.application_status_master.Where(x => x.id == currentStatus).Select(x => x.status_description).FirstOrDefault(),
                        payment_verificationdate = db.payment_details.Where(x => x.applicationmaster_id == item.applicationmasterid).Select(x => x.payment_verified_date.Value).FirstOrDefault().ToString("dd/MM/yyyy"),
                        dateOfApplication = item.dateofapplication.Value.ToString("dd/MM/yyyy"),
                        dateOfDecision = item.dateofdecision.HasValue ? item.dateofdecision.Value.ToString("dd/MM/yyyy") : string.Empty,
                        decision = item.decision,
                        condition = !string.IsNullOrEmpty(item.condition_statement) ? item.condition_statement : string.Empty,
                        admissionRemarks = item.admission_remark,
                        item.course,
                        activity_date = item.activity_date.HasValue ? item.activity_date.Value.ToString("dd/MM/yyyy") : string.Empty
                    };
                    applicantChoicesList.Add(choiceObj);
                }
                coeList.DataSource = applicantChoicesList;
                coeList.DataBind();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void coeList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        object row = e.Item.DataItem;
        PropertyInfo pCondition = row.GetType().GetProperty("condition");
        PropertyInfo pDecision = row.GetType().GetProperty("decision");

        string condition = pCondition.GetValue(row, null) as string; //CONDITION: (only show in case of conditional offer)
        if (string.IsNullOrEmpty(condition))
            e.Item.FindControl("conditionDiv").Visible = false;

        int decision = pDecision.GetValue(row, null) == null ? -1 : Convert.ToInt32(pDecision.GetValue(row, null));
        if (decision > 0)
        {
            Label universityDecision = e.Item.FindControl("universityDecision") as Label;
            universityDecision.Text = db.university_application_decision_master.Where(x => x.id == decision).Select(x => x.decision_description).FirstOrDefault();
        }
    }

    protected void coeList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            int applicationId = Convert.ToInt32(commandArgs[0]);
            var application = db.applicationmaster.Where(x => x.applicationmasterid == applicationId).FirstOrDefault();
            if (e.CommandName == "Download COE")
            {
                var fileExtension = Path.GetExtension(application.coe_letter_file);
                Label lblUniversityCourse = e.Item.FindControl("lblUniversityCourse") as Label;
                string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                string filePath = string.Concat(dirPath + "\\" + "Confirmation of Enrolments Letters", "\\", application.coe_letter_file);

                if (!application.coe_download_time.HasValue)
                {
                    application.coe_download_time = DateTime.Now;
                    db.SaveChanges();
                }

                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=CoeLetter_" + lblUniversityCourse.Text + fileExtension);
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}