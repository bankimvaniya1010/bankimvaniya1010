<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validatedocument.aspx.cs" Inherits="admin_validatedocument" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item"><a href="applicantlist.aspx">Applicant List</a></li>
            <li class="breadcrumb-item active">Validate Document</li>
        </ol>
        <h1 class="h2">Validate Document</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="list-group list-group-fit">

                    <div class="list-group-item">
                        <asp:gridview id="gvValidateDocument" runat="server" cssclass="table" autogeneratecolumns="False" showfooter="true"
                            datakeynames="documentid"
                            allowpaging="True"
                            cellpadding="3"
                            pagesize="25"
                            borderstyle="None"
                            borderwidth="1px"
                            cellspacing="2" onrowcancelingedit="gvValidateDocument_RowCancelingEdit" onrowediting="gvValidateDocument_RowEditing" onrowupdating="gvValidateDocument_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="documentid" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="documentid" />
                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                <EditItemTemplate>
                                    <asp:Label ID="lblItemDocuments" runat="server" Text='<%# Bind("documentname") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>

                                    <asp:Label ID="lblDocument" runat="server" Text='<%# Bind("documentname") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRemarks" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>

                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <EditItemTemplate>

                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>

                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                                </EditItemTemplate>
                                <ItemTemplate>
                                     <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>

                                    <asp:LinkButton ID="btnDownoad" CommandArgument='<%#Eval("filename") %>' runat="server" OnClick="Download">View Documents</asp:LinkButton>
                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>

                    </asp:gridview>
                    </div>
                    <div class="list-group-item">
                        <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                            <div class="form-row">
                                <label id="label-highschool" for="highschool" class="col-md-3 col-form-label form-label">Mail Text</label>
                                <div class="col-md-9">
                                    <input id="txtEmailText" runat="server" type="text" class="form-control" placeholder="Email Text">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                            <div class="form-row">

                                <asp:button id="btn_login" runat="server" text="Mail Send" cssclass="btn btn-success" onclick="btn_Email" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>


