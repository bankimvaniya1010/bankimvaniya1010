<%@ Page Language="C#" AutoEventWireup="true" CodeFile="educationalinstitutionmaster_listing.aspx.cs" Inherits="admin_educationalinstitutionmaster_listing" MasterPageFile="~/admin/admin.master"%>
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
            <li class="breadcrumb-item active">Educational Institution Master</li>
        </ol>
        <h1 class="h2">Educational Institution Master</h1>
          <div class="media align-items-center">  
            <div class="form-row">
                <a href="educationalinstitutionmaster_addedit.aspx" class="btn btn-success">Add New</a>                                      
            </div>
        </div>
        <div class="card">
            <div class="tab-content card-body">
               <div class="table-responsive">
                    <asp:GridView ID="gvproctor" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="gvproctor_RowCancelingEdit" OnRowEditing="gvproctor_RowEditing" OnRowUpdating="gvproctor_RowUpdating" OnDataBound="gvproctor_DataBound" OnPageIndexChanging="gvproctor_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                           
                            <asp:TemplateField HeaderText="Institution Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("UniversityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                            
                            <asp:TemplateField HeaderText="Country">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="City">                                                           
                                <ItemTemplate>
                                    <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 

                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>                              

                                <ItemTemplate>
                                    <a href="/admin/educationalinstitutionmaster_addedit.aspx?id=<%# Eval("id") %>">Edit</a>
                                </ItemTemplate>

                            </asp:TemplateField>

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
            $('#educationalinstitutionmaster').addClass('active');
        });
	</script>
</asp:Content>



