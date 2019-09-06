<%@ Page Language="C#" AutoEventWireup="true" CodeFile="agentdashboard.aspx.cs" Inherits="dashboard" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="col-lg container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Agent Dashboard</li>
        </ol>
        <h1 class="h2">Agent Dashboard</h1>



        <div class="row">
            <div class="col-lg-7">

                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <div class="h2 mb-0 mr-3 text-primary"></div>
                        <div class="flex">
                            <h4 class="card-title">Instructions</h4>

                        </div>

                    </div>
                    <div class="card-body">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                    </div>
                    <div class="card-body">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                    </div>
                    <div class="card-body">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                    </div>
                    <div class="card-body">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                    </div>
                    <div class="card-body">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque necessitatibus distinctio adipisci eius, unde dignissimos maxime doloribus quisquam non harum?
                    </div>

                </div>


            </div>
            
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="gvApplicant" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="applicantid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2">

                        <Columns>
                            <asp:BoundField DataField="applicantid" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Name" SortExpression="firstName">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <ItemTemplate>
                                   <%-- <asp:LinkButton ID="lnkDoc" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="ViewDoc" Text="View Documents"></asp:LinkButton>|
                                     <asp:LinkButton ID="lnkView" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="ViewPersonal" Text="View Applicant Info"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnkValidate" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="ValidateData" Text="ValidateData"></asp:LinkButton>|
 --%>                               </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>


            </div>
        </div>
    </div>
</asp:Content>
