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

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        UniversityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
        {
            allfaqQuestion = objCom.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.examInstruction).FirstOrDefault();
            //if time date expires
            ifexamexpires();
            //if passkey verified & status = complete
            ifexamnotappeared();
            bindDataList();
        }
    }

    private void ifexamexpires() {
        try {
            exam_assign objexam_assign = new exam_assign();
            var data = (from exam in db.exam_assign
                        join shedule in db.exam_schedule on exam.exampapersid equals shedule.exampapersid into sheduleData
                        from y in sheduleData.DefaultIfEmpty()
                        where exam.exam_datetime < DateTime.Now && exam.applicantid == UserID && exam.universityID == UniversityID && exam.status == null
                        select exam).Distinct().ToList();
            foreach (var item in data)
            {
                var mode = "new";
                var examdata = db.exam_assign.Where(x => x.applicantid == item.applicantid && x.universityID == item.universityID && x.exam_datetime == item.exam_datetime && x.exampapersid == item.exampapersid).FirstOrDefault();
                if (examdata != null)
                {
                    mode = "update";
                    objexam_assign = examdata;
                }
                objexam_assign.status = "Expired";
                if (mode == "new")
                    db.exam_assign.Add(objexam_assign);
                db.SaveChanges();
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
            //foreach (var item in data)
            //{
            //    var mode = "new";
            //    var examdata = db.exam_assign.Where(x => x.applicantid == item.applicantid && x.universityID == item.universityID && x.exam_datetime == item.exam_datetime && x.exampapersid == item.exampapersid).FirstOrDefault();
            //    if (examdata != null)
            //    {
            //        mode = "update";
            //        objexam_assign = examdata;
            //    }
            //    objexam_assign.status = "Expired";
            //    if (mode == "new")
            //        db.exam_assign.Add(objexam_assign);
            //    db.SaveChanges();
            //}

        }
        catch (Exception ex) { log.WriteLog(ex.ToString()); }
    }

    private void bindDataList()
    {

        try
        {
            var data = (from exam in db.exam_master

                        join assign in db.exam_assign on exam.exampapersid equals assign.exampapersid into assignData
                        from x in assignData.DefaultIfEmpty()

                        join shedule in db.exam_schedule on x.exampapersid equals shedule.exampapersid into sheduleData
                        from y in sheduleData.DefaultIfEmpty()

                        where x.exam_datetime == y.exam_datetime && exam.universityID == UniversityID && y.universityid == UniversityID && x.universityID == UniversityID && x.applicantid == UserID
                        select new
                        {
                            exampapersid = exam.exampapersid,
                            exam_name = exam.exam_name,
                            shortremarks = exam.shortremarks,
                            exam_datetime = y.exam_datetime,
                            status = x.status,
                            Downloadfile = webURL + "/Docs/Exammodule/" + UniversityID + "/" + exam.exampapersid + "/studentfile/" + exam.studentfilepath,
                            exampage_link = webURL + "exam_details.aspx?examid=" + exam.exampapersid + "&assignDate=" + y.exam_datetime,
                        }).ToList();
            if (data.Count > 0)
            {
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
}