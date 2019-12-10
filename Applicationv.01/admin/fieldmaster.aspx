<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fieldmaster.aspx.cs" Inherits="admin_fieldmaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Field Master</li>
        </ol>
        <h1 class="h2">Field Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                        <asp:GridView ID="FormFieldGridView" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                            DataKeyNames="id"
                            AllowPaging="True"
                            CellPadding="3"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px"
                            CellSpacing="2" OnDataBound="FormFieldGridView_DataBound" OnRowCancelingEdit="FormFieldGridView_RowCancelingEdit" OnRowCommand="FormFieldGridView_RowCommand" OnRowDataBound="FormFieldGridView_RowDataBound" OnRowDeleted="FormFieldGridView_RowDeleted" OnRowDeleting="FormFieldGridView_RowDeleting" OnRowEditing="FormFieldGridView_RowEditing" OnRowUpdated="FormFieldGridView_RowUpdated" OnRowUpdating="FormFieldGridView_RowUpdating" OnPageIndexChanging="FormFieldGridView_PageIndexChanging">

                            <Columns>

                                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="ID" />


                                <asp:TemplateField HeaderText="Form Name" SortExpression="formname">

                                    <EditItemTemplate>
                                         <asp:Label ID="lblFormEdit" runat="server" Text='<%# Bind("formname") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlFormname" Width="200px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormname_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat='server' ID='requiredddlFormname' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select form name' InitialValue="0" ControlToValidate='ddlFormname' />
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:DropDownList ID="ddlFormnameFooter" Width="200px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormnameFooter_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>

                                        <asp:RequiredFieldValidator runat='server' ID='requiredFormcFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Please select form name' ControlToValidate='ddlFormnameFooter' />
                                    </FooterTemplate>

                                    <ItemTemplate>

                                        <asp:Label ID="lblForm" runat="server" Text='<%# Bind("formname") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Field Name" SortExpression="primaryfieldname">

                                    <EditItemTemplate>
                                        <asp:Label ID="lblFieldname" Visible="false" runat="server" Text='<%# Bind("primaryfieldname") %>'></asp:Label>
                                        <asp:DropDownList ID="ddlfieldName" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEditfieldName" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="ddlfieldName" InitialValue="0" ErrorMessage="Please select field name" />
                                    </EditItemTemplate>

                                    <FooterTemplate>

                                        <asp:DropDownList ID="ddlfieldNameFooter" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvFooterfieldName" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="ddlfieldNameFooter" InitialValue="0" ErrorMessage="Please select field name" />
                                    </FooterTemplate>


                                    <ItemTemplate>

                                        <asp:Label ID="lblPrimary" runat="server" Text='<%# Bind("primaryfieldname") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Secondary Language" SortExpression="secondaryfeldnamelanguage">

                                    <EditItemTemplate>
                                        <asp:Label ID="lblfeldnamelanguage" Visible="false" runat="server" Text='<%# Bind("secondaryfieldnamelanguage") %>'></asp:Label>
                                        <asp:DropDownList ID="ddlSecondaryLang" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEditSecondaryfieldName" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="ddlSecondaryLang" InitialValue="0" ErrorMessage="Please select secondary language" />
                                    </EditItemTemplate>

                                    <FooterTemplate>

                                        <asp:DropDownList ID="ddlSecondaryLangFooter" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSecondaryfieldNamFooter" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="ddlSecondaryLangFooter" InitialValue="0" ErrorMessage="Please select secondary language" />
                                    </FooterTemplate>


                                    <ItemTemplate>

                                        <asp:Label ID="lblSecondaryLang" runat="server" Text='<%# Bind("secondaryfieldnamelanguage") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Secondary Fieldname Value" SortExpression="secondaryfeldnamelanguage">

                                    <EditItemTemplate>
                                        <asp:Label ID="lblsecondaryfeldnamelanguage" Visible="false" runat="server" Text='<%# Bind("secondaryfielddnamevalue") %>'></asp:Label>
                                        <asp:TextBox ID="txtSecondayFieldvalue" Width="200px" runat="server" Text='<%# Bind("secondaryfielddnamevalue") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEditddlSecondaryfieldValue" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="txtSecondayFieldvalue"  ErrorMessage="Please enter secondary value" />
                                    </EditItemTemplate>

                                    <FooterTemplate>

                                        <asp:TextBox ID="txtSecondayFieldvalueFooter" Width="200px" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvFooterSecondaryfieldValue" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="txtSecondayFieldvalueFooter"  ErrorMessage="Please enter secondary value" />
                                    </FooterTemplate>


                                    <ItemTemplate>

                                        <asp:Label ID="lblSecondaryVal" runat="server" Text='<%# Bind("secondaryfielddnamevalue") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Primary Language instructions" SortExpression="fieldnameinstructions">

                                    <EditItemTemplate>
                                        
                                        <asp:TextBox ID="txtPrimaryInstructions" Width="200px" runat="server" Text='<%# Bind("fieldnameinstructions") %>'></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="rfvEditPrimaryInstructions" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="txtPrimaryInstructions" InitialValue="" ErrorMessage="Please enter secondary value" />--%>
                                    </EditItemTemplate>

                                    <FooterTemplate>

                                        <asp:TextBox ID="txtPrimaryInstructionsFooter" Width="200px" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvPrimaryInstructionsFooter" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="txtPrimaryInstructionsFooter" InitialValue="" ErrorMessage="Please select secondary value" />--%>
                                    </FooterTemplate>


                                    <ItemTemplate>

                                        <asp:Label ID="lblPrimaryInstructions" runat="server" Text='<%# Bind("fieldnameinstructions") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Secondary Language instructions" SortExpression="fieldnameinstructions">

                                    <EditItemTemplate>
                                       
                                        <asp:TextBox ID="txtSecondaryInstructions" Width="200px" runat="server" Text='<%# Bind("secondaryfieldnameinstructions") %>'></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="rfvEditSecondaryInstructions" runat="server" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' ControlToValidate="txtSecondaryInstructions" InitialValue="" ErrorMessage="Please select secondary value" />--%>
                                    </EditItemTemplate>

                                    <FooterTemplate>

                                        <asp:TextBox ID="txtSecondaryFooterInstructions" Width="200px" runat="server"></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="rfvFooterSecondaryFooter" runat="server" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ControlToValidate="txtSecondaryFooter" InitialValue="" ErrorMessage="Please select secondary value" />--%>
                                    </FooterTemplate>


                                    <ItemTemplate>

                                        <asp:Label ID="lblSecondaryInstruction" runat="server" Text='<%# Bind("secondaryfieldnameinstructions") %>'></asp:Label>

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

    </div>
    <script>
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#managelanguages_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#fieldmaster').addClass('active');
        });
	</script>

</asp:Content>
