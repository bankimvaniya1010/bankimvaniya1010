using System;
using System.Collections.Generic;
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
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            if (Request.QueryString["applicantId"] != null && Request.QueryString["universityId"] != null)
            {
                int applicantID;
                if (!Int32.TryParse(Request.QueryString["applicantId"], out applicantID))
                    Response.Redirect("~/admin/default.aspx", true);

                int universityID;
                if (!Int32.TryParse(Request.QueryString["universityId"], out universityID))
                    Response.Redirect("~/admin/default.aspx", true);

                bindPaymentDescription(universityID);
                bindCurrency();
                Session["applicantId"] = applicantID;
                Session["universityId"] = universityID;

                if (Request.QueryString["paymentId"] != null)
                {
                    int paymentDetailsId;
                    if (!Int32.TryParse(Request.QueryString["paymentId"], out paymentDetailsId))
                        Response.Redirect("~/admin/default.aspx", true);

                    populateDetails(paymentDetailsId);
                }
            }
            else
                Response.Redirect("~/admin/default.aspx", true);
        }
    }

    private void populateDetails(int paymentDetailsId)
    {
        try
        {
            payment_details existingPaymentDetail = db.payment_details.Where(obj => obj.id == paymentDetailsId).FirstOrDefault();
            string paymentStatus = db.payment_status_master.Where(x => x.id == existingPaymentDetail.payment_status).Select(x => x.status_description).FirstOrDefault();
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
                    hidPaymentDueDate.Value = existingPaymentDetail.due_date.ToString("dd-MM-yyyy");
                if (existingPaymentDetail.amount > 0)
                    txtPaymentAmount.Text = existingPaymentDetail.amount.ToString();

                if (existingPaymentDetail.currency_id > 0)
                {
                    ddlCurrency.ClearSelection();
                    ddlCurrency.Items.FindByValue(existingPaymentDetail.currency_id.ToString()).Selected = true;
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
            ListItem lst = new ListItem("Please select Currency", "0");
            var currencymaster = db.currency_master.Select(x => new { x.id, text = x.currency_code + x.currency_symbol }).SortBy("id").ToList();

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
            ListItem lst = new ListItem("Please select Payment Decription", "0");
            var decriptionsObj = db.payment_description_master
                                   .Join(db.payment_description_mappings, master => master.id, mapping => mapping.payment_description_id,
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
            int paymentFor = Convert.ToInt32(ddlPaymentDescription.SelectedItem.Value);
            var existingPayment = db.payment_details.Where(x => x.university_id == universityId && x.applicant_id == applicantId).FirstOrDefault();
            var mode = "new";
            payment_details objPaymentDetail = new payment_details();
            if (existingPayment != null)
            {
                mode = "update";
                objPaymentDetail = existingPayment;
            }

            objPaymentDetail.payment_for = paymentFor;
            objPaymentDetail.instruction = txtPaymentInstruction.Text;
            objPaymentDetail.amount = Convert.ToInt32(txtPaymentAmount.Text.Trim());
            objPaymentDetail.currency_id = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            objPaymentDetail.university_id = universityId;
            objPaymentDetail.applicant_id = applicantId;

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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully');", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    private void sendStudentEmail(int applicantId, int universityId)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == applicantId).Select(x => x.email).FirstOrDefault();
            var name = db.applicantdetails.Where(x => x.applicantid == applicantId && x.universityid == universityId).Select(x => x.firstname).FirstOrDefault();
            StringBuilder sb = new StringBuilder();
            sb.Clear();
            sb.Append("Dear " + name + ",<br/><br/>");
            sb.Append("Payment Request has been uploaded.<br/>");
            sb.Append("<br/> Thank You <br/>");
            sb.Append("The Application Center Admin Team <br/>");
            objCommon.SendMail(studentEmailAddress, sb.ToString(), "Payment Request Uploaded Notification");
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }
}