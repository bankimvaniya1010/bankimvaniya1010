using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.Entity.Validation;

public partial class financial : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string NameOFInstitue = "NAME OF FINANCIAL INSTITUTION";
    protected string BranchAddress = "BRANCH ADDRESS";
    protected string PhoneNumber = "PHONE NUMBER";
    protected string ManagerName = "BRANCH MANAGER'S NAME";
    protected string ManagerMobile = "MANAGER MOBILE NO";
    protected string ManagerPhone = "MANAGER PHONE NUMBER";
    protected string TypeOFFunds = "TYPE OF FUNDS";
    protected string AccountHolderName = "ACCOUNT HOLDER NAME";
    protected string Relations = "RELATIONSHIP TO THE APPLICANT";
    protected string AccountNo = "ACCOUNT NUMBER";
    protected string AccountOpeningDate = "ACCOUNT OPENING DATE";
    protected string AccountBalance = "ACCOUNT BALANCE IN INR";
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        ApplicantID = Convert.ToInt32(Session["Applicant"].ToString());
        if (!IsPostBack)
        {
            GetSecondaryFieldname();
            BindFinancialDetails(ApplicantID);

        }

    }
    private void BindFinancialDetails(int ApplicantID)
    {
        var fncDetails = (from eInfo in db.financial_support_details
                          where eInfo.applicantid == ApplicantID
                          select eInfo).ToList();
        grdLoans.DataSource = fncDetails;
        grdLoans.DataBind();
    }
    protected void btnFinancial_Click(object sender, EventArgs e)
    {
        string accountopeningDate = "";
        accountopeningDate = txtAccountopeningdate.Value;
        financial_support_details objFinance = new financial_support_details();
        try
        {
            objFinance.accountbalance = Convert.ToDecimal(txtBalanceAmount.Value);
            objFinance.accountholdername = txtAccountHolderName.Value;
            objFinance.accountno = txtAccountno.Value;
            objFinance.accountopeningDate = Convert.ToDateTime(accountopeningDate);
            objFinance.address = txtBranchAddress.Value;
            objFinance.applicantid = ApplicantID;
            objFinance.branch_manager_contactno = txtManagerPhoneNo.Value;
            objFinance.branch_manager_mobile = txtManagerMobile.Value;
            objFinance.branch_manager_name = txtManagerName.Value;
            objFinance.contact_no = txtBranchPhone.Value;
            objFinance.financial_intstitue_name = txtFinancialName.Value;
            objFinance.relationship = txtRelationshipWithApplicant.Value;
            objFinance.typeoffunds = txtFundType.Value;
            db.financial_support_details.Add(objFinance);
            db.SaveChanges();
        }
        catch (DbEntityValidationException ex)
        {
            foreach (var eve in ex.EntityValidationErrors)
            {
                Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                }
            }
            throw;
        }
        BindFinancialDetails(ApplicantID);

    }
    private void GetSecondaryFieldname()
    {
        string SecondaryLanguage = "";
        if (Session["SecondaryLang"] == null)
        {
           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Secondary Language')", true);
          //  Response.Redirect("default.aspx");
        }
        else
        {
            SecondaryLanguage = Session["SecondaryLang"].ToString();
            var SecondaryField = (from am in db.applicantformmaster
                                  join pm in db.primaryfieldmaster on am.primaryfieldid equals pm.primaryfieldid
                                  where (am.secondaryfieldnamelanguage == SecondaryLanguage) && (am.formname == 7)

                                  select new
                                  {
                                      id = am.id,
                                      fieldnameinstructions = am.fieldnameinstructions,
                                      secondaryfieldnameinstructions = am.secondaryfieldnameinstructions,
                                      primaryfieldname = pm.primaryfiledname,
                                      secondaryfieldnamelanguage = am.secondaryfieldnamelanguage,
                                      secondaryfielddnamevalue = am.secondaryfielddnamevalue

                                  }).ToList();
            // var    am =  db.applicantformmaster.Where(x => x.secondaryfieldnamelanguage == SecondaryLanguage && x.formname == 1).ToList();
            for (int k = 0; k < SecondaryField.Count; k++)
            {


                switch (SecondaryField[k].primaryfieldname.ToString())
                {

                    case "NAME OF FINANCIAL INSTITUTION":
                        NameOFInstitue = SecondaryField[k].secondaryfielddnamevalue == "" ? NameOFInstitue : NameOFInstitue + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "BRANCH ADDRESS":
                        BranchAddress = SecondaryField[k].secondaryfielddnamevalue == "" ? BranchAddress : BranchAddress + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "PHONE NUMBER":
                        PhoneNumber = SecondaryField[k].secondaryfielddnamevalue == "" ? PhoneNumber : PhoneNumber + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "BRANCH MANAGER'S NAME":
                        ManagerName = SecondaryField[k].secondaryfielddnamevalue == "" ? ManagerName : ManagerName + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MANAGER MOBILE NO":
                        ManagerMobile = SecondaryField[k].secondaryfielddnamevalue == "" ? ManagerMobile : ManagerMobile + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "MANAGER PHONE NUMBER":
                        ManagerPhone = SecondaryField[k].secondaryfielddnamevalue == "" ? ManagerPhone : ManagerPhone + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "TYPE OF FUNDS":
                        TypeOFFunds = SecondaryField[k].secondaryfielddnamevalue == "" ? TypeOFFunds : TypeOFFunds + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ACCOUNT HOLDER NAME":
                        AccountHolderName = SecondaryField[k].secondaryfielddnamevalue == "" ? AccountHolderName : AccountHolderName + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "RELATIONSHIP TO THE APPLICANT":
                        Relations = SecondaryField[k].secondaryfielddnamevalue == "" ? Relations : Relations + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ACCOUNT NUMBER":
                        AccountNo = SecondaryField[k].secondaryfielddnamevalue == "" ? AccountNo : AccountNo + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ACCOUNT OPENING DATE":
                        AccountOpeningDate = SecondaryField[k].secondaryfielddnamevalue == "" ? AccountOpeningDate : AccountOpeningDate + "(" + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;
                    case "ACCOUNT BALANCE IN INR":
                        AccountBalance = SecondaryField[k].secondaryfielddnamevalue == "" ? AccountBalance : AccountBalance + "( " + SecondaryField[k].secondaryfielddnamevalue + ")";
                        break;

                    default:
                        //Response.Redirect(webURL + "login.aspx");
                        break;
                }

            }

        }
    }
}