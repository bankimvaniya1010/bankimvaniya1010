<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_manageclass.aspx.cs" Inherits="admin_ec_manageclass" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Manage Class</li>
        </ol>
        <h1 class="h2">CREATE & SCHEDULE A CLASS</h1>


        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Create & Schedule a New Class" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
                                <asp:Button ID="btn_downloadexcel" runat="server" Text="Download List of All Class(es)" CssClass="btn btn-success" OnClick="btn_downloadexcel_Click" />
                                <br />
                            </td>
                        </tr>
                        <tr>
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
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <div class="card">

            <div class="tab-content card-body" id="gridDiv" runat="server" style="white-space: nowrap; text-align: center;">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="classid"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="10"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowCommand="QuestiontGridView_RowCommand" OnRowEditing="QuestiontGridView_RowEditing" OnRowDataBound="QuestiontGridView_RowDataBound">

                        <Columns>

                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsClassInUse" runat="server" Text='<%#Bind("IsClassInUse") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("classid")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("classid","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("classid")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="classid" HeaderText="Class Code" InsertVisible="False"
                                ReadOnly="True" />
                            
                            <asp:TemplateField HeaderText="Assign Student(s)">
                                <ItemTemplate>
                                    <a runat="server" href='<%# Bind("link_assignstudent") %>' target="_blank" id="exampath">Assign</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Assign Instructor(s)">
                                <ItemTemplate>
                                    <a runat="server" href='<%# Bind("link_assignInstructor") %>' target="_blank" id="link2">Assign</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duplicate">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDuplicate" runat="server" CommandArgument='<%#Eval("classid")%>' CommandName="Duplicate" Text="Duplicate"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField HeaderText="Grade">
                                <ItemTemplate>
                                    <asp:Label ID="lblgrade" runat="server" Text='<%# Bind("grade") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <asp:Label ID="lblsubject" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mode">
                                <ItemTemplate>
                                    <asp:Label ID="lblmode" runat="server" Text='<%# Bind("mode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration">
                                <ItemTemplate>
                                    <asp:Label ID="lblduration" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fee">
                                <ItemTemplate>
                                    <asp:Label ID="lblfee" runat="server" Text='<%# Bind("fee") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location">
                                <ItemTemplate>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblstartdate" runat="server" Text='<%# Bind("startdate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Recurrence">
                                <ItemTemplate>
                                    <asp:Label ID="lblRecurrence" runat="server" Text='<%# Bind("Recurrence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Avialability">
                                <ItemTemplate>
                                    <asp:Label ID="lblAvialability" runat="server" Text='<%# Bind("Avialability") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bookable Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblbookablestatus" runat="server" Text='<%# Bind("bookablestatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>


            </div>
        </div>
    </div>
    <script>
        $("#<%=ddlfilter.ClientID%>").change(function () {
            var filterid = $("#<%=ddlfilter.ClientID%>").val();
            if (filterid == 1) {
                $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divclassname.ClientID%>").show();
           }
           else if (filterid == 2) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").show();
           }
           else if (filterid == 3) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").show();
           }
           else if (filterid == 4) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").show();
           }
           else if (filterid == 5) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").show();
           }
           else {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
           }
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createclass_service5').addClass('active');

            var filterid = $("#<%=ddlfilter.ClientID%>").val();
            if (filterid == 1) {
                $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divclassname.ClientID%>").show();
           }
           else if (filterid == 2) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").show();
           }
           else if (filterid == 3) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").show();
           }
           else if (filterid == 4) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").show();
           }
           else if (filterid == 5) {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").show();
           }
           else {
               $("#<%=Divclassname.ClientID%>").hide();
               $("#<%=Divgrade.ClientID%>").hide();
               $("#<%=Divmode.ClientID%>").hide();
               $("#<%=Divsubject.ClientID%>").hide();
               $("#<%=Divtype.ClientID%>").hide();
           }
        });
    </script>
</asp:Content>
