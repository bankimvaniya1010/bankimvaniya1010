<%@ Page Language="C#" AutoEventWireup="true" CodeFile="questioncreate.aspx.cs" Inherits="questioncreate" MasterPageFile="~/admin/admin.master" %>


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
            <li class="breadcrumb-item active">Question Master</li>
        </ol>
        <h1 class="h2">Question Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="QuestiontGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="400px"
                        DataKeyNames="questionid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="QuestiontGridView_DataBound" OnRowDataBound="QuestiontGridView_RowDataBound" OnRowCommand="QuestiontGridView_RowCommand" OnRowDeleted="QuestiontGridView_RowDeleted" OnRowDeleting="QuestiontGridView_RowDeleting" OnRowEditing="QuestiontGridView_RowEditing" OnRowUpdating="QuestiontGridView_RowUpdating" OnRowCancelingEdit="QuestiontGridView_RowCancelingEdit">

                        <Columns>

                            <asp:BoundField DataField="questionid" HeaderText="questionid" InsertVisible="False"
                                ReadOnly="True" SortExpression="questionid" />


                            <asp:TemplateField HeaderText="Description" SortExpression="Description">

                                <EditItemTemplate>

                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtDescription1" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescription1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Isprimary" SortExpression="isprimary">

                                <EditItemTemplate>
                                    <asp:Label ID="lblPrimaryEdit" Visible="false" runat="server" Text='<%# Bind("isprimary") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlPrimary" runat="server">
                                        <asp:ListItem Value="0">Please select</asp:ListItem>
                                        <asp:ListItem Value="1">Primary</asp:ListItem>
                                        <asp:ListItem Value="2">Addon</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvEditCategory" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="ddlPrimary" InitialValue="0" ErrorMessage="Please select category" />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:DropDownList ID="ddlPrimary1" runat="server">
                                        <asp:ListItem Value="0">Please select</asp:ListItem>
                                        <asp:ListItem Value="1">Primary</asp:ListItem>
                                        <asp:ListItem Value="2">Addon</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvFooterCategory" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="ddlPrimary1" InitialValue="0" ErrorMessage="Please select category" />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblPrimary" runat="server" Text='<%# Bind("isprimary") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="InferernceID" SortExpression="infrencecategoryId" ItemStyle-Width="30px">
                                <ItemStyle Width="20px" />
                                <HeaderStyle Width="20px" />
                                <FooterStyle Width="20px" />
                                <EditItemTemplate>
                                    <asp:Label ID="lblInferenceEdit" Visible="false" runat="server" Text='<%# Bind("inferenceDescription") %>' ToolTip='<%# Bind("inferenceDescription")%>'></asp:Label>
                                    <asp:DropDownList ID="ddlInferenceID" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvEditInference" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="ddlInferenceID" InitialValue="0" ErrorMessage="Please select inference" />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:DropDownList ID="ddlInferenceID1" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvFooterInference"  runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="ddlInferenceID1" InitialValue="0" ErrorMessage="Please select inference" />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblInference" runat="server" Width="200px" Text='<%# Bind("inferenceDescription") %>' ToolTip='<%# Bind("inferenceDescription")%>'></asp:Label>

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
