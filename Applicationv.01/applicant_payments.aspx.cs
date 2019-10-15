using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicant_payments : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
        {
            allfaqQuestion = objCom.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.fee_payment_instructions).FirstOrDefault();

            BindGrid();
        }
    }

    private void BindGrid()
    {
        try
        {
            List<object> paymentRequestsObj = new List<object>();
            var paymentRequestsList = db.payment_details.AsNoTracking().Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
            foreach (var item in paymentRequestsList)
            {
                string currencySymbol = db.currency_master.Where(x => x.id == item.currency_id).Select(x => x.currency_code + x.currency_symbol).FirstOrDefault();
                string paymentStatus = db.payment_status_master.Where(x => x.id == item.payment_status).Select(x => x.status_description).FirstOrDefault();
                if (paymentStatus.ToUpper().Contains("PAYMENT VERIFIED"))
                    paymentStatus = item.payment_verified_date.Value.ToString("dd-MM-yyyy");
                else if (paymentStatus.ToUpper().Contains("PAYMENT PENDING"))
                    paymentStatus = "PENDING";
                else if (paymentStatus.ToUpper().Contains("PAYMENT REJECTED"))
                    paymentStatus = "REJECTED";
                else if (paymentStatus.ToUpper().Contains("PAYMENT UPLOADED"))
                    paymentStatus = "PAYMENT PROOF UPLOADED, PENDING VERIFICATION";
                var paymentRequestObj = new
                {
                    id = item.id,
                    request_date = item.request_date.ToString("dd-MM-yyyy"),
                    payment_for = db.payment_description_master.Where(x => x.id == item.payment_for).Select(x => x.payment_description).FirstOrDefault(),
                    due_date = item.due_date.ToString("dd-MM-yyyy"),
                    amount = currencySymbol + " " + item.amount,
                    item.instruction,
                    fileName = "\\Docs\\Payment Proof\\" + item.payment_proof_file_name,
                    payment_status = paymentStatus
                };
                paymentRequestsObj.Add(paymentRequestObj);
            }
            if (paymentRequestsObj != null)
            {
                paymentsGridView.DataSource = paymentRequestsObj.ToArray();
                paymentsGridView.DataBind();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void paymentsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int paymentDetailsId = Convert.ToInt32(paymentsGridView.DataKeys[index].Value);

            string Comamandname = e.CommandName;
            if (Comamandname.Equals("Save"))
            {
                GridViewRow row = paymentsGridView.Rows[index];
                FileUpload fileUpload = row.FindControl("paymentProof") as FileUpload;
                int paymentStatus = db.payment_status_master.Where(x => x.status_description.ToUpper().Contains("PAYMENT UPLOADED")).Select(x => x.id).FirstOrDefault();
                var paymentDetails = db.payment_details.Where(x => x.id == paymentDetailsId).FirstOrDefault();
                if (fileUpload.HasFile)  //fileupload control contains a file  
                {
                    docPath = docPath + "//Payment Proof//";
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(fileUpload.PostedFile.FileName);
                    string filename = Guid.NewGuid() + extension;
                    fileUpload.SaveAs(docPath + filename);
                    paymentDetails.payment_proof_file_name = filename;
                }
                paymentDetails.payment_status = paymentStatus;

                db.SaveChanges();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}