<%@ Page Language="C#" AutoEventWireup="true" CodeFile="subjectmaster.aspx.cs" Inherits="admin_subjectmaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Subject Master</li>
        </ol>
        <h1 class="h2">Subject Master</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="SubjectGridView" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnDataBound="SubjectGridView_DataBound" OnRowCancelingEdit="SubjectGridView_RowCancelingEdit" OnRowCommand="SubjectGridView_RowCommand" OnRowDataBound="SubjectGridView_RowDataBound" OnRowDeleted="SubjectGridView_RowDeleted" OnRowDeleting="SubjectGridView_RowDeleting" OnRowEditing="SubjectGridView_RowEditing" OnRowUpdated="SubjectGridView_RowUpdated" OnRowUpdating="SubjectGridView_RowUpdating">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Form id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />


                            <asp:TemplateField HeaderText="Description" SortExpression="Subject Name">

                                <EditItemTemplate>
                                     
                                    <asp:TextBox ID="txtSubject"  CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Subjectname") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredSubjectEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Subject Cannot Be Empty' ControlToValidate='txtSubject' />
                                </EditItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="txtSubjectFooter" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredSubjectFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Subject  Cannot Be Empty' ControlToValidate='txtSubjectFooter' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblSubject" runat="server" Text='<%# Bind("Subjectname") %>'></asp:Label>

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
