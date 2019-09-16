<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managevisa.aspx.cs" Inherits="admin_managevisa" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Visa Plan</li>
        </ol>
        <h1 class="h2">Visa Plan</h1>

        <div class="card">

            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                <div class="form-row">
                    <a href="createvisa.aspx" style="margin-left: 20px; margin-top: 10px;" class="btn btn-success">Create Visa Plan</a>

                </div>
            </div>
            <div class="tab-content card-body">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="VisaGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="id"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="VisaGridView_RowEditing" OnPageIndexChanging="VisaGridView_PageIndexChanging">

                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Visa ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Visa Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblVisaName" runat="server" Text='<%# Bind("Visaname") %>'></asp:Label>
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

                            <asp:TemplateField HeaderText="Visa Fee">
                                <ItemTemplate>
                                    <asp:Label ID="lblVisaFee" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
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
</asp:Content>