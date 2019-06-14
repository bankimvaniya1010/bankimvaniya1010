﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="majordesription.aspx.cs" Inherits="admin_majordesription" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Major Discipline Master </li>
        </ol>
        <h1 class="h2">Major Discipline Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="gvMajorDescription" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="gvMajorDescription_DataBound" OnRowCancelingEdit="gvMajorDescription_RowCancelingEdit" OnRowCommand="gvMajorDescription_RowCommand" OnRowDataBound="gvMajorDescription_RowDataBound" OnRowDeleted="gvMajorDescription_RowDeleted" OnRowDeleting="gvMajorDescription_RowDeleting" OnRowEditing="gvMajorDescription_RowEditing" OnRowUpdated="gvMajorDescription_RowUpdated" OnRowUpdating="gvMajorDescription_RowUpdating">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />


                            <asp:TemplateField HeaderText="Description" SortExpression="Description">

                                <EditItemTemplate>

                                    <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtDescription1" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescription1' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                        
                           <asp:TemplateField HeaderText="universityid" SortExpression="universityid">

                                    <EditItemTemplate>
                                         <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("universityid") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlUniversity" Width="200px" runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator runat='server' ID='requiredddlUniversity' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select University' InitialValue="0" ControlToValidate='ddlUniversity' />
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:DropDownList ID="ddlUniversityFooter" Width="200px" runat="server"></asp:DropDownList>

                                        <asp:RequiredFieldValidator runat='server' ID='requiredddlUniversityFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' InitialValue="0" ErrorMessage='Please select University' ControlToValidate='ddlUniversityFooter' />
                                    </FooterTemplate>

                                    <ItemTemplate>

                                        <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("universityid") %>'></asp:Label>

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