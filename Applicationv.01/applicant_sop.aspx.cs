using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicant_sop : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCom = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["Role"] == null) && (Session["UserID"] == null))
            Response.Redirect(webURL + "Login.aspx");
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
        {
            allfaqQuestion = objCom.FaqQuestionList();
            universityInstruction.InnerText = db.sop_instruction.Where(x => x.university_id == UniversityID).Select(x => x.university_instruction).FirstOrDefault();

            var sop_details = db.student_sop.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).FirstOrDefault();
            if (sop_details != null)
            {
                if (sop_details.is_student_sop_submitted)
                {
                    txtStudentSOP.Style.Add("display", "none");
                    studentSOP.InnerText = sop_details.student_submitted_sop;

                    btnEdit.Style.Add("display", "none");
                    btnSave.Style.Add("display", "none");
                    btnsubmit.Style.Add("display", "none");
                }
                else
                {
                    txtStudentSOP.Text = sop_details.student_sop1;

                    btnSave.Style.Remove("display");
                    btnsubmit.Style.Remove("display");
                    btnEdit.Style.Remove("display");
                }
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        student_sop sop = db.student_sop.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).FirstOrDefault();
        if (sop == null)
            sop = new student_sop { applicant_id = UserID, university_id = UniversityID };

        sop.student_sop1 = txtStudentSOP.Text;
        sop.student_submitted_sop = txtStudentSOP.Text;
        sop.submitted_at = DateTime.Now;
        sop.is_student_sop_submitted = true;

        db.student_sop.Add(sop);
        db.SaveChanges();

        btnEdit.Style.Add("display", "none");
        btnSave.Style.Add("display", "none");
        btnsubmit.Style.Add("display", "none");

        txtStudentSOP.Style.Add("display", "none");
        studentSOP.InnerText = sop.student_submitted_sop;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        btnsubmit.Style.Remove("display");
        btnEdit.Style.Remove("display");
        btnSave.Style.Add("display", "none");

        var mode = "new";
        student_sop sop = db.student_sop.Where(x => x.applicant_id == UserID && x.university_id == UniversityID).FirstOrDefault();
        student_sop sopObj = new student_sop();
        if (sop != null)
        {
            mode = "update";
            sopObj = sop;
        }

        sopObj.applicant_id = UserID;
        sopObj.university_id = UniversityID;
        sopObj.is_student_sop_submitted = false;
        sopObj.student_submitted_sop = string.Empty;
        sopObj.submitted_at = DateTime.MinValue;

        sopObj.student_sop1 = txtStudentSOP.Text;

        if (mode == "new")
            db.student_sop.Add(sopObj);
        db.SaveChanges();
    }
}