﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="preliminaryquestion.aspx.cs" Inherits="admin_preliminaryquestion" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Preliminary Question Master</li>
        </ol>
        <h1 class="h2">Preliminary Question Master</h1>

        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="preliminaryid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="QuestiontGridView_RowCancelingEdit" OnRowCommand="QuestiontGridView_RowCommand" OnRowEditing="QuestiontGridView_RowEditing" OnRowUpdating="QuestiontGridView_RowUpdating" OnDataBound="QuestiontGridView_DataBound" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowDataBound="QuestiontGridView_RowDataBound">

                        <Columns>

                            <asp:BoundField DataField="preliminaryid" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="preliminaryid" />

                            <asp:TemplateField HeaderText="Question" SortExpression="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuestion" TextMode="MultiLine" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQuestionEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Question Cannot Be Empty' ControlToValidate='txtQuestion' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtQuestionFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQuestionFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Question  Cannot Be Empty' ControlToValidate='txtQuestionFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Institution" SortExpression="universityid">
                                <EditItemTemplate>
                                     <asp:Label ID="lblUniversityEdit" style="display:none" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlUniversity"  runat="server" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredUniversityEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please Select University ' ControlToValidate='ddlUniversity' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlUniversityFooter" runat="server" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredUniversityFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Please Select University ' ControlToValidate='ddlUniversityFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer 1" SortExpression="answer1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer1" TextMode="MultiLine" runat="server" Text='<%# Bind("answer1") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer1Edit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Answer 1 Cannot Be Empty' ControlToValidate='txtAnswer1' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAnswer1Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer1Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Answer 1  Cannot Be Empty' ControlToValidate='txtAnswer1Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer1" runat="server" Text='<%# Bind("answer1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer 2" SortExpression="answer2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer2" TextMode="MultiLine" runat="server" Text='<%# Bind("answer2") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer2Edit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Answer 2 Cannot Be Empty' ControlToValidate='txtAnswer2' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAnswer2Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer2Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Answer 2  Cannot Be Empty' ControlToValidate='txtAnswer2Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer2" runat="server" Text='<%# Bind("answer2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer 3" SortExpression="answer3">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer3" TextMode="MultiLine" runat="server" Text='<%# Bind("answer3") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer3Edit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Answer 3 Cannot Be Empty' ControlToValidate='txtAnswer3' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAnswer3Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer3Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Answer 3  Cannot Be Empty' ControlToValidate='txtAnswer3Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer3" runat="server" Text='<%# Bind("answer3") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answer 4" SortExpression="answer4">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAnswer4" TextMode="MultiLine" runat="server" Text='<%# Bind("answer4") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer4Edit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Answer 4 Cannot Be Empty' ControlToValidate='txtAnswer4' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAnswer4Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredAnswer4Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Answer 4  Cannot Be Empty' ControlToValidate='txtAnswer4Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer4" runat="server" Text='<%# Bind("answer4") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Correct Answer" SortExpression="correctanswer">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCorrectAnswer" TextMode="MultiLine" runat="server" Text='<%# Bind("correctanswer") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredCorrectAnswerEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Correct Answer Cannot Be Empty' ControlToValidate='txtCorrectAnswer' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtCorrectAnswerFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredCorrectAnswerFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Correct Answer Cannot Be Empty' ControlToValidate='txtCorrectAnswerFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCorrectAnswer" runat="server" Text='<%# Bind("correctanswer") %>'></asp:Label>
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
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#admin_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#preliminaryquestion').addClass('active');
        });
	</script>
</asp:Content>


