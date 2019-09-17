<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managehealthinsurance.aspx.cs" Inherits="admin_Managehealthinsurance" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Health Insurance Plan</li>
        </ol>
        <h1 class="h2">Health Insurance Plan</h1>

        <div class="card">

            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                <div class="form-row">
                    <a href="createhealthinsurance.aspx" style="margin-left: 20px; margin-top: 10px;" class="btn btn-success">Create Health Insurance Plan</a>

                </div>
            </div>
            <div class="tab-content card-body">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="HealthInsuranceGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="id"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="HealthInsuranceGridView_RowEditing" OnPageIndexChanging="HealthInsuranceGridView_PageIndexChanging">

                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Health Insurance ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Health Insurance Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblHealthInsuranceName" runat="server" Text='<%# Bind("HealthInsurancename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Currency">
                                <ItemTemplate>
                                    <asp:Label ID="lblCurrency" runat="server" Text='<%# Bind("currency") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Health Insurance Fee">
                                <ItemTemplate>
                                    <asp:Label ID="lblHealthInsuranceFee" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Extra Adult Fee">
                                <ItemTemplate>
                                    <asp:Label ID="lblAdultVisaFee" runat="server" Text='<%# Bind("extra_adult_amount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Extra Child Fee">
                                <ItemTemplate>
                                    <asp:Label ID="lblChildVisaFee" runat="server" Text='<%# Bind("extra_child_amount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>


            </div>
        </div>

    </div>
    <script>
		$(document).ready(function () {
	            $('.sidebar-menu-item').removeClass('open');
	            $('#universitymenu_list').addClass('open');
	            $('.sidebar-menu-item').removeClass('active');
	            $('#managehealthinsurance').addClass('active');
	        });
	</script>
</asp:Content>
