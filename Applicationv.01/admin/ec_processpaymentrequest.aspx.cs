using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_processpaymentrequest : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    int classID, applicationmasterID;
    int universityID, adminId;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        adminId = Convert.ToInt32(Session["UserID"]);
        if (!IsPostBack)
        {
            if (Request.QueryString["applicantId"] != null && Request.QueryString["universityId"] != null)
            {
                int applicantID;
                if (!Int32.TryParse(Request.QueryString["applicantId"], out applicantID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                
                if (!Int32.TryParse(Request.QueryString["universityId"], out universityID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                
                if (!Int32.TryParse(Request.QueryString["classID"], out classID))
                    Response.Redirect(webURL + "admin/default.aspx", true);

                Session["applicantId"] = applicantID;
                Session["universityId"] = universityID;
                Session["classID"] = classID;
                bindDataList(applicantID, universityID, classID);
            }
            else
                Response.Redirect(webURL + "admin/default.aspx", true);
        }
    }

    private void bindDataList(int applicantID, int universityID, int classID)
    {
        try
        {
            var allPaymentDetailsList = db.ec_payment_details.Where(x => x.applicant_id == applicantID && x.university_id == universityID && x.class_id == classID).ToList();

            paymentRequestGridView.DataSource = allPaymentDetailsList;
            paymentRequestGridView.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void sendEmailsNotificationForPaymentVerified(int applicantid, int universityid,int classid)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == applicantid).Select(x => x.email).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityid).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityid).Select(x => new { x.university_name, x.logo }).FirstOrDefault();
            var classdetails = db.ec_class_master.Where(x => x.id == classid).FirstOrDefault();
            string currency = "0";
            if (classdetails != null && classdetails.fee_currency != null)
            {
                currency = db.currency_master.Where(x => x.id == classdetails.fee_currency).Select(x => x.currency_symbol).FirstOrDefault();
            }

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ec_classbooking.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + universitydetails.logo);
            html = html.Replace("@applicantFirstname", details.firstname);

            html = html.Replace("@class_code", classid.ToString());
            html = html.Replace("@class_name", classdetails.classname);
            html = html.Replace("@payment_currency", currency.ToString());
            html = html.Replace("@enrolment_fee", classdetails.enrollment_fee_amount);

            html = html.Replace("@Loginurl", webURL + "login.aspx");
            objCom.SendMail(studentEmailAddress, html, "successful Enroll For Class :"+classdetails.classname.ToUpper());

        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    protected void paymentRequestGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType != DataControlRowType.Header && e.Row.RowType != DataControlRowType.Footer && e.Row.RowType != DataControlRowType.EmptyDataRow)
            {
                object row = e.Row.DataItem;
                e.Row.FindControl("hypLnkViewPaymentProof").Visible = false;
                Label lblPaymentStatus = e.Row.FindControl("lblPaymentStatus") as Label;
                Label lblCurrency = e.Row.FindControl("lblCurrency") as Label;
                lblPaymentStatus.Visible = false;
                lblCurrency.Visible = false;
                PropertyInfo pPaymentStatus = row.GetType().GetProperty("payment_status");
                int paymentStatus = (int)pPaymentStatus.GetValue(row, null);

                string paymentStatusDescription = db.ec_status_master.Where(x => x.id == paymentStatus).Select(x => x.description).FirstOrDefault();
                if (paymentStatusDescription.ToLower().Contains("payment"))
                {
                    PropertyInfo pFileName = row.GetType().GetProperty("payment_proof_file_name");
                    string fileName = pFileName.GetValue(row, null) as string;
                    HyperLink hypLnkViewOffer = e.Row.FindControl("hypLnkViewPaymentProof") as HyperLink;
                    hypLnkViewOffer.NavigateUrl = "\\Docs\\Eclass_Service\\Application\\Payment Proof\\" + fileName;
                    e.Row.FindControl("hypLnkViewPaymentProof").Visible = true;
                }


                PropertyInfo classID = row.GetType().GetProperty("class_id");
                int class_id_ = (int)classID.GetValue(row, null);
                string classdetails = db.ec_class_master.Where(x => x.id == class_id_).Select(x => x.classname).FirstOrDefault();
                Label lblClass_name = e.Row.FindControl("lblclassname") as Label;
                lblClass_name.Text = classdetails;


                PropertyInfo pPaymentDetails = row.GetType().GetProperty("payment_for");
                int paymentFor = (int)pPaymentDetails.GetValue(row, null);
                string paymentDetails = db.payment_description_master.Where(x => x.id == paymentFor).Select(x => x.payment_description).FirstOrDefault();
                Label lblPaymentDetails = e.Row.FindControl("lblPaymentDetails") as Label;
                lblPaymentDetails.Text = paymentDetails;

                PropertyInfo pRequestDate = row.GetType().GetProperty("request_date");
                string requestDate = pRequestDate.GetValue(row, null) == null ? string.Empty : pRequestDate.GetValue(row, null).ToString();
                Label lblRequestDate = e.Row.FindControl("lblRequestDate") as Label;
                lblRequestDate.Text = Convert.ToDateTime(requestDate).ToString("dd-MM-yyyy");

                PropertyInfo pDueDate = row.GetType().GetProperty("due_date");
                string dueDate = pDueDate.GetValue(row, null) == null ? string.Empty : pDueDate.GetValue(row, null).ToString();
                Label lblDueDate = e.Row.FindControl("lblDueDate") as Label;
                lblDueDate.Text = Convert.ToDateTime(dueDate).ToString("dd-MM-yyyy");

                DropDownList ddlPaymentStatus = e.Row.FindControl("ddlPaymentStatus") as DropDownList;
                ListItem lst = new ListItem("Please select", "0");
                var statusObj = db.ec_status_master.Where(x => x.description.ToUpper().Contains("PAYMENT")).Select(x => new { x.id, x.description }).SortBy("id").ToList();
                ddlPaymentStatus.DataSource = statusObj;
                ddlPaymentStatus.DataTextField = "description";
                ddlPaymentStatus.DataValueField = "id";
                ddlPaymentStatus.DataBind();
                ddlPaymentStatus.Items.Insert(0, lst);

                if (paymentStatus > 0)
                {
                    ddlPaymentStatus.ClearSelection();
                    ddlPaymentStatus.Items.FindByValue(paymentStatus.ToString()).Selected = true;
                    string ddlSelectedPayment_status = ddlPaymentStatus.SelectedItem.Text.ToUpper();
                    if (ddlSelectedPayment_status.Contains("PAYMENT VERIFIED") || ddlSelectedPayment_status.Contains("PAYMENT REJECTED"))
                    {
                        e.Row.FindControl("lnkSave").Visible = false;
                        e.Row.FindControl("lnkEdit").Visible = false;
                    }
                }

                PropertyInfo pCurrencyId = row.GetType().GetProperty("currency_id");
                int currencyId = (int)pCurrencyId.GetValue(row, null);
                string curencySymbol = db.currency_master.Where(x => x.id == currencyId).Select(x => x.currency_symbol).FirstOrDefault();
                Label lblAmount = e.Row.FindControl("lblAmount") as Label;
                lblAmount.Text = curencySymbol + " " + lblAmount.Text;
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void paymentRequestGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int applicantID = (int)Session["applicantId"];
            int universityId = (int)Session["universityId"];
            int classid = (int)Session["classID"];

            int index = Convert.ToInt32(e.CommandArgument);
            int paymentDetailsId = Convert.ToInt32(paymentRequestGridView.DataKeys[index].Value);
            
            string Comamandname = e.CommandName;
            if (Comamandname.Equals("Edit"))
                Response.Redirect(webURL + "admin/ec_applicantpaymentrequest.aspx?applicantId=" + applicantID + "&classID="+classid+ "&universityId=" + universityId + "&paymentId=" + paymentDetailsId, true);
            if (Comamandname.Equals("Save"))
            {
                var applied_class_data = db.ec_class_applicationmaster.Where(x => x.universityid == universityID && x.classid == classid && x.status == 7).ToList();
                var classavailability = db.ec_class_master.Where(x => x.id == classid).Select(x => x.availability).FirstOrDefault();

                //if (classavailability >= applied_class_data.Count + 1)//+ 1 for condition for current count of applicnat
                //{

                GridViewRow row = paymentRequestGridView.Rows[index];
                DropDownList ddlPaymentStatus = row.FindControl("ddlPaymentStatus") as DropDownList;
                var paymentDetails = db.ec_payment_details.Where(x => x.id == paymentDetailsId).FirstOrDefault();
                var applicationmaster = db.ec_class_applicationmaster.Where(x => x.id == paymentDetails.applicationmaster_id).FirstOrDefault();
                var applicationStatus = db.ec_status_master.AsNoTracking().Select(x => new { x.id, x.description });
                paymentDetails.payment_status = Convert.ToInt32(ddlPaymentStatus.SelectedItem.Value);
                if (ddlPaymentStatus.SelectedItem.Text.ToUpper().Contains("PAYMENT VERIFIED"))
                {

                    if (classavailability >= applied_class_data.Count + 1)//+ 1 for condition for current count of applicnat
                    {
                        paymentDetails.payment_verified_date = DateTime.UtcNow;
                        //applicationmaster.booking_datetime = DateTime.UtcNow;
                        applicationmaster.status = 7;//save as enrolled if verified 
                        create_Record_In_Assign_Assignment(applicantID, classid); //create mapping in assign_assignment table
                    }
                    else {
                        applicationmaster.status = 9;//Payment Rejected from ec_statusmaster
                        SendCancel_bookingClassEmail(classid,applicantID);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class availability is full.')", true);
                    }
                }
                else
                    applicationmaster.status = applicationStatus.First(x => x.description.ToUpper().Contains(ddlPaymentStatus.SelectedItem.Text.ToUpper())).id;

                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                    "alert('Payment details updated successfully.');window.location='" + Request.ApplicationPath + "admin/ec_processpaymentrequest.aspx?applicantId=" + applicantID + "&classID=" + classid + "&universityId=" + universityId + "';", true);
                if (ddlPaymentStatus.SelectedItem.Text.ToUpper().Contains("PAYMENT VERIFIED"))
                {
                    sendEmailsNotificationForPaymentVerified(applicantID, universityId, classid);
                }
                else if (ddlPaymentStatus.SelectedItem.Text.ToUpper().Contains("PAYMENT REJECTED"))
                { }
                //}
                //else
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class availability is full.')", true);
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong. Please try again.');", true);
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SendCancel_bookingClassEmail(int classid,int UserID)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == UserID).Select(x => x.email).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo }).FirstOrDefault();
            var classdetails = db.ec_class_master.Where(x => x.id == classid).FirstOrDefault();
            string currency = "0";
            if (classdetails != null && classdetails.fee_currency != null)
            {
                currency = db.currency_master.Where(x => x.id == classdetails.fee_currency).Select(x => x.currency_symbol).FirstOrDefault();
            }

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ec_classbooking_cancellation.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + universitydetails.logo);
            html = html.Replace("@applicantFirstname", details.firstname);

            html = html.Replace("@class_code", classid.ToString());
            html = html.Replace("@class_name", classdetails.classname);
            html = html.Replace("@payment_currency", currency.ToString());
            html = html.Replace("@enrolment_fee", classdetails.enrollment_fee_amount);

            html = html.Replace("@Loginurl", webURL + "login.aspx");
            objCom.SendMail(studentEmailAddress, html, "Successful Booking For Class : " + classdetails.classname.ToUpper());
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }
    private void create_Record_In_Assign_Assignment(int applicantid, int classid)
    {
        try
        {

            /// assignment assign tbl madhe reord 
            var assignment_schedule_Record = db.ec_assignments_assignschedule_master.Where(x => x.asm_universityid == universityID && x.asm_class_id == classid).FirstOrDefault();
            if (assignment_schedule_Record != null)
            {
                int assignscheduleID = assignment_schedule_Record.asm_id;

                var assignment_schedule_date_Record = db.ec_assignments_assignschedule_date_master.Where(x => x.assignschedule_id == assignscheduleID).ToList();
                foreach (var date in assignment_schedule_date_Record)
                {
                    ec_assignments_assign objmapping = new ec_assignments_assign();

                    var data = db.ec_assignments_assign.Where(x => x.universityid == universityID && x.applicantId == applicantid && x.assignmentId == date.assignment_id && x.assignment_date_id == date.asmd_id).FirstOrDefault();
                    if (data == null)
                    {
                        objmapping.universityid = universityID;
                        objmapping.assignschedule_Id = date.assignschedule_id;
                        objmapping.assignmentId = date.assignment_id;
                        objmapping.applicantId = applicantid;
                        objmapping.status = 1;
                        objmapping.adminId = adminId;
                        objmapping.assignment_date_id = date.asmd_id;
                        db.ec_assignments_assign.Add(objmapping);
                        db.SaveChanges();
                    }
                }
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void btnApplicantPaymentRequest_Click(object sender, EventArgs e)
    {
        int applicantID = (int)Session["applicantId"];
        int universityId = (int)Session["universityId"]; 
        int classid = (int)Session["classID"];
        Response.Redirect(webURL + "admin/ec_applicantpaymentrequest.aspx?applicantId=" + applicantID + "&universityId=" + universityId+ "&classID=" + classid, true);
    }
}