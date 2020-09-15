<%@ Page Language="C#" AutoEventWireup="true" CodeFile="examiner_master_lilsting.aspx.cs" Inherits="admin_examiner_master_lilsting" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
        function ConfirmOnResend(item) {
            var txt;
            var person = prompt("Please enter your password :", "");
            if (person == "") {
                alert("Please enter password");
                return false;
            }
            else if (person == null)
                return false;
            else {
                txt =  person ;
            }
            $("#<%= Hidpassword.ClientID%>").val(txt).html(txt);
        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Assessment Role Master</li>
        </ol>
        <h1 class="h2">Assessment Role Master</h1>
          <%--<div class="media align-items-center">  
            <div class="form-row">
                <a href="examiner_master.aspx" class="btn btn-success">Add New Examiner</a>
                                      
            </div>
        </div>--%>
        <div class="card">
            <asp:HiddenField runat="server" ID="Hidpassword"/>
            <div class="tab-content card-body">
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                    <asp:GridView ID="UserGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" OnRowDeleting="UserGridView_RowDeleting" OnPageIndexChanging="UserGridView_PageIndexChanging" OnRowCommand="UserGridView_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="id" />
                                                  
                            <asp:TemplateField HeaderText="Name">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created by">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lblcreatdby" runat="server" Text='<%# Bind("createdby") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Institution" >  
                                <ItemTemplate>
                                     <asp:Label ID="lbluniversity" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblrolename" runat="server" Text='<%# Bind("rolename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="email">                                                           
                                <ItemTemplate>
                                    <asp:Label ID="lblemail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resend"> 
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkResend" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="resend" Text="Resend Passkey" OnClientClick='<%# Eval("id","return ConfirmOnResend({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Delete" Text="Delete" OnClientClick='<%# Eval("id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
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
            $('#assessmentroles_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#rolemaster').addClass('active');
        });
        
    </script>
</asp:Content>