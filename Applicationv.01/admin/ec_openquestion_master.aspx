<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_openquestion_master.aspx.cs" Inherits="admin_ec_openquestion_master" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item active">Question Bank</li>
            <li class="breadcrumb-item active">OPEN QUESTION MASTER</li>
        </ol>
        <h1 class="h2">OPEN QUESTION MASTER</h1>


        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Create an Open Question" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
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
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            

                            <asp:BoundField DataField="id" HeaderText="QID" InsertVisible="False"
                                ReadOnly="True" />

                            <asp:TemplateField HeaderText="Question Type" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblquestion" runat="server" Text='<%# Bind("questiontype") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Uploaded File" Visible="false">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# Bind("uploadedfile_url") %>' target="_blank" id="fileURL">View </asp:HyperLink>
                                    <asp:Label ID="lbltext" runat="server" Text="-"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblanswer_description1" runat="server" Text='<%# Bind("question") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="CHecking Guide" Visible="false">
                                <ItemTemplate>
                                    <a runat="server" href='<%# Bind("checkingguid_url") %>' target="_blank" id="exampath">View </a>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Correct Answer" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblanswer_description2" runat="server" Text='<%# Bind("correctanswer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time(in Minutes)">
                                <ItemTemplate>
                                    <asp:Label ID="lbltime" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Marks">
                                <ItemTemplate>
                                    <asp:Label ID="lblmarks" runat="server" Text='<%# Bind("marks") %>'></asp:Label>
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
            $('#questionbank').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#openquestionemaster').addClass('active');
        });
       
    </script>
</asp:Content>
