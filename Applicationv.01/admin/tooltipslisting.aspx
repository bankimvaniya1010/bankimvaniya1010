<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tooltipslisting.aspx.cs" Inherits="admin_tooltipslisting" MasterPageFile="~/admin/admin.master" %>

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
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="conten1" runat="server">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Tooltips Listing </li>
        </ol>
        <h1 class="h2">Student Tooltips Listing </h1>
         <div class="media align-items-center">  
            <div class="form-row">
                <a href="tooltipsaddedit.aspx" class="btn btn-success">Add New</a>                                      
            </div>
        </div>
        <div class="card">


            <div class="tab-content card-body">               
                <div class="tab-pane active" id="first">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Form</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlForm" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlForm_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>



                    <asp:GridView ID="gvField" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="false"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnRowEditing="gvField_RowEditing" OnRowDataBound="gvField_RowDataBound" OnRowDeleting="gvField_RowDeleting" OnPageIndexChanging="gvField_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Field Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFieldName" runat="server" Text='<%# Bind("primaryfiledname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tooltips">
                                <ItemTemplate>
                                    <asp:Label ID="lblTooltips" runat="server" Text='<%# Bind("tooltips") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
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
            $('#managetooltips_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#tooltipslisting').addClass('active');
        });
	</script>

</asp:Content>


