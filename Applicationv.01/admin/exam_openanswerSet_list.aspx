<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_openanswerSet_list.aspx.cs" Inherits="admin_exam_openanswerSet_list" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h1 class="h2"></h1>
        <div id="validateDiv" runat="server" class="card">
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Select Examiner</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Enter Examiner Passkey</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" runat="server" id="txtpasskey" class="form-control" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-8 offset-sm-3">
                    <div class="media align-items-center">
                        <div class="media-left">
                            <asp:Button ID="btn_submit" runat="server" Text="Validate" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                            <div class="col-md-20">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div runat="server" id="gridDiv" style="display: none">
            <div class="media align-items-center">
                <div class="form-row">
                    <asp:Button ID="btn_addnew" runat="server" Text="Create New" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
                </div>
            </div>
            <div class="card">

                <div class="tab-content card-body" runat="server">
                    <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                        <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="questionid"
                            AllowPaging="True"
                            CellPadding="2"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px"
                            CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowCancelingEdit="QuestiontGridView_RowCancelingEdit" OnRowEditing="QuestiontGridView_RowEditing" OnRowUpdating="QuestiontGridView_RowUpdating" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowCommand="QuestiontGridView_RowCommand">

                            <Columns>

                                <asp:BoundField DataField="questionid" HeaderText="Id" InsertVisible="False"
                                    ReadOnly="True" SortExpression="exampapersid" />

                                <asp:TemplateField HeaderText="Question">
                                    <ItemTemplate>
                                        <asp:Label ID="lblquestion" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Answer">
                                    <ItemTemplate>
                                        <label class="col-form-label form-label"  style="<%# Eval("questiontype") == null? "display:block;": "display:none;"  %>"> <%# Eval("answer") %></label>                                        
                                       <a href="<%# Eval("answer") %>" target="_blank" style="<%# Eval("questiontype") == null? "display:none;": "display:block;"  %>">View File</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marks">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmarks" runat="server" Text='<%# Bind("marks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time (in minutes)">
                                    <ItemTemplate>
                                        <asp:Label ID="lblduration" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Checking File">
                                    <ItemTemplate>
                                       <a href="<%# Eval("checking_file") %>" target="_blank">View File</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("questionid")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("questionid")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("questionid","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#buildpaper_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exam_openansset').addClass('active');
        });
        function validateForm() {

            var flag = false;
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please select institution");
            else if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
                alert("Please select examiner");
            else if ($("#<%=txtpasskey.ClientID%>").val() == "")
                alert("Please enter passkey");
            else
                flag = true;
            return flag;
        }
    </script>
</asp:Content>
