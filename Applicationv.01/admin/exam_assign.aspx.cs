using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_exam_assign : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID, UserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            BindUniversity();
            //bindProctorname();
        }
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Genrateotp()
    {
        Random random = new Random();
        int otp = random.Next(100000, 999999);
        return JsonConvert.SerializeObject(otp);
    }

    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
            {
                universityID = Convert.ToInt32(Session["universityId"]);
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();
            }

            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindSheduledExamPaper(int universityid) // Bind universitywise sheduled exam papers
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = (from a in db.exam_master
                         join q in db.exam_schedule on a.exampapersid equals q.exampapersid into cmdata
                         from x in cmdata.DefaultIfEmpty()
                         where a.universityID == universityid && x.universityid == universityid
                         select new
                         {
                             exam_name = a.exam_name,
                             exampapersid = a.exampapersid
                         }).Distinct().ToList();
            ddlexam.DataSource = paper;
            ddlexam.DataTextField = "exam_name";
            ddlexam.DataValueField = "exampapersid";
            ddlexam.DataBind();
            ddlexam.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindExamDateTime(int exampapersid) {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var paper = db.exam_schedule.Where(x => x.exampapersid == exampapersid).ToList();
            ddlExamDateTime.DataSource = paper;
            ddlExamDateTime.DataTextField = "exam_datetime";
            ddlExamDateTime.DataValueField = "exam_datetime";
            ddlExamDateTime.DataBind();
            ddlExamDateTime.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindUniversitywiseStudent(int universityId) {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studentID = db.applicantdetails.Where(x => x.universityid == universityId).ToList();
            ddlstudentid.DataSource = studentID;
            ddlstudentid.DataTextField = "applicantid";
            ddlstudentid.DataValueField = "applicantid";
            ddlstudentid.DataBind();
            ddlstudentid.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    //private void bindProctorname()
    //{
    //    try
    //    {
    //        ListItem lst = new ListItem("Please select", "0");
    //        var data = db.proctor_master.ToList();

    //        ddlproctor.DataSource = data;
    //        ddlproctor.DataTextField = "name";
    //        ddlproctor.DataValueField = "proctorID";
    //        ddlproctor.DataBind();
    //        ddlproctor.Items.Insert(0, lst);
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.ToString());
    //    }
    //}

    protected void ddlexam_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
        BindExamDateTime(selectedexampapersid);
    }

    protected void ddlUniversity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selecteduniversityid = Convert.ToInt32(ddlUniversity.SelectedValue);
        BindSheduledExamPaper(selecteduniversityid);
        BindUniversitywiseStudent(selecteduniversityid);
        ddlExamDateTime.Items.Clear();
        txtvirtualLink.Value = "";
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try {
            exam_assign objassign = new exam_assign();

            int selecteduniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
            int selectedapplicantid = Convert.ToInt32(ddlstudentid.SelectedValue);
            int selectedexampapersid = Convert.ToInt32(ddlexam.SelectedValue);
            DateTime selectedexamtime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);

            var dataexsisting = db.exam_assign.Where(x => x.universityID == selecteduniversityID && x.applicantid == selectedapplicantid && x.exampapersid == selectedexampapersid && x.is_expired != true).FirstOrDefault();

            if (dataexsisting == null)
            {
                objassign.universityID = Convert.ToInt32(ddlUniversity.SelectedValue);
                objassign.applicantid = Convert.ToInt32(ddlstudentid.SelectedValue);
                objassign.exampapersid = Convert.ToInt32(ddlexam.SelectedValue);

                objassign.exam_datetime = Convert.ToDateTime(ddlExamDateTime.SelectedValue);
                objassign.proctorid = txtproctor.Value;
                objassign.proctoremail = txtproctoremail.Value;
                objassign.virtuallink = txtvirtualLink.Value;
                objassign.studentpasskey = hidtxtstudentpasskey.Value;
                objassign.proctorpasskey = hidtxtproctorpasskey.Value;
                db.exam_assign.Add(objassign);
                db.SaveChanges();

               
                var studentdetail = db.applicantdetails.Where(x => x.applicantid == objassign.applicantid && x.universityid == objassign.universityID).Select(x => new { x.firstname,x.email}).FirstOrDefault();
                var examname = db.exam_master.Where(x => x.universityID == objassign.universityID && x.exampapersid == objassign.exampapersid).Select(x => x.exam_name).FirstOrDefault();
                //send passkey proctor
                if (objassign.proctorid != null)
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("Dear " + objassign.proctorid + ",<br/><br/>");
                    sb.Append("Assign as a proctor to " + studentdetail.firstname + "(" + objassign.applicantid + ").<br/>");
                    sb.Append("Details :<br/>");
                    sb.Append("Exam name :" + examname + "<br/>");
                    sb.Append("Exam time :" + objassign.exam_datetime + "<br/>");
                    sb.Append("Virtual Link :" + objassign.virtuallink + "<br/>");
                    sb.Append("Passkey :" + objassign.proctorpasskey + "<br/>");
                    sb.Append("Thank You <br/>");
                    objCom.SendMail(objassign.proctoremail, sb.ToString(), "Your passkey for " + examname + "");
                }
                //send passkey student
                if (objassign.applicantid != null)
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("Dear " + studentdetail.firstname + ",<br/><br/>");
                    sb.Append("Your " + examname + "Exam is shedule at "+objassign.exam_datetime+".<br/>");
                    sb.Append("virtualLink:" + objassign.virtuallink + "<br/>");
                    sb.Append("Passkey :" + objassign.studentpasskey + "<br/>");
                    sb.Append("Thank You <br/>");
                    objCom.SendMail(studentdetail.email, sb.ToString(), "Your passkey for " + examname + "");
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                      "alert('Record Added successfully.');window.location='" + Request.ApplicationPath + "admin/exam_assignList.aspx';", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Selected exam paper already registered with selected applicant at same time.')", true);
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}