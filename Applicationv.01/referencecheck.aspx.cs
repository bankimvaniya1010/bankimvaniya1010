using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class referencecheck : System.Web.UI.Page
{
    string referenceKey = "";
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = String.Empty;
    public string lblfirstname = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if ((Request.QueryString["referncekey"] != null) && (Request.QueryString["referncekey"] != ""))
            referenceKey = Convert.ToString(Request.QueryString["referncekey"]);
        else
            Response.Redirect(webURL + "error.aspx", true);

        if (!IsPostBack) {
                        
            var RefInfo = (from pInfo in db.applicantreferencecheck
                           where pInfo.referncekey == referenceKey
                           select pInfo).FirstOrDefault();

            if (RefInfo == null)
                Response.Redirect(webURL + "error.aspx", true);
            else
            {
                if (RefInfo.isverified == 1)
                {
                    message.Visible = true;
                    button.Visible = false;
                    confirmation.Visible = false;
                }
                else
                {
                    confirmation.Visible = true;
                    button.Visible = true;
                }
            }
            var applicantdetail = db.applicantdetails.Where(x => x.applicantid == RefInfo.applicantid && x.universityid == RefInfo.universityid).Select(x => new { x.firstname }).FirstOrDefault();
            lblfirstname = applicantdetail.firstname;
        }
    }
    
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var RefInfo = (from pInfo in db.applicantreferencecheck
                           where pInfo.referncekey == referenceKey
                           select pInfo).FirstOrDefault();
            applicantreferencecheck objapplicantreferencecheck = new applicantreferencecheck();
            if (RefInfo != null)
            {
                mode = "update";
                objapplicantreferencecheck = RefInfo;
            }

            objapplicantreferencecheck.howlongyouknow_refereesponse = txtquestion1.Value;
            objapplicantreferencecheck.describeskill_refereesponse = txtquestion2.Value;
            objapplicantreferencecheck.greateststrength_refereesponse = txtquestion3.Value;
            objapplicantreferencecheck.whyyouchoosetoreferthisstudent_refereesponse = txtquestion4.Value;
            objapplicantreferencecheck.isverified = 1;
            objapplicantreferencecheck.referenceverifiedtime = DateTime.Now;
            if (mode == "new")
                db.applicantreferencecheck.Add(objapplicantreferencecheck);
            db.SaveChanges();
            lblMessages.Visible = true;
            button.Visible = false;
            confirmation.Visible = false;
        }
       
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}