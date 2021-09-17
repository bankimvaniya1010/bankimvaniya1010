<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_mcqSet.aspx.cs" Inherits="admin_exam_mcqSet" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Assessmnent MCQ Question Master</li>
        </ol>
        <h1 class="h2">Assessmnent MCQ Question Master</h1>

        <div class="card">
            <div id="validateDIv" runat="server">
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
            <div class="tab-content card-body" id="gridDiv" runat="server" style="display: none">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="400px"
                        DataKeyNames="preliminaryid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="false" EmptyDataText="No Records Found" OnRowCancelingEdit="QuestiontGridView_RowCancelingEdit" OnRowCommand="QuestiontGridView_RowCommand" OnRowEditing="QuestiontGridView_RowEditing" OnRowUpdating="QuestiontGridView_RowUpdating" OnDataBound="QuestiontGridView_DataBound" OnRowDeleting="QuestiontGridView_RowDeleting" OnPageIndexChanging="QuestiontGridView_PageIndexChanging" OnRowDataBound="QuestiontGridView_RowDataBound">
                        <EmptyDataTemplate>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Description</th>
                                <th scope="col">Answer 1</th>
                                <th scope="col">Answer1 Description</th>
                                <th scope="col">Answer 2</th>
                                <th scope="col">Answer2 Description</th>
                                <th scope="col">Answer 3</th>
                                <th scope="col">Answer3 Description</th>
                                <th scope="col">Answer 4</th>
                                <th scope="col">Answer4 Description</th>
                                <th scope="col">Correct Answer</th>
                                <th scope="col">Maximum Marks</th>
                                <th scope="col">Time in minute</th>
                                <th scope="col"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:TextBox ID="txtEmptyRecordDescription" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtanswer1" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyincorrect_answer1" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtanswer2" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyincorrect_answer2" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtanswer3" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyincorrect_answer3" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox ID="txtanswer4" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmptyincorrect_answer4" CssClass="form-control" runat="server" TextMode="MultiLine" Width="196px" Height="110px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlEmptyCorrectans" runat="server" CssClass="form-control" Width="145px">
                                        <asp:ListItem Value="">Please Select</asp:ListItem>
                                        <asp:ListItem Value="answer1">Answer 1</asp:ListItem>
                                        <asp:ListItem Value="answer2">Answer 2</asp:ListItem>
                                        <asp:ListItem Value="answer3">Answer 3</asp:ListItem>
                                        <asp:ListItem Value="answer4">Answer 4</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtemptymarks" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtemptytime" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="Add" CommandName="EmptyDataTemplate" class="btn btn-success" OnClientClick="return validateEmptyRow()" />
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                        <Columns>

                            <asp:BoundField DataField="preliminaryid" HeaderText="ID" InsertVisible="False"
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

                            <asp:TemplateField HeaderText="Incorrect Description ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip_answer1" TextMode="MultiLine" runat="server" Text='<%# Bind("answer1_description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer1' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer1' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescrip_answer1Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer1Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer1Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtDescrip_answer1" runat="server" Text='<%# Bind("answer1_description") %>'></asp:Label>
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

                            <asp:TemplateField HeaderText="Incorrect Description ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip_answer2" TextMode="MultiLine" runat="server" Text='<%# Bind("answer2_description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer2' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer2' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescrip_answer2Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer2Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer2Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtDescrip_answer2" runat="server" Text='<%# Bind("answer2_description") %>'></asp:Label>
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

                            <asp:TemplateField HeaderText="Incorrect Description ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip_answer3" TextMode="MultiLine" runat="server" Text='<%# Bind("answer3_description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer3' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer3' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescrip_answer3Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer3Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer3Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtDescrip_answer3" runat="server" Text='<%# Bind("answer3_description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Answer 4">
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

                            <asp:TemplateField HeaderText="Incorrect Description ">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescrip_answer4" TextMode="MultiLine" runat="server" Text='<%# Bind("answer4_description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer4' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer4' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescrip_answer4Footer" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_answer4Footer' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtDescrip_answer4Footer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtDescrip_answer4" runat="server" Text='<%# Bind("answer4_description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Correct Answer" SortExpression="correctanswer">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCorrectAnswer" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredCorrectAnswerEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Correct Answer Cannot Be Empty' ControlToValidate='ddlCorrectAnswer' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlCorrectAnswer" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredCorrectAnswerFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Correct Answer Cannot Be Empty' ControlToValidate='ddlCorrectAnswer' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCorrectAnswer" runat="server" Text='<%# Bind("correctanswer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Marks">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtmarks" TextMode="MultiLine" runat="server" Text='<%# Bind("marks") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_marks' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtmarks' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtmarksFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_txtmarksFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txtmarksFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxtmarks" runat="server" Text='<%# Bind("marks") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Time (in minutes)">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txttime" TextMode="MultiLine" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_txttime' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txttime' />--%>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txttimeFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator runat='server' ID='requiredtxtDescrip_atxttimeFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Incorrect Description Cannot Be Empty' ControlToValidate='txttimeFooter' />--%>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltxttime" runat="server" Text='<%# Bind("time") %>'></asp:Label>
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
            if (!$("#ContentPlaceHolder1_QuestiontGridView_txtEmptyRecordDescription").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtEmptyRecordDescription").val() == "") {
                alert("Description Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtanswer1").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtanswer1").val() == "") {
                alert("Answer 1 Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer1").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer1").val() == "") {
                alert("Answer 1 Description Cannot Be Empty");
                return false;
            }

            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtanswer2").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtanswer2").val() == "") {
                alert("Answer 2 Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer2").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer2").val() == "") {
                alert("Answer 2 Description Cannot Be Empty");
                return false;
            }

            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtanswer3").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtanswer3").val() == "") {
                alert("Answer 3 Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer3").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer3").val() == "") {
                alert("Answer 3 Description Cannot Be Empty");
                return false;
            }

            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtanswer4").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtanswer4").val() == "") {
                alert("Answer 4 Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer4").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtEmptyincorrect_answer4").val() == "") {
                alert("Answer 4 Description Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_ddlEmptyCorrectans").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_ddlEmptyCorrectans").val() == "") {
                alert("Please Select Correct Answer");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtemptymarks").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtemptymarks").val() == "") {
                alert("Please enter maximum marks");
                return false;
            }
            //else if (!$("#ContentPlaceHolder1_QuestiontGridView_txtemptytime").is(':hidden') && $("#ContentPlaceHolder1_QuestiontGridView_txtemptytime").val() == "") {
            //    alert("Please enter time in minutes");
            //    return false;
            //}
            return true;
        }
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
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#buildpaper_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exam_mcqset').addClass('active');
        });
    </script>
</asp:Content>


