<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantscholarshipstatus.aspx.cs" Inherits="applicantscholarshipstatus" MasterPageFile="~/student.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Scholarships</li>
        </ol>
        <h1 class="h2">Scholarship Applications</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="scholarshipGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" >

                        <Columns>
                            <asp:TemplateField HeaderText="Scholarship Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipAmount" runat="server" Text='<%# Bind("award_amount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Awarded by">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipAwardedBy" runat="server" Text='<%# Bind("awarded_by") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipAwardedBy" runat="server" Text='<%# Bind("approval_status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Application Form">
                                <ItemTemplate>
                                    <a href="<%# Eval("scholarship_form") %>" target="_blank">
                                        <asp:Image ID="img" runat="server" Height="50px" Width="50px" ImageUrl='<%# Eval("image_icon") %>' /><%--/assets/images/pdf-icon.jpg--%>
                                    </a>
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
            $('#studentapplication_finances').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantscholarshipstatus').addClass('active');
        });
	</script>
</asp:Content>
