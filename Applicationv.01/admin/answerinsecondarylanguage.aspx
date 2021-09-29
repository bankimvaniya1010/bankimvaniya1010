<%@ Page Language="C#" AutoEventWireup="true" CodeFile="answerinsecondarylanguage.aspx.cs" Inherits="admin_answerinsecondarylanguage" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Answer Master</li>
        </ol>
        <h1 class="h2">Answer Master</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="SecondaryAnswerView" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="680"
                        DataKeyNames="secondaryanswerid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="SecondaryAnswerView_DataBound" OnRowCancelingEdit="SecondaryAnswerView_RowCancelingEdit" OnRowCommand="SecondaryAnswerView_RowCommand" OnRowDataBound="SecondaryAnswerView_RowDataBound" OnRowDeleting="SecondaryAnswerView_RowDeleting" OnRowEditing="SecondaryAnswerView_RowEditing" OnRowUpdating="SecondaryAnswerView_RowUpdating">

                        <Columns>
                            <asp:BoundField DataField="secondaryanswerid" HeaderText="Answerid" InsertVisible="False"
                                ReadOnly="True" SortExpression="answerid" />
                            <asp:TemplateField HeaderText="Answer Value" SortExpression="answerdescription">
                                <EditItemTemplate>
                                    <asp:Label ID="lblAnswerEdit" Visible="false" runat="server" Text='<%# Bind("answerdescription") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlAnswerEdit" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvAnswerEdit" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="ddlAnswerEdit" InitialValue="0" ErrorMessage="Please select answer" />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlAnswerFooter" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvAnswerFooter" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="ddlAnswerFooter" InitialValue="0" ErrorMessage="Please select answer" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer" runat="server" Text='<%# Bind("answerdescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Secondary Language" SortExpression="secondaryfeldnamelanguage">
                                <EditItemTemplate>
                                    <asp:Label ID="lblfeldnamelanguage" Visible="false" runat="server" Text='<%# Bind("secondaryfieldnamelanguage") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlSecondaryLang" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvEditSecondaryfieldName" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="ddlSecondaryLang" InitialValue="0" ErrorMessage="Please select secondary language" />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlSecondaryLangFooter" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSecondaryfieldNamFooter" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="ddlSecondaryLangFooter" InitialValue="0" ErrorMessage="Please select secondary language" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSecondaryLang" runat="server" Text='<%# Bind("secondaryfieldnamelanguage") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Secondary Description" SortExpression="secondaryfieldnamevalue">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Text='<%# Bind("secondaryfieldnamevalue") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDescriptionFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescriptionFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("secondaryfieldnamevalue") %>'></asp:Label>
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
</asp:Content>
