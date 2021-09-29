<%@ Page Language="C#" AutoEventWireup="true" CodeFile="universitymaster_golive.aspx.cs" Inherits="admin_universitymaster_golive"  MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">University Master</li>
        </ol>
        
       
        <div class="card">
             <table id="filtertble" runat="server">
                <tr>
                    <td>
                      <div style="width:100px;">  <asp:Button ID="btngolive" runat="server" Text="Go Live" CssClass="btn btn-success" OnClick="btngolive_Click"/></div>
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
                         AllowPaging="True"                        
                        PageSize="10"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="univerityID"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="universityGridView_RowEditing" OnPageIndexChanging="universityGridView_PageIndexChanging" OnRowDataBound="universityGridView_RowDataBound">

                       <Columns>
                           <asp:BoundField DataField="univerityID" HeaderText="UID" InsertVisible="False"
                                ReadOnly="True" SortExpression="universityid" />
                             <asp:TemplateField HeaderText="Action">
                               <ItemTemplate>
                                   <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                               </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField>
                               <ItemTemplate>
                                   <asp:Label ID="lbluid" runat="server" Text='<%# Bind("univerityID") %>' Visible="false"></asp:Label>
                                    <asp:CheckBox ID="MemberCheck" runat="server"/>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Institution">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniName" runat="server" Text='<%# Bind("universityName") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                             <asp:TemplateField HeaderText="CRICOS code">
                               <ItemTemplate>
                                    <asp:Label ID="lblcricoscode" runat="server" Text='<%# Bind("cricoscode") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="HostURL">
                               <ItemTemplate>
                                   
                                   <a runat="server" href='<%# Bind("url") %>' target="_blank" id="exampath"><asp:Label ID="Label1" runat="server" Text='<%# Bind("url") %>'></asp:Label></a>
                                    
                                </ItemTemplate>
                           </asp:TemplateField>
                         
                           <asp:TemplateField HeaderText="City">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniCityName" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Country">
                               <ItemTemplate>
                                    <asp:Label ID="lblUniCountryName" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Contact Person">
                               <ItemTemplate>
                                    <asp:Label ID="lblcontactname" runat="server" Text='<%# Bind("contactname") %>'></asp:Label>
                                </ItemTemplate>
                           </asp:TemplateField>
                         <asp:TemplateField HeaderText="Contact Position">
                               <ItemTemplate>
                                    <asp:Label ID="lblcontactpersonposition" runat="server" Text='<%# Bind("contactpersonposition") %>'></asp:Label>
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
            $('#universitymaster_goLive').addClass('active');
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
