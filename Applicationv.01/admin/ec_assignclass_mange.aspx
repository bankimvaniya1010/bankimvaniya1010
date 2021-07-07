<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_assignclass_mange.aspx.cs" Inherits="admin_ec_assignclass_mange" MasterPageFile="~/admin/admin.master" %>


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
            <li class="breadcrumb-item active">SCHEDULE & ASSIGN</li>
        </ol>
        <h1 class="h2">SCHEDULE & ASSIGN A CLASS</h1>


        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Add New Record" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
                                <asp:Button ID="btn_downloadexcel" runat="server" Text="Download List of All Class Schedules & class Assignees" CssClass="btn btn-success" OnClick="btn_downloadexcel_Click" />
                                <br />
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlfilter" Style="width: 240px;">
                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    <asp:ListItem Value="1">Filter By Class Name</asp:ListItem>
                                    <asp:ListItem Value="2">Filter By Grade</asp:ListItem>
                                    <asp:ListItem Value="3">Filter By Subject</asp:ListItem>
                                    <asp:ListItem Value="4">Filter By Mode</asp:ListItem>
                                    <asp:ListItem Value="5">Filter By Type</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <div id="Divclassname" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlclassname" OnSelectedIndexChanged="ddlclassname_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="Divgrade" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlgrade" OnSelectedIndexChanged="ddlgrade_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="Divsubject" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlsubject" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="Divmode" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlmode" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="Divtype" runat="server">
                                    <asp:DropDownList runat="server" ID="ddltype" OnSelectedIndexChanged="ddltype_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                            </td>
                        </tr>--%>
                    </table>

                </div>
            </div>
        </div>
        <div class="card">

            <div class="tab-content card-body" id="gridDiv" runat="server" style="white-space: nowrap; text-align: center;">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="assignID"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowCommand="QuestiontGridView_RowCommand" OnRowEditing="QuestiontGridView_RowEditing">

                        <Columns>

                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("assignID")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("assignID","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("assignID")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="assignID" HeaderText="SACID" InsertVisible="False"
                                ReadOnly="True" />

                            <asp:TemplateField HeaderText="Institution Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("univeristyname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("classname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblgrade" runat="server" Text='<%# Bind("startdate_str") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Recurrence">
                                <ItemTemplate>
                                    <asp:Label ID="lblsubject" runat="server" Text='<%# Bind("recurrence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblmode" runat="server" Text='<%# Bind("classstarttime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class End Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("classendtime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number of Assignees">
                                <ItemTemplate>
                                    <asp:Label ID="lblduration" runat="server" Text='<%# Bind("Noofstudents") %>'></asp:Label>
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
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#schedule_service5').addClass('active');
              });
    </script>
</asp:Content>
