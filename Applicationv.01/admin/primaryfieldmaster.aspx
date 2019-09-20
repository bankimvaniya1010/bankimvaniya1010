<%@ Page Language="C#" AutoEventWireup="true" CodeFile="primaryfieldmaster.aspx.cs" Inherits="admin_primaryfieldmaster" MasterPageFile="~/admin/admin.master" %>

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
                        DataKeyNames="primaryfieldid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="FormFieldGridView_DataBound" OnRowCancelingEdit="FormFieldGridView_RowCancelingEdit" OnRowCommand="FormFieldGridView_RowCommand" OnRowDataBound="FormFieldGridView_RowDataBound" OnRowDeleted="FormFieldGridView_RowDeleted" OnRowDeleting="FormFieldGridView_RowDeleting" OnRowEditing="FormFieldGridView_RowEditing" OnRowUpdated="FormFieldGridView_RowUpdated" OnRowUpdating="FormFieldGridView_RowUpdating" OnPageIndexChanging="FormFieldGridView_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="primaryfieldid" HeaderText="Form id" InsertVisible="False"
                                ReadOnly="True" SortExpression="primaryfieldid" />
                             <asp:TemplateField HeaderText="Form Name" SortExpression="formname">

                                    <EditItemTemplate>
                                         <asp:Label ID="lblFormEdit" runat="server" Text='<%# Bind("formname") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlFormname" Width="200px" runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat='server' ID='requiredddlFormname' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select form name' InitialValue="0" ControlToValidate='ddlFormname' />
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:DropDownList ID="ddlFormnameFooter" Width="200px" runat="server" ></asp:DropDownList>

                                        <asp:RequiredFieldValidator runat='server' ID='requiredFormcFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Please select form name' ControlToValidate='ddlFormnameFooter' />
                                    </FooterTemplate>

                                    <ItemTemplate>

                                        <asp:Label ID="lblForm" runat="server" Text='<%# Bind("formname") %>'></asp:Label>

                                    </ItemTemplate>

                                </asp:TemplateField>

                            <asp:TemplateField HeaderText="Field Name" SortExpression="Form Name">

                                <EditItemTemplate>
                                     
                                    <asp:TextBox ID="txtDescription"  CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("primaryfiledname") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtDescription1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescription1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("primaryfiledname") %>'></asp:Label>

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
            $('#CustomizeForms_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#primaryfieldmaster').addClass('active');
        });
	</script>
</asp:Content>

