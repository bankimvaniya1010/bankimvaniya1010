using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visadetail : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        if (!IsPostBack)
        {
            PopulateVisaInfo();
        }
    }

    private void PopulateVisaInfo()
    {
        var VisaInfo = (from pInfo in db.applicantvisadetails
                        where pInfo.applicantid == userID
                        select pInfo).FirstOrDefault();
        if (VisaInfo != null)
        {
            if (VisaInfo.hasvisa == 1)
                rbtnYes.Checked = true;
            else
                rbtnNo.Checked = true;
            if (VisaInfo.applicantvisatype != null)
            {
                ddlVisa.ClearSelection();
                ddlVisa.Items.FindByValue(VisaInfo.applicantvisatype).Selected = true;
            }
        }

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        var VisaInfo = (from pInfo in db.applicantvisadetails
                        where pInfo.applicantid == userID
                        select pInfo).FirstOrDefault();
        applicantvisadetails objVisa = new applicantvisadetails();
        if (VisaInfo == null)
        {
            if (rbtnYes.Checked == true)
                objVisa.hasvisa = 1;
            else
                objVisa.hasvisa = 0;
            objVisa.applicantvisatype = ddlVisa.SelectedValue;
            objVisa.applicantid = userID;
            db.applicantvisadetails.Add(objVisa);
        }
        else
        {
            if (rbtnYes.Checked == true)
                VisaInfo.hasvisa = 1;
            else
                VisaInfo.hasvisa = 0;
            VisaInfo.applicantvisatype = ddlVisa.SelectedValue;
        }
        db.SaveChanges();
    }
}