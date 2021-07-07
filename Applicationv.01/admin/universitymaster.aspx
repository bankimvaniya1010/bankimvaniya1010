<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitymaster.aspx.cs" Inherits="admin_universitymaster" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <script type="text/javascript">
         
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
        </script>
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">University Master</li>
        </ol>
        
       
        <div class="card">
             <table id="filtertble" runat="server">
                <tr>
                    <td>
                        <h1 class="h2">University Master</h1>
                    </td>
                     <td>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlfilter" Style="width: 240px;">
                                    <asp:ListItem Value="0">Please Select</asp:ListItem>                                    
                                    <asp:ListItem Value="1">By UID</asp:ListItem>
                                    <asp:ListItem Value="2">By CRICOS</asp:ListItem>
                                    <asp:ListItem Value="3">By Country</asp:ListItem>
                                    <asp:ListItem Value="4">By City</asp:ListItem>
                                    <asp:ListItem Value="5">By Name</asp:ListItem>

                                </asp:DropDownList><br />
                            </td>
                            <td>
                                <div id="DivUID" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlUniversityID" OnSelectedIndexChanged="ddlUniversityID_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="DivCricos" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlCricos" OnSelectedIndexChanged="ddlCricos_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="DivddlCountry" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlcountry" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                            <div id="DivddlCity" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlCity" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="DivName" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlname" OnSelectedIndexChanged="ddlname_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                            </td>
                </tr>
            </table>
            
            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'style="white-space: nowrap">
                   <asp:GridView ID="universityGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="15"
                        BorderStyle="None"
                        AllowPaging="True"
                        BorderWidth="1px" DataKeyNames="univerityID"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="universityGridView_RowEditing" OnPageIndexChanging="universityGridView_PageIndexChanging1" OnRowCommand="universityGridView_RowCommand" OnRowDeleting="universityGridView_RowDeleting"> 

                       <Columns>
                           <asp:BoundField DataField="univerityID" HeaderText="UID" InsertVisible="False"
                                ReadOnly="True" SortExpression="universityid" />
                             <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Delete">
                               <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("univerityID")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("univerityID","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                           
                           <asp:TemplateField HeaderText="University Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniName" runat="server" Text='<%# Bind("universityName") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                            <asp:TemplateField HeaderText="CRICOS code">
                               <ItemTemplate>
                                    <asp:Label ID="lblcricoscode" runat="server" Text='<%# Bind("cricoscode") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="City Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniCityName" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Country Name">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniCountryName" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="University Address">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                         
                       </Columns>
                   </asp:GridView>
                </div>


            </div>
        </div>

    </div>
    <script>
          $("#<%=ddlfilter.ClientID%>").change(function () {
        var filterid = $("#<%=ddlfilter.ClientID%>").val();
             if (filterid == 1) {
                 $("#<%=DivUID.ClientID%>").show();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 2) {
                 $("#<%=DivCricos.ClientID%>").show();
                 $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 3) {
                 $("#<%=DivddlCountry.ClientID%>").show();
                  $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 4) {
                 $("#<%=DivddlCity.ClientID%>").show();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                  $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 5) {
                 
                 $("#<%=DivName.ClientID%>").show();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                  $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
             }
             else {
                 $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
              }
                  });
		$(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#institution_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
            $('#universitymaster').addClass('active');

              var filterid = $("#<%=ddlfilter.ClientID%>").val();
             if (filterid == 1) {
                 $("#<%=DivUID.ClientID%>").show();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 2) {
                 $("#<%=DivCricos.ClientID%>").show();
                 $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 3) {
                 $("#<%=DivddlCountry.ClientID%>").show();
                 $("#<%=DivddlCity.ClientID%>").hide();
                  $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 4) {
                 $("#<%=DivddlCity.ClientID%>").show();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                  $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
             }
             else if (filterid == 5) {
                 
                 $("#<%=DivName.ClientID%>").show();
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                  $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
             }
             else {
                 $("#<%=DivddlCity.ClientID%>").hide();
                 $("#<%=DivUID.ClientID%>").hide();
                 $("#<%=DivCricos.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
                 $("#<%=DivName.ClientID%>").hide();
            }

        });
         
	</script>
</asp:Content>
