using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantchoicestatus : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.application_instruction).FirstOrDefault();
            bindDataList();
        }
    }

    private void bindDataList()
    {
        try
        {
            var allChoicesList = db.applicationmaster.Where(x => x.applicantid == UserID && x.universityid == UniversityID).SortBy("preferenceid").ToList();
            if (allChoicesList.Count == 0)
            {
                emptyChoicesDiv.Visible = true;
                emptyChoicesDiv.Style.Remove("display");
                choices.Visible = false;
                lblEmptyList.Text = "Student Application missing. Please check again after submitting application form";
            }
            else
            {
                var applicantChoicesList = new List<object>();
                foreach (var item in allChoicesList)
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
                        dateOfApplication = item.dateofapplication.Value.ToString("dd/MM/yyyy"),
                        dateOfDecision = item.dateofdecision.HasValue ? item.dateofdecision.Value.ToString("dd/MM/yyyy") : string.Empty,
                        decision = item.decision,
                        condition = !string.IsNullOrEmpty(item.condition_statement) ? item.condition_statement : string.Empty,
                        admissionRemarks = item.admission_remark,
                        item.course,
                        item.activity_ip,
                        item.activity_date,
                        item.deferment_date,
                        item.rejection_reason,
                        item.deferment_decision
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
        Label lblMsg = e.Item.FindControl("lblMsg") as Label;
        e.Item.FindControl("mangeOfferDiv").Visible = false; // initial value is set to false
        object row = e.Item.DataItem;
        PropertyInfo pCondition = row.GetType().GetProperty("condition");
        PropertyInfo pCurrentStatus = row.GetType().GetProperty("currentStatus");
        PropertyInfo pIpAddress = row.GetType().GetProperty("activity_ip");
        PropertyInfo pActivity_Date = row.GetType().GetProperty("activity_date");
        PropertyInfo pCourse = row.GetType().GetProperty("course");
        PropertyInfo pDecision = row.GetType().GetProperty("decision");

        string activityDate = pActivity_Date.GetValue(row, null) == null ? string.Empty : pActivity_Date.GetValue(row, null).ToString();
        string date = string.Empty;
        string hour = string.Empty;
        if (!string.IsNullOrEmpty(activityDate))
        {
            DateTime actionDate = Convert.ToDateTime(activityDate).ToUniversalTime(); // 9PM (GMT) ON 23AUG2019, Need to change date in GMT format
            hour = actionDate.Hour.ToString() + actionDate.ToString("tt");
            date = actionDate.Day + "/" + actionDate.Month + "/" + actionDate.Year;
        }

        int courseId = (int)pCourse.GetValue(row, null);
        int decision = pDecision.GetValue(row, null) == null ? -1 : Convert.ToInt32(pDecision.GetValue(row, null));
        string ipAddress = pIpAddress.GetValue(row, null) as string;
        string condition = pCondition.GetValue(row, null) as string; //CONDITION: (only show in case of conditional offer)
        string currentStatus = pCurrentStatus.GetValue(row, null) as string;
        if (string.IsNullOrEmpty(condition) && !currentStatus.Contains("CONDITIONAL OFFER"))
            e.Item.FindControl("conditionDiv").Visible = false;

        if (decision > 0)
        {
            Label universityDecision = e.Item.FindControl("universityDecision") as Label;
            universityDecision.Text = db.university_application_decision_master.Where(x => x.id == decision).Select(x => x.decision_description).FirstOrDefault();
        }
        if (currentStatus.ToUpper().Contains("OFFER RELEASED"))
        {
            e.Item.FindControl("mangeOfferDiv").Visible = true;

            DropDownList ddlDeferPeriod = e.Item.FindControl("deferPeriod") as DropDownList;
            ListItem lst = new ListItem("Please select", "0");
            var defermentDatesObj = db.course_defermentdates.Where(x => x.courseid == courseId).Select(x => new { x.id, defermentdate = x.defermentdate.ToString("dd/MM/yyyy") }).SortBy("defermentdate").ToList();
            ddlDeferPeriod.DataSource = defermentDatesObj;
            ddlDeferPeriod.DataTextField = "defermentdate";
            ddlDeferPeriod.DataValueField = "id";
            ddlDeferPeriod.DataBind();
            ddlDeferPeriod.Items.Insert(0, lst);

            DropDownList ddlRejectionReason = e.Item.FindControl("rejectionReason") as DropDownList;
            var rejectionReasons = db.universitywise_rejectionreasonmapping.Where(x => x.universityid == UniversityID)
                                     .Join(db.rejection_reasonmaster, mapping => mapping.reasonid, rejectReason => rejectReason.id,
                                     (mapping, rejectReason) => new { rejectReason.id, rejectReason.description }).ToList();
            ddlRejectionReason.DataSource = rejectionReasons;
            ddlRejectionReason.DataTextField = "description";
            ddlRejectionReason.DataValueField = "id";
            ddlRejectionReason.DataBind();
            ddlRejectionReason.Items.Insert(0, lst);
        }

        else if (currentStatus.Equals("OFFER ACCEPTED", StringComparison.OrdinalIgnoreCase))
        {
            var studentName = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.firstname).FirstOrDefault();
            lblMsg.Text = studentName + " your acceptance of the offer is successful. Offer accepted at " + hour + " on " + date + ", Using IP " + ipAddress;
        }

        else if (currentStatus.Equals("OFFER REJECTED", StringComparison.OrdinalIgnoreCase))
        {
            var studentName = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.firstname).FirstOrDefault();
            lblMsg.Text = studentName + " your offer rejection has been recorded. Rejection accepted at " + hour + " on " + date + ", Using IP " + ipAddress;
        }

        else if (currentStatus.Equals("OFFER DEFERRED", StringComparison.OrdinalIgnoreCase))
        {
            var studentName = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).Select(x => x.firstname).FirstOrDefault();
            lblMsg.Text = studentName + " your Deferment request has been accepted. Your Deferment request has been accepted at " + hour + " on " + date + ", Using IP " + ipAddress + ". Our admissions team would confirm the deferment shortly.";
        }
    }

    protected void choiceList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            int applicationId = Convert.ToInt32(commandArgs[0]);
            var application = db.applicationmaster.Where(x => x.applicationmasterid == applicationId).FirstOrDefault();
            int status_id = 0;
            if (e.CommandName == "Download")
            {
                var fileExtension = Path.GetExtension(application.offer_letter_file);
                Label lblUniversityCourse = e.Item.FindControl("lblUniversityCourse") as Label;
                string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                string filePath = string.Concat(dirPath + "\\" + "Offer Letters", "\\", application.offer_letter_file);

                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=OfferLetter_" + lblUniversityCourse.Text + fileExtension);
                Response.TransmitFile(filePath);
                Response.End();
            }
            else
            {
                if (e.CommandName == "Accept")
                    status_id = db.application_status_master.Where(x => x.status_description.ToUpper() == "OFFER ACCEPTED").Select(x => x.id).FirstOrDefault();
                else if (e.CommandName == "Defer")
                {
                    status_id = db.application_status_master.Where(x => x.status_description.ToUpper() == "OFFER DEFERRED").Select(x => x.id).FirstOrDefault();
                    application.deferment_date = Convert.ToDateTime(((DropDownList)e.Item.FindControl("deferPeriod")).SelectedItem.Text);
                }
                else if (e.CommandName == "Reject")
                {
                    status_id = db.application_status_master.Where(x => x.status_description.ToUpper() == "OFFER REJECTED").Select(x => x.id).FirstOrDefault();
                    application.rejection_reason = Convert.ToInt32(((DropDownList)e.Item.FindControl("rejectionReason")).SelectedValue);
                    string text = ((TextBox)e.Item.FindControl("rejectOtherReason")).Text;
                    if (!string.IsNullOrEmpty(text))
                        application.rejection_remark = ((TextBox)e.Item.FindControl("rejectOtherReason")).Text;
                }

                application.current_status = status_id;
                application.activity_ip = Request.UserHostAddress; // IP adderess value
                application.activity_date = DateTime.Now; // Activity Date Value
                db.SaveChanges();
                objLog.WriteLog("User IP Address: " + Request.UserHostAddress);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

        Response.Redirect(Request.Url.ToString(), true);
    }

    [WebMethod]
    [ScriptMethod]
    public static string GetTermsCondition(string option, int universityId)
    {
        GTEEntities db1 = new GTEEntities();
        var universityDetails = db1.university_master.Where(x => x.universityid == universityId).FirstOrDefault();
        if (option == "accept")
            return JsonConvert.SerializeObject(new { universityDetails.acceptance_terms });
        else if (option == "reject")
            return JsonConvert.SerializeObject(new { universityDetails.rejection_terms });
        else if (option == "defer")
            return JsonConvert.SerializeObject(new { universityDetails.deferment_terms });

        return JsonConvert.SerializeObject("");
    }

    //public string GetIPAddress()
    //{
    //    string IPAddress = String.Empty;
    //    IPHostEntry Host = default(IPHostEntry);
    //    string Hostname = Request.UserHostName;
    //    Host = Dns.GetHostEntry(Hostname);
    //    foreach (IPAddress IP in Host.AddressList)
    //    {
    //        if (IP.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
    //            return (Convert.ToString(IP));
    //    }
    //    return IPAddress;
    //}
}