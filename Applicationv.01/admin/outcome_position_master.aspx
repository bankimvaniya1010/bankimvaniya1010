<%@ Page Language="C#" AutoEventWireup="true" CodeFile="outcome_position_master.aspx.cs" Inherits="admin_outcome_position_master" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item active">Outcome Position Master</li>
        </ol>
        <h1 class="h2">Outcome Position Master</h1>

        <div class="card">

            <div class="tab-content card-body">
                                
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="gvPositions" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                        PageSize="25"
                        OnDataBound="gvPositions_DataBound" OnRowCancelingEdit="gvPositions_RowCancelingEdit" OnRowCommand="gvPositions_RowCommand" OnRowDataBound="gvPositions_RowDataBound" OnRowDeleted="gvPositions_RowDeleted" OnRowDeleting="gvPositions_RowDeleting" OnRowEditing="gvPositions_RowEditing" OnRowUpdated="gvPositions_RowUpdated" OnRowUpdating="gvPositions_RowUpdating" OnPageIndexChanging="gvPositions_PageIndexChanging">

                        <EmptyDataTemplate>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Description</th>
                                <th scope="col">Career</th>
                                <th scope="col"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:TextBox ID="txtEmptyRecordDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" CssClass="form-control" id="ddlEmptyRecordcareer" OnLoad="ddlEmptyRecordcareer_Load"></asp:DropDownList>                                    
                                </td>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClientClick="return validateEmptyRow()" OnClick="Add" CommandName="EmptyDataTemplate" class="btn btn-success"/>
                                </td>
                            </tr>
                        </EmptyDataTemplate>

                        <Columns>

                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />


                            <asp:TemplateField HeaderText="Description">

                                <EditItemTemplate>
                                     
                                    <asp:TextBox ID="txtDescription"  CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
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

                            <asp:TemplateField HeaderText="Career">

                                <EditItemTemplate>
                                    <asp:Label ID="lblcareer" runat="server" Text='<%# Bind("careerID") %>' Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlcareer" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredddlcareer' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" InitialValue="0" ErrorMessage='Please select career' ControlToValidate='ddlcareer' />
                                </EditItemTemplate>

                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlcareerFooter" Width="200px" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredddlcareerFooter' ValidationGroup='<%# "GroupF_" + Container.DataItemIndex %>' InitialValue="0" ErrorMessage='Please select career' ControlToValidate='ddlcareerFooter' />
                                </FooterTemplate>

                                <ItemTemplate>

                                    <asp:Label ID="lblcareer" runat="server" Text='<%# Bind("careerID") %>'></asp:Label>

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

                <asp:HiddenField runat="server" ID="hidSelectedCareer"/>

            </div>
        </div>
    </div>
    <script>
        function validateEmptyRow() {
            if (!$("#ContentPlaceHolder1_gvPositions_txtEmptyRecordDescription").is(':hidden') && $("#ContentPlaceHolder1_gvPositions_txtEmptyRecordDescription").val() == "") {
                alert("Description Cannot Be Empty");
                return false;
            }
            else if (!$("#ContentPlaceHolder1_gvPositions_ddlEmptyRecordcareer").is(':hidden') && $("#ContentPlaceHolder1_gvPositions_ddlEmptyRecordcareer").val() == 0) {
                alert("Please select career");
                return false;
            }

            return true;
        }
        $("#ContentPlaceHolder1_gvPositions_ddlEmptyRecordcareer").change(function () {
            $("#<%=hidSelectedCareer.ClientID%>").val($("#ContentPlaceHolder1_gvPositions_ddlEmptyRecordcareer").val());
        });  
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#careeroutcomes_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#courseoutcomespositionmaster').addClass('active');
        });
	</script>
</asp:Content>
