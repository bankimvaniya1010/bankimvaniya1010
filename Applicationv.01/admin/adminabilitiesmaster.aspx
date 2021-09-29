﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminabilitiesmaster.aspx.cs" Inherits="admin_abilitiesmaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Abilities Master </li>
        </ol>
        <h1 class="h2">Abilities Master</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="gvAddressProof" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                        PageSize="25"
                        OnDataBound="gvAddressProof_DataBound" OnRowCancelingEdit="gvAddressProof_RowCancelingEdit" OnRowCommand="gvAddressProof_RowCommand" OnRowDataBound="gvAddressProof_RowDataBound" OnRowDeleted="gvAddressProof_RowDeleted" OnRowDeleting="gvAddressProof_RowDeleting" OnRowEditing="gvAddressProof_RowEditing" OnRowUpdated="gvAddressProof_RowUpdated" OnRowUpdating="gvAddressProof_RowUpdating" OnPageIndexChanging="gvAddressProof_PageIndexChanging">
                        <EmptyDataTemplate>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Abilities</th>
                                <th scope="col"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:TextBox ID="txtEmptyRecordDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="Add" OnClientClick="return validateEmptyRow()" CommandName="EmptyDataTemplate" class="btn btn-success"/>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Abilities" SortExpression="coursetype">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("coursetype") %>' ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Abilities Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtDescription1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Abilities Cannot Be Empty' ControlToValidate='txtDescription1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("coursetype") %>'></asp:Label>

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
            if (!$("#ContentPlaceHolder1_gvAddressProof_txtEmptyRecordDescription").is(':hidden') && $("#ContentPlaceHolder1_gvAddressProof_txtEmptyRecordDescription").val() == "") {
                alert("Abilities Cannot Be Empty");
                return false;
            }

            return true;
        }

		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#CustomizeForms_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#alternateaddressproof').addClass('active');
        });
    </script>
</asp:Content>
