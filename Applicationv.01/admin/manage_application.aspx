<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_application.aspx.cs" Inherits="admin_manage_application" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>   
    <style type="text/css">
    
    </style>
     <script type="text/javascript">
         
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
         }
          function ConfirmOnVerify(item) {
            if (confirm("Are you sure to verify: " + item + "?") == true)
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
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item active">Manage Application</li>
            
        </ol>
        <h1 class="h2">Manage Application

        </h1>

        <div class="card" style="margin-top:-20px;">            
            <div class="tab-content card-body" style=" margin-left: -35px;">
               
                 <div class="tab-content card-body">
               <div class="table-responsive" style="white-space: nowrap">
                    <asp:HiddenField runat="server" ID="Hidpassword"/>                    

                    <asp:GridView ID="UserGridView" CssClass="table  table-striped" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="9"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="UserGridView_PageIndexChanging">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="AID" InsertVisible="False"
                                ReadOnly="True" ControlStyle-CssClass="tblregist" Visible="false"/>

                             <asp:TemplateField HeaderText="RecordID"> 
                                <ItemTemplate>
                                   <u><a href="<%# Eval("ManageApplicantion_Link ") %>" target="_blank">
                                        <asp:Label ID="Label51" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </a></u>                          
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Status"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label52" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Status"> 
                                <ItemTemplate>
                                      <u><a href="<%# Eval("ProcessPayment_Link") %>" target="_blank">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Payment_Status") %>'></asp:Label>
                                    </a></u>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SID"> 
                                <ItemTemplate>
                                    <u><a href="<%# Eval("ManageApplicant_Link") %>" target="_blank">
                                        <asp:Label ID="Label" runat="server" Text='<%# Bind("applicantid") %>'></asp:Label>
                                    </a></u>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student Name"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label53" runat="server" Text='<%# Bind("applicantname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="CID"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label54" runat="server" Text='<%# Bind("coursename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label56" runat="server" Text='<%# Bind("coursename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Institution"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label57" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Campus"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label58" runat="server" Text='<%# Bind("campusname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Application Date & Time"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label59" runat="server" Text='<%# Bind("dateofapplication") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                        </div>
                </div>
                     
                </div>
        </div>

    </div>
    <script>
       
       
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantion').addClass('active');

        });
    </script>

</asp:Content>

