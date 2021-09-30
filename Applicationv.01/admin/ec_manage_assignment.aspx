<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_manage_assignment.aspx.cs" Inherits="admin_ec_manage_assignment" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">MANAGE ASSIGNMENTS</li>
            <li class="breadcrumb-item active">Create</li>
        </ol>
        <h1 class="h2">CREATE AN ASSIGNMENT</h1>


        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Create an Assignment" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
                                <asp:Button ID="btn_dmload" runat="server" Text="Download List of All Assignments" CssClass="btn btn-success" OnClick="btn_dmload_Click" Visible="false"/>
                                <br />
                            </td>
                        </tr>
                        
                    </table>

                </div>
            </div>
        </div>
        <div class="card">

            <div class="tab-content card-body" id="gridDiv" runat="server" style="white-space: nowrap; text-align: center;">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="10"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowCommand="QuestiontGridView_RowCommand" OnRowEditing="QuestiontGridView_RowEditing" OnRowDataBound="QuestiontGridView_RowDataBound">

                        <Columns>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsClassInUse" runat="server" Text='<%#Bind("Is_inUSe") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Upload">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkUpload" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Upload" Text="Upload"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id" HeaderText="ASGID" InsertVisible="False"
                                ReadOnly="True" />

                             <asp:TemplateField HeaderText="Assignment Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("assignment_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Assignment Type">
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("assignment_type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <%-- <asp:TemplateField HeaderText="View Assignment">
                                <ItemTemplate>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Checking Guide">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# Bind("checkingguide_url") %>' target="_blank" id="fileURL">View </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User Download File">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# Bind("userdownload_url") %>' target="_blank" id="fileURL1">View </asp:HyperLink>
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
            $('#assignmentList').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#assignmentmaster').addClass('active');
            
        });
    </script>
</asp:Content>
