using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_manage_class_booking : System.Web.UI.Page
{
    int roleID = 0, universityID = 0;
    string universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string roleName = string.Empty;
    public List<Details> applicant = new List<Details>();
    string webURL = String.Empty;
    private string constr, query;
    public int fullservice;
    public string lbltotal = "0", lblavailable = "0";
    List<exam_subjectmaster> appliedsubjectlist = new List<exam_subjectmaster>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();
        fullservice = Convert.ToInt32(Session["isfullservice"]);
        roleID = Convert.ToInt32(Session["Role"]);
        Bindlabel(universityID);
        //BindApplicant();
        if (!IsPostBack)
        {
            if (ddlapplicant.SelectedValue != null && ddlapplicant.SelectedValue != "0" && ddlapplicant.SelectedValue != "")
            {
                int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
                BindApplicant(string.Empty, applicantid, 0, "0");
            }
            if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0" && ddlcountry.SelectedValue != "")
            {
                int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
                BindApplicant(string.Empty, 0, countryid, "0");
            }
            if (ddlfirstname.SelectedValue != null && ddlfirstname.SelectedValue != "0" && ddlfirstname.SelectedValue != "")
            {
                string firestname = ddlfirstname.SelectedValue;
                BindApplicant(string.Empty, 0, 0, firestname);
            }
            else
                BindApplicant();
            Bindlabel(universityID);
        }
    }
    private void Bindlabel(int universityID)
    {
        try
        {
            var studentcount_byuniveristy = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => x.numberof_applicant).FirstOrDefault();
            lbltotal = studentcount_byuniveristy.ToString();

            int registeredapplicantcCount = (from ad in db.applicantdetails
                                             join sd in db.students on ad.applicantid equals sd.studentid
                                             where ad.universityid == universityID && ad.isdeletedbyAdmin == false
                                             select ad.applicantid).ToList().Count;

            var value1 = Convert.ToInt32(studentcount_byuniveristy);
            var availableApplicant_Count = value1 - registeredapplicantcCount;

            lblavailable = availableApplicant_Count.ToString();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindApplicant(string type = "NOdownload", int applicant_id = 0, int countryid = 0, string firstname = "0")
    {
        try
        {
            applicant = (from cm in db.ec_class_applicationmaster

                         join x in db.applicantdetails on cm.applicantid equals x.applicantid into appData
                         from s in appData.DefaultIfEmpty()

                         join u in db.university_master on cm.universityid equals u.universityid
                         join sm in db.ec_status_master on cm.status equals sm.id

                         join clsmst in db.ec_class_master on cm.classid equals clsmst.id

                         join gm in db.ec_grademaster on clsmst.gradeid equals gm.id
                         join subm in db.subjectmaster on clsmst.subjectid equals subm.id
                         join modem in db.ec_mode_master on clsmst.modeid equals modem.mode_id
                         join typem in db.ec_type_master on clsmst.type equals typem.type_id

                         where cm.universityid == universityID && u.universityid == universityID && s.universityid == universityID && s.isdeletedbyAdmin == false && u.IsDeleted != 1
                         select new Details()
                         {
                             id = cm.id,
                             applicantid = cm.applicantid,
                             universityId = cm.universityid,
                             classcode = cm.classid,
                             classcode_link = webURL+ "admin/ec_processpaymentrequest.aspx?applicantId=" + cm.applicantid+"&universityId="+cm.universityid+ "&classID="+cm.classid,
                             grade = gm.description,
                             subject = subm.description,
                             mode = modem.mode_description,
                             type = typem.type_description,
                             booking_datetime = cm.booking_datetime,
                             university_name = u.university_name,
                             firstname = s.firstname == null ? string.Empty : s.firstname,
                             lastname = s.lastname == null ? string.Empty : s.lastname,
                             fullname = s.firstname + " " + s.middlename + " " + s.lastname,
                             email = s.email == null ? s.email : s.email,
                             //s registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                             mobile = s.mobileno == null ? string.Empty : s.mobileno,
                             countryofresidence = string.Empty,
                             countryid = s.residentialcountry == null ? null : s.residentialcountry,
                             Status = sm.description,
                             isverifiedbyAdmin = s.isverifiedbyAdmin,
                             approve = s.isverifiedbyAdmin == true ? "Approved" : "Pending",
                             suspend = s.isdeletedbyAdmin == true ? "Deleted" : string.Empty,
                             Isreportcompleted = s.Is_clarification_submitted,
                             locationId = clsmst.location == null ?0: clsmst.location,

                         }).Distinct().OrderByDescending(x => x.id).ToList();
            foreach (var item in applicant) {
                if (item.locationId != 0)
                {
                    item.location = db.universitycampus.Where(x => x.campusid == item.locationId).Select(x => x.campusname).FirstOrDefault();
                }
            }

            UserGridView.DataSource = applicant;
            UserGridView.DataBind();


        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    void RemoveDuplicateItems(DropDownList ddl)
    {
        for (int i = 0; i < ddl.Items.Count; i++)
        {
            ddl.SelectedIndex = i;
            string str = ddl.SelectedItem.ToString();
            for (int counter = i + 1; counter < ddl.Items.Count; counter++)
            {
                ddl.SelectedIndex = counter;
                string compareStr = ddl.SelectedItem.ToString();
                if (str == compareStr)
                {
                    ddl.Items.RemoveAt(counter);
                    counter = counter - 1;
                }
            }
        }

        ddl.ClearSelection();
    }

    protected DataTable BindDatatable()
    {

        if (ddlapplicant.SelectedValue != null && ddlapplicant.SelectedValue != "0" && ddlapplicant.SelectedValue != "")
        {
            int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
            BindApplicant("download", applicantid, 0, "0");
        }
        if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0" && ddlcountry.SelectedValue != "")
        {
            int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            BindApplicant("download", 0, countryid, "0");
        }
        if (ddlfirstname.SelectedValue != null && ddlfirstname.SelectedValue != string.Empty && ddlfirstname.SelectedValue != "0")
        {
            string firestname = ddlfirstname.SelectedValue;
            BindApplicant("download", 0, 0, firestname);
        }
        else
            BindApplicant("download");
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Applicant Id", typeof(Int32));
        dt.Columns.Add("Institution", typeof(string));
        dt.Columns.Add("First Name", typeof(string));
        dt.Columns.Add("Family Name", typeof(string));
        dt.Columns.Add("Email", typeof(string));

        if (fullservice == 2)
        {
            dt.Columns.Add("Class", typeof(string));
            dt.Columns.Add("Group", typeof(string));
            dt.Columns.Add("Subjects", typeof(string));
            dt.Columns.Add("Student ID", typeof(string));
        }
        dt.Columns.Add("Registration Date", typeof(DateTime));
        dt.Columns.Add("Contact Number", typeof(string));
        dt.Columns.Add("Country of Residence", typeof(string));
        dt.Columns.Add("Status", typeof(string));
        // to print rows
        if (applicant != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var applicantemployerdetails = applicant[i];
                if (fullservice == 2)
                    dt.Rows.Add(applicantemployerdetails.applicantid, applicantemployerdetails.university_name, applicantemployerdetails.firstname, applicantemployerdetails.lastname, applicantemployerdetails.email, applicantemployerdetails.classname, applicantemployerdetails.groupname, applicantemployerdetails.Subjects, applicantemployerdetails.studentID, Convert.ToDateTime(applicantemployerdetails.registereDate), applicantemployerdetails.mobile, applicantemployerdetails.countryofresidence, applicantemployerdetails.Status);
                else
                    dt.Rows.Add(applicantemployerdetails.applicantid, applicantemployerdetails.university_name, applicantemployerdetails.firstname, applicantemployerdetails.lastname, applicantemployerdetails.email, Convert.ToDateTime(applicantemployerdetails.registereDate), applicantemployerdetails.mobile, applicantemployerdetails.countryofresidence, applicantemployerdetails.Status);

                rowNumber++;
            }
        }
        return dt;
    }

    protected void downloadbtn_Click(object sender, EventArgs e)
    {
        try
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "RegisteredApplicant_List.xls"));
            Response.ContentType = "application/ms-excel";

            int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            DataTable dt = BindDatatable();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }

            Response.End();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public class Details
    {
        public int? id { get; set; }
        public int? applicantid { get; set; }
        public int? universityId { get; set; }
        public int? classcode { get; set; }
        public string classcode_link { get; set; }
        public string grade { get; set; }
        public string subject { get; set; }
        public string mode { get; set; }
        public string type { get; set; }
        public int? locationId { get; set; }
        public string location { get; set; }
        public DateTime? booking_datetime { get; set; }
        public string university_name { get; set; }
        public string firstname { get; set; }
        public string fullname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public DateTime? registereDate { get; set; }
        public string mobile { get; set; }
        public string countryofresidence { get; set; }
        public string Status { get; set; }
        public string approve { get; set; }
        public bool? Isreportcompleted { get; set; }
        public bool? isverifiedbyAdmin { get; set; }
        public string suspend { get; set; }
        public int? classId { get; set; }
        public int? groupId { get; set; }
        public string classname { get; set; }
        public string groupname { get; set; }
        public string Subjects { get; set; }
        public string studentID { get; set; }
        public int? countryid { get; set; }
    }

    protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        UserGridView.EditIndex = e.NewEditIndex;
        if (ddlapplicant.SelectedValue != null && ddlapplicant.SelectedValue != "0" && ddlapplicant.SelectedValue != "")
        {
            int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
            BindApplicant(string.Empty, applicantid, 0, "0");
        }
        if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0" && ddlcountry.SelectedValue != "")
        {
            int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            BindApplicant(string.Empty, 0, countryid, "0");
        }
        if (ddlfirstname.SelectedValue != null && ddlfirstname.SelectedValue != "0")
        {
            string firestname = ddlfirstname.SelectedValue;
            BindApplicant(string.Empty, 0, 0, firestname);
        }
        else
            BindApplicant();
    }

    protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserGridView.PageIndex = e.NewPageIndex;
        BindApplicant();
    }

    protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Suspend")) {
                int applicationId = Convert.ToInt32(e.CommandArgument);
                ec_class_applicationmaster objmappig = new ec_class_applicationmaster();
                var data = db.ec_class_applicationmaster.Where(x => x.id == applicationId).FirstOrDefault();
                if (data != null)
                {
                    objmappig = data;
                }
                objmappig.Is_suspened = 1;
                objmappig.status = 8;//suspend
                db.SaveChanges();
                BindApplicant();
            }

            if (e.CommandName.Equals("Delete"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                var mode = "new";
                applicantdetails objstude = new applicantdetails();
                var data = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objstude = data;
                }
                objstude.isdeletedbyAdmin = true;
                if (mode == "new")
                    db.applicantdetails.Add(objstude);
                db.SaveChanges();
                if (ddlapplicant.SelectedValue != null && ddlapplicant.SelectedValue != "0" && ddlapplicant.SelectedValue != "")
                {
                    int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
                    BindApplicant(string.Empty, applicantid, 0, "0");
                }
                if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0" && ddlcountry.SelectedValue != "")
                {
                    int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
                    BindApplicant(string.Empty, 0, countryid, "0");
                }
                if (ddlfirstname.SelectedValue != null && ddlfirstname.SelectedValue != "0")
                {
                    string firestname = ddlfirstname.SelectedValue;
                    BindApplicant(string.Empty, 0, 0, firestname);
                }
                else
                    BindApplicant();
                Bindlabel(universityID);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applicant deleted successfully.)')", true);
            }
            if (e.CommandName.Equals("Verify"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                var mode = "new";
                students objstude = new students();
                var data = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();

                if (data != null)
                {
                    mode = "update";
                    objstude = data;
                }
                objstude.isverifiedbyAdmin = true;
                if (mode == "new")
                    db.students.Add(objstude);
                db.SaveChanges();

                applicantdetails objapplicantdetails = new applicantdetails();
                var applicantdetails = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();

                if (applicantdetails != null)
                {
                    mode = "update";
                    objapplicantdetails = applicantdetails;
                }
                objapplicantdetails.isverifiedbyAdmin = true;
                if (mode == "new")
                    db.applicantdetails.Add(objapplicantdetails);
                db.SaveChanges();

                Bindlabel(universityID);
                if (ddlapplicant.SelectedValue != null && ddlapplicant.SelectedValue != "0" && ddlapplicant.SelectedValue != "")
                {
                    int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
                    BindApplicant(string.Empty, applicantid, 0, "0");
                }
                if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0" && ddlcountry.SelectedValue != "")
                {
                    int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
                    BindApplicant(string.Empty, 0, countryid, "0");
                }
                if (ddlfirstname.SelectedValue != null && ddlfirstname.SelectedValue != "0")
                {
                    string firestname = ddlfirstname.SelectedValue;
                    BindApplicant(string.Empty, 0, 0, firestname);
                }
                else
                    BindApplicant();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applicant verified successfully.'", true);
            }
            if (e.CommandName.Equals("Edit"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(webURL + "admin/edit_studentDetails.aspx?ID=" + ApplicantID, true);
            }
            if (e.CommandName.Equals("Manage"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(webURL + "admin/manageapplicant.aspx?ID=" + ApplicantID, true);
            }
            if (e.CommandName.Equals("resend"))
            {
                var password = objCom.EncodePasswordToMD5(Hidpassword.Value);
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                int adminID = Convert.ToInt32(Session["UserID"]);
                var adminData = db.adminusers.Where(x => x.adminid == adminID).FirstOrDefault();
                //var studentInfo = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
                var studentInfo = db.students.Where(x => x.studentid == ApplicantID).FirstOrDefault();

                if (adminData.password == password)
                {
                    var university = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).FirstOrDefault();

                    //resnd otp to applicant as well as loggedin admin

                    StringBuilder sb1 = new StringBuilder();
                    sb1.Append("Dear " + studentInfo.name + "<br/>");
                    sb1.Append("Based on your resend request, please find below the Online Time Password (OTP) details:" + "<br/>");
                    sb1.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                    sb1.Append("<li>" + "Applicant Name: " + studentInfo.name + "</li>");
                    sb1.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                    sb1.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                    sb1.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                    sb1.Append("Thank you" + "<br/>");
                    sb1.Append("Support Team." + "<br/>");

                    objCom.SendMail(studentInfo.email, sb1.ToString(), "Your OTP resend request was successful.");

                    StringBuilder sb = new StringBuilder();
                    sb.Append("Dear " + adminData.name + "<br/>");
                    sb.Append("Based on your resend request, please find below the Online Time Password (OTP) details:" + "<br/>");
                    sb.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                    sb.Append("<li>" + "Applicant Name: " + studentInfo.name + "</li>");
                    sb.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                    sb.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                    sb.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                    sb.Append("Thank you" + "<br/>");
                    sb.Append("Support Team." + "<br/>");
                    objCom.SendMail(adminData.email, sb.ToString(), "Your OTP resend request was successful for applicant ID " + ApplicantID);
                    if (webURL.Contains("http://localhost:50180") || webURL.Contains("http://qc.")) { }
                    else
                        objCom.SendMail("support@gte.direct", sb.ToString(), "Your OTP resend request was successful for applicant ID " + ApplicantID);


                    if (ddlapplicant.SelectedValue != null && ddlapplicant.SelectedValue != "0" && ddlapplicant.SelectedValue != "")
                    {
                        int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
                        BindApplicant(string.Empty, applicantid, 0, "0");
                    }
                    if (ddlcountry.SelectedValue != null && ddlcountry.SelectedValue != "0" && ddlcountry.SelectedValue != "")
                    {
                        int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
                        BindApplicant(string.Empty, 0, countryid, "0");
                    }
                    if (ddlfirstname.SelectedValue != null && ddlfirstname.SelectedValue != "0")
                    {
                        string firestname = ddlfirstname.SelectedValue;
                        BindApplicant(string.Empty, 0, 0, firestname);
                    }
                    else
                        BindApplicant();
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid password.')", true);
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void UserGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].CssClass = "locked";
                Label lblapplicantid = (Label)e.Row.FindControl("lblapplicantid");
                Label lblstatus = (Label)e.Row.FindControl("lblStatus");
                LinkButton lnkapprove = ((LinkButton)e.Row.FindControl("lnkapprove"));
                LinkButton lnkSuspend = ((LinkButton)e.Row.FindControl("lnkSuspend"));

                if (lblstatus.Text == "Enrolled")
                    lnkSuspend.Attributes.Add("style", "display:block");
                else
                    lnkSuspend.Attributes.Add("style", "display:none");

                if (lblstatus.Text == "Registered")
                    lnkapprove.Attributes.Add("style", "display:block");
                else
                    lnkapprove.Attributes.Add("style", "display:none");

                int applicantid = Convert.ToInt32(lblapplicantid.Text);
                Label Label7 = (Label)e.Row.FindControl("Label7");
                LinkButton lnkResend = ((LinkButton)e.Row.FindControl("lnkResend"));
                var ispassword = db.students.Where(x => x.studentid == applicantid).FirstOrDefault();
                if (string.IsNullOrEmpty(ispassword.password))
                {
                    lnkResend.Attributes.Add("style", "display:block");
                    Label7.Attributes.Add("style", "display:none");
                }
                else
                {
                    lnkResend.Attributes.Add("style", "display:none");
                    Label7.Attributes.Add("style", "display:block");
                }

                LinkButton lnkmagae = ((LinkButton)e.Row.FindControl("lnkmagae"));
                Label lblaid = (Label)e.Row.FindControl("lblaid");
                if (fullservice == 2 || fullservice == 1)
                {
                    lblaid.Visible = true;
                    lnkmagae.Attributes.Add("style", "display:none");
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void UserGridView_RowCreated(object sender, GridViewRowEventArgs e)
    {
        
    }

    protected void ddlapplicant_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlapplicant.SelectedValue != null)
        {
            int applicantid = Convert.ToInt32(ddlapplicant.SelectedValue);
            BindApplicant(string.Empty, applicantid, 0, "0");
        }
    }

    protected void ddlfirstname_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlapplicant.ClearSelection();
        ddlcountry.ClearSelection();
        if (ddlfirstname.SelectedValue != null)
        {
            string firestname = ddlfirstname.SelectedValue;
            BindApplicant(string.Empty, 0, 0, firestname);
        }
    }

    protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcountry.SelectedValue != null)
        {
            int countryid = Convert.ToInt32(ddlcountry.SelectedValue);
            BindApplicant(string.Empty, 0, countryid, "0");
        }
    }
}