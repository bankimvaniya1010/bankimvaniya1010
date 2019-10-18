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
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int userID = 0, universityID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null || Request.QueryString["id"].ToString() == "" || Request.QueryString["token"] == null || Request.QueryString["token"].ToString() != "XS7MKjHLunMAvqzCGr")
        { }
        else
        {
            universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
            userID = Convert.ToInt32(Request.QueryString["id"].ToString());
            SetVisaDetails();
            SetFamilyDetail();
        }
    }

    private void SetVisaDetails()
    {
        var VisaInfo = (from vInfo in db.australiavisadetailmaster
                        where vInfo.applicantid == userID && vInfo.universityid == universityID
                        select vInfo).FirstOrDefault();
        if (VisaInfo != null)
        {
            noofpeopleincluded.Value = VisaInfo.noofpeopleincluded;
            if (VisaInfo.applyingfor == 1)
                rblyourself.Checked = true;
            else if (VisaInfo.applyingfor == 2)
                rblselfwithFamily.Checked = true;
            else if (VisaInfo.applyingfor == 3)
                rblyourfamily.Checked = true;
            familyname.Value = VisaInfo.familyname;
            givenname.Value = VisaInfo.givenname;
            if (VisaInfo.knownbyanothername == 1)
                chkanothernameyes.Checked = true;
            else if (VisaInfo.knownbyanothername == 0)
                chkanothernameno.Checked = true;
            anotherfamilyname.Value = VisaInfo.anotherfamilyname;
            anothergivenname.Value = VisaInfo.anothergivenname;
            ownlanguagename1.Value = VisaInfo.ownlanguagename1;
            // ownlanguagename2 = VisaInfo.ownlanguagename2;
            if (VisaInfo.gender == 1)
                chkMale.Checked = true;
            else if (VisaInfo.gender == 0)
                chkFemale.Checked = true;
            if (VisaInfo.dateofbirth != null)
                dateofbirth.Value = Convert.ToDateTime(VisaInfo.dateofbirth).ToString("dd/MMM/yyyy");
            cityofbirth.Value = VisaInfo.cityofbirth;
            if (VisaInfo.countryofbirth != null)
                countryofbirth.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.countryofbirth));
            if (VisaInfo.maritalstatus == 1)
                chkMarried.Checked = true;
            else if (VisaInfo.maritalstatus == 2)
                chkSeparated.Checked = true;
            else if (VisaInfo.maritalstatus == 3)
                chkWidowed.Checked = true;
            else if (VisaInfo.maritalstatus == 4)
                chkEngaged.Checked = true;
            else if (VisaInfo.maritalstatus == 5)
                chkDivorced.Checked = true;
            else if (VisaInfo.maritalstatus == 6)
                chkNever.Checked = true;
            else if (VisaInfo.maritalstatus == 7)
                chkDefacto.Checked = true;
            if (VisaInfo.countryofcitizenship != null)
                countryofcitizenship.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.countryofcitizenship));
            if (VisaInfo.holdothercitizenship == 0)
                chkAnotherCitizenNo.Checked = true;
            else if (VisaInfo.holdothercitizenship == 1)
            {
                chkAnotherCitizenYes.Checked = true;
                if (VisaInfo.anothercountryofcitizenship != null)
                    anothercountryofcitizenship.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.anothercountryofcitizenship));
            }
            if (VisaInfo.havepassport == 0)
                chkPassposrtNo.Checked = true;
            else if (VisaInfo.havepassport == 1)
                chkPassposrtYes.Checked = true;

            passportno.Value = VisaInfo.passportno;
            if (VisaInfo.countryofpassport != null)
                countryofpassport.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.countryofpassport));

            if (VisaInfo.dateofissue != null)
                dateofissue.Value = Convert.ToDateTime(VisaInfo.dateofissue).ToString("dd/MMM/yyyy");
            if (VisaInfo.dateofexpiry != null)
                dateofexpiry.Value = Convert.ToDateTime(VisaInfo.dateofexpiry).ToString("dd/MMM/yyyy");
            placeofissue.Value = VisaInfo.placeofissue;
            applicableidentificationno.Value = VisaInfo.applicableidentificationno;
            anotherIdentitytype1.Value = VisaInfo.anotherIdentitytype1;
            anotherIdentityNo1.Value = VisaInfo.anotherIdentityNo1;
            anotherIdentitytype2.Value = VisaInfo.anotherIdentitytype2;
            anotherIdentityNo2.Value = VisaInfo.anotherIdentityNo2;
            if (VisaInfo.residencecountry != null)
                residencecountry.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.residencecountry));
            residenceaddressLine1.Value = VisaInfo.residenceaddressLine1; ;
            residenceaddressLine2.Value = VisaInfo.residenceaddressLine2; ;
            residenceaddresspostalcode.Value = VisaInfo.residenceaddresspostalcode; ;
            officehoursContactNoOutsideaustralia.Value = VisaInfo.officehoursContactNoOutsideaustralia; ;
            afterhoursContactNoOutsideaustralia.Value = VisaInfo.afterhoursContactNoOutsideaustralia; ;
            australiaresidentialaddline1.Value = VisaInfo.australiaresidentialaddline1; ;
            australiaresidentialaddline2.Value = VisaInfo.australiaresidentialaddline2; ;
            australiaresidentialpostalcode.Value = VisaInfo.australiaresidentialpostalcode; ;
            officehrContactNoInAustralia.Value = VisaInfo.officehrContactNoInAustralia; ;
            afterhrContactNoInAustralia.Value = VisaInfo.afterhrContactNoInAustralia; ;
            correspondenceaddressline1.Value = VisaInfo.correspondenceaddressline1; ;
            correspondenceaddressline2.Value = VisaInfo.correspondenceaddressline2; ;
            correspondenceaddresspoastalcode.Value = VisaInfo.correspondenceaddresspoastalcode; ;
            if (VisaInfo.agreetocommunicate == 0)
                chkagreetocommunicateNo.Checked = true;
            else if (VisaInfo.agreetocommunicate == 1)
                chkagreetocommunicateYes.Checked = true;
            faxno.Value = VisaInfo.faxno; ;
            emailaddress.Value = VisaInfo.emailaddress;
            if (VisaInfo.applicationentrolledinschool == 0)
                chkEnrollNo.Checked = true;
            else if (VisaInfo.applicationentrolledinschool == 1)
                chkEnrolYes.Checked = true;
            if (VisaInfo.solelegalrights == 1)
                chkSoleRightNo.Checked = true;
            else if (VisaInfo.solelegalrights == 2)
                chkSoleRightYes.Checked = true;

            guardiansfamilyname.Value = VisaInfo.guardiansfamilyname;
            guardiansgivenname.Value = VisaInfo.guardiansgivenname;
            guardiansresidentialaddress.Value = VisaInfo.guardiansresidentialaddress;
            guardianspostalcode.Value = VisaInfo.guardianspostalcode;
            guardianscontactnumber.Value = VisaInfo.guardianscontactnumber;
            guardiansrealtionwithstudent.Value = VisaInfo.guardiansrealtionwithstudent;
            guardiansnatureoflegalrights.Value = VisaInfo.guardiansnatureoflegalrights;
            if (VisaInfo.guardiansstatutorydeclartion == 0)
                chkstatutory1No.Checked = true;
            else if (VisaInfo.guardiansstatutorydeclartion == 1)
                chkstatutory1Yes.Checked = true;
            guardiansfamilyname1.Value = VisaInfo.guardiansfamilyname1;
            guardiansgivenname1.Value = VisaInfo.guardiansgivenname1;
            guardiansresidentialaddress1.Value = VisaInfo.guardiansresidentialaddress1;
            guardianspostalcode1.Value = VisaInfo.guardianspostalcode1;
            guardianscontactnumber1.Value = VisaInfo.guardianscontactnumber1;
            guardiansrealtionwithstudent1.Value = VisaInfo.guardiansrealtionwithstudent1;
            guardiansnatureoflegalrights1.Value = VisaInfo.guardiansnatureoflegalrights1;
            if (VisaInfo.guardiansstatutorydeclartion1 == 0)
                chkstatutory2No.Checked = true;
            else if (VisaInfo.guardiansstatutorydeclartion1 == 1)
                chkstatutory2Yes.Checked = true;
            if (VisaInfo.subjectofcourtorder == 0)
                chkcourtorderNo.Checked = true;
            else if (VisaInfo.subjectofcourtorder == 1)
                chkcourtorderYes.Checked = true;
            if (VisaInfo.appliesforAustalianvisa == 0)
                chkappliesNo.Checked = true;
            else if (VisaInfo.appliesforAustalianvisa == 1)
                chkappliesYes.Checked = true;
            if (VisaInfo.currentlyholdaustralianvisa == 0)
                chkHoldNo.Checked = true;
            else if (VisaInfo.currentlyholdaustralianvisa == 1)
                chkHoldYes.Checked = true;
            if (VisaInfo.awaitingforaustralianvisa == 0)
                chkAwaitingNo.Checked = true;
            else if (VisaInfo.awaitingforaustralianvisa == 1)
                chkAwaitingYes.Checked = true;
            nameonvisa.Value = VisaInfo.nameonvisa;
            typeofvisa.Value = VisaInfo.typeofvisa;
            placeofissuevisa.Value = VisaInfo.placeofissuevisa;
            if (VisaInfo.dateissuevisa != null)
                dateissuevisa.Value = Convert.ToDateTime(VisaInfo.dateissuevisa).ToString("dd/MMM/yyyy");
            if (VisaInfo.applicationrefusedorgranted == 1)
                chkvisa1refused.Checked = true;
            else if (VisaInfo.applicationrefusedorgranted == 2)
                chkvisa1granted.Checked = true;

            grantedvisalabelno.Value = VisaInfo.grantedvisalabelno;
            visagrantnumber.Value = VisaInfo.visagrantnumber;
            nameonvisa1.Value = VisaInfo.nameonvisa1;
            typeofvisa1.Value = VisaInfo.typeofvisa1;
            placeofissuevisa1.Value = VisaInfo.placeofissuevisa1;
            if (VisaInfo.dateissuevisa1 != null)
                dateissuevisa1.Value = Convert.ToDateTime(VisaInfo.dateissuevisa1).ToString("dd/MMM/yyyy");

            if (VisaInfo.applicationrefusedorgranted1 == 1)
                chkvisa2refused.Checked = true;
            else if (VisaInfo.applicationrefusedorgranted1 == 2)
                chkvisa2granted.Checked = true;
            grantedvisalabelno1.Value = VisaInfo.grantedvisalabelno1;
            visagrantnumber1.Value = VisaInfo.visagrantnumber1;
            if (VisaInfo.applyingfortype == 1)
                chkPartC.Checked = true;
            else if (VisaInfo.applyingfortype == 2)
                chkPartB.Checked = true;
            if (VisaInfo.applyinginaustralia == 0)
                chkapplyingNo.Checked = true;
            else if (VisaInfo.applyinginaustralia == 1)
                chkapplyingYes.Checked = true;
            if (VisaInfo.docurrentlyholdstudentvisa == 0)
                chkcurrentlyholdNo.Checked = true;
            else if (VisaInfo.docurrentlyholdstudentvisa == 1)
                chkcurrentlyholdYes.Checked = true;

            highestqualification.Value = VisaInfo.highestqualification;
            nameofeducationprovider1.Value = VisaInfo.nameofeducationprovider1;
            nameofeducationprovider2.Value = VisaInfo.nameofeducationprovider2;
            addressofeducationprovider.Value = VisaInfo.addressofeducationprovider;
            educationproviderpostalcode.Value = VisaInfo.educationproviderpostalcode;
            if (VisaInfo.commencementdate != null)
                commencementdate.Value = Convert.ToDateTime(VisaInfo.commencementdate).ToString("dd/MMM/yyyy");
            if (VisaInfo.finishdate != null)
                finishdate.Value = Convert.ToDateTime(VisaInfo.finishdate).ToString("dd/MMM/yyyy");

            if (VisaInfo.educationdocumentattached == 0)
                chkeducationdocumentattachedNo.Checked = true;
            else if (VisaInfo.educationdocumentattached == 1)
                chkeducationdocumentattachedYes.Checked = true;

            otherundertakcoursename1.Value = VisaInfo.otherundertakcoursename1;
            othernameofeducationprovider1.Value = VisaInfo.othernameofeducationprovider1;
            othernameofeducationprovider2.Value = VisaInfo.othernameofeducationprovider2;
            otheraddressofeducationprovider1.Value = VisaInfo.otheraddressofeducationprovider1;
            othereduproviderpostalcode1.Value = VisaInfo.othereduproviderpostalcode1;
            if (VisaInfo.othercommencementdate1 != null)
                othercommencementdate1.Value = Convert.ToDateTime(VisaInfo.othercommencementdate1).ToString("dd/MMM/yyyy");
            if (VisaInfo.otherfinishdate1 != null)
                otherfinishdate1.Value = Convert.ToDateTime(VisaInfo.otherfinishdate1).ToString("dd/MMM/yyyy");
            if (VisaInfo.otherdocumentattached1 == 0)
                chkotherdocumentattached1No.Checked = true;
            else if (VisaInfo.otherdocumentattached1 == 1)
                chkotherdocumentattached1Yes.Checked = true;

            otherundertakcoursename2.Value = VisaInfo.otherundertakcoursename2;
            othernameofeducationprovider21.Value = VisaInfo.othernameofeducationprovider21;
            othernameofeducationprovider22.Value = VisaInfo.othernameofeducationprovider22;
            otheraddressofeducationprovider2.Value = VisaInfo.otheraddressofeducationprovider2;
            othereduproviderpostalcode2.Value = VisaInfo.othereduproviderpostalcode2;
            if (VisaInfo.othercommencementdate2 != null)
                othercommencementdate2.Value = Convert.ToDateTime(VisaInfo.othercommencementdate2).ToString("dd/MMM/yyyy");
            if (VisaInfo.otherfinishdate2 != null)
                otherfinishdate2.Value = Convert.ToDateTime(VisaInfo.otherfinishdate2).ToString("dd/MMM/yyyy");

            if (VisaInfo.otherdocumentattached2 == 0)
                chkotherdocumentattached2No.Checked = true;
            else if (VisaInfo.otherdocumentattached2 == 1)
                chkotherdocumentattached2Yes.Checked = true;
            if (VisaInfo.ispreviouslystudiedinaustralia == 0)
                chkispreviouslyNo.Checked = true;
            else if (VisaInfo.ispreviouslystudiedinaustralia == 1)
                chkispreviouslyYes.Checked = true;

            previouslycoursename.Value = VisaInfo.previouslycoursename;
            previouslycourseeducationproviderName.Value = VisaInfo.previouslycourseeducationproviderName;
            if (VisaInfo.previouslycourseDateFrom != null)
                previouslycourseDateFrom.Value = Convert.ToDateTime(VisaInfo.previouslycourseDateFrom).ToString("MMM/yyyy");
            if (VisaInfo.previouslycourseDateTo != null)
                previouslycourseDateTo.Value = Convert.ToDateTime(VisaInfo.previouslycourseDateTo).ToString("MMM/yyyy");
            previouslycoursename1.Value = VisaInfo.previouslycoursename1;
            previouslycourseeducationproviderName1.Value = VisaInfo.previouslycourseeducationproviderName1;
            if (VisaInfo.previouslycourseDateFrom1 != null)
                previouslycourseDateFrom1.Value = Convert.ToDateTime(VisaInfo.previouslycourseDateFrom1).ToString("MMM/yyyy");
            if (VisaInfo.previouslycourseDateTo1 != null)
                previouslycourseDateTo1.Value = Convert.ToDateTime(VisaInfo.previouslycourseDateTo1).ToString("MMM/yyyy");

            intendcoursename.Value = VisaInfo.intendcoursename;
            intendedprovidername.Value = VisaInfo.intendedprovidername;
            if (VisaInfo.intendedcommencementdate != null)
                intendedcommencementdate.Value = Convert.ToDateTime(VisaInfo.intendedcommencementdate).ToString("dd/MMM/yyyy");
            if (VisaInfo.intendedfinishdate != null)
                intendedfinishdate.Value = Convert.ToDateTime(VisaInfo.intendedfinishdate).ToString("dd/MMM/yyyy");
            if (VisaInfo.haveenrolment == 0)
                chkhaveenrolmentNo.Checked = true;
            else
                chkhaveenrolmentYes.Checked = true;
            if (VisaInfo.haveenrolmentevidence == 0)
                chkhaveenrolmentevidenceNo.Checked = true;
            else if (VisaInfo.haveenrolmentevidence == 1)
                chkhaveenrolmentevidenceYes.Checked = true;

            intendcoursename1.Value = VisaInfo.intendcoursename1;
            intendedprovidername1.Value = VisaInfo.intendedprovidername1;
            if (VisaInfo.intendedcommencementdate1 != null)
                intendedcommencementdate1.Value = Convert.ToDateTime(VisaInfo.intendedcommencementdate1).ToString("dd/MMM/yyyy");
            if (VisaInfo.intendedfinishdate1 != null)
                intendedfinishdate1.Value = Convert.ToDateTime(VisaInfo.intendedfinishdate1).ToString("dd/MMM/yyyy");
            if (VisaInfo.haveenrolment1 == 0)
                chkhaveenrolment1No.Checked = true;
            else if (VisaInfo.haveenrolment1 == 1)
                chkhaveenrolment1Yes.Checked = true;
            if (VisaInfo.haveenrolmentevidence1 == 0)
                chkhaveenrolmentevidence1No.Checked = true;
            else if (VisaInfo.haveenrolmentevidence1 == 1)
                chkhaveenrolmentevidence1Yes.Checked = true;

            intendcoursename2.Value = VisaInfo.intendcoursename2;
            intendedprovidername2.Value = VisaInfo.intendedprovidername2;
            if (VisaInfo.intendedcommencementdate2 != null)
                intendedcommencementdate2.Value = Convert.ToDateTime(VisaInfo.intendedcommencementdate2).ToString("dd/MMM/yyyy");
            if (VisaInfo.intendedfinishdate2 != null)
                intendedfinishdate2.Value = Convert.ToDateTime(VisaInfo.intendedfinishdate2).ToString("dd/MMM/yyyy");
            if (VisaInfo.haveenrolment2 == 0)
                chkhaveenrolment2No.Checked = true;
            else if (VisaInfo.haveenrolment2 == 1)
                chkhaveenrolment2Yes.Checked = true;
            if (VisaInfo.haveenrolmentevidence2 == 0)
                chkhaveenrolmentevidence2No.Checked = true;
            else if (VisaInfo.haveenrolmentevidence2 == 1)
                chkhaveenrolmentevidence2Yes.Checked = true;

            if (VisaInfo.applicantassesmentlevel == 0)
                chkapplicantassesmentlevelNo.Checked = true;
            else if (VisaInfo.applicantassesmentlevel == 1)
                chkapplicantassesmentlevelYes.Checked = true;
            if (VisaInfo.englishlangtest == 0)
                chkenglishlangtestNo.Checked = true;
            else if (VisaInfo.englishlangtest == 1)
                chkenglishlangtestYes.Checked = true;

            englishlangtestname.Value = VisaInfo.englishlangtestname;
            if (VisaInfo.englishlangtestDate != null)
                englishlangtestDate.Value = Convert.ToDateTime(VisaInfo.englishlangtestDate).ToString("dd/MMM/yyyy");
            englishlangtestcetificateno.Value = VisaInfo.englishlangtestcetificateno;
            if (VisaInfo.studiedmorethan5yrinothercountry == 0)
                chkstudiedmorethan5yrinothercountryNo.Checked = true;
            else
                chkstudiedmorethan5yrinothercountryYes.Checked = true;
            if (VisaInfo.employmenthistoryFromDate != null)
                employmenthistoryFromDate.Value = Convert.ToDateTime(VisaInfo.employmenthistoryFromDate).ToString("MMM/yyyy");
            if (VisaInfo.employmenthistoryToDate != null)
                employmenthistoryToDate.Value = Convert.ToDateTime(VisaInfo.employmenthistoryToDate).ToString("MMM/yyyy");
            employerInfoL0.Value = VisaInfo.employerInfoL0;
            employerInfoL1.Value = VisaInfo.employerInfoL1;
            typeofbusiness.Value = VisaInfo.typeofbusiness;
            employeroccupation.Value = VisaInfo.employeroccupation;
            salarylevel.Value = VisaInfo.salarylevel;

            if (VisaInfo.leavingdocAttch == 0)
                chkleavingdocAttchNo.Checked = true;
            else if (VisaInfo.leavingdocAttch == 1)
                chkleavingdocAttchYes.Checked = true;
            if (VisaInfo.employmenthistoryFromDate1 != null)
                employmenthistoryFromDate1.Value = Convert.ToDateTime(VisaInfo.employmenthistoryFromDate1).ToString("MMM/yyyy");
            if (VisaInfo.employmenthistoryToDate1 != null)
                employmenthistoryToDate1.Value = Convert.ToDateTime(VisaInfo.employmenthistoryToDate1).ToString("MMM/yyyy");
            employerInfoL2.Value = VisaInfo.employerInfoL2;
            employerInfoL3.Value = VisaInfo.employerInfoL3;
            typeofbusiness1.Value = VisaInfo.typeofbusiness1;
            employeroccupation1.Value = VisaInfo.employeroccupation1;
            salarylevel1.Value = VisaInfo.salarylevel1;
            if (VisaInfo.leavingdocAttch1 == 0)
                chkleavingdocAttch1No.Checked = true;
            else if (VisaInfo.leavingdocAttch1 == 1)
                chkleavingdocAttch1Yes.Checked = true;
            if (VisaInfo.currentlyemployed == 0)
                chkcurrentlyemployedNo.Checked = true;
            else if (VisaInfo.currentlyemployed == 1)
                chkcurrentlyemployedYes.Checked = true;

            if (VisaInfo.ifnoThenOption == 1)
                rblStudent.Checked = true;
            else if (VisaInfo.ifnoThenOption == 2)
                rblunemployed.Checked = true;
            else if (VisaInfo.ifnoThenOption == 3)
                rblOther.Checked = true;

            otherdescription1.Value = VisaInfo.otherdescription1;
            otherdescription2.Value = VisaInfo.otherdescription2;
            position.Value = VisaInfo.position;
            employername.Value = VisaInfo.employername;
            employeraddress.Value = VisaInfo.employeraddress;
            employercontactno.Value = VisaInfo.employercontactno;
            if (VisaInfo.evidenceofemployement == 0)
                rblevidenceofemployementNo.Checked = true;
            else if (VisaInfo.evidenceofemployement == 1)
                rblevidenceofemployementYes.Checked = true;
            if (VisaInfo.currentlystudentinaustralia == 0)
                rblcurrentlystudentinaustraliaNo.Checked = true;
            else if (VisaInfo.currentlystudentinaustralia == 1)
                rblcurrentlystudentinaustraliaYes.Checked = true;
            if (VisaInfo.joboffered == 0)
                chkjobofferedNo.Checked = true;
            else if (VisaInfo.joboffered == 1)
                chkjobofferedYes.Checked = true;

            kindofemployementseeking.Value = VisaInfo.kindofemployementseeking;
            jobofferedname.Value = VisaInfo.jobofferedname;
            jobofferedaddress.Value = VisaInfo.jobofferedaddress;
            jobofferedcontactno.Value = VisaInfo.jobofferedcontactno;
            titleofpositionofferef.Value = VisaInfo.titleofpositionofferef;
            immediaterelativename.Value = VisaInfo.immediaterelativename;
            immediaterelativerelationship.Value = VisaInfo.immediaterelativerelationship;
            if (VisaInfo.immediaterelativeDob != null)
                immediaterelativeDob.Value = Convert.ToDateTime(VisaInfo.immediaterelativeDob).ToString("dd/MMM/yyyy");
            immediaterelativeaddress.Value = VisaInfo.immediaterelativeaddress;
            immediaterelativepostalcode.Value = VisaInfo.immediaterelativepostalcode;
            immediaterelativeimmigrationstatus.Value = VisaInfo.immediaterelativeimmigrationstatus;
            if (VisaInfo.immediaterelativeDateofarrival != null)
                immediaterelativeDateofarrival.Value = Convert.ToDateTime(VisaInfo.immediaterelativeDateofarrival).ToString("dd/MMM/yyyy");
            immediaterelativename1.Value = VisaInfo.immediaterelativename1;
            immediaterelativerelationship1.Value = VisaInfo.immediaterelativerelationship1;
            if (VisaInfo.immediaterelativeDob1 != null)
                immediaterelativeDob1.Value = Convert.ToDateTime(VisaInfo.immediaterelativeDob1).ToString("dd/MMM/yyyy");
            immediaterelativeaddress1.Value = VisaInfo.immediaterelativeaddress1;
            immediaterelativepostalcode1.Value = VisaInfo.immediaterelativepostalcode1;
            immediaterelativeimmigrationstatus1.Value = VisaInfo.immediaterelativeimmigrationstatus1;
            if (VisaInfo.immediaterelativedateofarrival1 != null)
                immediaterelativedateofarrival1.Value = Convert.ToDateTime(VisaInfo.immediaterelativedateofarrival1).ToString("dd/MMM/yyyy");
            closestrelativename.Value = VisaInfo.closestrelativename;
            closestrelativeaddress.Value = VisaInfo.closestrelativeaddress;
            closestrelativerelationship.Value = VisaInfo.closestrelativerelationship;
            closestrelativepostalcode.Value = VisaInfo.closestrelativepostalcode;
            closestrelativecontactnumber.Value = VisaInfo.closestrelativecontactnumber;

            if (VisaInfo.applyinaustraliaassecschool == 0)
                chkapplyinaustraliaassecschoolNo.Checked = true;
            else if (VisaInfo.applyinaustraliaassecschool == 1)
                chkapplyinaustraliaassecschoolYes.Checked = true;
            if (VisaInfo.issufficientfund == 0)
                chkissufficientfundNo.Checked = true;
            else if (VisaInfo.issufficientfund == 1)
                chkissufficientfundYes.Checked = true;
            if (VisaInfo.declarationDate42 != null)
                declarationDate42.Value = Convert.ToDateTime(VisaInfo.declarationDate42).ToString("dd/MMM/yyyy");

            if (VisaInfo.ifFamilyunitcompletedformpartC == 1)
                chkFamilyunitcompletedformpartCNo.Checked = true;
            else if (VisaInfo.ifFamilyunitcompletedformpartC == 2)
                chkFamilyunitcompletedformpartCYes.Checked = true;
            if (VisaInfo.studymorethanthreemonthpartC == 1)
                chkstudymorethanthreemonthpartCNo.Checked = true;
            else if (VisaInfo.studymorethanthreemonthpartC == 2)
                chkstudymorethanthreemonthpartCYes.Checked = true;

            studentnamepartC.Value = VisaInfo.studentnamepartC;
            relationshiptostudentpartC.Value = VisaInfo.relationshiptostudentpartC;
            if (VisaInfo.studentdobpartC != null)
                studentdobpartC.Value = Convert.ToDateTime(VisaInfo.studentdobpartC).ToString("dd/MMM/yyyy");
            citizenshipofstudentpartC.Value = VisaInfo.citizenshipofstudentpartC;
            studentaddresspartC.Value = VisaInfo.studentaddresspartC;
            studentaddpostalcodepartC.Value = VisaInfo.studentaddpostalcodepartC;
            typeofstudentvisaheldpartC.Value = VisaInfo.typeofstudentvisaheldpartC;
            assessmentlevelpartC.Value = VisaInfo.assessmentlevelpartC;
            if (VisaInfo.assessmentgrantdatepartC != null)
                assessmentgrantdatepartC.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            if (VisaInfo.assessmentexpirydatepartC != null)
                assessmentexpirydatepartC.Value = Convert.ToDateTime(VisaInfo.assessmentexpirydatepartC).ToString("dd/MMM/yyyy");

            if (VisaInfo.isstudentjoiningdeclarepartC == 1)
                chkisstudentjoiningdeclarepartCNo.Checked = true;
            else if (VisaInfo.isstudentjoiningdeclarepartC == 2)
                chkisstudentjoiningdeclarepartCYes.Checked = true;
            if (VisaInfo.isstudentjoiningsatisfiedconditionpartC == 1)
                chkisstudentjoiningsatisfiedconditionpartCNo.Checked = true;
            else if (VisaInfo.isstudentjoiningsatisfiedconditionpartC == 2)
                chkisstudentjoiningsatisfiedconditionpartCYes.Checked = true;
            if (VisaInfo.suficientfundpartC == 1)
                chksuficientfundpartCNo.Checked = true;
            else if (VisaInfo.suficientfundpartC == 2)
                chksuficientfundpartCYes.Checked = true;
            if (VisaInfo.livedoutsidecountryc == 0)
                rbllivedoutsidecountrycNo.Checked = true;
            else if (VisaInfo.livedoutsidecountryc == 1)
                rbllivedoutsidecountrycYes.Checked = true;



            familymembername.Value = VisaInfo.familymembername;
            if (VisaInfo.familyresidencecountry != null)
                familyresidencecountry.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.familyresidencecountry));
            if (VisaInfo.assessmentgrantdatepartC != null)
                familyresidenceFromdate.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            if (VisaInfo.assessmentgrantdatepartC != null)
                familyresidenceTodate.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            familymembername1.Value = VisaInfo.familymembername1;
            if (VisaInfo.familyresidencecountry1 != null)
                familyresidencecountry1.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.familyresidencecountry1));
            if (VisaInfo.assessmentgrantdatepartC != null)
                familyresidenceFromdate1.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            if (VisaInfo.assessmentgrantdatepartC != null)
                familyresidenceTodate1.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            familymembername2.Value = VisaInfo.familymembername2;
            if (VisaInfo.familyresidencecountry2 != null)
                familyresidencecountry2.Value = objCom.GetCountryDiscription(Convert.ToInt32(VisaInfo.familyresidencecountry2));
            if (VisaInfo.assessmentgrantdatepartC != null)
                familyresidenceFromdate2.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            if (VisaInfo.assessmentgrantdatepartC != null)
                familyresidenceTodate2.Value = Convert.ToDateTime(VisaInfo.assessmentgrantdatepartC).ToString("dd/MMM/yyyy");
            if (VisaInfo.haveworkforaustralianhospital == 0)
                rblhaveworkforaustralianhospitalNo.Checked = true;
            else if (VisaInfo.haveworkforaustralianhospital == 1)
                rblhaveworkforaustralianhospitalYes.Checked = true;

            descriptionofhospitalwork.Value = VisaInfo.descriptionofhospitalwork;
            if (VisaInfo.haveworkforaustralianpreschool == 0)
                rblhaveworkforaustralianpreschoolNo.Checked = true;
            else if (VisaInfo.haveworkforaustralianpreschool == 1)
                rblhaveworkforaustralianpreschoolYes.Checked = true;

            descriptionofpreschoolwork.Value = VisaInfo.descriptionofpreschoolwork;
            if (VisaInfo.haveanyhealthissue == 0)
                rblhaveanyhealthissueNo.Checked = true;
            else if (VisaInfo.haveanyhealthissue == 1)
                rblhaveanyhealthissueYes.Checked = true;
            detailofhealthissue.Value = VisaInfo.detailofhealthissue;
            if (VisaInfo.requireassistancewithmobility == 0)
                rblrequireassistancewithmobilityNo.Checked = true;
            else if (VisaInfo.requireassistancewithmobility == 1)
                rblrequireassistancewithmobilityYes.Checked = true;
            descriptionofmobility.Value = VisaInfo.descriptionofmobility;
            if (VisaInfo.haevmedicalprocedures == 0)
                rblhaevmedicalproceduresNo.Checked = true;
            else if (VisaInfo.haevmedicalprocedures == 1)
                rblhaevmedicalproceduresYes.Checked = true;

            proceduresdescription.Value = VisaInfo.proceduresdescription;
            if (VisaInfo.havemedicalfollowup == 0)
                rblhavemedicalfollowupNo.Checked = true;
            else if (VisaInfo.havemedicalfollowup == 1)
                rblhavemedicalfollowupYes.Checked = true;

            medicalfollowupdescription.Value = VisaInfo.medicalfollowupdescription;

            if (VisaInfo.haveconvictedofcrime == 0)
                rblhaveconvictedofcrimeNo.Checked = true;
            else if (VisaInfo.haveconvictedofcrime == 1)
                rblhaveconvictedofcrimeYes.Checked = true;
            if (VisaInfo.havechargeoffence == 0)
                rblhavechargeoffenceNo.Checked = true;
            else if (VisaInfo.havechargeoffence == 1)
                rblhavechargeoffenceYes.Checked = true;
            if (VisaInfo.havecriminaloffence == 0)
                rblhavecriminaloffenceNo.Checked = true;
            else if (VisaInfo.havecriminaloffence == 1)
                chkhavecriminaloffenceYes.Checked = true;
            if (VisaInfo.haveremovedfromcountry == 0)
                rblhaveremovedfromcountryNo.Checked = true;
            else if (VisaInfo.haveremovedfromcountry == 1)
                rblhaveremovedfromcountryYes.Checked = true;
            if (VisaInfo.havetoavoidbeingremoved == 0)
                rblhavetoavoidbeingremovedNo.Checked = true;
            else if (VisaInfo.havetoavoidbeingremoved == 1)
                rblhavetoavoidbeingremovedYes.Checked = true;
            if (VisaInfo.havebeenexcluded == 0)
                rblhavebeenexcludedNo.Checked = true;
            else if (VisaInfo.havebeenexcluded == 1)
                rblhavebeenexcludedYes.Checked = true;
            if (VisaInfo.havehumanrightscrime == 0)
                rblhavehumanrightscrimeNo.Checked = true;
            else if (VisaInfo.havehumanrightscrime == 1)
                rblhavehumanrightscrimeYes.Checked = true;
            if (VisaInfo.haverisktonationalsecurity == 0)
                rblhaverisktonationalsecurityNo.Checked = true;
            else if (VisaInfo.haverisktonationalsecurity == 1)
                rblhaverisktonationalsecurityYes.Checked = true;
            if (VisaInfo.haveoutstandingdebets == 0)
                rblhaveoutstandingdebetsNo.Checked = true;
            else if (VisaInfo.haveoutstandingdebets == 1)
                rblhaveoutstandingdebetsYes.Checked = true;
            if (VisaInfo.haveconvictedoffence == 0)
                rblhaveconvictedoffenceNo.Checked = true;
            else if (VisaInfo.haveconvictedoffence == 1)
                chkhaveconvictedoffenceYes.Checked = true;
            if (VisaInfo.haveservedinmilitaryforce == 0)
                rblhaveservedinmilitaryforceNo.Checked = true;
            else if (VisaInfo.haveservedinmilitaryforce == 1)
                rblhaveservedinmilitaryforceYes.Checked = true;
            descripofcharacterdeclaration.Value = VisaInfo.descripofcharacterdeclaration;
            if (VisaInfo.under18age == 0)
                rblunder18ageNo.Checked = true;
            else if (VisaInfo.under18age == 1)
                rblunder18ageYes.Checked = true;
            if (VisaInfo.parentsituation == 1)
                rblparentsituationNo.Checked = true;
            else if (VisaInfo.parentsituation == 2)
                rblparentsituationYes.Checked = true;
            else if (VisaInfo.parentsituation == 3)
                rblparentsituationNot.Checked = true;
            if (VisaInfo.holdorappliedVisa == 0)
                rblholdorappliedVisaNo.Checked = true;
            else if (VisaInfo.holdorappliedVisa == 1)
                rblholdorappliedVisaYes.Checked = true;
            parentfamilynamePartD.Value = VisaInfo.parentfamilynamePartD;
            parentgivennamePartD.Value = VisaInfo.parentgivennamePartD;
            if (VisaInfo.parentDateofBirthpartD != null)
                parentDateofBirthpartD.Value = Convert.ToDateTime(VisaInfo.parentDateofBirthpartD).ToString("dd/MMM/yyyy");
            parentaddresspartD.Value = VisaInfo.parentaddresspartD;
            if (VisaInfo.parentvisastatusPartD == 1)
                rblparentvisastatusPartDNo.Checked = true;
            else if (VisaInfo.parentvisastatusPartD == 2)
                rblparentvisastatusPartDYes.Checked = true;
            parentvisalabelno.Value = VisaInfo.medicalfollowupdescription;
            parentvisadigitno.Value = VisaInfo.medicalfollowupdescription;
            parentvisaperiodofstay.Value = VisaInfo.parentvisaperiodofstay;
            if (VisaInfo.parentvisaexpirydate != null)
                parentvisaexpirydate.Value = Convert.ToDateTime(VisaInfo.parentvisaexpirydate).ToString("dd/MMM/yyyy");
            parentvisaappliedgovtofficename.Value = VisaInfo.parentvisaappliedgovtofficename;
            if (VisaInfo.havearrangementwithrelative == 0)
                rblhavearrangementwithrelativeNo.Checked = true;
            else if (VisaInfo.havearrangementwithrelative == 1)
                rblhavearrangementwithrelativeYes.Checked = true;

            familyNameofrelative.Value = VisaInfo.familyNameofrelative;
            givenNameofrelative.Value = VisaInfo.givenNameofrelative;
            if (VisaInfo.dateOfBirthofrelative != null)
                dateOfBirthofrelative.Value = Convert.ToDateTime(VisaInfo.dateOfBirthofrelative).ToString("dd/MMM/yyyy");
            addressofRelative.Value = VisaInfo.addressofRelative;
            relationshipofrelative.Value = VisaInfo.relationshipofrelative;
            if (VisaInfo.relativeresideasstatus == 1)
                rblrelativeresideasstatusPerm.Checked = true;
            else if (VisaInfo.relativeresideasstatus == 2)
                rblrelativeresideasstatusTemp.Checked = true;
            permitedtostayfor.Value = VisaInfo.permitedtostayfor;
            if (VisaInfo.permitedtostayDate != null)
                permitedtostayDate.Value = Convert.ToDateTime(VisaInfo.permitedtostayDate).ToString("dd/MMM/yyyy");
            if (VisaInfo.guardianvisasatus == 1)
                rblguardianvisasatusGranted.Checked = true;
            else
                rblkguardianvisasatusNot.Checked = true;
            guardianvisano.Value = VisaInfo.guardianvisano;
            guardianvisaperiodofstay.Value = VisaInfo.guardianvisaperiodofstay;
            if (VisaInfo.guardianvisaperiodofstayDate != null)
                guardianvisaperiodofstayDate.Value = Convert.ToDateTime(VisaInfo.guardianvisaperiodofstayDate).ToString("dd/MMM/yyyy");
            govermentoffName.Value = VisaInfo.govermentoffName;
            periodofstayofguardian.Value = VisaInfo.periodofstayofguardian;
            if (VisaInfo.havewelfarearrangements == 0)
                rblhavewelfarearrangementsNo.Checked = true;
            else if (VisaInfo.havewelfarearrangements == 1)
                rblhavewelfarearrangementsYes.Checked = true;

            parentsignature.Value = VisaInfo.parentsignature;
            if (VisaInfo.parentsignatureDate != null)
                parentsignatureDate.Value = Convert.ToDateTime(VisaInfo.parentsignatureDate).ToString("dd/MMM/yyyy");
            parentFullname.Value = VisaInfo.parentFullname;
            if (VisaInfo.assessmentgrantdatepartC != null)
                parentRelationshipwithstudent.Value = VisaInfo.parentRelationshipwithstudent;
            parentsignature1.Value = VisaInfo.parentsignature1;
            if (VisaInfo.parentsignatureDate1 != null)
                parentsignatureDate1.Value = Convert.ToDateTime(VisaInfo.parentsignatureDate1).ToString("dd/MMM/yyyy");
            parentFullname1.Value = VisaInfo.parentFullname1;
            parentRelationshipwithstudent1.Value = VisaInfo.parentRelationshipwithstudent1;

            if (VisaInfo.havesolelegalrights == 0)
                rblhavesolelegalrightsNo.Checked = true;
            else if (VisaInfo.havesolelegalrights == 1)
                rblhavesolelegalrightsYes.Checked = true;
            personname.Value = VisaInfo.personname;
            personaddress.Value = VisaInfo.personaddress;
            personcontactno.Value = VisaInfo.personcontactno;
            personrelationship.Value = VisaInfo.personrelationship;
            personnatureoflegalrights.Value = VisaInfo.personnatureoflegalrights;

            parentsignatur67.Value = VisaInfo.parentsignatur67;
            if (VisaInfo.signDate != null)
                signDate.Value = Convert.ToDateTime(VisaInfo.signDate).ToString("dd/MMM/yyyy");
            fullname67.Value = VisaInfo.fullname67;
            relationship67.Value = VisaInfo.relationship67;
            parentsignatur671.Value = VisaInfo.parentsignatur671;
            if (VisaInfo.signDate1 != null)
                signDate1.Value = Convert.ToDateTime(VisaInfo.signDate1).ToString("dd/MMM/yyyy");
            fullname671.Value = VisaInfo.fullname671;
            relationship671.Value = VisaInfo.relationship671;
            if (VisaInfo.havereceiveassistance == 0)
                rblhavereceiveassistanceNo.Checked = true;
            else if (VisaInfo.havereceiveassistance == 1)
                rblhavereceiveassistanceYes.Checked = true;
            if (VisaInfo.title == "Mr")
                rblTitleMr.Checked = true;
            else if (VisaInfo.title == "Mrs")
                rblTitleMrs.Checked = true;
            else if (VisaInfo.title == "Miss")
                rblTitleMiss.Checked = true;
            else if (VisaInfo.title == "Ms")
                rblTitleMs.Checked = true;
            else if (VisaInfo.title == "Other")
                rblTitleOther.Checked = true;

            assistedpersonfamilyname.Value = VisaInfo.assistedpersonfamilyname;
            assistedpersongivenname.Value = VisaInfo.assistedpersongivenname;
            assistedpersonaddress.Value = VisaInfo.assistedpersonaddress;
            assistedpersonofficeno.Value = VisaInfo.assistedpersonofficeno;
            assistedpersonmobileno.Value = VisaInfo.assistedpersonmobileno;
            if (VisaInfo.isregisteredwithMARA == 0)
                rblisregisteredwithMARANo.Checked = true;
            else if (VisaInfo.isregisteredwithMARA == 1)
                rblisregisteredwithMARAYes.Checked = true;
            if (VisaInfo.haveeducationagent == 0)
                rblhaveeducationagentNo.Checked = true;
            else if (VisaInfo.haveeducationagent == 1)
                rblhaveeducationagentYes.Checked = true;



            businessname.Value = VisaInfo.businessname;
            registrationno.Value = VisaInfo.registrationno;
            educationagentaddress.Value = VisaInfo.educationagentaddress;
            educationagentemail.Value = VisaInfo.educationagentemail;
            educationagentofficeno.Value = VisaInfo.educationagentofficeno;
            educationagentphoneno.Value = VisaInfo.educationagentphoneno;
            educationagentfaxno.Value = VisaInfo.educationagentfaxno;
            if (VisaInfo.haveagentinaustralia == 0)
                rblhaveagentinaustraliaNo.Checked = true;
            else if (VisaInfo.haveagentinaustralia == 1)
                rblhaveagentinaustraliaYes.Checked = true;
            if (VisaInfo.havepaytoassistance == 0)
                rblhavepaytoassistanceNo.Checked = true;
            else if (VisaInfo.havepaytoassistance == 1)
                rblhavepaytoassistanceYes.Checked = true;
            howmuchyoupay.Value = VisaInfo.howmuchyoupay;
            giftgiven.Value = VisaInfo.giftgiven;
            valueofgift.Value = VisaInfo.valueofgift;


            if (VisaInfo.havewrittencommunications == 1)
                rblhavewrittencommunicationsMyself.Checked = true;
            else if (VisaInfo.havewrittencommunications == 2)
                rblhavewrittencommunicationsMigrationagent.Checked = true;
            else if (VisaInfo.havewrittencommunications == 3)
                rblhavewrittencommunicationsOffshoreagent.Checked = true;
            else if (VisaInfo.havewrittencommunications == 4)
                rblhavewrittencommunicationsAgentExmpted.Checked = true;
            else if (VisaInfo.havewrittencommunications == 5)
                rblhavewrittencommunicationsAuthorised.Checked = true;

            if (VisaInfo.haveauthorisedperson == 0)
                rblhaveauthorisedpersonNo.Checked = true;
            else if (VisaInfo.haveauthorisedperson == 1)
                rblhaveauthorisedpersonYes.Checked = true;

            if (VisaInfo.authorisedpersontitle == "Mr")
                rblauthorisedTitleMr.Checked = true;
            else if (VisaInfo.authorisedpersontitle == "Mrs")
                rblauthorisedTitleMrs.Checked = true;
            else if (VisaInfo.authorisedpersontitle == "Miss")
                rblauthorisedTitleMiss.Checked = true;
            else if (VisaInfo.authorisedpersontitle == "Ms")
                rblauthorisedTitleMs.Checked = true;
            else if (VisaInfo.authorisedpersontitle == "Other")
                rblauthorisedTitleOther.Checked = true;

            authorisedpersofamilynname.Value = VisaInfo.authorisedpersofamilynname;
            authorisedpersongivenname.Value = VisaInfo.authorisedpersongivenname;
            authorisedpersonaddress.Value = VisaInfo.authorisedpersonaddress;
            authorisedpersonofficeno.Value = VisaInfo.authorisedpersonofficeno;
            authorisedpersonmobileno.Value = VisaInfo.authorisedpersonmobileno;
            if (VisaInfo.haveagreetocommunicate == 0)
                rblhaveagreetocommunicateNo.Checked = true;
            else if (VisaInfo.haveagreetocommunicate == 1)
                rblhaveagreetocommunicateYes.Checked = true;

            Faxnumber.Value = VisaInfo.Faxnumber;
            authorizedpersonEmailaddress.Value = VisaInfo.authorizedpersonEmailaddress;
            signatureauthorizedperson.Value = VisaInfo.signatureauthorizedperson;
            if (VisaInfo.creditcardexpirydate != null)
                dateofsign.Value = Convert.ToDateTime(VisaInfo.creditcardexpirydate).ToString("dd/MMM/yyyy");

            migratioagentNo.Value = VisaInfo.migratioagentNo;
            offshoreagentId.Value = VisaInfo.offshoreagentId;
            if (VisaInfo.agenttitle == "Mr")
                rblagentTitleMr.Checked = true;
            else if (VisaInfo.agenttitle == "Mrs")
                rblagentTitleMrs.Checked = true;
            else if (VisaInfo.agenttitle == "Miss")
                rblagentTitleMiss.Checked = true;
            else if (VisaInfo.agenttitle == "Ms")
                rblagentTitleMs.Checked = true;
            else if (VisaInfo.agenttitle == "Other")
                rblagentTitleOther.Checked = true;
            agentfamilyname.Value = VisaInfo.agentfamilyname;
            agentgivenname.Value = VisaInfo.agentgivenname;
            agentcompanyname.Value = VisaInfo.agentcompanyname;
            agenntaddress.Value = VisaInfo.agenntaddress;
            agentofficeno.Value = VisaInfo.agentofficeno;
            agentmobileno.Value = VisaInfo.agentmobileno;
            if (VisaInfo.agentagreetocommunicate == 0)
                rblagentagreetocommunicateNo.Checked = true;
            else if (VisaInfo.agentagreetocommunicate == 1)
                rblagentagreetocommunicateYes.Checked = true;
            agentfaxno.Value = VisaInfo.agentfaxno;
            agentemailaddress.Value = VisaInfo.agentemailaddress;
            agentsignature.Value = VisaInfo.agentsignature;
            if (VisaInfo.agentsigndate != null)
                agentsigndate.Value = Convert.ToDateTime(VisaInfo.agentsigndate).ToString("dd/MMM/yyyy");

            if (VisaInfo.paymentmethod == 1)
                rblpaymentmethodBankCheque.Checked = true;
            else if (VisaInfo.paymentmethod == 2)
                rblpaymentmethodMoneyOrder.Checked = true;
            else if (VisaInfo.paymentmethod == 3)
                rblpaymentmethodDC.Checked = true;
            else if (VisaInfo.paymentmethod == 4)
                rblpaymentmethodCC.Checked = true;

            if (VisaInfo.paymentby == 1)
                rblpaymentbyMC.Checked = true;
            else if (VisaInfo.paymentmethod == 2)
                rblpaymentVI.Checked = true;
            else if (VisaInfo.paymentmethod == 3)
                rblpaymentbyBC.Checked = true;
            else if (VisaInfo.paymentmethod == 4)
                rblpaymentbyDC.Checked = true;
            else if (VisaInfo.paymentmethod == 5)
                rblpaymentbyAM.Checked = true;
            else if (VisaInfo.paymentmethod == 6)
                rblpaymentbyJCB.Checked = true;

            amountinaustraliandollars.Value = VisaInfo.amountinaustraliandollars;
            creditcardno.Value = VisaInfo.amountinaustraliandollars;
            if (VisaInfo.creditcardexpirydate != null)
                creditcardexpirydate.Value = Convert.ToDateTime(VisaInfo.creditcardexpirydate).ToString("dd/MMM/yyyy");
            cardholdarname.Value = VisaInfo.cardholdarname;
            contactnumber.Value = VisaInfo.contactnumber;
            addressofcardholder.Value = VisaInfo.addressofcardholder;
            signatureofcardholder.Value = VisaInfo.signatureofcardholder;
            declarationsignature.Value = VisaInfo.declarationsignature;
            if (VisaInfo.declarationdate != null)
                declarationdate.Value = Convert.ToDateTime(VisaInfo.declarationdate).ToString("dd/MMM/yyyy");
            declarationsignature1.Value = VisaInfo.declarationsignature1;
            if (VisaInfo.declarationdate1 != null)
                declarationdate1.Value = Convert.ToDateTime(VisaInfo.declarationdate1).ToString("dd/MMM/yyyy");
            declarationsignature2.Value = VisaInfo.declarationsignature2;
            if (VisaInfo.declarationdate2 != null)
                declarationdate2.Value = Convert.ToDateTime(VisaInfo.declarationdate2).ToString("dd/MMM/yyyy");
            declarationsignature3.Value = VisaInfo.declarationsignature3;
            if (VisaInfo.declarationdate3 != null)
                declarationdate3.Value = Convert.ToDateTime(VisaInfo.declarationdate3).ToString("dd/MMM/yyyy");
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
                aboutfamilyname1.Value = FamilyInfo[k].aboutfamilyname;
                aboutfamilygivenname1.Value = FamilyInfo[k].aboutfamilygivenname;
                relationshiptoyou1.Value = FamilyInfo[k].relationshiptoyou;
                citizenship1.Value = FamilyInfo[k].citizenship;
                if (FamilyInfo[k].dobfamilymember != null)
                    dobfamilymember1.Value = Convert.ToDateTime(FamilyInfo[k].dobfamilymember).ToString("dd/MMM/yyyy");
                if (FamilyInfo[k].isfamilymemberhavepassport == 1)
                    chkfamily1Yes.Checked = true;
                else
                    chkfamily1No.Checked = true;
                familypassportno1.Value = FamilyInfo[k].passportno;
                if (FamilyInfo[k].countryofpassport != null)
                    familycountryofpassport1.Value = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
                if (FamilyInfo[k].passportdateofissue != null)
                    passportdateofissue1.Value = Convert.ToDateTime(FamilyInfo[k].passportdateofissue).ToString("dd/MMM/yyyy");
                if (FamilyInfo[k].passportdateofexpiry != null)
                    passportdateofexpiry1.Value = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry).ToString("dd/MMM/yyyy");
                passportplaceofissue1.Value = FamilyInfo[k].passportplaceofissue;

                if (FamilyInfo[k].studyinAustralia == 1)
                    chkFamilyStudy1Yes.Checked = true;
                else
                    chkFamilyStudy1No.Checked = true;

            }
            else if (k == 1)
            {
                aboutfamilyname2.Value = FamilyInfo[k].aboutfamilyname;
                aboutfamilygivenname2.Value = FamilyInfo[k].aboutfamilygivenname;
                relationshiptoyou2.Value = FamilyInfo[k].relationshiptoyou;
                citizenship2.Value = FamilyInfo[k].citizenship;
                if (FamilyInfo[k].dobfamilymember != null)
                    dobfamilymember2.Value = Convert.ToDateTime(FamilyInfo[k].dobfamilymember).ToString("dd/MMM/yyyy");
                if (FamilyInfo[k].isfamilymemberhavepassport == 1)
                    chkfamily2Yes.Checked = true;
                else
                    chkfamily2No.Checked = true;
                familypassportno2.Value = FamilyInfo[k].passportno;
                if (FamilyInfo[k].countryofpassport != null)
                    familycountryofpassport2.Value = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
                if (FamilyInfo[k].passportdateofissue != null)
                    passportdateofissue2.Value = Convert.ToDateTime(FamilyInfo[k].passportdateofissue).ToString("dd/MMM/yyyy");
                if (FamilyInfo[k].passportdateofexpiry != null)
                    passportdateofexpiry2.Value = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry).ToString("dd/MMM/yyyy");
                passportplaceofissue2.Value = FamilyInfo[k].passportplaceofissue;

                if (FamilyInfo[k].studyinAustralia == 1)
                    chkFamilyStudy2Yes.Checked = true;
                else
                    chkFamilyStudy2No.Checked = true;

            }
            else if (k == 2)
            {
                aboutfamilyname3.Value = FamilyInfo[k].aboutfamilyname;
                aboutfamilygivenname3.Value = FamilyInfo[k].aboutfamilygivenname;
                relationshiptoyou3.Value = FamilyInfo[k].relationshiptoyou;
                citizenship3.Value = FamilyInfo[k].citizenship;
                if (FamilyInfo[k].dobfamilymember != null)
                    dobfamilymember3.Value = Convert.ToDateTime(FamilyInfo[k].dobfamilymember).ToString("dd/MMM/yyyy");
                if (FamilyInfo[k].isfamilymemberhavepassport == 1)
                    chkfamily3Yes.Checked = true;
                else
                    chkfamily3No.Checked = true;
                familypassportno3.Value = FamilyInfo[k].passportno;
                if (FamilyInfo[k].countryofpassport != null)
                    familycountryofpassport3.Value = objCom.GetCountryDiscription(Convert.ToInt32(FamilyInfo[k].countryofpassport));
                if (FamilyInfo[k].passportdateofissue != null)
                    passportdateofissue3.Value = Convert.ToDateTime(FamilyInfo[k].passportdateofissue).ToString("dd/MMM/yyyy");
                if (FamilyInfo[k].passportdateofexpiry != null)
                    passportdateofexpiry3.Value = Convert.ToDateTime(FamilyInfo[k].passportdateofexpiry).ToString("dd/MMM/yyyy");
                passportplaceofissue3.Value = FamilyInfo[k].passportplaceofissue;

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