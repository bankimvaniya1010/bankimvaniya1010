using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantpaymentrequest : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();

    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int applicantID;
    int universityID;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            if (Request.QueryString["applicantId"] != null && Request.QueryString["universityId"] != null)
            {
                
                if (!Int32.TryParse(Request.QueryString["applicantId"], out applicantID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                
                if (!Int32.TryParse(Request.QueryString["universityId"], out universityID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                int applicationmasterID = 0;
                if (!string.IsNullOrEmpty(Request.QueryString["applicationmasterID"]))
                    applicationmasterID = Convert.ToInt32(Request.QueryString["applicationmasterID"]);


                bindPaymentDescription(universityID);
                bindCurrency();
                bindAppliedCourseNames(applicantID, universityID, applicationmasterID);
                Session["applicantId"] = applicantID;
                Session["universityId"] = universityID;

                if (Request.QueryString["paymentId"] != null)
                {
                    int paymentDetailsId;
                    if (!Int32.TryParse(Request.QueryString["paymentId"], out paymentDetailsId))
                        Response.Redirect(webURL + "admin/default.aspx", true);

                    populateDetails(paymentDetailsId);
                }
            }
            else
                Response.Redirect(webURL + "admin/default.aspx", true);
        }
    }

    private void bindAppliedCourseNames(int applicantId, int universityId,int applicationmasterID)
    {
        try
        {
            ListItem lst = new ListItem("Please select Course", "0");
            List<int?> offer_accepted_status = db.application_status_master.Where(x => x.status_description.ToUpper().Contains("OFFER ACCEPTED") || x.status_description.ToUpper().Contains("CONFIRMATION OF ENROLMENT GENERATED")).Select(x => x.id ).Cast<int?>().ToList();
            dynamic applicationMasterCourse;
            if (applicationmasterID == 0)
                applicationMasterCourse = db.applicationmaster.Where(x => x.applicantid == applicantId && x.universityid == universityId && offer_accepted_status.Contains(x.current_status))
                                   .Join(db.coursemaster, applicationmaster => applicationmaster.course, coursemaster => coursemaster.courseid,
                                    (applicationmaster, coursemaster) => new { applicationmaster.applicationmasterid , coursemaster.coursename }).ToList();
            else
                applicationMasterCourse = db.applicationmaster.Where(x => x.applicantid == applicantId && x.universityid == universityId && offer_accepted_status.Contains(x.current_status) && x.applicationmasterid == applicationmasterID)
                                   .Join(db.coursemaster, applicationmaster => applicationmaster.course, coursemaster => coursemaster.courseid,
                                    (applicationmaster, coursemaster) => new { applicationmaster.applicationmasterid, coursemaster.coursename }).ToList();

            ddlStudentCourse.DataSource = applicationMasterCourse;
            ddlStudentCourse.DataTextField = "coursename";
            ddlStudentCourse.DataValueField = "applicationmasterid";
            ddlStudentCourse.DataBind();
            ddlStudentCourse.Items.Insert(0, lst);
            //ddlStudentCourse.SelectedIndex = 0;
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void populateDetails(int paymentDetailsId)
    {
        try
        {
            ec_payment_details existingPaymentDetail = db.ec_payment_details.Where(obj => obj.id == paymentDetailsId).FirstOrDefault();
            string paymentStatus = db.ec_status_master.Where(x => x.id == existingPaymentDetail.payment_status).Select(x => x.description).FirstOrDefault();
            if (paymentStatus.ToUpper().Contains("PAYMENT VERIFIED"))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment Status is verified, cannot edit this details'); window.location='" + webURL + "admin/processpaymentrequest.aspx?applicantId=" + existingPaymentDetail.applicant_id + "&universityId=" + existingPaymentDetail.university_id + "';", true);
            else if (existingPaymentDetail != null)
            {
                ViewState["paymentDetailId"] = paymentDetailsId;
                if (existingPaymentDetail.payment_for > 0)
                {
                    ddlPaymentDescription.ClearSelection();
                    ddlPaymentDescription.Items.FindByValue(existingPaymentDetail.payment_for.ToString()).Selected = true;
                }
                if (existingPaymentDetail.due_date != null)
                    hidPaymentDueDate.Value = Convert.ToDateTime(existingPaymentDetail.due_date).ToString("dd-MM-yyyy");
                if (existingPaymentDetail.amount > 0)
                    txtPaymentAmount.Text = existingPaymentDetail.amount.ToString();

                if (existingPaymentDetail.currency_id > 0)
                {
                    ddlCurrency.ClearSelection();                    
                    ddlCurrency.Items.FindByValue(existingPaymentDetail.currency_id.ToString()).Selected = true;
                }
                if (existingPaymentDetail.applicationmaster_id > 0)
                {
                    ddlStudentCourse.ClearSelection();                    
                    ddlStudentCourse.Items.FindByValue(existingPaymentDetail.applicationmaster_id.ToString()).Selected = true;
                }
                if (!String.IsNullOrEmpty(existingPaymentDetail.instruction))
                    txtPaymentInstruction.Text = existingPaymentDetail.instruction;
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment details does not exists'); window.location='" + webURL + "admin/default.aspx';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void bindCurrency()
    {
        try
        {
            ListItem lst = new ListItem("Please Select Currency", "0");
            var currencymaster = db.currency_master.Select(x => new { x.id, text = x.currency_symbol + "(" + x.currency_code + ")" }).SortBy("id").ToList();

            ddlCurrency.DataSource = currencymaster;
            ddlCurrency.DataTextField = "text";
            ddlCurrency.DataValueField = "id";
            ddlCurrency.DataBind();
            ddlCurrency.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void bindPaymentDescription(int universityID)
    {
        try
        {
            ListItem lst = new ListItem("Please Select Payment Decription", "0");
            var decriptionsObj = db.payment_description_master
                                   .Join(db.payment_description_mappings.Where(x => x.university_id == universityID), master => master.id, mapping => mapping.payment_description_id,
                                    (master, mapping) => new { master.id, master.payment_description }).ToList();
            ddlPaymentDescription.DataSource = decriptionsObj;
            ddlPaymentDescription.DataTextField = "payment_description";
            ddlPaymentDescription.DataValueField = "id";
            ddlPaymentDescription.DataBind();
            ddlPaymentDescription.Items.Insert(0, lst);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int applicantId = Convert.ToInt32(Session["applicantId"]);
            int universityId = Convert.ToInt32(Session["universityID"]);
            int paymentDetailsId;
            Int32.TryParse(Convert.ToString(ViewState["paymentDetailId"]), out paymentDetailsId);
            int paymentFor = Convert.ToInt32(ddlPaymentDescription.SelectedItem.Value);
            int applicationmasterId = Convert.ToInt32(ddlStudentCourse.SelectedItem.Value);
            string paymentForDescription = ddlPaymentDescription.SelectedItem.Text;
            var existingPayment = db.payment_details.Where(x => x.university_id == universityId && x.applicant_id == applicantId && x.id == paymentDetailsId).FirstOrDefault();
            var mode = "new";
            payment_details objPaymentDetail = new payment_details();
            if (existingPayment != null)
            {
                mode = "update";
                objPaymentDetail = existingPayment;
            }

            if (paymentForDescription.ToUpper().Contains("ACCEPTANCE FEE" ))
            {
                
                var acceptanceForApplicationPresent = db.payment_details.Any(x => x.applicant_id == applicantId && x.university_id == universityId && x.applicationmaster_id == applicationmasterId);
                if (acceptanceForApplicationPresent && mode != "update")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Acceptance Fee already added for this course.')", true);
                    return;
                }
                else
                {
                    objPaymentDetail.applicationmaster_id = applicationmasterId;
                    var applicationmaster = db.applicationmaster.Where(x => x.applicationmasterid == applicationmasterId && x.applicantid == applicantId && x.universityid == universityId).FirstOrDefault();
                    var applicationStatus = db.application_status_master.AsNoTracking().Select(x => new { x.id, x.status_description});
                    if (applicationmaster.current_status == applicationStatus.First(x => x.status_description.ToUpper().Contains("CONFIRMATION OF ENROLMENT GENERATED")).id)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Confirmation of enrollment already generated for this course.')", true);
                        return;
                    }
                    else
                        applicationmaster.current_status = applicationStatus.Where(x => x.status_description.ToUpper().Contains("OFFER ACCEPTED, PAYMENT PENDING")).Select(x => x.id).FirstOrDefault();
                }
            }

            objPaymentDetail.payment_for = paymentFor;
            objPaymentDetail.instruction = txtPaymentInstruction.Text;
            objPaymentDetail.amount = Convert.ToInt32(txtPaymentAmount.Text.Trim());
            objPaymentDetail.currency_id = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            objPaymentDetail.university_id = universityId;
            objPaymentDetail.applicant_id = applicantId;
            objPaymentDetail.applicationmaster_id = applicationmasterId;
            var dateArr = hidPaymentDueDate.Value.Trim().Split(Convert.ToChar("-"));
            objPaymentDetail.due_date = Convert.ToDateTime(string.Concat(dateArr[2], "-", dateArr[1], "-", dateArr[0]));

            if(mode == "new")
            {
                objPaymentDetail.request_date = DateTime.Now;
                objPaymentDetail.payment_status = 2; // Hard Coded for payment pending
                db.payment_details.Add(objPaymentDetail);
            }

            db.SaveChanges();

            if (mode == "new")
            {
                sendStudentEmail(applicantId, universityId);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record Inserted Successfully.');window.location='" + Request.ApplicationPath + "admin/processpaymentrequest.aspx?applicantId="+objPaymentDetail.applicant_id+"&universityId="+objPaymentDetail.university_id+"';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Record Updated Successfully');window.location='" + Request.ApplicationPath + "admin/processpaymentrequest.aspx?applicantId=" + objPaymentDetail.applicant_id + "&universityId=" + objPaymentDetail.university_id + "';", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void sendStudentEmail(int applicantId, int universityId)
    {
        try
        {
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityId && x.IsDeleted != 1).Select(x => new { x.university_name, x.logo }).FirstOrDefault();

            var studentEmailAddress = db.students.Where(x => x.studentid == applicantId).Select(x => x.email).FirstOrDefault();
            var name = db.applicantdetails.Where(x => x.applicantid == applicantId && x.universityid == universityId).Select(x => x.firstname).FirstOrDefault();
            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/paymentrequestuploadedNotification.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityId + "/" + universitydetails.logo);
            html = html.Replace("@applicantFirstname", name);
            html = html.Replace("@Loginurl", webURL + "login.aspx");
            objCommon.SendMail(studentEmailAddress, html, "Payment Request Uploaded Notification");            
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }
}