﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html lang="en" dir="ltr">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/fontawesome.rtl.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.rtl.css" rel="stylesheet">
</head>
<body class="login">
    <!DOCTYPE html>
     <html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>

        <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
        <meta name="robots" content="noindex">

        <!-- Perfect Scrollbar -->
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/perfect-scrollbar.css" rel="stylesheet">

        <!-- Material Design Icons -->
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/material-icons.css" rel="stylesheet">
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/material-icons.rtl.css" rel="stylesheet">

        <!-- Font Awesome Icons -->
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/fontawesome.css" rel="stylesheet">
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/fontawesome.rtl.css" rel="stylesheet">

        <!-- App CSS -->
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.css" rel="stylesheet">
        <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/app.rtl.css" rel="stylesheet">
    </head>

    <body class="login">
        <div class="d-flex align-items-center" style="min-height: 100vh">
            <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">
                <div class="text-center mt-5 mb-1">
                    <div class="avatar avatar-lg">
                        <%--<img src="~/assets/images/logo/primary.svg" class="avatar-img rounded-circle" alt="LearnPlus" />--%>
                    </div>
                </div>
                <div class="d-flex justify-content-center mb-5 navbar-light">
                     <a class="navbar-brand m-0">THE <%=isfullservicethenlbl %></a>
                </div>
                <div class="card navbar-shadow">
                    <div class="card-header text-center">
                        <h4 class="card-title">Login</h4>
                        <p class="card-subtitle">Access your account</p>
                    </div>
                    <div class="card-body">


                        <form runat="server" id="formlogin">
                             <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                            <div class="form-group card-header text-center">
                                <div class="alert-danger">
                                    <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                                </div>
                            </div>
                        </asp:Panel>
                            <div class="form-group">
                                <label class="form-label" >User Name:</label>
                                <div class="input-group input-group-merge">
                                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control form-control-prepended" placeholder="Enter username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter user name" ControlToValidate="txtUser" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>



                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <span class="far"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="password">Your password:</label>
                                <div class="input-group input-group-merge">
                                    <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control form-control-prepended" placeholder="Enter password" TextMode="Password"></asp:TextBox>

                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <span class="far fa-key"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group ">
                                <asp:Button ID="btn_login" runat="server" Text="Log In" CssClass="btn btn-primary btn-block" OnClick="btn_login_Click" />
                                 <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </div>
                            <div class="text-center">
                                <a href="forgetpassword.aspx" class="text-black-70" style="text-decoration: underline;">Forgot Password?</a>
                            </div>
                        </form>
                    </div>                    
                </div>
            </div>
        </div>


        <!-- jQuery -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/jquery.min.js"></script>

        <!-- Bootstrap -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/popper.min.js"></script>
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/bootstrap.min.js"></script>

        <!-- Perfect Scrollbar -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/perfect-scrollbar.min.js"></script>

        <!-- MDK -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/dom-factory.js"></script>
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/vendor/material-design-kit.js"></script>

        <!-- App JS -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/app.js"></script>

        <!-- Highlight.js -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/hljs.js"></script>

        <!-- App Settings (safe to remove) -->
        <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/app-settings.js"></script>

    </body>
    </html>
</body>
</html>
