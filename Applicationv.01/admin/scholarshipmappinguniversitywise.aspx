﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="scholarshipmappinguniversitywise.aspx.cs" Inherits="admin_scholarshipmappinguniversitywise" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Scholarship Master</li>
        </ol>
        <h1 class="h2">Scholarship Master</h1>

        <div class="card">
                           
            <div class="tab-content card-body">
                <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="scholarshipGridView" CssClass="table" runat="server" Width="200px" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="id"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="scholarshipGridView_RowEditing" OnPageIndexChanging="scholarshipGridView_PageIndexChanging" OnRowCommand="scholarshipGridView_RowCommand" OnRowDataBound="scholarshipGridView_RowDataBound">

                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Scholarship ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Scholarship Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipDesc" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Eligibility">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipEligibility" runat="server" Text='<%# Bind("eligibility") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scholarship Application Deadline">
                                <ItemTemplate>
                                    <asp:Label ID="lblScholarshipDeadline" runat="server" Text='<%# Bind("application_deadline") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Scholarship Form">
                                <ItemTemplate>
                                    <a href="<%# Eval("scholarship_form") %>" target="_blank">
                                        <asp:Image ID="img" runat="server" Height="50px" Width="50px" ImageUrl='/assets/images/pdf-icon.jpg' />
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Active Status">
                                <ItemTemplate>
                                    <%--<asp:CheckBox ID="chkValid" runat="server" Checked='<%# bool.Parse(Eval("isValid").ToString()=="1"?"True":"False") %>' />--%>
                                    <asp:CheckBox ID="chkactive" runat="server" Checked='<%# bool.Parse(Eval("check").ToString()=="1"?"True":"False") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>                                    
                                    <asp:LinkButton ID="lnkSubmit" runat="server" CommandName="Submit" Text="Submit" CommandArgument='<%#Container.DataItemIndex%>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>


            </div>
        </div>

    </div>
    <script>
		//$(document).ready(function () {
  //          $('.sidebar-menu-item').removeClass('open');
  //          $('#Scholarships_list').addClass('open');
  //          $('.sidebar-menu-item').removeClass('active');
  //          $('#manageScholarships').addClass('active');
  //      });
	</script>
</asp:Content>
