<%@ Page Language="C#" AutoEventWireup="true" CodeFile="citymaster.aspx.cs" Inherits="admin_citymaster" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">City Master</li>
        </ol>
        <h1 class="h2">City Master</h1>

        <div class="card">
            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                <div class="form-row">
                    <asp:DropDownList ID="ddlCountry" CssClass="col-md-2 form-control" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    <asp:Button ID="btnCreateCity" runat="server" Text="Create City" CssClass="btn btn-success" OnClick="btnCreateCity_Click" />
                </div>
            </div>
            <div class="tab-content card-body">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="cityGridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="cityID"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="cityGridView_RowEditing">

                        <Columns>
                            <asp:BoundField DataField="cityID" HeaderText="City ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="cityID" />
                            <asp:TemplateField HeaderText="City Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblCityName" runat="server" Text='<%# Bind("cityName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblCityDesc" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City Weather">
                                <ItemTemplate>
                                    <asp:Label ID="lblCityWeather" runat="server" Text='<%# Bind("weather") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City Around">
                                <ItemTemplate>
                                    <asp:Label ID="lblCityAround" runat="server" Text='<%# Bind("cityAround") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City Cost Of Living">
                                <ItemTemplate>
                                    <asp:Label ID="lblCityCost" runat="server" Text='<%# Bind("costOfLiving") %>'></asp:Label>
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
            $('#city_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#managecity').addClass('active');
        });
	</script>
</asp:Content>

