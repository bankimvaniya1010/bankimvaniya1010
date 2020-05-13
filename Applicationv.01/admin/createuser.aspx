<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createuser.aspx.cs" Inherits="createuser" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create New User</li>
        </ol>
        <h1 class="h2">Create New User </h1>

        <div class="card">


            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">


                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtName" type="text" runat="server" class="form-control" placeholder=" Name">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">User Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtUsername" type="text" runat="server" class="form-control" placeholder=" User Name">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Email</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtEmail" type="text" runat="server" class="form-control" placeholder="Email">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Mobile</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="TxtMobile" type="text" runat="server" class="form-control" placeholder="Mobile">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Password</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="Txtpassword" type="text" runat="server" class="form-control" placeholder="Password">
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Role</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server">
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_login" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" OnClientClick="return validateForm();"/>
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>


            </div>
        </div>

    </div>
    <script>
		$(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#role_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createuser').addClass('active');
        });

        function validateForm()
        {
            var mode = '<%=pagemode %>';
            var name = $('#<%=txtName.ClientID%>').val();
            var username = $('#<%=txtUsername.ClientID%>').val();
            var email = $('#<%=txtEmail.ClientID%>').val();
            var mobile = $('#<%=TxtMobile.ClientID%>').val();
            var password = $('#<%=Txtpassword.ClientID%>').val();
            var role = $('#<%=ddlRole.ClientID%>').val();

            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;

            if (name == '') {
                alert("Please enter name");
                return false;
            }
            else if (username == '') {
                alert("Please enter user name");
                return false;
            }
            else if (email == '' || !emailRegex.test(email)) {
                alert("Please enter valid user email Id");
                return false;
            }
            else if (mobile == '') {
                alert("Please enter user mobile number");
                return false;
            }
            else if (mode == 'new' && password == '') {
                alert("Please enter user password");
                return false;
            }
            else if (role == 0) {
                alert("Please select Role of user");
                return false;
            }
            return true;
        }
	</script>
</asp:Content>

