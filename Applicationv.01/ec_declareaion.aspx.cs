using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ec_declareaion : System.Web.UI.Page
{
    int universityID, formId = 0, UserID = 0;
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    protected int isFullService;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        isFullService = (int)Session["isfullservice"];
        UserID = Convert.ToInt32(Session["UserID"].ToString());
       
        var isVerifiedByAdmin = (bool)Session["isVerifiedByAdmin"];
        if (!isVerifiedByAdmin)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                "alert('Your account is not verified by administrator.');window.location='" + Request.ApplicationPath + "default.aspx';", true);
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        try
        {
            var declaretion_data = db.declaration_master.Where(x => x.universityId == universityID).FirstOrDefault();
            lbl_heading.Text = declaretion_data.header_description;
            lbl_description.Text = declaretion_data.statement_description;

            var applicnat_response = db.ec_applicant_declaration_master.Where(x => x.applicantid == UserID && x.universityid == universityID).FirstOrDefault();
            if (applicnat_response != null)
            {
                if (applicnat_response.is_declaration_completed == 1)
                    btnDiv.Attributes.Add("style", "display:none;");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_yes_Click(object sender, EventArgs e)
    {
        try {
            var mode = "new";
            ec_applicant_declaration_master objmapping = new ec_applicant_declaration_master();
            var data = db.ec_applicant_declaration_master.Where(x => x.universityid == universityID && x.applicantid == UserID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = UserID;
            objmapping.universityid = universityID;
            objmapping.is_declaration_completed = 1;
            objmapping.declaration_completed_date = DateTime.UtcNow;
            objmapping.activity_ip = Request.UserHostAddress; // IP adderess value

            if (mode == "new")
                db.ec_applicant_declaration_master.Add(objmapping);
            db.SaveChanges();
            Session["service5_DeclarationDoneByApplicant"] = true;
            Session["DeclarationCompleted"] = true;
            Session["DeclarationDoneByApplicant"] = true;
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_no_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            ec_applicant_declaration_master objmapping = new ec_applicant_declaration_master();
            var data = db.ec_applicant_declaration_master.Where(x => x.universityid == universityID && x.applicantid == UserID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objmapping = data;
            }
            objmapping.applicantid = UserID;
            objmapping.universityid = universityID;
            objmapping.is_declaration_completed = 0;
            objmapping.declaration_completed_date = DateTime.UtcNow;
            objmapping.activity_ip = Request.UserHostAddress; // IP adderess value
            if (mode == "new")
                db.ec_applicant_declaration_master.Add(objmapping);
            db.SaveChanges(); 
            Session["service5_DeclarationDoneByApplicant"] = true;
            Session["DeclarationCompleted"] = true;
            Session["DeclarationDoneByApplicant"] = true;
            BindGrid();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}