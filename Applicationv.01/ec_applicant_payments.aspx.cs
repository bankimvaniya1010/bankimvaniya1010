using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_applicant_payments : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;
    int UniversityID = -1;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        if (!IsPostBack)
        {
            allfaqQuestion = objCom.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => x.fee_payment_instructions).FirstOrDefault();

            BindGrid();
        }
    }

    private void BindGrid()
    {
        try
        {
            List<object> paymentRequestsObj = new List<object>();
            var paymentRequestsList = db.ec_payment_details.AsNoTracking().Where(x => x.applicant_id == UserID && x.university_id == UniversityID).ToList();
            foreach (var item in paymentRequestsList)
            {
                string currencySymbol = db.currency_master.Where(x => x.id == item.currency_id).Select(x => x.currency_symbol).FirstOrDefault();
                string paymentStatus = db.ec_status_master.Where(x => x.id == item.payment_status).Select(x => x.description).FirstOrDefault();
                string courseName = db.ec_class_applicationmaster.Where(x => x.id == item.applicationmaster_id)
                                   .Join(db.ec_class_master, applicationmaster => applicationmaster.classid, coursemaster => coursemaster.id,
                                    (applicationmaster, coursemaster) => new { coursemaster.classname }).Select(x => x.classname).FirstOrDefault();
                string instruction_ = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.fee_payment_details).FirstOrDefault();

                if (paymentStatus.ToUpper().Contains("PAYMENT VERIFIED"))
                    paymentStatus = item.payment_verified_date.Value.ToString("dd-MM-yyyy");
                else if (paymentStatus.ToUpper().Contains("PAYMENT PENDING"))
                    paymentStatus = "PENDING";
                else if (paymentStatus.ToUpper().Contains("PAYMENT REJECTED"))
                    paymentStatus = "REJECTED";
                else if (paymentStatus.ToUpper().Contains("PAYMENT UPLOADED"))
                    paymentStatus = "PAYMENT AWAITING VERIFICATION";
                var paymentRequestObj = new
                {
                    id = item.id,
                    request_date = Convert.ToDateTime(item.request_date).ToString("dd-MM-yyyy"),
                    payment_for = db.payment_description_master.Where(x => x.id == item.payment_for).Select(x => x.payment_description).FirstOrDefault(),
                    due_date = Convert.ToDateTime(item.due_date).ToString("dd-MM-yyyy"),
                    
                    amount = currencySymbol + " " + item.amount,
                    instruction = instruction_,
                    fileName = "\\Docs\\Eclass_Service\\Application\\Payment Proof\\" + item.payment_proof_file_name,
                    courseName = courseName,
                    payment_status = paymentStatus,
                    classid = item.class_id,
                    paymentstatus_ID = item.payment_status
                };
                //string currentdate = Convert.ToDateTime(DateTime.UtcNow).ToString("dd-MM-yyyy");
                //DateTime date1 = Convert.ToDateTime(currentdate);
                //DateTime date2 = Convert.ToDateTime(paymentRequestObj.due_date);

                //if (date2 < date1)
                //{
                //    if (item.payment_status == 10)
                //        marked_as_expired(item.id,item.class_id);
                //    else if (item.payment_status == 11 || item.payment_status == 13)
                //    {
                //        marked_as_expired(item.id, item.class_id);
                //        //send email as eclass seat is full
                //        SendEmailtoApplicat(item.class_id);
                //    }
                //}
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
    private void SendEmailtoApplicat(int? classid)
    {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == UserID).Select(x => x.email).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, x.logo }).FirstOrDefault();
            var classdetails = db.ec_class_master.Where(x => x.id == classid).FirstOrDefault();
            string currency = "0";
            if (classdetails != null && classdetails.fee_currency != null)
            {
                currency = db.currency_master.Where(x => x.id == classdetails.fee_currency).Select(x => x.currency_symbol).FirstOrDefault();
            }

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ec_classbooking.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + UniversityID + "/" + universitydetails.logo);
            html = html.Replace("@applicantFirstname", details.firstname);

            html = html.Replace("@class_code", classid.ToString());
            html = html.Replace("@class_name", classdetails.classname);
            html = html.Replace("@payment_currency", currency.ToString());
            html = html.Replace("@enrolment_fee", classdetails.enrollment_fee_amount);

            html = html.Replace("@Loginurl", webURL + "login.aspx");
            objCom.SendMail(studentEmailAddress, html, "Notification booking Rejected for"+classdetails.classname);
        }
        catch (Exception e) { objLog.WriteLog(e.ToString()); }
    }

    private void marked_as_expired(int? recordID, int? classid) {
        try {
            
            ec_payment_details obj_ec_payment_details = new ec_payment_details();
            var data2 = db.ec_payment_details.Where(x => x.id == recordID).FirstOrDefault();
            if (data2 != null)
                obj_ec_payment_details = data2;
            obj_ec_payment_details.payment_status = 9;//expired
            db.SaveChanges();


            ec_class_applicationmaster obj = new ec_class_applicationmaster();
            var data = db.ec_class_applicationmaster.Where(x => x.universityid == UniversityID && x.applicantid== UserID && x.classid== classid).FirstOrDefault();
            if (data != null)
                obj = data;
            obj.status = 9;//expired
            db.SaveChanges();

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
                
                var paymentDetails = db.ec_payment_details.Where(x => x.id == paymentDetailsId).FirstOrDefault();
                /// check for class availability 
                if (paymentDetails.class_id != null)
                {
                    var applied_class_data = db.ec_class_applicationmaster.Where(x => x.universityid == UniversityID && x.classid == paymentDetails.class_id && x.status == 7).ToList();
                    var classavailability = db.ec_class_master.Where(x => x.id == paymentDetails.class_id).Select(x => x.availability).FirstOrDefault();

                    //assign table
                    int? applicationmasterID = paymentDetails.applicationmaster_id;
                    var mode = "new";
                    ec_class_applicationmaster obj = new ec_class_applicationmaster();
                    var data = db.ec_class_applicationmaster.Where(x => x.id == applicationmasterID).FirstOrDefault();
                    if (data != null)
                    {
                        mode = "update";
                        obj = data;
                    }

                    if (classavailability >= applied_class_data.Count+1)
                    {
                        //int paymentStatus = db.payment_status_master.Where(x => x.status_description.ToUpper().Contains("PAYMENT UPLOADED")).Select(x => x.id).FirstOrDefault();

                        if (fileUpload.HasFile)  //fileupload control contains a file  
                        {
                            docPath = docPath + "/Eclass_Service/Application/Payment Proof/";
                            if (!Directory.Exists(docPath))
                                Directory.CreateDirectory(docPath);
                            string extension = Path.GetExtension(fileUpload.PostedFile.FileName);
                            string filename = Guid.NewGuid() + extension;
                            fileUpload.SaveAs(docPath + filename);
                            paymentDetails.payment_proof_file_name = filename;
                        }
                        paymentDetails.payment_status = 11;//Payment Awaiting Verification from ec_statusmaster
                        db.SaveChanges();
                        
                        obj.status = 11;
                        //if (mode == "new")
                        //    db.ec_class_applicationmaster.Add(obj);
                        db.SaveChanges();
                        BindGrid();
                    }
                    else
                    {
                        paymentDetails.payment_status = 9;//Payment Rejected from ec_statusmaster
                        obj.status = 9;
                        db.SaveChanges();
                        //send email
                        SendCancel_bookingClassEmail(Convert.ToInt32(paymentDetails.class_id));
                        BindGrid();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class booking is full.Please check for another class.')", true);
                    }
                    
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong...')", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void SendCancel_bookingClassEmail(int classid) {
        try
        {
            var studentEmailAddress = db.students.Where(x => x.studentid == UserID).Select(x => x.email).FirstOrDefault();
            var details = db.applicantdetails.Where(x => x.applicantid == UserID && x.universityid == UniversityID).FirstOrDefault();
            var universitydetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == UniversityID).Select(x => new { x.university_name, x.logo }).FirstOrDefault();
            var classdetails = db.ec_class_master.Where(x => x.id == classid).FirstOrDefault();
            string currency = "0";
            if (classdetails != null && classdetails.fee_currency != null)
            {
                currency = db.currency_master.Where(x => x.id == classdetails.fee_currency).Select(x => x.currency_symbol).FirstOrDefault();
            }

            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/ec_classbooking_cancellation.html"));
            html = html.Replace("@UniversityName", universitydetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + UniversityID + "/" + universitydetails.logo);
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

    protected void paymentsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            object row = e.Row.DataItem;
            PropertyInfo pPaymentStatus = row.GetType().GetProperty("payment_status");
            string paymentStatus = pPaymentStatus.GetValue(row, null) == null ? string.Empty : pPaymentStatus.GetValue(row, null).ToString();

            Regex rgx = new Regex(@"\d{2}-\d{2}-\d{4}"); // dependent on date format of payment verified status
            if (rgx.Match(paymentStatus).Success)
                e.Row.FindControl("lnkSave").Visible = false;

            PropertyInfo pFileName = row.GetType().GetProperty("fileName");
            PropertyInfo id = row.GetType().GetProperty("id");
            string id_ = id.GetValue(row, null) == null ? string.Empty : id.GetValue(row, null).ToString();

            string fileName = pFileName.GetValue(row, null).ToString();
            
            fileName = fileName.Replace("\\Docs\\Eclass_Service\\Application\\Payment Proof\\", string.Empty);
            if (string.IsNullOrEmpty(fileName))
                e.Row.FindControl("hypLnkProof").Visible = false;
            else
            {
                e.Row.FindControl("paymentProof").Visible = false;
                e.Row.FindControl("lnkSave").Visible = false;
            }
            // depending on status show upload btn & file upload \\ only payemnet pending status show btn
            PropertyInfo paymentstatus_ID = row.GetType().GetProperty("paymentstatus_ID");
            string paymentstatusID = paymentstatus_ID.GetValue(row, null) == null ? string.Empty : paymentstatus_ID.GetValue(row, null).ToString();
            if (paymentstatusID != "10")
            {
                e.Row.FindControl("paymentProof").Visible = false;
                e.Row.FindControl("lnkSave").Visible = false;
            }
            
        }
    }

}