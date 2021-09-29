<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gtepreliminary_section_questionmaster.aspx.cs" Inherits="admin_gtepreliminary_section_questionmaster" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item active">GTE Preliminary Question Master</li>
        </ol>
        <h1 class="h2">GTE Preliminary Question Master</h1>

        <div class="card">


            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="section2queGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="questionid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="false" EmptyDataText="No Records Found" OnRowCancelingEdit="section2queGridView_RowCancelingEdit" OnRowCommand="section2queGridView_RowCommand" OnRowEditing="section2queGridView_RowEditing" OnRowUpdating="section2queGridView_RowUpdating" OnDataBound="section2queGridView_DataBound" OnRowDeleting="section2queGridView_RowDeleting" OnPageIndexChanging="section2queGridView_PageIndexChanging" OnRowDataBound="section2queGridView_RowDataBound">

                         <EmptyDataTemplate>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Description</th>
                                <th scope="col">Answer 1</th>
                                <th scope="col">Answer1 Description</th>
                                <th scope="col">Answer 2</th>
                                <th scope="col">Answer2 Description</th>
                                <th scope="col">Correct Answer</th>
                                <th scope="col">Question Tag </th>
                                <th scope="col"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:TextBox ID="txtEmptyRecordDescription" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lblEmptyTrue">True</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyDescription_answer1" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lblEmptyFalse">False</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyDescription_answer2" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlEmptyCorrectans" runat="server" CssClass="form-control" Width="145px">
                                        <asp:ListItem Value="">Please Select</asp:ListItem>
                                        <asp:ListItem Value="answer1">Answer 1</asp:ListItem>
                                        <asp:ListItem Value="answer2">Answer 2</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyQuestionTag" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="Add" CommandName="EmptyDataTemplate" class="btn btn-success" OnClientClick="return validateEmptyRow()"/>
                                </td>
                            </tr>
                        </EmptyDataTemplate>

                        <Columns>

                            <asp:BoundField DataField="questionid" HeaderText="id" InsertVisible="False"
                                ReadOnly="True" SortExpression="questionid" />

                            <asp:TemplateField HeaderText="Question">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQuestion" TextMode="MultiLine" runat="server" Text='<%# Bind("question") %>' Width="196px" height="110px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQuestionEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Question Cannot Be Empty' ControlToValidate='txtQuestion' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtQuestionFooter" runat="server" TextMode="MultiLine" Width="196px" height="110px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQuestionFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Question  Cannot Be Empty' ControlToValidate='txtQuestionFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="Answer 1">
                                <EditItemTemplate>
                                    <asp:Label ID="txtAnswer1" runat="server" Text="True"></asp:Label>                                    
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="txtAnswer1Footer" runat="server" Text="True"></asp:Label>                                    
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer1" runat="server" Text='<%# Bind("answer1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Incorrect Description ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip_answer1" TextMode="MultiLine" runat="server" Text='<%# Bind("answer1_description") %>' height="110px" width="196px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer1' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect  Description Cannot Be Empty' ControlToValidate='txtDescrip_answer1' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescrip_answer1Footer" runat="server" TextMode="MultiLine" height="110px" width="196px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer1Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer1Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtDescrip_answer1" runat="server" Text='<%# Bind("answer1_description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Answer 2" ControlStyle-Width="">
                                <EditItemTemplate>
                                    <asp:Label ID="txtAnswer2" runat="server" Text="False"></asp:Label>                                    
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="txtAnswer2Footer" runat="server" Text="False"></asp:Label>                                    
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer2" runat="server" Text='<%# Bind("answer2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Incorrect Description ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip_answer2" TextMode="MultiLine" runat="server" Text='<%# Bind("answer2_description") %>' height="110px" width="196px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer2' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer2' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescrip_answer2Footer" runat="server" TextMode="MultiLine" height="110px" width="196px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer2Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer2Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtDescrip_answer2" runat="server" Text='<%# Bind("answer2_description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             
                            <asp:TemplateField HeaderText="Correct Answer" SortExpression="correctanswer">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCorrectAnswer" runat="server" CssClass="form-control" Width="145px"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredCorrectAnswerEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Correct Answer Cannot Be Empty' ControlToValidate='ddlCorrectAnswer' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlCorrectAnswer" runat="server" CssClass="form-control" Width="145px"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredCorrectAnswerFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Correct Answer Cannot Be Empty' ControlToValidate='ddlCorrectAnswer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCorrectAnswer" runat="server" Text='<%# Bind("correctanswer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Question Tag">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtquestion_tag" TextMode="MultiLine" runat="server" Text='<%# Bind("question_tag") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQuestiontagEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Question Tag Cannot Be Empty' ControlToValidate='txtquestion_tag' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtquestion_tagFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQuestiontagFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Question Tag Cannot Be Empty' ControlToValidate='txtquestion_tagFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtquestion_tag" runat="server" Text='<%# Bind("question_tag") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lnkaddnew" runat="server" CausesValidation="True" CommandName="AddNew" Text="Add New" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>'></asp:LinkButton>
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
            if (!$("#ContentPlaceHolder1_section2queGridView_txtEmptyRecordDescription").is(':hidden') && $("#ContentPlaceHolder1_section2queGridView_txtEmptyRecordDescription").val() == "") {
                alert("Description Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_section2queGridView_txtEmptyDescription_answer1").is(':hidden') && $("#ContentPlaceHolder1_section2queGridView_txtEmptyDescription_answer1").val() == "") {
                alert("Answer 1 Description Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_section2queGridView_txtEmptyDescription_answer2").is(':hidden') && $("#ContentPlaceHolder1_section2queGridView_txtEmptyDescription_answer2").val() == "") {
                alert("Answer 2 Description Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_section2queGridView_ddlEmptyCorrectans").is(':hidden') && $("#ContentPlaceHolder1_section2queGridView_ddlEmptyCorrectans").val() == "") {
                alert("Please Select Correct Answer");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_section2queGridView_txtEmptyQuestionTag").is(':hidden') && $("#ContentPlaceHolder1_section2queGridView_txtEmptyQuestionTag").val() == "") {
                alert("Please Enter Question Tag");
                return false;
            }
            return true;
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#gte_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#gtepreliminary_section').addClass('active');
        });
    </script>
</asp:Content>