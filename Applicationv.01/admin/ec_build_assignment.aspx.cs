using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_build_assignment : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    public int universityID;
    public static int assignmentid;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
        {
            assignmentid = Convert.ToInt32(Request.QueryString["id"]);
            Session["id"] = assignmentid;
        }


        var data = db.ec_assignment_master.Where(x => x.id == assignmentid).FirstOrDefault();

        universityID = data.universityid;
        
        if (!IsPostBack)
        {
            lblOrder.Text = "";
            string txt = OrderQuestion();
            string[] aplitList = txt.Split('@');

            for (int i = 0; i < aplitList.Length - 1; i++)
                lblOrder.Text += i + 1 + ". " + aplitList[i] + "<br/>";
        }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        try {
            
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Record Saved successfully.');window.location='" + webURL + "admin/ec_manage_assignment.aspx';", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    public class questiondetails {
        public string questionname { get; set; }
        public int id { get; set; }
        public string subjectid_str { get; set; }
        public string gradeid_str { get; set; }
        public int? subjectid { get; set; }
        public int? gradeid { get; set; }
    }

    private void BindQuestions(int questiontype) {
        try {

            List<questiondetails> data = new List<questiondetails>();
            if (questiontype == 1)
                data = (from mcq in db.ec_mcq_question_master
                        where mcq.universityid == universityID && (mcq.question_for == 1 || mcq.question_for == 3)
                        select new questiondetails {
                            questionname = mcq.questionname,
                            id = mcq.id,
                            subjectid = mcq.subjectid,
                            gradeid = mcq.gradeid,
                        }).ToList(); 
            else if (questiontype == 2)
                data = (from master in db.ec_truefalse_question_master
                        where master.universityid == universityID && (master.question_for == 1 || master.question_for == 3)
                        select new questiondetails
                        {
                            questionname = master.questionname,
                            id = master.id,
                            subjectid = master.subjectid,
                            gradeid = master.gradeid,
                        }).ToList();
            else if (questiontype == 3)
                data = (from master in db.ec_openquestion_master
                        where master.universityid == universityID && (master.question_for == 1 || master.question_for == 3)
                        select new questiondetails
                        {
                            questionname = master.questionname,
                            id = master.id,
                            subjectid = master.subjectid,
                            gradeid = master.gradeid,
                        }).ToList();
            else if (questiontype == 4)
                data = (from master in db.ec_uploadanswer_master
                        where master.univesityid == universityID && (master.question_for == 1 || master.question_for == 3)
                        select new questiondetails
                        {
                            questionname = master.questiondescription,
                            id = master.questionid,
                            subjectid = master.subjectid,
                            gradeid = master.gradeid,
                        }).ToList();
            else if (questiontype == 0)
                chkQuestions.Items.Clear();

            foreach (var item in data) {
                item.subjectid_str = item.subjectid.ToString();
                item.gradeid_str = item.gradeid.ToString();
            }
            var assignmentdata = db.ec_assignment_master.Where(x => x.id == assignmentid).FirstOrDefault();

            data = data.Where(x => assignmentdata.subjectid.Contains(x.subjectid_str) && assignmentdata.gradeid.Contains(x.gradeid_str)).ToList();
            chkQuestions.DataSource = data;
            chkQuestions.DataTextField = "questionname";
            chkQuestions.DataValueField = "id";
            chkQuestions.DataBind();

            var selected = db.ec_assignment_papers_master.Where(x => x.universityID == universityID  && x.assignmentid == assignmentid && x.question_typeid == questiontype).ToList();
            for (int k = 0; k < selected.Count; k++)
            {
                chkQuestions.Items.FindByValue(selected[k].selected_questionId.ToString()).Selected = true;
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }


    public static string OrderQuestion() {
        GTEEntities db = new GTEEntities();
        int universityID = Utility.GetUniversityId();
        string result = string.Empty;
        var data_build = db.ec_assignment_papers_master.Where(x => x.universityID == universityID && x.assignmentid == assignmentid).ToList();
        for (int k = 0; k < data_build.Count; k++)
        {
            var questiontype = data_build[k].question_typeid;
            List<string> question = null ;
            int qid = Convert.ToInt32(data_build[k].selected_questionId);

            if (questiontype == 1)
                question = db.ec_mcq_question_master.Where(x =>x.universityid == universityID && x.id == qid).Select(x=>x.questionname).ToList();
            else if (questiontype == 2)
                question = db.ec_truefalse_question_master.Where(x => x.universityid == universityID && x.id == qid).Select(x => x.questionname).ToList();
            else if (questiontype == 3)
                question = db.ec_openquestion_master.Where(x => x.universityid == universityID && x.id == qid).Select(x => x.questionname).ToList();
            else if (questiontype == 4)
                question = db.ec_uploadanswer_master.Where(x => x.univesityid == universityID && x.questionid == qid).Select(x => x.questiondescription).ToList();
            result +=  question[0] + "@";
        }
        return result;
    }

    protected void ddlquestiontype_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblOrder.Text = "";
        int questiontype = Convert.ToInt32(ddlquestiontype.SelectedValue);
      
        BindQuestions(questiontype);

        LanguagesDiv.Attributes.Add("style","display:none;");
        string txt = OrderQuestion();
        string[] aplitList = txt.Split('@');
        
        for (int i= 0; i < aplitList.Length-1;i++)
            lblOrder.Text += i+1 +". "+ aplitList[i]+"<br/>";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string QuestionSequence(int type,int QID, string ISadd)
    {
        string result = string.Empty;
        GTEEntities db = new GTEEntities();
        Common objCom = new Common();
        int universityID = Utility.GetUniversityId();

        ec_assignment_papers_master objmapping = new ec_assignment_papers_master();

        if (ISadd == "YES")
        {
            var mode = "new";
            var data = db.ec_assignment_papers_master.Where(x => x.universityID == universityID && x.assignmentid == assignmentid && x.question_typeid == type && x.selected_questionId == QID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            
            objmapping.universityID = universityID;
            objmapping.assignmentid =assignmentid;
            objmapping.question_typeid = type;
            objmapping.selected_questionId = QID;
            if(mode=="new")
                db.ec_assignment_papers_master.Add(objmapping);
            db.SaveChanges();
        }
        else if (ISadd == "NO") {

            var data = db.ec_assignment_papers_master.Where(x => x.universityID == universityID && x.assignmentid == assignmentid && x.question_typeid == type && x.selected_questionId == QID).ToList();
            db.ec_assignment_papers_master.RemoveRange(data);
            db.SaveChanges();

        }
        result = OrderQuestion();

        return JsonConvert.SerializeObject(result);
    }

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string Questionpaper(int type,int assignmentid)
    {
        GTEEntities db = new GTEEntities();
        Common objCom = new Common();
        int universityID = Utility.GetUniversityId();

        var data = (from x in db.ec_assignment_papers_master
                    where x.universityID == universityID && x.assignmentid == assignmentid
                    select new details() {
                        assignmentName = string.Empty,
                        question_typeid = x.question_typeid,
                        selected_QID= x.selected_questionId,
                    }).ToList();
            
        foreach (var item in data) {
            int? QID = item.selected_QID;
           dynamic assignment_details = null;
            if (item.question_typeid == 1)
                assignment_details = db.ec_mcq_question_master.Where(x => x.universityid == universityID && x.id == QID).FirstOrDefault();
            else if (item.question_typeid == 2)
                assignment_details = db.ec_truefalse_question_master.Where(x => x.universityid == universityID && x.id == QID).FirstOrDefault();
            else if (item.question_typeid == 3)
                assignment_details = db.ec_openquestion_master.Where(x => x.universityid == universityID && x.id == QID).FirstOrDefault();
            else if (item.question_typeid == 4)
                assignment_details = db.ec_uploadanswer_master.Where(x => x.univesityid== universityID && x.questionid == QID).FirstOrDefault();
            
            if (assignment_details != null)
            {
                item.assignmentName = assignment_details.questionname;
                item.question = assignment_details.question;
            }

        }
        return JsonConvert.SerializeObject(data);
    }

    public class details {

        public int? question_typeid;
        public int? selected_QID;
        public string assignmentName;
        public string question;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL+ "admin/ec_class_create_assign_students_master.aspx", true);
    }
}