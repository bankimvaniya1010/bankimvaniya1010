<%@ Page Language="C#" AutoEventWireup="true" CodeFile="australiavisapartC.aspx.cs" Inherits="australiavisapartC" MasterPageFile="~/student.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Visa Detail

            </li>
        </ol>
       

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">
                    <div class="card" style="width: 650px;">

                       <div class="list-group list-group-fit">
                             <!-- Part C Start -->
        <div class="row" id="partc">
        <div class="col-12 step-txt">Part C – To be completed only if you are a family unit member joining a student in Australia</div>
        <div class="col-12">
        <!-- ques 44 start -->
        <div>
        <div class="form-group">
        <label><b class="ques-lbl">44)</b> Has the student you are joining, who is a member of your family unit, completed form 919 <i>Nomination of student dependants?</i></label>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="joining919" runat="server" id="iscompletedformNO">No
            </label>
        </div>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="joining919" runat="server" id="iscompletedformYes">Yes
            </label>
        </div>
        <div>
        <div class="comm-txt">If applying outside Australia, you <b>must</b> provide a completed form 919 with this application</div>
        </div>
        <div>
        <div class="comm-txt">Attach the completed form 919 to this application</div>
        </div>
        </div>
        </div>
        <!-- ques 44 end -->
        <!-- ques 45 start -->
        <div>
        <div class="form-group">
        <label><b class="ques-lbl">45)</b> Do you intend to study in Australia for more than 3 months? </label>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="more_month" runat="server" id="studymorethanthreemonthNo">No
            </label>
        </div>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="more_month" runat="server" id="studymorethanthreemonthYes">Yes
            </label>
        </div>
        <div class="collpse-div">
        <div class="comm-txt">If you are 5 years up to 18 years of age, please provide documentary evidence of school enrolment in Australia.</div>
        <div class="comm-txt">If you are 18 years of age or older and you intend to study in Australia for more than 3 months, you must apply for a student visa as a principal applicant, rather than as a family unit member.</div>
        </div>
        </div>
        </div>
        <!-- ques 45 end -->
        <!-- ques 46 start -->
        <div>
        <div class="comm-txt"><b class="ques-lbl">46)</b> Provide details of the student you are joining in Australia </div>
        <div class="form-group">
        <label>Name</label>
        <input type="text" name="" class="form-control" runat="server" id="studentnamepartC">
        </div>
        <div class="form-group">
        <label>Relationship to you</label>
        <input type="text" name="" class="form-control" runat="server" id="relationshiptostudentpartC">
        </div>
        <div class="form-group">
        <label>Date of birth</label>
        <input id="studentdobpartC" runat="server" type="text" class="form-control" data-toggle="flatpickr" value="">
        </div>
        <div class="form-group">
        <label>Citizenship(s) </label>
        <input type="text" name="" class="form-control" runat="server" id="citizenshipofstudentpartC">
        </div>
        <div class="form-group">
        <label>Address</label>
        <textarea class="form-control" rows="3" runat="server" id="studentaddresspartC"></textarea>
        </div>
        <div class="form-group">
        <label>Postal code</label>
        <input type="text" name="" class="form-control" runat="server" id="studentaddpostalcodepartC">
        </div>
        <div class="form-group">
        <label>Type of student visa held</label>
        <input type="text" name="" class="form-control" runat="server" id="typeofstudentvisaheldpartC">
        </div>
        <div class="form-group">
        <label>What Assessment Level were they assessed against (if known)?</label>
        <input type="text" name="" class="form-control" runat="server" id="assessmentlevelpartC">
        </div>
        <div class="form-group">
        <label>Date granted </label>
        <input id="assessmentgrantdatepartC" runat="server" type="text" class="form-control" data-toggle="flatpickr" value="">
        </div>
        <div class="form-group">
        <label>Expiry date </label>
        <input id="assessmentexpirydatepartC" runat="server" type="text" class="form-control" data-toggle="flatpickr" value="">
        </div>
        <div class="comm-txt"><b>Note:</b> You cannot join your family unit member in Australia on a student visa if they are in Assessment Levels 3–5 unless the total duration of the course(s) they are undertaking in Australia is at least 12 months or more.</div>
        </div>
        <!-- ques 46 end -->
        <!-- ques 47 start -->
        <div>
        <div class="form-group">
        <label><b class="ques-lbl">47)</b>	Did the student you are joining declare in their initial student visa application you and other members of their family unit included in this application?</label>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="joinvisa" runat="server" id="isstudentjoiningdeclarepartCNo">No
            </label>
        </div>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="joinvisa" runat="server" id="isstudentjoiningdeclarepartYes">Yes
            </label>
        </div>
        </div>
        </div>

        <!-- ques 47 end -->
        <!-- ques 48 start -->
        <div>
        <div class="comm-txt"><b class="ques-lbl">48)</b> Is the student you are joining</div>
        <ul>
        <li>the holder of an International Postgraduate Research Scholarship;</li>
        <li>sponsored by AusAID or the Australian Department of Defence;</li>
        <li>fully sponsored by the federal, or a state or territory government of Australia;</li>
        <li>fully sponsored by the government of your home country, or by a state or provincial government of your home country;</li>
        <li>fully sponsored by a multilateral organisation eg. the United Nations, World Bank?</li>
        </ul>
        <div class="form-group">
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="joing-ausid" runat="server" id="isstudentjoiningsatisfiedconditionpartCNo">No
            </label>
        </div>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="joing-ausid" runat="server" id="isstudentjoiningsatisfiedconditionpartCYes">Yes
            </label>
        </div>
        <div>
        <div class="comm-txt">If the student you are joining is in Assessment Level 2–5 and was granted their visa after 1 December 2003, there are specific financial evidentiary requirements that you must meet. Please go to the department’s website for details on the levels of funds you are required to demonstrate, acceptable sources of funds and the length of time funds must be held.</div>
        </div>
        </div>
        </div>
        <!-- ques 48 end -->
        <!-- ques 49 start -->
        <div>
        <div class="form-group">
        <label><b class="ques-lbl">49)</b> Does the student you are joining have sufficient funds to financially support themselves, you and any other family members included in this application, for the remainder of his or her stay in Australia?</label>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="join-funds" runat="server" id="suficientfundpartCNo">No
            </label>
        </div>
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="join-funds" runat="server" id="suficientfundpartCYes">Yes
            </label>
        </div>
        </div>
        </div>
        <!-- ques 49 end -->
        </div>
        </div>
        <!-- Part C End -->


        <%--Button--%>
	        <div class="list-group-item">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row">      
                        <a href="australiavisadetail.aspx" class="btn btn-success" style="margin-right: 10px;">Back</a>
                        <asp:Button ID="btnvisadetails" runat="server" Text="Next" CssClass="btn btn-success" OnClientClick="return validateform()" OnClick="btnvisadetails_Click"/>
                        <div class="col-md-6">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>                                               
                        </div>
                    </div>
                </div>
            </div>

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

        function validateform() {
            var flag = false;
             //PARTC
            if (!($("#<%=iscompletedformNO.ClientID%>").is(':checked') || $("#<%=iscompletedformYes.ClientID%>").is(':checked')))
                alert("Please enter Has the student you are joining, who is a member of your family unit, completed form 919 of field 44");
            else if (!($("#<%=studymorethanthreemonthNo.ClientID%>").is(':checked') || $("#<%=studymorethanthreemonthYes.ClientID%>").is(':checked')))
                alert("Please select Do you intend to study in Australia for more than 3 months of field 45");
            else if ($("#<%=studentnamepartC.ClientID%>").val() == "")
                alert("Please enter Name of student of field 46");
            else if ($("#<%=relationshiptostudentpartC.ClientID%>").val() == "")
                alert("Please enter realtionship  with you of field 46");
            else if ($("#<%=studentdobpartC.ClientID%>").val() == "")
                alert("Please enter Date of birth of field 46");
            else if ($("#<%=citizenshipofstudentpartC.ClientID%>").val() == "")
                alert("Please enter citizenship of a student of field 46");
            else if ($("#<%=studentaddresspartC.ClientID%>").val() == "")
                alert("Please enter address of student of field 46");
            else if ($("#<%=studentaddpostalcodepartC.ClientID%>").val() == "")
                alert("Please enter postal code of field 46");
            else if ($("#<%=typeofstudentvisaheldpartC.ClientID%>").val() == "")
                alert("Please enter type os visa student held of field 46");
            else if ($("#<%=assessmentlevelpartC.ClientID%>").val() == "")
                alert("Please enter assessment level of field 46");
            else if ($("#<%=assessmentgrantdatepartC.ClientID%>").val() == "")
                alert("Please enter granted date of field 46");
            else if ($("#<%=assessmentexpirydatepartC.ClientID%>").val() == "")
                alert("Please enter assessment level expiry date of field 46");
            //47
            else if (!($("#<%=isstudentjoiningdeclarepartCNo.ClientID%>").is(':checked') || $("#<%=isstudentjoiningdeclarepartYes.ClientID%>").is(':checked')))
                alert("Please select Did the student you are joining declare in their initial student visa application you and other members of their family unit included in this application of field 47");
            else if (!($("#<%=isstudentjoiningsatisfiedconditionpartCNo.ClientID%>").is(':checked') || $("#<%=isstudentjoiningsatisfiedconditionpartCYes.ClientID%>").is(':checked')))
                alert("Please select Is the student you are joining of field 48");
            else if (!($("#<%=suficientfundpartCNo.ClientID%>").is(':checked') || $("#<%=suficientfundpartCYes.ClientID%>").is(':checked')))
                alert("Please select Does the student you are joining have sufficient funds to financially support themselves, you and any other family members included in this application, for the remainder of his or her stay in Australia of field 49");
            else
                flag = true;
            return flag;
        
        }

        $('#ContentPlaceHolder1_studentdobpartC').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        
        $('#ContentPlaceHolder1_assessmentgrantdatepartC').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#ContentPlaceHolder1_assessmentexpirydatepartC').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Application_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantvisa').addClass('active');
        });
    </script>
    </asp:Content>