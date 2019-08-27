using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visaprefill : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string noofpeopleincluded = "";
    protected string applyingfor = "";
    protected string familyname = "";
    protected string givenname = "";
    protected int knownbyanothername = 0;
    protected string anotherfamilyname = "";
    protected string anothergivenname = "";
    protected string ownlanguagename1 = "";
    protected string ownlanguagename2 = "";
    protected string gender = "";
    protected DateTime dateofbirth = new DateTime();
    protected string cityofbirth = "";
    protected string countryofbirth = "";
    protected string maritalstatus = "";
    protected string countryofcitizenship = "";
    protected string holdothercitizenship = "";
    protected string anothercountryofcitizenship = "";
    protected int havepassport = 0;
    protected string passportno = "";
    protected string countryofpassport = "";
    protected DateTime dateofissue = new DateTime();
    protected DateTime dateofexpiry = new DateTime();
    protected string placeofissue = "";
    protected string applicableidentificationno = "";
    protected string anotherIdentitytype1 = "";
    protected string anotherIdentityNo1 = "";
    protected string anotherIdentitytype2 = "";
    protected string anotherIdentityNo2 = "";
    protected string residencecountry = "";
    protected string residenceaddressLine1 = "";
    protected string residenceaddressLine2 = "";
    protected string residenceaddresspostalcode = "";
    protected string officehoursContactNoOutsideaustralia = "";
    protected string afterhoursContactNoOutsideaustralia = "";
    protected string australiaresidentialaddline1 = "";
    protected string australiaresidentialaddline2 = "";
    protected string australiaresidentialpostalcode = "";
    protected string officehrContactNoInAustralia = "";
    protected string afterhrContactNoInAustralia = "";
    protected string correspondenceaddressline1 = "";
    protected string correspondenceaddressline2 = "";
    protected string correspondenceaddresspoastalcode = "";
    protected int agreetocommunicate = 0;
    protected string faxno = "";
    protected string emailaddress = "";
    protected int applicationentrolledinschool = 0;
    protected int solelegalrights = 0;
    protected string guardiansfamilyname = "";
    protected string guardiansgivenname = "";
    protected string guardiansresidentialaddress = "";
    protected string guardianspostalcode = "";
    protected string guardianscontactnumber = "";
    protected string guardiansrealtionwithstudent = "";
    protected string guardiansnatureoflegalrights = "";
    protected Nullable<int> guardiansstatutorydeclartion = null;
    protected string guardiansfamilyname1 = "";
    protected string guardiansgivenname1 = "";
    protected string guardiansresidentialaddress1 = "";
    protected string guardianspostalcode1 = "";
    protected string guardianscontactnumber1 = "";
    protected string guardiansrealtionwithstudent1 = "";
    protected string guardiansnatureoflegalrights1 = "";
    protected Nullable<int> guardiansstatutorydeclartion1 = null;
    protected Nullable<int> subjectofcourtorder = null;
    protected Nullable<int> appliesforAustalianvisa = null;
    protected Nullable<int> currentlyholdaustralianvisa = null;
    protected Nullable<int> awaitingforaustralianvisa = null;
    protected string nameonvisa = "";
    protected string typeofvisa = "";
    protected string placeofissuevisa = "";
    protected DateTime dateissuevisa = new DateTime();
    protected Nullable<int> applicationrefusedorgranted = null;
    protected string grantedvisalabelno = "";
    protected string visagrantnumber = "";
    protected string nameonvisa1 = "";
    protected string typeofvisa1 = "";
    protected string placeofissuevisa1 = "";
    protected DateTime dateissuevisa1 = new DateTime();
    protected string applicationrefusedorgranted1 = "";
    protected string grantedvisalabelno1 = "";
    protected string visagrantnumber1 = "";
    protected Nullable<int> applyingfortype = null;
    protected Nullable<int> partB = null;
    protected Nullable<int> applyinginaustralia = null;
    protected Nullable<int> docurrentlyholdstudentvisa = null;
    protected string highestqualification = "";
    protected string nameofeducationprovider1 = "";
    protected string nameofeducationprovider2 = "";
    protected string addressofeducationprovider = "";
    protected string educationproviderpostalcode = "";
    protected DateTime commencementdate = new DateTime();
    protected DateTime finishdate = new DateTime();
    protected Nullable<int> educationdocumentattached = null;
    protected string otherundertakcoursename1 = "";
    protected string othernameofeducationprovider1 = "";
    protected string othernameofeducationprovider2 = "";
    protected string otheraddressofeducationprovider1 = "";
    protected string othereduproviderpostalcode1 = "";
    protected DateTime othercommencementdate1 = new DateTime();
    protected DateTime otherfinishdate1 = new DateTime();
    protected Nullable<int> otherdocumentattached1 = null;
    protected string otherundertakcoursename2 = "";
    protected string othernameofeducationprovider21 = "";
    protected string othernameofeducationprovider22 = "";
    protected string otheraddressofeducationprovider2 = "";
    protected string othereduproviderpostalcode2 = "";
    protected DateTime othercommencementdate2 = new DateTime();
    protected DateTime otherfinishdate2 = new DateTime();
    protected Nullable<int> otherdocumentattached2 = null;
    protected Nullable<int> ispreviouslystudiedinaustralia = null;
    protected string previouslycoursename = "";
    protected string previouslycourseeducationproviderName = "";
    protected DateTime previouslycourseDateFrom = new DateTime();
    protected DateTime previouslycourseDateTo = new DateTime();
    protected string previouslycoursename1 = "";
    protected string previouslycourseeducationproviderName1 = "";
    protected DateTime previouslycourseDateFrom1 = new DateTime();
    protected DateTime previouslycourseDateTo1 = new DateTime();
    protected string intendcoursename = "";
    protected string intendedprovidername = "";
    protected DateTime intendedcommencementdate = new DateTime();
    protected DateTime intendedfinishdate = new DateTime();
    protected Nullable<int> haveenrolment = null;
    protected Nullable<int> haveenrolmentevidence = null;
    protected string intendcoursename1 = "";
    protected string intendedprovidername1 = "";
    protected DateTime intendedcommencementdate1 = new DateTime();
    protected DateTime intendedfinishdate1 = new DateTime();
    protected Nullable<int> haveenrolment1 = null;
    protected Nullable<int> haveenrolmentevidence1 = null;
    protected string intendcoursename2 = null;
    protected string intendedprovidername2 = "";
    protected DateTime intendedcommencementdate2 = new DateTime();
    protected DateTime intendedfinishdate2 = new DateTime();
    protected Nullable<int> haveenrolment2 = null;
    protected Nullable<int> haveenrolmentevidence2 = null;
    protected Nullable<int> applicantassesmentlevel = null;
    protected Nullable<int> englishlangtest = null;
    protected string englishlangtestname = "";
    protected DateTime englishlangtestDate = new DateTime();
    protected string englishlangtestcetificateno = "";
    protected Nullable<int> studiedmorethan5yrinothercountry = null;
    protected DateTime employmenthistoryFromDate = new DateTime();
    protected DateTime employmenthistoryToDate = new DateTime();
    protected string employerInfoL0 = "";
    protected string employerInfoL1 = "";
    protected string typeofbusiness = "";
    protected string employeroccupation = "";
    protected string salarylevel = "";
    protected Nullable<int> leavingdocAttch = null;
    protected DateTime employmenthistoryFromDate1 = new DateTime();
    protected DateTime employmenthistoryToDate1 = new DateTime();
    protected string employerInfoL2 = "";
    protected string employerInfoL3 = "";
    protected string typeofbusiness1 = "";
    protected string employeroccupation1 = "";
    protected string salarylevel1 = "";
    protected Nullable<int> leavingdocAttch1 = null;
    protected Nullable<int> currentlyemployed = null;
    protected Nullable<int> ifnoThenOption = null;
    protected string otherdescription1 = "";
    protected string otherdescription2 = "";
    protected string position = "";
    protected string employername = "";
    protected string employeraddress = "";
    protected string employercontactno = "";
    protected Nullable<int> evidenceofemployement = null;
    protected Nullable<int> currentlystudentinaustralia = null;
    protected Nullable<int> joboffered = null;
    protected string kindofemployementseeking = "";
    protected string jobofferedname = "";
    protected string jobofferedaddress = "";
    protected string jobofferedcontactno = "";
    protected string titleofpositionofferef = "";
    protected string immediaterelativename = "";
    protected string immediaterelativerelationship = "";
    protected DateTime immediaterelativeDob = new DateTime();
    protected string immediaterelativeaddress = "";
    protected string immediaterelativepostalcode = "";
    protected string immediaterelativeimmigrationstatus = "";
    protected DateTime immediaterelativeDateofarrival = new DateTime();
    protected string immediaterelativename1 = "";
    protected string immediaterelativerelationship1 = "";
    protected DateTime immediaterelativeDob1 = new DateTime();
    protected string immediaterelativeaddress1 = "";
    protected string immediaterelativepostalcode1 = "";
    protected string immediaterelativeimmigrationstatus1 = "";
    protected DateTime immediaterelativedateofarrival1 = new DateTime();
    protected string closestrelativename = "";
    protected string closestrelativeaddress = "";
    protected string closestrelativerelationship = "";
    protected string closestrelativepostalcode = "";
    protected string closestrelativecontactnumber = "";
    protected Nullable<int> applyinaustraliaassecschool = null;
    protected Nullable<int> issufficientfund = null;
    protected DateTime declarationDate42 = new DateTime();
    protected Nullable<int> ifFamilyunitcompletedformpartC = null;
    protected Nullable<int> studymorethanthreemonthpartC = null;
    protected string studentnamepartC = "";
    protected string relationshiptostudentpartC = "";
    protected DateTime studentdobpartC = new DateTime();
    protected string citizenshipofstudentpartC = "";
    protected string studentaddresspartC = "";
    protected string studentaddpostalcodepartC = "";
    protected string typeofstudentvisaheldpartC = "";
    protected string assessmentlevelpartC = "";
    protected DateTime assessmentgrantdatepartC = new DateTime();
    protected DateTime assessmentexpirydatepartC = new DateTime();
    protected Nullable<int> isstudentjoiningdeclarepartC = null;
    protected Nullable<int> isstudentjoiningsatisfiedconditionpartC = null;
    protected Nullable<int> suficientfundpartC = null;
    protected Nullable<int> partD = null;
    protected Nullable<int> livedoutsidecountryc = null;
    protected string familymembername = "";
    protected string familyresidencecountry = "";
    protected DateTime familyresidenceFromdate = new DateTime();
    protected DateTime familyresidenceTodate = new DateTime();
    protected string familymembername1 = "";
    protected string familyresidencecountry1 = "";
    protected DateTime familyresidenceFromdate1 = new DateTime();
    protected DateTime familyresidenceTodate1 = new DateTime();
    protected string familymembername2 = "";
    protected string familyresidencecountry2 = "";
    protected DateTime familyresidenceFromdate2 = new DateTime();
    protected DateTime familyresidenceTodate2 = new DateTime();
    protected Nullable<int> haveworkforaustralianhospital = null;
    protected string descriptionofhospitalwork = "";
    protected Nullable<int> haveworkforaustralianpreschool = null;
    protected string descriptionofpreschoolwork = "";
    protected Nullable<int> haveanyhealthissue = null;
    protected string detailofhealthissue = "";
    protected Nullable<int> requireassistancewithmobility = null;
    protected string descriptionofmobility = "";
    protected Nullable<int> haevmedicalprocedures = null;
    protected string proceduresdescription = "";
    protected Nullable<int> havemedicalfollowup = null;
    protected string medicalfollowupdescription = "";
    protected Nullable<int> haveconvictedofcrime = null;
    protected Nullable<int> havechargeoffence = null;
    protected Nullable<int> havecriminaloffence = null;
    protected Nullable<int> haveremovedfromcountry = null;
    protected Nullable<int> havetoavoidbeingremoved = null;
    protected Nullable<int> havebeenexcluded = null;
    protected Nullable<int> havehumanrightscrime = null;
    protected Nullable<int> haverisktonationalsecurity = null;
    protected Nullable<int> haveoutstandingdebets = null;
    protected Nullable<int> haveconvictedoffence = null;
    protected Nullable<int> haveservedinmilitaryforce = null;
    protected string descripofcharacterdeclaration = null;
    protected Nullable<int> under18age = null;
    protected Nullable<int> parentsituation = null;
    protected Nullable<int> holdorappliedVisa = null;
    protected string parentfamilynamePartD = null;
    protected string parentgivennamePartD = null;
    protected DateTime parentDateofBirthpartD = new DateTime();
    protected string parentaddresspartD = null;
    protected Nullable<int> parentvisastatusPartD = null;
    protected string parentvisalabelno = null;
    protected string parentvisadigitno = null;
    protected string parentvisaperiodofstay = null;
    protected DateTime parentvisaexpirydate = new DateTime();
    protected string parentvisaappliedgovtofficename = null;
    protected Nullable<int> havearrangementwithrelative = null;
    protected string familyNameofrelative = null;
    protected string givenNameofrelative = null;
    protected DateTime dateOfBirthofrelative = new DateTime();
    protected string addressofRelative = null;
    protected string relationshipofrelative = null;
    protected Nullable<int> relativeresideasstatus = null;
    protected string permitedtostayfor = null;
    protected DateTime permitedtostayDate = new DateTime();
    protected Nullable<int> guardianvisasatus = null;
    protected string guardianvisano = null;
    protected string guardianvisaperiodofstay = null;
    protected DateTime guardianvisaperiodofstayDate = new DateTime();
    protected string govermentoffName = null;
    protected string periodofstayofguardian = null;
    protected Nullable<int> havewelfarearrangements = null;
    protected string parentsignature = null;
    protected DateTime parentsignatureDate = new DateTime();
    protected string parentFullname = null;
    protected string parentRelationshipwithstudent = null;
    protected string parentsignature1 = null;
    protected DateTime parentsignatureDate1 = new DateTime();
    protected string parentFullname1 = null;
    protected string parentRelationshipwithstudent1 = null;
    protected Nullable<int> havesolelegalrights = null;
    protected string personname = null;
    protected string personaddress = null;
    protected string personcontactno = null;
    protected string personrelationship = null;
    protected string personnatureoflegalrights = null;
    protected string parentsignatur67 = null;
    protected DateTime signDate = new DateTime();
    protected string fullname67 = null;
    protected string relationship67 = null;
    protected string parentsignatur671 = null;
    protected DateTime signDate1 = new DateTime();
    protected string fullname671 = null;
    protected string relationship671 = null;
    protected Nullable<int> havereceiveassistance = null;
    protected Nullable<int> title = null;
    protected string assistedpersonfamilyname = null;
    protected string assistedpersongivenname = null;
    protected string assistedpersonaddress = null;
    protected string assistedpersonofficeno = null;
    protected string assistedpersonmobileno = null;
    protected Nullable<int> isregisteredwithMARA = null;
    protected Nullable<int> haveeducationagent = null;
    protected string businessname = null;
    protected string registrationno = null;
    protected string educationagentaddress = null;
    protected string educationagentemail = null;
    protected string educationagentofficeno = null;
    protected string educationagentphoneno = null;
    protected string educationagentfaxno = null;
    protected Nullable<int> haveagentinaustralia = null;
    protected Nullable<int> havepaytoassistance = null;
    protected string howmuchyoupay = null;
    protected string giftgiven = null;
    protected string valueofgift = null;
    protected Nullable<int> havewrittencommunications = null;
    protected Nullable<int> haveauthorisedperson = null;
    protected Nullable<int> authorisedpersontitle = null;
    protected string authorisedpersofamilynname = null;
    protected string authorisedpersongivenname = null;
    protected string authorisedpersonaddress = null;
    protected string authorisedpersonofficeno = null;
    protected string authorisedpersonmobileno = null;
    protected Nullable<int> haveagreetocommunicate = null;
    protected string Faxnumber = null;
    protected string authorizedpersonEmailaddress = null;
    protected string signatureauthorizedperson = null;
    protected DateTime dateofsign = new DateTime();
    protected string migratioagentNo = null;
    protected string offshoreagentId = null;
    protected Nullable<int> agenttitle = null;
    protected string agentfamilyname = null;
    protected string agentgivenname = null;
    protected string agentcompanyname = null;
    protected string agenntaddress = null;
    protected string agentofficeno = null;
    protected string agentmobileno = null;
    protected Nullable<int> agentagreetocommunicate = null;
    protected string agentfaxno = null;
    protected string agentemailaddress = null;
    protected string agentsignature = null;
    protected DateTime agentsigndate = new DateTime();
    protected Nullable<int> paymentmethod = null;
    protected Nullable<int> paymentby = null;
    protected string amountinaustraliandollars = null;
    protected string creditcardno = null;
    protected DateTime creditcardexpirydate = new DateTime();
    protected string cardholdarname = null;
    protected string contactnumber = null;
    protected string addressofcardholder = null;
    protected string signatureofcardholder = null;
    protected string declarationsignature = null;
    protected DateTime declarationdate = new DateTime();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int userID = 0, universityID = 0;

    protected string aboutfamilyname1 = "";
    protected string aboutfamilygivenname1 = "";
    protected string relationshiptoyou1 = "";
    protected string citizenship1 = "";
    protected DateTime dobfamilymember1 = new DateTime();
    protected Nullable<int> isfamilymemberhavepassport1 = 0;
    protected string familypassportno1 = "";
    protected string familycountryofpassport1 = "";
    protected DateTime passportdateofissue1 = new DateTime();
    protected DateTime passportdateofexpiry1 = new DateTime();
    protected string passportplaceofissue1 = "";
    protected Nullable<int> studyinAustralia1 = 0;


    protected string aboutfamilyname2 = "";
    protected string aboutfamilygivenname2 = "";
    protected string relationshiptoyou2 = "";
    protected string citizenship2 = "";
    protected DateTime dobfamilymember2 = new DateTime();
    protected Nullable<int> isfamilymemberhavepassport2 = 0;
    protected string familypassportno2 = "";
    protected string familycountryofpassport2 = "";
    protected DateTime passportdateofissue2 = new DateTime();
    protected DateTime passportdateofexpiry2 = new DateTime();
    protected string passportplaceofissue2 = "";
    protected Nullable<int> studyinAustralia2 = 0;

    protected string aboutfamilyname3 = "";
    protected string aboutfamilygivenname3 = "";
    protected string relationshiptoyou3 = "";
    protected string citizenship3 = "";
    protected DateTime dobfamilymember3 = new DateTime();
    protected Nullable<int> isfamilymemberhavepassport3 = 0;
    protected string familypassportno3 = "";
    protected string familycountryofpassport3 = "";
    protected DateTime passportdateofissue3 = new DateTime();
    protected DateTime passportdateofexpiry3 = new DateTime();
    protected string passportplaceofissue3 = "";
    protected Nullable<int> studyinAustralia3 = 0;


    protected string aboutfamilyname4 = "";
    protected string aboutfamilygivenname4 = "";
    protected string relationshiptoyou4 = "";
    protected string citizenship4 = "";
    protected DateTime dobfamilymember4 = new DateTime();
    protected Nullable<int> isfamilymemberhavepassport4 = 0;
    protected string familypassportno4 = "";
    protected string familycountryofpassport4 = "";
    protected DateTime passportdateofissue4 = new DateTime();
    protected DateTime passportdateofexpiry4 = new DateTime();
    protected string passportplaceofissue4 = "";
    protected Nullable<int> studyinAustralia4 = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if ((Request.QueryString["id"] == null) || (Request.QueryString["id"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            userID = Convert.ToInt32(Request.QueryString["id"].ToString());
        SetVisaDetails();
        SetFamilyDetail();
    }

    private void SetVisaDetails()
    {
        var VisaInfo = (from vInfo in db.australiavisadetailmaster
                        where vInfo.applicantid == userID && vInfo.universityid == universityID
                        select vInfo).FirstOrDefault();
        if (VisaInfo != null)
        {
            noofpeopleincluded = VisaInfo.noofpeopleincluded;
            if (VisaInfo.applyingfor == 1)
                chkyourself.Checked = true;
            else if (VisaInfo.applyingfor == 2)
                chkwithfamily.Checked = true;
            else
                chkfamily.Checked = true;
            familyname = VisaInfo.familyname;
            givenname = VisaInfo.givenname;
            if (VisaInfo.knownbyanothername == 1)
                chkAnotherNameYes.Checked = true;
            else
                chkAnotherNameNo.Checked = true;
            anotherfamilyname = VisaInfo.anotherfamilyname;
            anothergivenname = VisaInfo.anothergivenname;
            ownlanguagename1 = VisaInfo.ownlanguagename1;
            ownlanguagename2 = VisaInfo.ownlanguagename2;
            if (VisaInfo.gender == 1)
                chkMale.Checked = true;
            else
                chkFemale.Checked = true;
            dateofbirth = Convert.ToDateTime(VisaInfo.dateofbirth);
            cityofbirth = VisaInfo.cityofbirth;
            if (VisaInfo.countryofbirth != null)
                countryofbirth = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.countryofbirth));
            if (VisaInfo.maritalstatus == 1)
                chkMarried.Checked = true;
            else if (VisaInfo.maritalstatus == 1)
                chkSeparated.Checked = true;
            else if (VisaInfo.maritalstatus == 2)
                chkWidowed.Checked = true;
            else if (VisaInfo.maritalstatus == 3)
                chkEngaged.Checked = true;
            else if (VisaInfo.maritalstatus == 4)
                chkDivorced.Checked = true;
            else if (VisaInfo.maritalstatus == 5)
                chkNever.Checked = true;
            else if (VisaInfo.maritalstatus == 6)
                chkDefacto.Checked = true;
            if (VisaInfo.countryofcitizenship != null)
                countryofcitizenship = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.countryofcitizenship));
            if (VisaInfo.holdothercitizenship == 0)
                chkAnotherCitizenNo.Checked = true;
            else
            {
                chkAnotherCitizenYes.Checked = true;
                if (VisaInfo.anothercountryofcitizenship != null)
                    anothercountryofcitizenship = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.anothercountryofcitizenship));
            }
            if (VisaInfo.havepassport == 0)
                chkPassposrtNo.Checked = true;
            else
                chkPassposrtYes.Checked = true;

            passportno = VisaInfo.passportno;
            if (VisaInfo.countryofpassport != null)
                countryofpassport = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.countryofpassport));

            if (VisaInfo.dateofissue != null)
                dateofissue = Convert.ToDateTime(VisaInfo.dateofissue);
            if (VisaInfo.dateofexpiry != null)
                dateofexpiry = Convert.ToDateTime(VisaInfo.dateofexpiry);
            placeofissue = VisaInfo.placeofissue;
            applicableidentificationno = VisaInfo.applicableidentificationno;
            anotherIdentitytype1 = VisaInfo.anotherIdentitytype1;
            anotherIdentityNo1 = VisaInfo.anotherIdentityNo1;
            anotherIdentitytype2 = VisaInfo.anotherIdentitytype2;
            anotherIdentityNo2 = VisaInfo.anotherIdentityNo2;
            if (VisaInfo.residencecountry != null)
                residencecountry = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.residencecountry));
            residenceaddressLine1 = VisaInfo.residenceaddressLine1; ;
            residenceaddressLine2 = VisaInfo.residenceaddressLine2; ;
            residenceaddresspostalcode = VisaInfo.residenceaddresspostalcode; ;
            officehoursContactNoOutsideaustralia = VisaInfo.officehoursContactNoOutsideaustralia; ;
            afterhoursContactNoOutsideaustralia = VisaInfo.afterhoursContactNoOutsideaustralia; ;
            australiaresidentialaddline1 = VisaInfo.australiaresidentialaddline1; ;
            australiaresidentialaddline2 = VisaInfo.australiaresidentialaddline2; ;
            australiaresidentialpostalcode = VisaInfo.australiaresidentialpostalcode; ;
            officehrContactNoInAustralia = VisaInfo.officehrContactNoInAustralia; ;
            afterhrContactNoInAustralia = VisaInfo.afterhrContactNoInAustralia; ;
            correspondenceaddressline1 = VisaInfo.correspondenceaddressline1; ;
            correspondenceaddressline2 = VisaInfo.correspondenceaddressline2; ;
            correspondenceaddresspoastalcode = VisaInfo.correspondenceaddresspoastalcode; ;
            if (VisaInfo.agreetocommunicate == 0)
                chkagreetocommunicateNo.Checked = true;
            else
                chkagreetocommunicateYes.Checked = true;
            faxno = VisaInfo.faxno; ;
            emailaddress = VisaInfo.emailaddress;
            if (VisaInfo.applicationentrolledinschool == 0)
                chkEnrollNo.Checked = true;
            else
                chkEnrolYes.Checked = true;
            if (VisaInfo.solelegalrights == 0)
                chkSoleRightNo.Checked = true;
            else
                chkSoleRightYes.Checked = true;

            guardiansfamilyname = VisaInfo.guardiansfamilyname;
            guardiansgivenname = VisaInfo.guardiansgivenname;
            guardiansresidentialaddress = VisaInfo.guardiansresidentialaddress;
            guardianspostalcode = VisaInfo.guardianspostalcode;
            guardianscontactnumber = VisaInfo.guardianscontactnumber;
            guardiansrealtionwithstudent = VisaInfo.guardiansrealtionwithstudent;
            guardiansnatureoflegalrights = VisaInfo.guardiansnatureoflegalrights;
            if (VisaInfo.guardiansstatutorydeclartion == 0)
                chkstatutory1No.Checked = true;
            else
                chkstatutory1Yes.Checked = true;
            guardiansfamilyname1 = VisaInfo.guardiansfamilyname1;
            guardiansgivenname1 = VisaInfo.guardiansgivenname1;
            guardiansresidentialaddress1 = VisaInfo.guardiansresidentialaddress1;
            guardianspostalcode1 = VisaInfo.guardianspostalcode1;
            guardianscontactnumber1 = VisaInfo.guardianscontactnumber1;
            guardiansrealtionwithstudent1 = VisaInfo.guardiansrealtionwithstudent1;
            guardiansnatureoflegalrights1 = VisaInfo.guardiansnatureoflegalrights1;
            if (VisaInfo.guardiansstatutorydeclartion1 == 0)
                chkstatutory2No.Checked = true;
            else
                chkstatutory2Yes.Checked = true;
            if (VisaInfo.subjectofcourtorder == 0)
                chkcourtorderNo.Checked = true;
            else
                chkcourtorderYes.Checked = true;
            if (VisaInfo.appliesforAustalianvisa == 0)
                chkappliesNo.Checked = true;
            else
                chkappliesYes.Checked = true;
            if (VisaInfo.currentlyholdaustralianvisa == 0)
                chkHoldNo.Checked = true;
            else
                chkHoldYes.Checked = true;
            if (VisaInfo.awaitingforaustralianvisa == 0)
                chkAwaitingNo.Checked = true;
            else
                chkAwaitingYes.Checked = true;
            nameonvisa = VisaInfo.nameonvisa;
            typeofvisa = VisaInfo.typeofvisa;
            placeofissuevisa = VisaInfo.placeofissuevisa;
            dateissuevisa = Convert.ToDateTime(dateissuevisa);
            if (VisaInfo.applicationrefusedorgranted == 0)
                chkvisa1refused.Checked = true;
            else
                chkvisa1granted.Checked = true;

            grantedvisalabelno = VisaInfo.grantedvisalabelno;
            visagrantnumber = VisaInfo.visagrantnumber;
            nameonvisa1 = VisaInfo.nameonvisa1;
            typeofvisa1 = VisaInfo.typeofvisa1;
            placeofissuevisa1 = VisaInfo.placeofissuevisa1;
            dateissuevisa1 = Convert.ToDateTime(dateissuevisa1);

            if (VisaInfo.applicationrefusedorgranted1 == 0)
                chkvisa2refused.Checked = true;
            else
                chkvisa2granted.Checked = true;
            grantedvisalabelno1 = VisaInfo.grantedvisalabelno1;
            visagrantnumber1 = VisaInfo.visagrantnumber1;
            if (VisaInfo.applyingfortype == 1)
                chkPartC.Checked = true;
            if (VisaInfo.partB == 1)
                chkPartB.Checked = true;
            if (VisaInfo.applyinginaustralia == 0)
                chkapplyingNo.Checked = true;
            else
                chkapplyingYes.Checked = true;
            if (VisaInfo.docurrentlyholdstudentvisa == 0)
                chkcurrentlyholdNo.Checked = true;
            else
                chkcurrentlyholdYes.Checked = true;

            highestqualification = VisaInfo.highestqualification;
            nameofeducationprovider1 = VisaInfo.nameofeducationprovider1;
            nameofeducationprovider2 = VisaInfo.nameofeducationprovider2;
            addressofeducationprovider = VisaInfo.addressofeducationprovider;
            educationproviderpostalcode = VisaInfo.educationproviderpostalcode;
            commencementdate = Convert.ToDateTime(VisaInfo.commencementdate);
            finishdate = Convert.ToDateTime(VisaInfo.finishdate);

            if (VisaInfo.educationdocumentattached == 0)
                chkeducationdocumentattachedNo.Checked = true;
            else
                chkeducationdocumentattachedYes.Checked = true;

            otherundertakcoursename1 = VisaInfo.otherundertakcoursename1;
            othernameofeducationprovider1 = VisaInfo.othernameofeducationprovider1;
            othernameofeducationprovider2 = VisaInfo.othernameofeducationprovider2;
            otheraddressofeducationprovider1 = VisaInfo.otheraddressofeducationprovider1;
            othereduproviderpostalcode1 = VisaInfo.othereduproviderpostalcode1;
            othercommencementdate1 = Convert.ToDateTime(VisaInfo.othercommencementdate1);
            otherfinishdate1 = Convert.ToDateTime(VisaInfo.otherfinishdate1);
            if (VisaInfo.otherdocumentattached1 == 0)
                chkotherdocumentattached1No.Checked = true;
            else
                chkotherdocumentattached1Yes.Checked = true;

            otherundertakcoursename2 = VisaInfo.otherundertakcoursename2;
            othernameofeducationprovider21 = VisaInfo.othernameofeducationprovider21;
            othernameofeducationprovider22 = VisaInfo.othernameofeducationprovider22;
            otheraddressofeducationprovider2 = VisaInfo.otheraddressofeducationprovider2;
            othereduproviderpostalcode2 = VisaInfo.othereduproviderpostalcode2;
            othercommencementdate2 = Convert.ToDateTime(VisaInfo.othercommencementdate2);
            otherfinishdate2 = Convert.ToDateTime(VisaInfo.otherfinishdate2);

            if (VisaInfo.otherdocumentattached2 == 0)
                chkotherdocumentattached2No.Checked = true;
            else
                chkotherdocumentattached2Yes.Checked = true;
            if (VisaInfo.ispreviouslystudiedinaustralia == 0)
                chkispreviouslyNo.Checked = true;
            else
                chkispreviouslyYes.Checked = true;

            previouslycoursename = VisaInfo.previouslycoursename;
            previouslycourseeducationproviderName = VisaInfo.previouslycourseeducationproviderName;
            previouslycourseDateFrom = Convert.ToDateTime(VisaInfo.previouslycourseDateFrom);
            previouslycourseDateTo = Convert.ToDateTime(VisaInfo.previouslycourseDateTo);
            previouslycoursename1 = VisaInfo.previouslycoursename1;
            previouslycourseeducationproviderName1 = VisaInfo.previouslycourseeducationproviderName1;
            previouslycourseDateFrom1 = Convert.ToDateTime(VisaInfo.otherfinishdate2);
            previouslycourseDateTo1 = Convert.ToDateTime(VisaInfo.otherfinishdate2);

            intendcoursename = VisaInfo.intendcoursename;
            intendedprovidername = VisaInfo.intendedprovidername;
            intendedcommencementdate = Convert.ToDateTime(VisaInfo.intendedcommencementdate);
            intendedfinishdate = Convert.ToDateTime(VisaInfo.intendedfinishdate);
            if (VisaInfo.haveenrolment == 0)
                chkhaveenrolmentNo.Checked = true;
            else
                chkhaveenrolmentYes.Checked = true;
            if (VisaInfo.haveenrolmentevidence == 0)
                chkhaveenrolmentevidenceNo.Checked = true;
            else
                chkhaveenrolmentevidenceYes.Checked = true;

            intendcoursename1 = VisaInfo.intendcoursename1;
            intendedprovidername1 = VisaInfo.intendedprovidername1;
            intendedcommencementdate1 = Convert.ToDateTime(VisaInfo.intendedcommencementdate1);
            intendedfinishdate1 = Convert.ToDateTime(VisaInfo.intendedfinishdate1);
            if (VisaInfo.haveenrolment1 == 0)
                chkhaveenrolment1No.Checked = true;
            else
                chkhaveenrolment1Yes.Checked = true;
            if (VisaInfo.haveenrolmentevidence1 == 0)
                chkhaveenrolmentevidence1No.Checked = true;
            else
                chkhaveenrolmentevidence1Yes.Checked = true;

            intendcoursename2 = VisaInfo.intendcoursename2;
            intendedprovidername2 = VisaInfo.intendedprovidername2;
            intendedcommencementdate2 = Convert.ToDateTime(VisaInfo.intendedcommencementdate2);
            intendedfinishdate2 = Convert.ToDateTime(VisaInfo.intendedfinishdate2);
            if (VisaInfo.haveenrolment2 == 0)
                chkhaveenrolment2No.Checked = true;
            else
                chkhaveenrolment2Yes.Checked = true;
            if (VisaInfo.haveenrolmentevidence2 == 0)
                chkhaveenrolmentevidence2No.Checked = true;
            else
                chkhaveenrolmentevidence2Yes.Checked = true;

            if (VisaInfo.applicantassesmentlevel == 0)
                chkapplicantassesmentlevelNo.Checked = true;
            else
                chkapplicantassesmentlevelYes.Checked = true;
            if (VisaInfo.englishlangtest == 0)
                chkenglishlangtestNo.Checked = true;
            else
                chkenglishlangtestYes.Checked = true;

            englishlangtestname = VisaInfo.englishlangtestname;
            englishlangtestDate = Convert.ToDateTime(VisaInfo.englishlangtestDate);
            englishlangtestcetificateno = VisaInfo.englishlangtestcetificateno;
            if (VisaInfo.studiedmorethan5yrinothercountry == 0)
                chkstudiedmorethan5yrinothercountryNo.Checked = true;
            else
                chkstudiedmorethan5yrinothercountryYes.Checked = true;

            employmenthistoryFromDate = Convert.ToDateTime(VisaInfo.employmenthistoryFromDate);
            employmenthistoryToDate = Convert.ToDateTime(VisaInfo.employmenthistoryToDate);
            employerInfoL0 = VisaInfo.employerInfoL0;
            employerInfoL1 = VisaInfo.employerInfoL1;
            typeofbusiness = VisaInfo.typeofbusiness;
            employeroccupation = VisaInfo.employeroccupation;
            salarylevel = VisaInfo.salarylevel;
            leavingdocAttch = null;
            if (VisaInfo.leavingdocAttch == 0)
                chkleavingdocAttchNo.Checked = true;
            else
                chkleavingdocAttchYes.Checked = true;
            employmenthistoryFromDate1 = Convert.ToDateTime(VisaInfo.employmenthistoryFromDate1);
            employmenthistoryToDate1 = Convert.ToDateTime(VisaInfo.employmenthistoryToDate1);
            employerInfoL2 = VisaInfo.employerInfoL2;
            employerInfoL3 = VisaInfo.employerInfoL3;
            typeofbusiness1 = VisaInfo.typeofbusiness1;
            employeroccupation1 = VisaInfo.employeroccupation1;
            salarylevel1 = VisaInfo.salarylevel1;
            if (VisaInfo.leavingdocAttch1 == 0)
                chkleavingdocAttch1No.Checked = true;
            else
                chkleavingdocAttch1Yes.Checked = true;
            if (VisaInfo.currentlyemployed == 0)
                chkcurrentlyemployedNo.Checked = true;
            else
                chkcurrentlyemployedYes.Checked = true;

            if (VisaInfo.ifnoThenOption == 1)
                chkStudent.Checked = true;
            else if (VisaInfo.ifnoThenOption == 2)
                chkunemployed.Checked = true;
            else
                chkOther.Checked = true;
            ifnoThenOption = null;
            otherdescription1 = VisaInfo.otherdescription1;
            otherdescription2 = VisaInfo.otherdescription2;
            position = VisaInfo.position;
            employername = VisaInfo.employername;
            employeraddress = VisaInfo.employeraddress;
            employercontactno = VisaInfo.employercontactno;
            if (VisaInfo.evidenceofemployement == 0)
                chkevidenceofemployementNo.Checked = true;
            else
                chkevidenceofemployementYes.Checked = true;
            if (VisaInfo.currentlystudentinaustralia == 0)
                chkcurrentlystudentinaustraliaNo.Checked = true;
            else
                chkcurrentlystudentinaustraliaYes.Checked = true;
            if (VisaInfo.joboffered == 0)
                chkjobofferedNo.Checked = true;
            else
                chkjobofferedYes.Checked = true;

            kindofemployementseeking = VisaInfo.kindofemployementseeking;
            jobofferedname = VisaInfo.jobofferedname;
            jobofferedaddress = VisaInfo.jobofferedaddress;
            jobofferedcontactno = VisaInfo.jobofferedcontactno;
            titleofpositionofferef = VisaInfo.titleofpositionofferef;
            immediaterelativename = VisaInfo.immediaterelativename;
            immediaterelativerelationship = VisaInfo.immediaterelativerelationship;
            immediaterelativeDob = Convert.ToDateTime(VisaInfo.immediaterelativeDob);
            immediaterelativeaddress = VisaInfo.immediaterelativeaddress;
            immediaterelativepostalcode = VisaInfo.immediaterelativepostalcode;
            immediaterelativeimmigrationstatus = VisaInfo.immediaterelativeimmigrationstatus;
            immediaterelativeDateofarrival = Convert.ToDateTime(VisaInfo.immediaterelativeDateofarrival);
            immediaterelativename1 = VisaInfo.immediaterelativename1;
            immediaterelativerelationship1 = VisaInfo.immediaterelativerelationship1;
            immediaterelativeDob1 = Convert.ToDateTime(VisaInfo.immediaterelativeDob1);
            immediaterelativeaddress1 = VisaInfo.immediaterelativeaddress1;
            immediaterelativepostalcode1 = VisaInfo.immediaterelativepostalcode1;
            immediaterelativeimmigrationstatus1 = VisaInfo.immediaterelativeimmigrationstatus1;
            immediaterelativedateofarrival1 = Convert.ToDateTime(VisaInfo.immediaterelativedateofarrival1);
            closestrelativename = VisaInfo.closestrelativename;
            closestrelativeaddress = VisaInfo.closestrelativeaddress;
            closestrelativerelationship = VisaInfo.closestrelativerelationship;
            closestrelativepostalcode = VisaInfo.closestrelativepostalcode;
            closestrelativecontactnumber = VisaInfo.closestrelativecontactnumber;
            if (VisaInfo.applyinaustraliaassecschool == 0)
                chkapplyinaustraliaassecschoolNo.Checked = true;
            else
                chkapplyinaustraliaassecschoolYes.Checked = true;
            if (VisaInfo.issufficientfund == 0)
                chkissufficientfundNo.Checked = true;
            else
                chkissufficientfundYes.Checked = true;
            applyinaustraliaassecschool = null;
            issufficientfund = null;
            declarationDate42 = Convert.ToDateTime(VisaInfo.declarationDate42);
            if (VisaInfo.ifFamilyunitcompletedformpartC == 0)
                chkFamilyunitcompletedformpartCNo.Checked = true;
            else
                chkFamilyunitcompletedformpartCYes.Checked = true;
            if (VisaInfo.studymorethanthreemonthpartC == 0)
                chkstudymorethanthreemonthpartCNo.Checked = true;
            else
                chkstudymorethanthreemonthpartCYes.Checked = true;

            studentnamepartC = VisaInfo.studentnamepartC;
            relationshiptostudentpartC = VisaInfo.relationshiptostudentpartC;
            studentdobpartC = Convert.ToDateTime(VisaInfo.studentdobpartC);
            citizenshipofstudentpartC = VisaInfo.citizenshipofstudentpartC;
            studentaddresspartC = VisaInfo.studentaddresspartC;
            studentaddpostalcodepartC = VisaInfo.studentaddpostalcodepartC;
            typeofstudentvisaheldpartC = VisaInfo.typeofstudentvisaheldpartC;
            assessmentlevelpartC = VisaInfo.assessmentlevelpartC;
            assessmentgrantdatepartC = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            assessmentexpirydatepartC = Convert.ToDateTime(VisaInfo.assessmentexpirydatepartC);

            if (VisaInfo.isstudentjoiningdeclarepartC == 0)
                chkisstudentjoiningdeclarepartCNo.Checked = true;
            else
                chkisstudentjoiningdeclarepartCYes.Checked = true;
            if (VisaInfo.isstudentjoiningsatisfiedconditionpartC == 0)
                chkisstudentjoiningsatisfiedconditionpartCNo.Checked = true;
            else
                chkisstudentjoiningsatisfiedconditionpartCYes.Checked = true;
            if (VisaInfo.suficientfundpartC == 0)
                chksuficientfundpartCNo.Checked = true;
            else
                chksuficientfundpartCYes.Checked = true;
            if (VisaInfo.livedoutsidecountryc == 0)
                chklivedoutsidecountrycNo.Checked = true;
            else
                chklivedoutsidecountrycYes.Checked = true;

            partD = null;

            familymembername = VisaInfo.familymembername;
            if (VisaInfo.familyresidencecountry != null)
                familyresidencecountry = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.familyresidencecountry));
            familyresidenceFromdate = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            familyresidenceTodate = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            familymembername1 = VisaInfo.familymembername1;
            if (VisaInfo.familyresidencecountry1 != null)
                familyresidencecountry1 = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.familyresidencecountry1));
            familyresidenceFromdate1 = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            familyresidenceTodate1 = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            familymembername2 = VisaInfo.familymembername2;
            if (VisaInfo.familyresidencecountry2 != null)
                familyresidencecountry2 = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.familyresidencecountry2));
            familyresidenceFromdate2 = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            familyresidenceTodate2 = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC);
            if (VisaInfo.haveworkforaustralianhospital == 0)
                chkhaveworkforaustralianhospitalNo.Checked = true;
            else
                chkhaveworkforaustralianhospitalYes.Checked = true;

            descriptionofhospitalwork = VisaInfo.descriptionofhospitalwork;
            if (VisaInfo.haveworkforaustralianpreschool == 0)
                chkhaveworkforaustralianpreschoolNo.Checked = true;
            else
                chkhaveworkforaustralianpreschoolYes.Checked = true;

            descriptionofpreschoolwork = VisaInfo.descriptionofpreschoolwork;
            if (VisaInfo.haveanyhealthissue == 0)
                chkhaveanyhealthissueNo.Checked = true;
            else
                chkhaveanyhealthissueYes.Checked = true;
            detailofhealthissue = VisaInfo.detailofhealthissue;
            if (VisaInfo.requireassistancewithmobility == 0)
                chkrequireassistancewithmobilityNo.Checked = true;
            else
                chkrequireassistancewithmobilityYes.Checked = true;
            descriptionofmobility = VisaInfo.descriptionofmobility;
            if (VisaInfo.haevmedicalprocedures == 0)
                chkhaevmedicalproceduresNo.Checked = true;
            else
                chkhaevmedicalproceduresYes.Checked = true;

            proceduresdescription = VisaInfo.proceduresdescription;
            if (VisaInfo.havemedicalfollowup == 0)
                chkhavemedicalfollowupNo.Checked = true;
            else
                chkhavemedicalfollowupYes.Checked = true;

            medicalfollowupdescription = VisaInfo.medicalfollowupdescription;

            if (VisaInfo.haveconvictedofcrime == 0)
                chkhaveconvictedofcrimeNo.Checked = true;
            else
                chkhaveconvictedofcrimeYes.Checked = true;
            if (VisaInfo.havechargeoffence == 0)
                chkhavechargeoffenceNo.Checked = true;
            else
                chkhavechargeoffenceYes.Checked = true;
            if (VisaInfo.havecriminaloffence == 0)
                chkhavecriminaloffenceNo.Checked = true;
            else
                chkhavecriminaloffenceYes.Checked = true;
            if (VisaInfo.haveremovedfromcountry == 0)
                chkhaveremovedfromcountryNo.Checked = true;
            else
                chkhaveremovedfromcountryYes.Checked = true;
            if (VisaInfo.havetoavoidbeingremoved == 0)
                chkhavetoavoidbeingremovedNo.Checked = true;
            else
                chkhavetoavoidbeingremovedYes.Checked = true;
            if (VisaInfo.havebeenexcluded == 0)
                chkhavebeenexcludedNo.Checked = true;
            else
                chkhavebeenexcludedYes.Checked = true;
            if (VisaInfo.havehumanrightscrime == 0)
                chkhavehumanrightscrimeNo.Checked = true;
            else
                chkhavehumanrightscrimeYes.Checked = true;
            if (VisaInfo.haverisktonationalsecurity == 0)
                chkhaverisktonationalsecurityNo.Checked = true;
            else
                chkhaverisktonationalsecurityYes.Checked = true;
            if (VisaInfo.haveoutstandingdebets == 0)
                chkhaveoutstandingdebetsNo.Checked = true;
            else
                chkhaveoutstandingdebetsYes.Checked = true;
            if (VisaInfo.haveconvictedoffence == 0)
                chkhaveconvictedoffenceNo.Checked = true;
            else
                chkhaveconvictedoffenceYes.Checked = true;
            if (VisaInfo.haveservedinmilitaryforce == 0)
                chkhaveservedinmilitaryforceNo.Checked = true;
            else
                chkhaveservedinmilitaryforceYes.Checked = true;
            descripofcharacterdeclaration = VisaInfo.descripofcharacterdeclaration;
            if (VisaInfo.under18age == 0)
                chkunder18ageNo.Checked = true;
            else
                chkunder18ageYes.Checked = true;
            if (VisaInfo.parentsituation == 1)
                chkparentsituationNo.Checked = true;
            else if (VisaInfo.parentsituation == 2)
                chkparentsituationYes.Checked = true;
            else
                chparentsituationNot.Checked = true;
            if (VisaInfo.holdorappliedVisa == 0)
                chkholdorappliedVisaNo.Checked = true;
            else
                chkholdorappliedVisaYes.Checked = true;
            parentfamilynamePartD = VisaInfo.parentfamilynamePartD;
            parentgivennamePartD = VisaInfo.parentgivennamePartD;
            parentDateofBirthpartD = Convert.ToDateTime(VisaInfo.parentDateofBirthpartD);
            parentaddresspartD = VisaInfo.parentaddresspartD;
            if (VisaInfo.parentvisastatusPartD == 0)
                chkparentvisastatusPartDNo.Checked = true;
            else
                chkparentvisastatusPartDYes.Checked = true;
            parentvisalabelno = VisaInfo.medicalfollowupdescription;
            parentvisadigitno = VisaInfo.medicalfollowupdescription;
            parentvisaperiodofstay = VisaInfo.parentvisaperiodofstay;
            parentvisaexpirydate = Convert.ToDateTime(VisaInfo.parentvisaexpirydate);
            parentvisaappliedgovtofficename = VisaInfo.parentvisaappliedgovtofficename;
            if (VisaInfo.havearrangementwithrelative == 0)
                chkhavearrangementwithrelativeNo.Checked = true;
            else
                chkhavearrangementwithrelativeYes.Checked = true;

            familyNameofrelative = VisaInfo.familyNameofrelative;
            givenNameofrelative = VisaInfo.givenNameofrelative;
            dateOfBirthofrelative = Convert.ToDateTime(VisaInfo.dateOfBirthofrelative);
            addressofRelative = VisaInfo.addressofRelative;
            relationshipofrelative = VisaInfo.relationshipofrelative;
            if (VisaInfo.relativeresideasstatus == 0)
                chkrelativeresideasstatusPerm.Checked = true;
            else
                chkrelativeresideasstatusTemp.Checked = true;
            permitedtostayfor = VisaInfo.permitedtostayfor;
            permitedtostayDate = Convert.ToDateTime(VisaInfo.permitedtostayDate);
            if (VisaInfo.guardianvisasatus == 1)
                chkguardianvisasatusGranted.Checked = true;
            else
                chkguardianvisasatusNot.Checked = true;
            guardianvisano = VisaInfo.guardianvisano;
            guardianvisaperiodofstay = VisaInfo.guardianvisaperiodofstay;
            guardianvisaperiodofstayDate = Convert.ToDateTime(VisaInfo.guardianvisaperiodofstayDate);
            govermentoffName = VisaInfo.govermentoffName;
            periodofstayofguardian = VisaInfo.periodofstayofguardian;
            if (VisaInfo.havewelfarearrangements == 0)
                chkhavewelfarearrangementsNo.Checked = true;
            else
                chkhavewelfarearrangementsYes.Checked = true;

            parentsignature = VisaInfo.parentsignature;
            parentsignatureDate = Convert.ToDateTime(VisaInfo.parentsignatureDate);
            parentFullname = VisaInfo.parentFullname;
            parentRelationshipwithstudent = VisaInfo.parentRelationshipwithstudent;
            parentsignature1 = VisaInfo.parentsignature1;
            parentsignatureDate1 = Convert.ToDateTime(VisaInfo.parentsignatureDate1);
            parentFullname1 = VisaInfo.parentFullname1;
            parentRelationshipwithstudent1 = VisaInfo.parentRelationshipwithstudent1;

            if (VisaInfo.havesolelegalrights == 0)
                chkhavesolelegalrightsNo.Checked = true;
            else
                chkhavesolelegalrightsYes.Checked = true;
            personname = VisaInfo.personname;
            personaddress = VisaInfo.personaddress;
            personcontactno = VisaInfo.personcontactno;
            personrelationship = VisaInfo.personrelationship;
            personnatureoflegalrights = VisaInfo.personnatureoflegalrights;

            parentsignatur67 = VisaInfo.parentsignatur67;
            signDate = Convert.ToDateTime(VisaInfo.signDate);
            fullname67 = VisaInfo.fullname67;
            relationship67 = VisaInfo.relationship67;
            parentsignatur671 = VisaInfo.parentsignatur671;
            signDate1 = Convert.ToDateTime(VisaInfo.signDate1);
            fullname671 = VisaInfo.fullname671;
            relationship671 = VisaInfo.relationship671;

            havereceiveassistance = null;
            title = null;
            assistedpersonfamilyname = VisaInfo.assistedpersonfamilyname;
            assistedpersongivenname = VisaInfo.assistedpersongivenname;
            assistedpersonaddress = VisaInfo.assistedpersonaddress;
            assistedpersonofficeno = VisaInfo.assistedpersonofficeno;
            assistedpersonmobileno = VisaInfo.assistedpersonmobileno;
            if (VisaInfo.isregisteredwithMARA == 0)
                chkisregisteredwithMARANo.Checked = true;
            else
                chkisregisteredwithMARAYes.Checked = true;
            if (VisaInfo.haveeducationagent == 0)
                chkhaveeducationagentNo.Checked = true;
            else
                chkhaveeducationagentYes.Checked = true;
           

           
            businessname = VisaInfo.businessname;
            registrationno = VisaInfo.registrationno;
            educationagentaddress = VisaInfo.educationagentaddress;
            educationagentemail = VisaInfo.educationagentemail;
            educationagentofficeno = VisaInfo.educationagentofficeno;
            educationagentphoneno = VisaInfo.educationagentphoneno;
            educationagentfaxno = VisaInfo.educationagentfaxno;
            if (VisaInfo.haveagentinaustralia == 0)
                chkhaveagentinaustraliaNo.Checked = true;
            else
                chkhaveagentinaustraliaYes.Checked = true;
            if (VisaInfo.havepaytoassistance == 0)
                chkhavepaytoassistanceNo.Checked = true;
            else
                chkhavepaytoassistanceYes.Checked = true;
            howmuchyoupay = VisaInfo.howmuchyoupay;
            giftgiven = VisaInfo.giftgiven;
            valueofgift = VisaInfo.valueofgift;

            havewrittencommunications = null;
            if (VisaInfo.haveauthorisedperson == 1)
                chkhavewrittencommunicationsMyself.Checked = true;
            else if (VisaInfo.haveauthorisedperson == 2)
                chkhaveauthorisedpersonMigrationagent.Checked = true;
            else if (VisaInfo.haveauthorisedperson == 3)
                chkhaveauthorisedpersonOffshoreagent.Checked = true;
            else if (VisaInfo.haveauthorisedperson == 4)
                chkhaveauthorisedpersonAgentExmpted.Checked = true;
            else
                chkhaveauthorisedpersonAuthorised.Checked = true;
            if (VisaInfo.haveauthorisedperson == 0)
                chkhaveauthorisedpersonNo.Checked = true;
            else
                chkhaveauthorisedpersonYes.Checked = true;
          
            authorisedpersontitle = null;

            authorisedpersofamilynname = VisaInfo.authorisedpersofamilynname;
            authorisedpersongivenname = VisaInfo.authorisedpersongivenname;
            authorisedpersonaddress = VisaInfo.authorisedpersonaddress;
            authorisedpersonofficeno = VisaInfo.authorisedpersonofficeno;
            authorisedpersonmobileno = VisaInfo.authorisedpersonmobileno;
            if (VisaInfo.haveagreetocommunicate == 0)
                chkhaveagreetocommunicateNo.Checked = true;
            else
                chhaveagreetocommunicateYes.Checked = true;
           
            Faxnumber = VisaInfo.Faxnumber;
            authorizedpersonEmailaddress = VisaInfo.authorizedpersonEmailaddress;
            signatureauthorizedperson = VisaInfo.signatureauthorizedperson;
            dateofsign = Convert.ToDateTime(VisaInfo.creditcardexpirydate);

            migratioagentNo = VisaInfo.migratioagentNo;
            offshoreagentId = VisaInfo.offshoreagentId;
            agenttitle = null;
            agentfamilyname = VisaInfo.agentfamilyname;
            agentgivenname = VisaInfo.agentgivenname;
            agentcompanyname = VisaInfo.agentcompanyname;
            agenntaddress = VisaInfo.agenntaddress;
            agentofficeno = VisaInfo.agentofficeno;
            agentmobileno = VisaInfo.agentmobileno;
            if (VisaInfo.agentagreetocommunicate == 0)
                chkagentagreetocommunicateNo.Checked = true;
            else
                chkagentagreetocommunicateYes.Checked = true;
            agentfaxno = VisaInfo.agentfaxno;
            agentemailaddress = VisaInfo.agentemailaddress;
            agentsignature = VisaInfo.agentemailaddress;
            agentsigndate = Convert.ToDateTime(VisaInfo.agentsigndate);
            if (VisaInfo.paymentmethod == 1)
                chkpaymentmethodBankCheque.Checked = true;
            else if (VisaInfo.paymentmethod == 2)
                chkpaymentmethodMoneyOrder.Checked = true;
            else if (VisaInfo.paymentmethod == 3)
                chkpaymentmethodDC.Checked = true;
            else if (VisaInfo.paymentmethod == 4)
                chkpaymentmethodCC.Checked = true;

            if (VisaInfo.paymentby == 1)
                chkpaymentbyMC.Checked = true;
            else if (VisaInfo.paymentmethod == 2)
                chkpaymentVI.Checked = true;
            else if (VisaInfo.paymentmethod == 3)
                chkpaymentbyBC.Checked = true;
            else if (VisaInfo.paymentmethod == 4)
                chkpaymentbyDC.Checked = true;
            else if (VisaInfo.paymentmethod == 5)
                chkpaymentbyAM.Checked = true;
            else if (VisaInfo.paymentmethod == 6)
                chkpaymentbyJCB.Checked = true;
           
            amountinaustraliandollars = VisaInfo.amountinaustraliandollars;
            creditcardno = VisaInfo.amountinaustraliandollars;
            creditcardexpirydate = Convert.ToDateTime(VisaInfo.creditcardexpirydate);
            cardholdarname = VisaInfo.cardholdarname;
            contactnumber = VisaInfo.contactnumber;
            addressofcardholder = VisaInfo.addressofcardholder;
            signatureofcardholder = VisaInfo.signatureofcardholder;
            declarationsignature = VisaInfo.declarationsignature;
            declarationdate = Convert.ToDateTime(VisaInfo.declarationdate);

        }
    }


    private void SetFamilyDetail()
    {
        var FamilyInfo = (from vInfo in db.australiavisaFamilydetailmaster
                          where vInfo.applicantid == userID && vInfo.universityid == universityID
                          select vInfo).ToList();

        for (int k = 0; k < FamilyInfo.Count; k++)
        {
            if (k == 0)
            {
                aboutfamilyname1 = FamilyInfo[k].aboutfamilygivenname;
                aboutfamilygivenname1 = FamilyInfo[k].aboutfamilygivenname;
                relationshiptoyou1 = FamilyInfo[k].relationshiptoyou;
                citizenship1 = FamilyInfo[k].citizenship;
                dobfamilymember1 = Convert.ToDateTime(FamilyInfo[k].dobfamilymember);
                if (FamilyInfo[k].isfamilymemberhavepassport == 1)
                    chkfamily1Yes.Checked = true;
                else
                    chkfamily1No.Checked = true;
                familypassportno1 = FamilyInfo[k].passportno;
                if (FamilyInfo[k].countryofpassport != null)
                    familycountryofpassport1 = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
                passportdateofissue1 = Convert.ToDateTime(FamilyInfo[k].passportdateofissue);
                passportdateofexpiry1 = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry);
                passportplaceofissue1 = FamilyInfo[k].passportplaceofissue;

                if (FamilyInfo[k].studyinAustralia == 1)
                    chkFamilyStudy1Yes.Checked = true;
                else
                    chkFamilyStudy1No.Checked = true;

            }
            else if (k == 1)
            {
                aboutfamilyname2 = FamilyInfo[k].aboutfamilygivenname;
                aboutfamilygivenname2 = FamilyInfo[k].aboutfamilygivenname;
                relationshiptoyou2 = FamilyInfo[k].relationshiptoyou;
                citizenship2 = FamilyInfo[k].citizenship;
                dobfamilymember2 = Convert.ToDateTime(FamilyInfo[k].dobfamilymember);
                if (FamilyInfo[k].isfamilymemberhavepassport == 1)
                    chkfamily2Yes.Checked = true;
                else
                    chkfamily2No.Checked = true;
                familypassportno2 = FamilyInfo[k].passportno;
                if (FamilyInfo[k].countryofpassport != null)
                    familycountryofpassport2 = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
                passportdateofissue2 = Convert.ToDateTime(FamilyInfo[k].passportdateofissue);
                passportdateofexpiry2 = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry);
                passportplaceofissue2 = FamilyInfo[k].passportplaceofissue;

                if (FamilyInfo[k].studyinAustralia == 1)
                    chkFamilyStudy2Yes.Checked = true;
                else
                    chkFamilyStudy2No.Checked = true;

            }
            else if (k == 2)
            {
                aboutfamilyname3 = FamilyInfo[k].aboutfamilygivenname;
                aboutfamilygivenname3 = FamilyInfo[k].aboutfamilygivenname;
                relationshiptoyou3 = FamilyInfo[k].relationshiptoyou;
                citizenship3 = FamilyInfo[k].citizenship;
                dobfamilymember3 = Convert.ToDateTime(FamilyInfo[k].dobfamilymember);
                if (FamilyInfo[k].isfamilymemberhavepassport == 1)
                    chkfamily3Yes.Checked = true;
                else
                    chkfamily3No.Checked = true;
                familypassportno3 = FamilyInfo[k].passportno;
                if (FamilyInfo[k].countryofpassport != null)
                    familycountryofpassport3 = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
                passportdateofissue3 = Convert.ToDateTime(FamilyInfo[k].passportdateofissue);
                passportdateofexpiry3 = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry);
                passportplaceofissue3 = FamilyInfo[k].passportplaceofissue;

                if (FamilyInfo[k].studyinAustralia == 1)
                    chkFamilyStudy3Yes.Checked = true;
                else
                    chkFamilyStudy3No.Checked = true;

            }
            //else if (k == 3)
            //{
            //    aboutfamilyname4 = FamilyInfo[k].aboutfamilygivenname;
            //    aboutfamilygivenname4 = FamilyInfo[k].aboutfamilygivenname;
            //    relationshiptoyou4 = FamilyInfo[k].relationshiptoyou;
            //    citizenship4 = FamilyInfo[k].citizenship;
            //    dobfamilymember4 = Convert.ToDateTime(FamilyInfo[k].dobfamilymember);
            //    if (FamilyInfo[k].isfamilymemberhavepassport == 1)
            //        chkfamily4Yes.Checked = true;
            //    else
            //        chkfamily4No.Checked = true;
            //    familypassportno4 = FamilyInfo[k].passportno;
            //    if (FamilyInfo[k].countryofpassport != null)
            //        familycountryofpassport4 = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
            //    passportdateofissue4 = Convert.ToDateTime(FamilyInfo[k].passportdateofissue);
            //    passportdateofexpiry4 = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry);
            //    passportplaceofissue4= FamilyInfo[k].passportplaceofissue;

            //    if (FamilyInfo[k].studyinAustralia == 1)
            //        chkFamilyStudy4Yes.Checked = true;
            //    else
            //        chkFamilyStudy4No.Checked = true;

            //}
        }
    }
}