using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantvisa : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID , formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !GlobalVariables.isDeclarationDoneByApplicant)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        CustomControls = objCom.CustomControlist(formId, universityID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            objCom.BindCountries(ddlCountry);
            BindVisaType();
            PopulateVisaInfo();           
        }
    }

    private void BindVisaType()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var visatype = db.visatype.ToList();
            ddlVisa.DataSource = visatype;
            ddlVisa.DataTextField = "description";
            ddlVisa.DataValueField = "id";
            ddlVisa.DataBind();
            ddlVisa.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulateVisaInfo()
    {
        try
        {
            var VisaInfo = (from pInfo in db.applicantvisadetails
                            where pInfo.applicantid == userID && pInfo.universityid == universityID
                            select pInfo).FirstOrDefault();
            if (VisaInfo != null)
            {
                if (VisaInfo.hasvisa == 1)
                {
                    rbtnYes.Checked = true;
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
                }


                else if (VisaInfo.hasvisa == 2)
                {
                    rbtnNo.Checked = true;
                    if (VisaInfo.visaapplied == 1)
                        VisaApplicationYes.Checked = true;
                    else if (VisaInfo.visaapplied == 2)
                    {
                        VisaApplicationNo.Checked = true;
                        txtCity.Value = VisaInfo.city;
                        if (VisaInfo.country != null)
                        {
                            ddlCountry.ClearSelection();
                            ddlCountry.Items.FindByValue(VisaInfo.country).Selected = true;
                        }
                    }
                }

                if (VisaInfo.havelivedearlier == 1)
                    rblLivedBeforeYes.Checked = true;
                else if (VisaInfo.havelivedearlier == 2)
                    rblLivedBeforeNo.Checked = true;
                if (VisaInfo.haveparent == 1)
                    rblParentYes.Checked = true;
                else if (VisaInfo.haveparent == 2)
                    rblParentNo.Checked = true;
                if (VisaInfo.isvisadenied == 1)
                    rblRefuseYes.Checked = true;
                else if (VisaInfo.isvisadenied == 2)
                    rblRefuseNo.Checked = true;
                if (VisaInfo.isparentvisadenied == 1)
                    rblParentRefuseYes.Checked = true;
                else if (VisaInfo.isparentvisadenied == 2)
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
            var mode = "new";
            var VisaInfo = (from pInfo in db.applicantvisadetails
                            where pInfo.applicantid == userID && pInfo.universityid == universityID
                            select pInfo).FirstOrDefault();           
            applicantvisadetails objVisa = new applicantvisadetails();
            if (VisaInfo != null)
            {
                mode = "update";
                objVisa = VisaInfo;
            }
            if (rbtnYes.Checked == true)
            {
                objVisa.hasvisa = 1;
                if (ddlVisa.SelectedValue != "")
                {
                    objVisa.applicantvisatype = ddlVisa.SelectedValue;
                }
                objVisa.validityfrom = Convert.ToDateTime(txtValidityFrom.Value);
                objVisa.validityto = Convert.ToDateTime(txtValidityTo.Value);
                objVisa.visano = txtVisano.Value;
                objVisa.firstvisit = Convert.ToDateTime(txtFirstVisit.Value);
               
            }
            else if (rbtnNo.Checked == true)                
            {
                objVisa.hasvisa = 2;
                objVisa.applicantvisatype = "";
                objVisa.validityfrom = null;
                objVisa.validityto = null;
                objVisa.firstvisit = null;

                if (VisaApplicationNo.Checked)
                {
                    objVisa.visaapplied = 2;
                    objVisa.city = txtCity.Value;
                    if (ddlCountry.SelectedValue != "")
                    {
                        objVisa.country = ddlCountry.SelectedValue;
                    }
                }
                else if (VisaApplicationYes.Checked)
                {
                    objVisa.visaapplied = 1;
                    objVisa.city = "";
                    objVisa.country = "";
                }
                                 
                    
            }                    
                
            if (rblLivedBeforeYes.Checked)
                objVisa.havelivedearlier = 1;
            else if (rblLivedBeforeNo.Checked)
                objVisa.havelivedearlier = 2;

            if (rblParentYes.Checked)
                objVisa.haveparent = 1;
            else if (rblParentNo.Checked)
                objVisa.haveparent = 2;

            if (rblRefuseYes.Checked)
                objVisa.isvisadenied = 1;
            else if (rblRefuseNo.Checked)
                objVisa.isvisadenied = 2;

            if (rblParentRefuseYes.Checked)
                objVisa.isparentvisadenied = 1;
            else if (rblParentRefuseNo.Checked)
                objVisa.isparentvisadenied = 2;
           
            objVisa.applicantid = userID;
            objVisa.universityid = universityID;
            if (mode == "new")
               db.applicantvisadetails.Add(objVisa);            
            db.SaveChanges();
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
   
}