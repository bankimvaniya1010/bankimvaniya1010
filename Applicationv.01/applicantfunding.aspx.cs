using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantfunding : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0, universityID, formId = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
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
            allQuestions = objCom.FaqQuestionList();
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

            ddlFamilyAdult.DataSource = familymember;
            ddlFamilyAdult.DataTextField = "description";
            ddlFamilyAdult.DataValueField = "id";
            ddlFamilyAdult.DataBind();
            ddlFamilyAdult.Items.Insert(0, lst);

            ddlFamilyChildren.DataSource = familymember;
            ddlFamilyChildren.DataTextField = "description";
            ddlFamilyChildren.DataValueField = "id";
            ddlFamilyChildren.DataBind();
            ddlFamilyChildren.Items.Insert(0, lst);
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
                    hidAccomdation.Value = fundingInfo.accommodationplan.ToString();
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

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetAccommodationOptions()
    {
        GTEEntities db1 = new GTEEntities();
        var temp = db1.accommodationplan.Select(x => new { x.id, x.description }).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    protected void btnCalculateCosts_Click(object sender, EventArgs e)
    {
        var studyWithChoice = ddlstudy.SelectedItem;
        var noOfAdultFamilyMember = 0;
        var noOfChildFamilyMember = 0;
        if (studyWithChoice.Text.Contains("Family"))
        {
            noOfAdultFamilyMember = Convert.ToInt32(ddlFamilyAdult.SelectedValue);
            noOfChildFamilyMember = Convert.ToInt32(ddlFamilyChildren.SelectedValue);
        }

        var accomdationSelection = Convert.ToInt32(hidAccomdation.Value);
        var mealsSelection = Convert.ToInt32(ddlCooking.SelectedValue);
        var transportSelection = Convert.ToInt32(ddltransportchoice.SelectedValue);
        var tripsSelection = Convert.ToInt32(ddlTrips.SelectedValue);
        var entertainmentSelection = Convert.ToInt32(ddlEntertainment.SelectedValue);

        try
        {
            var applicationDetails = db.applicationmaster.Where(x => x.applicantid == userID && x.universityid == universityID && x.preferenceid == 1)
                                                         .Select(s => new { courseId = s.course.Value, cityId = s.city.Value }).FirstOrDefault();
            var cityId = applicationDetails.cityId;
            var courseId = applicationDetails.courseId;

            // Pending to get other education cost from course master
            //var other_educationCost = 54643;/*db.coursemaster
            //                              .Where(x => x.accomdationid == accomdationSelection && x.cityid == cityId && x.currencyid == currencyId)
            //                              .Select(s => s.amount).FirstOrDefault();*/

            var tutionFeeCost = db.coursemaster.Where(x => x.courseid == courseId).Select(x => x.coursefee).FirstOrDefault();
            if (tutionFeeCost == null)
                Response.Redirect("default.aspx", true);

            var accomdationDetails = db.manageaccomdationplan.Where(x => x.accomdationid == accomdationSelection && x.cityid == cityId)
                                       .Select(s => new { s.amount, s.currencyid, adult_percentage = s.extra_adult_percentage.HasValue ? (s.extra_adult_percentage.Value / 100) : 0m, child_percentage = s.extra_child_percentage.HasValue ? (s.extra_child_percentage.Value / 100) : 0m })
                                       .FirstOrDefault();

            var mealsCostDetails = db.managemealplan.Where(x => x.mealid == mealsSelection && x.cityid == cityId)
                                     .Select(s => new { s.amount, adult_percentage = s.extra_adult_percentage.HasValue ? (s.extra_adult_percentage.Value / 100) : 0m, child_percentage = s.extra_child_percentage.HasValue ? (s.extra_child_percentage.Value / 100) : 0m })
                                     .FirstOrDefault();

            var transportationCostDetails = db.managetransportchoice.Where(x => x.transportchoice == transportSelection && x.cityid == cityId)
                                              .Select(s => new { s.amount, adult_percentage = s.extra_adult_percentage.HasValue ? (s.extra_adult_percentage.Value / 100) : 0m, child_percentage = s.extra_child_percentage.HasValue ? (s.extra_child_percentage.Value / 100) : 0m })
                                              .FirstOrDefault();

            var tripsCostDetails = db.managetrips.Where(x => x.tripid == tripsSelection && x.cityid == cityId)
                                     .Select(s => new { s.amount, adult_percentage = s.extra_adult_percentage.HasValue ? (s.extra_adult_percentage.Value / 100) : 0m, child_percentage = s.extra_child_percentage.HasValue ? (s.extra_child_percentage.Value / 100) : 0m })
                                     .FirstOrDefault();

            var entertainmentCostDetails = db.manageentertainment.Where(x => x.entertainmentid == entertainmentSelection && x.cityid == cityId)
                                             .Select(s => new { amount = s.amount.Value, adult_percentage = s.extra_adult_percentage.HasValue ? (s.extra_adult_percentage.Value / 100) : 0m, child_percentage = s.extra_child_percentage.HasValue ? (s.extra_child_percentage.Value / 100) : 0m })
                                             .FirstOrDefault();

            var utilitiesCostDetails = db.manageutilities.Where(x => x.cityid == cityId)
                                         .Select(s => new { amount = s.amount.Value, adult_percentage = s.extra_adult_percentage.HasValue ? (s.extra_adult_percentage.Value / 100) : 0m, child_percentage = s.extra_child_percentage.HasValue ? (s.extra_child_percentage.Value / 100) : 0m })
                                         .FirstOrDefault();

            var healthCostDetails = db.managehealth_insurance.Where(x => x.cityid == cityId).Select(s => new { s.amount, child_insurance = s.extra_child_amount.Value, extra_adult_insurance = s.extra_adult_amount.Value }).FirstOrDefault();
            var visaCostDetails = db.managevisa.Where(x => x.cityid == cityId).Select(s => new { s.amount, child_visa = s.extra_adult_amount.Value, extra_adult_visa = s.extra_child_amount.Value }).FirstOrDefault();

            var currencyDetails = db.currency_master.Where(x => x.id == accomdationDetails.currencyid).Select(x => new { symbol = x.currency_symbol, code = x.currency_code }).FirstOrDefault();
            var accomdationCost = accomdationDetails.amount;
            var mealsCost = mealsCostDetails.amount;
            var transportationCost = transportationCostDetails.amount;
            var tripsCost = tripsCostDetails.amount;
            var entertainmentCost = entertainmentCostDetails.amount;
            var utilitiesCost = utilitiesCostDetails.amount;

            var healthCost = healthCostDetails.amount;
            var visaCost = visaCostDetails.amount;

            var living_expenses = accomdationCost + mealsCost + transportationCost + tripsCost + entertainmentCost + utilitiesCost + healthCost + visaCost;

            if (studyWithChoice.Text.Contains("Family"))
            {
                accomdationCost = accomdationCost + (accomdationCost * noOfAdultFamilyMember * accomdationDetails.adult_percentage) + (accomdationCost * noOfChildFamilyMember * accomdationDetails.child_percentage);
                mealsCost = mealsCost + (mealsCost * noOfAdultFamilyMember * mealsCostDetails.adult_percentage) + (mealsCost * noOfChildFamilyMember * mealsCostDetails.child_percentage);
                transportationCost = transportationCost + (transportationCost * noOfAdultFamilyMember * transportationCostDetails.adult_percentage) + (transportationCost * noOfChildFamilyMember * transportationCostDetails.child_percentage);
                tripsCost = tripsCost + (tripsCost * noOfAdultFamilyMember * tripsCostDetails.adult_percentage) + (tripsCost * noOfChildFamilyMember * tripsCostDetails.child_percentage);
                entertainmentCost = entertainmentCost + (entertainmentCost * noOfAdultFamilyMember * entertainmentCostDetails.adult_percentage) + (entertainmentCost * noOfChildFamilyMember * entertainmentCostDetails.child_percentage);
                utilitiesCost = utilitiesCost + (utilitiesCost * noOfAdultFamilyMember * utilitiesCostDetails.adult_percentage) + (utilitiesCost * noOfChildFamilyMember * utilitiesCostDetails.child_percentage);

                healthCost = healthCost + (noOfAdultFamilyMember * healthCostDetails.extra_adult_insurance) + (noOfChildFamilyMember * healthCostDetails.child_insurance);
                visaCost = visaCost + (noOfAdultFamilyMember * visaCostDetails.extra_adult_visa) + (noOfChildFamilyMember * visaCostDetails.child_visa);

                living_expenses = accomdationCost + mealsCost + transportationCost + tripsCost + entertainmentCost + utilitiesCost + healthCost + visaCost;
            }

            tution_fee.InnerText = currencyDetails.symbol + Math.Round(tutionFeeCost.Value, 0).ToString();
            accomodation_cost.InnerText = currencyDetails.symbol + Math.Round(accomdationCost, 0).ToString();
            meals_cost.InnerText = currencyDetails.symbol + Math.Round(mealsCost, 0).ToString();
            transportation_cost.InnerText = currencyDetails.symbol + Math.Round(transportationCost, 0).ToString();
            trips_cost.InnerText = currencyDetails.symbol + Math.Round(tripsCost, 0).ToString();
            entertainment_cost.InnerText = currencyDetails.symbol + Math.Round(entertainmentCost, 0).ToString();
            utilities_cost.InnerText = currencyDetails.symbol + Math.Round(utilitiesCost, 0).ToString();
            health_insurance_cost.InnerText = currencyDetails.symbol + Math.Round(healthCost, 0).ToString();
            visa_cost.InnerText = currencyDetails.symbol + Math.Round(visaCost, 0).ToString();

            living_cost.InnerText = currencyDetails.symbol + Math.Round(living_expenses, 0).ToString();
            living_cost1.InnerText = living_cost.InnerText;
            grand_total.InnerText = currencyDetails.symbol + Math.Round(tutionFeeCost.Value + living_expenses, 0).ToString();
            hidCurrency.Value = currencyDetails.code + currencyDetails.symbol;
            hidAmount.Value = Math.Round(tutionFeeCost.Value + living_expenses, 0).ToString();
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

        cost.Style.Remove("display");
        funding.Style.Remove("display");
    }
}