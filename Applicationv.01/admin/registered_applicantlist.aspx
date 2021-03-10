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
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">List of Registered Applicants</li>
            
        </ol>
        

        <div class="card" style="margin-top:-20px;">            
            <div class="tab-content card-body" style=" margin-left: -35px;">
                <div style="margin-top: -19px; margin-bottom: -25px;">
                    <ul  style="list-style-type:none">
                        <li>
                            <span runat="server" id="label4"><b>SUBSCRIBED REGISTRATIONS:</b> <label runat="server" id="lbltotal" style="font-weight: 800;font-size: larger;"></label> </span>
                            <span runat="server" id="label1" style=" margin-left: 5%;"><b>AVAILABLE REGISTRATIONS: </b><label runat="server" id="lblavailable" style="font-weight: 800;font-size: larger;"></label> </span>
                             <span style="margin-left: 100px;"><asp:Button runat="server" ID="downloadbtn" Text ="Download List" OnClick="downloadbtn_Click" CssClass="btn btn-success" Visible="true"/> </span>
                        </li>                       
                        </ul>
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
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" OnRowDeleting="UserGridView_RowDeleting" OnPageIndexChanging="UserGridView_PageIndexChanging" OnRowCommand="UserGridView_RowCommand" OnRowDataBound="UserGridView_RowDataBound" OnRowCreated="UserGridView_RowCreated" OnRowUpdated="UserGridView_RowUpdated">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="AID" InsertVisible="False"
                                ReadOnly="True" ControlStyle-CssClass="tblregist" />
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
                             <asp:TemplateField HeaderText="First Name">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lblcreatdby" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Family Name" >  
                                <ItemTemplate>
                                     <asp:Label ID="lbluniversity" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblrolename" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="University Name">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("university_name") %>'></asp:Label>
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
                            <%--<asp:TemplateField HeaderText="Subjects" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblSubjects" runat="server" Text='<%# Bind("Subjects") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                             <asp:TemplateField HeaderText="StudentID" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblstudentID" runat="server" Text='<%# Bind("studentID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">                                                           
                                <ItemTemplate>
                                    <asp:Label ID="lblemail" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Enrollment Date"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("registereDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Country of Residence"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("countryofresidence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
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
            $('#manageregistration_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#registeredapplicants').addClass('active');
        });
    </script>

</asp:Content>

