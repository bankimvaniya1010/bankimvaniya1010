using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_processpaymentrequest : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
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

                Session["applicantId"] = applicantID;
                Session["universityId"] = universityID;
                bindDataList(applicantID, universityID);
            }
            else
                Response.Redirect(webURL + "admin/default.aspx", true);
        }
    }

    private void bindDataList(int applicantID, int universityID)
    {
        try
        {
            var allPaymentDetailsList = db.payment_details.Where(x => x.applicant_id == applicantID && x.university_id == universityID).ToList();

            paymentRequestGridView.DataSource = allPaymentDetailsList;
            paymentRequestGridView.DataBind();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void sendEmailsNotificationForPaymentVerified(int applicantid, int universityid)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == applicantid).Select(x => x.email).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityid).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.universityid == universityid).Select(x => new { x.university_name, x.logo }).FirstOrDefault();

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/paymentverifiedNotification.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityid + "/" + universitydetails.logo);
            html = html.Replace("@applicantFirstname", details.firstname);
            html = html.Replace("@Loginurl", webURL + "login.aspx");
            objCom.SendMail(studentEmailAddress, html, "Notification for Payment Verified");
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    protected void paymentRequestGridView_RowDataBound(object sender, GridViewRowEventArgs e)
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

            string paymentStatusDescription = db.payment_status_master.Where(x => x.id == paymentStatus).Select(x => x.status_description).FirstOrDefault();
            if (paymentStatusDescription.ToUpper().Contains("PAYMENT UPLOADED"))
            {
                PropertyInfo pFileName = row.GetType().GetProperty("payment_proof_file_name");
                string fileName = pFileName.GetValue(row, null) as string;
                HyperLink hypLnkViewOffer = e.Row.FindControl("hypLnkViewPaymentProof") as HyperLink;
                hypLnkViewOffer.NavigateUrl = "\\Docs\\Payment Proof\\" + fileName;
                e.Row.FindControl("hypLnkViewPaymentProof").Visible = true;
            }

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
            var statusObj = db.payment_status_master.Select(x => new { x.id, x.status_description }).SortBy("id").ToList();
            ddlPaymentStatus.DataSource = statusObj;
            ddlPaymentStatus.DataTextField = "status_description";
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

    protected void paymentRequestGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int applicantID = (int)Session["applicantId"];
            int universityId = (int)Session["universityId"];
            int index = Convert.ToInt32(e.CommandArgument);
            int paymentDetailsId = Convert.ToInt32(paymentRequestGridView.DataKeys[index].Value);

            string Comamandname = e.CommandName;
            if (Comamandname.Equals("Edit"))
                Response.Redirect(webURL + "admin/applicantpaymentrequest.aspx?applicantId="+ applicantID + "&universityId=" + universityId + "&paymentId=" + paymentDetailsId, true);
            if (Comamandname.Equals("Save"))
            {
                GridViewRow row = paymentRequestGridView.Rows[index];
                DropDownList ddlPaymentStatus = row.FindControl("ddlPaymentStatus") as DropDownList;
                var paymentDetails = db.payment_details.Where(x => x.id == paymentDetailsId).FirstOrDefault();
                var applicationmaster = db.applicationmaster.Where(x => x.applicationmasterid == paymentDetails.applicationmaster_id).FirstOrDefault();
                var applicationStatus = db.application_status_master.AsNoTracking().Select(x => new { x.id, x.status_description });
                paymentDetails.payment_status = Convert.ToInt32(ddlPaymentStatus.SelectedItem.Value);
                if(ddlPaymentStatus.SelectedItem.Text.ToUpper().Contains("PAYMENT VERIFIED"))
                {
                    paymentDetails.payment_verified_date = DateTime.Now;
                    applicationmaster.current_status = applicationStatus.First(x => x.status_description.ToUpper().Contains("OFFER ACCEPTED, PAYMENT MADE")).id;
                }
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment details updated successfully.');window.location='" + webURL + "/admin/default.aspx';", true);
                if (ddlPaymentStatus.SelectedItem.Text.ToUpper().Contains("PAYMENT VERIFIED"))
                    sendEmailsNotificationForPaymentVerified(applicantID, universityId);
                else if (ddlPaymentStatus.SelectedItem.Text.ToUpper().Contains("PAYMENT REJECTED"))
                { }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong. Please try again.');", true);
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnApplicantPaymentRequest_Click(object sender, EventArgs e)
    {
        int applicantID = (int)Session["applicantId"];
        int universityId = (int)Session["universityId"];
        Response.Redirect(webURL + "admin/applicantpaymentrequest.aspx?applicantId=" + applicantID + "&universityId=" + universityId, true);
    }
}