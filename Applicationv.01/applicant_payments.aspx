﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicant_payments.aspx.cs" Inherits="applicant_payments" MasterPageFile="~/student.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">YOUR PAYMENTS</li>
        </ol>
        <h1 class="h2">MAKE PAYMENT(S), UPLOAD PROOF OF PAYMENT(S) & VIEW PREVIOUS PAYMENT(S)</h1>

        <div class="page ">

            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="tab-content card-body">
                            <div class="list-group-fit list-group-item">
                                <h3>INSTRUCTIONS FOR MAKING PAYMENT(S), UPLOADING PROOF OF PAYMENT(S) & VIEWING YOUR PREVIOUS PAYMENT(S):</h3>
                                <div class="list-group list-group-fit list-group-item" runat="server" id="universityInstruction">
                                </div>
                            </div>
                            <br />
                            <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                <asp:GridView ID="paymentsGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                                    PageSize="25"
                                    BorderStyle="None"
                                    BorderWidth="1px" DataKeyNames="id"
                                    CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCommand="paymentsGridView_RowCommand" OnRowDataBound="paymentsGridView_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Date of Payment">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRequestDate" runat="server" Text='<%# Bind("request_date") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPaymentDetails" runat="server" Text='<%# Bind("payment_for") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment For Course">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPaymentCourse" runat="server" Text='<%# Bind("courseName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Due Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("due_date") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fee Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Instruction(s)">
                                            <ItemTemplate>
                                                <lable id="lblPaymentInstruction" runat="server" style="color: DodgerBlue;"> Click for details </lable>
                                                <asp:HiddenField ID="hidInstruction" runat="server" Value='<%# Bind("instruction") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Upload Proof of Payment">
                                            <ItemTemplate>
                                                <asp:FileUpload ID="paymentProof" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View Uploaded Proof">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hypLnkProof" Target="_blank" NavigateUrl='<%# Eval("fileName") %>' runat="server"> Uploaded File</asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Make Online Payment">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPayOnline" runat="server" Text='NA'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Verified">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPaymentStatus" runat="server" Text='<%# Bind("payment_status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkSave" runat="server" CausesValidation="False" CommandName="Save" CommandArgument='<%#Container.DataItemIndex%>' Text="Submit"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
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
                                        <label onclick="showFaqQuestion('<%=allfaqQuestion[q].question%>','<%=allfaqQuestion[q].answer.Replace(Environment.NewLine, "<br />") %>')"><%=allfaqQuestion[q].question%> </label>
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

        <!-- Modal for displaying payment instruction-->
        <div style="display: none;" runat="server">
            <div class="modal" id="instructionModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="faq-modal-header modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#feepayment_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#yourpayment').addClass('active');

            var rowsCount = $('#ContentPlaceHolder1_paymentsGridView tr').length - 1; // excluding header
            for (var i = 0; i < rowsCount; i++) {

                $("#ContentPlaceHolder1_paymentsGridView_lblPaymentInstruction_" + i).click(function (event) {
                    var id = event.target.id.replace("ContentPlaceHolder1_paymentsGridView_lblPaymentInstruction_", "");

                    var instructionModal = $('#instructionModal');
                    var instructions = $("#ContentPlaceHolder1_paymentsGridView_hidInstruction_" + id).val();
                    // Append hidden value in modal body
                    var modalBody = instructionModal.find($(".modal-body"))[0];
                    modalBody.append(instructions);

                    $('body').append(instructionModal);
                    $('#instructionModal').modal('show');

                    // Clear modal body on close
                    instructionModal.on('hidden.bs.modal', function () {
                        instructionModal.find($(".modal-body")).empty();
                    });
                });

                $("#ContentPlaceHolder1_paymentsGridView_lnkSave_" + i).on('click', { value: i }, validateRow);
            }

            function validateRow(event)
            {
                var id = event.data.value;
                uploadedfile = $("#ContentPlaceHolder1_paymentsGridView_paymentProof_" + id); // File Upload control
                if (uploadedfile.get(0).files.length == 0) {
                    alert("Please upload payment proof for payment no: " + (id + 1));
                    return false;
                }
                var ext = uploadedfile.val().split('.').pop();
                if (!(ext.toLowerCase() == "pdf")) {
                    alert("Please upload payment proof in pdf format for payment no: " + (id + 1));
                    return false;
                }
                var fileSize = Math.round((uploadedfile.get(0).files[0].size / 1024) / 1024);
                if (fileSize > 16) {
                    alert("Please upload payment proof file size less than 16MB for payment no: " + (id + 1));
                    return false;
                }
                return true;
            }
        });
    </script>
</asp:Content>

