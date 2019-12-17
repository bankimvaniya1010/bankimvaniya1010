<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managedeclaration_master.aspx.cs" Inherits="admin_managedeclaration_master" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item active">Manage Declaration Master </li>
        </ol>
        <h1 class="h2">Manage Declaration Master </h1>
        <div class="media align-items-center">  
            <div class="form-row">
                <a href="declaration_master.aspx" class="btn btn-success">Add New</a>                                      
            </div>
        </div>
        <div class="card">
            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="gvdeclartionGrid" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="gvdeclartionGrid_RowCancelingEdit" OnRowEditing="gvdeclartionGrid_RowEditing" OnRowUpdating="gvdeclartionGrid_RowUpdating" OnRowDeleting="gvdeclartionGrid_RowDeleting" OnPageIndexChanging="gvdeclartionGrid_PageIndexChanging" OnRowCommand="gvdeclartionGrid_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                           
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Institution">
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                     <asp:Label ID="labltype" runat="server" Text='<%# Bind("type")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>                          


                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>                              

                                <ItemTemplate>
                                    <a href="/admin/declaration_master.aspx?id=<%# Eval("id") %>">Edit</a>
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
            $('#tutorial_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#declaration_master').addClass('active');
        });
        
    </script>
</asp:Content>