<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ec_manage_declaretion_master.aspx.cs" Inherits="admin_ec_manage_declaretion_master" %>

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
                <a href="ec_create_declaretion_master.aspx" class="btn btn-success">Create A New Declaration</a>
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
                            <asp:TemplateField HeaderText="Institution Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Declaration Header">
                                <ItemTemplate>
                                    <asp:Label ID="labltype" runat="server" Text='<%# Bind("header") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="View Declaration">
                                <ItemTemplate>
                                    <%--<label ID="lblDescription" runat="server"  Text='<%# Bind("description") %>'></label>--%>
                                    <a onclick="openLink('<%#Eval("description")%>')" style="color: rgba(33,150,243,.85); cursor:pointer;">View</a>
                                    <%--<asp:Button runat="server" Text="view" OnClientClick='openLink()' ID="btn_view" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <a href="/admin/ec_create_declaretion_master.aspx?id=<%# Eval("id") %>">Edit</a>
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
        function openLink(desc) {
            var html = [];
            html.push('<div class="modal fade" id="video-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">');
            html.push('<div class="modal-dialog" role="document">');
            html.push('<div class="modal-content">');
            html.push('<div class="modal-header">');
            html.push('<h5 class="modal-title" id="exampleModalLongTitle">Description</h5>');
            html.push('<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
            html.push('</div>');
            html.push('<div class="modal-body">' + desc + '</div>');
            html.push('<div class="modal-footer">');
            html.push('<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>');
            html.push('</div>');
            html.push('</div>');
            html.push('</div>');
            html.push('</div>');
            $('body').append(html.join(''));
            $('#video-modal').modal('show');
            $('#video-modal').on('hidden.bs.modal', function () {
                $('#video-modal').remove();
            });
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#resource_create').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#resource_declare').addClass('active');
        });

    </script>
</asp:Content>
