<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qualificationmaster.aspx.cs" Inherits="admin_qualificationmaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Qualification Master</li>
        </ol>
        <h1 class="h2">Qualification Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="QualificationGridView" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="qualificationid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="QualificationGridView_DataBound" OnRowCancelingEdit="QualificationGridView_RowCancelingEdit" OnRowCommand="QualificationGridView_RowCommand" OnRowDataBound="QualificationGridView_RowDataBound" OnRowDeleted="QualificationGridView_RowDeleted" OnRowDeleting="QualificationGridView_RowDeleting" OnRowEditing="QualificationGridView_RowEditing" OnRowUpdated="QualificationGridView_RowUpdated" OnRowUpdating="QualificationGridView_RowUpdating">

                        <Columns>

                            <asp:BoundField DataField="qualificationid" HeaderText="Form id" InsertVisible="False"
                                ReadOnly="True" SortExpression="qualificationid" />


                            <asp:TemplateField HeaderText="Description" SortExpression="Qualification Name">

                                <EditItemTemplate>
                                     
                                    <asp:TextBox ID="txtQualification"  CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("qualificationname") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQualificationEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Qualification Cannot Be Empty' ControlToValidate='txtQualification' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtQualificationFooter" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredQualificationFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Qualification  Cannot Be Empty' ControlToValidate='txtQualificationFooter' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("qualificationname") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" CommandName="AddNew" Text="Add New" ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>'></asp:LinkButton>

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
