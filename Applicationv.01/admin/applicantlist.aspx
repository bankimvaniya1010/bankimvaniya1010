﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantlist.aspx.cs" Inherits="admin_applicantlist" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">List of Applicant</li>
        </ol>
        <h1 class="h2">List of Applicant</h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <asp:GridView ID="gvApplicant" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="applicantid"
                        AllowPaging="True"
                        CellPadding="3"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" OnRowCommand="gvApplicant_RowCommand" OnPageIndexChanging="gvApplicant_PageIndexChanging">

                        <Columns>
                            <asp:BoundField DataField="applicantid" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Name" SortExpression="firstName">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkPersonal" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Personal" Text="View Personal"></asp:LinkButton>|
                                   <asp:LinkButton ID="lnkContact" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Contact" Text="View Contact Detail"></asp:LinkButton>|
                                     <asp:LinkButton ID="lnkIdentification" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Identification" Text="View Identification Detail"></asp:LinkButton>|
                                     <asp:LinkButton ID="lnkEducation" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Education" Text="View Education Detail"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnkLanguage" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Language" Text="View Language Detail"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnkEmployment" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Employers" Text="View Employment Detail"></asp:LinkButton>|
                                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Reference" Text="View Reference"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnkSocial" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Social" Text="View Social"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnkVisa" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Visa" Text="View Visa"></asp:LinkButton>|
                                  <asp:LinkButton ID="LnkFunding" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Funding" Text="View Funding"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnlDownloadDetails" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="Download" Text="Download Applicant Details"></asp:LinkButton>
                                     <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="GTE" Text="Download GTE Reports"></asp:LinkButton>
                                    <%--  <asp:LinkButton ID="lnkView" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="ViewPersonal" Text="View Applicant Info"></asp:LinkButton>|
                                    <asp:LinkButton ID="lnkValidate" runat="server" CausesValidation="False" CommandArgument='<%#Eval("applicantid")%>' CommandName="ValidateData" Text="ValidateData"></asp:LinkButton>|
                                    --%>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>


            </div>
        </div>

    </div>
</asp:Content>
