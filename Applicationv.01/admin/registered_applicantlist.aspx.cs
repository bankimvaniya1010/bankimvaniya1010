using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_registered_applicantlist : System.Web.UI.Page
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
        BindApplicant();
        if (!IsPostBack)
        {
            BindApplicant();
            Bindlabel(universityID);
        }
    }
    private void Bindlabel(int universityID) {
        try
        {
            var studentcount_byuniveristy = db.university_master.Where(x => x.universityid == universityID).Select(x => x.numberof_applicant).FirstOrDefault();
            lbltotal.InnerText = studentcount_byuniveristy.ToString();

            int registeredapplicantcCount = (from ad in db.applicantdetails
                                             join sd in db.students on ad.applicantid equals sd.studentid
                                             where ad.universityid == universityID && ad.isdeletedbyAdmin == false
                                             select ad.applicantid).ToList().Count;

            var value1 = Convert.ToInt32(studentcount_byuniveristy);
            var availableApplicant_Count = value1 - registeredapplicantcCount;

            lblavailable.InnerText = availableApplicant_Count.ToString();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindApplicant(string type = "NOdownload")
    {
        try
        {
            if (fullservice == 0)
            {
                
                applicant = (from gtead in db.applicantdetails

                             join s in db.students on gtead.applicantid equals s.studentid 

                             join u in db.university_master on gtead.universityid equals u.universityid

                             join sd in db.gte_applicantdetails on gtead.applicantid equals sd.applicantid into data
                             from sdata in data.Where(x=>x.universityid == universityID).DefaultIfEmpty()

                             join cm in db.countriesmaster on sdata.residencecountry equals cm.id into countrydata
                             from cmdata in countrydata.DefaultIfEmpty()

                             where gtead.universityid == universityID && gtead.isdeletedbyAdmin == false 
                             select new Details()
                             {
                                 id = gtead.applicantid,
                                 applicantid = gtead.applicantid,
                                 universityId = u.universityid,
                                 university_name = u.university_name,
                                 firstname = gtead.firstname == null ? string.Empty : gtead.firstname,
                                 lastname = gtead.lastname == null ? string.Empty : gtead.lastname,
                                 email = gtead.email == null ? s.email : gtead.email,
                                 registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                                 mobile = gtead.mobileno == null ? string.Empty : gtead.mobileno,
                                 countryofresidence = string.IsNullOrEmpty(cmdata.country_name) ? string.Empty : cmdata.country_name,
                                 Status = "Prospect",
                                 approve = gtead.isverifiedbyAdmin == true ? "Approved" : "Pending",
                                 suspend = gtead.isdeletedbyAdmin == true?"Deleted":string.Empty,

                             }).Distinct().OrderByDescending(x => x.applicantid).ToList();
                foreach (var itm in applicant) {
                    int applicantid = Convert.ToInt32(itm.applicantid);
                    if (string.IsNullOrEmpty(itm.countryofresidence))
                    {
                        var data = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == itm.universityId).FirstOrDefault();
                        if (data != null)
                        {
                            itm.countryofresidence = objCom.GetCountryDiscription(Convert.ToInt32(data.residentialcountry));
                        }
                        
                    }
                }
            }
            else if(fullservice == 2)
            {
                applicant = (from ad in db.applicantdetails

                             join cm in db.countriesmaster on ad.residentialcountry equals cm.id into cmdata
                             from c in cmdata.DefaultIfEmpty()

                             join sm in db.students on ad.applicantid equals sm.studentid into studentData
                             from s in studentData.DefaultIfEmpty()

                             join um in db.university_master on ad.universityid equals um.universityid into umData
                             from u in umData.DefaultIfEmpty()
                             
                             where ad.universityid == universityID && ad.isdeletedbyAdmin == false
                             select new Details()
                             {
                                 id = ad.applicantid,
                                 applicantid = ad.applicantid,
                                 universityId = u.universityid,
                                 university_name = u.university_name,
                                 firstname = ad.firstname == null ? string.Empty : ad.firstname,
                                 lastname = ad.lastname == null ? string.Empty : ad.lastname,
                                 email = ad.email == null ? s.email : ad.email,
                                 registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                                 mobile = ad.mobileno == null ? string.Empty : ad.mobileno,
                                 countryofresidence = c.country_name == null ? string.Empty : c.country_name,
                                 Status = "Prospect",
                                 approve = ad.isverifiedbyAdmin == true ? "Approved" : "Pending",
                                 suspend = ad.isdeletedbyAdmin == true ? "Deleted" : string.Empty,
                                 classId = ad.classId,
                                 groupId = ad.groupId,
                                 studentID =ad.studentid,
                             }).Distinct().OrderByDescending(x => x.applicantid).ToList();              
            }
            else
            {
                applicant = (from ad in db.applicantdetails

                             join cm in db.countriesmaster on ad.residentialcountry equals cm.id into cmdata
                             from c in cmdata.DefaultIfEmpty()
                             
                             join sm in db.students on ad.applicantid equals sm.studentid into studentData
                             from s in studentData.DefaultIfEmpty()

                             join um in db.university_master on ad.universityid equals um.universityid into umData
                             from u in umData.DefaultIfEmpty()

                             where ad.universityid == universityID && ad.isdeletedbyAdmin == false
                             select new Details()
                             {
                                 id = ad.applicantid,
                                 applicantid = ad.applicantid,
                                 universityId = u.universityid,
                                 university_name = u.university_name,
                                 firstname = ad.firstname == null ? string.Empty : ad.firstname,
                                 lastname = ad.lastname == null ? string.Empty : ad.lastname,
                                 email = ad.email == null ? s.email : ad.email,
                                 registereDate = (s.creationdate == null) ? (DateTime?)null : s.creationdate,
                                 mobile = ad.mobileno == null ? string.Empty : ad.mobileno,
                                 countryofresidence = c.country_name == null ? string.Empty : c.country_name,
                                 Status = "Prospect",
                                 approve = ad.isverifiedbyAdmin == true ? "Approved" : "Pending",
                                 suspend = ad.isdeletedbyAdmin == true ? "Deleted" : string.Empty,
                                 
                             }).Distinct().OrderByDescending(x => x.applicantid).ToList();
            }
            //Starts filling up any form - Applicant
            if (fullservice == 2)
            {
                foreach (var data in applicant)
                {
                    string classname = db.class_master.Where(x => x.id == data.classId).Select(x => x.description).FirstOrDefault();
                    string groupnname = db.group_master.Where(x => x.id == data.groupId).Select(x => x.description).FirstOrDefault();

                    if (string.IsNullOrEmpty(classname))
                        data.classname = string.Empty;
                    else
                        data.classname = classname;

                    if (string.IsNullOrEmpty(groupnname))
                        data.groupname = string.Empty;
                    else
                        data.groupname = groupnname;
                    appliedsubjectlist.Clear();

                    var subjectapplied = db.exam_applicant_subjectmapping.Where(x => x.universityid == data.universityId && x.applicantid == data.applicantid).Select(x=>x.subjectid).ToList();
                    foreach (var item in subjectapplied)
                    {
                        int subjectid = Convert.ToInt32(item);
                        appliedsubjectlist.Add(db.exam_subjectmaster.Where(x => x.id == subjectid).FirstOrDefault());
                    }

                    if (appliedsubjectlist.Count > 0)
                    {
                        String numberList = "";
                        for (int i = 0; i < appliedsubjectlist.Count; i++)
                        {
                            if(type == "download")
                                numberList += appliedsubjectlist[i].description + ",";
                            else
                                numberList += appliedsubjectlist[i].description + "<br/>" + Environment.NewLine;
                        }

                        data.Subjects = numberList;
                    }
                    else
                        data.Subjects = string.Empty;
                }
            }
            else
            {
                foreach (var item in applicant)
                {
                    var personalDetails = db.applicantdetails.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                    var educationDetails = db.applicanteducationdetails.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                    var languageCompetency = db.applicantlanguagecompetency.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                    var courseData = db.applicationmaster.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).FirstOrDefault();
                    var applicationmaster = db.applicationmaster.Where(x => x.applicantid == item.applicantid && x.universityid == universityID).ToList();
                    var applicationStatus = db.application_status_master.AsNoTracking().Select(x => new { x.id, x.status_description });

                    if (personalDetails != null && (personalDetails.ispersonaldetailspresent || personalDetails.iscontactdetailspresent || personalDetails.issocialprofilepresent || personalDetails.isidentificationpresent))
                    {
                        item.Status = "Applicant";
                    }
                    else if (educationDetails != null && !educationDetails.iseducationdetailspresent)
                    {
                        item.Status = "Applicant";
                    }
                    else if (languageCompetency != null && !languageCompetency.islanguagecompetencypresent)
                    {
                        item.Status = "Applicant";
                    }
                    if (personalDetails != null && personalDetails.ispersonaldetailspresent && courseData != null)
                    {
                        item.Status = "Successful Applicant";
                    }
                    if (applicationmaster.Count > 0)
                    {
                        foreach (var data in applicationmaster)
                        {
                            if (data.current_status != null && (data.current_status == 2 || data.current_status == 3))
                                item.Status = "Offered Applicant";

                            if (data.current_status != null && (data.current_status == 6 || data.current_status == 9 || data.current_status == 10))
                                item.Status = "Accepted Applicant";

                            if (data.current_status != null && data.current_status == 11)
                                item.Status = "Enrolled Applicant";
                        }
                    }
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

    protected DataTable BindDatatable()
    {
        BindApplicant("download");
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Applicant Id", typeof(Int32));
        dt.Columns.Add("University Name", typeof(string));
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
                if(fullservice == 2)
                    dt.Rows.Add(applicantemployerdetails.applicantid, applicantemployerdetails.university_name, applicantemployerdetails.firstname, applicantemployerdetails.lastname, applicantemployerdetails.email,applicantemployerdetails.classname, applicantemployerdetails.groupname, applicantemployerdetails.Subjects, applicantemployerdetails.studentID, Convert.ToDateTime(applicantemployerdetails.registereDate), applicantemployerdetails.mobile, applicantemployerdetails.countryofresidence, applicantemployerdetails.Status);
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
        public string university_name { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public DateTime? registereDate { get; set; }
        public string mobile { get; set; }
        public string countryofresidence { get; set; }
        public string Status { get; set; }
        public string approve { get; set; }
        public string suspend { get; set; }
        public int? classId { get; set; }
        public int? groupId { get; set; }
        public string classname { get; set; }
        public string groupname { get; set; }
        public string Subjects { get; set; }
        public string studentID { get; set; }
    }

    protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        UserGridView.EditIndex = e.NewEditIndex;
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
                BindApplicant();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applicant verified successfully.'", true);
            }
            if (e.CommandName.Equals("Edit"))
            {
                int ApplicantID = Convert.ToInt32(e.CommandArgument);
                Response.Redirect(webURL + "admin/edit_studentDetails.aspx?ID="+ ApplicantID, true);
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
                    var university = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                    
                    //resnd otp to applicant as well as loggedin admin
                   
                    StringBuilder sb1 = new StringBuilder();
                    sb1.Append("Dear "+studentInfo.name+ "<br/>");
                    sb1.Append("Based on your resend request, please find below the Online Time Password (OTP) details:"+"<br/>");
                    sb1.Append("<b><ol><li>" + "Applicant ID: " + studentInfo.studentid + "</li>");
                    sb1.Append("<li>"+ "Applicant Name: "+studentInfo.name + "</li>");
                    sb1.Append("<li>" + "Registered on:  " + studentInfo.creationdate + "</li>");
                    sb1.Append("<li>" + "User ID / Email: " + studentInfo.email + "</li>");
                    sb1.Append("<li>" + "OTP: " + studentInfo.otp + "</li></ol></b>");
                    sb1.Append("Thank you"+ "<br/>");
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
                    objCom.SendMail(adminData.email , sb.ToString(), "Your OTP resend request was successful for applicant ID " + ApplicantID);

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
                Label lblstatus = (Label)e.Row.FindControl("Label6");
                LinkButton lnkapprove = ((LinkButton)e.Row.FindControl("lnkapprove"));

                if (lblstatus.Text == "Approved")
                    lnkapprove.Attributes.Add("style", "display:none");
                else
                    lnkapprove.Attributes.Add("style", "display:block");

                int applicantid = Convert.ToInt32(lblapplicantid.Text);
                Label Label7 = (Label)e.Row.FindControl("Label7");
                LinkButton lnkResend = ((LinkButton)e.Row.FindControl("lnkResend"));
                var ispassword = db.students.Where(x => x.studentid == applicantid).FirstOrDefault();
                if (string.IsNullOrEmpty(ispassword.password))
                {
                    lnkResend.Attributes.Add("style", "display:block");
                    Label7.Attributes.Add("style", "display:none");
                }
                else {
                    lnkResend.Attributes.Add("style", "display:none");
                    Label7.Attributes.Add("style", "display:block");
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
        if (objCom.GetUniversityservice(universityID) == 1 || objCom.GetUniversityservice(universityID) == 0)
        {
            ((DataControlField)UserGridView.Columns
                .Cast<DataControlField>()
                .Where(fld => fld.HeaderText == "Class")
                .SingleOrDefault()).Visible = false;
            ((DataControlField)UserGridView.Columns
                .Cast<DataControlField>()
                .Where(fld => fld.HeaderText == "Group")
                .SingleOrDefault()).Visible = false;
            //((DataControlField)UserGridView.Columns
            //    .Cast<DataControlField>()
            //    .Where(fld => fld.HeaderText == "Subjects")
            //    .SingleOrDefault()).Visible = false;
            ((DataControlField)UserGridView.Columns
                .Cast<DataControlField>()
                .Where(fld => fld.HeaderText == "StudentID")
                .SingleOrDefault()).Visible = false;
            ((DataControlField)UserGridView.Columns
               .Cast<DataControlField>()
               .Where(fld => fld.HeaderText == "Edit")
               .SingleOrDefault()).Visible = false;
        }
    }

    protected void UserGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        //if (fullservice == 1 || fullservice == 0)
        //{
        //    ((DataControlField)UserGridView.Columns
        //        .Cast<DataControlField>()
        //        .Where(fld => fld.HeaderText == "Class")
        //        .SingleOrDefault()).Visible = false;
        //    ((DataControlField)UserGridView.Columns
        //        .Cast<DataControlField>()
        //        .Where(fld => fld.HeaderText == "Group")
        //        .SingleOrDefault()).Visible = false;
        //    //((DataControlField)UserGridView.Columns
        //    //    .Cast<DataControlField>()
        //    //    .Where(fld => fld.HeaderText == "Subjects")
        //    //    .SingleOrDefault()).Visible = false;
        //    ((DataControlField)UserGridView.Columns
        //        .Cast<DataControlField>()
        //        .Where(fld => fld.HeaderText == "StudentID")
        //        .SingleOrDefault()).Visible = false;
        //    ((DataControlField)UserGridView.Columns
        //       .Cast<DataControlField>()
        //       .Where(fld => fld.HeaderText == "Edit")
        //       .SingleOrDefault()).Visible = false;
        //}
    }
}