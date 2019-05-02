<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formfieldmaster.aspx.cs" Inherits="admin_formfieldmaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Form Field Master</li>
        </ol>
        <h1 class="h2">Form Field Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="FormFieldGridView" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="formfieldid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnRowCancelingEdit="FormFieldGridView_RowCancelingEdit" OnRowCommand="FormFieldGridView_RowCommand" OnRowDataBound="FormFieldGridView_RowDataBound" OnRowDeleting="FormFieldGridView_RowDeleting" OnRowEditing="FormFieldGridView_RowEditing" OnRowUpdating="FormFieldGridView_RowUpdating">

                        <Columns>
                            <asp:BoundField DataField="formfieldid" HeaderText="Form Field id" InsertVisible="False"
                                ReadOnly="True" SortExpression="formfieldid" />
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredNameEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Name Cannot Be Empty' ControlToValidate='txtName' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNameFooter" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredNameFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Name Cannot Be Empty' ControlToValidate='txtNameFooter' />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="type">

                                <EditItemTemplate>
                                    <asp:Label ID="lblControl" Visible="false" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                    <asp:DropDownList ID="ddlControl" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredControlsEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please Select Controls' ControlToValidate='ddlControl' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:DropDownList ID="ddlControlFooter" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredControlFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Please Select Controls' ControlToValidate='ddlControlFooter' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tool Tips" SortExpression="tooltips">

                                <EditItemTemplate>

                                    <asp:TextBox ID="txtTooltips" CssClass="form-control" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredTooltipsEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Tool Tips Cannot Be Empty' ControlToValidate='txtTooltips' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtTooltipsFooter" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredTooltipsFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Tool Tips Cannot Be Empty' ControlToValidate='txtTooltipsFooter' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblTooltips" runat="server" Text='<%# Bind("tooltips") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is Validation Required" SortExpression="isvalidation">

                                <EditItemTemplate>
                                     <asp:Label ID="lblValidation" runat="server" Visible="false" Text='<%# Bind("isvalidation") %>'></asp:Label>
                                    <asp:CheckBox ID="chkValidationEdit" runat="server" />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:CheckBox ID="chkValidationFooter" runat="server" />

                                </FooterTemplate>

                                <ItemTemplate>
                                    <asp:CheckBox ID="chkValidation" runat="server" Checked='<%# bool.Parse(Eval("isvalidation").ToString()=="1"?"True":"False") %>' />

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

