<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_assignment_scheduleassign_master.aspx.cs" Inherits="admin_ec_assignment_scheduleassign_master" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item"><a href="ec_assignment_scheduleassign_master.aspx">MANAGE ASSIGNMENT</a></li>
            <li class="breadcrumb-item active">SCHEDULE & ASSIGN</li>
        </ol>
        <h1 class="h2">SCHEDULE & ASSIGN AN ASSIGNMENT</h1>
        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Schedule & Assign an Assignment" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
                                <asp:Button ID="btn_downloadexcel" runat="server" Text="Download List of All Assignment Schedules & Assignees" CssClass="btn btn-success" OnClick="btn_downloadexcel_Click" />
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
                    <asp:GridView ID="grd_assign_manage_studymaterial" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="asm_id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="grd_assign_manage_studymaterial_PageIndexChanging" OnRowDeleting="grd_assign_manage_studymaterial_RowDeleting" OnRowCommand="grd_assign_manage_studymaterial_RowCommand" OnRowEditing="grd_assign_manage_studymaterial_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("asm_id")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("asm_id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("asm_id")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Record  ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblclasscode" runat="server" Text='<%# Bind("asm_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Class Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblclassname" runat="server" Text='<%# Bind("class_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                          <%--  <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblstartdate" runat="server" Text='<%# Bind("startdate_str") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>      --%>
                            <asp:TemplateField HeaderText="Grade">
                                <ItemTemplate>
                                    <asp:Label ID="lblgrade" runat="server" Text='<%# Bind("asm_grade_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:Label ID="lblsubjectname" runat="server" Text='<%# Bind("asm_subject_name") %>'></asp:Label>
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
            $('#shedule_assign').addClass('active');
        });
    </script>
</asp:Content>


