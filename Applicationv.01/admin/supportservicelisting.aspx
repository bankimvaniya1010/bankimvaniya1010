<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supportservicelisting.aspx.cs" Inherits="admin_supportservicelisting" MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Support Service Master</li>
        </ol>
        <h1 class="h2">Support Service Master</h1>
          <div class="media align-items-center">  
            <div class="form-row">
                <a href="supportservicemaster.aspx" class="btn btn-success">Add New Service</a>
                                      
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="grSupportService" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found"  OnDataBound="grSupportService_DataBound" OnRowDeleting="grSupportService_RowDeleting" OnPageIndexChanging="grSupportService_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                           
                            <asp:TemplateField HeaderText="ServiceType">
                                <ItemTemplate>
                                    <asp:Label ID="lblservicetype" runat="server" Text='<%# Bind("servicetype") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ProviderName">
                                <ItemTemplate>
                                    <asp:Label ID="lblprovidername" runat="server" Text='<%# Bind("providername") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="providerEmail">
                                <ItemTemplate>
                                    <asp:Label ID="lblprovideremail" runat="server" Text='<%# Bind("provideremail") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lbldescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                          


                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
                                <ItemTemplate>
                                    <a href="/admin/supportservicemaster.aspx?id=<%# Eval("id") %>">Edit</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                        </Columns>
                    </asp:GridView>
                </div>
                </div>
            </div>

        </div>
    <script>
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#CustomizeForms_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#supportservicemaster').addClass('active');
        });
	</script>
</asp:Content>


