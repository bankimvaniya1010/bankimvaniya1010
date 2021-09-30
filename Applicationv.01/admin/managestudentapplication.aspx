<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managestudentapplication.aspx.cs" Inherits="admin_managestudentapplication" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

     <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Application List</li>
        </ol>
        <h1 class="h2">Course Applications</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">                    
                    <asp:GridView ID="gvApplications" runat="server" CssClass="table gvApplicant" AutoGenerateColumns="False" ShowFooter="false"
                        DataKeyNames="applicantid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnRowCommand="gvApplications_RowCommand">

                        <Columns>
                            <asp:BoundField DataField="applicantid" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id"/>
                                
                            <asp:TemplateField HeaderText="Applicant Details">
                                <ItemTemplate>
                                    <b>Applicant Id:</b>   <asp:Label ID="Label1" runat="server" Text='<%# Bind("applicantid") %>'></asp:Label><br/>
                                    <b>Applicant Name: </b> <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("name") %>'></asp:Label><br/>
                                    <b>Nationality :</b>   <asp:Label ID="lblNationality" runat="server" Text='<%# Bind("nationality") %>'></asp:Label><br/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkApplication" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Process" Text="Process Application"></asp:LinkButton>
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
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#courseApplication').addClass('active');
        });
    </script>
</asp:Content>