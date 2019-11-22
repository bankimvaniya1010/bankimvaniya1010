using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_processstudentapplication : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            if (Request.QueryString["applicantId"] != null && Request.QueryString["universityId"] != null)
            {
                int applicantID;
                if (!Int32.TryParse(Request.QueryString["applicantId"], out applicantID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                int universityID;
                if (!Int32.TryParse(Request.QueryString["universityId"], out universityID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                bindDataList(applicantID, universityID);
            }
            else
                Response.Redirect(webURL + "admin/default.aspx", true);
        }
    }

    private void bindDataList(int applicantId, int universityId)
    {
        try
        {
            var allChoicesList = db.applicationmaster.Where(x => x.applicantid == applicantId && x.universityid == universityId).SortBy("preferenceid").ToList();
            if (allChoicesList.Count == 0)
            {
                emptyChoicesDiv.Visible = true;
                emptyChoicesDiv.Style.Remove("display");
                choices.Visible = false;
                lblEmptyList.Text = "Student has not filled application form. Please try again later";
            }
            else
            {
                var applicantChoicesList = new List<object>();
                foreach (var item in allChoicesList)
                {
                    int commencementDate = Convert.ToInt32(item.commencementdate);
                    int currentStatus = Convert.ToInt32(item.current_status);
                    var choiceObj = new
                    {
                        id = item.applicationmasterid,
                        choice = item.preferenceid,
                        campusName = db.universitycampus.Where(x => x.campusid == item.campus).Select(x => x.campusname).FirstOrDefault(),
                        courseName = db.coursemaster.Where(x => x.courseid == item.course).Select(x => x.coursename).FirstOrDefault(),
                        commencementDate = db.course_dates.Where(x => x.id == commencementDate).Select(x => x.commencementdate).FirstOrDefault().ToString("dd/MM/yyyy"),
                        currentStatus = db.application_status_master.Where(x => x.id == currentStatus).Select(x => x.status_description).FirstOrDefault(),
                        dateOfApplication = item.dateofapplication.Value.ToString("dd/MM/yyyy"),
                        dateOfDecision = item.dateofdecision,
                        decision = item.decision,
                        condition = !string.IsNullOrEmpty(item.condition_statement) ? item.condition_statement : string.Empty,
                        admissionRemarks = item.admission_remark,
                        deferment_date = item.deferment_date.HasValue ? item.deferment_date.Value.ToString("dd/MM/yyyy") : string.Empty,
                        item.course,
                        item.activity_ip,
                        item.activity_date,
                        item.rejection_reason,
                        item.deferment_remark,
                        item.deferment_decision,
                        item.offer_letter_file,
                        item.coe_letter_file
                    };
                    applicantChoicesList.Add(choiceObj);
                }
                choiceList.DataSource = applicantChoicesList;
                choiceList.DataBind();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void choiceList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        e.Item.FindControl("defermentDiv").Visible = false;
        e.Item.FindControl("hypLnkViewOffer").Visible = false;
        object row = e.Item.DataItem;
        PropertyInfo pCurrentStatus = row.GetType().GetProperty("currentStatus");
        PropertyInfo pDecision = row.GetType().GetProperty("decision");
        PropertyInfo pDecisionDate = row.GetType().GetProperty("dateOfDecision");

        e.Item.FindControl("decisionDateDiv").Visible = false;
        string decisionDate = pDecisionDate.GetValue(row, null) == null ? string.Empty : pDecisionDate.GetValue(row, null).ToString();
        if (!string.IsNullOrEmpty(decisionDate))
            e.Item.FindControl("decisionDateDiv").Visible = true;

        int decision = pDecision.GetValue(row, null) == null ? -1 : Convert.ToInt32(pDecision.GetValue(row, null));
        string currentStatus = pCurrentStatus.GetValue(row, null) as string;

        DropDownList ddlCurrentStatus = e.Item.FindControl("ddlCurrentStatus") as DropDownList;
        ListItem lst = new ListItem("Please select", "0");
        var statusObj = db.application_status_master.Where(x => x.status_for == "university").Select(x => new { x.id, x.status_description }).SortBy("id").ToList();
        ddlCurrentStatus.DataSource = statusObj;
        ddlCurrentStatus.DataTextField = "status_description";
        ddlCurrentStatus.DataValueField = "id";
        ddlCurrentStatus.DataBind();
        ddlCurrentStatus.Items.Insert(0, lst);

        Label lblCurrentStatus = e.Item.FindControl("lblCurrentStatus") as Label;
        lblCurrentStatus.Text = currentStatus;
        if (ddlCurrentStatus.Items.FindByText(currentStatus) != null)
        {
            ddlCurrentStatus.ClearSelection();
            ddlCurrentStatus.Items.FindByText(currentStatus).Selected = true;
        }

        DropDownList ddlDecision = e.Item.FindControl("ddlDecision") as DropDownList;
        var decisionObj = db.university_application_decision_master.Select(x => new { x.id, x.decision_description }).SortBy("id").ToList();
        ddlDecision.DataSource = decisionObj;
        ddlDecision.DataTextField = "decision_description";
        ddlDecision.DataValueField = "id";
        ddlDecision.DataBind();
        ddlDecision.Items.Insert(0, lst);

        if (decision > 0)
        {
            ddlDecision.ClearSelection();
            ddlDecision.Items.FindByValue(decision.ToString()).Selected = true;

            bool isApplicationAccepted = decisionObj.Where(x => x.id == decision).FirstOrDefault().decision_description.Contains("APPLICATION ACCEPTED");
            if (isApplicationAccepted)// If decision is application accepted
            {
                PropertyInfo pFileName = row.GetType().GetProperty("offer_letter_file");
                string fileName = pFileName.GetValue(row, null) as string;
                HyperLink hypLnkViewOffer = e.Item.FindControl("hypLnkViewOffer") as HyperLink;
                hypLnkViewOffer.NavigateUrl = "\\Docs\\Offer Letters\\" + fileName;

                e.Item.FindControl("hypLnkViewOffer").Visible = true;
            }
        }

        if (currentStatus.Equals("OFFER DEFERRED", StringComparison.OrdinalIgnoreCase))
        {
            PropertyInfo pDefermentRemark = row.GetType().GetProperty("deferment_remark");
            PropertyInfo pDefermentDecision = row.GetType().GetProperty("deferment_decision");

            string defermentDecision = pDefermentDecision.GetValue(row, null) as string;
            string defermentRemark = pDefermentRemark.GetValue(row, null) as string;
            e.Item.FindControl("defermentDiv").Visible = true;
            DropDownList ddlDefermentChoice = e.Item.FindControl("ddlDefermentChoice") as DropDownList;
            TextBox txtUniversityDefermentRemark = e.Item.FindControl("txtUniversityDefermentRemark") as TextBox;
            txtUniversityDefermentRemark.Text = defermentRemark;

            if (!string.IsNullOrEmpty(defermentDecision))
            {
                ddlDefermentChoice.ClearSelection();
                ddlDefermentChoice.Items.FindByText(defermentDecision).Selected = true;
            }
        }
    }

    // Send Mail when university uploads a decision
    private void sendEmailsNotificationForDecision(int applicantId, int universityId)
    {
        try
        {
            var details = db.applicantdetails.Where(x => x.applicantid == applicantId && x.universityid == universityId).FirstOrDefault();
            StringBuilder sb = new StringBuilder();
            sb.Clear();
            sb.Append("Dear " + details.firstname + ",<br/><br/>");
            sb.Append("Test Mail for Decision Upload<br/>");
            //sb.Append(question.clarification_question + "<br/>");
            sb.Append("<br/> Thank You <br/>");
            sb.Append("The Application Center Admin Team <br/>");
            objCom.SendMail(details.email, sb.ToString(), "Notification for decision updation");
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    protected void choiceList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            int applicationId = Convert.ToInt32(commandArgs[0]);
            var application = db.applicationmaster.Where(x => x.applicationmasterid == applicationId).FirstOrDefault();
            int row_decision = application.decision.HasValue ? application.decision.Value : -1;
            if (e.CommandName == "Submit")
            {
                DropDownList ddlDecision = e.Item.FindControl("ddlDecision") as DropDownList;
                string decision = ddlDecision.SelectedItem.Text;
                if (decision.ToUpper().Contains("CONDITIONAL"))
                {
                    TextBox conditionStatement = e.Item.FindControl("txtUniversityCondition") as TextBox;
                    application.condition_statement = conditionStatement.Text;
                }

                DropDownList ddlCurrentStatus = e.Item.FindControl("ddlCurrentStatus") as DropDownList;
                string currentStatus = ddlCurrentStatus.SelectedItem.Text;
                Label lblStatus = e.Item.FindControl("lblCurrentStatus") as Label;
                string status = lblStatus.Text;
                if (status.ToUpper().Contains("OFFER DEFERRED"))
                {
                    TextBox defermentRemark = e.Item.FindControl("txtUniversityDefermentRemark") as TextBox;
                    DropDownList ddlDefermentChoice = e.Item.FindControl("ddlDefermentChoice") as DropDownList;
                    application.deferment_decision = ddlDefermentChoice.SelectedValue;
                    application.deferment_remark = defermentRemark.Text;
                }

                if (decision.ToUpper().Contains("APPLICATION ACCEPTED"))
                {
                    // offer letter File Upload based on decision
                    FileUpload offerLetterFileUpload = e.Item.FindControl("offerLetterPdf") as FileUpload;
                    if (offerLetterFileUpload.HasFile)  //fileupload control contains a file  
                    {
                        docPath = docPath + "/Offer Letters" + "/";
                        if (!Directory.Exists(docPath))
                            Directory.CreateDirectory(docPath);
                        string extension = Path.GetExtension(offerLetterFileUpload.PostedFile.FileName);
                        string filename = Guid.NewGuid() + extension;
                        offerLetterFileUpload.SaveAs(docPath + filename);
                        application.offer_letter_file = filename;
                    }
                }

                if (currentStatus.ToUpper().Contains("CONFIRMATION OF ENROLMENT GENERATED"))
                {
                    // CoE letter File Upload based on current Status
                    FileUpload coeLetterFileUpload = e.Item.FindControl("coePdf") as FileUpload;
                    if (coeLetterFileUpload.HasFile)  //fileupload control contains a file  
                    {
                        docPath = docPath + "/Confirmation of Enrolments Letters" + "/";
                        if (!Directory.Exists(docPath))
                            Directory.CreateDirectory(docPath);
                        string extension = Path.GetExtension(coeLetterFileUpload.PostedFile.FileName);
                        string filename = Guid.NewGuid() + extension;
                        coeLetterFileUpload.SaveAs(docPath + filename);
                        application.coe_letter_file = filename;
                    }
                }

                // Bug in case of Offer defered, after how the application will be re intiated.
                if (ddlCurrentStatus.SelectedValue != null && !status.ToUpper().Contains("OFFER DEFERRED") && !status.ToUpper().Contains("OFFER REJECTED"))
                    application.current_status = Convert.ToInt32(ddlCurrentStatus.SelectedValue);

                TextBox txtUniveristyRemark = e.Item.FindControl("txtUniversityAdmissionRemark") as TextBox;
                string admissionRemark = txtUniveristyRemark.Text;
                if (!string.IsNullOrEmpty(admissionRemark))
                    application.admission_remark = admissionRemark;

                int selectedDecision = Convert.ToInt32(ddlDecision.SelectedItem.Value);
                if(selectedDecision != row_decision || !application.dateofdecision.HasValue)
                    application.dateofdecision = DateTime.Now;

                application.decision = Convert.ToInt32(ddlDecision.SelectedItem.Value);
                //application.dateofdecision = DateTime.Now;
                
                db.SaveChanges();

                if (selectedDecision != row_decision)
                    sendEmailsNotificationForDecision(application.applicantid, application.universityid);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

        Response.Redirect(Request.Url.ToString(), true);
    }
}