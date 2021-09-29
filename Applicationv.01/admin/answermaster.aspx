<%@ Page Language="C#" AutoEventWireup="true" CodeFile="answermaster.aspx.cs" Inherits="admin_answermaster" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Answer Master</li>
        </ol>
        <h1 class="h2">Answer Master</h1>

        <div class="card">
 <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
            <asp:GridView ID="AnswerView" runat="server" AutoGenerateColumns="False" ShowFooter="true" Width="680"
                DataKeyNames="answerid"
                AllowPaging="True"
                CellPadding="3"
                PageSize="25"
              
                BorderStyle="None"
                BorderWidth="1px"
                CellSpacing="2" OnDataBound="AnswerView_DataBound" OnRowCancelingEdit="AnswerView_RowCancelingEdit" OnRowCommand="AnswerView_RowCommand" OnRowDataBound="AnswerView_RowDataBound" OnRowDeleting="AnswerView_RowDeleting" OnRowEditing="AnswerView_RowEditing" OnRowUpdating="AnswerView_RowUpdating">

                <Columns>

                    <asp:BoundField DataField="answerid" HeaderText="Answerid" InsertVisible="False"
                        ReadOnly="True" SortExpression="answerid" />
                  

                    <asp:TemplateField HeaderText="Description" SortExpression="Description">

                        <EditItemTemplate>

                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Text='<%# Bind("answerdescription") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator runat='server' ID='requiredDescEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Description Cannot Be Empty' ControlToValidate='txtDescription' />
                        </EditItemTemplate>

                        <FooterTemplate>

                            <asp:TextBox ID="txtDescriptionFooter" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator runat='server' ID='requiredDescFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Description  Cannot Be Empty' ControlToValidate='txtDescriptionFooter' />
                        </FooterTemplate>

                        <ItemTemplate>

                            <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("answerdescription") %>'></asp:Label>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="GTE Q Score" SortExpression="Description">

                        <EditItemTemplate>

                            <asp:TextBox ID="txtGTQ"  runat="server" Text='<%# Bind("GTEQScore") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator runat='server' ID='rfvGTQEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='GTE Q Score Cannot Be Empty' ControlToValidate='txtGTQ' />
                        </EditItemTemplate>

                        <FooterTemplate>

                            <asp:TextBox ID="txtGTQFooter" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator runat='server' ID='rfvtxtGTEQFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='GTE Q Score Cannot Be Empty' ControlToValidate='txtGTQFooter' />
                        </FooterTemplate>

                        <ItemTemplate>

                            <asp:Label ID="lblGTQ" runat="server" Text='<%# Bind("GTEQScore") %>'></asp:Label>

                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Risk Q Score" SortExpression="Description">

                        <EditItemTemplate>

                            <asp:TextBox ID="txtRiskQ"  runat="server" Text='<%# Bind("riskQScore") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator runat='server' ID='rfvtxtRiskQEdit' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Risk Q Score Cannot Be Empty' ControlToValidate='txtRiskQ' />
                        </EditItemTemplate>

                        <FooterTemplate>

                            <asp:TextBox ID="txtRiskQFooter" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator runat='server' ID='rfvtxtRiskQFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' ErrorMessage='Risk Q Score  Cannot Be Empty' ControlToValidate='txtRiskQFooter' />
                        </FooterTemplate>

                        <ItemTemplate>

                            <asp:Label ID="lblRiskQ" runat="server" Text='<%# Bind("riskQScore") %>'></asp:Label>

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
