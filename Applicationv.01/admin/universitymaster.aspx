<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitymaster.aspx.cs" Inherits="admin_universitymaster" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">University Master</li>
        </ol>
        <h1 class="h2">University Master</h1>

        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="universityGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="univerityID"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="universityGridView_RowEditing">

                       <Columns>
                           <asp:BoundField DataField="univerityID" HeaderText="University ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="universityid" />
                           <asp:TemplateField HeaderText="University Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniName" runat="server" Text='<%# Bind("universityName") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="City Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniCityName" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Country Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniCountryName" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="University Address">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
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
	        $('#universitymaster').addClass('active');
	    });
	</script>
</asp:Content>
