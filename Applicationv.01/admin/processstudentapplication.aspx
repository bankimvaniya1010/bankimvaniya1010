<%@ Page Language="C#" AutoEventWireup="true" CodeFile="processstudentapplication.aspx.cs" Inherits="admin_processstudentapplication" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active"> Student Application </li>
        </ol>
        <h1 class="h2"> STUDENT APPLICATION</h1>

    </div>
    <div class="page ">

        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12" id="choices" runat="server">
                        <asp:DataList ID="choiceList" Width="75%" BackColor="White" runat="server" GridLines="Horizontal" OnItemDataBound="choiceList_ItemDataBound" OnItemCommand="choiceList_ItemCommand">
                            <ItemTemplate>
                                <asp:Panel ID="options" runat="server">
                                    <div class="card-body">
                                        <div style="display: none;">
                                            <asp:Label ID="lblApplicationMasterId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label for="choice" class="col-form-label form-label">Choice - <%# Eval("choice") %> </label>
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
                                            <label class="col-form-label form-label">Current Status: </label>
                                            <asp:Label ID="lblCurrentStatus" runat="server" Text="Label"></asp:Label>
                                            <br />
                                            <div class="col-md-8">
                                                <asp:DropDownList class="form-control" id="ddlCurrentStatus" runat="server"></asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="applicationDate" class="col-form-label form-label">Date of Application: </label>
                                            <asp:Label ID="lblApplicationDate" runat="server" Text='<%# Eval("dateOfApplication") %>'></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label form-label">Decision </label>
                                            <br />
                                            <div class="col-md-8">
                                                <asp:DropDownList class="form-control" id="ddlDecision" runat="server"></asp:DropDownList>
                                            </div>
                                            <div>
                                                <asp:HyperLink ID="hypLnkViewOffer" runat="server" Target="_blank">View Offer Letter</asp:HyperLink>
                                            </div>
                                        </div>
                                        <div class="form-group" id="decisionDateDiv" runat="server" style="display:none">
                                            <label for="dateOfDecision" class="col-form-label form-label">Date of Decision: </label>
                                            <asp:Label ID="lblDateOfDecision" runat="server" Text='<%# Eval("dateOfDecision") %>'></asp:Label>
                                        </div>
                                        <div class="form-group" id="conditionDiv" runat="server" style="display:none">
                                            <label for="universityCondition" class="col-form-label form-label">Condition: </label>
                                            <asp:TextBox ID="txtUniversityCondition" runat="server" Text='<%# Eval("condition") %>'></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-8">
                                            <label for="universityAdmissionRemark" class="col-form-label form-label">Admission Office Remarks: </label>
                                            <asp:TextBox ID="txtUniversityAdmissionRemark" runat="server" placeholder ="Office Remark" Text='<%# Eval("admissionRemarks") %>' CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group" id="defermentDiv" runat="server">
                                            <label class="col-form-label form-label">Deferment Date Requested </label>
                                            <br />
                                            <div class="col-md-8">
                                                <asp:Label ID="lblDefermentDate" runat="server" Text='<%# Eval("deferment_date") %>'></asp:Label>
                                          
                                            <label for="universityDefermentRemark" class="col-form-label form-label">Deferment request comments (Accept / Reject) </label>
                                            <asp:DropDownList ID="ddlDefermentChoice" runat="server" class="form-control">
                                                <asp:ListItem Value="">Please Select</asp:ListItem>
                                                <asp:ListItem Value="Accepted">Accepted</asp:ListItem>
                                                <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                            </asp:DropDownList>
                                                <br>
                                                </div>
                                             <div class="col-md-8">
                                                <asp:TextBox ID="txtUniversityDefermentRemark" runat="server" placeholder ="Please enter deferment remarks" Text='<%# Eval("deferment_remark") %>' CssClass="form-control"></asp:TextBox>                                                                             
                                             </div>
                                             </div>
                                        <div class="form-group" id="offerLetterDiv" runat="server" style="display:none">
                                            <label for="offerLetterPdf" class="col-form-label form-label">Upload Offer Letter in PDF </label>
                                            <div class="col-md-8">
                                                <asp:FileUpload ID="offerLetterPdf" runat="server" CssClass="custom-file-input" />
                                                <label for="offerLetterPdf" runat="server" id="pdfOfferLetterFileName" class="custom-file-label">Choose application file</label>
                                            </div>
                                        </div>
                                        <div class="form-group" id="coeLetterDiv" runat="server" style="display:none">
                                            <label for="coePdf" class="col-form-label form-label">Upload Confirmation of Enrollment in PDF </label>
                                            <div class="col-md-8">
                                                <asp:FileUpload ID="coePdf" runat="server" CssClass="custom-file-input" />
                                                <label for="coePdf" runat="server" id="pdfCoeFileName" class="custom-file-label">Choose application file</label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <asp:Button ID="btnSubmit" runat="server" CommandName="Submit" CommandArgument='<%#Eval("id")%>' Text="Process Preference"/>
                                        </div>

                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <div id="emptyChoicesDiv" runat="server" style="display: none;">
                        <div>
                            <asp:Label ID="lblEmptyList" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#courseApplication').addClass('active');

            var count = $('#ContentPlaceHolder1_choiceList tr').length;
            for (var i = 0; i < count; i++) {
                $("#ContentPlaceHolder1_choiceList_ddlDecision_" + i).change(function (event) {
                    var id = event.target.id.replace("ContentPlaceHolder1_choiceList_ddlDecision_", "");
                    var selectedValue = $("#ContentPlaceHolder1_choiceList_ddlDecision_" + id + " option:selected").text().toLowerCase();
                    
                    if (selectedValue.includes("conditional"))
                        $("#ContentPlaceHolder1_choiceList_conditionDiv_" + id).show();
                    else
                        $("#ContentPlaceHolder1_choiceList_conditionDiv_" + id).hide();

                    if (selectedValue.includes("accepted"))
                        $("#ContentPlaceHolder1_choiceList_offerLetterDiv_" + id).show();
                    else
                        $("#ContentPlaceHolder1_choiceList_offerLetterDiv_" + id).hide();
                });

                $("#ContentPlaceHolder1_choiceList_ddlCurrentStatus_" + i).change(function (event) {
                    var id = event.target.id.replace("ContentPlaceHolder1_choiceList_ddlCurrentStatus_", "");
                    var selectedValue = $("#ContentPlaceHolder1_choiceList_ddlCurrentStatus_" + id + " option:selected").text().toLowerCase();
                    
                    if (selectedValue.includes("enrolment"))
                        $("#ContentPlaceHolder1_choiceList_coeLetterDiv_" + id).show();
                    else
                        $("#ContentPlaceHolder1_choiceList_coeLetterDiv_" + id).hide();
                });


                $("#ContentPlaceHolder1_choiceList_btnSubmit_" + i).click(function (event) {
                    var id = parseInt(event.target.id.replace("ContentPlaceHolder1_choiceList_btnSubmit_", ""));
                    return checkValidation(id);
                });

                // To view file names in upload control for offer letter and confirmation of enrollment.
                $("#ContentPlaceHolder1_choiceList_offerLetterPdf_" + i).change(function (event) {
                    var path = $(this).val();
                    var id = event.target.id.replace("ContentPlaceHolder1_choiceList_offerLetterPdf_", "");
                    $("#ContentPlaceHolder1_choiceList_pdfOfferLetterFileName_" + id).text('Choose application file');
                    if (path != '' && path != null) {
                        var q = path.substring(path.lastIndexOf('\\') + 1);
                        $("#ContentPlaceHolder1_choiceList_pdfOfferLetterFileName_" + id).text(q);
                    }
                });

                $("#ContentPlaceHolder1_choiceList_coePdf_" + i).change(function (event) {
                    var path = $(this).val();
                    var id = event.target.id.replace("ContentPlaceHolder1_choiceList_coePdf_", "");
                    $("#ContentPlaceHolder1_choiceList_pdfCoeFileName_" + id).text('Choose application file');
                    if (path != '' && path != null) {
                        var q = path.substring(path.lastIndexOf('\\') + 1);
                        $("#ContentPlaceHolder1_choiceList_pdfCoeFileName_" + id).text(q);
                    }
                });
            }

            function checkValidation(id) {
                var ddlDecisionValue = $("#ContentPlaceHolder1_choiceList_ddlDecision_" + id).val();
                var ddlDecisionValueText = $("#ContentPlaceHolder1_choiceList_ddlDecision_" + id + " option:selected").text().toLowerCase();
                var txtUniversityCondition = $("#ContentPlaceHolder1_choiceList_txtUniversityCondition_" + id).val();
                var ddlCurrentStatus = $("#ContentPlaceHolder1_choiceList_ddlCurrentStatus_" + id).val();
                var ddlCurrentStatusValueText = $("#ContentPlaceHolder1_choiceList_ddlCurrentStatus_" + id + " option:selected").text().toLowerCase();
                var lblCurrentStatusText = $("#ContentPlaceHolder1_choiceList_lblCurrentStatus_" + id).text().toLowerCase();
                var admissionRemarkText = $("#ContentPlaceHolder1_choiceList_txtUniversityAdmissionRemark_" + id).val();

                var flag = false;

                if (ddlDecisionValue == "0" || ddlDecisionValue == "")
                    alert("Please select your decision for prefernce no. " + (id + 1));
                else if (ddlDecisionValueText.includes("conditional") && (txtUniversityCondition == "" || txtUniversityCondition == null))
                    alert("You have decided to release conditional offer for prefernce no. " + (id + 1) + ". Please provide condition for the offer.");
                else if (lblCurrentStatusText.includes("application under review") && (ddlCurrentStatus == "0" || ddlCurrentStatus == null))
                    alert("Please select current status for prefernce no. " + (id + 1));
                else if (admissionRemarkText == "" || admissionRemarkText == null)
                    alert("Please enter general remarks for prefernce no. " + (id + 1));
                else if (ddlDecisionValueText.includes("application accepted") && (ddlCurrentStatusValueText.includes("application rejected") || ddlCurrentStatusValueText.includes("application withdrawn"))) // Check for decision of "APPLICATION ACCEPTED" and current Status "APPLICATION REJECTED OR WITHDRAWN"
                    alert("Current Status cannot be set to " + ddlCurrentStatusValueText + " as decision selected is " + ddlDecisionValueText);
                else if (ddlDecisionValueText.includes("application rejected") && !ddlCurrentStatusValueText.includes("application rejected")) // Check for decision of "APPLICATION REJECTED" and current Status "APPLICATION REJECTED"
                    alert("Current Status cannot be set to " + ddlCurrentStatusValueText + " as decision selected is " + ddlDecisionValueText);
                else if (ddlDecisionValueText.includes("application withdrawn") && !ddlCurrentStatusValueText.includes("application withdrawn")) // Check for decision of "APPLICATION WITHDRAWN" and current Status "APPLICATION WITHDRAWN"
                    alert("Current Status cannot be set to " + ddlCurrentStatusValueText + " as decision selected is " + ddlDecisionValueText);
                else if (ddlDecisionValueText.includes("application accepted (conditional)") && !ddlCurrentStatusValueText.includes("conditional")) // Check for decision of "APPLICATION ACCEPTED(CONDITIONAL)" and current Status is not "CONDITIONAL OFFER RELEASED"
                    alert("Current Status cannot be set to " + ddlCurrentStatusValueText + " as decision selected is " + ddlDecisionValueText);
                else if (lblCurrentStatusText.includes("offer deferred") && !checkDefermentValidation(id)) { } // Check for current status if offer derferred, then check for accept or reject and deferment remark
                else if (!$("#ContentPlaceHolder1_choiceList_offerLetterDiv_" + id).is(':hidden') && ddlDecisionValueText.includes("accepted") && !checkFileUploadValidation("offer letter", id)) { } // Check for offer letter if decision is APPLICATION ACCEPTED 
                else if (ddlCurrentStatusValueText.includes("confirmation of enrolment") && !checkFileUploadValidation("CoE letter", id)) { } // Check for coe letter if current status is CONFIRMATION OF ENROLMENT GENERATED

                else
                    flag = true;

                if (flag && !confirmSubmition())
                    return false;

                return flag;/*return false;*/
            }

            function checkDefermentValidation(id) {
                var defermentRemark = $("#ContentPlaceHolder1_choiceList_txtUniversityDefermentRemark_" + id).val();
                var defermentChoice = $("#ContentPlaceHolder1_choiceList_ddlDefermentChoice_" + id).val();
                if (defermentRemark == "" || defermentRemark == null) // Check for deferment remarks entered or empty value
                    alert("Please enter deferment remark for the prefernce no. " + (id + 1));
                else if (defermentChoice == null || defermentChoice == "") // Check for deferment accept or rejected choice.
                    alert("Please select deferment choice for the prefernce no. " + (id + 1));
                else
                    return true;
            }

            function checkFileUploadValidation(fileType, id) {
                var uploadedfile;
                if (fileType == "offer letter")
                    uploadedfile = $("#ContentPlaceHolder1_choiceList_offerLetterPdf_" + id); // File Upload control
                else if (fileType == "CoE letter")
                    uploadedfile = $("#ContentPlaceHolder1_choiceList_coePdf_" + id); // File Upload control
                else
                    return false;

                if (uploadedfile.get(0).files.length == 0) {
                    alert("Please upload " + fileType + " for preference no: " + (id + 1));
                    return false;
                }
                var ext = uploadedfile.val().split('.').pop();
                if (!(ext == "pdf")) {
                    alert("Please upload " + fileType + " form in pdf format for preference no: " + (id + 1));
                    return false;
                }
                
                return true;
            }

            function confirmSubmition() {
                return(confirm("Are you sure to process this preference for student application, click OK to confirm"));
            }
        });
    </script>
</asp:Content>
