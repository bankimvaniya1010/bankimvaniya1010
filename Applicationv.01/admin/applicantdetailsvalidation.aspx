<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantdetailsvalidation.aspx.cs" Inherits="admin_applicantdetailsvalidation" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item"><a href="applicantlist.aspx">Applicant List</a></li>
            <li class="breadcrumb-item active">Validate Applicant Data</li>
        </ol>
        <h1 class="h2">Validate Applicant Data</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="list-group list-group-fit">

                    <div class="list-group-item">
                        <asp:GridView ID="gvValidateData" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="true"
                            DataKeyNames="id"
                            AllowPaging="True"
                            CellPadding="3"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px"
                            CellSpacing="2">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField HeaderText="Key Name" SortExpression="keyid">
                                    <ItemTemplate>
                                        <asp:Label ID="lblKey" runat="server" Text='<%# Bind("KeyName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Key Value" SortExpression="keyid">
                                    <ItemTemplate>
                                        <asp:Label ID="lblValue" runat="server" Text='<%# Bind("KeyValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Validated" SortExpression="isValid">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkValid" runat="server" Checked='<%# bool.Parse(Eval("isValid").ToString()=="1"?"True":"False") %>' />

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Validation Proof" SortExpression="proofofValidation">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtValidationProof" runat="server" Text='<%# Bind("proofofValidation") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                                    </ItemTemplate>

                                </asp:TemplateField>


                            </Columns>

                        </asp:GridView>
                    </div>
                    <div class="list-group-item">
                        <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                            <div class="form-row">

                                <asp:Button ID="btnValidate" runat="server" Text="Validate" CssClass="btn btn-success" OnClick="btnValidate_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
