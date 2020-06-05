using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class australiavisadetail : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    int userID = 0, ApplicantID = 0, universityID;
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    australiavisadetailmaster australiavisadetailmaster = new australiavisadetailmaster();
    protected List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack) {
            allQuestions = objCom.FaqQuestionList();
            objCom.BindCountries(ddlcountryofBirth);
            objCom.BindCountries(ddlcitizenshipcountry);
            objCom.BindCountries(ddlcountryofissue);
            objCom.BindCountries(ddlanothercitizenshipcountry);
            objCom.BindCountries(ddlresidencecountry);
            objCom.BindCountries(ddlfamilypassportcountry);
            objCom.BindCountries(ddlfamilypassportcountry1);
            objCom.BindCountries(ddlfamilypassportcountry2);            
            populateVisaDetails();


        }
    }

    protected void btnvisadetails_Click(object sender, EventArgs e)
    {
        try
        {           
            IEnumerable<australiavisaFamilydetailmaster> lst = db.australiavisaFamilydetailmaster.Where(x => x.universityid == universityID && x.applicantid == userID).ToList();
            db.australiavisaFamilydetailmaster.RemoveRange(lst);
            db.SaveChanges();
            var familyInfo = (from vInfo in db.australiavisaFamilydetailmaster
                              where vInfo.applicantid == userID && vInfo.universityid == universityID
                              select vInfo).FirstOrDefault();
            australiavisaFamilydetailmaster objFamilyvisadetail = new australiavisaFamilydetailmaster();
            
            if (txtaboutfamilyname.Value != "")
            {
                objFamilyvisadetail.familyInfoID = 1;
                objFamilyvisadetail.aboutfamilyname = txtaboutfamilyname.Value;
                objFamilyvisadetail.aboutfamilygivenname = txtanoutfamilyGivenname1.Value;
                objFamilyvisadetail.relationshiptoyou = txtrelationship.Value;
                objFamilyvisadetail.citizenship = txtcitizen.Value;
                if(txtfamilymemberdob.Value != "")
                    objFamilyvisadetail.dobfamilymember = Convert.ToDateTime(txtfamilymemberdob.Value);
                if (familyhavepassportNo.Checked)
                {
                    objFamilyvisadetail.isfamilymemberhavepassport = 0;
                    objFamilyvisadetail.passportno = "";
                    objFamilyvisadetail.countryofpassport = null;
                    objFamilyvisadetail.passportdateofissue = null;
                    objFamilyvisadetail.passportdateofexpiry = null;
                    objFamilyvisadetail.passportplaceofissue = "";
                    objFamilyvisadetail.studyinAustralia = null;
                }
                    
                else if (familyhavepassportYes.Checked)
                {
                    objFamilyvisadetail.isfamilymemberhavepassport = 1;
                    objFamilyvisadetail.passportno = txtfamilypassportno.Value;
                    if (ddlfamilypassportcountry.SelectedValue != "")
                        objFamilyvisadetail.countryofpassport = Convert.ToInt32(ddlfamilypassportcountry.SelectedValue);
                    if(txtfamilypassportdoi.Value != "")
                        objFamilyvisadetail.passportdateofissue = Convert.ToDateTime(txtfamilypassportdoi.Value);
                    if(txtfamilypassportdoe.Value != "")
                        objFamilyvisadetail.passportdateofexpiry = Convert.ToDateTime(txtfamilypassportdoe.Value);

                    objFamilyvisadetail.passportplaceofissue = txtfamilypassportplaceofissue.Value;
                    if (studyinaustraliaNo.Checked)
                        objFamilyvisadetail.studyinAustralia = 0;
                    if (studyinaustraliaYes.Checked)
                        objFamilyvisadetail.studyinAustralia = 1;
                }
                objFamilyvisadetail.applicantid = userID;
                objFamilyvisadetail.universityid = universityID;
                db.australiavisaFamilydetailmaster.Add(objFamilyvisadetail);
                db.SaveChanges();
            }
            if (txtaboutfamilyname1.Value != "")
            {
                objFamilyvisadetail.familyInfoID = 2;
                objFamilyvisadetail.aboutfamilyname = txtaboutfamilyname1.Value;
                objFamilyvisadetail.aboutfamilygivenname = txtanoutfamilyGivenname11.Value;
                objFamilyvisadetail.relationshiptoyou = txtrelationship1.Value;
                objFamilyvisadetail.citizenship = txtcitizen1.Value;
                if (txtfamilymemberdob1.Value != "")
                    objFamilyvisadetail.dobfamilymember = Convert.ToDateTime(txtfamilymemberdob1.Value);
                if (familyhavepassportNo1.Checked)
                {
                    objFamilyvisadetail.isfamilymemberhavepassport = 0;
                    objFamilyvisadetail.isfamilymemberhavepassport = 0;
                    objFamilyvisadetail.passportno = "";
                    objFamilyvisadetail.countryofpassport = null;
                    objFamilyvisadetail.passportdateofissue = null;
                    objFamilyvisadetail.passportdateofexpiry = null;
                    objFamilyvisadetail.passportplaceofissue = "";
                    objFamilyvisadetail.studyinAustralia = null;
                }
                else if (familyhavepassportYes1.Checked)
                {
                    objFamilyvisadetail.isfamilymemberhavepassport = 1;
                    objFamilyvisadetail.passportno = txtfamilypassportno1.Value;
                    if (ddlfamilypassportcountry1.SelectedValue != "")
                        objFamilyvisadetail.countryofpassport = Convert.ToInt32(ddlfamilypassportcountry1.SelectedValue);
                    if (txtfamilypassportdoi1.Value != "")
                        objFamilyvisadetail.passportdateofissue = Convert.ToDateTime(txtfamilypassportdoi1.Value);
                    if (txtfamilypassportdoe1.Value != "")
                        objFamilyvisadetail.passportdateofexpiry = Convert.ToDateTime(txtfamilypassportdoe1.Value);
                    objFamilyvisadetail.passportplaceofissue = txtfamilypassportplaceofissue1.Value;
                    if (studyinaustralia1No.Checked)
                        objFamilyvisadetail.studyinAustralia = 0;
                    if (studyinaustralia1Yes.Checked)
                        objFamilyvisadetail.studyinAustralia = 1;
                }
                objFamilyvisadetail.applicantid = userID;
                objFamilyvisadetail.universityid = universityID;
                db.australiavisaFamilydetailmaster.Add(objFamilyvisadetail);
                db.SaveChanges();
            }

            if (txtaboutfamilyname2.Value != "")
            {
                objFamilyvisadetail.familyInfoID = 3;
                objFamilyvisadetail.aboutfamilyname = txtaboutfamilyname2.Value;
                objFamilyvisadetail.aboutfamilygivenname = txtanoutfamilyGivenname21.Value;
                objFamilyvisadetail.relationshiptoyou = txtrelationship2.Value;
                objFamilyvisadetail.citizenship = txtcitizen2.Value;
                if (txtfamilymemberdob2.Value != "")
                    objFamilyvisadetail.dobfamilymember = Convert.ToDateTime(txtfamilymemberdob2.Value);
                if (familyhavepassportNo2.Checked)
                {
                    objFamilyvisadetail.isfamilymemberhavepassport = 0;
                    objFamilyvisadetail.isfamilymemberhavepassport = 0;
                    objFamilyvisadetail.passportno = "";
                    objFamilyvisadetail.countryofpassport = null;
                    objFamilyvisadetail.passportdateofissue = null;
                    objFamilyvisadetail.passportdateofexpiry = null;
                    objFamilyvisadetail.passportplaceofissue = "";
                    objFamilyvisadetail.studyinAustralia = null;
                }
                else if (familyhavepassportYes2.Checked)
                {
                    objFamilyvisadetail.isfamilymemberhavepassport = 1;
                    objFamilyvisadetail.passportno = txtfamilypassportno2.Value;
                    if (ddlfamilypassportcountry2.SelectedValue != "")
                        objFamilyvisadetail.countryofpassport = Convert.ToInt32(ddlfamilypassportcountry2.SelectedValue);
                    if (txtfamilypassportdoi2.Value != "")
                        objFamilyvisadetail.passportdateofissue = Convert.ToDateTime(txtfamilypassportdoi2.Value);
                    if (txtfamilypassportdoe2.Value != "")
                        objFamilyvisadetail.passportdateofexpiry = Convert.ToDateTime(txtfamilypassportdoe2.Value);
                    objFamilyvisadetail.passportplaceofissue = txtfamilypassportplaceofissue2.Value;
                    if (studyinaustraliaNo2.Checked)
                        objFamilyvisadetail.studyinAustralia = 0;
                    if (studyinaustraliaYes2.Checked)
                        objFamilyvisadetail.studyinAustralia = 1;
                }
                objFamilyvisadetail.applicantid = userID;
                objFamilyvisadetail.universityid = universityID;
                db.australiavisaFamilydetailmaster.Add(objFamilyvisadetail);
                db.SaveChanges();
            }
           
            var mode = "new";
            //vidaDetails
            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();
            australiavisadetailmaster objaustraliavisadetail = new australiavisadetailmaster();


            if (visaInfo != null)
            {
                mode = "update";
                objaustraliavisadetail = visaInfo;
            }
            objaustraliavisadetail.noofpeopleincluded = txtnoOfPeople.Value;
            if (rbasStudent.Checked)
                objaustraliavisadetail.applyingfor = 1;
            else if (rbasFamily.Checked)
                objaustraliavisadetail.applyingfor = 2;
            else if (rbasFamilyUnit.Checked)
                objaustraliavisadetail.applyingfor = 3;
            objaustraliavisadetail.familyname = txtfamilyname.Value;
            objaustraliavisadetail.givenname = txtgivenName.Value;
            objaustraliavisadetail.ownlanguagename1 = txtownLanguageName.Value;
            if (rbanothernameNo.Checked)
            {
                objaustraliavisadetail.knownbyanothername = 0;
                objaustraliavisadetail.anotherfamilyname = "";
                objaustraliavisadetail.anothergivenname = "";
            }
            else if (rbanothernameYes.Checked)
            {
                objaustraliavisadetail.knownbyanothername = 1;
                objaustraliavisadetail.anotherfamilyname = txtanotherfamilyname.Value;
                objaustraliavisadetail.anothergivenname = txtanothergivenname.Value;
            }
            if (rbMale.Checked)
                objaustraliavisadetail.gender = 1;
            else if (rbFemale.Checked)
                objaustraliavisadetail.gender = 0;
            if(txtdob.Value != "")
                objaustraliavisadetail.dateofbirth = Convert.ToDateTime(txtdob.Value);
            objaustraliavisadetail.cityofbirth = txtcity.Value;
            if (ddlcountryofBirth.SelectedValue != "")
                objaustraliavisadetail.countryofbirth = Convert.ToInt32(ddlcountryofBirth.SelectedValue);

            if (rbMarried.Checked)
                objaustraliavisadetail.maritalstatus = 1;
            else if (rbSeperated.Checked)
                objaustraliavisadetail.maritalstatus = 2;
            else if (rbWidowed.Checked)
                objaustraliavisadetail.maritalstatus = 3;
            else if (rbEngaged.Checked)
                objaustraliavisadetail.maritalstatus = 4;
            else if (rbDivorced.Checked)
                objaustraliavisadetail.maritalstatus = 5;
            else if (rbNeverMarried.Checked)
                objaustraliavisadetail.maritalstatus = 6;
            else if (rbDeFacto.Checked)
                objaustraliavisadetail.maritalstatus = 7;
            
            if (ddlcitizenshipcountry.SelectedValue != "")
                objaustraliavisadetail.countryofcitizenship = Convert.ToInt32(ddlcitizenshipcountry.SelectedValue);
            if (rbanothercitizenNo.Checked)
            {
                objaustraliavisadetail.holdothercitizenship = 0;
                objaustraliavisadetail.anothercountryofcitizenship = null;
            }
            else if (rbanothercitizenYes.Checked)
            {
                objaustraliavisadetail.holdothercitizenship = 1;
                if (ddlanothercitizenshipcountry.SelectedValue != "")
                    objaustraliavisadetail.anothercountryofcitizenship = Convert.ToInt32(ddlanothercitizenshipcountry.SelectedValue);
            }
            if (rbPassportNo.Checked)
            {
                objaustraliavisadetail.havepassport = 0;
                objaustraliavisadetail.passportno = "";
                objaustraliavisadetail.countryofpassport = null;
                objaustraliavisadetail.dateofissue = null;
                objaustraliavisadetail.dateofexpiry = null;
            }
            else if (rbPassportYes.Checked)
            {
                objaustraliavisadetail.havepassport = 1;
                objaustraliavisadetail.passportno = txtpassportno.Value;
                if (ddlcountryofissue.SelectedValue != "")
                    objaustraliavisadetail.countryofpassport = Convert.ToInt32(ddlcountryofissue.SelectedValue);
                if(txtdateofissue.Value != "")
                    objaustraliavisadetail.dateofissue = Convert.ToDateTime(txtdateofissue.Value);
                if(txtexpirydate.Value != "")
                    objaustraliavisadetail.dateofexpiry = Convert.ToDateTime(txtexpirydate.Value);
            }
            objaustraliavisadetail.placeofissue = txtplaceofissue1.Value;
            objaustraliavisadetail.applicableidentificationno = txtapplicableidentificationno.Value;
            objaustraliavisadetail.anotherIdentitytype1 = anotherIdentitytype1.Value;
            objaustraliavisadetail.anotherIdentityNo1 = anotherIdentityNo1.Value;
            objaustraliavisadetail.anotherIdentitytype2 = anotherIdentitytype2.Value;
            objaustraliavisadetail.anotherIdentityNo2 = anotherIdentityNo2.Value;
            if (ddlresidencecountry.SelectedValue != "")
                objaustraliavisadetail.residencecountry = Convert.ToInt32(ddlresidencecountry.SelectedValue);
            objaustraliavisadetail.residenceaddressLine1 = txtAddressLine1.Value;
            objaustraliavisadetail.residenceaddressLine2 = txtAddressLine2.Value;
            objaustraliavisadetail.residenceaddresspostalcode = txtPostal.Value;
            objaustraliavisadetail.officehoursContactNoOutsideaustralia = officehrContactNo.Value;
            objaustraliavisadetail.afterhoursContactNoOutsideaustralia = officehrContactNo.Value;
            objaustraliavisadetail.australiaresidentialaddline1 = australiaresidentialaddline1.Value;
            objaustraliavisadetail.australiaresidentialaddline2 = australiaresidentialaddline2.Value;
            objaustraliavisadetail.australiaresidentialpostalcode = australiaresidentialpostalcode.Value;
            objaustraliavisadetail.officehrContactNoInAustralia = officehrContactNoInAustralia.Value;
            objaustraliavisadetail.afterhrContactNoInAustralia = afterhrContactNoInAustralia.Value;
            objaustraliavisadetail.correspondenceaddressline1 = correspondenceaddressLine1.Value;
            objaustraliavisadetail.correspondenceaddressline2 = correspondenceaddressLine2.Value;
            objaustraliavisadetail.correspondenceaddresspoastalcode = correspondenceaddresspostalcode.Value;
            if (agreetocommunicateNo.Checked)
            {
                objaustraliavisadetail.agreetocommunicate = 0;
                objaustraliavisadetail.faxno = "";
                objaustraliavisadetail.emailaddress = "";
            }
            else if (agreetocommunicateYes.Checked)
            {
                objaustraliavisadetail.agreetocommunicate = 1;
                objaustraliavisadetail.faxno = faxno.Value;
                objaustraliavisadetail.emailaddress = emailaddress.Value;
            }           
            //23
            if(enrolledonscoolNO.Checked)
                objaustraliavisadetail.applicationentrolledinschool = 0;
            else if (enrolledonscoolYes.Checked)
                objaustraliavisadetail.applicationentrolledinschool = 1;
            //24
            if (solelegalrightsNo.Checked)
            {
                objaustraliavisadetail.solelegalrights = 1;
                objaustraliavisadetail.guardiansfamilyname = txtguardiansfamilyname.Value;
                objaustraliavisadetail.guardiansgivenname = txtguardiansgivenname.Value;
                objaustraliavisadetail.guardiansresidentialaddress = txtguardiansresidentialaddress.Value;
                objaustraliavisadetail.guardianspostalcode = txtguardianspostalcode.Value;
                objaustraliavisadetail.guardianscontactnumber = txtguardianscontactno.Value;
                objaustraliavisadetail.guardiansrealtionwithstudent = txtguardiansrelationship.Value;
                objaustraliavisadetail.guardiansnatureoflegalrights = txtguardianslegalrights.Value;
                if (rbguardiansdeclarationNo.Checked)
                    objaustraliavisadetail.guardiansstatutorydeclartion = 0;
                else if (rbguardiansdeclarationYes.Checked)
                    objaustraliavisadetail.guardiansstatutorydeclartion = 1;

                objaustraliavisadetail.guardiansfamilyname1 = txtguardiansfamilyname1.Value;
                objaustraliavisadetail.guardiansgivenname1 = txtguardiansgivenname1.Value;
                objaustraliavisadetail.guardiansresidentialaddress1 = txtguardiansresidentialaddress1.Value;
                objaustraliavisadetail.guardianspostalcode1 = txtguardianspostalcode1.Value;
                objaustraliavisadetail.guardianscontactnumber1 = txtguardianscontactno1.Value;
                objaustraliavisadetail.guardiansrealtionwithstudent1 = txtguardiansrelationship1.Value;
                objaustraliavisadetail.guardiansnatureoflegalrights1 = txtguardianslegalrights1.Value;
                if (rbguardiansdeclarationNo.Checked)
                    objaustraliavisadetail.guardiansstatutorydeclartion1 = 0;
                else if (rbguardiansdeclarationYes.Checked)
                    objaustraliavisadetail.guardiansstatutorydeclartion1 = 1;


            }
            else if (solelegalrightsYes.Checked) {
                objaustraliavisadetail.solelegalrights = 2;

                objaustraliavisadetail.guardiansfamilyname = "";
                objaustraliavisadetail.guardiansgivenname = "";
                objaustraliavisadetail.guardiansresidentialaddress = "";
                objaustraliavisadetail.guardianspostalcode = "";
                objaustraliavisadetail.guardianscontactnumber = "";
                objaustraliavisadetail.guardiansrealtionwithstudent = "";
                objaustraliavisadetail.guardiansnatureoflegalrights = "";
                objaustraliavisadetail.guardiansstatutorydeclartion = null;
                objaustraliavisadetail.guardiansfamilyname1 = "";
                objaustraliavisadetail.guardiansgivenname1 = "";
                objaustraliavisadetail.guardiansresidentialaddress1 = "";
                objaustraliavisadetail.guardianspostalcode1 = "";
                objaustraliavisadetail.guardianscontactnumber1 = "";
                objaustraliavisadetail.guardiansrealtionwithstudent1 = "";
                objaustraliavisadetail.guardiansnatureoflegalrights1 = "";
                objaustraliavisadetail.guardiansstatutorydeclartion1 = null;
            }
            

            //25
            if (subjectofcourtorderNo.Checked)
                objaustraliavisadetail.subjectofcourtorder = 0;
            else if (subjectofcourtorderYes.Checked)
                objaustraliavisadetail.subjectofcourtorder = 1;
            //26
            if (previouslyappliedvisaNo.Checked)
                objaustraliavisadetail.appliesforAustalianvisa = 0;
            else if (previouslyappliedvisaYes.Checked)
                objaustraliavisadetail.appliesforAustalianvisa = 1;

            if (currentlyholdvisaNo.Checked)
                objaustraliavisadetail.currentlyholdaustralianvisa = 0;
            else if (currentlyholdvisaYes.Checked)
                objaustraliavisadetail.currentlyholdaustralianvisa = 1;

            if (awaitingforvisaNo.Checked)
                objaustraliavisadetail.awaitingforaustralianvisa = 0;
            else if (awaitingforvisaYes.Checked)
                objaustraliavisadetail.awaitingforaustralianvisa = 1;

            if (previouslyappliedvisaYes.Checked || currentlyholdvisaYes.Checked || awaitingforvisaYes.Checked)
            {
                objaustraliavisadetail.nameonvisa = visaname.Value;
                objaustraliavisadetail.typeofvisa = typeofvisa.Value;
                objaustraliavisadetail.placeofissuevisa = placeofvisa.Value;
                if (visadateofissue.Value != "")
                    objaustraliavisadetail.dateissuevisa = Convert.ToDateTime(visadateofissue.Value);
                if (refusevisa.Checked)
                {
                    objaustraliavisadetail.applicationrefusedorgranted = 1;
                    objaustraliavisadetail.grantedvisalabelno = "";
                    objaustraliavisadetail.visagrantnumber = "";

                }
                else if (grantedvisa.Checked)
                {
                    objaustraliavisadetail.applicationrefusedorgranted = 2;
                    objaustraliavisadetail.grantedvisalabelno = visalabelno.Value;
                    objaustraliavisadetail.visagrantnumber = visagrantedNo.Value;

                }

                objaustraliavisadetail.nameonvisa1 = visaname1.Value;
                objaustraliavisadetail.typeofvisa1 = typeofvisa1.Value;
                objaustraliavisadetail.placeofissuevisa1 = placeofvisa1.Value;
                if (visadateofissue1.Value != "")
                    objaustraliavisadetail.dateissuevisa1 = Convert.ToDateTime(visadateofissue1.Value);
                if (refusevisa1.Checked)
                    objaustraliavisadetail.applicationrefusedorgranted1 = 1;
                else if (grantedvisa1.Checked)
                {
                    objaustraliavisadetail.applicationrefusedorgranted1 = 2;
                    objaustraliavisadetail.grantedvisalabelno1 = visalabelno1.Value;
                    objaustraliavisadetail.visagrantnumber1 = visagrantedNo1.Value;

                }
            }
            else if (previouslyappliedvisaNo.Checked || currentlyholdvisaNo.Checked || awaitingforvisaNo.Checked)
            {
                objaustraliavisadetail.nameonvisa = "";
                objaustraliavisadetail.typeofvisa = "";
                objaustraliavisadetail.placeofissuevisa = "";
                objaustraliavisadetail.dateissuevisa = null;
                objaustraliavisadetail.applicationrefusedorgranted = null;
                objaustraliavisadetail.grantedvisalabelno = "";
                objaustraliavisadetail.visagrantnumber = "";

            }
            //27
            if (memberofFamily.Checked)
                objaustraliavisadetail.applyingfortype = 1;
            else if(othercases.Checked)
                objaustraliavisadetail.applyingfortype = 2;


            objaustraliavisadetail.applicantid = userID;
            objaustraliavisadetail.universityid = universityID;
            if (mode == "new")
                db.australiavisadetailmaster.Add(objaustraliavisadetail);
            db.SaveChanges();

            australiavisadetailmaster = db.australiavisadetailmaster.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();
            if (australiavisadetailmaster != null)
            {
                var selectedvalue = australiavisadetailmaster.applyingfor.Value;
                if (selectedvalue == 3) {                   
                    //partB field Blank 
                    objaustraliavisadetail.applyinginaustralia = null;
                    objaustraliavisadetail.docurrentlyholdstudentvisa = null;
                    objaustraliavisadetail.highestqualification = "";
                    objaustraliavisadetail.nameofeducationprovider1 = "";
                    objaustraliavisadetail.nameofeducationprovider2 = "";
                    objaustraliavisadetail.addressofeducationprovider = "";
                    objaustraliavisadetail.educationproviderpostalcode = "";
                    objaustraliavisadetail.commencementdate = null;
                    objaustraliavisadetail.finishdate = null;
                    objaustraliavisadetail.educationdocumentattached = null;
                    objaustraliavisadetail.otherundertakcoursename1 = "";
                    objaustraliavisadetail.othernameofeducationprovider1 = "";
                    objaustraliavisadetail.othernameofeducationprovider2 = "";
                    objaustraliavisadetail.otheraddressofeducationprovider1 = "";
                    objaustraliavisadetail.othereduproviderpostalcode1 = "";
                    objaustraliavisadetail.othercommencementdate1 = null;
                    objaustraliavisadetail.otherfinishdate1 = null;
                    objaustraliavisadetail.otherdocumentattached1 = null;
                    objaustraliavisadetail.otherundertakcoursename2 = "";
                    objaustraliavisadetail.othernameofeducationprovider21 = "";
                    objaustraliavisadetail.othernameofeducationprovider22 = "";
                    objaustraliavisadetail.otheraddressofeducationprovider2 = "";
                    objaustraliavisadetail.othereduproviderpostalcode2 = "";
                    objaustraliavisadetail.othercommencementdate2 = null;
                    objaustraliavisadetail.otherfinishdate2 = null;
                    objaustraliavisadetail.otherdocumentattached2 = null;
                    objaustraliavisadetail.ispreviouslystudiedinaustralia = null;
                    objaustraliavisadetail.previouslycoursename = "";
                    objaustraliavisadetail.previouslycourseeducationproviderName = "";
                    objaustraliavisadetail.previouslycourseDateFrom = null;
                    objaustraliavisadetail.previouslycourseDateTo = null;
                    objaustraliavisadetail.previouslycoursename1 = "";
                    objaustraliavisadetail.previouslycourseeducationproviderName1 = "";
                    objaustraliavisadetail.previouslycourseDateFrom1 = null;
                    objaustraliavisadetail.previouslycourseDateTo1 = null;
                    objaustraliavisadetail.intendcoursename = "";
                    objaustraliavisadetail.intendedprovidername = "";
                    objaustraliavisadetail.intendedcommencementdate = null;
                    objaustraliavisadetail.intendedfinishdate = null;
                    objaustraliavisadetail.haveenrolment = null;
                    objaustraliavisadetail.intendcoursename1 = "";
                    objaustraliavisadetail.intendedprovidername1 = "";
                    objaustraliavisadetail.intendedcommencementdate1 = null;
                    objaustraliavisadetail.intendedfinishdate1 = null;
                    objaustraliavisadetail.haveenrolment1 = null;
                    objaustraliavisadetail.intendcoursename2 = "";
                    objaustraliavisadetail.intendedprovidername2 = "";
                    objaustraliavisadetail.intendedcommencementdate2 = null;
                    objaustraliavisadetail.intendedfinishdate2 = null;
                    objaustraliavisadetail.haveenrolment2 = null;
                    objaustraliavisadetail.applicantassesmentlevel = null;
                    objaustraliavisadetail.englishlangtest = null;
                    objaustraliavisadetail.englishlangtestname = "";
                    objaustraliavisadetail.englishlangtestDate = null;
                    objaustraliavisadetail.englishlangtestcetificateno = "";
                    objaustraliavisadetail.studiedmorethan5yrinothercountry = null;
                    objaustraliavisadetail.employmenthistoryFromDate = null;
                    objaustraliavisadetail.employmenthistoryToDate = null;
                    objaustraliavisadetail.employerInfoL0 = "";
                    objaustraliavisadetail.employerInfoL1 = "";
                    objaustraliavisadetail.typeofbusiness = "";
                    objaustraliavisadetail.employeroccupation = "";
                    objaustraliavisadetail.salarylevel = "";
                    objaustraliavisadetail.leavingdocAttch = null;
                    objaustraliavisadetail.employmenthistoryToDate1 = null;
                    objaustraliavisadetail.employerInfoL2 = "";
                    objaustraliavisadetail.employerInfoL3 = "";
                    objaustraliavisadetail.typeofbusiness1 = "";
                    objaustraliavisadetail.employeroccupation1 = "";
                    objaustraliavisadetail.salarylevel1 = "";
                    objaustraliavisadetail.leavingdocAttch1 = null;
                    objaustraliavisadetail.currentlyemployed = null;
                    objaustraliavisadetail.ifnoThenOption = null;
                    objaustraliavisadetail.otherdescription1 = "";
                    objaustraliavisadetail.otherdescription2 = "";
                    objaustraliavisadetail.position = "";
                    objaustraliavisadetail.employername = "";
                    objaustraliavisadetail.employeraddress = "";
                    objaustraliavisadetail.employercontactno = "";
                    objaustraliavisadetail.evidenceofemployement = null;
                    objaustraliavisadetail.joboffered = null ;
                    objaustraliavisadetail.kindofemployementseeking = "";
                    objaustraliavisadetail.jobofferedname = "";
                    objaustraliavisadetail.jobofferedaddress = "";
                    objaustraliavisadetail.jobofferedcontactno = "";
                    objaustraliavisadetail.titleofpositionofferef = "";
                    objaustraliavisadetail.immediaterelativename = "";
                    objaustraliavisadetail.immediaterelativerelationship = "";
                    objaustraliavisadetail.immediaterelativeDob = null;
                    objaustraliavisadetail.immediaterelativeaddress = "";
                    objaustraliavisadetail.immediaterelativepostalcode = "";
                    objaustraliavisadetail.immediaterelativeimmigrationstatus = "";
                    objaustraliavisadetail.immediaterelativeDateofarrival = null;
                    objaustraliavisadetail.immediaterelativename1 = "";
                    objaustraliavisadetail.immediaterelativerelationship1 = "";
                    objaustraliavisadetail.immediaterelativeDob1 = null;
                    objaustraliavisadetail.immediaterelativeaddress1 = "";
                    objaustraliavisadetail.immediaterelativepostalcode1 = "";
                    objaustraliavisadetail.immediaterelativeimmigrationstatus1 = "";
                    objaustraliavisadetail.immediaterelativedateofarrival1 = null;
                    objaustraliavisadetail.closestrelativename = "";
                    objaustraliavisadetail.closestrelativerelationship = "";
                    objaustraliavisadetail.closestrelativeaddress = "";
                    objaustraliavisadetail.closestrelativepostalcode = "";
                    objaustraliavisadetail.closestrelativecontactnumber = "";
                    objaustraliavisadetail.applyinaustraliaassecschool = null;
                    objaustraliavisadetail.issufficientfund = null;
                    objaustraliavisadetail.declarationDate42 = null;
                    objaustraliavisadetail.declarationSign42 = "";
                    db.SaveChanges();
                    Response.Redirect(webURL + "australiavisapartC.aspx", true);

                }                
                else if (selectedvalue == 1 || selectedvalue == 2)
                {                        
                        //partC field blank
                        objaustraliavisadetail.ifFamilyunitcompletedformpartC = null;
                        objaustraliavisadetail.studymorethanthreemonthpartC = null;
                        objaustraliavisadetail.studentnamepartC = "";
                        objaustraliavisadetail.relationshiptostudentpartC = "";
                        objaustraliavisadetail.studentdobpartC = null;
                        objaustraliavisadetail.citizenshipofstudentpartC = "";
                        objaustraliavisadetail.studentaddresspartC = "";
                        objaustraliavisadetail.studentaddpostalcodepartC = "";
                        objaustraliavisadetail.typeofstudentvisaheldpartC = "";
                        objaustraliavisadetail.assessmentlevelpartC = "";
                        objaustraliavisadetail.assessmentgrantdatepartC = null;
                        objaustraliavisadetail.assessmentexpirydatepartC = null;
                        objaustraliavisadetail.isstudentjoiningdeclarepartC = null;
                        objaustraliavisadetail.isstudentjoiningsatisfiedconditionpartC = null;
                        objaustraliavisadetail.suficientfundpartC = null;
                        db.SaveChanges();
                        Response.Redirect(webURL + "australiavisapartB.aspx", true);
                }
                    
        }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void populateVisaDetails() {
        try {
            var list= (from vInfo in db.australiavisaFamilydetailmaster
                       where vInfo.applicantid == userID && vInfo.universityid == universityID
                       select vInfo).ToList();            
            if (list != null)
            {
                foreach (var item in list) {
                    if (item.familyInfoID == 1)
                    {
                        var familyInfo = (from vInfo in db.australiavisaFamilydetailmaster
                                          where vInfo.applicantid == userID && vInfo.universityid == universityID&& vInfo.familyInfoID == 1
                                          select vInfo).FirstOrDefault();
                        txtaboutfamilyname.Value = familyInfo.aboutfamilyname;
                        txtanoutfamilyGivenname1.Value = familyInfo.aboutfamilygivenname;
                        txtrelationship.Value = familyInfo.relationshiptoyou;
                        txtcitizen.Value = familyInfo.citizenship;
                        if (familyInfo.dobfamilymember != null)
                            txtfamilymemberdob.Value = Convert.ToDateTime(familyInfo.dobfamilymember).ToString("yyyy-MM-dd");
                        if (familyInfo.isfamilymemberhavepassport == 0)
                            familyhavepassportNo.Checked = true;
                        else if (familyInfo.isfamilymemberhavepassport == 1)
                        {
                            familyhavepassportYes.Checked = true;
                            txtfamilypassportno.Value = familyInfo.passportno;
                            if (familyInfo.countryofpassport != null)
                            {
                                ddlfamilypassportcountry.ClearSelection();
                                ddlfamilypassportcountry.Items.FindByValue(familyInfo.countryofpassport.ToString()).Selected = true;
                            }
                            if (familyInfo.passportdateofissue != null)
                                txtfamilypassportdoi.Value = Convert.ToDateTime(familyInfo.passportdateofissue).ToString("yyyy-MM-dd");
                            if (familyInfo.passportdateofexpiry != null)
                                txtfamilypassportdoe.Value = Convert.ToDateTime(familyInfo.passportdateofexpiry).ToString("yyyy-MM-dd");
                            txtfamilypassportplaceofissue.Value = familyInfo.passportplaceofissue;
                            if (familyInfo.studyinAustralia == 0)
                                studyinaustraliaNo.Checked = true;
                            else if (familyInfo.studyinAustralia == 1)
                                studyinaustraliaYes.Checked = true;

                        }
                    }
                    else if (item.familyInfoID == 2)
                    {
                        var familyInfo = (from vInfo in db.australiavisaFamilydetailmaster
                                          where vInfo.applicantid == userID && vInfo.universityid == universityID && vInfo.familyInfoID == 2
                                          select vInfo).FirstOrDefault();
                        txtaboutfamilyname1.Value = familyInfo.aboutfamilyname;
                        txtanoutfamilyGivenname11.Value = familyInfo.aboutfamilygivenname;
                        txtrelationship1.Value = familyInfo.relationshiptoyou;
                        txtcitizen1.Value = familyInfo.citizenship;
                        if (familyInfo.dobfamilymember != null)
                            txtfamilymemberdob1.Value = Convert.ToDateTime(familyInfo.dobfamilymember).ToString("yyyy-MM-dd");
                        if (familyInfo.isfamilymemberhavepassport == 0)
                            familyhavepassportNo1.Checked = true;
                        else if (familyInfo.isfamilymemberhavepassport == 1)
                        {
                            familyhavepassportYes1.Checked = true;
                            txtfamilypassportno1.Value = familyInfo.passportno;
                            if (familyInfo.countryofpassport != null)
                            {
                                ddlfamilypassportcountry1.ClearSelection();
                                ddlfamilypassportcountry1.Items.FindByValue(familyInfo.countryofpassport.ToString()).Selected = true;
                            }
                            if (familyInfo.passportdateofissue != null)
                                txtfamilypassportdoi1.Value = Convert.ToDateTime(familyInfo.passportdateofissue).ToString("yyyy-MM-dd");
                            if (familyInfo.passportdateofexpiry != null)
                                txtfamilypassportdoe1.Value = Convert.ToDateTime(familyInfo.passportdateofexpiry).ToString("yyyy-MM-dd");
                            txtfamilypassportplaceofissue1.Value = familyInfo.passportplaceofissue;
                            if (familyInfo.studyinAustralia == 0)
                                studyinaustralia1No.Checked = true;
                            else if (familyInfo.studyinAustralia == 1)
                                studyinaustralia1Yes.Checked = true;

                        }
                    }
                    else if (item.familyInfoID == 3)
                    {
                        var familyInfo = (from vInfo in db.australiavisaFamilydetailmaster
                                          where vInfo.applicantid == userID && vInfo.universityid == universityID && vInfo.familyInfoID == 3
                                          select vInfo).FirstOrDefault();
                        txtaboutfamilyname2.Value = familyInfo.aboutfamilyname;
                        txtanoutfamilyGivenname21.Value = familyInfo.aboutfamilygivenname;
                        txtrelationship2.Value = familyInfo.relationshiptoyou;
                        txtcitizen2.Value = familyInfo.citizenship;
                        if (familyInfo.dobfamilymember != null)
                            txtfamilymemberdob2.Value = Convert.ToDateTime(familyInfo.dobfamilymember).ToString("yyyy-MM-dd");
                        if (familyInfo.isfamilymemberhavepassport == 0)
                            familyhavepassportNo2.Checked = true;
                        else if (familyInfo.isfamilymemberhavepassport == 1)
                        {
                            familyhavepassportYes2.Checked = true;
                            txtfamilypassportno2.Value = familyInfo.passportno;
                            if (familyInfo.countryofpassport != null)
                            {
                                ddlfamilypassportcountry2.ClearSelection();
                                ddlfamilypassportcountry2.Items.FindByValue(familyInfo.countryofpassport.ToString()).Selected = true;
                            }
                            if (familyInfo.passportdateofissue != null)
                                txtfamilypassportdoi2.Value = Convert.ToDateTime(familyInfo.passportdateofissue).ToString("yyyy-MM-dd");
                            if (familyInfo.passportdateofexpiry != null)
                                txtfamilypassportdoe2.Value = Convert.ToDateTime(familyInfo.passportdateofexpiry).ToString("yyyy-MM-dd");
                            txtfamilypassportplaceofissue2.Value = familyInfo.passportplaceofissue;
                            if (familyInfo.studyinAustralia == 0)
                                studyinaustraliaNo2.Checked = true;
                            else if (familyInfo.studyinAustralia == 1)
                                studyinaustraliaYes2.Checked = true;
                        }
                    }
                }              
                
            }
            //prepopulate 
            var applicantdetail = db.applicantdetails.Where(x => x.applicantid == userID && x.universityid == universityID).FirstOrDefault();

            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();
            if (visaInfo != null)
            {
                txtnoOfPeople.Value = visaInfo.noofpeopleincluded;
                if (visaInfo.applyingfor == 1)
                    rbasStudent.Checked = true;
                else if (visaInfo.applyingfor == 2)
                    rbasFamily.Checked = true;
                else if (visaInfo.applyingfor == 3)
                    rbasFamilyUnit.Checked = true;

                if (visaInfo.familyname == null)
                    txtfamilyname.Value = applicantdetail.firstname + " " + applicantdetail.middlename + " " + applicantdetail.lastname;
                else
                    txtfamilyname.Value = visaInfo.familyname;
                txtgivenName.Value = visaInfo.givenname;
                txtownLanguageName.Value = visaInfo.ownlanguagename1;
                if (visaInfo.knownbyanothername == 0)
                    rbanothernameNo.Checked = true;
                else if (visaInfo.knownbyanothername == 1)
                {
                    rbanothernameYes.Checked = true;
                    txtanotherfamilyname.Value = visaInfo.anotherfamilyname;
                    txtanothergivenname.Value = visaInfo.anothergivenname;
                }
                if (visaInfo.gender == null)
                {
                    if (applicantdetail.gender != null)
                    {
                        if (applicantdetail.gender == 1)
                            rbMale.Checked = true;
                        else if (applicantdetail.gender == 0)
                            rbFemale.Checked = true;
                    }
                }
                else
                {
                    if (visaInfo.gender == 1)
                        rbMale.Checked = true;
                    else if (visaInfo.gender == 0)
                        rbFemale.Checked = true;
                }
                if (visaInfo.dateofbirth != null)
                    txtdob.Value = Convert.ToDateTime(visaInfo.dateofbirth).ToString("yyyy-MM-dd");
                else
                {
                    if (applicantdetail.dateofbirth != null)
                        txtdob.Value = Convert.ToDateTime(applicantdetail.dateofbirth).ToString("yyyy-MM-dd");
                }
                txtcity.Value = visaInfo.cityofbirth;
                if (visaInfo.countryofbirth != null)
                {
                    ddlcountryofBirth.ClearSelection();
                    ddlcountryofBirth.Items.FindByValue(visaInfo.countryofbirth.ToString()).Selected = true;
                }
                else
                {
                    if (applicantdetail.countryofbirth != null)
                    {
                        ddlcountryofBirth.ClearSelection();
                        ddlcountryofBirth.Items.FindByValue(applicantdetail.countryofbirth.ToString()).Selected = true;
                    }
                }

                if (visaInfo.maritalstatus != null)
                {
                    if (visaInfo.maritalstatus == 1)
                        rbMarried.Checked = true;
                    else if (visaInfo.maritalstatus == 2)
                        rbSeperated.Checked = true;
                    else if (visaInfo.maritalstatus == 3)
                        rbWidowed.Checked = true;
                    else if (visaInfo.maritalstatus == 4)
                        rbEngaged.Checked = true;
                    else if (visaInfo.maritalstatus == 5)
                        rbDivorced.Checked = true;
                    else if (visaInfo.maritalstatus == 6)
                        rbNeverMarried.Checked = true;
                    else if (visaInfo.maritalstatus == 7)
                        rbDeFacto.Checked = true;
                }
                else {
                    if (applicantdetail.maritalstatus != null) {
                        if(applicantdetail.maritalstatus == 3)
                            rbMarried.Checked = true;
                        else if (applicantdetail.maritalstatus == 4)
                            rbSeperated.Checked = true;
                        else if (applicantdetail.maritalstatus == 5)
                            rbDivorced.Checked = true;
                        else if (applicantdetail.maritalstatus == 6)
                            rbWidowed.Checked = true;
                    }
                }
                if (visaInfo.countryofcitizenship != null)
                {
                    ddlcitizenshipcountry.ClearSelection();
                    ddlcitizenshipcountry.Items.FindByValue(visaInfo.countryofcitizenship.ToString()).Selected = true;
                }
                else {
                    if (applicantdetail.nationality != null)
                    {
                        ddlcitizenshipcountry.ClearSelection();
                        ddlcitizenshipcountry.Items.FindByValue(applicantdetail.nationality.ToString()).Selected = true;
                    }
                }

                if (visaInfo.holdothercitizenship != null)
                {
                    if (visaInfo.holdothercitizenship == 0)
                        rbanothercitizenNo.Checked = true;
                    else if (visaInfo.holdothercitizenship == 1)
                    {
                        rbanothercitizenYes.Checked = true;
                        if (visaInfo.anothercountryofcitizenship != null)
                        {
                            ddlanothercitizenshipcountry.ClearSelection();
                            ddlanothercitizenshipcountry.Items.FindByValue(visaInfo.anothercountryofcitizenship.ToString()).Selected = true;
                        }
                    }
                }
                else
                {
                    if (applicantdetail.hasdualcitizenship != null && applicantdetail.hasdualcitizenship == true)
                    {
                        rbanothercitizenYes.Checked = true;
                        if (applicantdetail.nationality2 != null)
                        {
                            ddlanothercitizenshipcountry.ClearSelection();
                            ddlanothercitizenshipcountry.Items.FindByValue(applicantdetail.nationality2.ToString()).Selected = true;
                        }
                    }
                    else if (applicantdetail.hasdualcitizenship != null && applicantdetail.hasdualcitizenship == false)
                        rbanothercitizenNo.Checked = true;
                }


                if (visaInfo.havepassport != null)
                {
                    if (visaInfo.havepassport == 0)
                        rbPassportNo.Checked = true;
                    else if (visaInfo.havepassport == 1)
                    {
                        rbPassportYes.Checked = true;
                        txtpassportno.Value = visaInfo.passportno;
                        if (visaInfo.countryofpassport != null)
                        {
                            ddlcountryofissue.ClearSelection();
                            ddlcountryofissue.Items.FindByValue(visaInfo.countryofpassport.ToString()).Selected = true;
                        }
                        if (visaInfo.dateofissue != null)
                            txtdateofissue.Value = Convert.ToDateTime(visaInfo.dateofissue).ToString("yyyy-MM-dd");
                        if (visaInfo.dateofexpiry != null)
                            txtexpirydate.Value = Convert.ToDateTime(visaInfo.dateofexpiry).ToString("yyyy-MM-dd");
                    }
                    txtplaceofissue1.Value = visaInfo.placeofissue;
                }
                else
                {
                    rbPassportYes.Checked = true;
                    txtpassportno.Value = applicantdetail.passportno;
                    if (applicantdetail.passportissuecountry != null)
                    {
                        ddlcountryofissue.ClearSelection();
                        ddlcountryofissue.Items.FindByValue(applicantdetail.passportissuecountry.ToString()).Selected = true;
                    }
                    if (applicantdetail.passportissuedate != null)
                        txtdateofissue.Value = Convert.ToDateTime(applicantdetail.passportissuedate).ToString("yyyy-MM-dd");
                    if (applicantdetail.passportexpirydate != null)
                        txtexpirydate.Value = Convert.ToDateTime(applicantdetail.passportexpirydate).ToString("yyyy-MM-dd");
                }

                txtapplicableidentificationno.Value = visaInfo.applicableidentificationno;
                anotherIdentitytype1.Value = visaInfo.anotherIdentitytype1;
                anotherIdentityNo1.Value = visaInfo.anotherIdentityNo1;
                anotherIdentitytype2.Value = visaInfo.anotherIdentitytype2;
                anotherIdentityNo2.Value = visaInfo.anotherIdentityNo2;

                if (visaInfo.residencecountry != null)
                {
                    ddlresidencecountry.ClearSelection();
                    ddlresidencecountry.Items.FindByValue(visaInfo.residencecountry.ToString()).Selected = true;
                }
                if (visaInfo.residenceaddressLine1 != null)
                    txtAddressLine1.Value = visaInfo.residenceaddressLine1;
                else 
                    txtAddressLine1.Value = applicantdetail.postaladdrees1 +", "+applicantdetail.postaladdrees2;

                if (visaInfo.residenceaddressLine2 != null)
                    txtAddressLine2.Value = visaInfo.residenceaddressLine2;
                else
                    txtAddressLine2.Value = applicantdetail.postaladdrees3 +","+ applicantdetail.postalcity;

                if (visaInfo.residenceaddresspostalcode != null)
                    txtPostal.Value = visaInfo.residenceaddresspostalcode;
                else
                    txtPostal.Value = applicantdetail.postalstate+","+applicantdetail.postalpostcode;

                if (visaInfo.officehoursContactNoOutsideaustralia != null)
                    officehrContactNo.Value = visaInfo.officehoursContactNoOutsideaustralia;
                else
                    officehrContactNo.Value = applicantdetail.mobileno;

                if (visaInfo.afterhoursContactNoOutsideaustralia != null)
                    afterhrContactNo.Value = visaInfo.afterhoursContactNoOutsideaustralia;
                else
                    afterhrContactNo.Value = applicantdetail.homephone;

                australiaresidentialaddline1.Value = visaInfo.australiaresidentialaddline1;
                australiaresidentialaddline2.Value = visaInfo.australiaresidentialaddline2;
                australiaresidentialpostalcode.Value = visaInfo.australiaresidentialpostalcode;

                officehrContactNoInAustralia.Value = visaInfo.officehrContactNoInAustralia;
                afterhrContactNoInAustralia.Value = visaInfo.afterhrContactNoInAustralia;

                correspondenceaddressLine1.Value = visaInfo.correspondenceaddressline1;
                correspondenceaddressLine2.Value = visaInfo.correspondenceaddressline2;
                correspondenceaddresspostalcode.Value = visaInfo.correspondenceaddresspoastalcode;

                if (visaInfo.agreetocommunicate == 0)
                    agreetocommunicateNo.Checked = true;
                else if (visaInfo.agreetocommunicate == 1)
                {
                    agreetocommunicateYes.Checked = true;
                    faxno.Value = visaInfo.faxno;
                    emailaddress.Value = visaInfo.emailaddress;
                }

                //23
                if (visaInfo.applicationentrolledinschool == 0)
                    enrolledonscoolNO.Checked = true;
                else if (visaInfo.applicationentrolledinschool == 1)
                    enrolledonscoolYes.Checked = true;
                //24
                if (visaInfo.solelegalrights == 1)
                {
                    solelegalrightsNo.Checked = true;
                    txtguardiansfamilyname.Value = visaInfo.guardiansfamilyname;
                    txtguardiansgivenname.Value = visaInfo.guardiansgivenname;
                    txtguardiansresidentialaddress.Value = visaInfo.guardiansresidentialaddress;
                    txtguardianspostalcode.Value = visaInfo.guardianspostalcode;
                    txtguardianscontactno.Value = visaInfo.guardianscontactnumber;
                    txtguardiansrelationship.Value = visaInfo.guardiansrealtionwithstudent;
                    txtguardianslegalrights.Value = visaInfo.guardiansnatureoflegalrights;
                    if (visaInfo.guardiansstatutorydeclartion == 0)
                        rbguardiansdeclarationNo.Checked = true;
                    else if (visaInfo.guardiansstatutorydeclartion == 1)
                        rbguardiansdeclarationYes.Checked = true;

                    txtguardiansfamilyname1.Value = visaInfo.guardiansfamilyname1;
                    txtguardiansgivenname1.Value = visaInfo.guardiansgivenname1;
                    txtguardiansresidentialaddress1.Value = visaInfo.guardiansresidentialaddress1;
                    txtguardianspostalcode1.Value = visaInfo.guardianspostalcode1;
                    txtguardianscontactno1.Value = visaInfo.guardianscontactnumber1;
                    txtguardiansrelationship1.Value = visaInfo.guardiansrealtionwithstudent1;
                    txtguardianslegalrights1.Value = visaInfo.guardiansnatureoflegalrights1;
                    if (visaInfo.guardiansstatutorydeclartion1 == 0)
                        rbguardiansdeclarationNo1.Checked = true;
                    else if (visaInfo.guardiansstatutorydeclartion1 == 1)
                        rbguardiansdeclarationYes1.Checked = true;


                }
                else if (visaInfo.solelegalrights == 2)
                    solelegalrightsYes.Checked = true;
                //25
                if (visaInfo.subjectofcourtorder == 0)
                    subjectofcourtorderNo.Checked = true;
                else if (visaInfo.subjectofcourtorder == 1)
                    subjectofcourtorderYes.Checked = true;
                //26
                if (visaInfo.appliesforAustalianvisa == 0)
                    previouslyappliedvisaNo.Checked = true;
                else if (visaInfo.appliesforAustalianvisa == 1)
                    previouslyappliedvisaYes.Checked = true;

                if (visaInfo.currentlyholdaustralianvisa == 0)
                    currentlyholdvisaNo.Checked = true;
                else if (visaInfo.currentlyholdaustralianvisa == 1)
                    currentlyholdvisaYes.Checked = true;

                if (visaInfo.awaitingforaustralianvisa == 0)
                    awaitingforvisaNo.Checked = true;
                else if (visaInfo.awaitingforaustralianvisa == 1)
                    awaitingforvisaYes.Checked = true;

                if (visaInfo.appliesforAustalianvisa == 1 || visaInfo.currentlyholdaustralianvisa == 1 || visaInfo.awaitingforaustralianvisa == 1)
                {
                    visaname.Value = visaInfo.nameonvisa;
                    typeofvisa.Value = visaInfo.typeofvisa;
                    placeofvisa.Value = visaInfo.placeofissuevisa;
                    if (visaInfo.dateissuevisa != null)
                        visadateofissue.Value = Convert.ToDateTime(visaInfo.dateissuevisa).ToString("yyyy-MM-dd");

                    if (visaInfo.applicationrefusedorgranted == 1)
                        refusevisa.Checked = true;
                    else if (visaInfo.applicationrefusedorgranted == 2)
                    {
                        grantedvisa.Checked = true;
                        visalabelno.Value = visaInfo.grantedvisalabelno;
                        visagrantedNo.Value = visaInfo.visagrantnumber;

                    }
                    visaname1.Value = visaInfo.nameonvisa1;
                    typeofvisa1.Value = visaInfo.typeofvisa1;
                    placeofvisa1.Value = visaInfo.placeofissuevisa1;
                    if (visaInfo.dateissuevisa1 != null)
                        visadateofissue1.Value = Convert.ToDateTime(visaInfo.dateissuevisa1).ToString("yyyy-MM-dd");
                    if (visaInfo.applicationrefusedorgranted1 == 1)
                        refusevisa1.Checked = true;
                    else if (visaInfo.applicationrefusedorgranted1 == 2)
                    {
                        grantedvisa1.Checked = true;
                        visalabelno1.Value = visaInfo.grantedvisalabelno1;
                        visagrantedNo1.Value = visaInfo.visagrantnumber1;
                    }

                }
                //27

                if (visaInfo.applyingfortype == 1)
                    memberofFamily.Checked = true;
                else if (visaInfo.applyingfortype == 2)
                    othercases.Checked = true;


            }
            
        }

        catch (Exception ex) {
            objLog.WriteLog(ex.ToString());
        }
    }
}