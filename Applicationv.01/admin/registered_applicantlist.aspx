<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registered_applicantlist.aspx.cs" Inherits="admin_registered_applicantlist" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item active">USER REGISTRATIONS</li>
            
        </ol>
        <h1 class="h2">USER REGISTRATIONS

        </h1>

        <div class="card" style="margin-top:-20px;">            
            <div class="tab-content card-body" style=" margin-left: -35px;">
                <div style="margin-top: -19px; margin-bottom: -25px;">
                    <table>
                        <tr>
                            <td><span runat="server" id="label4" style="margin-left: 33px;"><b>Number of Purchased Registration :</b></span>
                                <%--<asp:TextBox runat="server" CssClass="form-control" Enabled="false" ID="lbl1"/>--%>
                                <span style="font-weight: 800; font-size: larger;"><%=lbltotal %></span>
                            <br/>
                                <span runat="server" id="label1" style="margin-left: 5%;margin-left: 31px;"><b>Number of Available Registration : </b></span>
                                <%--<asp:TextBox runat="server" CssClass="form-control" Enabled="false" ID="lbl2"/>--%>
                                <span style="font-weight: 800; font-size: larger;"><%=lblavailable %></span>
                            
                            </td>
                            
                           
                            <td>
                                <span style="margin-left: 500px;">
                                    <asp:Button runat="server" ID="downloadbtn" Text="Download List" OnClick="downloadbtn_Click" CssClass="btn btn-success" Visible="true" />
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                             <td>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlfilter" Style="width: 240px;margin-left: 33px;">
                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                    <asp:ListItem Value="1">By AID</asp:ListItem>
                                    <asp:ListItem Value="2">By First Name</asp:ListItem>
                                    <asp:ListItem Value="3">By Country</asp:ListItem>

                                </asp:DropDownList><br />
                            </td>
                            <td>
                                <div id="DivddlAID" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlapplicant" OnSelectedIndexChanged="ddlapplicant_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="DivddlName" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlfirstname" OnSelectedIndexChanged="ddlfirstname_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                                <div id="DivddlCountry" runat="server">
                                    <asp:DropDownList runat="server" ID="ddlcountry" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" Style="width: 240px; margin-top: -20px;"></asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
             
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
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" OnRowDeleting="UserGridView_RowDeleting" OnPageIndexChanging="UserGridView_PageIndexChanging" OnRowCommand="UserGridView_RowCommand" OnRowDataBound="UserGridView_RowDataBound" OnRowCreated="UserGridView_RowCreated">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="AID" InsertVisible="False"
                                ReadOnly="True" ControlStyle-CssClass="tblregist" Visible="false"/>

                             <asp:TemplateField HeaderText="AID"> 
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkmagae" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Manage" Text='<%#Bind("applicantid") %>'></asp:LinkButton>
                                                                    <asp:Label ID="lblaid" runat="server" Text='<%#Bind("applicantid") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="OTP"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblapplicantid" runat="server" Text='<%#Bind("applicantid") %>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="lnkResend" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="resend" Text="Resend" OnClientClick='<%# Eval("applicantid","return ConfirmOnResend({0})") %>'></asp:LinkButton>
                                    <asp:Label ID="Label7" runat="server" Text="Reset Done"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action"> 
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkapprove" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Verify" Text="Verify Applicant" OnClientClick='<%# Eval("applicantid","return ConfirmOnVerify({0})") %>'></asp:LinkButton>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("approve") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Suspend">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Delete" Text="Suspend" OnClientClick='<%# Eval("applicantid","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student Name"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblapplicantid1" runat="server" Text='<%# Bind("fullname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Label ID="lblemail" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblrolename" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Class" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblclassname" runat="server" Text='<%# Bind("classname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Group" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblgroupname" runat="server" Text='<%# Bind("groupname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="StudentID" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblstudentID" runat="server" Text='<%# Bind("studentID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField HeaderText="Registration Date & Time"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("registereDate") %>'></asp:Label>
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
       
         $("#<%=ddlfilter.ClientID%>").change(function () {
             var filterid = $("#<%=ddlfilter.ClientID%>").val();
             if (filterid == 1) {
                 $("#<%=DivddlAID.ClientID%>").show();                 
                 $("#<%=DivddlName.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
             }
             else if (filterid == 2) {
                 $("#<%=DivddlName.ClientID%>").show();
                 $("#<%=DivddlAID.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
             }
             else if (filterid == 3) {
                 $("#<%=DivddlCountry.ClientID%>").show();
                  $("#<%=DivddlAID.ClientID%>").hide();
                 $("#<%=DivddlName.ClientID%>").hide();
             }
             else {
                 $("#<%=DivddlAID.ClientID%>").hide();
                 $("#<%=DivddlName.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
             }
            });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageregistration_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#registeredapplicants').addClass('active');

           var filterid = $("#<%=ddlfilter.ClientID%>").val();
             if (filterid == 1) {
                 $("#<%=DivddlAID.ClientID%>").show();
                 $("#<%=DivddlName.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
             }
             else if (filterid == 2) {
                 $("#<%=DivddlName.ClientID%>").show();
                 $("#<%=DivddlAID.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
             }
             else if (filterid == 3) {
                 $("#<%=DivddlCountry.ClientID%>").show();
                  $("#<%=DivddlAID.ClientID%>").hide();
                 $("#<%=DivddlName.ClientID%>").hide();
             }
             else {
                 $("#<%=DivddlAID.ClientID%>").hide();
                 $("#<%=DivddlName.ClientID%>").hide();
                 $("#<%=DivddlCountry.ClientID%>").hide();
             }
        });
    </script>

</asp:Content>

