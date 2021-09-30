<%@ Page Language="C#" AutoEventWireup="true" CodeFile="processpaymentrequest.aspx.cs" Inherits="admin_processpaymentrequest" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Payment Requests</li>
        </ol>
        <h1 class="h2">Payment Request Details</h1>
        <div class="media align-items-center">
            <div class="form-row">
                <asp:Button ID="btnApplicantPaymentRequest" runat="server" CssClass="btn btn-success" Text="Add New Payment Request" OnClick="btnApplicantPaymentRequest_Click" />
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="paymentRequestGridView" CssClass="table" runat="server" Width="100%" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="id"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowDataBound="paymentRequestGridView_RowDataBound" OnRowCommand="paymentRequestGridView_RowCommand">

                       <Columns>
                            <asp:TemplateField HeaderText="RID">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblcoursename" runat="server" Text='<%# Bind("applicationmaster_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblRequestDate" runat="server" Text='<%# Bind("request_date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Details">
                                <ItemTemplate>
                                    <asp:Label ID="lblPaymentDetails" runat="server" Text='<%# Bind("payment_for") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("due_date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount To be Paid">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                    <asp:Label ID="lblCurrency" runat="server" Text='<%# Bind("currency_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Instruction">
                                <ItemTemplate>
                                    <asp:Label ID="lblPaymentInstruction" runat="server" Text='<%# Bind("instruction") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Upload Proof">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hypLnkViewPaymentProof" Target="_blank" runat="server">View Payment Proof</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Verified">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlPaymentStatus" runat="server"></asp:DropDownList>
                                    <asp:Label ID="lblPaymentStatus" runat="server" Text='<%# Bind("payment_status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" CommandArgument='<%#Container.DataItemIndex%>' Text="Edit"></asp:LinkButton>
                                   <asp:LinkButton ID="lnkSave" runat="server" CausesValidation="False" CommandName="Save" CommandArgument='<%#Container.DataItemIndex%>' Text="| Submit"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                   </asp:GridView>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
