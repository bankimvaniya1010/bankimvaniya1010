<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formmaster.aspx.cs" Inherits="admin_formmaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Form Master</li>
        </ol>
        <h1 class="h2">Form Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="FormGridView" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="formid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="FormGridView_DataBound" OnRowCancelingEdit="FormGridView_RowCancelingEdit" OnRowCommand="FormGridView_RowCommand" OnRowDataBound="FormGridView_RowDataBound" OnRowDeleted="FormGridView_RowDeleted" OnRowDeleting="FormGridView_RowDeleting" OnRowEditing="FormGridView_RowEditing" OnRowUpdated="FormGridView_RowUpdated" OnRowUpdating="FormGridView_RowUpdating" OnPageIndexChanging="FormGridView_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="formid" HeaderText="Form id" InsertVisible="False"
                                ReadOnly="True" SortExpression="formid" />


                            <asp:TemplateField HeaderText="Description" SortExpression="Form Name">

                                <EditItemTemplate>
                                     
                                    <asp:TextBox ID="txtDescription"  CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("formname") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtDescription1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescription1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("formname") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Service">

                                    <EditItemTemplate>
                                         <asp:Label ID="lblService" runat="server" Text='<%# Bind("Service") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlService" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat='server' ID='requiredddlService' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select service' InitialValue="0" ControlToValidate='ddlService' />
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:DropDownList ID="ddlServiceFooter" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                         <asp:RequiredFieldValidator runat='server' ID='RequiredFieldValidator1' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select service' InitialValue="0" ControlToValidate='ddlServiceFooter' />
                                    </FooterTemplate>

                                    <ItemTemplate>

                                        <asp:Label ID="lblForm" runat="server" Text='<%# Bind("Service") %>'></asp:Label>

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
	        $('#formmaster').addClass('active');
	    });
	</script>

</asp:Content>
