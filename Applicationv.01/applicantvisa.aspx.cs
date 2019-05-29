using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantvisa : System.Web.UI.Page
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
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            PopulateVisaInfo();
        }
    }

    private void PopulateVisaInfo()
    {
        try
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
                if (VisaInfo.validityfrom != null)
                    txtValidityFrom.Value = Convert.ToDateTime(VisaInfo.validityfrom).ToString("yyyy-MM-dd");
                if (VisaInfo.validityto != null)
                    txtValidityTo.Value = Convert.ToDateTime(VisaInfo.validityto).ToString("yyyy-MM-dd");
                txtVisano.Value = VisaInfo.visano;
                if (VisaInfo.firstvisit != null)
                    txtFirstVisit.Value = Convert.ToDateTime(VisaInfo.firstvisit).ToString("yyyy-MM-dd");
                txtCity.Value = VisaInfo.city;
                if (VisaInfo.visaapplied == 1)
                    VisaApplicationYes.Checked = true;
                else
                    VisaApplicationNo.Checked = true;
                if (VisaInfo.country != null)
                {
                    ddlCountry.ClearSelection();
                    ddlCountry.Items.FindByValue(VisaInfo.country).Selected = true;
                }
                if (VisaInfo.havelivedearlier == 1)
                    rblLivedBeforeYes.Checked = true;
                else
                    rblLivedBeforeNo.Checked = true;
                if (VisaInfo.haveparent == 1)
                    rblParentYes.Checked = true;
                else
                    rblParentNo.Checked = true;
                if (VisaInfo.isvisadenied == 1)
                    rblRefuseYes.Checked = true;
                else
                    rblRefuseNo.Checked = true;
                if (VisaInfo.isparentvisadenied == 1)
                    rblParentRefuseYes.Checked = true;
                else
                    rblParentRefuseNo.Checked = true;

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            applicantvisadetails objVisa = new applicantvisadetails();
            var VisaInfo = (from pInfo in db.applicantvisadetails
                            where pInfo.applicantid == userID
                            select pInfo).FirstOrDefault();
            if (VisaInfo != null)
            {
                if (rbtnYes.Checked == true)
                    VisaInfo.hasvisa = 1;
                else
                    VisaInfo.hasvisa = 2;
                if (ddlVisa.SelectedValue != "")
                {
                    VisaInfo.applicantvisatype = ddlVisa.SelectedValue;
                }
                VisaInfo.validityfrom = Convert.ToDateTime(txtValidityFrom.Value);
                VisaInfo.validityto = Convert.ToDateTime(txtValidityTo.Value);
                VisaInfo.firstvisit = Convert.ToDateTime(txtFirstVisit.Value);

                VisaInfo.city = txtCity.Value;
                if (VisaApplicationYes.Checked)
                    VisaInfo.visaapplied = 1;
                else
                    VisaInfo.visaapplied = 2;
                if (ddlCountry.SelectedValue != "")
                {
                    VisaInfo.country = ddlCountry.SelectedValue;
                }
                if (rblLivedBeforeYes.Checked)
                    VisaInfo.havelivedearlier = 1;
                else
                    VisaInfo.havelivedearlier = 2;

                if (rblParentYes.Checked)
                    VisaInfo.haveparent = 1;
                else
                    VisaInfo.haveparent = 2;
                if (rblRefuseYes.Checked)
                    VisaInfo.isvisadenied = 1;
                else
                    VisaInfo.isvisadenied = 2;
                if (rblParentRefuseYes.Checked)
                    VisaInfo.isparentvisadenied = 1;
                else
                    VisaInfo.isparentvisadenied = 2;


            }
            else
            {

                if (rbtnYes.Checked == true)
                    objVisa.hasvisa = 1;
                else
                    objVisa.hasvisa = 2;
                if (ddlVisa.SelectedValue != "")
                {
                    objVisa.applicantvisatype = ddlVisa.SelectedValue;
                }
                objVisa.validityfrom = Convert.ToDateTime(txtValidityFrom.Value);
                objVisa.validityto = Convert.ToDateTime(txtValidityTo.Value);
                objVisa.firstvisit = Convert.ToDateTime(txtFirstVisit.Value);

                objVisa.city = txtCity.Value;
                if (VisaApplicationYes.Checked)
                    objVisa.visaapplied = 1;
                else
                    objVisa.visaapplied = 2;
                if (ddlCountry.SelectedValue != "")
                {
                    objVisa.country = ddlCountry.SelectedValue;
                }
                if (rblLivedBeforeYes.Checked)
                    objVisa.havelivedearlier = 1;
                else
                    objVisa.havelivedearlier = 2;

                if (rblParentYes.Checked)
                    objVisa.haveparent = 1;
                else
                    objVisa.haveparent = 2;
                if (rblRefuseYes.Checked)
                    objVisa.isvisadenied = 1;
                else
                    objVisa.isvisadenied = 2;
                if (rblParentRefuseYes.Checked)
                    objVisa.isparentvisadenied = 1;
                else
                    objVisa.isparentvisadenied = 2;
                objVisa.applicantid = userID;
                db.applicantvisadetails.Add(objVisa);
            }
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}