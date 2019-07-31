using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantfunding : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID, formId = 0;
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
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !isDeclarationCompleted)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            BindStydyOption();
            BindFamilyMember();
            BindAccommodationPlan();
            BindManageMeal();
            BindTransportChoice();
            BindTrips();
            BindEntertainment();
            PopulateFundingDetails();
        }
    }
    private void BindStydyOption()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studyoption = db.studyoptionmaster.ToList();
            ddlstudy.DataSource = studyoption;
            ddlstudy.DataTextField = "description";
            ddlstudy.DataValueField = "id";
            ddlstudy.DataBind();
            ddlstudy.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindFamilyMember()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var familymember = db.familymember.ToList();
            ddlFamilyMember.DataSource = familymember;
            ddlFamilyMember.DataTextField = "description";
            ddlFamilyMember.DataValueField = "id";
            ddlFamilyMember.DataBind();
            ddlFamilyMember.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindAccommodationPlan()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var accommodation = db.accommodationplan.ToList();
            ddlAccomdation.DataSource = accommodation;
            ddlAccomdation.DataTextField = "description";
            ddlAccomdation.DataValueField = "id";
            ddlAccomdation.DataBind();
            ddlAccomdation.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindManageMeal()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var meal = db.managemeal.ToList();
            ddlCooking.DataSource = meal;
            ddlCooking.DataTextField = "description";
            ddlCooking.DataValueField = "id";
            ddlCooking.DataBind();
            ddlCooking.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindTransportChoice()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var transport = db.transportchoice.ToList();
            ddltransportchoice.DataSource = transport;
            ddltransportchoice.DataTextField = "description";
            ddltransportchoice.DataValueField = "id";
            ddltransportchoice.DataBind();
            ddltransportchoice.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindTrips()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var trip = db.trips.ToList();
            ddlTrips.DataSource = trip;
            ddlTrips.DataTextField = "description";
            ddlTrips.DataValueField = "id";
            ddlTrips.DataBind();
            ddlTrips.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindEntertainment()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var entertainment = db.entertainment.ToList();
            ddlEntertainment.DataSource = entertainment;
            ddlEntertainment.DataTextField = "description";
            ddlEntertainment.DataValueField = "id";
            ddlEntertainment.DataBind();
            ddlEntertainment.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void PopulateFundingDetails()
    {
        try
        {
            var fundingInfo = (from fInfo in db.applicantfundingmaster
                               where fInfo.applicantid == userID && fInfo.universityid == universityID
                               select fInfo).FirstOrDefault();
            if (fundingInfo != null)
            {

                if (fundingInfo.studyoption != null)
                {
                    ddlstudy.ClearSelection();
                    ddlstudy.Items.FindByValue(fundingInfo.studyoption.ToString()).Selected = true;
                }
                if (fundingInfo.familymember != null)
                {
                    ddlFamilyMember.ClearSelection();
                    ddlFamilyMember.Items.FindByValue(fundingInfo.familymember.ToString()).Selected = true;
                }
                if (fundingInfo.accommodationplan != null)
                {
                    ddlAccomdation.ClearSelection();
                    ddlAccomdation.Items.FindByValue(fundingInfo.accommodationplan.ToString()).Selected = true;
                }
                if (fundingInfo.managemeal != null)
                {
                    ddlCooking.ClearSelection();
                    ddlCooking.Items.FindByValue(fundingInfo.managemeal.ToString()).Selected = true;
                }
                if (fundingInfo.transportchoice != null)
                {
                    ddltransportchoice.ClearSelection();
                    ddltransportchoice.Items.FindByValue(fundingInfo.transportchoice.ToString()).Selected = true;
                }
                if (fundingInfo.trips != null)
                {
                    ddlTrips.ClearSelection();
                    ddlTrips.Items.FindByValue(fundingInfo.trips.ToString()).Selected = true;
                }

                if (fundingInfo.entertainment != null)
                {
                    ddlEntertainment.ClearSelection();
                    ddlEntertainment.Items.FindByValue(fundingInfo.entertainment.ToString()).Selected = true;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }        

    protected void btn_fundingdetails_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var fundingInfo = (from fInfo in db.applicantfundingmaster
                               where fInfo.applicantid == userID && fInfo.universityid == universityID
                               select fInfo).FirstOrDefault();
            applicantfundingmaster objapplicantfunding = new applicantfundingmaster();
            if (fundingInfo != null)
            {
                mode = "update";
                objapplicantfunding = fundingInfo;
            }
            if (ddlstudy.SelectedValue != "")
            {
                objapplicantfunding.studyoption = Convert.ToInt32(ddlstudy.SelectedValue);
                objapplicantfunding.familymember = null;
            }
            if (ddlstudy.SelectedValue == "2")
            {
                if (ddlFamilyMember.SelectedValue != "")
                {
                    objapplicantfunding.familymember = Convert.ToInt32(ddlFamilyMember.SelectedValue);
                }
            }
            if (ddlAccomdation.SelectedValue != "")
            {
                objapplicantfunding.accommodationplan = Convert.ToInt32(ddlAccomdation.SelectedValue);
            }

            if (ddlCooking.SelectedValue != "")
            {
                objapplicantfunding.managemeal = Convert.ToInt32(ddlCooking.SelectedValue);
            }
            if (ddltransportchoice.SelectedValue != "")
            {
                objapplicantfunding.transportchoice = Convert.ToInt32(ddltransportchoice.SelectedValue);
            }

            if (ddlTrips.SelectedValue != "")
            {
                objapplicantfunding.trips= Convert.ToInt32(ddlTrips.SelectedValue);
            }
            if (ddlEntertainment.SelectedValue != "")
            {
                objapplicantfunding.entertainment = Convert.ToInt32(ddlEntertainment.SelectedValue);
            }


            objapplicantfunding.applicantid = userID;
            objapplicantfunding.universityid = universityID;
            if (mode == "new")
                db.applicantfundingmaster.Add(objapplicantfunding);
            db.SaveChanges();
            
            

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}