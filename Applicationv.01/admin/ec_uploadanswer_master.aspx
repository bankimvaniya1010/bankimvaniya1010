<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_uploadanswer_master.aspx.cs" Inherits="admin_ec_uploadanswer_master" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item active">Question Bank</li>
            <li class="breadcrumb-item active">UPLOAD ANSWER MASTER</li>
        </ol>
        <h1 class="h2">UPLOAD ANSWER MASTER</h1>


        <div runat="server" id="creatediv" style="display: block">
            <div class="media align-items-center">
                <div class="form-row">
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_addnew" runat="server" Text="Create New" CssClass="btn btn-success" OnClick="btn_addnew_Click" />
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

                            <asp:TemplateField HeaderText="Question Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblquestion" runat="server" Text='<%# Bind("questiondescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question File">
                                <ItemTemplate>
                                    <asp:HyperLink runat="server" NavigateUrl='<%# Bind("questionpath") %>' target="_blank" id="fileURL">View </asp:HyperLink>
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
        function showOAModelQuestion(questionname, marks, time, questionfor, correctans) {
             $('body').append('<div class="modal" id ="faq-ans-modal" tabindex ="-1" role ="dialog" ><div class="modal-dialog" role="document"><div class="modal-content"><div class="faq-modal-header modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="faq-question">Question Name : ' + questionname + '</div><div class="faq-answer"><div class="table-responsive"><table class="table table-bordered w-auto" style="margin: auto;font-size: 18px;"><tbody><tr><td>Question For</td><td>' + questionfor + '</td></tr><tr><td>Marks</td><td>' + marks + '</td></tr><tr><td>Time(in Minutes)</td><td>' + time + '</td></tr><tr><td>Correct Answer</td><td>' + correctans + '</td></tr></tbody ></table ></div ></div ></div ></div ></div ></div > ');
            $('#faq-ans-modal').modal('show');
            $('#faq-ans-modal').on('hidden.bs.modal', function () {
                $('#faq-ans-modal').remove();
            });
        }
    </script>
</asp:Content>
