<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registered_applicantlist.aspx.cs" Inherits="admin_registered_applicantlist" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>   
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
        
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">List of Registered Applicants</li>
        </ol>
        <h1 class="h2">List of Registered Applicants</h1>

        <div class="card">            
            <div class="tab-content card-body">
                
                   <asp:Button runat="server" ID="downloadbtn" Text ="Download List" OnClick="downloadbtn_Click" CssClass="btn btn-success" Visible="true"/>
                <div>
                    <div class="list-group-item" id="Div4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label4" for="title" class="" style="font-weight: 500;">SUBSCRIBED REGISTRATIONS: </label>
                                        <div class="col-md-6">                                            
                                            <label runat="server" id="lbltotal"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <div class="list-group-item" id="Div1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="label1" for="title" class="" style="font-weight: 500;">AVAILABLE REGISTRATIONS: </label>
                                        <div class="col-md-6">                                            
                                             <label runat="server" id="lblavailable"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                <div>
             <%--       
              <table class="table" style="display:none">
                    <tr>
                        <th>Applicant ID</th>
                        <th>First Name</th>
                        <th>Family Name</th>
                        <th>Email</th>
                        <th>Class</th>
                        <th>Group</th>
                        <th>Subject</th>
                        <th>Mobile</th>
                        <th>Enrollment Date</th>
                        <th>Country of Residence</th>
                        <th>Status</th>
                        <th>Approve Status</th>
                        <th>Approve Action</th>
                        <th>Suspend Action</th>
                    </tr>
                    <%if (applicant.Count > 0)
                            {
                                for (int i = 0; i <= applicant.Count; i++)
                                { %>
                    <tr>
                        <th>
                            <span><%=applicant[i].applicantid %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].firstname %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].lastname %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].email %></span>
                        </th>
                        <th>
                             <span><%=applicant[i].classname %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].groupname %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].Subjects %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].mobile %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].registereDate %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].countryofresidence %></span>
                        </th>
                         <th>
                             <span><%=applicant[i].Status %></span>
                        </th>
                          <th>
                             <span><%=applicant[i].approve %></span>
                        </th>
                        <th>
                             <span>
                                 <asp:LinkButton ID="lnkapprove" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Verify" Text="Verify Applicant" OnClientClick='<%# Eval("applicantid","return ConfirmOnVerify({0})") %>'></asp:LinkButton>
                             </span>
                        </th>
                          <th>
                             <span>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Verify" Text="Verify Applicant" OnClientClick='<%# Eval("applicantid","return ConfirmOnVerify({0})") %>'></asp:LinkButton>
                             </span>
                        </th>
                    </tr>
                    <%}
                            } %>
                </table>--%>
                </div>
                 <div class="tab-content card-body">
               <div class="table-responsive" style="white-space: nowrap">
                    <asp:GridView ID="UserGridView" CssClass="table" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="id"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowCancelingEdit="UserGridView_RowCancelingEdit" OnRowEditing="UserGridView_RowEditing" OnRowUpdating="UserGridView_RowUpdating" OnRowDeleting="UserGridView_RowDeleting" OnPageIndexChanging="UserGridView_PageIndexChanging" OnRowCommand="UserGridView_RowCommand" OnRowDataBound="UserGridView_RowDataBound" OnRowCreated="UserGridView_RowCreated">

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Applicant ID" InsertVisible="False"
                                ReadOnly="True" />
                                                  
                            <asp:TemplateField HeaderText="University Name">                                                            
                                <ItemTemplate>
                                    <asp:Label ID="lbltype" runat="server" Text='<%# Bind("university_name") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Subjects" >  
                                <ItemTemplate>
                                     <asp:Label ID="lblSubjects" runat="server" Text='<%# Bind("Subjects") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField HeaderText="Approve Status"> 
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("approve") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Approve Action"> 
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkapprove" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Verify" Text="Verify Applicant" OnClientClick='<%# Eval("applicantid","return ConfirmOnVerify({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Suspend Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Delete" Text="Delete/Suspend" OnClientClick='<%# Eval("applicantid","return ConfirmOnDelete({0})") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("applicantid")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
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

