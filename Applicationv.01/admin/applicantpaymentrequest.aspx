<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantpaymentrequest.aspx.cs" Inherits="admin_applicantpaymentrequest" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Payment Request</li>
        </ol>

        <h1 class="h2">Payment Request</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active">
                    <div class="form-group row">
                        <label for="detailsType" class="col-sm-3 col-form-label form-label">Payment Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlPaymentDescription" name="ddlPaymentDescription" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="paymentDueDate" class="col-sm-3 col-form-label form-label">Payment Due Date:</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtPaymentDueDate" type="text" class="form-control" placeholder="Payment Due Date" value="" />
                                    <asp:HiddenField ID="hidPaymentDueDate" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="paymentAmount" class="col-sm-3 col-form-label form-label">Amount: </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPaymentAmount" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <label class="col-sm-3 col-form-label form-label">Currency: </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList class="form-control" ID="ddlCurrency" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="Mealfee" class="col-sm-3 col-form-label form-label">Payment Instruction: </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPaymentInstruction" class="form-control" runat="server" TextMode="MultiLine" Text=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="Mealfee" class="col-sm-3 col-form-label form-label">Select payment request for student course: </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlStudentCourse" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Upload Payment Request" CssClass="btn btn-primary btn-block" OnClientClick="return validateForm()" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">


        function validateForm() {

            var ddlPaymentDescription = $('#<%=ddlPaymentDescription.ClientID%>').val();
            var paymentDueDate = $('#<%=hidPaymentDueDate.ClientID%>').val();
            var paymentAmount = $('#<%=txtPaymentAmount.ClientID%>').val();
            var ddlCurrency = $('#<%=ddlCurrency.ClientID%>').val();
            var paymentInstruction = $('#<%=txtPaymentInstruction.ClientID%>').val();
            var studentCourse = $('#<%=ddlStudentCourse.ClientID%>').val();

            if (ddlPaymentDescription == 0 || isNaN(parseInt(ddlPaymentDescription))) {
                alert("Please select payment description for request.");
                return false;
            }
            else if (paymentDueDate == "" || paymentDueDate == null) {
                alert("Please select payment due date.");
                return false;
            }
            else if (paymentAmount == 0 || isNaN(parseInt(paymentAmount))) {
                alert("Please enter valid payment amount.");
                return false;
            }
            else if (ddlCurrency == 0 || isNaN(parseInt(ddlCurrency))) {
                alert("Please select currency for payment request.");
                return false;
            }
            else if (paymentInstruction == "" || paymentInstruction == null) {
                alert("Please enter instruction for payment request");
                return false;
            }
            else if (($('#<%=ddlPaymentDescription.ClientID%> option:selected').text().toUpperCase() == 'ACCEPTANCE FEE') && 0 == parseInt(studentCourse)) {
                alert('Please select course name for adding acceptance payment request or check for student offer accepted status.');
                return false;
            }
            return true;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantlist').addClass('active');

            $('#txtPaymentDueDate').datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy' })
                .change(function () {
                    $("#<%=hidPaymentDueDate.ClientID %>").val($('#txtPaymentDueDate').val());
                });

            var dueDate = $("#<%=hidPaymentDueDate.ClientID %>").val();
            if (dueDate != null) {
                $('#txtPaymentDueDate').val(dueDate);
            }
        });
    </script>
</asp:Content>
