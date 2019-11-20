using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class australiavisapartB : System.Web.UI.Page
{

    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    int userID = 0, ApplicantID = 0, universityID;
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList();

            populatepartBInfo();
        }
    }
    protected void btnvisadetails_Click(object sender, EventArgs e)
    {

        try
        {
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
            //28
            if (applyinAustraliaNo.Checked)
                objaustraliavisadetail.applyinginaustralia = 0;
            else if (applyinAustraliaYEs.Checked)
                objaustraliavisadetail.applyinginaustralia = 1;
            //29
            if (holdvisaNo.Checked)
                objaustraliavisadetail.docurrentlyholdstudentvisa = 0;
            else if (holdvisaYes.Checked)
                objaustraliavisadetail.docurrentlyholdstudentvisa = 1;
            //30
            objaustraliavisadetail.highestqualification = highqualiname.Value;
            objaustraliavisadetail.nameofeducationprovider1 = eduProvidername1.Value;
            objaustraliavisadetail.nameofeducationprovider2 = eduProvidername2.Value;
            objaustraliavisadetail.addressofeducationprovider = eduProvideraddress.Value;
            objaustraliavisadetail.educationproviderpostalcode = eduProviderpostalcode.Value;
            if (eduProviderCommencementDate.Value != "")
                objaustraliavisadetail.commencementdate = Convert.ToDateTime(eduProviderCommencementDate.Value);
            if (eduProviderfinishDate.Value != "")
                objaustraliavisadetail.finishdate = Convert.ToDateTime(eduProviderfinishDate.Value);
            if (eduProviderdocattachedNo.Checked)
                objaustraliavisadetail.educationdocumentattached = 0;
            else if (eduProviderdocattachedYes.Checked)
                objaustraliavisadetail.educationdocumentattached = 1;
            //othercourse
            objaustraliavisadetail.otherundertakcoursename1 = othercoursename.Value;
            objaustraliavisadetail.othernameofeducationprovider1 = othereduprovidername1.Value;
            objaustraliavisadetail.othernameofeducationprovider2 = othereduprovidername2.Value;
            objaustraliavisadetail.otheraddressofeducationprovider1 = othereduprovideraddress.Value;
            objaustraliavisadetail.othereduproviderpostalcode1 = othereduproviderpostalcode.Value;
            if (othereduprovidercommencementDate.Value != "")
                objaustraliavisadetail.othercommencementdate1 = Convert.ToDateTime(othereduprovidercommencementDate.Value);
            if (othereduproviderfinishdate.Value != "")
                objaustraliavisadetail.otherfinishdate1 = Convert.ToDateTime(othereduproviderfinishdate.Value);
            if (othercoursedocattachedNo.Checked)
                objaustraliavisadetail.otherdocumentattached1 = 0;
            else if (othercoursedocattachedYes.Checked)
                objaustraliavisadetail.otherdocumentattached1 = 1;
            //set2
            objaustraliavisadetail.otherundertakcoursename2 = othercoursename1.Value;
            objaustraliavisadetail.othernameofeducationprovider21 = othereduprovidername21.Value;
            objaustraliavisadetail.othernameofeducationprovider22 = othereduprovidername22.Value;
            objaustraliavisadetail.otheraddressofeducationprovider2 = othereduprovideraddress1.Value;
            objaustraliavisadetail.othereduproviderpostalcode2 = othereduproviderpostalcode1.Value;
            if (othereduprovidercommencementDate1.Value != "")
                objaustraliavisadetail.othercommencementdate2 = Convert.ToDateTime(othereduprovidercommencementDate1.Value);
            if (othereduproviderfinishdate1.Value != "")
                objaustraliavisadetail.otherfinishdate2 = Convert.ToDateTime(othereduproviderfinishdate1.Value);
            if (othercoursedocattachedNo1.Checked)
                objaustraliavisadetail.otherdocumentattached2 = 0;
            else if (othercoursedocattachedYes1.Checked)
                objaustraliavisadetail.otherdocumentattached2 = 1;
            //31

            if (rbpreviouslystudiedinAustraliaNO.Checked)
                objaustraliavisadetail.ispreviouslystudiedinaustralia = 0;
            else if (rbpreviouslystudiedinAustraliaYes.Checked)
                objaustraliavisadetail.ispreviouslystudiedinaustralia = 1;
            objaustraliavisadetail.previouslycoursename = txtpreviouslycoursename.Value;
            objaustraliavisadetail.previouslycourseeducationproviderName = txtpreviouslycourseeducationproviderName.Value;
            if (txtpreviouslycourseDateFrom.Value != "")
                objaustraliavisadetail.previouslycourseDateFrom = Convert.ToDateTime(txtpreviouslycourseDateFrom.Value);
            if (txtpreviouslycourseDateTo.Value != "")
                objaustraliavisadetail.previouslycourseDateTo = Convert.ToDateTime(txtpreviouslycourseDateTo.Value);

            objaustraliavisadetail.previouslycoursename1 = txtpreviouslycoursename1.Value;
            objaustraliavisadetail.previouslycourseeducationproviderName1 = txtpreviouslycourseeducationproviderName1.Value;
            if (txtpreviouslycourseDateFrom1.Value != "")
                objaustraliavisadetail.previouslycourseDateFrom1 = Convert.ToDateTime(txtpreviouslycourseDateFrom1.Value);
            if (txtpreviouslycourseDateTo1.Value != "")
                objaustraliavisadetail.previouslycourseDateTo1 = Convert.ToDateTime(txtpreviouslycourseDateTo1.Value);
            //32
            objaustraliavisadetail.intendcoursename = txtintendcoursename.Value;
            objaustraliavisadetail.intendedprovidername = txtintendedprovidername.Value;
            if (txtintendedcommencementdate.Value != "")
                objaustraliavisadetail.intendedcommencementdate = Convert.ToDateTime(txtintendedcommencementdate.Value);
            if (txtintendedfinishdate.Value != "")
                objaustraliavisadetail.intendedfinishdate = Convert.ToDateTime(txtintendedfinishdate.Value);
            if (rbentrolmentNo.Checked)
                objaustraliavisadetail.haveenrolment = 0;
            else if (rbentrolmentYes.Checked)
                objaustraliavisadetail.haveenrolment = 1;
            //set1
            objaustraliavisadetail.intendcoursename1 = txtintendcoursename1.Value;
            objaustraliavisadetail.intendedprovidername1 = txtintendedprovidername1.Value;
            if (txtintendedcommencementdate1.Value != "")
                objaustraliavisadetail.intendedcommencementdate1 = Convert.ToDateTime(txtintendedcommencementdate1.Value);
            if (txtintendedfinishdate1.Value != "")
                objaustraliavisadetail.intendedfinishdate1 = Convert.ToDateTime(txtintendedfinishdate1.Value);
            if (rbentrolmentNo1.Checked)
                objaustraliavisadetail.haveenrolment1 = 0;
            else if (rbentrolmentYes1.Checked)
                objaustraliavisadetail.haveenrolment1 = 1;

            //set2
            objaustraliavisadetail.intendcoursename2 = txtintendcoursename2.Value;
            objaustraliavisadetail.intendedprovidername2 = txtintendedprovidername2.Value;
            if (txtintendedcommencementdate2.Value != "")
                objaustraliavisadetail.intendedcommencementdate2 = Convert.ToDateTime(txtintendedcommencementdate2.Value);
            if (txtintendedfinishdate2.Value != "")
                objaustraliavisadetail.intendedfinishdate2 = Convert.ToDateTime(txtintendedfinishdate2.Value);
            if (rbentrolmentNo2.Checked)
                objaustraliavisadetail.haveenrolment2 = 0;
            else if (rbentrolmentYes.Checked)
                objaustraliavisadetail.haveenrolment2 = 1;

            //33
            if (assessmentlevelNo.Checked)
                objaustraliavisadetail.applicantassesmentlevel = 0;
            else if (assessmentlevelYes.Checked)
                objaustraliavisadetail.applicantassesmentlevel = 1;
            //34
            if (englishtestgivenNO.Checked) {
                objaustraliavisadetail.englishlangtest = 0;
                objaustraliavisadetail.englishlangtestname = "";
                objaustraliavisadetail.englishlangtestDate = null;
                objaustraliavisadetail.englishlangtestcetificateno = "";
            }                
            else if (englishtestgivenYes.Checked)
            {
                objaustraliavisadetail.englishlangtest = 1;
                objaustraliavisadetail.englishlangtestname = englishtestname.Value;
                if (englishtestDate.Value != "")
                    objaustraliavisadetail.englishlangtestDate = Convert.ToDateTime(englishtestDate.Value);
                objaustraliavisadetail.englishlangtestcetificateno = englishtestcertificateNO.Value;
            }
            //35
            if (leastyearsincountriesNo.Checked)
                objaustraliavisadetail.studiedmorethan5yrinothercountry = 0;
            else if (leastyearsincountriesYes.Checked)
                objaustraliavisadetail.studiedmorethan5yrinothercountry = 1;
            //36
            if (employmenthistoryFrom.Value != "")
                objaustraliavisadetail.employmenthistoryFromDate = Convert.ToDateTime(employmenthistoryFrom.Value);
            if (employmenthistoryTo.Value != "")
                objaustraliavisadetail.employmenthistoryToDate = Convert.ToDateTime(employmenthistoryTo.Value);
            objaustraliavisadetail.employerInfoL0 = employerInfoL0.Value ;
            objaustraliavisadetail.employerInfoL1 = employerInfoL1.Value ;
            objaustraliavisadetail.typeofbusiness = txttypeofbusiness.Value;
            objaustraliavisadetail.employeroccupation = txtemployeroccupation.Value;
            objaustraliavisadetail.salarylevel = txtsalarylevel.Value;
            if (rbdocattachedNo.Checked)
                objaustraliavisadetail.leavingdocAttch = 0;
            else if (rbdocattachedYes.Checked)
                objaustraliavisadetail.leavingdocAttch = 1;
            //set1
            if (employmenthistoryFrom1.Value != "")
                objaustraliavisadetail.employmenthistoryFromDate1 = Convert.ToDateTime(employmenthistoryFrom1.Value);
            if (employmenthistoryTo1.Value != "")
                objaustraliavisadetail.employmenthistoryToDate1 = Convert.ToDateTime(employmenthistoryTo1.Value);
            objaustraliavisadetail.employerInfoL2 = employerInfoL2.Value;
            objaustraliavisadetail.employerInfoL3 = employerInfoL3.Value;
            objaustraliavisadetail.typeofbusiness1 = txttypeofbusiness1.Value;
            objaustraliavisadetail.employeroccupation1 = txtemployeroccupation1.Value;
            objaustraliavisadetail.salarylevel1 = txtsalarylevel1.Value ;
            if (rbdocattachedNo1.Checked)
                objaustraliavisadetail.leavingdocAttch1 = 0;
            else if (rbdocattachedYes1.Checked)
                objaustraliavisadetail.leavingdocAttch1 = 1;

            //37
            if (currentlyemployedNo.Checked)
            {
                objaustraliavisadetail.currentlyemployed = 0;
                if (rbstudent.Checked)
                    objaustraliavisadetail.ifnoThenOption = 1;
                else if (rbunemployed.Checked) {
                    objaustraliavisadetail.ifnoThenOption = 2;
                    objaustraliavisadetail.otherdescription1 = "";
                    objaustraliavisadetail.otherdescription2 = "";
                }
                else if (rbother.Checked)
                {
                    objaustraliavisadetail.ifnoThenOption = 3;
                    objaustraliavisadetail.otherdescription1 = txtotherdescription1.Value;
                    objaustraliavisadetail.otherdescription2 = txtotherdescription2.Value;
                }
                objaustraliavisadetail.position = "";
                objaustraliavisadetail.employername = "";
                objaustraliavisadetail.employeraddress = "";
                objaustraliavisadetail.employercontactno = "";
                objaustraliavisadetail.evidenceofemployement = null;
            }
            else if (currentlyemployedYes.Checked)
            {
                objaustraliavisadetail.currentlyemployed = 1;
                objaustraliavisadetail.position = txtposition.Value;
                objaustraliavisadetail.employername = txtemployername.Value;
                objaustraliavisadetail.employeraddress = txtemployeraddress.Value;
                objaustraliavisadetail.employercontactno = employercontactno.Value;
                if (evidenceofemployementNO.Checked)
                    objaustraliavisadetail.evidenceofemployement = 0;
                else if (evidenceofemployementYes.Checked)
                    objaustraliavisadetail.evidenceofemployement = 1;
                
            }
            //38
            if (jobnofferedNo.Checked)
            {
                objaustraliavisadetail.joboffered = 0;
                objaustraliavisadetail.kindofemployementseeking = txtkindofemployementseeking.Value;

                objaustraliavisadetail.jobofferedname = "";
                objaustraliavisadetail.jobofferedaddress ="";
                objaustraliavisadetail.jobofferedcontactno ="";
                objaustraliavisadetail.titleofpositionofferef = "";
            }

            else if (jobofferedYes.Checked)
            {
                objaustraliavisadetail.joboffered = 1;
                objaustraliavisadetail.jobofferedname = txtjobofferedname.Value;
                objaustraliavisadetail.jobofferedaddress = txtjobofferedaddress.Value;
                objaustraliavisadetail.jobofferedcontactno = txtjobofferedcontactno.Value;
                objaustraliavisadetail.titleofpositionofferef = txttitleofpositionofferef.Value;

                objaustraliavisadetail.kindofemployementseeking = "";
            }

            //39
            objaustraliavisadetail.immediaterelativename = immediaterelativename.Value;
            objaustraliavisadetail.immediaterelativerelationship = immediaterelativerelationship.Value;
            if (immediaterelativeDob.Value != "")
                objaustraliavisadetail.immediaterelativeDob = Convert.ToDateTime(immediaterelativeDob.Value);
            objaustraliavisadetail.immediaterelativeaddress = immediaterelativeaddress.Value;
            objaustraliavisadetail.immediaterelativepostalcode = immediaterelativepostalcode.Value;
            objaustraliavisadetail.immediaterelativeimmigrationstatus = immediaterelativestatus.Value;
            if (immediaterelativeDateofArrival.Value != "")
                objaustraliavisadetail.immediaterelativeDateofarrival = Convert.ToDateTime(immediaterelativeDateofArrival.Value);

            objaustraliavisadetail.immediaterelativename1 = immediaterelativename1.Value;
            objaustraliavisadetail.immediaterelativerelationship1 = immediaterelativerelationship1.Value;
            if (immediaterelativeDob1.Value != "")
                objaustraliavisadetail.immediaterelativeDob1 = Convert.ToDateTime(immediaterelativeDob1.Value);
            objaustraliavisadetail.immediaterelativeaddress1 = immediaterelativeaddress1.Value;
            objaustraliavisadetail.immediaterelativepostalcode1 = immediaterelativepostalcode1.Value;
            objaustraliavisadetail.immediaterelativeimmigrationstatus1 = immediaterelativestatus1.Value;
            if (immediaterelativeDateofArrival1.Value != "")
                objaustraliavisadetail.immediaterelativedateofarrival1 = Convert.ToDateTime(immediaterelativeDateofArrival1.Value);

            //40
            objaustraliavisadetail.closestrelativename = txtclosestrelativename.Value;
            objaustraliavisadetail.closestrelativerelationship = txtclosestrelativerelationship.Value;
            objaustraliavisadetail.closestrelativeaddress = txtclosestrelativeaddress.Value;
            objaustraliavisadetail.closestrelativepostalcode = txtclosestrelativepostalcode.Value;
            objaustraliavisadetail.closestrelativecontactnumber = txtclosestrelativecontactno.Value;
            //41
            if (applytostudyinausstraliaNO.Checked)
                objaustraliavisadetail.applyinaustraliaassecschool = 0;
            else if (applytostudyinausstraliaYes.Checked)
                objaustraliavisadetail.applyinaustraliaassecschool = 1;
            //42
            if (sufficientfundNo.Checked) {
                objaustraliavisadetail.issufficientfund = 0;
                objaustraliavisadetail.declarationDate42 = null;
                objaustraliavisadetail.declarationSign42 = "";
            }
            
            else if (sufficientfundYes.Checked) {
                objaustraliavisadetail.issufficientfund = 1;
                if (sufficientfunddateofissue.Value != "")
                    objaustraliavisadetail.declarationDate42 = Convert.ToDateTime(sufficientfunddateofissue.Value);
                objaustraliavisadetail.declarationSign42 = sign42.Value;
            }

            objaustraliavisadetail.applicantid = userID;
            objaustraliavisadetail.universityid = universityID;
            if (mode == "new")
                db.australiavisadetailmaster.Add(objaustraliavisadetail);
            db.SaveChanges();
            Response.Redirect(webURL + "australiavisapartD.aspx", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }


    private void populatepartBInfo()
    {
        try
        {
            var visaInfo = (from vInfo in db.australiavisadetailmaster
                            where vInfo.applicantid == userID && vInfo.universityid == universityID
                            select vInfo).FirstOrDefault();
            if (visaInfo != null)
            {
                //28
                if (visaInfo.applyinginaustralia == 0)
                    applyinAustraliaNo.Checked = true;
                else if (visaInfo.applyinginaustralia == 1)
                    applyinAustraliaYEs.Checked = true;
                //29
                if (visaInfo.docurrentlyholdstudentvisa == 0)
                    holdvisaNo.Checked = true;
                else if (visaInfo.docurrentlyholdstudentvisa == 1)
                    holdvisaYes.Checked = true;
                //30
                highqualiname.Value = visaInfo.highestqualification;
                eduProvidername1.Value = visaInfo.nameofeducationprovider1;
                eduProvidername2.Value = visaInfo.nameofeducationprovider2;
                eduProvideraddress.Value = visaInfo.addressofeducationprovider;
                eduProviderpostalcode.Value = visaInfo.educationproviderpostalcode;
                if (visaInfo.commencementdate != null)
                    eduProviderCommencementDate.Value = Convert.ToDateTime(visaInfo.commencementdate).ToString("yyyy-MM-dd");
                if (visaInfo.finishdate != null)
                    eduProviderfinishDate.Value = Convert.ToDateTime(visaInfo.finishdate).ToString("yyyy-MM-dd");
                if (visaInfo.educationdocumentattached == 0)
                    eduProviderdocattachedNo.Checked = true;
                else if (visaInfo.educationdocumentattached == 1)
                    eduProviderdocattachedYes.Checked = true;

                //othercourse
                othercoursename.Value = visaInfo.otherundertakcoursename1;
                othereduprovidername1.Value = visaInfo.othernameofeducationprovider1;
                othereduprovidername2.Value = visaInfo.othernameofeducationprovider2;
                othereduprovideraddress.Value = visaInfo.otheraddressofeducationprovider1;
                othereduproviderpostalcode.Value = visaInfo.othereduproviderpostalcode1;

                if (visaInfo.othercommencementdate1 != null)
                    othereduprovidercommencementDate.Value = Convert.ToDateTime(visaInfo.othercommencementdate1).ToString("yyyy-MM-dd");
                if (visaInfo.otherfinishdate1 != null)
                    othereduproviderfinishdate.Value = Convert.ToDateTime(visaInfo.otherfinishdate1).ToString("yyyy-MM-dd");
                if (visaInfo.otherdocumentattached1 == 0)
                    othercoursedocattachedNo.Checked = true;
                else if (visaInfo.otherdocumentattached1 == 1)
                    othercoursedocattachedYes.Checked = true;
                //set2
                othercoursename1.Value = visaInfo.otherundertakcoursename2;
                othereduprovidername21.Value = visaInfo.othernameofeducationprovider21;
                othereduprovidername22.Value = visaInfo.othernameofeducationprovider22;
                othereduprovideraddress1.Value = visaInfo.otheraddressofeducationprovider2;
                othereduproviderpostalcode1.Value = visaInfo.othereduproviderpostalcode2;

                if (visaInfo.othercommencementdate2 != null)
                    othereduprovidercommencementDate1.Value = Convert.ToDateTime(visaInfo.othercommencementdate2).ToString("yyyy-MM-dd");
                if (visaInfo.otherfinishdate2 != null)
                    othereduproviderfinishdate1.Value = Convert.ToDateTime(visaInfo.otherfinishdate2).ToString("yyyy-MM-dd");
                if (visaInfo.otherdocumentattached2 == 0)
                    othercoursedocattachedNo1.Checked = true;
                else if (visaInfo.otherdocumentattached2 == 1)
                    othercoursedocattachedYes1.Checked = true;

                //31
                if (visaInfo.ispreviouslystudiedinaustralia == 0)
                    rbpreviouslystudiedinAustraliaNO.Checked = true;
                else if (visaInfo.ispreviouslystudiedinaustralia == 1)
                    rbpreviouslystudiedinAustraliaYes.Checked = true;
                txtpreviouslycoursename.Value = visaInfo.previouslycoursename;
                txtpreviouslycourseeducationproviderName.Value = visaInfo.previouslycourseeducationproviderName;
                if (visaInfo.previouslycourseDateFrom != null)
                    txtpreviouslycourseDateFrom.Value = Convert.ToDateTime(visaInfo.previouslycourseDateFrom).ToString("yyyy-MM-dd");
                if (visaInfo.previouslycourseDateTo != null)
                    txtpreviouslycourseDateTo.Value = Convert.ToDateTime(visaInfo.previouslycourseDateTo).ToString("yyyy-MM-dd");
                txtpreviouslycoursename1.Value = visaInfo.previouslycoursename1;
                txtpreviouslycourseeducationproviderName1.Value = visaInfo.previouslycourseeducationproviderName1;
                if (visaInfo.previouslycourseDateFrom1 != null)
                    txtpreviouslycourseDateFrom1.Value = Convert.ToDateTime(visaInfo.previouslycourseDateFrom1).ToString("yyyy-MM-dd");
                if (visaInfo.previouslycourseDateTo1 != null)
                    txtpreviouslycourseDateTo1.Value = Convert.ToDateTime(visaInfo.previouslycourseDateTo1).ToString("yyyy-MM-dd");
                //32
                txtintendcoursename.Value = visaInfo.intendcoursename;
                txtintendedprovidername.Value = visaInfo.intendedprovidername;
                if (visaInfo.intendedcommencementdate != null)
                    txtintendedcommencementdate.Value = Convert.ToDateTime(visaInfo.intendedcommencementdate).ToString("yyyy-MM-dd");
                if (visaInfo.intendedfinishdate != null)
                    txtintendedfinishdate.Value = Convert.ToDateTime(visaInfo.intendedfinishdate).ToString("yyyy-MM-dd");
                if (visaInfo.haveenrolment == 0)
                    rbentrolmentNo.Checked = true;
                else if (visaInfo.haveenrolment == 1)
                    rbentrolmentYes.Checked = true;
                //set1
                txtintendcoursename1.Value = visaInfo.intendcoursename1;
                txtintendedprovidername1.Value = visaInfo.intendedprovidername1;
                if (visaInfo.intendedcommencementdate1 != null)
                    txtintendedcommencementdate1.Value = Convert.ToDateTime(visaInfo.intendedcommencementdate1).ToString("yyyy-MM-dd");
                if (visaInfo.intendedfinishdate1 != null)
                    txtintendedfinishdate1.Value = Convert.ToDateTime(visaInfo.intendedfinishdate1).ToString("yyyy-MM-dd");
                if (visaInfo.haveenrolment1 == 0)
                    rbentrolmentNo1.Checked = true;
                else if (visaInfo.haveenrolment1 == 1)
                    rbentrolmentYes1.Checked = true;
                //set2
                txtintendcoursename2.Value = visaInfo.intendcoursename2;
                txtintendedprovidername2.Value = visaInfo.intendedprovidername2;
                if (visaInfo.intendedcommencementdate2 != null)
                    txtintendedcommencementdate2.Value = Convert.ToDateTime(visaInfo.intendedcommencementdate2).ToString("yyyy-MM-dd");
                if (visaInfo.intendedfinishdate2 != null)
                    txtintendedfinishdate2.Value = Convert.ToDateTime(visaInfo.intendedfinishdate2).ToString("yyyy-MM-dd");
                if (visaInfo.haveenrolment2 == 0)
                    rbentrolmentNo2.Checked = true;
                else if (visaInfo.haveenrolment2 == 1)
                    rbentrolmentYes2.Checked = true;

                //33
                if (visaInfo.applicantassesmentlevel == 0)
                    assessmentlevelNo.Checked = true;
                else if (visaInfo.applicantassesmentlevel == 1)
                    assessmentlevelYes.Checked = true;

                //34

                if (visaInfo.englishlangtest == 0)
                    englishtestgivenNO.Checked = true;
                else if (visaInfo.englishlangtest == 1)
                {
                    englishtestgivenYes.Checked = true;
                    englishtestname.Value = visaInfo.englishlangtestname;
                    if (visaInfo.englishlangtestDate != null)
                        englishtestDate.Value = Convert.ToDateTime(visaInfo.englishlangtestDate).ToString("yyyy-MM-dd");
                    englishtestcertificateNO.Value = visaInfo.englishlangtestcetificateno;

                }
                //35
                if (visaInfo.studiedmorethan5yrinothercountry == 0)
                    leastyearsincountriesNo.Checked = true;
                else if (visaInfo.studiedmorethan5yrinothercountry == 1)
                    leastyearsincountriesYes.Checked = true;
                //36
                if (visaInfo.employmenthistoryFromDate != null)
                    employmenthistoryFrom.Value = Convert.ToDateTime(visaInfo.employmenthistoryFromDate).ToString("yyyy-MM-dd");
                if (visaInfo.employmenthistoryToDate != null)
                    employmenthistoryTo.Value = Convert.ToDateTime(visaInfo.employmenthistoryToDate).ToString("yyyy-MM-dd");
                employerInfoL0.Value = visaInfo.employerInfoL0 ;
                employerInfoL1.Value = visaInfo.employerInfoL1 ;
                txttypeofbusiness.Value = visaInfo.typeofbusiness;
                txtemployeroccupation.Value = visaInfo.employeroccupation;
                txtsalarylevel.Value = visaInfo.salarylevel;
                if (visaInfo.leavingdocAttch == 0)
                    rbdocattachedNo.Checked = true;
                else if (visaInfo.leavingdocAttch == 1)
                    rbdocattachedYes.Checked = true;
                //set1
                if (visaInfo.employmenthistoryFromDate1 != null)
                    employmenthistoryFrom1.Value = Convert.ToDateTime(visaInfo.employmenthistoryFromDate1).ToString("yyyy-MM-dd");
                if (visaInfo.employmenthistoryToDate1 != null)
                    employmenthistoryTo1.Value = Convert.ToDateTime(visaInfo.employmenthistoryToDate1).ToString("yyyy-MM-dd");
                employerInfoL2.Value = visaInfo.employerInfoL2 ;
                employerInfoL3.Value = visaInfo.employerInfoL3;
                txttypeofbusiness1.Value = visaInfo.typeofbusiness1;
                txtemployeroccupation1.Value = visaInfo.employeroccupation1;
                txtsalarylevel1.Value = visaInfo.salarylevel1;
                if (visaInfo.leavingdocAttch1 == 0)
                    rbdocattachedNo1.Checked = true;
                else if (visaInfo.leavingdocAttch1 == 1)
                    rbdocattachedYes1.Checked = true;
                //37
                if (visaInfo.currentlyemployed == 0)
                {
                    currentlyemployedNo.Checked = true;
                    if (visaInfo.ifnoThenOption == 1)
                        rbstudent.Checked = true;
                    else if (visaInfo.ifnoThenOption == 2)
                        rbunemployed.Checked = true;
                    else if (visaInfo.ifnoThenOption == 3)
                    {
                        rbother.Checked = true;
                        txtotherdescription1.Value = visaInfo.otherdescription1;
                        txtotherdescription2.Value = visaInfo.otherdescription2;
                    }
                }
                else if (visaInfo.currentlyemployed == 1)
                {
                    currentlyemployedYes.Checked = true;
                    txtposition.Value = visaInfo.position;
                    txtemployername.Value = visaInfo.employername;
                    txtemployeraddress.Value = visaInfo.employeraddress;
                    employercontactno.Value = visaInfo.employercontactno;
                    if (visaInfo.evidenceofemployement == 0)
                        evidenceofemployementNO.Checked = true;
                    else if (visaInfo.evidenceofemployement == 1)
                        evidenceofemployementYes.Checked = true;
                }

                //38
                if (visaInfo.joboffered == 0)
                {
                    jobnofferedNo.Checked = true;
                    txtkindofemployementseeking.Value = visaInfo.kindofemployementseeking;
                }
                else if (visaInfo.joboffered == 1)
                {
                    jobofferedYes.Checked = true;
                    txtjobofferedname.Value = visaInfo.jobofferedname;
                    txtjobofferedaddress.Value = visaInfo.jobofferedaddress;
                    txtjobofferedcontactno.Value = visaInfo.jobofferedcontactno;
                    txttitleofpositionofferef.Value = visaInfo.titleofpositionofferef;
                }

                //39
                immediaterelativename.Value = visaInfo.immediaterelativename;
                immediaterelativerelationship.Value = visaInfo.immediaterelativerelationship;
                if (visaInfo.immediaterelativeDob != null)
                    immediaterelativeDob.Value = Convert.ToDateTime(visaInfo.immediaterelativeDob).ToString("yyyy-MM-dd");
                immediaterelativeaddress.Value = visaInfo.immediaterelativeaddress;
                immediaterelativepostalcode.Value = visaInfo.immediaterelativepostalcode;
                immediaterelativestatus.Value = visaInfo.immediaterelativeimmigrationstatus;
                if (visaInfo.immediaterelativeDateofarrival != null)
                    immediaterelativeDateofArrival.Value = Convert.ToDateTime(visaInfo.immediaterelativeDateofarrival).ToString("yyyy-MM-dd");
                immediaterelativename1.Value = visaInfo.immediaterelativename1;
                immediaterelativerelationship1.Value = visaInfo.immediaterelativerelationship1;
                if (visaInfo.immediaterelativeDob1 != null)
                    immediaterelativeDob1.Value = Convert.ToDateTime(visaInfo.immediaterelativeDob1).ToString("yyyy-MM-dd");
                immediaterelativeaddress1.Value = visaInfo.immediaterelativeaddress1;
                immediaterelativepostalcode1.Value = visaInfo.immediaterelativepostalcode1;
                immediaterelativestatus1.Value = visaInfo.immediaterelativeimmigrationstatus1;
                if (visaInfo.immediaterelativedateofarrival1 != null)
                    immediaterelativeDateofArrival1.Value = Convert.ToDateTime(visaInfo.immediaterelativedateofarrival1).ToString("yyyy-MM-dd");

                //40
                txtclosestrelativename.Value = visaInfo.closestrelativename;
                txtclosestrelativerelationship.Value = visaInfo.closestrelativerelationship;
                txtclosestrelativeaddress.Value = visaInfo.closestrelativeaddress;
                txtclosestrelativepostalcode.Value = visaInfo.closestrelativepostalcode;
                txtclosestrelativecontactno.Value = visaInfo.closestrelativecontactnumber;



                //41
                if (visaInfo.applyinaustraliaassecschool == 0)
                    applytostudyinausstraliaNO.Checked = true;
                else if (visaInfo.applyinaustraliaassecschool == 1)
                    applytostudyinausstraliaYes.Checked = true;

                //42
                if (visaInfo.issufficientfund == 0)
                    sufficientfundNo.Checked = true;
                else if (visaInfo.issufficientfund == 1) {
                    sufficientfundYes.Checked = true;
                    if (visaInfo.declarationDate42 != null)
                        sufficientfunddateofissue.Value = Convert.ToDateTime(visaInfo.declarationDate42).ToString("yyyy-MM-dd");
                    sign42.Value = visaInfo.declarationSign42;
                }


            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}