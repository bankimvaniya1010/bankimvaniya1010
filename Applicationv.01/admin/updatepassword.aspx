<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updatepassword.aspx.cs" Inherits="admin_updatepassword" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item active">CHANGE MY PASSWORD

            </li>
        </ol>
        <h1 class="h2">CHANGE MY PASSWORD

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">


                           
                             <div class="list-group-item" id="exsistingpassword" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-password">
                                    <div class="form-row">
                                        <label id="lblexsistingpassword" runat="server" for="exsistingpassword" class="col-md-3 col-form-label form-label">ENTER YOUR OLD PASSWORD</label>
                                        <div class="col-md-6">
                                            <input id="txtexsistingpassword" runat="server" type="password" class="form-control">                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="password" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-password">
                                    <div class="form-row">
                                        <label id="lblpassword" runat="server" for="password" class="col-md-3 col-form-label form-label">Enter YOUR New Password</label>
                                        <div class="col-md-6">
                                            <input id="txtpassword"  runat="server" type="password" class="form-control">                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="confirmpassword" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-confirmpassword">
                                    <div class="form-row">
                                        <label id="lblconfirmpassword" runat="server" for="confirmpassword" class="col-md-3 col-form-label form-label">RE-Enter YOUR New Password</label>
                                        <div class="col-md-6">
                                            <input id="txtconfirmpassword" runat="server" type="password" class="form-control">                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">                                        
                                        <asp:Button ID="btnupdatepassword" runat="server" Text="Save" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btnupdatepassword_Click"/>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblErrorMessage" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
 <script>
    
     function validateForm() {          
            var flag = false;
            if ($("#<%=txtpassword.ClientID%>").val() == "")
                alert("Please enter new password");
            else if ($("#<%=txtconfirmpassword.ClientID%>").val() == "")
                alert("Please enter confirm password");
            else if ($("#<%=txtpassword.ClientID%>").val() != "" && ($("#<%=txtpassword.ClientID%>").val() != $("#<%=txtconfirmpassword.ClientID%>").val()))
                alert("Password and confirm password should be same");
            else
                flag = true;
            return flag;
     }
      $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#manageprofile_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#manageprofile').addClass('active');
          });

 </script> 

</asp:Content>
