<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alternateIdproofcountrywiselisting.aspx.cs" Inherits="admin_alternateIdproofcountrywiselisting" MasterPageFile="~/admin/admin.master" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
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
            <li class="breadcrumb-item active">Country Wise Alternate ID Proof Master</li>
        </ol>
        <h1 class="h2">Country Wise Alternate ID Proof Master</h1>
        <div class="media align-items-center">  
            <div class="form-row">
                <a href="alternateIdproofcountrywise.aspx" class="btn btn-success">Add New</a>                                      
            </div>
        </div>
        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                  <asp:GridView ID="alternateidproofGridView" CssClass="table" runat="server" Width="" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" 
                        DataKeyNames="id"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowDataBound="alternateidproofGridView_RowDataBound" OnRowCancelingEdit="alternateidproofGridView_RowCancelingEdit" OnRowEditing="alternateidproofGridView_RowEditing" OnRowDeleted="alternateidproofGridView_RowDeleted" OnRowDeleting="alternateidproofGridView_RowDeleting" OnRowUpdated="alternateidproofGridView_RowUpdated" OnRowUpdating="alternateidproofGridView_RowUpdating">

                       <Columns>
                           <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" />
                           <asp:TemplateField HeaderText="Country">
                             <EditItemTemplate>
                                <asp:Label ID="lblCOuntry" runat="server" Text='<%# Bind("country") %>' Visible="false"></asp:Label>
                                <asp:DropDownList ID="ddlcountry" Width="200px" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat='server' ID='requiredddlcountry' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select country' InitialValue="0" ControlToValidate='ddlcountry' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblcountry" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                            </ItemTemplate>
                             
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Id Proof">
                               <EditItemTemplate>
                                    <asp:Label ID="lblddlIdProof" runat="server" Text='<%# Bind("alternateidproofID") %>' Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlIdProof" Width="200px" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat='server' ID='requiredddlIdProof' ValidationGroup='<%# "Group_" + Container.DataItemIndex %>' Display="Dynamic" ErrorMessage='Please select Id Proof' InitialValue="0" ControlToValidate='ddlIdProof' />
                                </EditItemTemplate>
                               <ItemTemplate>
                                    <asp:Label ID="lblIdProof" runat="server" Text='<%# Bind("alternateidproofID") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>  
                           
                            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>
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
	        $('#alternateIdproofcountrywiselisting').addClass('active');
	    });
    </script>
</asp:Content>
