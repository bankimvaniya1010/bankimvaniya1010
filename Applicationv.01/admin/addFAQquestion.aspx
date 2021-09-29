<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addFAQquestion.aspx.cs" Inherits="admin_addFAQquestion" MasterPageFile="~/admin/admin.master"%>
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
            <li class="breadcrumb-item active">FAQ Master</li>
        </ol>
        <h1 class="h2">FAQ Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="gvFAQ" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="gvFAQ_DataBound" OnRowCancelingEdit="gvFAQ_RowCancelingEdit" OnRowCommand="gvFAQ_RowCommand" OnRowDataBound="gvFAQ_RowDataBound" OnRowDeleted="gvFAQ_RowDeleted" OnRowDeleting="gvFAQ_RowDeleting" OnRowEditing="gvFAQ_RowEditing" OnRowUpdated="gvFAQ_RowUpdated" OnRowUpdating="gvFAQ_RowUpdating" OnPageIndexChanging="gvFAQ_PageIndexChanging">
                        <EmptyDataTemplate>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Question</th>
                                <th scope="col">Answer</th>
                                <th></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:TextBox ID="txtEmptyRecordQuestion" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyRecordAns" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClientClick="return validateEmptyRow()" OnClick="Add" CommandName="EmptyDataTemplate" class="btn btn-success"/>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />


                            <asp:TemplateField HeaderText="Question">

                                <EditItemTemplate>

                                    <asp:TextBox ID="txtQuestion" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQueEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Question Cannot Be Empty' ControlToValidate='txtQuestion' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtQuestion1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredquesFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Question  Cannot Be Empty' ControlToValidate='txtQuestion1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("question") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Answer">

                                <EditItemTemplate>

                                    <asp:TextBox ID="txtAnswer" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("answer") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnsEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Answer Cannot Be Empty' ControlToValidate='txtAnswer' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtAnswer1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnsFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Answer  Cannot Be Empty' ControlToValidate='txtAnswer1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("answer") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CommandName="AddNew" Text="Add New" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>'></asp:LinkButton>

                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />




                        </Columns>



                    </asp:GridView>
                </div>


            </div>
        </div>

    </div>
    <script>
        function validateEmptyRow() {
            if (!$("#ContentPlaceHolder1_gvFAQ_txtEmptyRecordQuestion").is(':hidden') && $("#ContentPlaceHolder1_gvFAQ_txtEmptyRecordQuestion").val() == "") {
                alert("Question Cannot Be Empty");
                return false;
            }
            if (!$("#ContentPlaceHolder1_gvFAQ_txtEmptyRecordAns").is(':hidden') && $("#ContentPlaceHolder1_gvFAQ_txtEmptyRecordAns").val() == "") {
                alert("Answer Cannot Be Empty");
                return false;
            }
            return true;
        }
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#FaqManage_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#addfaq').addClass('active');
        });
	</script>
</asp:Content>

