<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitygroupingmaster.aspx.cs" Inherits="admin_universitygroupingmaster" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">University Grouping Master</li>
        </ol>
        <h1 class="h2">University Grouping Master</h1>
         <div class="media align-items-center">  
            <div class="form-row">
                <a href="adduniversitygrouping.aspx" class="btn btn-success">Add New</a>                                      
            </div>
        </div>
        <div class="card">

            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="universityGroupingGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="key"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowDataBound="universityGroupingGridView_RowDataBound" OnRowEditing="universityGroupingGridView_RowEditing">

                       <Columns>
                           <asp:BoundField DataField="key" HeaderText="Group Head University ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="key" />
                           <asp:TemplateField HeaderText="Institution Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniversityName" runat="server" Text='<%# Bind("universityHeadName") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Institution's under head Institution">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniversityList" runat="server" Text='<%# Bind("universitiesNames") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
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
	        $('#universitymenu_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#universitygroupingmaster').addClass('active');
	    });
    </script>
</asp:Content>
