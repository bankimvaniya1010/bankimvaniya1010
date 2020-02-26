<%@ Page Language="C#" AutoEventWireup="true" CodeFile="australiavisapartB.aspx.cs" Inherits="australiavisapartB" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Visa Detail

            </li>
        </ol>
       

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">

                       <div class="card-body list-group list-group-fit">


	        <!-- Part B Start -->
            <div class="row">
            <div class="col-12 step-txt">Part B – To be completed by the student</div>
            <div class="col-12">
            <!-- que 28 start -->
            <div runat="server" id="question28">	
            <div class="form-group" id="applyingvisa" runat="server">
            <label runat="server"><b class="ques-lbl">28)</b>Are you applying in Australia?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="apply-aust" runat="server" id="applyinAustraliaNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="apply-aust" runat="server" id="applyinAustraliaYEs">Yes
             </label>
            </div>
            <div id="que" runat="server" class="comm-txt">
            Go to Question 30 
            </div>
            </div>
            </div>
            <!-- ques 28 end -->
            <!-- ques 29 end -->
            <div runat="server" id="question29">
            <div class="form-group" id="holdvisa" runat="server">
            <label><b class="ques-lbl">29)</b>Do you currently hold a student visa?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="hold-visa" runat="server" id="holdvisaNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="hold-visa" runat="server" id="holdvisaYes">Yes
             </label>
            </div>
            <div class="collpse-div">
            If you are in Assessment Level 2, 3, 4 or 5 you will be required at Question 43 to provide exceptional reasons why you should be granted a student visa in Australia.
            </div>
            </div>
            </div>
            <!-- ques 29 end -->
            <!-- ques 30 start -->
            <div runat="server" id="question30">
            <label><b class="ques-lbl">30)</b>Provide details of your highest qualification obtained outside Australia, as well as all other studies and training obtained outside Australia.</label>
            <div class="comm-txt">You must provide evidence of your study and training, including academic records, if you are:
            <ul>
            <li>in Assessment Level 3, 4 or 5; or</li>
            <li>in Assessment Level 2 seeking to undertake studies in the postgraduate research sector.</li>
            </ul>
            </div>
            <div class="comm-txt italic">All other applicants may be requested to provide evidence where considered necessary.</div>
            <div class="comm-txt italic">In certain limited circumstances, you may be requested to provide copies of any published works written by you.</div>
            <hr>       
            <div class="form-group">
            <label>Highest qualification</label>
            <input type="text" name="" class="form-control" runat="server" id="highqualiname">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="eduProvidername1">
            <input type="text" name="" class="form-control" runat="server" id="eduProvidername2">
            </div>
            <div class="form-group">
            <label>Address of education provider or training body</label>
            <textarea class="form-control" rows="3" runat="server" id="eduProvideraddress"></textarea>
            </div>
            <div class="form-group">
            <label>Postal code</label>
            <input type="text" name="" class="form-control" runat="server" id="eduProviderpostalcode">
            </div>
            <div class="form-group">
            <label>Commencement date</label>
            <input type="text" name="" class="form-control" runat="server" id="eduProviderCommencementDate">
            </div>
            <div class="form-group">
            <label>Finish date</label>
            <input type="text" name="" class="form-control" runat="server" id="eduProviderfinishDate">
            </div>
            <div class="form-group">
                <%--code to upload attachement document pending--%>
            <label>Documentation attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="doct-attched" runat="server" id="eduProviderdocattachedNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="doct-attched" runat="server" id="eduProviderdocattachedYes">Yes
             </label>
            </div>
            </div>
            <hr>
        <ul>
         <li>
            <div class="form-group">
            <label>Other course undertaken outside Australia </label>
            <input type="text" name="" class="form-control" runat="server" id="othercoursename">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduprovidername1">
            <input type="text" name="" class="form-control" runat="server" id="othereduprovidername2">
            </div>
            <div class="form-group">
            <label>Address of education provider or training body</label>
            <textarea class="form-control" rows="3" runat="server" id="othereduprovideraddress"></textarea>
            </div>
            <div class="form-group">
            <label>Postal code</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduproviderpostalcode">
            </div>
            <div class="form-group">
            <label>Commencement date</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduprovidercommencementDate">
            </div>
            <div class="form-group">
            <label>Finish date</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduproviderfinishdate">
            </div>
            <div class="form-group">
            <%--code to upload attachement document pending--%>
            <label>Documentation attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="eductn-attched" runat="server" id="othercoursedocattachedNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="eductn-attched" runat="server" id="othercoursedocattachedYes">Yes
             </label>
            </div>
            </div>
         </li>
         <li>
            <hr>
            <div class="form-group">
            <label>Other course undertaken outside Australia </label>
            <input type="text" name="" class="form-control" runat="server" id="othercoursename1">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduprovidername21">
            <input type="text" name="" class="form-control" runat="server" id="othereduprovidername22">
            </div>
            <div class="form-group">
            <label>Address of education provider or training body</label>
            <textarea class="form-control" rows="3" runat="server"  id="othereduprovideraddress1"></textarea>
            </div>
            <div class="form-group">
            <label>Postal code</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduproviderpostalcode1">
            </div>
            <div class="form-group">
            <label>Commencement date</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduprovidercommencementDate1">
            </div>
            <div class="form-group">
            <label>Finish date</label>
            <input type="text" name="" class="form-control" runat="server" id="othereduproviderfinishdate1">
            </div>
            <div class="form-group">
                <%--code to upload attachement document pending--%>
            <label>Documentation attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="eductn-attched1" runat="server" id="othercoursedocattachedNo1">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="eductn-attched1" runat="server" id="othercoursedocattachedYes1">Yes
             </label>
            </div>
            </div>
        </li>
    </ul>
            </div>
            <!-- ques 30 end -->
            <!-- ques 31 start -->
            <div runat="server" id="question31">
            <div class="form-group">
            <label><b class="ques-lbl">31)</b>Have you previously studied in Australia?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="prevstd-aust" runat="server" id="rbpreviouslystudiedinAustraliaNO">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="prevstd-aust" runat="server" id="rbpreviouslystudiedinAustraliaYes">Yes
             </label>
            </div>
         <div id="previouslystudiedinAustraliaControls" runat="server">
            <div class="comm-txt">Give details below</div>
            <div class="comm-txt">You <b>must</b> provide evidence of your studies and training, including academic records</div>
            <hr>
       <ul>
           <li>
            <div class="form-group">
            <label>Previous course in Australia</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycoursename">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycourseeducationproviderName">
            </div>
            <div class="form-group">
            <label>Period of study</label>
            <div class="row">
            <div class="col-6">
            <label>From</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycourseDateFrom">
            </div>
            <div class="col-6">
            <label>To</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycourseDateTo">
            </div>
            </div>
            </div>
           </li>
           <li>
            <div class="form-group">
            <label>Previous course in Australia</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycoursename1">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycourseeducationproviderName1">
            </div>
            <div class="form-group">
            <label>Period of study</label>
            <div class="row">
            <div class="col-6">
            <label>From</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycourseDateFrom1">
            </div>
            <div class="col-6">
            <label>To</label>
            <input type="text" name="" class="form-control" runat="server" id="txtpreviouslycourseDateTo1">
            </div>
            </div>
            </div>
            </li>
           </ul>
            </div>
            </div>
            </div>
            <!-- ques 31 end -->
            <!-- ques 32 start -->
            <div runat="server" id="question32">
            <label><b class="ques-lbl">32)</b>Give details of your intended courses of study in Australia.</label>
            <div class="comm-txt">You must provide evidence of enrolment. Unless you are seeking to study in Australia as a secondary school exchange student or as a student sponsored by AusAID or the Australian Department of Defence, you must attach:
            <ul>
            <li><b>if applying in Australia, or outside Australia as an Assessment Level 1 or 2 student,</b> the electronic confirmation of enrolment certificate from your education provider. If you propose to study more than one course you must provide either an electronic confirmation of enrolment certificate, or an original ‘offer of a place in a course’ letter from your education provider for each additional course; or</li>
            <li><b>if applying outside Australia as an Assessment Level 3 or 4 student</b>, the original ‘offer of a place in a course’ letter from your education provider. If you are assessed as a genuine student, the Australian Government office will provide you with a letter of genuineness. Only at this stage should you pay any tuition fees and obtain an electronic Confirmation of Enrolment.</li>
            </ul>
            If you are seeking to study as an exchange student, you must attach to this application the Acceptance Advice Secondary Exchange Student (AASES) form as evidence of enrolment.
            </div>
            <div class="comm-txt">
            If you wish to study in Australia as a student sponsored by AusAID or the Australian Department of Defence, you must attach evidence of sponsorship from AusAID or the Department of Defence.
            </div>
            <hr>
        <ul>
            <li>
            <div class="form-group">
            <label>Intended course</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendcoursename">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedprovidername">
            </div>
            <div class="form-group">
            <label>Commencement date </label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedcommencementdate">
            </div>
            <div class="form-group">
            <label>Finish date</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedfinishdate">
            </div>

            <div class="form-group">
            <label>Have you entrolled?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolment" runat="server" id="rbentrolmentNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolment" runat="server" id="rbentrolmentYes">Yes
             </label>
            </div>
            </div>
           
            <div id="showlbl" runat="server">
            <div class="comm-txt">Attach letter of ‘offer of a place in a course</div>
            </div>
            <div id="showoption" runat="server">
            <div class="form-group">
                <%--code to upload attachement document pending--%>
            <label>Is evidence of enrolment attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolmentevidence" runat="server" id="rbenrolmentevidenceNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolmentevidence" runat="server" id="rbenrolmentevidenceYes">Yes
             </label>
            </div>
            </div>
            </div>
         </li>
         <li>

            <div class="form-group" runat="server">
            <label>Intended course</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendcoursename1">
            </div>
            <div class="form-group" runat="server">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedprovidername1">
            </div>
            <div class="form-group" runat="server">
            <label>Commencement date </label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedcommencementdate1">
            </div>
            <div class="form-group" runat="server">
            <label>Finish date</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedfinishdate1">
            </div>

            <div class="form-group" runat="server">
            <label></label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolment1" runat="server" id="rbentrolmentNo1">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolment1" runat="server" id="rbentrolmentYes1">Yes
             </label>
            </div>
             </div>
            <div id="showlbl1">
            <div class="comm-txt">Attach letter of ‘offer of a place in a course</div>
            </div>
            <div id="showoption1">
            <div class="form-group">
                <%--code to upload attachement document pending--%>
            <label>Is evidence of enrolment attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolmentevidence1" runat="server" id="rbenrolmentevidenceNo1">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolmentevidence1" runat="server" id="rbenrolmentevidenceYes1">Yes
             </label>
            </div>
            </div>
            </div>
           </li>
           <li>
            <div class="form-group">
            <label>Intended course</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendcoursename2">
            </div>
            <div class="form-group">
            <label>Name of education provider or training body</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedprovidername2">
            </div>
            <div class="form-group">
            <label>Commencement date </label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedcommencementdate2">
            </div>
            <div class="form-group">
            <label>Finish date</label>
            <input type="text" name="" class="form-control" runat="server" id="txtintendedfinishdate2">
            </div>

            <div class="form-group">
            <label></label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolment2" runat="server" id="rbentrolmentNo2">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolment2" runat="server" id="rbentrolmentYes2">Yes
             </label>
            </div>
             </div>
            <div id="showlbl2">
            <div class="comm-txt">Attach letter of ‘offer of a place in a course</div>
            </div>
            <div id="showoption2">
            <div class="form-group">
            <label>Is evidence of enrolment attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolmentevidence2" runat="server" id="rbenrolmentevidenceNo2">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="enrolmentevidence2" runat="server" id="rbenrolmentevidenceYes2">Yes
             </label>
            </div>
            </div>
            </div>
            </li>
        </ul>
            </div>
            <!-- ques 32 end -->
            <!-- ques 33 start -->
             <div runat="server" id="question33">
            <div class="frm-lblttl">Your English language details</div>
            
            <div class="form-group">
            <div class="form-check-inline">
             <label class="form-check-label">
                 <label><b class="ques-lbl">33)</b> Are you an applicant  in asssessment Level 1 or 2?</label>
               <input type="radio" class="form-check-input" name="assement" runat="server" id="assessmentlevelNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="assement" runat="server" id="assessmentlevelYes">Yes
             </label>
            </div>
            <div id="que1" runat="server">
            <div class="comm-txt">Go to Question 36</div>
            </div>
            </div>

            </div>
            <!-- ques 33 end -->
            <!-- ques 34 end -->
            <div class="form-group" runat="server" id="question34">
            <label><b class="ques-lbl">34)</b>Have you undertaken an English language proficiency test within the last 24 months?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="proficytest" runat="server" id="englishtestgivenNO">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="proficytest" runat="server" id="englishtestgivenYes">Yes
             </label>
            </div>
            <div id="testgivencontrols" runat="server">
            <div class="form-group">
            <label>Name of test</label>
            <input type="text" name="" class="form-control" runat="server" id="englishtestname">
            </div>
            <div class="form-group">
            <label>Date of test</label>
            <input id="englishtestDate" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
            </div>
            <div class="form-group">
            <label>Test certificate number</label>
            <input type="text" name="" class="form-control" runat="server" id="englishtestcertificateNO">
            <div class="comm-txt"><b>Note:</b> You <b>must</b> attach a certificate showing that you have completed an English language proficiency test.</div>
            </div>
            </div>
            </div>
            <!-- ques 34 end -->
            <!-- ques 35 start -->
            <div runat="server" id="question35">
            <label><b class="ques-lbl">35)</b>Have you studied for at least 5 years (in the English language) in one or more of the following countries:
            <ul>
            <li>Australia;</li>
            <li>the Republic of Ireland;</li>
            <li>Canada</li>
            <li>the United Kingdom; or</li>
            <li>New Zealand;</li>
            <li>the United States of America?</li>
            <li>South Africa;</li>
            </ul>
            </label>	
            <div class="form-group">
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="countries" runat="server" id="leastyearsincountriesNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="countries" runat="server" id="leastyearsincountriesYes">Yes
             </label>
            </div>
            <div class="collpse-div">
            <div class="comm-txt">Attach evidence</div>
            </div>
            </div>
            </div>
            <!-- ques 35 end -->
            <!-- ques 36 start -->
            <div runat="server" id="question36">
                <div class="frm-lblttl">Your employment details</div>
            
            <label><b class="ques-lbl">36)</b>Give details of your employment history since leaving school/college/university.</label>
            <hr>
        <ul>
            <li>
            <div class="form-group">
            <label>Period</label>
            <div class="row">
            <div class="col-6">
            <label>From</label>
            <input id="employmenthistoryFrom" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
            </div>
            <div class="col-6">
            <label>To</label>
            <input id="employmenthistoryTo" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
            </div>
            </div>
            </div>
            <div class="form-group">
            <label>Name and address of employer</label>
            <input type="text" name="" class="form-control" runat="server" id="employerInfoL0">
            <input type="text" name="" class="form-control" runat="server" id="employerInfoL1">	
            </div>           
            <div class="form-group">
            <label>Type of business </label>
            <input type="text" name="" class="form-control" runat="server" id="txttypeofbusiness">
            </div>
            <div class="form-group">
            <label>Occupation</label>
            <input type="text" name="" class="form-control" runat="server" id="txtemployeroccupation">
            </div>
            <div class="form-group">
            <label>Salary level</label>
            <input type="text" name="" class="form-control" runat="server" id="txtsalarylevel">
            </div>
            <div class="form-group" runat="server">
                <%--code to upload attachement document pending--%>
            <label>Documentation attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="leavingdocAttch" runat="server" id="rbdocattachedNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="leavingdocAttch" runat="server" id="rbdocattachedYes">Yes
             </label>
            </div>
            </div>
         </li>
         <li>
            <div class="form-group">
            <label>Period</label>
            <div class="row">
            <div class="col-6">
            <label>From</label>
            <input id="employmenthistoryFrom1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
            </div>
            <div class="col-6">
            <label>To</label>
            <input id="employmenthistoryTo1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
            </div>
            </div>
            </div>
            <div class="form-group">
            <label>Name and address of employer</label>
            <input type="text" name="" class="form-control" runat="server" id="employerInfoL2">
            <input type="text" name="" class="form-control" runat="server" id="employerInfoL3">	
            </div>           
            <div class="form-group">
            <label>Type of business </label>
            <input type="text" name="" class="form-control" runat="server" id="txttypeofbusiness1">
            </div>
            <div class="form-group">
            <label>Occupation</label>
            <input type="text" name="" class="form-control" runat="server" id="txtemployeroccupation1">
            </div>
            <div class="form-group">
            <label>Salary level</label>
            <input type="text" name="" class="form-control" runat="server" id="txtsalarylevel1">
            </div>
            <div class="form-group" runat="server">
                <%--code to upload attachement document pending--%>
            <label>Documentation attached?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="leaving-docAttch" runat="server" id="rbdocattachedNo1">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="leaving-docAttch" runat="server" id="rbdocattachedYes1">Yes
             </label>
            </div>
            </div>
        </li>
        </ul>
            </div>
            <!-- ques 36 end -->
            <!-- ques 37 start -->
            <div runat="server" id="question37">
            <div class="form-group" runat="server">
                <label><b class="ques-lbl">37)</b>Are you currently employed?</label>
            <div class="form-check-inline">
             <label class="form-check-label" runat="server">
               <input type="radio" class="form-check-input" name="currentemp" runat="server" id="currentlyemployedNo">No
             </label>
            </div>
            <div class="form-check-inline" runat="server">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="currentemp" runat="server" id="currentlyemployedYes">Yes
             </label>
            </div>
            <div id="ifNOShow" runat="server">
            <label>Are you </label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="currentempNo" id="rbstudent" runat="server">a student
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="currentempNo" id="rbunemployed" runat="server">unemployed
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="currentempNo" id="rbother" runat="server">other
             </label>
            </div>
            <div id="ifOthersShow" runat="server">
            <div class="form-group">
            <label>Please describe</label>
            <input type="text" name="" class="form-control" runat="server" id="txtotherdescription1">
            </div>
            <div class="form-group">
            <label>Why do you wish to undertake the course of study you have nominated? If insufficient space, attach additional details.</label>
            <textarea class="form-control" rows="4" runat="server" id="txtotherdescription2"></textarea>
            </div>
            </div>
            </div>
            <div id="ifYesShow" runat="server">
            <div class="form-group">
            <label>Your position</label>
            <input type="text" name="" class="form-control" runat="server" id="txtposition">
            </div>
            <div class="form-group">
            <label>Name, address and telephone number of your employer</label>
            <input type="text" name="" class="form-control" runat="server" id="txtemployername">
            <input type="text" name="" class="form-control" runat="server" id="txtemployeraddress">
            </div>
            <div class="form-group">
            <label>Phone</label>
            <input type="text" runat="server" class="form-control" id="employercontactno">
            </div>
            <div class="form-group">
                <%--code to upload attachement document pending--%>
            <label>Have you attached evidence of your employment details?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="evidempdtls" runat="server" id="evidenceofemployementNO">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="evidempdtls" runat="server" id="evidenceofemployementYes">Yes
             </label>
            </div>
            </div>
            <div class="form-group">
            <label>Are you currently a student in Australia?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="curt-stdAust" runat="server" id="currentlystudentinaustraliaNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="curt-stdAust" runat="server" id="currentlystudentinaustraliaYes">Yes
             </label>
            </div>
            </div>
            </div>

            </div>
            </div>
            <!-- ques 37 end -->
            <!-- ques 38 start -->
            <div runat="server" id="question38">
            <div class="form-group">
            <label><b class="ques-lbl">38)</b>Have you been offered a job for when you return home at the completion of your course?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="joboffer" runat="server" id="jobnofferedNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="joboffer" runat="server" id="jobofferedYes">Yes
             </label>
            </div>
            <div id="showcontrolsNo" runat="server">
            <div class="form-group">
            <label>What kind of employment will you be seeking on your return to your home country?</label>
            <textarea class="form-control" rows="3" runat="server" id="txtkindofemployementseeking"></textarea>
            </div>
            </div>
            <div id="showcontrolYes" runat="server">
            <div class="form-group">
            <label>Name</label>
            <input type="text" name="" class="form-control" runat="server" id="txtjobofferedname">
            </div>
            <div class="form-group">
            <label>Address</label>
            <textarea class="form-control" rows="3" runat="server" id="txtjobofferedaddress"></textarea>
            </div>
            <div class="form-group">
            <label>Telephone</label>
            <input type="text" class="form-control" runat="server" id="txtjobofferedcontactno"> 
            </div>
            <div class="form-group">
            <label>Title of position offered</label>
            <input type="text" name="" class="form-control" runat="server" id="txttitleofpositionofferef">
            </div>
            </div>
            </div>
            </div>
            <!-- ques 38 end -->
            <!-- ques 39 start -->
                <div runat="server" id="question39">
            <div class="frm-lblttl">Other address details</div>
            <label><b class="ques-lbl">39)</b>Give details of any immediate relatives in Australia <i>(ie. parent, spouse, child, brother or sister)</i></label>
            <hr>
        <ul>
            <li>
            <div>
                <div class="form-group">
                <label>Name</label>
                <input type="text" name="" class="form-control" runat="server" id="immediaterelativename">
                </div>	
                <div class="form-group">
                <label>Relationship to you</label>
                <input type="text" name="" class="form-control" runat="server" id="immediaterelativerelationship">
                </div>
                <div class="form-group">
                <label>Date of birth </label>
                <input id="immediaterelativeDob" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
                </div>
                <div class="form-group">
                <label>Address</label>
                <textarea class="form-control" rows="3" runat="server" id="immediaterelativeaddress"></textarea>
                </div>
                <div class="form-group">
                <label>Postal code</label>
                <input type="text" name="" class="form-control" runat="server" id="immediaterelativepostalcode">
                </div>
                <div class="form-group">
                <label>Immigration status in Australia <i>(eg. temporary or permanent resident, Australian citizen)</i></label>
                <input type="text" name="" class="form-control" runat="server" id="immediaterelativestatus">
                </div>
                <div class="form-group">
                <label>Date of arrival </label>
                <input id="immediaterelativeDateofArrival" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
                </div>
            </div>
            </li>
            <li>
            <hr>
            <div>
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="" class="form-control" runat="server"  id="immediaterelativename1">
                </div>	
                <div class="form-group">
                    <label>Relationship to you</label>
                    <input type="text" name="" class="form-control" runat="server"  id="immediaterelativerelationship1">
                </div>
                <div class="form-group">
                <label>Date of birth </label>
                <input id="immediaterelativeDob1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
                </div>
                <div class="form-group">
                <label>Address</label>
                <textarea class="form-control" rows="3" runat="server" id="immediaterelativeaddress1"></textarea>
                </div>
                <div class="form-group">
                <label>Postal code</label>
                <input type="text" name="" class="form-control" runat="server" id="immediaterelativepostalcode1">
                </div>
                <div class="form-group">
                <label>Immigration status in Australia <i>(eg. temporary or permanent resident, Australian citizen)</i></label>
                <input type="text" name="" class="form-control" runat="server"  id="immediaterelativestatus1">
                </div>
                <div class="form-group">
                <label>Date of arrival </label>
                <input id="immediaterelativeDateofArrival1" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
                </div>
            </div>
            </li>
       </ul>
                </div>
            <!-- ques 39 end -->
            <!-- ques 40 start -->
            <div runat="server" id="question40">
            <label><b class="ques-lbl">40)</b>Give details of your closest relative in your home country who is neither accompanying nor joining you in Australia</label>
            <div class="form-group">
            <label>Name</label>
            <input type="text" name="" class="form-control" runat="server" id="txtclosestrelativename">
            </div>
            <div class="form-group">
            <label>Relationship to you</label>
            <input type="text" name="" class="form-control" runat="server" id="txtclosestrelativerelationship">
            </div>
            <div class="form-group">
            <label>Address</label>
            <textarea class="form-control" rows="3" runat="server" id="txtclosestrelativeaddress"></textarea>
            </div>
            <div class="form-group">
            <label>Postal code</label>
            <input type="text" name="" class="form-control" runat="server" id="txtclosestrelativepostalcode">
            </div>
            <div class="form-group">
            <label>Telephone</label>
            <input type="text" runat="server" class="form-control" id="txtclosestrelativecontactno">   
            </div>
            </div>
            <!-- ques 40 end -->
            <!-- ques 41 start -->
            <div runat="server" id="question41">
            <div class="frm-lblttl">Financial details</div>
            <div class="form-group">
            <label><b class="ques-lbl">41)</b>Are you applying to study in Australia as a secondary school exchange student?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="studyin" runat="server" id="applytostudyinausstraliaNO">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="studyin" runat="server" id="applytostudyinausstraliaYes">Yes
             </label>
            </div>
            </div>
            </div>
            <!-- ques 41 end -->
            <!-- ques 42 start -->
            <div runat="server" id="question42">
            <div class="form-group" id="sufficientfund" runat="server">
            <label><b class="ques-lbl">42)</b>Do you have access to sufficient funds to support you and your family unit members for the TOTAL period of your stay in Australia (including proposed course fees for you and any school-age family members, living costs and travel costs, regardless of whether your dependants intend to accompany you to Australia)?</label>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="stay" runat="server" id="sufficientfundNo">No
             </label>
            </div>
            <div class="form-check-inline">
             <label class="form-check-label">
               <input type="radio" class="form-check-input" name="stay" runat="server" id="sufficientfundYes">Yes
             </label>
            </div>
            <div id="sufficientfundControls" runat="server">
            <div class="comm-txt">Please complete the declaration below</div>
            <div class="comm-txt">If you are under 18 years of age, this declaration must be signed on your behalf by your parents or a person(s) who has legal custody of you.</div>
            <div class="comm-txt">
            If you are in Assessment Level 2–5, you <b>must</b> provide documentary <b>evidence</b> that you have sufficient funds (unless you are a secondary school exchange student). It is important that you refer to the department’s website <b>www.immi.gov.au/study/</b> for details regarding the level of funds you are required to demonstrate, acceptable sources of funds and of the length of time funds must have been held
            </div>
            <div class="comm-txt">
            <i>I declare that I have access to sufficient funds to support myself and my family unit members (regardless of whether they are accompanying me to Australia) for the total period of my stay in Australia.</i>
            </div>
            <div class="form-group" runat="server">
            <label><b>Your signature</b></label>
            <input type="text" name="" id="sign42" class="form-control" runat="server">
            </div>
            <div class="form-group">
            <label>Date</label>
            <input id="sufficientfunddateofissue" runat="server" type="text" class="form-control" placeholder="Date of Issue" data-toggle="flatpickr" value="">
            </div>
            </div>
            </div>
            </div>
            <!-- ques 42 end -->
            <!-- ques 43 start -->
            <div runat="server" id="question43">
            <div class="frm-lblttl">Additional information</div>
            <label><b class="ques-lbl">43)</b>
            If there is any other information or documentation you would like taken into consideration in assessing your application attach it to the application.
            Remember that a decision may be based solely on the information you provide in this application.

            </label>
            <div class="comm-txt">
            <b>Note:</b> If you are in Australia as the holder of a student subclass 570–576 visa and you wish to change your principal course within the first 12 months of that course, and your new principal course will be in a
            new education sector, then as part of this application you must provide exceptional circumstances to justify the change of course.
            </div>
            <div class="comm-txt">
            If you are applying in Australia as an Assessment Level 2–5 applicant and do not hold a student visa, you must provide exceptional reasons to justify the grant of your visa. 
            </div>
            </div>
            <!-- ques 43 end -->
            </div>
            </div>
            <!-- Part B End -->



        <%--Button--%>
	        <div class="list-group-item">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row"> 
                      <%--  <a href="australiavisadetail.aspx" class="btn btn-success" style="margin-right: 10px;">Back</a>--%>
                        <asp:Button ID="btnvisadetails" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="btnvisadetails_Click" OnClientClick ="return validateform()"/>
                        <div class="col-md-6">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>                                               
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
   </div>
    <div class="col-md-4">
        <div class="banImg-wrp">
                <img src="/assets/images/Banner1.jpg" class="img-fluid">
            </div>
        <div class="card faq-qwrp" id="questions" runat="server">        
            
            <div class="card-body">
            <%  if (allQuestions.Count > 0)
                { %>
            <div id="question" runat="server">
                    <h5>Frequently Asked Questions (FAQs)</h5>
                    <div class="">
                    <%for (int q = 0; q < allQuestions.Count; q++)
                        {%>  <div class="star-list">                                                             
                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
                            </div>                                                  
                    <%} %>
                </div>
            </div>      
                <%} %>  
                                     
            </div>
        </div>
       </div>         
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
                    </div>
                </div>
            </div>
        </div>  
        </div>
 
    <script>  
        $(document).ready(function () {
            //32
            if ($("#<%=rbentrolmentYes.ClientID%>").is(":checked")) 
                $("#<%=showoption.ClientID%>").show();
            else 
                $("#<%=showoption.ClientID%>").hide();
             
            if ($("#<%=rbentrolmentNo.ClientID%>").is(":checked")) 
                $("#<%=showlbl.ClientID%>").show();
            else 
                $("#<%=showlbl.ClientID%>").hide();
            //37
            if ($("#<%=currentlyemployedNo.ClientID%>").is(":checked")) 
                    $("#<%=ifNOShow.ClientID%>").show();
            else 
                $("#<%=ifNOShow.ClientID%>").hide();

            if ($("#<%=currentlyemployedYes.ClientID%>").is(":checked")) 
                $("#<%=ifYesShow.ClientID%>").show();
            else 
                $("#<%=ifYesShow.ClientID%>").hide();

            if ($("#<%=rbother.ClientID%>").is(":checked")) 
                 $("#<%=ifOthersShow.ClientID%>").show();
            else 
                $("#<%=ifOthersShow.ClientID%>").hide();
            //38
            if ($("#<%=jobnofferedNo.ClientID%>").is(":checked")) 
                 $("#<%=showcontrolsNo.ClientID%>").show();
            else 
                $("#<%=showcontrolsNo.ClientID%>").hide();

            if ($("#<%=jobofferedYes.ClientID%>").is(":checked")) 
                $("#<%=showcontrolYes.ClientID%>").show();
            else 
                $("#<%=showcontrolYes.ClientID%>").hide();
            if ($("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(":checked")) 
                 $("#<%=previouslystudiedinAustraliaControls.ClientID%>").show();
            else 
                $("#<%=previouslystudiedinAustraliaControls.ClientID%>").hide();
            //33
            if ($("#<%=englishtestgivenYes.ClientID%>").is(":checked")) 
                $("#<%=testgivencontrols.ClientID%>").show();
            else 
                $("#<%=testgivencontrols.ClientID%>").hide();
            if ($("#<%=sufficientfundYes.ClientID%>").is(":checked")) 
                $("#<%=sufficientfundControls.ClientID%>").show();
            else 
                $("#<%=sufficientfundControls.ClientID%>").hide();

            if ($("#<%=assessmentlevelYes.ClientID%>").is(":checked")) 
                $("#<%=que1.ClientID%>").show();
            else 
                $("#<%=que1.ClientID%>").hide();

            if ($("#<%=applyinAustraliaNo.ClientID%>").is(":checked")) 
			{
                 $("#<%=que.ClientID%>").show();
                 $("#<%=question29.ClientID%>").hide();
            }
             else
			{
                 $("#<%=que.ClientID%>").hide();
                 $("#<%=question29.ClientID%>").show();
            }
            if ($("#<%=assessmentlevelYes.ClientID%>").is(":checked")) {
                 $("#<%=que1.ClientID%>").show();
                 $("#<%=question34.ClientID%>").hide();
                 $("#<%=question35.ClientID%>").hide();
             }
             else {
                 $("#<%=que1.ClientID%>").hide();
                 $("#<%=question34.ClientID%>").show();
                 $("#<%=question35.ClientID%>").show();
            }
            if ($("#<%=assessmentlevelYes.ClientID%>").is(":checked")) {
                 $("#<%=que1.ClientID%>").show();
                 $("#<%=question34.ClientID%>").hide();
                 $("#<%=question35.ClientID%>").hide();
             }
             else {
                 $("#<%=que1.ClientID%>").hide();
                 $("#<%=question34.ClientID%>").show();
                 $("#<%=question35.ClientID%>").show();
             }
        });

        //28  
        
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$apply-aust']").click(function () {
             if ($("#<%=applyinAustraliaNo.ClientID%>").is(":checked")) {
                 $("#<%=que.ClientID%>").show();
                 $("#<%=question29.ClientID%>").hide();
             }
             else {
                 $("#<%=que.ClientID%>").hide();
                 $("#<%=question29.ClientID%>").show();
             }
             });
        });
        //33   
         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$assement']").click(function () {
             if ($("#<%=assessmentlevelYes.ClientID%>").is(":checked")) {
                 $("#<%=que1.ClientID%>").show();
                 $("#<%=question34.ClientID%>").hide();
                 $("#<%=question35.ClientID%>").hide();
             }
             else {
                 $("#<%=que1.ClientID%>").hide();
                 $("#<%=question34.ClientID%>").show();
                 $("#<%=question35.ClientID%>").show();
             }
             });
        });
        //41

         $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$stay']").click(function () {
             if ($("#<%=sufficientfundYes.ClientID%>").is(":checked")) 
                 $("#<%=sufficientfundControls.ClientID%>").show();
             else 
                 $("#<%=sufficientfundControls.ClientID%>").hide();
             });
         });
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$proficytest']").click(function () {
             if ($("#<%=englishtestgivenYes.ClientID%>").is(":checked")) 
                 $("#<%=testgivencontrols.ClientID%>").show();
             else 
                 $("#<%=testgivencontrols.ClientID%>").hide();
             });
         });
        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$prevstd-aust']").click(function () {
             if ($("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(":checked")) 
                 $("#<%=previouslystudiedinAustraliaControls.ClientID%>").show();
             else 
                 $("#<%=previouslystudiedinAustraliaControls.ClientID%>").hide();
             });
        });

        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$enrolment']").click(function () {
             if ($("#<%=rbentrolmentYes.ClientID%>").is(":checked")) 
                 $("#<%=showoption.ClientID%>").show();
             else 
                 $("#<%=showoption.ClientID%>").hide();
             });
        });
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$enrolment']").click(function () {
             if ($("#<%=rbentrolmentNo.ClientID%>").is(":checked")) 
                 $("#<%=showlbl.ClientID%>").show();
             else 
                 $("#<%=showlbl.ClientID%>").hide();
             });
        });
        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$joboffer']").click(function () {
             if ($("#<%=jobnofferedNo.ClientID%>").is(":checked")) 
                 $("#<%=showcontrolsNo.ClientID%>").show();
             else 
                 $("#<%=showcontrolsNo.ClientID%>").hide();
             });
        });
        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$joboffer']").click(function () {
             if ($("#<%=jobofferedYes.ClientID%>").is(":checked")) 
                 $("#<%=showcontrolYes.ClientID%>").show();
             else 
                 $("#<%=showcontrolYes.ClientID%>").hide();
             });
        });
        //37
        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$currentemp']").click(function () {
             if ($("#<%=currentlyemployedNo.ClientID%>").is(":checked")) 
                 $("#<%=ifNOShow.ClientID%>").show();
             else 
                 $("#<%=ifNOShow.ClientID%>").hide();
             });
        });        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$currentemp']").click(function () {
             if ($("#<%=currentlyemployedYes.ClientID%>").is(":checked")) 
                 $("#<%=ifYesShow.ClientID%>").show();
             else 
                 $("#<%=ifYesShow.ClientID%>").hide();
             });
        });        
        $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$currentempNo']").click(function () {
             if ($("#<%=rbother.ClientID%>").is(":checked")) 
                 $("#<%=ifOthersShow.ClientID%>").show();
             else 
                 $("#<%=ifOthersShow.ClientID%>").hide();
             });
        });

        function validateform() {
            var flag = false;
            if (!($("#<%=applyinAustraliaNo.ClientID%>").is(':checked') || $("#<%=applyinAustraliaYEs.ClientID%>").is(':checked')))
                alert("Please select Are you applying in Australia of field 28");
            else if ($("#<%=applyinAustraliaYEs.ClientID%>").is(':checked') && !($("#<%=holdvisaNo.ClientID%>").is(':checked') || $("#<%=holdvisaYes.ClientID%>").is(':checked')))
                alert("Please select Do you currently hold a student visa of field 29");
            else if ($("#<%=highqualiname.ClientID%>").val() == "")
                alert("Please enter Highest qualification of field 30");
            else if ($("#<%=eduProvidername1.ClientID%>").val() == "")
                alert("Please enter name of education provider of field 30");
            else if ($("#<%=eduProvidername2.ClientID%>").val() == "")
                alert("Please enter name of education provider of field 30");
            else if ($("#<%=eduProvideraddress.ClientID%>").val() == "")
                alert("Please enter address of Provider  of field 30");
            else if ($("#<%=eduProviderpostalcode.ClientID%>").val() == "")
                alert("Please enter postal code of field 30");
            else if ($("#<%=eduProviderCommencementDate.ClientID%>").val() == "")
                alert("Please enter Commencement Date of field 30");
            else if ($("#<%=eduProviderfinishDate.ClientID%>").val() == "")
                alert("Please enter finish date of field 30");
            else if (!($("#<%=eduProviderdocattachedNo.ClientID%>").is(':checked') || $("#<%=eduProviderdocattachedYes.ClientID%>").is(':checked')))
                alert("Please select declaration attached  of field 30"); 
                //31
            else if (!($("#<%=rbpreviouslystudiedinAustraliaNO.ClientID%>").is(':checked') || $("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(':checked')))
                alert("Please select have you previously studied in australia of field 31");
            else if ($("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(':checked') && $("#<%=txtpreviouslycoursename.ClientID%>").val() == "")
                alert("please enter previous course name of field 31");
            else if ($("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(':checked') && $("#<%=txtpreviouslycourseeducationproviderName.ClientID%>").val() == "")
                 alert("please enter course provider name of field 31");
            else if ($("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(':checked') && $("#<%=txtpreviouslycourseDateFrom.ClientID%>").val() == "")
                alert("please enter period of study from date of field 31");
            else if ($("#<%=rbpreviouslystudiedinAustraliaYes.ClientID%>").is(':checked') && $("#<%=txtpreviouslycourseDateTo.ClientID%>").val() == "")
                alert("please enter period of study to date of field 31");
                //32
            else if ($("#<%=txtintendcoursename.ClientID%>").val() == "")
                alert("Please enter Intende course name of field 32");
            else if ($("#<%=txtintendedprovidername.ClientID%>").val() == "")
                alert("Please enter name of education provider of field 32");
            else if ($("#<%=txtintendedcommencementdate.ClientID%>").val() == "")
                alert("Please enter commencementdate of field 32");
            else if ($("#<%=txtintendedfinishdate.ClientID%>").val() == "")
                alert("Please enter finish date of field 32");
            else if (!($("#<%=rbentrolmentNo.ClientID%>").is(':checked') || $("#<%=rbentrolmentYes.ClientID%>").is(':checked')))
                alert("Please select have you entrolled of field 32");
            else if ($("#<%=rbentrolmentYes.ClientID%>").is(':checked') && !($("#<%=rbenrolmentevidenceNo.ClientID%>").is(':checked') || $("#<%=rbenrolmentevidenceYes.ClientID%>").is(':checked')))
                alert("Please select if evidence of entrollment attached of field 32");
                //33 34 35
            else if (!($("#<%=assessmentlevelNo.ClientID%>").is(':checked') || $("#<%=assessmentlevelYes.ClientID%>").is(':checked')))
                alert("Please select Are you an applicant  in asssessment Level 1 or 2 of field 33");                        
            else if ($("#<%=assessmentlevelNo.ClientID%>").is(':checked') &&(!($("#<%=englishtestgivenNO.ClientID%>").is(':checked') || $("#<%=englishtestgivenYes.ClientID%>").is(':checked'))))
                alert("Please select Have you undertaken an English language proficiency test within the last 24 months  of field 34 ");
            else if ($("#<%=assessmentlevelNo.ClientID%>").is(':checked') && $("#<%=englishtestgivenYes.ClientID%>").is(':checked') && $("#<%=englishtestname.ClientID%>").val() == "")
                alert("please enter test name of field 34");
            else if ($("#<%=assessmentlevelNo.ClientID%>").is(':checked') && $("#<%=englishtestgivenYes.ClientID%>").is(':checked') && $("#<%=englishtestDate.ClientID%>").val() == "")
                alert("please enter test date of field 34");
            else if ($("#<%=assessmentlevelNo.ClientID%>").is(':checked') && $("#<%=englishtestgivenYes.ClientID%>").is(':checked') && $("#<%=englishtestcertificateNO.ClientID%>").val() == "")
                alert("pleas enter certificate number of field 34");
            else if ($("#<%=assessmentlevelNo.ClientID%>").is(':checked') && (!($("#<%=leastyearsincountriesNo.ClientID%>").is(':checked') || $("#<%=leastyearsincountriesYes.ClientID%>").is(':checked'))))
                alert("Please select Have you studied for at least 5 years (in the English language) in one or more of the following countries of field 35");            
            //36    
            else if ($("#<%=employmenthistoryFrom.ClientID%>").val() == "")
                alert("Please enter employer details from date of field 36");
            else if ($("#<%=employmenthistoryTo.ClientID%>").val() == "")
                alert("Please enter employer details to date of field 36");
            else if ($("#<%=employerInfoL0.ClientID%>").val() == "")
                alert("Please enter employer name and address line 1 of field 36");
            else if ($("#<%=employerInfoL1.ClientID%>").val() == "")
                alert("Please enter employer name and address line 2 of field 36");
            else if ($("#<%=txttypeofbusiness.ClientID%>").val() == "")
                alert("Please enter type of business of field 36");
            else if ($("#<%=txtemployeroccupation.ClientID%>").val() == "")
                alert("Please enter occupation of field 36");
            else if ($("#<%=txtsalarylevel.ClientID%>").val() == "")
                alert("Please enter salary level of field 36");
            else if (!($("#<%=rbdocattachedNo.ClientID%>").is(':checked') || $("#<%=rbdocattachedYes.ClientID%>").is(':checked')))
                alert("Please select documents attached of field 36");
                //37
            else if (!($("#<%=currentlyemployedNo.ClientID%>").is(':checked') || $("#<%=currentlyemployedYes.ClientID%>").is(':checked')))
                alert("Please select are you currently employed  of field 37");
            else if ($("#<%=currentlyemployedNo.ClientID%>").is(':checked') && !($("#<%=rbstudent.ClientID%>").is(':checked') || $("#<%=rbunemployed.ClientID%>").is(':checked') || $("#<%=rbother.ClientID%>").is(':checked')))
                alert("Please select options  of field 37");
            else if ($("#<%=rbother.ClientID%>").is(':checked') && $("#<%=txtotherdescription2.ClientID%>").val() == "")
                alert("Please enter description of field 37");
            else if ($("#<%=currentlyemployedYes.ClientID%>").is(':checked') && $("#<%=txtposition.ClientID%>").val() == "")
                alert("Please enter position of field 37");
            else if ($("#<%=currentlyemployedYes.ClientID%>").is(':checked') && $("#<%=txtemployername.ClientID%>").val() == "")
                alert("Please enter name of field 37");
            else if ($("#<%=currentlyemployedYes.ClientID%>").is(':checked') && $("#<%=txtemployeraddress.ClientID%>").val() == "")
                alert("Please enter address of field 37");
            else if ($("#<%=currentlyemployedYes.ClientID%>").is(':checked') && $("#<%=employercontactno.ClientID%>").val() == "")
                alert("Please enter contact number of field 37");
            else if ($("#<%=currentlyemployedYes.ClientID%>").is(':checked') && !($("#<%=evidenceofemployementNO.ClientID%>").is(':checked') || $("#<%=evidenceofemployementYes.ClientID%>").is(':checked')))
                alert("Please enter have you attached evidence of employement details of field 37");
            else if ($("#<%=currentlyemployedYes.ClientID%>").is(':checked') && !($("#<%=currentlystudentinaustraliaNo.ClientID%>").is(':checked') || $("#<%=currentlystudentinaustraliaYes.ClientID%>").is(':checked')))
                alert("Please enter are you currently student in australia of field 37");          
           
                //38
            else if (!($("#<%=jobnofferedNo.ClientID%>").is(':checked') || $("#<%=jobofferedYes.ClientID%>").is(':checked')))
                alert("Please select Have you been offered a job for when you return home at the completion of your course of field 38");
            else if ($("#<%=jobnofferedNo.ClientID%>").is(':checked') && $("#<%=txtkindofemployementseeking.ClientID%>").val() == "")
                alert("Please enter kind of employement will you be seeking on your return to your home country of field 38");
            else if ($("#<%=jobofferedYes.ClientID%>").is(':checked') && $("#<%=txtjobofferedname.ClientID%>").val() == "")
                alert("Please enter name of field 38");
            else if ($("#<%=jobofferedYes.ClientID%>").is(':checked') && $("#<%=txtjobofferedaddress.ClientID%>").val() == "")
                alert("Please enter address  of field 38");                
            else if ($("#<%=jobofferedYes.ClientID%>").is(':checked') && $("#<%=txtjobofferedcontactno.ClientID%>").val() == "")
                alert("Please enter contact number of field 38");
            else if ($("#<%=jobofferedYes.ClientID%>").is(':checked') && $("#<%=txttitleofpositionofferef.ClientID%>").val() == "")
                alert("Please enter title of position offered of field 38");
                //39
            else if ($("#<%=immediaterelativename.ClientID%>").val() == "")
                alert("Please enter name of field 39");
            else if ($("#<%=immediaterelativerelationship.ClientID%>").val() == "")
                alert("Please enter relationship of field 39");
            else if ($("#<%=immediaterelativeDob.ClientID%>").val() == "")
                alert("Please enter Date of birth of field 39");
            else if ($("#<%=immediaterelativeaddress.ClientID%>").val() == "")
                alert("Please enter address of field 39");
            else if ($("#<%=immediaterelativepostalcode.ClientID%>").val() == "")
                alert("Please enter postal code of field 39");
            else if ($("#<%=immediaterelativestatus.ClientID%>").val() == "")
                alert("Please enter immigration status of field 39");
            else if ($("#<%=immediaterelativeDateofArrival.ClientID%>").val() == "")
                alert("Please enter date of arrival of field 39");
            //40
            else if ($("#<%=txtclosestrelativename.ClientID%>").val() == "")
                alert("Please enter name of field 40");
            else if ($("#<%=txtclosestrelativerelationship.ClientID%>").val() == "")
                alert("Please enter relationship of field 40");           
            else if ($("#<%=txtclosestrelativeaddress.ClientID%>").val() == "")
                alert("Please enter address of field 40");
            else if ($("#<%=txtclosestrelativepostalcode.ClientID%>").val() == "")
                alert("Please enter postal code of field 40");
            else if ($("#<%=txtclosestrelativecontactno.ClientID%>").val() == "")
                alert("Please enter contact number of field 40");
                //41 42
            else if (!($("#<%=applytostudyinausstraliaNO.ClientID%>").is(':checked') || $("#<%=applytostudyinausstraliaYes.ClientID%>").is(':checked')))
                alert("Please select Are you applying to study in Australia as a secondary school exchange student of field 41");
            else if (!($("#<%=sufficientfundNo.ClientID%>").is(':checked') || $("#<%=sufficientfundYes.ClientID%>").is(':checked')))
                alert("Please select Do you have access to sufficient funds to support you and your family unit members for the TOTAL period of your stay in Australia (including proposed course fees for you and any school-age family members, living costs and travel costs, regardless of whether your dependants intend to accompany you to Australia)enter  of field 42");
             else if ($("#<%=sufficientfundYes.ClientID%>").is(':checked') && $("#<%=sufficientfunddateofissue.ClientID%>").val() == "")
                alert("please select date of field 42");
            else
                flag = true;
            return flag;
        }
         $('#ContentPlaceHolder1_txtintendedcommencementdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtintendedfinishdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
         $('#ContentPlaceHolder1_txtintendedcommencementdate1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtintendedfinishdate1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtintendedcommencementdate2').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_employmenthistoryFrom').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_employmenthistoryTo').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_employmenthistoryFrom1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_employmenthistoryTo1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        
        $('#ContentPlaceHolder1_txtintendedfinishdate2').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_periodf').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_eduProviderCommencementDate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        }); 
        $('#ContentPlaceHolder1_txtpreviouslycourseDateFrom').flatpickr({
                dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtpreviouslycourseDateTo').flatpickr({
                dateFormat: 'Y-m-d', defaultDate: ""
        });        
        $('#ContentPlaceHolder1_englishtestDate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_eduProviderfinishDate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_periodt').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_immediaterelativeDob').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_immediaterelativeDateofArrival').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_immediaterelativeDob1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_immediaterelativeDateofArrival1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_sufficientfunddateofissue').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_othereduprovidercommencementDate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_othereduproviderfinishdate').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtpreviouslycourseDateFrom1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_txtpreviouslycourseDateTo1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_othereduproviderfinishdate1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        
        $('#ContentPlaceHolder1_othereduprovidercommencementDate1').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#visaapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantvisa').addClass('active');
        });
    </script>
</asp:Content>