using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_view_question : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int universityID,RecordID, questionbanktype;
    public string marks,time,questionfor,questionname, question, answer1, answer2, answer3, correctanswer, answer4, answer_description_1, answer_description_2, answer_description_3, answer_description_4;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        if (Request.QueryString["id"] == null && Request.QueryString["id"] == "")
            Response.Redirect(webURL + "admin/Login.aspx", true);
        else
            RecordID = Convert.ToInt32(Request.QueryString["id"]);

        if (Request.QueryString["qb"] == null && Request.QueryString["qb"] == "")
            Response.Redirect(webURL + "admin/Login.aspx", true);
        else
            questionbanktype = Convert.ToInt32(Request.QueryString["qb"]);

        if (!IsPostBack)
        {
            
            BindData(RecordID, questionbanktype);
        }
    }
    
    private void BindData(int RecID, int questionbanktype)
    {
        try
        {
            dynamic data = null;

            if(questionbanktype == 1)
                data = db.ec_mcq_question_master.Where(x => x.id == RecID).FirstOrDefault();
            else if (questionbanktype == 2)
                data = db.ec_truefalse_question_master.Where(x => x.id == RecID).FirstOrDefault();
            else if (questionbanktype == 3)
                data = db.ec_openquestion_master.Where(x => x.id == RecID).FirstOrDefault();

            if (data != null)
            {
                
                questionname = data.questionname;

                question = data.question;
                answer1 = data.answer1;
                answer2 = data.answer2;
                answer3 = data.answer3;
                answer4 = data.answer4;
                answer_description_1 = data.answer_description1;
                answer_description_2 = data.answer_description2;
                answer_description_3 = data.answer_description3;
                answer_description_4 = data.answer_description4;

                correctanswer = data.correctanswer == 1 ? "Answer 1" : data.correctanswer == 2 ? "Answer 2" : data.correctanswer == 3 ? "Answer 3" : data.correctanswer == 4 ? "Answer 4" : string.Empty;

                marks= data.marks;
                time= data.time;
                if (data.question_for == 1)
                    questionfor = "For Assignment";
                else if (data.question_for == 2)
                    questionfor = "For Assessment";
                else if (data.question_for == 3)
                    questionfor = "For Both";
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

}