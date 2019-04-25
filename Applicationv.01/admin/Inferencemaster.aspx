﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inferencemaster.aspx.cs" Inherits="admin_Inferencemaster" MasterPageFile="~/admin/admin.master" %>


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
            <li class="breadcrumb-item active">Inference Master</li>
        </ol>
        <h1 class="h2">Inference Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="InferenceGridView" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="inferenceid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="InferenceGridView_DataBound" OnRowCancelingEdit="InferenceGridView_RowCancelingEdit" OnRowCommand="InferenceGridView_RowCommand" OnRowDataBound="InferenceGridView_RowDataBound" OnRowDeleted="InferenceGridView_RowDeleted" OnRowDeleting="InferenceGridView_RowDeleting" OnRowEditing="InferenceGridView_RowEditing" OnRowUpdated="InferenceGridView_RowUpdated" OnRowUpdating="InferenceGridView_RowUpdating">

                        <Columns>

                            <asp:BoundField DataField="inferenceid" HeaderText="Inferenceid" InsertVisible="False"
                                ReadOnly="True" SortExpression="inferenceid" />


                            <asp:TemplateField HeaderText="Description" SortExpression="Description">

                                <EditItemTemplate>
                                     
                                    <asp:TextBox ID="txtDescription"  CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtDescription1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescription1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>

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
