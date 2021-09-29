<%@ Page Language="C#" AutoEventWireup="true" CodeFile="proctormasterListing.aspx.cs" Inherits="admin_proctormasterListing" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Proctor Master</li>
        </ol>
        <h1 class="h2">Proctor Master</h1>

        <div class="card">

            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                <div class="form-row">
                    <a href="proctormaster.aspx" style="margin-left: 20px; margin-top: 10px;" class="btn btn-success">Create New Proctor</a>

                </div>
            </div>
            <div class="tab-content card-body">
           
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="ProctorGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="id"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="ProctorGridView_PageIndexChanging">

                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Proctor ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Proctor Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccomdationName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Proctor Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblCurrency" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Proctor Mobile">
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Proctor Country">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccomdationFee" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Proctor City">
                                <ItemTemplate>
                                    <asp:Label ID="lblAdult" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <%--<asp:TemplateField HeaderText="Proctor Timezone">
                                <ItemTemplate>
                                    <asp:Label ID="lblChild" runat="server" Text='<%# Bind("timezone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>   --%>    
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 

                                <ItemTemplate>
                                    <a href="/admin/proctormaster.aspx?id=<%# Eval("id") %>">Edit</a>
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
            $('#managemeeting_schedule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#proctoremaster').addClass('active');
        });
	</script>
</asp:Content>


