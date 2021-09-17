<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_manage_class_booking.aspx.cs" Inherits="admin_ec_manage_class_booking" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>   
    <style type="text/css">
    
    </style>
     <script type="text/javascript">
         
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to suspend record id : " + item + "?") == true)
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
            <li class="breadcrumb-item active">MANAGE CLASS BOOKING</li>
            
        </ol>
        <h1 class="h2">MANAGE CLASS BOOKING

        </h1>

        <div class="card" style="margin-top:-20px;">            
            <div class="tab-content card-body" style=" margin-left: -35px;">
                <div style="margin-top: -19px; margin-bottom: -25px;display:none;">
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

                            <asp:BoundField DataField="id" HeaderText="BID" InsertVisible="False"
                                ReadOnly="True" ControlStyle-CssClass="tblregist"/>
                            <asp:TemplateField HeaderText="Booking Status"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label> 
                                    <asp:LinkButton ID="lnkSuspend" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="Suspend" Text=" | Suspend" OnClientClick='<%# Eval("id","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="SID"> 
                                <ItemTemplate>
                                    <a href='<%# Eval("classcode_link") %>' runat="server" target="_blank"> <%# Eval("applicantid") %></a>
                                    <asp:LinkButton ID="lnkmagae" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Manage" Text='<%#Bind("applicantid") %>' Visible="false"></asp:LinkButton>
                                                                    <asp:Label ID="lblaid" runat="server" Text='<%#Bind("applicantid") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Student Name"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblapplicantid1" runat="server" Text='<%# Bind("fullname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Class Code"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblclasscode" runat="server" Text='<%# Bind("classcode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                           
                            <asp:TemplateField HeaderText="Grade">
                                <ItemTemplate>
                                    <asp:Label ID="lblgrade" runat="server" Text='<%# Bind("grade") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblsubject" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Mode"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblmode" runat="server" Text='<%# Bind("mode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Type"> 
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location"> 
                                <ItemTemplate>
                                    <asp:Label ID="lbllocation" runat="server" Text='<%# Bind("location") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Booking Date & Time"> 
                                <ItemTemplate>
                                    <asp:Label ID="lblbooking_datetime" runat="server" Text='<%# Bind("booking_datetime") %>'></asp:Label>
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
            $('#allserivce').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#classbooking').addClass('active');

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

