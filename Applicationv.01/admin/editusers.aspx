<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editusers.aspx.cs" Inherits="admin_editusers" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript">
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
            <li class="breadcrumb-item active">User Master</li>
        </ol>
        <h1 class="h2">User Master</h1>
          <div class="media align-items-center">  
            <div class="form-row">
                <a href="createuser.aspx" class="btn btn-success">Add New User</a>
                                      
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="UserGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" OnRowDeleting="UserGridView_RowDeleting" OnPageIndexChanging="UserGridView_PageIndexChanging" OnRowCommand="UserGridView_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                                                  
                            <asp:TemplateField HeaderText="username" SortExpression="type">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="rolename" SortExpression="status">  
                                <ItemTemplate>
                                     <asp:Label ID="lblrolename" runat="server" Text='<%# Bind("rolename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="email" SortExpression="universityid">                                                           
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="mobile" SortExpression="status">  
                                <ItemTemplate>
                                     <asp:Label ID="ddd" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                          
                           
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
                                <ItemTemplate>
                                    <a href="/admin/createuser.aspx?id=<%# Eval("id") %>">Edit</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
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
            $('#role_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createuser').addClass('active');
        });
        
    </script>
</asp:Content>