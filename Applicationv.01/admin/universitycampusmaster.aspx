<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitycampusmaster.aspx.cs" Inherits="admin_universitycampusmaster" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">INSITITUTION Campus Master</li>
        </ol>
        <h1 class="h2">INSITITUTION Campus Master</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="form-group row">
                    <asp:DropDownList ID="ddlUniversity" runat="server" class="form-control col-sm-4" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged"></asp:DropDownList>
                    <asp:Button ID="addNewCampus" runat="server" Text="Add New Campus" OnClick="addNewCampus_Click" class="form-control col-sm-4" />
                </div>
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                   <asp:GridView ID="universityCampusGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="campusID"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowDataBound="universityCampusGridView_RowDataBound" OnRowEditing="universityCampusGridView_RowEditing" OnPageIndexChanging="universityCampusGridView_PageIndexChanging">

                       <Columns>
                           <asp:BoundField DataField="campusID" HeaderText="Campus ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="campusID" />
                           <asp:TemplateField HeaderText="Campus Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblCampName" runat="server" Text='<%# Bind("campusName") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Institution">
                               <ItemTemplate>
                                    <asp:Label ID="lblCampUniName" runat="server" Text='<%# Bind("universityName") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Campus Description">
                               <ItemTemplate>
                                    <asp:Label ID="lblCampDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Campus facilities">
                               <ItemTemplate>
                                   <asp:DropDownList ID="ddlFacilities" runat="server"></asp:DropDownList>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Campus Faculty Description">
                               <ItemTemplate>
                                    <asp:Label ID="lblCampFacultyDescription" runat="server" Text='<%# Bind("facultyDescription") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Campus Research">
                               <ItemTemplate>
                                    <asp:Label ID="lblCampResearch" runat="server" Text='<%# Bind("campusResearch") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEditCampus" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit Campus"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                       </Columns>
                   </asp:GridView>
                </div>
            </div>
        </div>

    </div>
    <script type="text/javascript">
        function checkUniversity() {

            var universityID = $('#<%=ddlUniversity.ClientID%>').val();

            if (universityID == 0 || isNaN(parseInt(universityValue))) {
                alert("Please select institution");
                return false;
            }

            return true;
        }
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#institution_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
	        $('#universitycampusmaster').addClass('active');
	    });
    </script>
</asp:Content>
