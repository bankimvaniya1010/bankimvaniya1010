using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class australiavisapartD : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    int userID = 0, ApplicantID = 0, universityID;
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();    
    australiavisadetailmaster objaustraliavisadetail = new australiavisadetailmaster();
    protected List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();
            objCom.BindCountries(ddlfamilyresidencecountry);
            objCom.BindCountries(ddlfamilyresidencecountry1);
            objCom.BindCountries(ddlfamilyresidencecountry2);
            BindTitle(ddltitle);
            BindTitle(ddltitle1);
            BindTitle(ddltitle3);
            populatepartDInfo();
        }
    }
    protected void btnvisadetails_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();
            


            if (visaInfo != null)
            {
                mode = "update";
                objaustraliavisadetail = visaInfo;
            }
            //50
            if (rboutsidecountryNo.Checked) {
                objaustraliavisadetail.livedoutsidecountryc = 0;

                objaustraliavisadetail.familymembername = "";                
                objaustraliavisadetail.familyresidencecountry = null;
                objaustraliavisadetail.familyresidenceFromdate = null;
                objaustraliavisadetail.familyresidenceTodate = null;
                //set1
                objaustraliavisadetail.familymembername1 = "";
                objaustraliavisadetail.familyresidencecountry1 = null;
                objaustraliavisadetail.familyresidenceFromdate1 = null;
                objaustraliavisadetail.familyresidenceTodate1 = null;
                //set2
                objaustraliavisadetail.familymembername2 = "";
                objaustraliavisadetail.familyresidencecountry2 = null;
                objaustraliavisadetail.familyresidenceFromdate2 = null;
                objaustraliavisadetail.familyresidenceTodate2 = null;
            }
            else if (rboutsidecountryYes.Checked) {
                objaustraliavisadetail.livedoutsidecountryc = 1;
                objaustraliavisadetail.familymembername = txtfamilymembername.Value;
                if(ddlfamilyresidencecountry.SelectedValue != "")
                    objaustraliavisadetail.familyresidencecountry = Convert.ToInt32(ddlfamilyresidencecountry.SelectedValue);
                if (txtfamilyresidenceFrom.Value != "")
                    objaustraliavisadetail.familyresidenceFromdate = Convert.ToDateTime(txtfamilyresidenceFrom.Value);
                if (txtfamilyresidenceTo.Value != "")
                    objaustraliavisadetail.familyresidenceTodate = Convert.ToDateTime(txtfamilyresidenceTo.Value);
                //set1
                objaustraliavisadetail.familymembername1 = familymembername1.Value;
                if (ddlfamilyresidencecountry1.SelectedValue != "")
                    objaustraliavisadetail.familyresidencecountry1 = Convert.ToInt32(ddlfamilyresidencecountry1.SelectedValue);
                if (familyresidenceFrom1.Value != "")
                    objaustraliavisadetail.familyresidenceFromdate1 = Convert.ToDateTime(familyresidenceFrom1.Value);
                if (familyresidenceTo1.Value != "")
                    objaustraliavisadetail.familyresidenceTodate1 = Convert.ToDateTime(familyresidenceTo1.Value);
                //set2
                objaustraliavisadetail.familymembername2 = familymembername2.Value;
                if (ddlfamilyresidencecountry2.SelectedValue != "")
                    objaustraliavisadetail.familyresidencecountry2 = Convert.ToInt32(ddlfamilyresidencecountry2.SelectedValue);
                if (familyresidenceFrom2.Value != "")
                    objaustraliavisadetail.familyresidenceFromdate2 = Convert.ToDateTime(familyresidenceFrom2.Value);
                if (familyresidenceTo1.Value != "")
                    objaustraliavisadetail.familyresidenceTodate2 = Convert.ToDateTime(familyresidenceTo2.Value);
            }
            //51
            if (rbworkforaustralianhospitalNo.Checked)
                objaustraliavisadetail.haveworkforaustralianhospital = 0;
            else if (rbworkforaustralianhospitalYes.Checked) {
                objaustraliavisadetail.haveworkforaustralianhospital = 1;
                objaustraliavisadetail.descriptionofhospitalwork = txtdescriptionofhospitalwork.Value;
            }
            //52
            if (rbworkforaustralianpreschoolNo.Checked)
                objaustraliavisadetail.haveworkforaustralianpreschool = 0;
            else if (rbworkforaustralianpreschoolYes.Checked)
            {
                objaustraliavisadetail.haveworkforaustralianpreschool = 1;
                objaustraliavisadetail.descriptionofpreschoolwork = txtdescriptionofpreschoolwork.Value;
            }
            //53
            if (rbhaveanyhealthissueNO.Checked)
                objaustraliavisadetail.haveanyhealthissue = 0;
            else if (rbhaveanyhealthissueYes.Checked)
            {
                objaustraliavisadetail.haveanyhealthissue = 1;
                objaustraliavisadetail.detailofhealthissue = txtdetailofhealthissue.Value;
            }
            //54
            if (rbrequiremobilityNo.Checked)
                objaustraliavisadetail.requireassistancewithmobility = 0;
            else if (rbrequiremobilityYes.Checked)
            {
                objaustraliavisadetail.requireassistancewithmobility = 1;
                objaustraliavisadetail.descriptionofmobility = txtdescriptionofmobility.Value;
            }
            //55
            if (rbmedicalproceduresNo.Checked)
                objaustraliavisadetail.haevmedicalprocedures = 0;
            else if (rbmedicalproceduresYes.Checked)
            {
                objaustraliavisadetail.haevmedicalprocedures = 1;
                objaustraliavisadetail.proceduresdescription = txtproceduresdescription.Value;
            }
            //56
            if (rbmedicalfollowupNo.Checked)
                objaustraliavisadetail.havemedicalfollowup = 0;
            else if (rbmedicalfollowupYes.Checked)
            {
                objaustraliavisadetail.havemedicalfollowup = 1;
                objaustraliavisadetail.medicalfollowupdescription = txtmedicalfollowupdescription.Value;
            }
            //57
            if (rbconvictedNo.Checked)
                objaustraliavisadetail.haveconvictedofcrime = 0;
            else if (rbconvictedYes.Checked)
                objaustraliavisadetail.haveconvictedofcrime = 1;

            if (rbchargeoffenceNo.Checked)
                objaustraliavisadetail.havechargeoffence = 0;
            else if (rbchargeoffenceYes.Checked)
                objaustraliavisadetail.havechargeoffence = 1;

            if (rbcriminaloffenceNo.Checked)
                objaustraliavisadetail.havecriminaloffence = 0;
            else if (rbcriminaloffenceYes.Checked)
                objaustraliavisadetail.havecriminaloffence = 1;

            if (rbremovedfromcountryNo.Checked)
                objaustraliavisadetail.haveremovedfromcountry = 0;
            else if (rbremovedfromcountryYes.Checked)
                objaustraliavisadetail.haveremovedfromcountry = 1;

            if (rbtoavoidbeingremovedNo.Checked)
                objaustraliavisadetail.havetoavoidbeingremoved = 0;
            else if (rbtoavoidbeingremovedYes.Checked)
                objaustraliavisadetail.havetoavoidbeingremoved = 1;

            if (rbbeenexcludedNo.Checked)
                objaustraliavisadetail.havebeenexcluded = 0;
            else if (rbbeenexcludedYes.Checked)
                objaustraliavisadetail.havebeenexcluded = 1;

            if (rbhumanrightscrimeNo.Checked)
                objaustraliavisadetail.havehumanrightscrime = 0;
            else if (rbhumanrightscrimeYes.Checked)
                objaustraliavisadetail.havehumanrightscrime = 1;

            if (rbrisktonationalsecurityNo.Checked)
                objaustraliavisadetail.haverisktonationalsecurity = 0;
            else if (rbrisktonationalsecurityYes.Checked)
                objaustraliavisadetail.haverisktonationalsecurity = 1;

            if (rboutstandingdebetsNo.Checked)
                objaustraliavisadetail.haveoutstandingdebets = 0;
            else if (rboutstandingdebetsYes.Checked)
                objaustraliavisadetail.haveoutstandingdebets = 1;

            if (rbconvictedoffenceNo.Checked)
                objaustraliavisadetail.haveconvictedoffence = 0;
            else if (rbconvictedoffenceYes.Checked)
                objaustraliavisadetail.haveconvictedoffence = 1;

            if (rbservedinmilitaryforceNo.Checked)
                objaustraliavisadetail.haveservedinmilitaryforce = 0;
            else if (rbservedinmilitaryforceYes.Checked)
                objaustraliavisadetail.haveservedinmilitaryforce = 1;
            objaustraliavisadetail.descripofcharacterdeclaration = descripofcharacterdeclaration.Value;

            //58
            if (rbunder18ageNo.Checked)
                objaustraliavisadetail.under18age = 0;
            else if (rbunder18ageYes.Checked)
                objaustraliavisadetail.under18age = 1;

            //59
            if (gotoquestion60.Checked)
                objaustraliavisadetail.parentsituation = 1;
            else if(gotoquestion61.Checked)
                objaustraliavisadetail.parentsituation = 2;
            else if(gotoquestion64.Checked)
                objaustraliavisadetail.parentsituation = 3;

            //60
            if (rbholdorappliedVisaNo.Checked)
            {
                objaustraliavisadetail.holdorappliedVisa = 0;

                objaustraliavisadetail.parentfamilynamePartD = "";
                objaustraliavisadetail.parentgivennamePartD = "";
                objaustraliavisadetail.parentDateofBirthpartD = null;
                objaustraliavisadetail.parentaddresspartD = "";
                objaustraliavisadetail.parentvisastatusPartD = null;
                objaustraliavisadetail.parentvisalabelno = "";
                objaustraliavisadetail.parentvisadigitno = "";
                objaustraliavisadetail.parentvisaperiodofstay = "";
                objaustraliavisadetail.parentvisaexpirydate = null;
                objaustraliavisadetail.parentvisaappliedgovtofficename = "";
            }
            else if (rbholdorappliedVisaYes.Checked)
            {

                objaustraliavisadetail.holdorappliedVisa = 1;
                objaustraliavisadetail.parentfamilynamePartD = txtfamilyname.Value;
                objaustraliavisadetail.parentgivennamePartD = txtgivenname.Value;
                if (txtdob.Value != "")
                    objaustraliavisadetail.parentDateofBirthpartD = Convert.ToDateTime(txtdob.Value);
                objaustraliavisadetail.parentaddresspartD = txtaddressinaustralia.Value;

                if (rbvisastatusgranted.Checked)
                {
                    objaustraliavisadetail.parentvisastatusPartD = 1;
                    objaustraliavisadetail.parentvisalabelno = visanumber.Value;
                    objaustraliavisadetail.parentvisadigitno = digitvisano.Value;
                    objaustraliavisadetail.parentvisaperiodofstay = txtperiodofstay.Value;
                    if (txtvisaexpirydate.Value != "")
                        objaustraliavisadetail.parentvisaexpirydate = Convert.ToDateTime(txtvisaexpirydate.Value);
                }
                else if (rbvisastatusnmotyetdecided.Checked)
                {
                    objaustraliavisadetail.parentvisastatusPartD = 2;
                    objaustraliavisadetail.parentvisaappliedgovtofficename = txtgovermentofficename.Value;
                }

            }
            //61
            if (rbarrangementwithrelativeNo.Checked)
            {
                objaustraliavisadetail.havearrangementwithrelative = 0;

                objaustraliavisadetail.familyNameofrelative = "";
                objaustraliavisadetail.givenNameofrelative = "";
                objaustraliavisadetail.dateOfBirthofrelative = null;
                objaustraliavisadetail.addressofRelative = "";
                objaustraliavisadetail.relationshipofrelative = "";
            }
            else if (rbarrangementwithrelativeYes.Checked)
            {
                objaustraliavisadetail.havearrangementwithrelative = 1;
                objaustraliavisadetail.familyNameofrelative = txtfamilyNameofrelative.Value;
                objaustraliavisadetail.givenNameofrelative = txtgivenNameofrelative.Value;
                objaustraliavisadetail.dateOfBirthofrelative = Convert.ToDateTime(txtdateOfBirth.Value);
                objaustraliavisadetail.addressofRelative = txtaddressofRelative.Value;
                objaustraliavisadetail.relationshipofrelative = txtrelationshipofrelative.Value;
            }
            //62
            if (permanentresident.Checked)
            {
                objaustraliavisadetail.relativeresideasstatus = 1;

                objaustraliavisadetail.permitedtostayfor = "";
                objaustraliavisadetail.permitedtostayDate = null;
            }
            else if (Temporaryresident.Checked)
            {
                objaustraliavisadetail.relativeresideasstatus = 2;
                objaustraliavisadetail.permitedtostayfor = txtpermitedtostay.Value;
                objaustraliavisadetail.permitedtostayDate = Convert.ToDateTime(txtuntildate.Value);
            }
            //63
            if (rbguardianvisagranted.Checked)
            {
                objaustraliavisadetail.guardianvisasatus = 1;
                objaustraliavisadetail.guardianvisano = txtguardianvisano.Value;
                objaustraliavisadetail.guardianvisaperiodofstay = txtguardianvisaperiodofstay.Value;
                objaustraliavisadetail.guardianvisaperiodofstayDate = Convert.ToDateTime(txtguardianvisaexpirydate.Value);

                objaustraliavisadetail.govermentoffName = "";
                objaustraliavisadetail.periodofstayofguardian ="";
            }
            else if (rbguardianvisanotyrtdecided.Checked) {
                objaustraliavisadetail.guardianvisasatus = 2;
                objaustraliavisadetail.govermentoffName = txtgovermentoffName.Value;
                objaustraliavisadetail.periodofstayofguardian = txtperiodofstayofguardian.Value;

                objaustraliavisadetail.guardianvisano = "";
                objaustraliavisadetail.guardianvisaperiodofstay = "";
                objaustraliavisadetail.guardianvisaperiodofstayDate = null;
            }
            //64
            if (rbwelfarearrangementsNo.Checked)
                objaustraliavisadetail.havewelfarearrangements = 0;
            else if (rbwelfarearrangementsYes.Checked)
                objaustraliavisadetail.havewelfarearrangements = 1;
            //65
            objaustraliavisadetail.parentsignature = parentsignature.Value;
            objaustraliavisadetail.parentsignatureDate = Convert.ToDateTime(date.Value);
            objaustraliavisadetail.parentFullname = txtparentfullname.Value;
            objaustraliavisadetail.parentRelationshipwithstudent = txtrelationwithstudent.Value;

            objaustraliavisadetail.parentsignature1 = parentsignature1.Value;
            objaustraliavisadetail.parentsignatureDate1 = Convert.ToDateTime(date1.Value);
            objaustraliavisadetail.parentFullname1 = txtparentfullname1.Value;
            objaustraliavisadetail.parentRelationshipwithstudent1 = txtrelationwithstudent1.Value;
            //66
            if (rbsolelegalrightsNo.Checked)
            {
                    objaustraliavisadetail.havesolelegalrights = 0;
                    objaustraliavisadetail.personname = txtpersonname.Value;
                    objaustraliavisadetail.personaddress = txtpersonaddress.Value;
                    objaustraliavisadetail.personcontactno = txtpersoncontactno.Value;
                    objaustraliavisadetail.personrelationship = txtpersonrelationship.Value;
                    objaustraliavisadetail.personnatureoflegalrights = txtpersonnatureoflegalrights.Value;

                }
            else if (rbsolelegalrightsYes.Checked)
            {
                        objaustraliavisadetail.havesolelegalrights = 1;
                        objaustraliavisadetail.personname = "";
                        objaustraliavisadetail.personaddress = "";
                        objaustraliavisadetail.personcontactno = "";
                        objaustraliavisadetail.personrelationship = "";
                        objaustraliavisadetail.personnatureoflegalrights = "";

                    }
            //67
            objaustraliavisadetail.parentsignatur67 = txtparentsignatur67.Value;
            objaustraliavisadetail.signDate = Convert.ToDateTime(txtsignDate.Value);
            objaustraliavisadetail.fullname67 = txtfullname67.Value;
            objaustraliavisadetail.relationship67 = txtrelationship67.Value;
            objaustraliavisadetail.parentsignatur671 = parentsignatur67.Value;
            objaustraliavisadetail.signDate1 = Convert.ToDateTime(txtsignDate1.Value);
            objaustraliavisadetail.fullname671 = fullname67.Value;  
            objaustraliavisadetail.relationship671 = relationship67.Value;
            //68
            if (rbreceiveassistanceNo.Checked)
            {
                objaustraliavisadetail.havereceiveassistance = 0;
                objaustraliavisadetail.title = null;
                objaustraliavisadetail.assistedpersonfamilyname = "";
                objaustraliavisadetail.assistedpersongivenname = "";
                objaustraliavisadetail.assistedpersonaddress = "";
                objaustraliavisadetail.assistedpersonofficeno = "";
                objaustraliavisadetail.assistedpersonmobileno = "";

            }
            else if (rbreceiveassistanceYes.Checked)
            {
                objaustraliavisadetail.havereceiveassistance = 1;
                if (ddltitle.SelectedValue != "")
                    objaustraliavisadetail.title = Convert.ToInt32(ddltitle.SelectedValue);
                objaustraliavisadetail.assistedpersonfamilyname = txtassistedpersonfamilyname.Value;
                objaustraliavisadetail.assistedpersongivenname = txtassistedpersongivenname.Value;
                objaustraliavisadetail.assistedpersonaddress = txtaddress.Value;
                objaustraliavisadetail.assistedpersonofficeno = txtassistedpersonofficeno.Value;
                objaustraliavisadetail.assistedpersonmobileno = txtassistedpersonmobileno.Value;
            }
            //69
            if (maraNO.Checked)
                objaustraliavisadetail.isregisteredwithMARA = 0;
            else if (maraYes.Checked)
                objaustraliavisadetail.isregisteredwithMARA = 1;

            //70
            if (rbeducationagentNo.Checked)
            {
                objaustraliavisadetail.haveeducationagent = 0;
                objaustraliavisadetail.businessname = "";
                objaustraliavisadetail.registrationno = "";
                objaustraliavisadetail.educationagentaddress = "";
                objaustraliavisadetail.educationagentemail = "";
                objaustraliavisadetail.educationagentofficeno = "";
                objaustraliavisadetail.educationagentphoneno = "";
                objaustraliavisadetail.educationagentfaxno = "";
            }
            else if (rbeducationagentYes.Checked)
            {
                objaustraliavisadetail.haveeducationagent = 1;
                objaustraliavisadetail.businessname = txtbusinessname.Value;
                objaustraliavisadetail.registrationno = txtregistrationno.Value;
                objaustraliavisadetail.educationagentaddress = txteducationagentaddress.Value;
                objaustraliavisadetail.educationagentemail = txteducationagentemail.Value;
                objaustraliavisadetail.educationagentofficeno = txteducationagentofficeno.Value;
                objaustraliavisadetail.educationagentphoneno = txteducationagentphoneno.Value;
                objaustraliavisadetail.educationagentfaxno = txteducationagentfaxno.Value;
            }
            //71
            if (rbagentinauttaliaNo.Checked)
                objaustraliavisadetail.haveagentinaustralia = 0;
            else if(rbagentinauttaliaYes.Checked)
                objaustraliavisadetail.haveagentinaustralia = 1;
            //72
            if (rbpaytoassistanceNo.Checked) {
                objaustraliavisadetail.havepaytoassistance = 0;
                objaustraliavisadetail.howmuchyoupay = "";
                objaustraliavisadetail.giftgiven = "";
                objaustraliavisadetail.valueofgift = "";
            }
            else if (rbpaytoassistanceYes.Checked) {
                objaustraliavisadetail.havepaytoassistance = 1;
                objaustraliavisadetail.howmuchyoupay = txthowmuchyoupay.Value;
                objaustraliavisadetail.giftgiven = txtgiftgiven.Value;
                objaustraliavisadetail.valueofgift = txtvalueofgift.Value;
            }
            //73
            if (rbmyself.Checked)
                objaustraliavisadetail.havewrittencommunications = 1;
            else if (rbmigrationagent.Checked)
                objaustraliavisadetail.havewrittencommunications = 2;
            else if (rbOffshoreagent.Checked)
                objaustraliavisadetail.havewrittencommunications = 3;
            else if (rbAgentexempted.Checked)
                objaustraliavisadetail.havewrittencommunications = 4;
            else if (rbAuthorisedrecipient.Checked)
                objaustraliavisadetail.havewrittencommunications = 5;
            //74
            if (rbauthorisedpersonNo.Checked)
                objaustraliavisadetail.haveauthorisedperson = 0;
            else if (rbauthorisedpersonYes.Checked)
                objaustraliavisadetail.haveauthorisedperson = 1;
            //75
            if (ddltitle1.SelectedValue != "")
                objaustraliavisadetail.authorisedpersontitle = Convert.ToInt32(ddltitle1.SelectedValue);
            objaustraliavisadetail.authorisedpersofamilynname = txtauthorisedpersofamilynname.Value;
            objaustraliavisadetail.authorisedpersongivenname = txtauthorisedpersongivenname.Value;
            objaustraliavisadetail.authorisedpersonaddress = txtauthorisedpersonaddress.Value;
            objaustraliavisadetail.authorisedpersonofficeno = txtauthorisedpersonofficeno.Value;
            objaustraliavisadetail.authorisedpersonmobileno = txtauthorisedpersonmobileno.Value;

            //76
            if (rbagreetocommunicateNO.Checked) {
                objaustraliavisadetail.haveagreetocommunicate = 0;
                objaustraliavisadetail.Faxnumber = "";
                objaustraliavisadetail.authorizedpersonEmailaddress = "";
            }
            else if (rbagreetocommunicateYes.Checked) {
                objaustraliavisadetail.haveagreetocommunicate = 1;
                objaustraliavisadetail.Faxnumber = txtFaxnumber.Value;
                objaustraliavisadetail.authorizedpersonEmailaddress = txtEmailaddress.Value;
            }
            //77
            objaustraliavisadetail.signatureauthorizedperson = txtsignatureauthorizedperson.Value;
            objaustraliavisadetail.dateofsign = txtdateofsign.Value;
            //78
            objaustraliavisadetail.migratioagentNo = txtmarnNo.Value;
            objaustraliavisadetail.offshoreagentId = txtoffshoreagentId.Value;
            if (ddltitle3.SelectedValue != "")
                objaustraliavisadetail.agenttitle = Convert.ToInt32(ddltitle3.SelectedValue);
            objaustraliavisadetail.agentfamilyname = txtagentfamilyname.Value;
            objaustraliavisadetail.agentgivenname = txtagentgivenname.Value;
            objaustraliavisadetail.agentcompanyname = txtagentcompanyname.Value;
            objaustraliavisadetail.agenntaddress = txtagenntaddress.Value;
            objaustraliavisadetail.agentofficeno = txtagentofficeno.Value;
            objaustraliavisadetail.agentmobileno = txtagentmobileno.Value;
            //79
            if (rbagentagreetocommunicateNo.Checked) {
                objaustraliavisadetail.agentagreetocommunicate = 0;
                objaustraliavisadetail.agentfaxno = "";
                objaustraliavisadetail.agentemailaddress = "";
            }
            else if (rbagentagreetocommunicateYes.Checked)
            {
                objaustraliavisadetail.agentagreetocommunicate = 1;
                objaustraliavisadetail.agentfaxno = txtagentfaxno.Value;
                objaustraliavisadetail.agentemailaddress = txtagentemailaddress.Value;
            }
            //80
            objaustraliavisadetail.agentsignature = txtagentsignatures.Value;
            objaustraliavisadetail.agentsigndate = txtagentsigndate.Value;
            //81
            if (rbBankcheque.Checked)
                objaustraliavisadetail.paymentmethod = 1;
            else if (rbMoneyorder.Checked)
                objaustraliavisadetail.paymentmethod = 2;
            else if (rbDebitcard.Checked)
                objaustraliavisadetail.paymentmethod = 3;
            else if (rbCreditcard.Checked)
            {
                objaustraliavisadetail.paymentmethod = 4;
                if (rbMasterCard.Checked)
                    objaustraliavisadetail.paymentby = 1;
                else if (rbBankcard.Checked)
                    objaustraliavisadetail.paymentby = 2;
                else if (rbAmericanExpress.Checked)
                    objaustraliavisadetail.paymentby = 3;
                else if (rbVisa.Checked)
                    objaustraliavisadetail.paymentby = 4;
                else if (rbDinersClub.Checked)
                    objaustraliavisadetail.paymentby = 5;
                else if (rbJCB.Checked)
                    objaustraliavisadetail.paymentby = 6;

                objaustraliavisadetail.amountinaustraliandollars = txtamountinaustraliandollars.Value;
                objaustraliavisadetail.creditcardno = txtcreditcardno.Value;
                objaustraliavisadetail.creditcardexpirydate = Convert.ToDateTime(txtcreditcardexpirydate.Value);
                objaustraliavisadetail.cardholdarname = txtcardholdarname.Value;
                objaustraliavisadetail.contactnumber = txtcontactnumber.Value;
                objaustraliavisadetail.addressofcardholder = txtaddressofcardholder.Value;
                objaustraliavisadetail.signatureofcardholder = txtsignatureofcardholder.Value;
            }
            //82
            objaustraliavisadetail.declarationsignature = txtdeclarationsignature.Value;   
            if(txtdeclarationdate.Value != "")
                objaustraliavisadetail.declarationdate = Convert.ToDateTime(txtdeclarationdate.Value);

            objaustraliavisadetail.declarationsignature1 = txtdeclarationsignature1.Value;
            if (txtdeclarationdate1.Value != "")
                objaustraliavisadetail.declarationdate1 = Convert.ToDateTime(txtdeclarationdate1.Value);

            objaustraliavisadetail.declarationsignature2 = txtdeclarationsignature2.Value;
            if (txtdeclarationdate2.Value != "")
                objaustraliavisadetail.declarationdate2 = Convert.ToDateTime(txtdeclarationdate2.Value);

            objaustraliavisadetail.declarationsignature3 = txtdeclarationsignature3.Value;
            if (txtdeclarationdate3.Value != "")
                objaustraliavisadetail.declarationdate3 = Convert.ToDateTime(txtdeclarationdate3.Value);

            objaustraliavisadetail.applicantid = userID;
            objaustraliavisadetail.universityid = universityID;
            if (mode == "new")
                db.australiavisadetailmaster.Add(objaustraliavisadetail);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
   
    private void populatepartDInfo() {
        try
        {
            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();

            //50
            if (visaInfo.livedoutsidecountryc == 0)
                rboutsidecountryNo.Checked = true;
            else if (visaInfo.livedoutsidecountryc == 1)
            {
                rboutsidecountryYes.Checked = true;
                txtfamilymembername.Value = visaInfo.familymembername;
                if(visaInfo.familyresidencecountry != null)
                {
                    ddlfamilyresidencecountry.ClearSelection();
                    ddlfamilyresidencecountry.Items.FindByValue(visaInfo.familyresidencecountry.ToString()).Selected = true;
                }
                if (visaInfo.familyresidenceFromdate != null)
                    txtfamilyresidenceFrom.Value = Convert.ToDateTime(visaInfo.familyresidenceFromdate).ToString("yyyy-MM-dd");
                if (visaInfo.familyresidenceTodate != null)
                    txtfamilyresidenceTo.Value = Convert.ToDateTime(visaInfo.familyresidenceTodate).ToString("yyyy-MM-dd");
                //set1
                familymembername1.Value = visaInfo.familymembername1;
                if (visaInfo.familyresidencecountry1 != null)
                {
                    ddlfamilyresidencecountry1.ClearSelection();
                    ddlfamilyresidencecountry1.Items.FindByValue(visaInfo.familyresidencecountry1.ToString()).Selected = true;
                }
                if (visaInfo.familyresidenceFromdate1 != null)
                    familyresidenceFrom1.Value = Convert.ToDateTime(visaInfo.familyresidenceFromdate1).ToString("yyyy-MM-dd");
                if (visaInfo.familyresidenceTodate1!= null)
                    familyresidenceTo1.Value = Convert.ToDateTime(visaInfo.familyresidenceTodate1).ToString("yyyy-MM-dd");
                //set2
                familymembername2.Value = visaInfo.familymembername2;
                if (visaInfo.familyresidencecountry2 != null)
                {
                    ddlfamilyresidencecountry2.ClearSelection();
                    ddlfamilyresidencecountry2.Items.FindByValue(visaInfo.familyresidencecountry2.ToString()).Selected = true;
                }
                if (visaInfo.familyresidenceFromdate2 != null)
                    familyresidenceFrom2.Value = Convert.ToDateTime(visaInfo.familyresidenceFromdate2).ToString("yyyy-MM-dd");
                if (visaInfo.familyresidenceTodate2 != null)
                    familyresidenceTo2.Value = Convert.ToDateTime(visaInfo.familyresidenceTodate2).ToString("yyyy-MM-dd");

            }

            //51
            if (visaInfo.haveworkforaustralianhospital == 0)
                rbworkforaustralianhospitalNo.Checked = true;
            else if (visaInfo.haveworkforaustralianhospital == 1)
            {
                rbworkforaustralianhospitalYes.Checked = true;
                txtdescriptionofhospitalwork.Value =visaInfo.descriptionofhospitalwork;
            }
            //52
            if (visaInfo.haveworkforaustralianpreschool == 0)
                rbworkforaustralianpreschoolNo.Checked = true;
            else if (visaInfo.haveworkforaustralianpreschool == 1)
            {
                rbworkforaustralianpreschoolYes.Checked = true;
                txtdescriptionofpreschoolwork.Value = visaInfo.descriptionofpreschoolwork;
            }
            //53
            if (visaInfo.haveanyhealthissue == 0)
                rbhaveanyhealthissueNO.Checked = true;
            else if (visaInfo.haveanyhealthissue == 1)
            {
                rbhaveanyhealthissueYes.Checked = true;
                txtdetailofhealthissue.Value = visaInfo.detailofhealthissue;
            }
            //54
            if (visaInfo.requireassistancewithmobility == 0)
                rbrequiremobilityNo.Checked = true;
            else if (visaInfo.requireassistancewithmobility == 1)
            {
                rbrequiremobilityYes.Checked = true;
                txtdescriptionofmobility.Value = visaInfo.descriptionofmobility ;
            }
            //55
            if (visaInfo.haevmedicalprocedures == 0)
                rbmedicalproceduresNo.Checked = true;
            else if (visaInfo.haevmedicalprocedures == 1)
            {
                rbmedicalproceduresYes.Checked = true;
                txtproceduresdescription.Value = visaInfo.proceduresdescription ; 
            }
            //56
            if (visaInfo.havemedicalfollowup == 0)
                rbmedicalfollowupNo.Checked = true;
            else if (visaInfo.havemedicalfollowup == 1)
            {
                rbmedicalfollowupYes.Checked = true;
                txtmedicalfollowupdescription.Value = visaInfo.medicalfollowupdescription; 
            }
            //57
            if (visaInfo.haveconvictedofcrime == 0)
                rbconvictedNo.Checked = true;
            else if (visaInfo.haveconvictedofcrime == 1)
                rbconvictedYes.Checked = true;
            if (visaInfo.havechargeoffence == 0)
                rbchargeoffenceNo.Checked = true;
            else if (visaInfo.havechargeoffence == 1)
                rbchargeoffenceYes.Checked = true;
            if (visaInfo.havecriminaloffence == 0)
                rbcriminaloffenceNo.Checked = true;
            else if (visaInfo.havecriminaloffence == 1)
                rbcriminaloffenceYes.Checked = true;
            if (visaInfo.haveremovedfromcountry == 0)
                rbremovedfromcountryNo.Checked = true;
            else if (visaInfo.haveremovedfromcountry == 1)
                rbremovedfromcountryYes.Checked = true;
            if (visaInfo.havetoavoidbeingremoved == 0)
                rbtoavoidbeingremovedNo.Checked = true;
            else if (visaInfo.havetoavoidbeingremoved == 1)
                rbtoavoidbeingremovedYes.Checked = true;
            if (visaInfo.havebeenexcluded == 0)
                rbbeenexcludedNo.Checked = true;
            else if (visaInfo.havebeenexcluded == 1)
                rbbeenexcludedYes.Checked = true;
            if (visaInfo.havehumanrightscrime == 0)
                rbhumanrightscrimeNo.Checked = true;
            else if (visaInfo.havehumanrightscrime == 1)
                rbhumanrightscrimeYes.Checked = true;
            if (visaInfo.haverisktonationalsecurity == 0)
                rbrisktonationalsecurityNo.Checked = true;
            else if (visaInfo.haverisktonationalsecurity == 1)
                rbrisktonationalsecurityYes.Checked = true;
            if (visaInfo.haveoutstandingdebets == 0)
                rboutstandingdebetsNo.Checked = true;
            else if (visaInfo.haveoutstandingdebets == 1)
                rboutstandingdebetsYes.Checked = true;
            if (visaInfo.haveconvictedoffence == 0)
                rbconvictedoffenceNo.Checked = true;
            else if(visaInfo.haveconvictedoffence ==1)
                rbconvictedoffenceYes.Checked = true;
            if (visaInfo.haveservedinmilitaryforce == 0)
                rbservedinmilitaryforceNo.Checked = true;
            else if (visaInfo.haveservedinmilitaryforce == 1)
                rbservedinmilitaryforceYes.Checked = true;
            descripofcharacterdeclaration.Value = visaInfo.descripofcharacterdeclaration;
            //58
            if (visaInfo.under18age == 0)
                rbunder18ageNo.Checked = true;
            else if(visaInfo.under18age ==1)
                rbunder18ageYes.Checked = true;
            //59
            if (visaInfo.parentsituation == 1)
                gotoquestion60.Checked = true;
            else if (visaInfo.parentsituation == 2)
                gotoquestion61.Checked = true;
            else if (visaInfo.parentsituation == 3)
                gotoquestion64.Checked = true;
            //60
            if (visaInfo.holdorappliedVisa == 0)
                rbholdorappliedVisaNo.Checked = true;
            else if (visaInfo.holdorappliedVisa == 1)
            {
                rbholdorappliedVisaYes.Checked = true;
                txtfamilyname.Value = visaInfo.parentfamilynamePartD;
                txtgivenname.Value = visaInfo.parentgivennamePartD;
                if (visaInfo.parentDateofBirthpartD != null)
                    txtaddressinaustralia.Value = Convert.ToDateTime(visaInfo.parentDateofBirthpartD).ToString("yyyy-MM-dd");

                if (visaInfo.parentvisastatusPartD == 1)
                {
                    rbvisastatusgranted.Checked = true;
                    visanumber.Value = visaInfo.parentvisalabelno;
                    digitvisano.Value = visaInfo.parentvisadigitno;
                    txtperiodofstay.Value = visaInfo.parentvisaperiodofstay;
                    if (visaInfo.parentvisaexpirydate != null)
                        txtvisaexpirydate.Value = Convert.ToDateTime(visaInfo.parentvisaexpirydate).ToString("yyyy-MM-dd");
                }
                else if (visaInfo.parentvisastatusPartD == 2)
                {
                    rbvisastatusnmotyetdecided.Checked = true;
                    txtgovermentofficename.Value = visaInfo.parentvisaappliedgovtofficename;
                }
            }
            //61
            if (visaInfo.havearrangementwithrelative == 0)
                rbarrangementwithrelativeNo.Checked = true;
            else if (visaInfo.havearrangementwithrelative == 1) {
                rbarrangementwithrelativeYes.Checked = true;
                txtfamilyNameofrelative.Value = visaInfo.familyNameofrelative ;
                txtgivenNameofrelative.Value = visaInfo.givenNameofrelative;
                if (visaInfo.dateOfBirthofrelative != null)
                    txtdateOfBirth.Value = Convert.ToDateTime(visaInfo.dateOfBirthofrelative).ToString("yyyy-MM-dd");
                txtaddressofRelative.Value = visaInfo.addressofRelative;
                txtrelationshipofrelative.Value = visaInfo.relationshipofrelative;
            }
            //62
            if (visaInfo.relativeresideasstatus == 1)
                permanentresident.Checked = true;
            else if (visaInfo.relativeresideasstatus == 2)                    
            {
                Temporaryresident.Checked = true;
                txtpermitedtostay.Value = visaInfo.permitedtostayfor;
                if(visaInfo.permitedtostayDate != null)
                    txtuntildate.Value = Convert.ToDateTime(visaInfo.permitedtostayDate).ToString("yyyy-MM-dd");
            }
            //63
            if (visaInfo.guardianvisasatus == 1)
            {
                rbguardianvisagranted.Checked = true;
                txtguardianvisano.Value = visaInfo.guardianvisano;
                txtguardianvisaperiodofstay.Value = visaInfo.guardianvisaperiodofstay;
                if(visaInfo.guardianvisaperiodofstayDate != null)
                    txtguardianvisaexpirydate.Value = Convert.ToDateTime(visaInfo.guardianvisaperiodofstayDate).ToString("yyyy-MM-dd");

            }
            else if (visaInfo.guardianvisasatus == 2)
            {
                rbguardianvisanotyrtdecided.Checked = true;
                txtgovermentoffName.Value = visaInfo.govermentoffName;
                txtperiodofstayofguardian.Value = visaInfo.periodofstayofguardian;
            }
            //64
            if (visaInfo.havewelfarearrangements == 0)
                rbwelfarearrangementsNo.Checked = true;
            else if (visaInfo.havewelfarearrangements == 1)
                rbwelfarearrangementsYes.Checked = true;
            //65
            parentsignature.Value = visaInfo.parentsignature;
            if (visaInfo.parentsignatureDate != null)
                date.Value = Convert.ToDateTime(visaInfo.parentsignatureDate).ToString("yyyy-MM-dd");
            txtparentfullname.Value = visaInfo.parentFullname;
            txtrelationwithstudent.Value = visaInfo.parentRelationshipwithstudent;

            parentsignature1.Value = visaInfo.parentsignature1;
            if(visaInfo.parentsignatureDate1 != null)                 
                date1.Value = Convert.ToDateTime(visaInfo.parentsignatureDate1).ToString("yyyy-MM-dd");
            txtparentfullname1.Value = visaInfo.parentFullname1;
            txtrelationwithstudent1.Value = visaInfo.parentRelationshipwithstudent1;
            ////66
            if (visaInfo.havesolelegalrights == 0)
            {
                rbsolelegalrightsNo.Checked = true;
                txtpersonname.Value = visaInfo.personname;
                txtpersonaddress.Value = visaInfo.personaddress;
                txtpersoncontactno.Value = visaInfo.personcontactno;
                txtpersonrelationship.Value = visaInfo.personrelationship;
                txtpersonnatureoflegalrights.Value = visaInfo.personnatureoflegalrights;

            }
            else if (visaInfo.havesolelegalrights == 1)
                rbsolelegalrightsYes.Checked = true;

            //67
            txtparentsignatur67.Value = visaInfo.parentsignatur67;
            if (visaInfo.signDate != null)
                txtsignDate.Value = Convert.ToDateTime(visaInfo.signDate).ToString("yyyy-MM-dd");
            txtfullname67.Value = visaInfo.fullname67;
            txtrelationship67.Value = visaInfo.relationship67;
            parentsignatur67.Value = visaInfo.parentsignatur671;
            if(visaInfo.signDate1 != null)
                txtsignDate1.Value = Convert.ToDateTime(visaInfo.signDate1).ToString("yyyy-MM-dd");
            fullname67.Value = visaInfo.fullname671;
            relationship67.Value = visaInfo.relationship671;
            //68
            if (visaInfo.havereceiveassistance == 0)
                rbreceiveassistanceNo.Checked = true;
            else if (visaInfo.havereceiveassistance == 1)
            {
                rbreceiveassistanceYes.Checked = true;
                if (visaInfo.title != null)
                {
                    ddltitle.ClearSelection();
                    ddltitle.Items.FindByValue(visaInfo.title.ToString()).Selected = true;
                }
                txtassistedpersonfamilyname.Value = visaInfo.assistedpersonfamilyname;
                txtassistedpersongivenname.Value = visaInfo.assistedpersongivenname;
                txtaddress.Value = visaInfo.assistedpersonaddress;
                txtassistedpersonofficeno.Value = visaInfo.assistedpersonofficeno;
                txtassistedpersonmobileno.Value = visaInfo.assistedpersonmobileno;
            }

            //69
            if (visaInfo.isregisteredwithMARA == 0)
                maraNO.Checked = true;
            else if (visaInfo.isregisteredwithMARA == 1)
                maraYes.Checked = true;
            //70
            if (visaInfo.haveeducationagent == 0)
                rbeducationagentNo.Checked = true;
            else if (visaInfo.haveeducationagent == 1) {
                rbeducationagentYes.Checked = true;
                txtbusinessname.Value = visaInfo.businessname ;
                txtregistrationno.Value = visaInfo.registrationno;
                txteducationagentaddress.Value = visaInfo.educationagentaddress;
                txteducationagentemail.Value = visaInfo.educationagentemail ;
                txteducationagentofficeno.Value = visaInfo.educationagentofficeno;
                txteducationagentphoneno.Value = visaInfo.educationagentphoneno ;
                txteducationagentfaxno.Value = visaInfo.educationagentfaxno;
            }
            //71
            if (visaInfo.haveagentinaustralia == 0)
                rbagentinauttaliaNo.Checked = true;
            else if (visaInfo.haveagentinaustralia == 1)
                rbagentinauttaliaYes.Checked = true;
            //72
            if (visaInfo.havepaytoassistance == 0)
                rbpaytoassistanceNo.Checked = true;
            else if (visaInfo.havepaytoassistance == 1) {
                rbpaytoassistanceYes.Checked = true;
                txthowmuchyoupay.Value = visaInfo.howmuchyoupay;
                txtgiftgiven.Value = visaInfo.giftgiven;
                txtvalueofgift.Value = visaInfo.valueofgift;
            }
            //73
            if (visaInfo.havewrittencommunications == 1)
                rbmyself.Checked = true;
            if (visaInfo.havewrittencommunications == 2)
                rbmigrationagent.Checked = true;
            else if (visaInfo.havewrittencommunications == 3)
                rbOffshoreagent.Checked = true;
            else if (visaInfo.havewrittencommunications == 4)
                rbAgentexempted.Checked = true;
            else if (visaInfo.havewrittencommunications == 5)
                rbAuthorisedrecipient.Checked = true;
            //74

            if (visaInfo.haveauthorisedperson == 0)
                rbauthorisedpersonNo.Checked = true;
            else if (visaInfo.haveauthorisedperson == 1)
                rbauthorisedpersonYes.Checked = true;
            //75
            if (visaInfo.authorisedpersontitle != null)
            {
                ddltitle1.ClearSelection();
                ddltitle1.Items.FindByValue(visaInfo.authorisedpersontitle.ToString()).Selected = true;
            }
            txtauthorisedpersofamilynname.Value = visaInfo.authorisedpersofamilynname;
            txtauthorisedpersongivenname.Value =visaInfo.authorisedpersongivenname;
            txtauthorisedpersonaddress.Value = visaInfo.authorisedpersonaddress;
            txtauthorisedpersonofficeno.Value = visaInfo.authorisedpersonofficeno;
            txtauthorisedpersonmobileno.Value = visaInfo.authorisedpersonmobileno;
            //76
            if (visaInfo.haveagreetocommunicate == 0)
                rbagreetocommunicateNO.Checked = true;
            if (visaInfo.haveagreetocommunicate == 1)
            {
                rbagreetocommunicateYes.Checked = true;
                txtFaxnumber.Value = visaInfo.Faxnumber;
                txtEmailaddress.Value = visaInfo.authorizedpersonEmailaddress;
            }
            //77
            txtsignatureauthorizedperson.Value = visaInfo.signatureauthorizedperson ;
            txtdateofsign.Value = visaInfo.dateofsign;
            //78
            txtmarnNo.Value = visaInfo.migratioagentNo;
            txtoffshoreagentId.Value = visaInfo.offshoreagentId;
            if (visaInfo.agenttitle != null)
            {
                ddltitle3.ClearSelection();
                ddltitle3.Items.FindByValue(visaInfo.agenttitle.ToString()).Selected = true;
            }
            txtagentfamilyname.Value = visaInfo.agentfamilyname;
            txtagentgivenname.Value = visaInfo.agentgivenname;
            txtagentcompanyname.Value = visaInfo.agentcompanyname;
            txtagenntaddress.Value = visaInfo.agenntaddress ;
            txtagentofficeno.Value = visaInfo.agentofficeno;
            txtagentmobileno.Value = visaInfo.agentmobileno;
            //79
            if (visaInfo.agentagreetocommunicate == 0)
                rbagentagreetocommunicateNo.Checked = true;
            else if (visaInfo.agentagreetocommunicate == 1) {
                rbagentagreetocommunicateYes.Checked = true;
                txtagentfaxno.Value = visaInfo.agentfaxno;
                txtagentemailaddress.Value = visaInfo.agentemailaddress;
            }

            //80
            txtagentsignatures.Value = visaInfo.agentsignature;
            txtagentsigndate.Value = visaInfo.agentsigndate;
            //81
            if (visaInfo.paymentmethod == 1)
                rbBankcheque.Checked = true;
            else if (visaInfo.paymentmethod == 2)
                rbMoneyorder.Checked = true;
            else if (visaInfo.paymentmethod == 3)
                rbDebitcard.Checked = true;
            else if (visaInfo.paymentmethod == 4) {
                rbCreditcard.Checked = true;
                if (visaInfo.paymentmethod == 1)
                    rbMasterCard.Checked = true;
                else if (visaInfo.paymentmethod == 2)
                    rbBankcard.Checked = true;
                else if (visaInfo.paymentmethod == 3)
                    rbAmericanExpress.Checked = true;
                else if (visaInfo.paymentmethod == 4)
                    rbVisa.Checked = true;
                else if (visaInfo.paymentmethod == 5)
                    rbDinersClub.Checked = true;
                else if (visaInfo.paymentmethod == 6)
                    rbJCB.Checked = true;

                txtamountinaustraliandollars.Value = visaInfo.amountinaustraliandollars;
                txtcreditcardno.Value = visaInfo.creditcardno;
                txtcreditcardexpirydate.Value = Convert.ToDateTime(visaInfo.creditcardexpirydate).ToString("yyyy-MM-dd");
                txtcardholdarname.Value = visaInfo.cardholdarname;
                txtcontactnumber.Value = visaInfo.contactnumber ;
                txtaddressofcardholder.Value = visaInfo.addressofcardholder;
                txtsignatureofcardholder.Value = visaInfo.signatureofcardholder ;
            }
            //82
            txtdeclarationsignature.Value = visaInfo.declarationsignature;
            if(visaInfo.declarationdate != null)
                txtdeclarationdate.Value = Convert.ToDateTime(visaInfo.declarationdate).ToString("yyyy-MM-dd");
            txtdeclarationsignature1.Value = visaInfo.declarationsignature;
            if (visaInfo.declarationdate1 != null)
                txtdeclarationdate1.Value = Convert.ToDateTime(visaInfo.declarationdate1).ToString("yyyy-MM-dd");
            txtdeclarationsignature2.Value = visaInfo.declarationsignature;
            if (visaInfo.declarationdate2 != null)
                txtdeclarationdate2.Value = Convert.ToDateTime(visaInfo.declarationdate2).ToString("yyyy-MM-dd");
            txtdeclarationsignature3.Value = visaInfo.declarationsignature;
            if (visaInfo.declarationdate3 != null)
                txtdeclarationdate3.Value = Convert.ToDateTime(visaInfo.declarationdate3).ToString("yyyy-MM-dd");
        }
        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindTitle(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var title = db.titlemaster.ToList();
            ddl.DataSource = title;
            ddl.DataTextField = "titlename";
            ddl.DataValueField = "titleid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btngoBackTo_Click(object sender, EventArgs e)
    {
        var australiavisadetailmaster = db.australiavisadetailmaster.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
        if (australiavisadetailmaster != null)
        {
            var selectedvalue = australiavisadetailmaster.applyingfor.Value;
            if (selectedvalue == 3)
                Response.Redirect(webURL + "australiavisapartC.aspx", true);
            else if (selectedvalue == 1 || selectedvalue == 2)
                Response.Redirect(webURL + "australiavisapartB.aspx", true);
        }
        
    }
}