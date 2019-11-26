<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forgetpassword" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Signup</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="assets/vendor/perfect-scrollbar.css" rel="stylesheet">

    <!-- Material Design Icons -->
    <link type="text/css" href="assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="assets/css/fontawesome.rtl.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="assets/css/app.rtl.css" rel="stylesheet">





</head>

<body class="login">

    <form runat="server">
    <div class="d-flex align-items-center" style="min-height: 100vh">
        <div class="col-sm-8 col-md-6 col-lg-4 mx-auto" style="min-width: 300px;">            
            <div class="card navbar-shadow">
                <div class="card-header text-center">
                    <div class="frnd-hdr logo-img">
                        <img src="<%=logourl %>" class="logo-img"/>
                    </div>
                    <h4 class="card-title">Forgot Password?</h4>
                    <p class="card-subtitle">Recover your account password</p>
                </div>
                <div class="card-body">

                    <div class="alert alert-light border-1 border-left-3 border-left-primary d-flex" role="alert" id="divalert" runat="server" visible="false">
                        <i class="material-icons text-success mr-3">check_circle</i>
                        <div class="text-body">An email with password reset instructions has been sent to your email address, if it exists on our system.</div>
                    </div>

                    <form action="default.aspx" novalidate method="get">
                        <div class="form-group">
                            <label class="form-label" for="email">Email address:</label>
                            <div class="input-group input-group-merge">
                                <input id="email" type="email" runat="server" required="" class="form-control form-control-prepended" placeholder="Your email address">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <span class="far fa-envelope"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="btn_login" runat="server" Text="Send Password" CssClass="btn btn-primary btn-block" OnClick="btn_login_Click"  />
                         <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                    </form>
                </div>
                <div class="card-footer text-center text-black-50">Remember your password? <a href="login.aspx">Login</a></div>
            </div>
        </div>
    </div>
    </form>

    <!-- jQuery -->
    <script src="assets/vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/vendor/popper.min.js"></script>
    <script src="assets/vendor/bootstrap.min.js"></script>

    <!-- Perfect Scrollbar -->
    <script src="assets/vendor/perfect-scrollbar.min.js"></script>

    <!-- MDK -->
    <script src="assets/vendor/dom-factory.js"></script>
    <script src="assets/vendor/material-design-kit.js"></script>

    <!-- App JS -->
    <script src="assets/js/app.js"></script>

    <!-- Highlight.js -->
    <script src="assets/js/hljs.js"></script>

    <!-- App Settings (safe to remove) -->
    <script src="assets/js/app-settings.js"></script>





</body>

</html>