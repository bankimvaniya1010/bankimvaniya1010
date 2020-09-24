using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exammodule : System.Web.UI.Page
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    int UserID = 0, applicantID = 0;
    string webURL = String.Empty;
    protected static List<faq> allfaqQuestion = new List<faq>();
    Common objCom = new Common();
    public int UniversityID = -1;
    protected List<Detials> data = new List<Detials>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
                            
        ifexamexpires();
        ifexamnotappeared();
        ViewState["NewList"] = null;
        ViewState["MainList"] = null;
        ViewState["NewPreviousList"] = null;
        ViewState["totalResponseTime"] = null;

        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);

        if (!IsPostBack)
        {
            allfaqQuestion = objCom.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.examInstruction).FirstOrDefault();
            Session["totalResponseTime"] = null;
            bindDataList(string.Empty);
            ifexamexpires();
            ifexamnotappeared();
        }
    }

    private void ifexamexpires() {
        try {            
            exam_assign objexam_assign = new exam_assign();
            var data = (from exam in db.exam_assign
                        join shedule in db.exam_schedule on exam.exampapersid equals shedule.exampapersid into sheduleData
                        from y in sheduleData.DefaultIfEmpty()
                        where exam.applicantid == UserID && exam.universityID == UniversityID && exam.status == null && exam.exam_datetime == y.exam_datetime
                        select new {
                            applicantid = exam.applicantid,
                            universityID = exam.universityID,
                            exam_datetime = exam.exam_datetime,
                            exam_datetime_utc = y.exam_datetime_utc,
                            exampapersid = exam.exampapersid

                        }).Distinct().ToList();
            foreach (var item in data)
            {
                DateTime current_utctime= DateTime.UtcNow;
                DateTime record_utcdattime_plus30 = Convert.ToDateTime(item.exam_datetime_utc).AddMinutes(30);

                if (record_utcdattime_plus30 < current_utctime)
                {
                    var mode = "new";
                    var examdata = db.exam_assign.Where(x => x.applicantid == item.applicantid && x.universityID == item.universityID && x.exam_datetime == item.exam_datetime && x.exampapersid == item.exampapersid && x.status == null).FirstOrDefault();
                    if (examdata != null)
                    {
                        mode = "update";
                        objexam_assign = examdata;
                    }
                    objexam_assign.is_expired = true;
                    objexam_assign.status = "Expired";
                    if (mode == "new")
                        db.exam_assign.Add(objexam_assign);
                    db.SaveChanges();
                    bindDataList(string.Empty);
                }
            }

        }
        catch (Exception ex) { log.WriteLog(ex.ToString()); }
    }

    private void ifexamnotappeared()
    {
        try {
                 
            exam_assign objexam_assign = new exam_assign();
            var data = (from exam in db.exam_assign
                        join answer in db.exam_answersheet on exam.exampapersid equals answer.exampaperid into answerData
                        from y in answerData.DefaultIfEmpty()
                        where exam.applicantid == UserID && exam.universityID == UniversityID && exam.status == null && exam.is_verified == true
                        select exam).Distinct().ToList();
            foreach (var item in data)
            {
                var anshwerdata = db.exam_answersheet.Where(x => x.exampaperid == item.exampapersid).ToList();
                if (anshwerdata.Count == 0)
                {
                    var mode = "new";
                    var examdata = db.exam_assign.Where(x => x.applicantid == item.applicantid && x.universityID == item.universityID && x.exam_datetime == item.exam_datetime && x.exampapersid == item.exampapersid && x.status==null).FirstOrDefault();
                    if (examdata != null)
                    {
                        mode = "update";
                        objexam_assign = examdata;
                    }
                    objexam_assign.status = "Not Apperead";
                    if (mode == "new")
                        db.exam_assign.Add(objexam_assign);
                    db.SaveChanges();
                    bindDataList(string.Empty);
                }
            }

        }
        catch (Exception ex) { log.WriteLog(ex.ToString()); }
    }

    private void bindDataList(string selectedvalue)
    {

        try
        {
            data = (from exam in db.exam_master
                    join assign in db.exam_assign on exam.exampapersid equals assign.exampapersid into assignData
                    from x in assignData.DefaultIfEmpty()
                    join shedule in db.exam_schedule on x.exampapersid equals shedule.exampapersid into sheduleData
                    from y in sheduleData.DefaultIfEmpty()
                    where x.exam_datetime == y.exam_datetime && exam.universityID == UniversityID && y.universityid == UniversityID && x.universityID == UniversityID && x.applicantid == UserID
                    select new Detials()
                    {
                        applicantid = x.applicantid,
                        universityid = x.universityID,
                        examdatetime = x.exam_datetime,
                        exampapersid = exam.exampapersid,
                        exam_name = exam.exam_name,
                        shortremarks = string.IsNullOrEmpty(exam.shortremarks)?null: exam.shortremarks,
                        exam_datetime = y.exam_datetime,
                        examtimezonetoshow = "< " + y.utctimezone + " >",
                        status = x.status == null ? null : x.status,
                        showstatus = string.IsNullOrEmpty(x.status) ? "Active" : x.status,
                        Downloadfile = string.IsNullOrEmpty(exam.studentfilepath)? null: webURL + "/Docs/Exammodule/" + UniversityID + "/" + exam.exampapersid + "/studentfile/" + exam.studentfilepath,
                        exampage_link = webURL + "exam_details.aspx?examid=" + exam.exampapersid + "&assignDate=" + y.exam_datetime,
                        result = null,
                        resulttimezone =null,
                        showmarks = null,
                        marks = null,
                        finalmarks = exam.maximummarks,
                        examutctime = y.exam_datetime_utc,
                        examtimezone = y.utctimezone,
                        examuploadtype = exam.uploadtype== 2?null: exam.uploadtype,
                        gotoresultpage = null,
                    }).SortBy("status").ToList();
            
            if (selectedvalue == "Active")
                data.RemoveAll(x => x.status != null);
            else if (selectedvalue == "Completed")
                data.RemoveAll(x => x.status != "Completed");
            else if (selectedvalue == "Expired")
                data.RemoveAll(x => x.status != "Expired");
            else if (selectedvalue == "NotApperead")
                data.RemoveAll(x => x.status != "NotApperead");
            
            foreach (var item in data)
            {
                var examdateofrelease = db.exam_applicantmarks_releasedatemaster.Where(x => x.applicantid == item.applicantid && x.universityid == item.universityid && x.examid == item.exampapersid && x.examdate_time == item.exam_datetime).FirstOrDefault();
                if (examdateofrelease != null && examdateofrelease.releasedate != null)
                {
                    item.result = examdateofrelease.releasedate;
                    item.resulttimezone = examdateofrelease.releasedate_timezone == null ? string.Empty : "< " + examdateofrelease.releasedate_timezone +" >";
                    if (examdateofrelease.releasedateutc <= DateTime.UtcNow)
                    {
                        item.showmarks = "Yes";
                        item.marks = examdateofrelease.finalmarks + "/" + item.finalmarks;
                        item.gotoresultpage = webURL + "view_result.aspx?examid=" + item.exampapersid+ "&assignDate=" + item.examdatetime;
                    }
                }
            }
            if (data.Count > 0)
            {
                coeCard.Visible = true;
                emptyChoicesDiv.Visible = false;
                coeList.DataSource = data;
                coeList.DataBind();
            }
            else
            {
                coeCard.Visible = false;
                emptyChoicesDiv.Visible = true;
            }
        }
        catch (Exception ex) { log.WriteLog(ex.ToString()); }
    }
    public class Detials {

        public int? applicantid { get; set; }
        public int? universityid { get; set; }
        public DateTime? examdatetime { get; set; }
        public int? exampapersid { get; set; }
        public string exam_name { get; set; }
        public string shortremarks { get; set; }
        public DateTime? exam_datetime { get; set; }
        public string status { get; set; }
        public string showstatus { get; set; }
        public string Downloadfile { get; set; }
        public string exampage_link { get; set; }
        public DateTime? result { get; set; }
        public string showmarks { get; set; }
        public string marks { get; set; }
        public string finalmarks { get; set; }
        public string examtimezone { get; set; }
        public string examtimezonetoshow { get; set; }
        public DateTime? examutctime { get; set; }
        public string resulttimezone { get; set; }
        public string gotoresultpage { get; set; }
        public int? examuploadtype { get; set; }
    }

    protected void ddlsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedvalue = ddlsort.SelectedValue;
        bindDataList(selectedvalue);
    }
}