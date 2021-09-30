<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantchoicestatus.aspx.cs" Inherits="applicantchoicestatus" MasterPageFile="~/student.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">VIEW STATUS</li>
        </ol>
        <h1 class="h2">VIEW YOUR APPLICATION STATUS</h1>

    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
               <div class="col-md-8">
                   <div class="list-group-fit list-group-item">
                       <h3>INSTRUCTIONS FOR VIEWING YOUR APPLICATION STATUS:</h3>
                       <div class="list-group list-group-fit list-group-item" runat="server" id="universityInstruction">
                       </div>
                   </div>
                <br/>
                <div class="list-group-fit list-group-item" id="choices" runat="server">
                    <%--accordian start--%>                      
                    <div class="accordion" id="accordion">
                    <asp:DataList ID="choiceList" runat="server" OnItemDataBound="choiceList_ItemDataBound" OnItemCommand="choiceList_ItemCommand" GridLines="Horizontal" CssClass="table">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server"> 
                                
                                    <div class="">
                                        <div class="card-header" id="<%# Eval("id") %>">
                                            <h2 class="mb-0"  data-toggle="collapse" data-target="#collapseOne<%# Eval("id") %>" aria-expanded="false" aria-controls="collapseOne<%# Eval("id") %>" >
                                                <button class="btn btn-link" type="button" style="margin-left:auto;width:auto;">
                                                    <label for="choice">Course Choice - <%# Eval("choice") %> </label>
                                                </button>                                                
                                            </h2>
                                        </div>

                                        <div id="collapseOne<%# Eval("id") %>" class="collapse" aria-labelledby="<%# Eval("id") %>" data-parent="#accordion">
                                            <div class="card-body">                                                

                                                <div class="card-body">
                                                    <div style="display: none;">
                                                        <asp:Label ID="lblApplicationMasterId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                        <asp:Label ID="lblUniversityId" runat="server" Text='<%# Eval("universityId") %>'></asp:Label>
                                                    </div>
                                                    <%--<div class="form-group">
                                                        <label for="choice" class="col-form-label form-label">Choice - <%# Eval("choice") %> </label>
                                                    </div>--%>
                                                    <div class="form-group">
                                                        <label for="universityName" class="col-form-label form-label">Name of University: </label>
                                                        <asp:Label ID="lblUniversityName" runat="server" Text='<%# Eval("universityName") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="universityCampus" class="col-form-label form-label">Name of Campus: </label>
                                                        <asp:Label ID="lblUniversityCampus" runat="server" Text='<%# Eval("campusName") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="universityCourse" class="col-form-label form-label">Name of Course: </label>
                                                        <asp:Label ID="lblUniversityCourse" runat="server" Text='<%# Eval("courseName") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="courseCommencementDate" class="ccol-form-label form-label">Commencement Date: </label>
                                                        <asp:Label ID="lblCourseCommencementDate" runat="server" Text='<%# Eval("commencementDate") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="applicantionStatus" class="col-form-label form-label">Current Status: </label>
                                                        <asp:Label ID="lblApplicantionStatus" runat="server" Text='<%# Eval("currentStatus") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="applicationDate" class="col-form-label form-label">Date of Application: </label>
                                                        <asp:Label ID="lblApplicationDate" runat="server" Text='<%# Eval("dateOfApplication") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="dateOfDecision" class="col-form-label form-label">Date of Decision: </label>
                                                        <asp:Label ID="lblDateOfDecision" runat="server" Text='<%# Eval("dateOfDecision") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="universityDecision" class="col-form-label form-label">Decision: </label>
                                                        <asp:Label ID="universityDecision" runat="server" Text='<%# Eval("decision") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group" id="conditionDiv" runat="server">
                                                        <label for="universityCondition" class="col-form-label form-label">Condition: </label>
                                                        <asp:Label ID="lblUniversityCondition" runat="server" Text='<%# Eval("condition") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="universityAdmissionRemark" class="col-form-label form-label">Admission Office Remarks: </label>
                                                        <asp:Label ID="lblUniversityAdmissionRemark" runat="server" Text='<%# Eval("admissionRemarks") %>'></asp:Label>
                                                    </div>
                                                    <div class="form-group" id="mangeOfferDiv" runat="server">
                                                        <asp:LinkButton ID="lnkDownloadBtn" runat="server" CommandName="Download" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id")%>'>Download Offer</asp:LinkButton>
                                                        <input id="btnAccept" runat="server" type="button" value="Accept" />
                                                        <input id="btnReject" runat="server" type="button" value="Reject" />
                                                        <input id="btnDefer" runat="server" type="button" value="Defer" />
                                                    </div>
                                                    <div class="form-group" id="termsConditionDiv" runat="server" style="display:none">
                                                        <label class="col-form-label form-label" runat="server" id="lblStudent"> </label>
                                                        <label class="col-form-label form-label">Please accept the terms and condition </label>

                                                        <div class="option">
                                                            <input id="chkTermsCondition" type="checkbox" runat="server" />
                                                            <label class="col-form-label form-label" runat="server" id="lblTerms"></label>
                                                        </div>                                        

                                                        <div id="defermentDiv" runat="server" style="display: none">
                                                            <label class="col-form-label form-label">Please select how long you wish to defer for </label>
                                                            <br />
                                                            <div class="col-md-6">
                                                                Defer Untill:
                                                                <asp:DropDownList class="form-control" id="deferPeriod" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>

                                                        <div id="rejectDiv" runat="server" style="display: none">
                                                            <label class="col-form-label form-label">Please select reason for rejection:  </label>
                                                            <br />
                                                            <div class="col-md-6">
                                                                <asp:DropDownList runat="server" class="form-control" id="rejectionReason"></asp:DropDownList>
                                                            </div>
                                                            <asp:TextBox id="rejectOtherReason" style="display: none" CssClass="form-control" runat="server" placeholder="Please enter rejection remark"></asp:TextBox>
                                                        </div>
                                                        <asp:Button ID="btnAcceptSubmit" runat="server" CommandName="Accept" CommandArgument='<%#Eval("id")%>' Text="Process Acceptance Now" style="display:none"/>
                                                        <asp:Button ID="btnRejectSubmit" runat="server" CommandName="Reject" CommandArgument='<%#Eval("id") %>' Text="Process Rejection Now" style="display:none"/>
                                                        <asp:Button ID="btnDeferSubmit" runat="server" CommandName="Defer" CommandArgument='<%#Eval("id") %>' Text="Process Deferment Now" style="display:none"/>
                                                    </div>

                                                    <div class="form-group" id="actionMsgDiv" runat="server">
                                                        <asp:Label ID="lblMsg" runat="server" Text=''></asp:Label>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>

                               
                                    
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList> 
                      </div>               
                    <%--accordian end--%>                   
                </div>
                <div id="emptyChoicesDiv" runat="server" class="card">
                    <div class="card-body">
                        <asp:Label ID="lblEmptyList" runat="server" Text="" Visible="false"></asp:Label>
                        <div style="margin-left:50%">
                            <asp:Button runat="server" class="btn btn-success" Text="Go to Your Offers section" OnClick="gottonext_Click" ID="gottonext"/>
                        </div>                        
                    </div>
                </div>
               </div>
                <div class="col-md-4">
                    <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>
                <div class="card faq-qwrp" id="Div1" runat="server">
                    <div class="card-body">
                        <%  if (allfaqQuestion.Count > 0)
                            { %>
                        <div id="question" runat="server">
                            <h5>Frequently Asked Questions (FAQs)</h5>
                            <div class="">
                                <%for (int q = 0; q < allfaqQuestion.Count; q++)
                                    {%>
                                <div class="star-list">
                                    <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')"> <%=allfaqQuestion[q].question%> </label>
                                </div>
                                <%} %>
                            </div>
                        </div>
                        <%} %>
                    </div>
                </div>
                </div>
            </div>
         </div>
        </div>

        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    <script>
        function openLink(url) {
            $('body').append('<div class="modal" id="video-modal" tabindex="-1" role="dialog"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="">Ans:' + url + '</div></div></div></div></div>');
            $('#video-modal').modal('show');
            $('#video-modal').on('hidden.bs.modal', function () {
                $('#video-modal').remove();
            });
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#admissionsOffer_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantchoices').addClass('active');

            var count = $('#ContentPlaceHolder1_choiceList tr').length;
            for (var i = 0; i < count; i++) {
                $("#ContentPlaceHolder1_choiceList_btnAccept_" + i).click(function (event) {
                    var result = confirm("You have decided to Accept this offer, click to confirm");
                    var id =  event.target.id.replace("ContentPlaceHolder1_choiceList_btnAccept_", "");
                    if (result) {
                        // fetch accept terms and conditions
                        var universityId = $("#ContentPlaceHolder1_choiceList_lblUniversityId_" + id).text();
                        $.ajax({
                            type: "POST",
                            url: "applicantchoicestatus.aspx/GetTermsCondition",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: "{'universityId': '" + universityId + "','option':'accept'}",
                            success: function (response) {
                                if (response.d) {
                                    var result = JSON.parse(response.d);
                                    var studentFirstName = $("#lblusername").text();

                                    $("#ContentPlaceHolder1_choiceList_termsConditionDiv_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_mangeOfferDiv_" + id).hide();
                                    $("#ContentPlaceHolder1_choiceList_lblStudent_" + id).text(studentFirstName + " you have chosen to accept this offer");
                                    $("#ContentPlaceHolder1_choiceList_lblTerms_" + id).text(result.acceptance_terms);
                                    $("#ContentPlaceHolder1_choiceList_btnAcceptSubmit_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_btnAcceptSubmit_" + id).on('click', { value: id }, acceptBtnValidation);
                                }
                                else
                                    alert("Error fetching terms and conditions. Please try once again");
                            }
                        });
                    }
                });
            }

            for (var i = 0; i < count; i++) {
                $("#ContentPlaceHolder1_choiceList_btnReject_" + i).click(function (event) {
                    var result = confirm("You have decided to Reject this offer, click to confirm");
                    var id =  event.target.id.replace("ContentPlaceHolder1_choiceList_btnReject_", "");
                    if (result) {
                        // fetch reject terms and conditions
                        var universityId = $("#ContentPlaceHolder1_choiceList_lblUniversityId_" + id).text();
                        $.ajax({
                            type: "POST",
                            url: "applicantchoicestatus.aspx/GetTermsCondition",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: "{'universityId': '" + universityId + "','option':'reject'}",
                            success: function (response) {
                                if (response.d) {
                                    var result = JSON.parse(response.d);
                                    var studentFirstName = $("#lblusername").text();

                                    $("#ContentPlaceHolder1_choiceList_termsConditionDiv_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_rejectDiv_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_mangeOfferDiv_" + id).hide();
                                    $("#ContentPlaceHolder1_choiceList_lblStudent_" + id).text(studentFirstName + " you have chosen to reject this offer");
                                    $("#ContentPlaceHolder1_choiceList_lblTerms_" + id).text(result.rejection_terms);
                                    $("#ContentPlaceHolder1_choiceList_btnRejectSubmit_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_btnRejectSubmit_" + id).on('click', { value: id }, rejectBtnValidation);

                                    $("#ContentPlaceHolder1_choiceList_rejectionReason_" + id).change(function () {
                                        var value = $("#ContentPlaceHolder1_choiceList_rejectionReason_" + id +" option:selected").text().toLowerCase();
                                        if (value == "other")
                                            $("#ContentPlaceHolder1_choiceList_rejectOtherReason_" + id).show();
                                        else
                                            $("#ContentPlaceHolder1_choiceList_rejectOtherReason_" + id).hide();
                                    });
                                }
                                else
                                    alert("Error fetching terms and conditions. Please try once again");
                            }
                        });
                    }
                });
            }

            for (var i = 0; i < count; i++) {
                $("#ContentPlaceHolder1_choiceList_btnDefer_" + i).click(function (event) {
                    var result = confirm("You have decided to Defer this offer, click to confirm");
                    var id = event.target.id.replace("ContentPlaceHolder1_choiceList_btnDefer_", "");
                    if (result) {
                        // fetch defer terms and conditions
                        var universityId = $("#ContentPlaceHolder1_choiceList_lblUniversityId_" + id).text();
                        $.ajax({
                            type: "POST",
                            url: "applicantchoicestatus.aspx/GetTermsCondition",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: "{'universityId': '" + universityId + "','option':'defer'}",
                            success: function (response) {
                                if (response.d) {
                                    var result = JSON.parse(response.d);
                                    var studentFirstName = $("#lblusername").text();

                                    $("#ContentPlaceHolder1_choiceList_termsConditionDiv_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_defermentDiv_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_mangeOfferDiv_" + id).hide();
                                    $("#ContentPlaceHolder1_choiceList_lblStudent_" + id).text(studentFirstName + " you have chosen to defer this offer");
                                    $("#ContentPlaceHolder1_choiceList_lblTerms_" + id).text(result.deferment_terms);
                                    $("#ContentPlaceHolder1_choiceList_btnDeferSubmit_" + id).show();
                                    $("#ContentPlaceHolder1_choiceList_btnDeferSubmit_" + id).on('click', { value: id }, deferBtnValidation);
                                }
                                else
                                    alert("Error fetching terms and conditions. Please try once again");
                            }
                        });
                    }
                });
            }

            function acceptBtnValidation(event) {
                var id = event.data.value;
                var istermsAccepted = $("#ContentPlaceHolder1_choiceList_chkTermsCondition_" + id).is(':checked');
                if (!istermsAccepted) {
                    alert("Please tick terms and condition for acceptance.");
                    return false;
                }

                if (!confirmSubmition("accept"))
                    return false;
            }

            function deferBtnValidation(event) {
                var id = event.data.value;
                var istermsAccepted = $("#ContentPlaceHolder1_choiceList_chkTermsCondition_" + id).is(':checked');
                var defermentPeriodSelection = $("#ContentPlaceHolder1_choiceList_deferPeriod_" + id).val();
                if (!istermsAccepted) {
                    alert("Please tick terms and condition for deferment.");
                    return false;
                }
                else if (defermentPeriodSelection == "0" || defermentPeriodSelection == null) {
                    alert("Please select period of deferment before processing.");
                    return false;
                }

                if (!confirmSubmition("defer"))
                    return false;
            }

            function rejectBtnValidation(event) {
                var id = event.data.value;
                var istermsAccepted = $("#ContentPlaceHolder1_choiceList_chkTermsCondition_" + id).is(':checked');
                var rejectionReasonSelection = $("#ContentPlaceHolder1_choiceList_rejectionReason_" + id).val();
                var rejectionOtherReasonText = $("#ContentPlaceHolder1_choiceList_rejectOtherReason_" + id).val();
                var selectedValue = $("#ContentPlaceHolder1_choiceList_rejectionReason_" + id +" option:selected").text().toLowerCase();
                if (!istermsAccepted) {
                    alert("Please tick terms and condition for rejection.");
                    return false;
                }
                else if (rejectionReasonSelection == "0" || rejectionReasonSelection == null) {
                    alert("Please select reason of rejection before processing.");
                    return false;
                }
                else if (selectedValue == "other" && (rejectionOtherReasonText == "" || rejectionOtherReasonText == null)) {
                    alert("Please enter rejcection remark.");
                    return false;
                }

                if (!confirmSubmition("reject"))
                    return false;
            }

            function confirmSubmition(activityType) {
                return(confirm("Are you sure you want to " + activityType + " this offer, click OK to confirm"));
            }
        });  
    </script>

</asp:Content>